import Foundation

public protocol ForeFlightPluginProtocol : CustomStringConvertible {

}

public protocol PluginManagerProtocol {
    func register(plugin: ForeFlightPluginProtocol.Type)
    func activePlugins() -> [ForeFlightPluginProtocol]
}

public protocol MapLayerProtocol: ForeFlightPluginProtocol {
    init(pluginManager: MapPluginManager)
}

public class MapPluginManager : PluginManagerProtocol {
    var mapLayerPlugins = [MapLayerProtocol]()
    
    public required init() {
        
    }
    
    public func register(plugin: ForeFlightPluginProtocol.Type) {
        if let mapLayerPlugin = plugin as? MapLayerProtocol.Type {
            let pluginInstance = mapLayerPlugin.init(pluginManager: self)
            mapLayerPlugins.append(pluginInstance)
        }
    }
    
    public func activePlugins() -> [ForeFlightPluginProtocol] {
        return mapLayerPlugins.map { $0 as ForeFlightPluginProtocol }
    }
}

public class AirspaceLayer: MapLayerProtocol, CustomStringConvertible {
    public required init(pluginManager: MapPluginManager) {
        
    }

    public var description: String {
        get {
            return "Airspace Layer"
        }
    }
    
    public func update() {
        print(__FUNCTION__)
    }

}