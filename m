Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296C030E83E;
	Thu, 19 Jun 2025 19:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750362135; cv=none; b=r1nxstxv98090ZFBJYVIBkQjHm02SH2opHxtwg0O59PKosE89wo0wQtXGU/XwdSrpfYnfqXLpAx5HDB0XSpv4PW3XvKxJitCSOlEEUMWPE7na1d3lHscIMviZkJ1l/Azau+SbIqVAXUlTH2urA0JUYE6I8N9FhpboLZxGEkZYM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750362135; c=relaxed/simple;
	bh=TzeHJzZ7h0/TmOcB7LFuWJJpKpZGwp266lYNGJjFFoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IpTe7iQhSwzi+ONnMCbb8XXAUvLFX0x0ojyVXbJ7vdEkXJOwWYHsgqf/NieZjqLpL4ZS22PZ2IKvjA7XATBKWcR9u9y+x/FXoYr1zBTBkDbyuRjLsYXvhRkxOMHqz6g6Wemt9z4JXklzAm9CEedaEVA/emn6ZE08olgGdWZVih8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=O9iueXfR; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="O9iueXfR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=mXmvKHVyVneLNACt7FikTBcRVPKpi1VtdHVp1Bud38o=; b=O9iueXfRxbTTpObfvpHY5997gU
	L35A1Q1ccvwrqb6emiFzg25TEFCYSP+QIIw9q3PQpHknDfKLQJPtRSkJ/o3SZRxrkQCafEVgdIkl+
	5/JvnBprIHh/ktRDaqcSTONu+AKeaWxcRuGzedrDy4cOshIJG9M8PPkR3D7A/VWKNQTvqW7pBs7ju
	MtPnxLxOvREZ7Yv+Fa5z5Ur5Xyd31p9WiD4KU3T7U5qR+tTRQ0JB+6vzrpF1wjTFBRAZfy1GrLEOo
	Z72lXlLTq54NmfIp0Y8zrY4NpRBDldZ7NfZnw5MK23AWv4VfnoDH9Lx0QJdNtsgYffp7hjsVnpg5g
	w17m70Rg==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSL97-0006Um-Kt; Thu, 19 Jun 2025 21:42:01 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kever Yang <kever.yang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Alexey Charkov <alchark@gmail.com>, kernel@collabora.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject:
 Re: [PATCH v5 1/2] phy: rockchip: inno-usb2: add soft vbusvalid control
Date: Thu, 19 Jun 2025 21:42:00 +0200
Message-ID: <7131451.G0QQBjFxQf@phil>
In-Reply-To: <20250619-rk3576-sige5-usb-v5-1-9069a7e750e1@collabora.com>
References:
 <20250619-rk3576-sige5-usb-v5-0-9069a7e750e1@collabora.com>
 <20250619-rk3576-sige5-usb-v5-1-9069a7e750e1@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Nicolas,

Am Donnerstag, 19. Juni 2025, 20:36:36 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Nicolas Frattaroli:
> With USB type C connectors, the vbus detect pin of the OTG controller
> attached to it is pulled high by a USB Type C controller chip such as
> the fusb302. This means USB enumeration on Type-C ports never works, as
> the vbus is always seen as high.
>=20
> Rockchip added some GRF register flags to deal with this situation. The
> RK3576 TRM calls these "soft_vbusvalid_bvalid" (con0 bit index 15) and
> "soft_vbusvalid_bvalid_sel" (con0 bit index 14).

I would expect a paragraph more about what those bits (and their
functionality) actually do here :-)=20


> Downstream introduces a new vendor property which tells the USB 2 PHY
> that it's connected to a type C port, but we can do better. Since in
> such an arrangement, we'll have an OF graph connection from the USB
> controller to the USB connector anyway, we can walk said OF graph and
> check the connector's compatible to determine this without adding any
> further vendor properties.
>=20
> Do keep in mind that the usbdp PHY driver seemingly fiddles with these
> register fields as well, but what it does doesn't appear to be enough
> for us to get working USB enumeration, presumably because the whole
> vbus_attach logic needs to be adjusted as well either way.


In the rk3588 TRM I find USB2PHY_GRF_CON4
bit3 - sft_vbus_sel (VBUS software control select)
bit2 - sft_vbus (When sft_vbus_sel is 1'b1, vbusvalid and bvalid is
                 controlled by sft_vbus)

Is that the same stuff as you're adding for rk3576 ?

My last dance with rk3588-type-c is already some months back, but I do
remember running into "some" issue - but don't remember which one ;-)


Heiko

> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 108 ++++++++++++++++++++=
+++++-
>  1 file changed, 104 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/=
rockchip/phy-rockchip-inno-usb2.c
> index b0f23690ec3002202c0f33a6988f5509622fa10e..71810c07e4150ea81f65a8a93=
2541b144e95a137 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> @@ -17,6 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/of_irq.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> @@ -114,6 +115,8 @@ struct rockchip_chg_det_reg {
>  /**
>   * struct rockchip_usb2phy_port_cfg - usb-phy port configuration.
>   * @phy_sus: phy suspend register.
> + * @svbus_en: soft vbus bvalid enable register.
> + * @svbus_sel: soft vbus bvalid selection register.
>   * @bvalid_det_en: vbus valid rise detection enable register.
>   * @bvalid_det_st: vbus valid rise detection status register.
>   * @bvalid_det_clr: vbus valid rise detection clear register.
> @@ -140,6 +143,8 @@ struct rockchip_chg_det_reg {
>   */
>  struct rockchip_usb2phy_port_cfg {
>  	struct usb2phy_reg	phy_sus;
> +	struct usb2phy_reg	svbus_en;
> +	struct usb2phy_reg	svbus_sel;
>  	struct usb2phy_reg	bvalid_det_en;
>  	struct usb2phy_reg	bvalid_det_st;
>  	struct usb2phy_reg	bvalid_det_clr;
> @@ -203,6 +208,7 @@ struct rockchip_usb2phy_cfg {
>   * @event_nb: hold event notification callback.
>   * @state: define OTG enumeration states before device reset.
>   * @mode: the dr_mode of the controller.
> + * @typec_vbus_det: whether to apply Type C logic to OTG vbus detection.
>   */
>  struct rockchip_usb2phy_port {
>  	struct phy	*phy;
> @@ -222,6 +228,7 @@ struct rockchip_usb2phy_port {
>  	struct notifier_block	event_nb;
>  	enum usb_otg_state	state;
>  	enum usb_dr_mode	mode;
> +	bool typec_vbus_det;
>  };
> =20
>  /**
> @@ -495,6 +502,13 @@ static int rockchip_usb2phy_init(struct phy *phy)
>  	mutex_lock(&rport->mutex);
> =20
>  	if (rport->port_id =3D=3D USB2PHY_PORT_OTG) {
> +		if (rport->typec_vbus_det) {
> +			if (rport->port_cfg->svbus_en.enable &&
> +					rport->port_cfg->svbus_sel.enable) {
> +				property_enable(rphy->grf, &rport->port_cfg->svbus_en, true);
> +				property_enable(rphy->grf, &rport->port_cfg->svbus_sel, true);
> +			}
> +		}
>  		if (rport->mode !=3D USB_DR_MODE_HOST &&
>  		    rport->mode !=3D USB_DR_MODE_UNKNOWN) {
>  			/* clear bvalid status and enable bvalid detect irq */
> @@ -535,8 +549,7 @@ static int rockchip_usb2phy_init(struct phy *phy)
>  			if (ret)
>  				goto out;
> =20
> -			schedule_delayed_work(&rport->otg_sm_work,
> -					      OTG_SCHEDULE_DELAY * 3);
> +			schedule_delayed_work(&rport->otg_sm_work, 0);
>  		} else {
>  			/* If OTG works in host only mode, do nothing. */
>  			dev_dbg(&rport->phy->dev, "mode %d\n", rport->mode);
> @@ -666,8 +679,12 @@ static void rockchip_usb2phy_otg_sm_work(struct work=
_struct *work)
>  	unsigned long delay;
>  	bool vbus_attach, sch_work, notify_charger;
> =20
> -	vbus_attach =3D property_enabled(rphy->grf,
> -				       &rport->port_cfg->utmi_bvalid);
> +	if (rport->port_cfg->svbus_en.enable && rport->typec_vbus_det) {
> +		vbus_attach =3D true;
> +	} else {
> +		vbus_attach =3D property_enabled(rphy->grf,
> +					       &rport->port_cfg->utmi_bvalid);
> +	}
> =20
>  	sch_work =3D false;
>  	notify_charger =3D false;
> @@ -1276,6 +1293,83 @@ static int rockchip_otg_event(struct notifier_bloc=
k *nb,
>  	return NOTIFY_DONE;
>  }
> =20
> +static const char *const rockchip_usb2phy_typec_cons[] =3D {
> +	"usb-c-connector",
> +	NULL,
> +};
> +
> +static struct device_node *rockchip_usb2phy_to_controller(struct rockchi=
p_usb2phy *rphy)
> +{
> +	struct device_node *np;
> +	struct device_node *parent;
> +
> +	for_each_node_with_property(np, "phys") {
> +		struct of_phandle_iterator it;
> +		int ret;
> +
> +		of_for_each_phandle(&it, ret, np, "phys", NULL, 0) {
> +			parent =3D of_get_parent(it.node);
> +			if (it.node !=3D rphy->dev->of_node && rphy->dev->of_node !=3D parent=
) {
> +				if (parent)
> +					of_node_put(parent);
> +				continue;
> +			}
> +
> +			/*
> +			 * Either the PHY phandle we're iterating or its parent
> +			 * matched, we don't care about which out of the two in
> +			 * particular as we just need to know it's the right
> +			 * USB controller for this PHY.
> +			 */
> +			of_node_put(it.node);
> +			of_node_put(parent);
> +			return np;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static bool rockchip_usb2phy_otg_is_type_c(struct rockchip_usb2phy *rphy)
> +{
> +	struct device_node *controller =3D rockchip_usb2phy_to_controller(rphy);
> +	struct device_node *ports;
> +	struct device_node *ep =3D NULL;
> +	struct device_node *parent;
> +
> +	if (!controller)
> +		return false;
> +
> +	ports =3D of_get_child_by_name(controller, "ports");
> +	if (ports) {
> +		of_node_put(controller);
> +		controller =3D ports;
> +	}
> +
> +	for_each_of_graph_port(controller, port) {
> +		ep =3D of_get_child_by_name(port, "endpoint");
> +		if (!ep)
> +			continue;
> +
> +		parent =3D of_graph_get_remote_port_parent(ep);
> +		of_node_put(ep);
> +		if (!parent)
> +			continue;
> +
> +		if (of_device_compatible_match(parent, rockchip_usb2phy_typec_cons)) {
> +			of_node_put(parent);
> +			of_node_put(controller);
> +			return true;
> +		}
> +
> +		of_node_put(parent);
> +	}
> +
> +	of_node_put(controller);
> +
> +	return false;
> +}
> +
>  static int rockchip_usb2phy_otg_port_init(struct rockchip_usb2phy *rphy,
>  					  struct rockchip_usb2phy_port *rport,
>  					  struct device_node *child_np)
> @@ -1297,6 +1391,8 @@ static int rockchip_usb2phy_otg_port_init(struct ro=
ckchip_usb2phy *rphy,
> =20
>  	mutex_init(&rport->mutex);
> =20
> +	rport->typec_vbus_det =3D rockchip_usb2phy_otg_is_type_c(rphy);
> +
>  	rport->mode =3D of_usb_get_dr_mode_by_phy(child_np, -1);
>  	if (rport->mode =3D=3D USB_DR_MODE_HOST ||
>  	    rport->mode =3D=3D USB_DR_MODE_UNKNOWN) {
> @@ -2050,6 +2146,8 @@ static const struct rockchip_usb2phy_cfg rk3576_phy=
_cfgs[] =3D {
>  		.port_cfgs	=3D {
>  			[USB2PHY_PORT_OTG] =3D {
>  				.phy_sus	=3D { 0x0000, 8, 0, 0, 0x1d1 },
> +				.svbus_en	=3D { 0x0000, 15, 15, 0, 1 },
> +				.svbus_sel	=3D { 0x0000, 14, 14, 0, 1 },
>  				.bvalid_det_en	=3D { 0x00c0, 1, 1, 0, 1 },
>  				.bvalid_det_st	=3D { 0x00c4, 1, 1, 0, 1 },
>  				.bvalid_det_clr =3D { 0x00c8, 1, 1, 0, 1 },
> @@ -2087,6 +2185,8 @@ static const struct rockchip_usb2phy_cfg rk3576_phy=
_cfgs[] =3D {
>  		.port_cfgs	=3D {
>  			[USB2PHY_PORT_OTG] =3D {
>  				.phy_sus	=3D { 0x2000, 8, 0, 0, 0x1d1 },
> +				.svbus_en	=3D { 0x2000, 15, 15, 0, 1 },
> +				.svbus_sel	=3D { 0x2000, 14, 14, 0, 1 },
>  				.bvalid_det_en	=3D { 0x20c0, 1, 1, 0, 1 },
>  				.bvalid_det_st	=3D { 0x20c4, 1, 1, 0, 1 },
>  				.bvalid_det_clr =3D { 0x20c8, 1, 1, 0, 1 },
>=20
>=20




