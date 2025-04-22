Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804D11531E9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316442; cv=none; b=LLvKt5IT/DjE7X/NdJL1lkiHOiY+8WJcjLF8/fd1bHpQqfI+xfEVNuY1VgJSgeob8DOQ4eJL5EUzdff+64byD/jzMWIsm+hhEhhczCb98kLi1yBLIhQdULZYyCZUhHXoC8kyOnXqEkFFzp3uEOayPtTY6cNeWmi50jyyKllEUYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316442; c=relaxed/simple;
	bh=PmD4GtZRFGNjIeQ1r1cZmGZYv/Nu591RQrscnwRc+Yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cn2XTtYf7KEfZKCDIsSPS1AXvydqppHezGYFQYJjeyoSOkIDOBy1wfK4qa00H2koyLPWWubXtcT5cWCnz3d6xSZcvDBNnTG+vHF4Yx8oTM/LaW9iUCkSnn187VbLWNI7YnD4d0DP6DTRtUacPktMEKT206jGNH00CDBZitH5vtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0ajUgpR8; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0ajUgpR8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=kBFonbp1846gJUgowkmr65IS6mdF3RNeO3rgyd2Q/Eo=; b=0ajUgpR85H/WB0VfM6ExsXsJZ6
	r4c2SR6axdXYi7LGFGDp6+O0HRmFGJFhx+QMDUHgKLoMRUV1Tr5PQnRmRNgra4TMkPJWiinWz1ShH
	0FpICnCOjDKhCwrpEv+oX6tNXPYM+KDuOdyvY8bQZDTasOgWgX1ShFf9xXPHve/SZ4fc9cz2x7VIC
	/EbWB83m8i0f8X0iWBvP4/A9jCjOSKC/BLF6i1Ym5l4LS8UxJ+Gpd/CzbbwMXMrhvvsrPYoWDzVdQ
	dfIsfan5RLo4BsUIXaelLE7IZEa0SKsIZKmIBpyuWO/fZdtsxPlTik9RrxFV+vD8dler1Ljc2B/Q+
	PoV+iNhA==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u7AX5-0001S6-VN; Tue, 22 Apr 2025 12:07:16 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 2/3] nvmem: rockchip-otp: Add support for rk3568-otp
Date: Tue, 22 Apr 2025 12:07:15 +0200
Message-ID: <6053552.MhkbZ0Pkbq@diego>
In-Reply-To: <20250415103203.82972-3-kever.yang@rock-chips.com>
References:
 <20250415103203.82972-1-kever.yang@rock-chips.com>
 <20250415103203.82972-3-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 15. April 2025, 12:32:02 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Kever Yang:
> From: Finley Xiao <finley.xiao@rock-chips.com>
>=20
> This adds the necessary data for handling otp the rk3568.
>=20
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>


Reviewed-by: Heiko Stuebner <heiko@sntech.de>

On a Quartz64b
Tested-by: Heiko Stuebner <heiko@sntech.de>


> ---
>=20
> Changes in v3:
> - rebase on rk3576 and rk3528, changes suggest by Jonas
>=20
> Changes in v2: None
>=20
>  drivers/nvmem/rockchip-otp.c | 69 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>=20
> diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
> index 45bbb6147fb7..cfb69bc58869 100644
> --- a/drivers/nvmem/rockchip-otp.c
> +++ b/drivers/nvmem/rockchip-otp.c
> @@ -27,6 +27,7 @@
>  #define OTPC_USER_CTRL			0x0100
>  #define OTPC_USER_ADDR			0x0104
>  #define OTPC_USER_ENABLE		0x0108
> +#define OTPC_USER_QP			0x0120
>  #define OTPC_USER_Q			0x0124
>  #define OTPC_INT_STATUS			0x0304
>  #define OTPC_SBPI_CMD0_OFFSET		0x1000
> @@ -184,6 +185,58 @@ static int px30_otp_read(void *context, unsigned int=
 offset,
>  	return ret;
>  }
> =20
> +static int rk3568_otp_read(void *context, unsigned int offset, void *val,
> +			   size_t count)
> +{
> +	struct rockchip_otp *otp =3D context;
> +	u16 *buf =3D val;
> +	u32 otp_qp;
> +	int ret;
> +
> +	ret =3D rockchip_otp_reset(otp);
> +	if (ret) {
> +		dev_err(otp->dev, "failed to reset otp phy\n");
> +		return ret;
> +	}
> +
> +	ret =3D rockchip_otp_ecc_enable(otp, true);
> +	if (ret) {
> +		dev_err(otp->dev, "rockchip_otp_ecc_enable err\n");
> +		return ret;
> +	}
> +
> +	writel(OTPC_USE_USER | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
> +	udelay(5);
> +
> +	while (count--) {
> +		writel(offset++ | OTPC_USER_ADDR_MASK,
> +		       otp->base + OTPC_USER_ADDR);
> +		writel(OTPC_USER_FSM_ENABLE | OTPC_USER_FSM_ENABLE_MASK,
> +		       otp->base + OTPC_USER_ENABLE);
> +
> +		ret =3D rockchip_otp_wait_status(otp, OTPC_INT_STATUS,
> +					       OTPC_USER_DONE);
> +		if (ret) {
> +			dev_err(otp->dev, "timeout during read setup\n");
> +			goto read_end;
> +		}
> +
> +		otp_qp =3D readl(otp->base + OTPC_USER_QP);
> +		if (((otp_qp & 0xc0) =3D=3D 0xc0) || (otp_qp & 0x20)) {
> +			ret =3D -EIO;
> +			dev_err(otp->dev, "ecc check error during read setup\n");
> +			goto read_end;
> +		}
> +
> +		*buf++ =3D readl(otp->base + OTPC_USER_Q);
> +	}
> +
> +read_end:
> +	writel(0x0 | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
> +
> +	return ret;
> +}
> +
>  static int rk3588_otp_read(void *context, unsigned int offset,
>  			   void *val, size_t count)
>  {
> @@ -280,6 +333,18 @@ static const struct rockchip_data px30_data =3D {
>  	.reg_read =3D px30_otp_read,
>  };
> =20
> +static const char * const rk3568_otp_clocks[] =3D {
> +	"otp", "apb_pclk", "phy", "sbpi",
> +};
> +
> +static const struct rockchip_data rk3568_data =3D {
> +	.size =3D 0x80,
> +	.word_size =3D sizeof(u16),
> +	.clks =3D rk3568_otp_clocks,
> +	.num_clks =3D ARRAY_SIZE(rk3568_otp_clocks),
> +	.reg_read =3D rk3568_otp_read,
> +};
> +
>  static const struct rockchip_data rk3576_data =3D {
>  	.size =3D 0x100,
>  	.read_offset =3D 0x700,
> @@ -311,6 +376,10 @@ static const struct of_device_id rockchip_otp_match[=
] =3D {
>  		.compatible =3D "rockchip,rk3308-otp",
>  		.data =3D &px30_data,
>  	},
> +	{
> +		.compatible =3D "rockchip,rk3568-otp",
> +		.data =3D &rk3568_data,
> +	},
>  	{
>  		.compatible =3D "rockchip,rk3576-otp",
>  		.data =3D &rk3576_data,
>=20




