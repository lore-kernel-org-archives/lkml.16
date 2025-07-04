Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425212D0C98;
	Fri,  4 Jul 2025 11:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751628612; cv=none; b=cHGQ7Q5+p2z5nytndJkY1jHoNJghM1DBmY/hjIHvT4mbYvkcr2KLblEGBS93WKLOIG0uTauAPbgwqMHsaC9gSn8bItm/SQPoPY0HB7jDEEdaOt5013A35p5YGztnlg07LR77qpFToty0yAcWjAtmnvRvohATi4EtL1l6xissswk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751628612; c=relaxed/simple;
	bh=LBBKUZPE2gWKJIlUUTuZzM4rUYU+U7D59WGqtSEG+zU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dZSLO5ke68K5hWqz12gaSpZqzgdALLShetov/4/3OgWAtAABqiJUVdDWVJjEzPn/E+OFmal6gdhyh1TFXcQ3SBNwwGxVtF4Dp/29YwTJGhky2NuHdH+1Cx8KMd61+OWj/UztaxD9pHuVRcGlhirya3vnYy46saiAj5EzueOgy2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=OIsG7Ij3; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=W4gdiY2u reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="OIsG7Ij3";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="W4gdiY2u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751628608; x=1783164608;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oQLSCU6s7tadJXW3ijfkRaS6QjwulBRxirc1q6sY6so=;
  b=OIsG7Ij3AG2IZL3NvAndB4AIBWeWdo28Ty9QKZqB9sStL0AenSZr/cGx
   CgqALvouK5PdeRlAarSOfrXRgYbbGCL4kwkFYXDlsKYSgcP7lkPLXr6Kt
   17iUHwTGam1pN2gY+9U6IiJ913coctf/bK8nH86ZNFaMtXVMTwPd9osIY
   qr6rzJ1oycjjRjIUYi5CbGi13yyIsWr4RnLpvQ6sALQr391oBViziSRGD
   lj1DR6e7+FqZrVlILIyY4Fc7KKjobRse9P14U8K1kPCQk5hi9NFwFshEB
   Sy8Eu5S0S288doXeThQJW1bsgs4XqNTCGc7k8eJnjrGOmGY45/x5+C1iZ
   w==;
X-CSE-ConnectionGUID: jSRuNTPpRsydYLYRPhbXQg==
X-CSE-MsgGUID: R+RKeJOgQ+S5uDN6S6S9fA==
X-IronPort-AV: E=Sophos;i="6.16,287,1744063200"; 
   d="scan'208";a="45031135"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Jul 2025 13:30:04 +0200
X-CheckPoint: {6867BB3C-30-4FC15ADB-CD71293B}
X-MAIL-CPID: 407389F97A04FFAD1E4F8CCE6D42EE93_0
X-Control-Analysis: str=0001.0A006396.6867BB4C.0063,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC794165607;
	Fri,  4 Jul 2025 13:29:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751628600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oQLSCU6s7tadJXW3ijfkRaS6QjwulBRxirc1q6sY6so=;
	b=W4gdiY2u+KnVU6AEdD0acwe3gCkG8t/uyJscqkMzNXOpRFSqpVNFfLN9jFk/1GB+71IMXE
	kWwh6jGmZ+hBi4ZZ98dPY9+hZRc8zDTWF5S42ufc3p0vo0uB7aULUruYxiNzkCrNAT/dIp
	Qpw3v6qWfXz7EwZcnEe677+Ytex/+2ODif3jwmve/nnfYpoL1eTfa7lWOOciCU3ukcS0hr
	d0eYqEiAt1eRyuRZmrjbZV+VihawcFagHfXxm7z1ahKQ7+MsGLI4O48PqNOEl8w9aK2jpC
	vr9n7V6SlBwd92LVSYrWcBgrTkMgNkpj7p61/UB0iymUekecOOfIsYbbIAq8Aw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 04/14] drm/imx: dc-fu: Fix dimensions
Date: Fri, 04 Jul 2025 13:29:57 +0200
Message-ID: <3702593.R56niFO833@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250704-imx8-dc-prefetch-v1-4-784c03fd645f@nxp.com>
References:
 <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-4-784c03fd645f@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

thanks for the patch.

Am Freitag, 4. Juli 2025, 11:03:51 CEST schrieb Liu Ying:
> Fix off-by-one issue in LINEWIDTH, LINECOUNT, FRAMEWIDTH and FRAMEHEIGHT
> macro definitions.  The first two macros are used to set a fetchunit's
> source buffer dimension and the other two are used to set a fetchunit's
> frame dimension.  It appears that display controller itself works ok
> without this fix, however, it enters panic mode when prefetch engine(DPRC
> and PRGs) attaches to it without this fix.
>=20
> Fixes: 0e177d5ce01c ("drm/imx: Add i.MX8qxp Display Controller pixel engi=
ne")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/gpu/drm/imx/dc/dc-fu.c | 4 ++--
>  drivers/gpu/drm/imx/dc/dc-fu.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-f=
u.c
> index f94c591c815891468a5c2a940076963eeaa4d51c..b36d3034b8d5962eaab212b6b=
65ebbb5c29f978c 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.c
> @@ -31,8 +31,8 @@
>  #define STRIDE(x)			FIELD_PREP(STRIDE_MASK, (x) - 1)
> =20
>  /* SOURCEBUFFERDIMENSION */
> -#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
> -#define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x))
> +#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x) - 1)
> +#define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x) - 1)
> =20
>  /* LAYEROFFSET */
>  #define LAYERXOFFSET(x)			FIELD_PREP(GENMASK(14, 0), (x))
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-f=
u.h
> index e016e1ea5b4e0471cf6627782603e72d0475c4e8..518d1af49f5ae9d4f67da5e6c=
2e80abd7e962120 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.h
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.h
> @@ -38,8 +38,8 @@
>  #define SOURCEBUFFERENABLE		BIT(31)
> =20
>  /* FRAMEDIMENSIONS */
> -#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
> -#define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x))
> +#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x) - 1)
> +#define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x) - 1)
> =20
>  /* CONTROL */
>  #define INPUTSELECT_MASK		GENMASK(4, 3)
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


