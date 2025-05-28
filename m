Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E0C28C869;
	Wed, 28 May 2025 16:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451469; cv=none; b=b7LoB60aDwX29ma14M8TYPvH7e9SjBZbO8RhnCuVTVG3Op0clcMzR0Er/ieBIC1vNsb9gzci/2Z7j6IZ3rYb8NQYiUZoLshrCKMQYUvantg2iUsgNRurOpfqVc7ILJWMcYoOjNBqAqXKK8F+X28ovTIrEBjJC2hsm6m+PCA+VFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451469; c=relaxed/simple;
	bh=CO9PQMZ1/rQfe0pCydhFmsiF2GtQ/tAxGyGXacaISw4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GwlfmZTKebGM754arQnUgx3Xb20QGduPGJof22KKQo9mQIATvyJ8UiCCO/flIC5I1fYiURqTkdBJOfaj8b09aYYgTWk3MKXrvvbcyZccx75egQTkmRq0FkxL2HgIa6URkBi7dO24o07/j4nlU6zzYG0Y+jASsjWjJJoXgKqJ1/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=igodM4Xz; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="igodM4Xz"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7D95439D5;
	Wed, 28 May 2025 16:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748451464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7qaQHZ60xBlE7NEWWjxxUQHFcXa1x/XbhjHMB5ve/g0=;
	b=igodM4XzZXZASOMYIG0QVvbbfjFj4krC9kt5uZrnCHRMiYoLZnZ+pOcFzdyETTemg+OVUv
	lZi4923d1dQR1iMnys4rpOz/9eh9tn409obTaLLL8hUdqFPfss1CGfBeZTGmuEhnupB9VI
	MF7mqUsgxfd1vV+hoBT7eYrqNefZt9GM1HpJYZv3LsrRXh79nLu6X0qSiihZ23R2Lpl+hy
	grQYsqqzLIZdM0fE49hx+M9ImIwHjvHwyfJnNwZ9tEDaArV88upp09yRPFzXQ7KIKQgmgp
	dWRebqSb/+hk5NiUcTumqggjj8FuwbqR2U9Yc7kIrc6FV4QIGI9Z83IBqv3Bow==
Date: Wed, 28 May 2025 18:57:40 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, Andrew Davis <afd@ti.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana
 Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 devicetree-compiler@vger.kernel.org, linux-kernel@vger.kernel.org, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: Add support for export-symbols node
Message-ID: <20250528185740.4bf91bef@bootlin.com>
In-Reply-To: <0770a47e-fd2f-4b6f-9a9a-b0d539ace30c@kernel.org>
References: <20250430125154.195498-1-herve.codina@bootlin.com>
	<20250430125154.195498-2-herve.codina@bootlin.com>
	<0770a47e-fd2f-4b6f-9a9a-b0d539ace30c@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeektdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhleegleetvedtteduheejiedulefggfdtvdelfeetleelhfelvefhteelteevffenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppedvrgdtudemvgdtrgemvdekheemsgelkedtmegvgedttgemiegtgeefmegshegssgemrgegvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvkeehmegsleektdemvgegtdgtmeeitgegfeemsgehsggsmegrgedvkedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdprhgtphhtthhopegrfhgus
 ehtihdrtghomhdprhgtphhtthhopegrhihushhhsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: herve.codina@bootlin.com

Hi Krzysztof,

Thanks a lot for your feedback!

On Tue, 27 May 2025 20:31:14 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 30/04/2025 14:51, Herve Codina wrote:
> > An export-symbols node allows to export symbols for symbols resolution
> > performed when applying a device tree overlay.
> > 
> > When a device tree overlay is applied on a node having an export-symbols
> > node, symbols listed in the export-symbols node are used to resolve
> > undefined symbols referenced from the overlay.  
> 
> 
> I have impression that this is being discussed in three places
> simultaneously - here, DT spec and DT schema. I don't know how to solve
> the multiplication, but I will keep answering here, because that's my part.
> 
> > 
> > This allows:
> >   - Referencing symbols from an device tree overlay without the need to
> >     know the full base board. Only the connector definition is needed.
> > 
> >   - Using the exact same overlay on several connectors available on a given
> >     board.
> > 
> > For instance, the following description is supported with the
> > export-symbols node:
> >  - Base device tree board A:
> >     ...
> >     foo_connector: connector1 {
> >         export-symbols {
> >            connector = <&foo_connector>;
> >         };
> >     };
> > 
> >     bar_connector: connector2 {
> >         export-symbols {
> >            connector = <&bar_connector>;
> >         };
> >     };
> >     ...  
> 
> And what would this mean? Which symbol is exported - foo or bar?

Symbols are exported only when an overlay is applied on the node where the
export-symbols node is available. Those symbols are visible only from the
overlay applied. Symbols exported thanks to export-symbols are not global
to the all device-tree (it is not __symbols__) but local to a node.

If an overlay is applied at connector1 node, it can use the 'connector'
symbols and thanks to export-symbols, the 'connector' symbol will be
resolved to foo_connector.

If the overlay is applied at connector2 node, the 'connector' symbol is then
resolved to bar_connector.

> 
> > 
> >  - Base device tree board B:
> >     ...
> >     front_connector: addon-connector {
> >         export-symbols {
> >            connector = <&front_connector>;
> >         };
> >     };  
> 
> <from my other reply in private>
> Another problem is that the board DTS should not care about overlays. It
> feels like breaking encapsulation and I cannot imagine now adding 1000
> export-symbols, because every i2c, spi, mikrobus or PCI slot could have
> an overlay applied.

The board DTS don't care about overlay itself.
It describes a connector where an overlay can be applied.

At this connector, several hardware resources are wired and need to be
referenced. The baord DTS offer a way for something else to reference
those resources.

The goal is to have a connector where it is allowed to apply an overlay
instead of exporting all possible symbols and allowing overlays to add
nodes anywhere.

> 
> You could argue that only few nodes will be exported like this, so only
> real mikrobus connectors. Then I will argue: look at aliases. People
> alias everything everywhere, not following the guidelines.

Those connector nodes have a compatible string and a binding.
The export-symbols will be part of the binding.

> 
> If we assume that such overlays are designed for specific boards, thus
> there will be only one or two exported symbols not 1000, then what is
> the benefit of export symbols comparing to referencing by full path?

The overlay is not "designed" for a specific board but for a "specific"
connector.
He described an add-on board connected to a specific connector, specific
in terms of pinout. I mean an I2C bus is available at connector pin 1 and 2,
a GPIO, is available at connector pin 3, an irq line is available at
connector pin 4, ...

Every board that offer this connector (pinout compatible) can have the
overlay applied to the connector.

Also a board can offer several connectors with same pinout and then an
add-on board compatible with this connector pinout can be plugged on each
connector. The overlay described the add-on board and should be the same
whatever if is is applied at connector A or connector B.
The exact same dtbo should work.

> </end from my other reply>
> 
> And with above assumption - such overlays designed per board - plus my
> first point about duplicated exports:
> connector = <&foo_connector>;
> connector = <&bar_connector>;
> 
> why not exporting the symbol with the same name? E.g.:
> 
>      foo_connector: connector1 {
>          export-symbols {
>             whatever-property-style = <&foo_connector>;
>          };
>      };
> 
> and overlay:
> 
>      node {
>          ...
>          connector = <&foo_connector>;
>          ...
>      };

With that, the overlay is designed for the board and not the connector.
The exact same overlay cannot be use on different connectors (pinout
compatible) available on one board. It cannot also be used on different
board which provide the exact same connector (pinout compatible).

> 
> Or even annotation?
> 
>      foo_connector: connector1 __exported_symbol__ {
>          ....
>      };
> 
> 
>      node {
>          ...
>          connector = <&foo_connector>;
>          ...
>      };

If you board has 2 connectors:

 foo_connector1: connector1 __exported_symbol__ {...};
 foo_connector2: connector2 __exported_symbol__ {...};

your overlay need to be specific. The overlay shouldn't depend on the board
is going to be applied. The only knowledge from the overlay point of view is
the connector.

> 
> ? This also answers my further question about DTS style (see at the bottom)
> 
> >     ...
> > 
> >  - Overlay describing an addon board the can be connected on connectors:
> >     ...
> >     node {
> >         ...
> >         connector = <&connector>;
> >         ...
> >     };
> >     ...
> > 
> > Thanks to the export-symbols node, the overlay can be applied on
> > connector1 or connector2 available on board A but also on
> > addon-connector available on board B.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Tested-by: Ayush Singh <ayush@beagleboard.org>  
> 
> I would argue you cannot test a binding, because testing here is part of
> a process, but what do I know...
> 
> 
> > ---
> >  .../devicetree/bindings/export-symbols.yaml   | 43 +++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/export-symbols.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/export-symbols.yaml b/Documentation/devicetree/bindings/export-symbols.yaml
> > new file mode 100644
> > index 000000000000..0e404eff8937
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/export-symbols.yaml
> > @@ -0,0 +1,43 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/export-symbols.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Export symbols
> > +
> > +maintainers:
> > +  - Herve Codina <herve.codina@bootlin.com>
> > +
> > +description: |
> > +  An export-symbols node allows to export symbols for symbols resolution
> > +  performed when applying a device tree overlay.
> > +
> > +  When a device tree overlay is applied on a node having an export-symbols
> > +  node, symbols listed in the export-symbols node are used to resolve undefined
> > +  symbols referenced from the overlay.
> > +
> > +properties:
> > +  $nodename:
> > +    const: export-symbols
> > +
> > +patternProperties:
> > +  "^[a-zA-Z_]?[a-zA-Z0-9_]*$":  
> 
> This messes up with coding style which I would prefer keep intact.
> Basically these properties will be using label style.

Yes, those properties remap phandles.

Their names are the name of the label used from the overlay and their
values are the phandle mapped.

You already have this kind properties using label style in __symbols__,
__fixups__, __local_fixups__ nodes.

Those node are globals to the dtb or the dtbo.

export-symbols node has a finer grain. It is a child of a specific node
describing a hardware connector and should be described in the binding.

> 
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      A symbol exported in the form <symbol_name>=<phandle>.
> > +
> > +additionalProperties: false
> > +  
> Best regards,
> Krzysztof

Again, thanks for your feedback.
I hope we could move forward on this export-symbols topic.

Best regards,
Hervé
