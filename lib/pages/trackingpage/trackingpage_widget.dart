import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:text_search/text_search.dart';
import 'trackingpage_model.dart';
export 'trackingpage_model.dart';

class TrackingpageWidget extends StatefulWidget {
  const TrackingpageWidget({super.key});

  @override
  State<TrackingpageWidget> createState() => _TrackingpageWidgetState();
}

class _TrackingpageWidgetState extends State<TrackingpageWidget> {
  late TrackingpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackingpageModel());

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderRadius: 8.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  Icons.more_vert_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 3.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 1.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 4.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 280.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          'https://images.unsplash.com/photo-1518733057094-95b53143d2a7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMnx8aG90ZWx8ZW58MHx8fHwxNzA2NjI1OTAxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                        ).image,
                                      ),
                                    ),
                                    child: FlutterFlowGoogleMap(
                                      controller: _model.googleMapsController,
                                      onCameraIdle: (latLng) =>
                                          _model.googleMapsCenter = latLng,
                                      initialLocation:
                                          _model.googleMapsCenter ??=
                                              currentUserLocationValue!,
                                      markerColor: GoogleMarkerColor.violet,
                                      mapType: MapType.normal,
                                      style: GoogleMapStyle.standard,
                                      initialZoom: 14.0,
                                      allowInteraction: true,
                                      allowZoom: true,
                                      showZoomControls: true,
                                      showLocation: true,
                                      showCompass: false,
                                      showMapToolbar: false,
                                      showTraffic: false,
                                      centerMapOnMarkerTap: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Current location:',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              valueOrDefault<String>(
                                currentUserLocationValue?.toString(),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ].addToEnd(const SizedBox(height: 32.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 12.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    currentUserLocationValue = await getCurrentUserLocation(
                        defaultLocation: const LatLng(0.0, 0.0));
                    await queryUsersRecordOnce()
                        .then(
                          (records) => _model.simpleSearchResults = TextSearch(
                            records
                                .map(
                                  (record) => TextSearchItem.fromTerms(
                                      record, [record.displayName]),
                                )
                                .toList(),
                          )
                              .search(currentUserLocationValue!.toString())
                              .map((r) => r.object)
                              .toList(),
                        )
                        .onError((_, __) => _model.simpleSearchResults = [])
                        .whenComplete(() => setState(() {}));
                  },
                  text: 'get location',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
