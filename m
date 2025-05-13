Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726C4221F2F
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128102; cv=none; b=FTLipUXDTc4W9soFEqv5TbsbU/MYEfaWbWKuzV7PpgNWUo++c22NwhKJqWME03pEZ+5iwoP/dx0s+FVkIkeuaCFR3Fmcw43xRRAHho9pOYVKMRC0uzW1Lg5JoF3B7Jqs6DIzAwK718DzbcrASV8jWMX2xr6UyAdkfmFCqv+mMLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128102; c=relaxed/simple;
	bh=zI11X3TEAqDD/ZmmKc13sUhGr+7EmnEE9HGeNRaiarc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bxc2N4taWHtmtEJ+dVqThMCzo2TfyWEXP6JyuwpDUhf+Z0BfB+0Szx4UY9aQNHMuQ/WY6MKQI5fHPUDblhcAupHNRhu+U4qAY/yA/wMlS9lsH2luxPCMTTJeCrT8gDhLFZhpCgvGk1Xv6mAJYrCBHVkfLzANzDLCDP4WEMj+mK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uElow-0008Gg-Bp; Tue, 13 May 2025 11:21:06 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uElot-002W0h-2r;
	Tue, 13 May 2025 11:21:04 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uElou-0004Y5-0o;
	Tue, 13 May 2025 11:21:04 +0200
Message-ID: <d25aa4b10e2ebefb36e0db03123b404044e71ec1.camel@pengutronix.de>
Subject: Re: [PATCH v9 4/6] reset: spacemit: add support for SpacemiT CCU
 resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr,  dlan@gentoo.org
Cc: heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 13 May 2025 11:21:04 +0200
In-Reply-To: <20250512183212.3465963-5-elder@riscstar.com>
References: <20250512183212.3465963-1-elder@riscstar.com>
	 <20250512183212.3465963-5-elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Mo, 2025-05-12 at 13:32 -0500, Alex Elder wrote:
> Implement reset support for SpacemiT CCUs.  A SpacemiT reset controller
> device is an auxiliary device associated with a clock controller (CCU).
>=20
> This initial patch defines the reset controllers for the MPMU, APBC, and
> MPMU CCUs, which already define clock controllers.
>=20
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/reset/Kconfig          |   9 ++
>  drivers/reset/Makefile         |   1 +
>  drivers/reset/reset-spacemit.c | 246 +++++++++++++++++++++++++++++++++
>  3 files changed, 256 insertions(+)
>  create mode 100644 drivers/reset/reset-spacemit.c
>
[...]
> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemi=
t.c
> new file mode 100644
> index 0000000000000..eff67bdc8adba
> --- /dev/null
> +++ b/drivers/reset/reset-spacemit.c
> @@ -0,0 +1,246 @@
[...]
> +static int spacemit_reset_controller_register(struct device *dev,
> +			       struct ccu_reset_controller *controller)

Align to open parenthesis, line length is fine.

> +{
> +	struct reset_controller_dev *rcdev =3D &controller->rcdev;
> +
> +	rcdev->ops =3D &spacemit_reset_control_ops;
> +	rcdev->owner =3D THIS_MODULE;
> +	rcdev->of_node =3D dev->of_node;
> +	rcdev->nr_resets =3D controller->data->count;
> +
> +	return devm_reset_controller_register(dev, &controller->rcdev);
> +}
> +
> +static int spacemit_reset_probe(struct auxiliary_device *adev,
> +				const struct auxiliary_device_id *id)
> +{
> +	struct spacemit_ccu_adev *rdev =3D to_spacemit_ccu_adev(adev);
> +	const void *data =3D (void *)id->driver_data;

Unnecessary (void *) detour. Just cast to (const struct
ccu_reset_controller_data *) directly. Otherwise,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>


regards
Philipp
