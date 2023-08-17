/**
 libDummy.swift
 
 Year of creation: 2023
 Original authors: Stefan Springer & staff (http://stefanspringer.com)
 
 © Stefan Springer, 2023
 
 Please contact Stefan Springer (http://stefanspringer.com) for more information.
 */

import Foundation
import Workflow
import SwiftXML
import Utilities

public func dummy_step(during execution: Execution, forSource source: URL) {
    execution.effectuate("\(#function)@\(#file)") {
        
        let document: XDocument
        do {
            document = try parseXML(fromURL: source)
        } catch {
            execution.log(Message(id: "could not read document", type: .Fatal, fact: [
                .en: "could not read document [\(source.osPath)]: \(error.localizedDescription)"
            ]))
            return
        }
        
        document.echo(pretty: true, terminator: "\n")
    }
}
