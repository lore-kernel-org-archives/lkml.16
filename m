Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3EA1885A1;
	Sat, 12 Apr 2025 17:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744480265; cv=none; b=rIKb2qJZ8YIbYXuwka2+U9FG994USMkYsk7NISzXXCdjhYviviqFghZUjJDPcx5mVhd9HFK+tympNJcQQPEq/Jio2lAa9O23ptPAaDJ3WCpivVXOz0u27qLs03zUrWxVx7FtRm/07IRBDfTFSkMN8btZqAIXSoAh/rT70ildLU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744480265; c=relaxed/simple;
	bh=TagZ0zYvwJ13raGmBK79thcRSiS9AqEKrO4KwU9hXwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luM6Pi/xLqiwJFY1xfDGe19YjwJxgz1Q7sO9Cg4wPxZtN5b93+xiFn2GY1umVI2bUVqR9/tFmBDTvTIKT6jburMA/Pxdhp1afGKQ2BRB6pMcfbQV8D7kgrcqtbzMtoAWprhHqcVIyQ3H9mia+Bb/irtYWg7gO8yYuUEmlZ7UQF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTqhljt3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iTqhljt3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8CEC4CEE3;
	Sat, 12 Apr 2025 17:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744480264;
	bh=TagZ0zYvwJ13raGmBK79thcRSiS9AqEKrO4KwU9hXwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iTqhljt3uPGXOeeokGvoiePR+ULT/F/3X/m+FFA8bnGCvHHgn1lA86i5BCPVlTue9
	 Lg8uCC4kUbFvrXYIyu+4OVIeTLuR58HAIuTLiLcr39nOf8n8/SmfLUi2y6ZowcVpUI
	 MC45dp6RnmgWOe36zHHuNMUhhpftX+9ShMiOJKEYOirhtwQm3i8AJ/0c8UuG9zVRPQ
	 +Gxz6jQka4/gc4k+c17o2pILuWGPlyIvlqFvUVO61/wbGE4Dr8bqMGk42DVUr/Txe3
	 CnFR5sXe+eG9zSNkjbun7sQ2JGWSbNSJ51i9Sb13getv+rIldGbjcJQBklc5Nfq+Vg
	 mRsKOkC/lr8BQ==
Date: Sat, 12 Apr 2025 12:51:03 -0500
From: Rob Herring <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: rockchip,inno-usb2phy: add port
 property
Message-ID: <20250412175103.GA1366427-robh@kernel.org>
References: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
 <20250407-rk3576-sige5-usb-v1-1-67eec166f82f@collabora.com>
 <20250410211123.GA1071510-robh@kernel.org>
 <6743970.MhkbZ0Pkbq@workhorse>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6743970.MhkbZ0Pkbq@workhorse>

On Fri, Apr 11, 2025 at 04:31:38PM +0200, Nicolas Frattaroli wrote:
> On Thursday, 10 April 2025 23:11:23 Central European Summer Time Rob Herring wrote:
> > On Mon, Apr 07, 2025 at 08:09:14PM +0200, Nicolas Frattaroli wrote:
> > > USB connectors like to have OF graph connections to high-speed related
> > > nodes to do various things. In the case of the RK3576, we can make use
> > > of a port in the usb2 PHY to detect whether the OTG controller is
> > > connected to a type C port and apply some special behaviour accordingly.
> > > 
> > > The usefulness of having different bits of a fully functioning USB stack
> > > point to each other is more general though, and not constrained to
> > > RK3576 at all, even for this use-case.
> > > 
> > > Add a port property to the binding.
> > > 
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> > > index 6a7ef556414cebad63c10de754778f84fd4486ee..3a662bfc353250a8ad9386ebb5575d1e84c1b5ba 100644
> > > --- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> > > @@ -78,6 +78,11 @@ properties:
> > >        When set the driver will request its phandle as one companion-grf
> > >        for some special SoCs (e.g rv1108).
> > >  
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/properties/port
> > > +    description:
> > > +      A port node to link the PHY to a USB connector's "high-speed" port.
> > 
> > I don't think this is correct. The HS port of the connector goes to the 
> > controller. The controller has the link to the phy.
> > 
> > If the PHY is also what handles USB-C muxing or orientation switching, 
> > then it might have ports, but then it needs input and output ports.
> > 
> > Rob
> > 
> 
> Hi Rob,
> 
> thank you for the quick response.
> 
> I've feared this would be the case, but chose to go ahead with this solution
> anyway because I'm not super stoked about the alternatives I can think of. The
> problem is that I need to go from the USB PHY node to the USB connector somehow,
> but there's no way I can see to get from the PHY node to the USB2 controller
> it's connected to, unless I'm missing something obvious.
> 
> So I see two alternatives:
> 1. Extend the usb connector binding to add additional ports for PHYs that handle
>    vbus detection or something, then extend either the inno2 binding or a more
>    general usb PHY binding to add that port definition.
> 2. Revert to what the downstream vendor kernel does and simply add a boolean
>    flag property to the inno usb2phy binding that tells it whether it's
>    connected to a USB-C port and should therefore expect vbusdet to remain high.
> 
> Let me know if there's any better alternatives I missed. If there's some OF
> driver function to enumerate all controllers a PHY is referenced by, then that
> would probably work as well, allowing me to just point the HS port to the
> controller instead as intended.

The building blocks are there. You can iterate over nodes with 'phys' 
with for_each_node_with_property(), then on each entry in 'phys' check 
if it matches your node. Then you need to iterate over the ports to 
check for connection to usb-c-connector. 
of_graph_get_remote_port_parent() will help you there. Not terribly 
efficient, but you're only doing it once.

Another option is extend phy modes to distinguish USB-C or not. Then you 
can set the mode either with the 'phy-mode' property or in phy cells. 
Though if you have to add a cell, that's an ABI change (not sure if the 
existing kernel would accept another cell).

I rather see the kernel use the information that's already there rather 
than have 2 sources of information.

Rob
