Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381C11ABEC5;
	Mon, 16 Jun 2025 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078125; cv=pass; b=JBAyQqwYXkhW7RGBGoBkOxUYUe0dsMzIHQW95+1E3L8XIUR76XbayHaQJMNRJvtaSI1opzdDj4C3HLHaxlKgy2XU7wz+Omlt7bnU5yIIi1c3Upyo+kfY0+6zvifXxvTtzwi8LkVaI0UGbP07h0FCopIDzFvVbYYvqmF8HcJE9I4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078125; c=relaxed/simple;
	bh=9Ad3Gd5JRZICvEqWYMhGmDPtMzVLCGq3AbWFxmNBCDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZSdVgEiyUhxbtaftsQlbrfK8BEu+kWL94HNPRDFtSzmyqdFNPWJE6NZECsUMxkcpMJjdYkTdtSvZ/DHIYuBA/Oe3AmV1rkW7Z9kUOM5nL7FUp+JRMxVz/5Aax2AEZi/ruObNRA0zrQWcz+0/o7MS5Ht3jBdU+RuJmnWLdiZsZ74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=P1mehgoW; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="P1mehgoW"
ARC-Seal: i=1; a=rsa-sha256; t=1750078090; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Noj837lL1QUwu7QwkZOvSNZyMANKK4hvJRpnt3BeaQkZfvjrMDtbEVB7pyeP9H3rGsZIwZjbnZto6Dw6xvLqZDOgRi0WdWOHnSFq+w8ocLkp4KRC8FISqOMAtulZN/hErS2wNCwChKeF5ct2yxovVMu8osk6129ALt5XeIbbGE8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750078090; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HKjeTdmJPh/8z/0sRDDRVkWKLbnDMCBBoa4t9bucIe4=; 
	b=J0sXDy+hxuy+880JvsArY9kGS8zGenjEO6mtuM1TOAokRZZalldQcJTXzjB87BSnUK6KeIH4nSGPZ8PD4AwN1QWTloUKOwgzynnz9mo1FBuo1lLVlGdnCxYa97ZUR4qSILEKXjbZHmJHh3gYNZ0i+7ZfRwpGvwZpIJ6uyludl2U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750078090;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=HKjeTdmJPh/8z/0sRDDRVkWKLbnDMCBBoa4t9bucIe4=;
	b=P1mehgoW9dxsq8haTmNMgTw+EKa3hxVmX6x429UQxc+r06naOkrbhD2WzXCJrfa1
	4ZB4MIsrQMxJYC4u6ku4JNUBduBRPV1NutWRlCdXt7NExjrrvwAE07Gd4tjJBz6dP3Y
	VH7KKk2bIoArvK9W559I77SqtxhjQxUezTlYzC4k=
Received: by mx.zohomail.com with SMTPS id 1750078087706132.33901078776455;
	Mon, 16 Jun 2025 05:48:07 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Alexey Charkov <alchark@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v4 1/4] phy: rockchip: inno-usb2: add soft vbusvalid control
Date: Mon, 16 Jun 2025 14:48:01 +0200
Message-ID: <7815489.EvYhyI6sBW@workhorse>
In-Reply-To: <5c531d53-3573-4c25-a32b-79dfd5abd4cd@linaro.org>
References:
 <20250610-rk3576-sige5-usb-v4-0-7e7f779619c1@collabora.com>
 <20250610-rk3576-sige5-usb-v4-1-7e7f779619c1@collabora.com>
 <5c531d53-3573-4c25-a32b-79dfd5abd4cd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, 13 June 2025 11:02:40 Central European Summer Time neil.armstrong@linaro.org wrote:
> On 10/06/2025 16:07, Nicolas Frattaroli wrote:
> > With USB type C connectors, the vbus detect pin of the OTG controller
> > attached to it is pulled high by a USB Type C controller chip such as
> > the fusb302. This means USB enumeration on Type-C ports never works, as
> > the vbus is always seen as high.
> > 
> > Rockchip added some GRF register flags to deal with this situation. The
> > RK3576 TRM calls these "soft_vbusvalid_bvalid" (con0 bit index 15) and
> > "soft_vbusvalid_bvalid_sel" (con0 bit index 14).
> > 
> > Downstream introduces a new vendor property which tells the USB 2 PHY
> > that it's connected to a type C port, but we can do better. Since in
> > such an arrangement, we'll have an OF graph connection from the USB
> > controller to the USB connector anyway, we can walk said OF graph and
> > check the connector's compatible to determine this without adding any
> > further vendor properties.
> > 
> > Do keep in mind that the usbdp PHY driver seemingly fiddles with these
> > register fields as well, but what it does doesn't appear to be enough
> > for us to get working USB enumeration, presumably because the whole
> > vbus_attach logic needs to be adjusted as well either way.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >   drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 113 +++++++++++++++++++++++++-
> >   1 file changed, 109 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > index b0f23690ec3002202c0f33a6988f5509622fa10e..4f89bd6568cd3a7a1d2c10e9cddda9f3bd997ed0 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > [...]
> > @@ -666,8 +679,17 @@ static void rockchip_usb2phy_otg_sm_work(struct work_struct *work)
> >   	unsigned long delay;
> >   	bool vbus_attach, sch_work, notify_charger;
> >   
> > -	vbus_attach = property_enabled(rphy->grf,
> > -				       &rport->port_cfg->utmi_bvalid);
> > +	if (rport->port_cfg->svbus_en.enable && rport->typec_vbus_det) {
> > +		if (property_enabled(rphy->grf, &rport->port_cfg->svbus_en) &&
> > +		    property_enabled(rphy->grf, &rport->port_cfg->svbus_sel)) {
> 
> Why do you check the registers since you always enable those bits on those conditions:
> 	rport->port_id == USB2PHY_PORT_OTG
> 	rport->typec_vbus_det
> 	rport->port_cfg->svbus_en.enable
> 	rport->typec_vbus_det
> Can't you us them instead ?

I did some more looking into this, and agree that I can drop the
property_enabled lines here. The other concern I had immediately (that
the bits never get turned off, which seemed fishy) isn't a concern after
all, because after sleeping on it some more, I realised that it's probably
not very likely that a USB-C connector is ever going to morph into anything
else spontaneously.

Thank you for spotting this!

> 
> Neil
> 
> [...]

Kind regards,
Nicolas Frattaroli


