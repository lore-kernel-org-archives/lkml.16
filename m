Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE5B1922F4
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748376254; cv=none; b=l0Mjwm4g66ZCJazQkrg+I1hsG38LBqQxBIp7KnB0XRzek3hC2eI+UWqWvRX+3gSfIQkoNl0Omv5cWW3VtsLPxxkFUoWHQb6BjdobI+BsqnhvLxKqWud2rqnJD9gUYFQWVDlo0mo6HTFiGm9JWl7Gw3FG4ZOZiYQ4Xh4BUknR5mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748376254; c=relaxed/simple;
	bh=3KUUjHrhoNBtVeix8GKFlMg91NqI6eHq4vY9+VihZzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jb5uqMxfFBB3GgTRc/xUwM1sneuy4+pk4tbHCvZuWuLdCKbiw22tbqkd+FmRGihph2jBGPGJTDFsFMANrH4Akdxe5H1KVHRyDO7gQNZwZDZbY6GYGSJl/wW/vgc1UlyTdTprhNuwbU6RqABeHkDUzNrNLXtIuJoiqNCVXR8JI7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=2b7umvc4; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="2b7umvc4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=+l1CShGqzt+9D2PPlurs5WyZsGLSUXWJX83KnmCBDvw=; b=2b7umvc4kxsjdWc42R/9hUS+Ja
	xQt3qo1sfFptrcKJLM5QXwV8PSlWjILYgSqlTpGvUobIN2AwD5FCKqNXFX8MgXhVUEKKHlNKyRHlT
	xPw4dLdJJACJWQqZzm2aA3Mf/nIicj90oR9E1aDNYmomLHFBN7/riREqHoPys19W8QzNCRLPhlLhp
	EiwiHOtHoLoD1DKttMsoAcVKFSAJiSEwNGyD9mSU1LCMhPRSEpmauw8Jv6u889f7jz3jAVAVuTNTU
	Sz0sSmllVRgII+TJbVtpdgFM0PBo5Hsr30OnNurSR8Xn/f5n1zucxTQzc0YH0mnot4O59xdlH60n3
	L7Aw2EUA==;
Received: from i53875bdb.versanet.de ([83.135.91.219] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uK0WS-0000Xq-LL; Tue, 27 May 2025 22:03:40 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: dianders@chromium.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, dri-devel@lists.freedesktop.org
Cc: dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, l.stach@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Damon Ding <damon.ding@rock-chips.com>,
 Damon Ding <damon.ding@rock-chips.com>
Subject:
 Re: [PATCH v8] drm/bridge: analogix_dp: Remove the unnecessary calls to
 clk_disable_unprepare() during probing
Date: Tue, 27 May 2025 22:03:39 +0200
Message-ID: <2309383.iZASKD2KPV@diego>
In-Reply-To: <20250302083043.3197235-1-damon.ding@rock-chips.com>
References: <20250302083043.3197235-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Sonntag, 2. M=C3=A4rz 2025, 09:30:43 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Damon Ding:
> With the commit f37952339cc2 ("drm/bridge: analogix_dp: handle clock via
> runtime PM"), the PM operations can help enable/disable the clock. The
> err_disable_clk label and clk_disable_unprepare() operations are no
> longer necessary because the analogix_dp_resume() will not be called
> during probing.
>=20
> Fixes: f37952339cc2 ("drm/bridge: analogix_dp: handle clock via runtime P=
M")
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

This patch seems to have fallen through the cracks?

dp->clock never gets enabled in analogix_dp_probe(), so reaching that
error handling code would create a enable-disable mismatch for the
dp>clock.


> ---
>=20
> Picked from:
> https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D936932
>=20
> Changes in v8:
> - Fix the conflict because of commit 43c00fb1a518 ("drm/bridge:
>   analogix_dp: Use devm_platform_ioremap_resource()")
> ---
>  .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index f6e4bdc05ba0..817070613b03 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1605,10 +1605,8 @@ analogix_dp_probe(struct device *dev, struct analo=
gix_dp_plat_data *plat_data)
>  	}
> =20
>  	dp->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(dp->reg_base)) {
> -		ret =3D PTR_ERR(dp->reg_base);
> -		goto err_disable_clk;
> -	}
> +	if (IS_ERR(dp->reg_base))
> +		return ERR_CAST(dp->reg_base);
> =20
>  	dp->force_hpd =3D of_property_read_bool(dev->of_node, "force-hpd");
> =20
> @@ -1620,8 +1618,7 @@ analogix_dp_probe(struct device *dev, struct analog=
ix_dp_plat_data *plat_data)
>  	if (IS_ERR(dp->hpd_gpiod)) {
>  		dev_err(dev, "error getting HDP GPIO: %ld\n",
>  			PTR_ERR(dp->hpd_gpiod));
> -		ret =3D PTR_ERR(dp->hpd_gpiod);
> -		goto err_disable_clk;
> +		return ERR_CAST(dp->hpd_gpiod);
>  	}
> =20
>  	if (dp->hpd_gpiod) {
> @@ -1641,8 +1638,7 @@ analogix_dp_probe(struct device *dev, struct analog=
ix_dp_plat_data *plat_data)
> =20
>  	if (dp->irq =3D=3D -ENXIO) {
>  		dev_err(&pdev->dev, "failed to get irq\n");
> -		ret =3D -ENODEV;
> -		goto err_disable_clk;
> +		return ERR_PTR(-ENODEV);
>  	}
> =20
>  	ret =3D devm_request_threaded_irq(&pdev->dev, dp->irq,
> @@ -1651,15 +1647,11 @@ analogix_dp_probe(struct device *dev, struct anal=
ogix_dp_plat_data *plat_data)
>  					irq_flags, "analogix-dp", dp);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to request irq\n");
> -		goto err_disable_clk;
> +		return ERR_PTR(ret);
>  	}
>  	disable_irq(dp->irq);
> =20
>  	return dp;
> -
> -err_disable_clk:
> -	clk_disable_unprepare(dp->clock);
> -	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_probe);
> =20
>=20




