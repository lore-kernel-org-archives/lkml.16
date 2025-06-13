Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CDEA29;
	Fri, 13 Jun 2025 13:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820164; cv=pass; b=ksOS9Ve+Br2aQfp5esNTAOBPxVneqLhDqx52SIlOOl7Ks1m43n7SdHX43eyvOW33HQkuN/jT2fGwxb/G/tNqDrAIuZJPk33XI6OmDFeL7rXuNJIEr75tjVeL45SxDgdyKWjHvvtpYjTxDjKS9HvWnimu8WPczTkWlj8zbDpicbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820164; c=relaxed/simple;
	bh=JNzwSv5wmEqpfiUCPmLTakXGP2hmjFRUHoTgtkcCEQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uh+z5B+rKWpMNWvs5MClLNnlvQ81I1jHAEqN33Z7CEdulsRak+qAVAxPYO5Cnsp4FzF+SsGtx4AOqvGBhkfqJI0urlI3iB9rz6iW2AqhkBDK+/JZF5rQJ7T013ZuhM7vHsfztWYcH9nDtnMS4axdI3sxDCBwi/Fp4U0VaaIeUPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=iZXbgTQ2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="iZXbgTQ2"
ARC-Seal: i=1; a=rsa-sha256; t=1749820130; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l9dzbF3zQflwc7yb+7biovokPvXD3AOtCCBg+iBkNSjS8gaSXgLiDdw5aTKKELaTBtikDAvAteFfaU0J33nI3UuwR3v4zPE3cvsBFG3tvDXDRW0sxSUedBhAPIBnwCK5b8inskFpcp3OqYQ+WThMdHz1mKN2Mw8fBAGsDxSAt04=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749820130; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=K9bhrRW+s12WtdaVP6Yi4iBFDQwpPFW/VNIJ084o8RM=; 
	b=GIwKskccuJOMSPJp2xnn4AGCPMy0TtPoMh1U+LiqS0Y4YLdTR5QOaqHM23gPKWj47lmLoYOMOfa3NZ9FA7hMsrrSRanfDnWzFZQhaYkF0Klvwi/pzdvHLn0hognmYq+vZ6pPJFcGvOvlRWUtJ3xlCdxkSxHK7C0CxTGVOHF+BPc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749820130;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=K9bhrRW+s12WtdaVP6Yi4iBFDQwpPFW/VNIJ084o8RM=;
	b=iZXbgTQ2EqQYhrsx8UX0Fx4Hrd0EnH8jyDWxuF8nV2kQdKs/GLSYQfDMqRAusWN3
	zX5C2pP0Ivu0dqnJAwy4lACa2W/IStoAv/iOrxs8sbZAz3SK0rWAYIoInmJ1aqZ7nQU
	9Zpvf21oRAM7FQwp6kARfJarCm0yZXd3zhDtc7Bs=
Received: by mx.zohomail.com with SMTPS id 1749820128052943.1985221609309;
	Fri, 13 Jun 2025 06:08:48 -0700 (PDT)
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
Date: Fri, 13 Jun 2025 15:08:42 +0200
Message-ID: <3284807.VLH7GnMWUR@workhorse>
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

Hi Neil,

thank you for the review! Responses are inline.

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
> > @@ -17,6 +17,7 @@
> >   #include <linux/module.h>
> >   #include <linux/mutex.h>
> >   #include <linux/of.h>
> > +#include <linux/of_graph.h>
> >   #include <linux/of_irq.h>
> >   #include <linux/phy/phy.h>
> >   #include <linux/platform_device.h>
> > @@ -114,6 +115,8 @@ struct rockchip_chg_det_reg {
> >   /**
> >    * struct rockchip_usb2phy_port_cfg - usb-phy port configuration.
> >    * @phy_sus: phy suspend register.
> > + * @svbus_en: soft vbus bvalid enable register.
> > + * @svbus_sel: soft vbus bvalid selection register.
> >    * @bvalid_det_en: vbus valid rise detection enable register.
> >    * @bvalid_det_st: vbus valid rise detection status register.
> >    * @bvalid_det_clr: vbus valid rise detection clear register.
> > @@ -140,6 +143,8 @@ struct rockchip_chg_det_reg {
> >    */
> >   struct rockchip_usb2phy_port_cfg {
> >   	struct usb2phy_reg	phy_sus;
> > +	struct usb2phy_reg	svbus_en;
> > +	struct usb2phy_reg	svbus_sel;
> >   	struct usb2phy_reg	bvalid_det_en;
> >   	struct usb2phy_reg	bvalid_det_st;
> >   	struct usb2phy_reg	bvalid_det_clr;
> > @@ -203,6 +208,7 @@ struct rockchip_usb2phy_cfg {
> >    * @event_nb: hold event notification callback.
> >    * @state: define OTG enumeration states before device reset.
> >    * @mode: the dr_mode of the controller.
> > + * @typec_vbus_det: whether to apply Type C logic to OTG vbus detection.
> >    */
> >   struct rockchip_usb2phy_port {
> >   	struct phy	*phy;
> > @@ -222,6 +228,7 @@ struct rockchip_usb2phy_port {
> >   	struct notifier_block	event_nb;
> >   	enum usb_otg_state	state;
> >   	enum usb_dr_mode	mode;
> > +	bool typec_vbus_det;
> >   };
> >   
> >   /**
> > @@ -495,6 +502,13 @@ static int rockchip_usb2phy_init(struct phy *phy)
> >   	mutex_lock(&rport->mutex);
> >   
> >   	if (rport->port_id == USB2PHY_PORT_OTG) {
> > +		if (rport->typec_vbus_det) {
> > +			if (rport->port_cfg->svbus_en.enable &&
> > +					rport->port_cfg->svbus_sel.enable) {
> > +				property_enable(rphy->grf, &rport->port_cfg->svbus_en, true);
> > +				property_enable(rphy->grf, &rport->port_cfg->svbus_sel, true);
> > +			}
> > +		}
> >   		if (rport->mode != USB_DR_MODE_HOST &&
> >   		    rport->mode != USB_DR_MODE_UNKNOWN) {
> >   			/* clear bvalid status and enable bvalid detect irq */
> > @@ -535,8 +549,7 @@ static int rockchip_usb2phy_init(struct phy *phy)
> >   			if (ret)
> >   				goto out;
> >   
> > -			schedule_delayed_work(&rport->otg_sm_work,
> > -					      OTG_SCHEDULE_DELAY * 3);
> > +			schedule_delayed_work(&rport->otg_sm_work, 0);
> >   		} else {
> >   			/* If OTG works in host only mode, do nothing. */
> >   			dev_dbg(&rport->phy->dev, "mode %d\n", rport->mode);
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

That is an excellent question. I think I was imitating downstream code
here without thinking too much. This whole construct seems a little fishy,
as these GRF registers are then never cleared again if it's not in OTG
mode anymore. I'll look into it further, including cross-checking what
those bits actually do based on the TRMs of various SoCs that use this
hardware.

> 
> Neil
> 
> > +			vbus_attach = true;
> > +		} else {
> > +			vbus_attach = false;
> > +		}
> > +	} else {
> > +		vbus_attach = property_enabled(rphy->grf,
> > +					       &rport->port_cfg->utmi_bvalid);
> > +	}
> >   
> >   	sch_work = false;
> >   	notify_charger = false;
> > @@ -1276,6 +1298,83 @@ static int rockchip_otg_event(struct notifier_block *nb,
> >   	return NOTIFY_DONE;
> >   }
> >   
> > +static const char *const rockchip_usb2phy_typec_cons[] = {
> > +	"usb-c-connector",
> > +	NULL,
> > +};
> > +
> > +static struct device_node *rockchip_usb2phy_to_controller(struct rockchip_usb2phy *rphy)
> > +{
> > +	struct device_node *np;
> > +	struct device_node *parent;
> > +
> > +	for_each_node_with_property(np, "phys") {
> > +		struct of_phandle_iterator it;
> > +		int ret;
> > +
> > +		of_for_each_phandle(&it, ret, np, "phys", NULL, 0) {
> > +			parent = of_get_parent(it.node);
> > +			if (it.node != rphy->dev->of_node && rphy->dev->of_node != parent) {
> > +				if (parent)
> > +					of_node_put(parent);
> > +				continue;
> > +			}
> > +
> > +			/*
> > +			 * Either the PHY phandle we're iterating or its parent
> > +			 * matched, we don't care about which out of the two in
> > +			 * particular as we just need to know it's the right
> > +			 * USB controller for this PHY.
> > +			 */
> > +			of_node_put(it.node);
> > +			of_node_put(parent);
> > +			return np;
> > +		}
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +static bool rockchip_usb2phy_otg_is_type_c(struct rockchip_usb2phy *rphy)
> > +{
> > +	struct device_node *controller = rockchip_usb2phy_to_controller(rphy);
> > +	struct device_node *ports;
> > +	struct device_node *ep = NULL;
> > +	struct device_node *parent;
> > +
> > +	if (!controller)
> > +		return false;
> > +
> > +	ports = of_get_child_by_name(controller, "ports");
> > +	if (ports) {
> > +		of_node_put(controller);
> > +		controller = ports;
> > +	}
> > +
> > +	for_each_of_graph_port(controller, port) {
> > +		ep = of_get_child_by_name(port, "endpoint");
> > +		if (!ep)
> > +			continue;
> > +
> > +		parent = of_graph_get_remote_port_parent(ep);
> > +		of_node_put(ep);
> > +		if (!parent)
> > +			continue;
> > +
> > +		if (of_device_compatible_match(parent, rockchip_usb2phy_typec_cons)) {
> > +			of_node_put(parent);
> > +			of_node_put(controller);
> > +			return true;
> > +		}
> > +
> > +		of_node_put(parent);
> > +	}
> > +
> > +	of_node_put(controller);
> > +
> > +	return false;
> > +}
> 
> This DT parsing is quite complex, but seems it's the only way to detect such features
> without bindings change, not sure it's really beneficial.

Yeah, v1 abused the existing connector binding by having the HS graph
port point to the PHY instead, and Rob wasn't happy with that. He
suggested this can actually be done just by walking the graph.

FWIW, even if the PHY knew its controller, that would still only get rid
of rockchip_usb2phy_to_controller, and leave the graph walking to get to
the connector in place.

So a bindings change would only be of measurable benefit if it added a
phandle property in USB PHYs to the connector or something, and I'm not
sure if that's the right solution either. It'd once again shift the
burden of remembering to let PHYs know about their connectors onto board
DTs, which forget such things all the time.

The benefit of this solution is that board DTs don't need to think about
this at all, and the search is unambiguous, as we really don't lack any
information, we just lack a direct view of that information in the node
our driver receives.

> 
> > +
> >   static int rockchip_usb2phy_otg_port_init(struct rockchip_usb2phy *rphy,
> >   					  struct rockchip_usb2phy_port *rport,
> >   					  struct device_node *child_np)
> > @@ -1297,6 +1396,8 @@ static int rockchip_usb2phy_otg_port_init(struct rockchip_usb2phy *rphy,
> >   
> >   	mutex_init(&rport->mutex);
> >   
> > +	rport->typec_vbus_det = rockchip_usb2phy_otg_is_type_c(rphy);
> > +
> >   	rport->mode = of_usb_get_dr_mode_by_phy(child_np, -1);
> >   	if (rport->mode == USB_DR_MODE_HOST ||
> >   	    rport->mode == USB_DR_MODE_UNKNOWN) {
> > @@ -2050,6 +2151,8 @@ static const struct rockchip_usb2phy_cfg rk3576_phy_cfgs[] = {
> >   		.port_cfgs	= {
> >   			[USB2PHY_PORT_OTG] = {
> >   				.phy_sus	= { 0x0000, 8, 0, 0, 0x1d1 },
> > +				.svbus_en	= { 0x0000, 15, 15, 0, 1 },
> > +				.svbus_sel	= { 0x0000, 14, 14, 0, 1 },
> >   				.bvalid_det_en	= { 0x00c0, 1, 1, 0, 1 },
> >   				.bvalid_det_st	= { 0x00c4, 1, 1, 0, 1 },
> >   				.bvalid_det_clr = { 0x00c8, 1, 1, 0, 1 },
> > @@ -2087,6 +2190,8 @@ static const struct rockchip_usb2phy_cfg rk3576_phy_cfgs[] = {
> >   		.port_cfgs	= {
> >   			[USB2PHY_PORT_OTG] = {
> >   				.phy_sus	= { 0x2000, 8, 0, 0, 0x1d1 },
> > +				.svbus_en	= { 0x2000, 15, 15, 0, 1 },
> > +				.svbus_sel	= { 0x2000, 14, 14, 0, 1 },
> >   				.bvalid_det_en	= { 0x20c0, 1, 1, 0, 1 },
> >   				.bvalid_det_st	= { 0x20c4, 1, 1, 0, 1 },
> >   				.bvalid_det_clr = { 0x20c8, 1, 1, 0, 1 },
> > 
> 
> Thanks,
> Neil
> 

Kind regards,
Nicolas Frattaroli



