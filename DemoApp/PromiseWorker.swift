//
//  PromiseWorker.swift
//  DemoApp
//
//  Created by Jose Carreno on 6/13/19.
//  Copyright © 2019 Jose Carreno. All rights reserved.
//

import Foundation
import PromiseKit

class PromiseWorker {
    
    let productos = [Producto(id: 1, descripcion: "Arroz"),
                     Producto(id: 2, descripcion: "Mantequilla"),
                     Producto(id: 3, descripcion: "Queso")]
    
    let categorias = [Categoria(id: 1, descripcion: "Abarrotes"),
                      Categoria(id: 2, descripcion: "Verduras"),
                      Categoria(id: 3, descripcion: "Carnes")]
    
    func recuperarProductos(completion: @escaping ([Producto]) -> Void) {
        DispatchQueue.global(qos: .background).async {
            sleep(1)
            completion(self.productos)
        }
    }
    
    func recuperarCategorias(completion: @escaping ([Categoria]) -> Void) {
        DispatchQueue.global(qos: .background).async {
            sleep(2)
            completion(self.categorias)
        }
    }
    
    func recuperarProductos() -> Guarantee<[Producto]> {
        return Guarantee(resolver: recuperarProductos)
    }
    
    func recuperarCategorias() -> Guarantee<[Categoria]> {
        return Guarantee(resolver: recuperarCategorias)
    }
    
    struct Producto {
        let id: Int
        let descripcion: String
        var categoria: Categoria!
        
        init(id: Int, descripcion: String) {
            self.id = id
            self.descripcion = descripcion
        }
    }
    
    struct Categoria {
        let id: Int
        let descripcion: String
    }
}
