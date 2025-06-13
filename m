Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1C21E50E;
	Fri, 13 Jun 2025 13:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820935; cv=pass; b=GiFelubpKmgIy6dMYMrI5lA/ZA7+kOW5C9OOWuVu2qfjLb7p+YoBUd4iCWCW7VSDAMuNpvg11zyKnTcAmbX83mjZyyu8EJbzb6mH6ppPo2VTERxfThGVTZqwLQl3sQfb5UQXV+18+flfk6ug7XyUfuQ7gfncNy8x8wlsFTWFAvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820935; c=relaxed/simple;
	bh=BJqRHcGM+I7DOQoI9oAEFpoYDFJjaH++nzUcV0AraKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XckHNOGoolJZw6vw/DCJYFwNkDhikeMT8VwuZsDjloyoddwUu62hPQb0XgSzgYg7tiuPxEjGCpwq9KkuHm2zBy0mj1BHmEK4p42X90QwWHl8bDpc8Ztgci4lmHBW6/68ps8U0TeGORQEIRbvt/G9pbGO1nVe+rEzAgJqPmA6YQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=UdRJJkA/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="UdRJJkA/"
ARC-Seal: i=1; a=rsa-sha256; t=1749820908; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HiGP/zFuoD/K72kz39vVKk1DqfaB+k6xKcjlzs0tTQt0FNVA7MvQ4CQazrpNA10Us/jtePzBEos95U2pqs4KIas6Usb27r/x8TXohCTITJL/GzRLLVrTrYE6idzS+h2MdZkxn7WLlEMCtFPdIwQZP20edCf49nitIHlba3qcvpU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749820908; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Nq6vLrgRxcRv0ur30aqw4u0LYcZO69N6Td/qIVTptOM=; 
	b=XqO6xYlCbyAm/i0O6PNPzeWAQBYLFyGg2dt3zGezuL3kLI7dWsRXivTx8m53D7fhlo1MRXIScgbzzNTnvD/bb0zaSZGdl1cjf67oghQeHqeDKv5fDesbiY0lXJHT2mKQVlLsrGqfebZBzH2x60ZmnciwRgvFpAiG1fknxEuJZFo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749820908;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=Nq6vLrgRxcRv0ur30aqw4u0LYcZO69N6Td/qIVTptOM=;
	b=UdRJJkA/SCNLBUiZRzD59FVf5gvbzgk3ULumBZ+hke93c66e5XI/T5h0hlfJUOP3
	YscTk7ST2C715rRAh8R1vlBJFOXnOu4H1u40wUCMicwuGr0e/tXza2WAoRJM1/2L0CE
	XK/28UPiip/z0l0ThnN8vdAm4i8Elb62fsUMvYZY=
Received: by mx.zohomail.com with SMTPS id 1749820906115539.1019397469723;
	Fri, 13 Jun 2025 06:21:46 -0700 (PDT)
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
 Re: [PATCH v4 3/4] phy: rockchip: usbdp: reset USB3 and reinit on orientation
 switch
Date: Fri, 13 Jun 2025 15:21:41 +0200
Message-ID: <4115444.Lt9SDvczpP@workhorse>
In-Reply-To: <49eb73df-9a15-436e-a05c-72dd3aa36bf8@linaro.org>
References:
 <20250610-rk3576-sige5-usb-v4-0-7e7f779619c1@collabora.com>
 <20250610-rk3576-sige5-usb-v4-3-7e7f779619c1@collabora.com>
 <49eb73df-9a15-436e-a05c-72dd3aa36bf8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, 13 June 2025 10:55:43 Central European Summer Time neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 10/06/2025 16:07, Nicolas Frattaroli wrote:
> > Until now, super speed on Type-C only worked in one orientation. This is
> > because on an orientation switch, the UDPHY was never reinitialised.
> > 
> > Heiko presented a patch to do this[1], but there were concerns over the
> > correctness of it[2]. Experimentally using Heiko's patch on RK3576 did
> > make me run into issues, though they seemed to be related to the
> > orientation switch actually happening while a clock driving a GRF
> > register was disabled.
> > 
> > The key issue is that the hardware wants the USB 3 controller to be held
> > in reset while the PHY is being reconfigured, otherwise we may run into
> > hard-to-catch race conditions.
> > 
> > Either way, this patch implements the required ordering in a somewhat
> > unpleasant way: we get the USB 3 controller from the DT, and use runtime
> > power management to forcibly suspend it while the UDPHY is being
> > reconfigured, and then forcibly resume it later. As an added pain in the
> > rear, the suspend/resume of the USB 3 controller also tries fiddling
> > with the USB 3 PHY part of the UDPHY, which means we introduce an atomic
> > flag to skip suspending/resuming the UDPHY if we're resetting the USB 3
> > controller. We may just need to skip trying to acquire the mutex again,
> > but both ways work for me in practice.
> > 
> > This solution may in fact be complete rubbish, but it works to get USB 3
> > Super Speed working in both cable orientations on my board.
> 
> Yeah this is kind of a hack, and we have a similar situation on Qualcomm platforms
> when dealing with USB2-only and DP-only altmodes, where we need the DWC3 to
> disable the usb3 path. Hopefully on Qcom combo PHYs we can switch lanes without
> disable the USB3 PHY.
> 
> So the proper solution would have the dwc3 driver to also react to mux and
> orientation events and disable the usb3 path to allow the phy to reconfigure
> itself.
> 
> We don't have any concrete proposal yet, but we will get something soonish.

Thanks you for the additional insight, I do agree that having the
controller be in charge of this is the better solution. That way, the PHY
doesn't need to know its controller, and the controller driver is in charge
of ordering the resets and reconfigure right, which means the ugly reset
loop breaking in this patch isn't needed.

If you do end up sending a patch series with a proposal, please +Cc me,
so that I can see if it also works for Rockchip.

If the hack isn't acceptable to be merged until then, then I'll drop
this patch from future revisions of the series to get the other parts
in.

> 
> Neil

Best regards,
Nicolas Frattaroli

> 
> > 
> > Link: https://lore.kernel.org/all/20250226103810.3746018-3-heiko@sntech.de/ [1]
> > Link: https://lore.kernel.org/linux-rockchip/h57ok2hw6os7bcafqkrqknfvm7hnu25m2oe54qmrsuzdwqlos3@m4och2fcdm7s/ [2]
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >   drivers/phy/rockchip/phy-rockchip-usbdp.c | 54 +++++++++++++++++++++++++++++++
> >   1 file changed, 54 insertions(+)
> > 
> > diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> > index fff54900feea601c8fe6bf4c7123dfebc5661a15..5cd6bbc367f69bca15c2a94a07e72f850b381ae3 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> > @@ -200,6 +200,10 @@ struct rk_udphy {
> >   	/* PHY devices */
> >   	struct phy *phy_dp;
> >   	struct phy *phy_u3;
> > +
> > +	/* USB 3 controller device */
> > +	struct device *ctrl_u3;
> > +	atomic_t ctrl_resetting;
> >   };
> >   
> >   static const struct rk_udphy_dp_tx_drv_ctrl rk3588_dp_tx_drv_ctrl_rbr_hbr[4][4] = {
> > @@ -1255,6 +1259,9 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
> >   	struct rk_udphy *udphy = phy_get_drvdata(phy);
> >   	int ret = 0;
> >   
> > +	if (atomic_read(&udphy->ctrl_resetting))
> > +		return 0;
> > +
> >   	mutex_lock(&udphy->mutex);
> >   	/* DP only or high-speed, disable U3 port */
> >   	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
> > @@ -1273,6 +1280,9 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
> >   {
> >   	struct rk_udphy *udphy = phy_get_drvdata(phy);
> >   
> > +	if (atomic_read(&udphy->ctrl_resetting))
> > +		return 0;
> > +
> >   	mutex_lock(&udphy->mutex);
> >   	/* DP only or high-speed */
> >   	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
> > @@ -1401,10 +1411,31 @@ static struct phy *rk_udphy_phy_xlate(struct device *dev, const struct of_phandl
> >   	return ERR_PTR(-EINVAL);
> >   }
> >   
> > +static struct device_node *rk_udphy_to_controller(struct rk_udphy *udphy)
> > +{
> > +	struct device_node *np;
> > +
> > +	for_each_node_with_property(np, "phys") {
> > +		struct of_phandle_iterator it;
> > +		int ret;
> > +
> > +		of_for_each_phandle(&it, ret, np, "phys", NULL, 0) {
> > +			if (it.node != udphy->dev->of_node)
> > +				continue;
> > +
> > +			of_node_put(it.node);
> > +			return np;
> > +		}
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> >   static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
> >   				 enum typec_orientation orien)
> >   {
> >   	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
> > +	int ret;
> >   
> >   	mutex_lock(&udphy->mutex);
> >   
> > @@ -1420,6 +1451,18 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
> >   	rk_udphy_set_typec_default_mapping(udphy);
> >   	rk_udphy_usb_bvalid_enable(udphy, true);
> >   
> > +	if (udphy->status != UDPHY_MODE_NONE && udphy->ctrl_u3) {
> > +		atomic_set(&udphy->ctrl_resetting, 1);
> > +		pm_runtime_force_suspend(udphy->ctrl_u3);
> > +
> > +		ret = rk_udphy_setup(udphy);
> > +		if (!ret)
> > +			clk_bulk_disable_unprepare(udphy->num_clks, udphy->clks);
> > +
> > +		pm_runtime_force_resume(udphy->ctrl_u3);
> > +		atomic_set(&udphy->ctrl_resetting, 0);
> > +	}
> > +
> >   unlock_ret:
> >   	mutex_unlock(&udphy->mutex);
> >   	return 0;
> > @@ -1430,12 +1473,22 @@ static void rk_udphy_orien_switch_unregister(void *data)
> >   	struct rk_udphy *udphy = data;
> >   
> >   	typec_switch_unregister(udphy->sw);
> > +	put_device(udphy->ctrl_u3);
> >   }
> >   
> >   static int rk_udphy_setup_orien_switch(struct rk_udphy *udphy)
> >   {
> > +	struct device_node *ctrl = rk_udphy_to_controller(udphy);
> >   	struct typec_switch_desc sw_desc = { };
> >   
> > +	if (ctrl) {
> > +		udphy->ctrl_u3 = bus_find_device_by_of_node(udphy->dev->bus, ctrl);
> > +		of_node_put(ctrl);
> > +	}
> > +
> > +	if (!udphy->ctrl_u3)
> > +		dev_info(udphy->dev, "couldn't find this PHY's USB3 controller\n");
> > +
> >   	sw_desc.drvdata = udphy;
> >   	sw_desc.fwnode = dev_fwnode(udphy->dev);
> >   	sw_desc.set = rk_udphy_orien_sw_set;
> > @@ -1499,6 +1552,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
> >   		return ret;
> >   
> >   	mutex_init(&udphy->mutex);
> > +	atomic_set(&udphy->ctrl_resetting, 0);
> >   	platform_set_drvdata(pdev, udphy);
> >   
> >   	if (device_property_present(dev, "orientation-switch")) {
> > 
> 
> 




