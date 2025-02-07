Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E7218E02A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738957359; cv=none; b=Dri+oieocN+SADI8fIQ5dc0uFbZbDVFD6vtQjVNw1v+XfOnz3PYQzSAVCJIyYGx63rlrXLrBvoqNe9IpSDgoT+odwncAIOpe7qdeGBwYqVHR+ycMEFOM1r72qdgV89ETYal7hsH1CtIZiAbQQigTLspJpj/epzR6mGNKqm15SDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738957359; c=relaxed/simple;
	bh=YHaOdBAntq2jmUGBz7TzLBQCIxNN7+UiaoXm+bHH3ow=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VMWnYehd94hvNjzBp9G5Qm6mhWd7BRbiX5Ig7JmF1tjrwPiKrMQYwPChorlODwBYz/jTVu7BOdNI5Rec+NQ05cJU8qBi7mFgGQ1Fzrry4MFRbx9NGSdHb+zQEkswKeXURvY1xTmC6r3TlDDKOcVlcgXaYxk54pzUiKGqKvzt268=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tgUEq-0001XR-Nk; Fri, 07 Feb 2025 20:42:08 +0100
Message-ID: <cfc5b39e21fb214c53fda3276847b8e235af818f.camel@pengutronix.de>
Subject: Re: [PATCH v6 08/14] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
From: Lucas Stach <l.stach@pengutronix.de>
To: Damon Ding <damon.ding@rock-chips.com>, heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org,  vkoul@kernel.org, sebastian.reichel@collabora.com, 
 cristian.ciocaltea@collabora.com, dmitry.baryshkov@linaro.org, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org
Date: Fri, 07 Feb 2025 20:42:06 +0100
In-Reply-To: <20250123100747.1841357-9-damon.ding@rock-chips.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
	 <20250123100747.1841357-9-damon.ding@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hi Damon,

Am Donnerstag, dem 23.01.2025 um 18:07 +0800 schrieb Damon Ding:
> Move drm_of_find_panel_or_bridge() a little later and combine it with
> component_add() into a new function rockchip_dp_link_panel(). The functio=
n
> will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
> aiding to support for obtaining the eDP panel via the DP AUX bus.
>=20
> If failed to get the panel from the DP AUX bus, it will then try the othe=
r
> way to get panel information through the platform bus.
>=20
The changes in this patch effectively revert 86caee745e45
("drm/rockchip: analogix_dp: allow to work without panel"). Please
correct this in the next revision of this patchset.

Regards,
Lucas

> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>=20
> ---
>=20
> Changes in v4:
> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>   component_add() when getting panel from the DP AUX bus
>=20
> Changes in v5:
> - Use the functions exported by the Analogix side to get the pointers of
>   struct analogix_dp_plat_data and struct drm_dp_aux.
> - Use dev_err() instead of drm_err() in rockchip_dp_poweron().
>=20
> Changes in v6:
> - Keep drm_err() in rockchip_dp_poweron()
> - Pass 'dp' in drm_...() rather than 'dp->drm_dev'
> ---
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 37 ++++++++++++++-----
>  1 file changed, 28 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index 13f32aeea7ca..004b1b68d1cf 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -393,11 +393,27 @@ static const struct component_ops rockchip_dp_compo=
nent_ops =3D {
>  	.unbind =3D rockchip_dp_unbind,
>  };
> =20
> +static int rockchip_dp_link_panel(struct drm_dp_aux *aux)
> +{
> +	struct analogix_dp_plat_data *plat_data =3D analogix_dp_aux_to_plat_dat=
a(aux);
> +	struct rockchip_dp_device *dp =3D pdata_encoder_to_dp(plat_data);
> +	int ret;
> +
> +	ret =3D drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0, &plat_data-=
>panel, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D component_add(dp->dev, &rockchip_dp_component_ops);
> +	if (ret)
> +		return ret;
> +
> +	return ret;
> +}
> +
>  static int rockchip_dp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	const struct rockchip_dp_chip_data *dp_data;
> -	struct drm_panel *panel =3D NULL;
>  	struct rockchip_dp_device *dp;
>  	struct resource *res;
>  	int i;
> @@ -407,10 +423,6 @@ static int rockchip_dp_probe(struct platform_device =
*pdev)
>  	if (!dp_data)
>  		return -ENODEV;
> =20
> -	ret =3D drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> -	if (ret < 0 && ret !=3D -ENODEV)
> -		return ret;
> -
>  	dp =3D devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
>  	if (!dp)
>  		return -ENOMEM;
> @@ -434,7 +446,6 @@ static int rockchip_dp_probe(struct platform_device *=
pdev)
> =20
>  	dp->dev =3D dev;
>  	dp->adp =3D ERR_PTR(-ENODEV);
> -	dp->plat_data.panel =3D panel;
>  	dp->plat_data.dev_type =3D dp->data->chip_type;
>  	dp->plat_data.power_on =3D rockchip_dp_poweron;
>  	dp->plat_data.power_off =3D rockchip_dp_powerdown;
> @@ -450,9 +461,17 @@ static int rockchip_dp_probe(struct platform_device =
*pdev)
>  	if (IS_ERR(dp->adp))
>  		return PTR_ERR(dp->adp);
> =20
> -	ret =3D component_add(dev, &rockchip_dp_component_ops);
> -	if (ret)
> -		return ret;
> +	ret =3D devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp), rockc=
hip_dp_link_panel);
> +	if (ret) {
> +		if (ret !=3D -ENODEV) {
> +			drm_err(dp, "failed to populate aux bus : %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret =3D rockchip_dp_link_panel(analogix_dp_get_aux(dp->adp));
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	return 0;
>  }

