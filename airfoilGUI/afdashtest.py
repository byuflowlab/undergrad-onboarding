import dash
from dash.dependencies import Output, Input
import dash_core_components as dcc
import dash_html_components as html
import plotly
import plotly.graph_objs as go
import numpy as np

app = dash.Dash(__name__) #initialize the app
#setup the app layout
app.layout = html.Div(
    [
        #make graph object
        dcc.Graph(style={'height': '500px','width':'700px'}, id='live-airfoil'),
        #NACA label object
        html.Div(id='nacalabel'),
        #max camber slider label object
        html.Div(id='maxcamberlabel'),
        #max camber slider object
        html.Div(dcc.Slider(
        id='maxcamber',
        min=-5,
        max=25,
        marks={
        -5: '-5',
        25: '25% chord'},
        value=2,
        step=0.1,
        ),
        style={'height': '50px', 'width': '350px'}),
        #camber slider label object
        html.Div(id='camberloclabel'),
        #Camber location slider object
        html.Div(dcc.Slider(
        id='camberloc',
        min=0,
        max=9.9,
        marks={
        0: '0',
        9.9: '99% chord'},
        value=4,
        step=0.1,
        ),
        style={'height': '50px', 'width': '350px'}),
        #max thickness label object
        html.Div(id='maxthicklabel'),
        #max thickness slider object
        html.Div(dcc.Slider(
        id='maxthickness',
        min=0,
        max=100,
        marks={0: '0',
        100: '100% chord'},
        value=12,
        step=0.1,
        ),
        style={'height': '50px', 'width': '350px'}),
    ]
)

#Define some functions for plotting airfoils
def xspacing(nx=100):
    '''
    x/c - cosine spacing
    '''
    x = 0.5*(1-np.cos(np.pi/(nx-1)*np.arange(0, nx)))

    return x

def naca(mc=0, cl=0, mt=12):

    x = xspacing()
    # normalize inputs
    m = mc/100.0
    p = cl/10.0
    tc = mt/100.0

    # thickness
    tau = 5*tc*(0.2969*np.sqrt(x) - 0.1260*x - 0.3516*x**2 + 0.2843*x**3 - 0.1015*x**4)

    # camber (normal to chord)
    if np.iscomplexobj([m, p, tc]):
        zc = np.zeros_like(x, dtype="complex")
    else:
        zc = np.zeros_like(x)

    if p != 0:
        idx = np.argwhere(x <= np.real(p))
        zc[idx] = m/p**2*(2*p*x[idx] - x[idx]**2)
        idx = np.argwhere(x > np.real(p))
        zc[idx] = m/(1-p)**2*(1-2*p + 2*p*x[idx] - x[idx]**2)

    # upper and lower surface
    zu = zc + tau
    zl = zc - tau
    xx = np.r_[x[::-1], x[0:]]
    zz = np.r_[zu[::-1], zl[0:]]

    return xx, zz

#Set a callback for the sliders that updates the graph
@app.callback(Output('live-airfoil', 'figure'),
              [Input(component_id='maxcamber', component_property='value'),
              Input(component_id='camberloc', component_property='value'),
              Input(component_id='maxthickness', component_property='value')])
#The inputs to this function are in order of the inputs listed in the callback
#This funciton updates the graph
def update_graph(mc,cl,mt):
    xx,zz = naca(mc, cl, mt)
    data = plotly.graph_objs.Scatter(
            x=xx,
            y=zz,
            name='airfoil',
            mode= 'lines'
            )
    #return a Plotly graph object
    return {'data': [data],'layout' : go.Layout(xaxis=dict(range=[-0.05,1.05],
                                                            dtick=0.1),
                                                yaxis=dict(dtick=0.1,
                                                            scaleanchor="x",
                                                            scaleratio=1)
                                                )}

#Max Camber Label
@app.callback(Output('maxcamberlabel', 'children'),
            [Input('maxcamber','value')])
def label_camber(value):
    return 'Max Camber = {}'.format(value) + '% chord'

#Max Camber Location Label
@app.callback(Output('camberloclabel', 'children'),
            [Input('camberloc','value')])
def label_camberloc(value):
    return 'Max Camber Location = {}'.format(value*10)  + '% chord'

#Max Thickness Label
@app.callback(Output('maxthicklabel', 'children'),
            [Input('maxthickness','value')])
def label_thickness(value):
    return 'Max Thickness = {}'.format(value)  + '% chord'

#NACA Label
@app.callback(Output('nacalabel', 'children'),
              [Input(component_id='maxcamber', component_property='value'),
              Input(component_id='camberloc', component_property='value'),
              Input(component_id='maxthickness', component_property='value')])
def naca_label(mc, cl, mt):
    if int(mc)/mc == 1 and int(cl)/cl == 1 and int(mt)/mt == 1:
        return 'NACA '+str(mc)+str(cl)+str(mt)
    else:
        return ''


#This runs the app
if __name__ == '__main__':
    app.run_server(debug=True)