Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5A14431
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 05:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738215136; cv=none; b=qEq2ru4nIDKLJSa3Pk1FUxWoQj7P1ZMjY4qcggrPcFUzkhUTH+znghn2irE+331edqTFZIMPYaFd66wJXp5moX0p/7n3GEDva8OIG0l9f/QuQUBxkl03dPnSZWN71BzbfitKuwF+DwNO+ioHDPOXTBO0AH5dECk5/JnqSKLuBAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738215136; c=relaxed/simple;
	bh=gFQ7g+YN21EUHYN7l+aFFtAggeW26EdwSPTQBPw5JIA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oFg+2mNSYWWrXf95623bV1BNfTgM4ilsOTAaKBp5nAJVhoMfNwpFh7DdtvrOUGtHPE6Xaweh8aDBikhfg9tOqbmZA/km4B/7KECZxjUQCwFpm2K54Qy4AOSFXBoNt9IOlSvBKeaAkpTgxxroZXD64wmbN5C3vzoewSPbqk8uejQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=LlkoPShM; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="LlkoPShM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738215126;
	bh=gFQ7g+YN21EUHYN7l+aFFtAggeW26EdwSPTQBPw5JIA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LlkoPShMIY3IbkAOzb1KgLzgG8YOLulzUiA6dqoqMW35xYM1vY4FUxuyCclGILpYC
	 IJdPkr0eO2aU1S4RZJ82yPuiFDJg5q2lE1bfAyD+54vhNauy/40V0JqAiOYMuAxYT/
	 Q2k+tCOwgqrz3bJvt6XPO1WtELw104gr2JBqDUcfgndWOAnOkSOG1gA3spVGBKw2X1
	 9aURVXj532gT/Q8Joss7WwNumv9lyGY6e597x3LGlGCDJpIVT4x8a5TyuK54JK0ELB
	 enXAG4EEYPp5fOHwx2er0mYGSdpYRP37/eC5/pGcc86wWKG0w6xtA6DqfWNlWyjDAC
	 nRayZo2kLifTw==
Received: from [192.168.68.112] (58-7-158-64.dyn.iinet.net.au [58.7.158.64])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2E8DC73836;
	Thu, 30 Jan 2025 13:32:02 +0800 (AWST)
Message-ID: <daa6bcaf1e612f667c5d5d26b9d515f43985b595.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] drm/aspeed: Use
 devm_platform_get_and_ioremap_resource()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: oushixiong1025@163.com, Joel Stanley <joel@jms.id.au>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Shixiong Ou <oushixiong@kylinos.cn>
Date: Thu, 30 Jan 2025 16:02:00 +1030
In-Reply-To: <20250122030155.57802-1-oushixiong1025@163.com>
References: <20250122030155.57802-1-oushixiong1025@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-01-22 at 11:01 +0800, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>=20
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to
> devm_platform_get_and_ioremap_resource().
>=20
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
> V1 -> V2: Add Missing commit message.
>=20
> =C2=A0drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index a7a6b70220eb..33f81b53771d 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -146,8 +146,7 @@ static int aspeed_gfx_load(struct drm_device
> *drm)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct resource *res;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0res =3D platform_get_resource(=
pdev, IORESOURCE_MEM, 0);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0priv->base =3D devm_ioremap_re=
source(drm->dev, res);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0priv->base =3D devm_platform_g=
et_and_ioremap_resource(pdev, 0,
> &res);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(priv->base))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return PTR_ERR(priv->base);
> =C2=A0

I think I prefer this one:

https://lore.kernel.org/all/20250128-cocci-memory-api-v1-1-0d1609a29587@red=
hat.com/

Andrew
