Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3061F3B96;
	Fri, 11 Apr 2025 14:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381935; cv=pass; b=Kp/0EYfp2DgniGxXF0h02+/ZPWDogHiufAEyABx7jtaIzWlQKkjO+8yLDcj8AKIL9gUw89nu8+uHs6j2D7dNWOqlYdgnSl1n/pleMXetplHme3SpahaHS07RxtoqPq+EKXSv6y047kszaOISz1aT9qFKo3j50I1/3Tr8q50Urt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381935; c=relaxed/simple;
	bh=81e5HuC4bZMqyw6bFcdLw7bwgA2g4vw89tLXfmpe53I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cqFTMyRhdiRfR+/Vw+4A4Yj4odbcXlpuMkczOxcZTkoQ4Abc6UuYxxbLn6Sz2BPwIyeaRKKg1yBaenLapp6aRQgLXp89N6FTA+8WGHSvnmYhCAZUGw4ClWZNlSQUlb+1YzXTaHOVR9t8O2mqVXq5x0SbEEnSnMkaMU4EIiEmLT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=LhZ8G4aH; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="LhZ8G4aH"
ARC-Seal: i=1; a=rsa-sha256; t=1744381906; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iU5GPHPv3JH4Kee/QfUFQyYLt1uqLC8Q0t06jEaI2NsONtG5B0atnr73AReTWF4+HFBHfx0O8/H75ou47AgIY1prFa3AfsknQZYvnQnS/CU6bey+t993VtK0UsXP5Xvje6L4F0MlvwPy7af3RdC2SIIQi8MRVOOs6Tm28/SEiZo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744381906; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4bEVzwa077L98xmrJC/K3SEciVJ1LxE/oPvC3WGlF80=; 
	b=eOQJP8AH4Vh2RF4ho2CUqImbYpn42paEp/GzjiKA+WSVwAQ73W0UEnsN/gxc2F0yF9WdBT4khYQL7dz9U0GoSgUiv3yZ0Z38csnqpQil0SmDLL7PCQ6fYw6QJlPm8ZgBCtfM309fkPt1gPj5qJNrTI+R0pYWq6Yhexs9K9fmiqk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744381906;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=4bEVzwa077L98xmrJC/K3SEciVJ1LxE/oPvC3WGlF80=;
	b=LhZ8G4aHexSUcndCBZQ6W00cpw7UCzuAeXgHRc2ktcxKSl/EeRGVxIrJIzJ1aqlA
	GLi8sQt8/rmczMh26qGi5DLvgcu3M0dsb5V3hv98Jr1rXclsmr4KeO+IH5dnF2KG2JE
	oZW/p5/f9ObjOVNUD1FOyJjbBGWYWjFH2XjqNpws=
Received: by mx.zohomail.com with SMTPS id 1744381904334406.2356180581727;
	Fri, 11 Apr 2025 07:31:44 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/4] dt-bindings: phy: rockchip,inno-usb2phy: add port property
Date: Fri, 11 Apr 2025 16:31:38 +0200
Message-ID: <6743970.MhkbZ0Pkbq@workhorse>
In-Reply-To: <20250410211123.GA1071510-robh@kernel.org>
References:
 <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
 <20250407-rk3576-sige5-usb-v1-1-67eec166f82f@collabora.com>
 <20250410211123.GA1071510-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Thursday, 10 April 2025 23:11:23 Central European Summer Time Rob Herring wrote:
> On Mon, Apr 07, 2025 at 08:09:14PM +0200, Nicolas Frattaroli wrote:
> > USB connectors like to have OF graph connections to high-speed related
> > nodes to do various things. In the case of the RK3576, we can make use
> > of a port in the usb2 PHY to detect whether the OTG controller is
> > connected to a type C port and apply some special behaviour accordingly.
> > 
> > The usefulness of having different bits of a fully functioning USB stack
> > point to each other is more general though, and not constrained to
> > RK3576 at all, even for this use-case.
> > 
> > Add a port property to the binding.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> > index 6a7ef556414cebad63c10de754778f84fd4486ee..3a662bfc353250a8ad9386ebb5575d1e84c1b5ba 100644
> > --- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
> > @@ -78,6 +78,11 @@ properties:
> >        When set the driver will request its phandle as one companion-grf
> >        for some special SoCs (e.g rv1108).
> >  
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description:
> > +      A port node to link the PHY to a USB connector's "high-speed" port.
> 
> I don't think this is correct. The HS port of the connector goes to the 
> controller. The controller has the link to the phy.
> 
> If the PHY is also what handles USB-C muxing or orientation switching, 
> then it might have ports, but then it needs input and output ports.
> 
> Rob
> 

Hi Rob,

thank you for the quick response.

I've feared this would be the case, but chose to go ahead with this solution
anyway because I'm not super stoked about the alternatives I can think of. The
problem is that I need to go from the USB PHY node to the USB connector somehow,
but there's no way I can see to get from the PHY node to the USB2 controller
it's connected to, unless I'm missing something obvious.

So I see two alternatives:
1. Extend the usb connector binding to add additional ports for PHYs that handle
   vbus detection or something, then extend either the inno2 binding or a more
   general usb PHY binding to add that port definition.
2. Revert to what the downstream vendor kernel does and simply add a boolean
   flag property to the inno usb2phy binding that tells it whether it's
   connected to a USB-C port and should therefore expect vbusdet to remain high.

Let me know if there's any better alternatives I missed. If there's some OF
driver function to enumerate all controllers a PHY is referenced by, then that
would probably work as well, allowing me to just point the HS port to the
controller instead as intended.

If no better solutions exist then I'm partial to 2. While it makes writing
device trees a little more error prone and I don't like vendor properties, it
means we don't set the "all USB-C ports will always have vbusdet pulled high" in
stone, a claim that I am not 100% confident in.

Kind regards,
Nicolas Frattaroli


