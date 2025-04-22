Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA721F1509
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314642; cv=none; b=QoI4eKoyWN+z5EESxy14CO/Q+EV+/AWKFYlJs/tQmUr03tknlqZC0rCPjfF6H0QdmVpTeOXYLUj53GJi5dZu151w6iOeYddkQgnQ/3ux3ZJu1RzEwy8uZa1FjnOarpWey/uqXpEUgaLwSelpifcUdvx7sxR4akVK7dJYaulie38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314642; c=relaxed/simple;
	bh=JplzZFbnWUrZ+eRn/IcwQvHvUCfxCkbtXyfE+EWU4+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JxzCjszro+IgO6Zwv+cvJ/gsemEnWUvtHWTq7AS3sYDVmdZe9zoh55ZDvSW18j44ryxoPQL6UvNcpu+PRPtISmMMovNB0UnAzeTccNbAyANW90EwBT/dhWLS7wMZRKVvjES7fVaeGOI5cBmQhP0TqAlDHxKunldJJttBbG75o4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=SgG+lzHM; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="SgG+lzHM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=57lyUIEE7vSaZrCMWMWd1cdH5EZ4FUPWsTI4YfTuZfY=; b=SgG+lzHMUCx8/+Lz3f5uoburLu
	CQNnXEe4FEviGlERtVrUbzbdeZf/HnYumB4MsUIGyFmYvtk4xtUWLPl67qT9/96LP/S+PsWi0WJiU
	yBXkPJO0ZUOa8K4IkpQYDlYyK2lwdL1XqY6d7PvhEdKkM+o029yBlWJz9SkrX18Of40a/7hpFrtk2
	P+ulQSVjx3Yn2nqriwP4OR7GgEjO3wEMNZ2X0ZQ7RM0kASFnjb3ZbJfvtrnTcQ75RsUdY2ri6Vm3p
	q1vSOQG1gBwKecGYZU55CexPpFA+gRCqbhnOds9dCcXuaiSjQFdwsjllH16mhs/7nfJm+2y+7Nvc0
	HLSeeJWw==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u7A3v-00014B-J1; Tue, 22 Apr 2025 11:37:07 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: linux-rockchip@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] nvmem: rockchip-otp: Handle internal word_size in main reg_read
 op
Date: Tue, 22 Apr 2025 11:37:06 +0200
Message-ID: <3635379.iIbC2pHGDl@diego>
In-Reply-To: <20250316191900.1858944-1-jonas@kwiboo.se>
References: <20250316191900.1858944-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Sonntag, 16. M=C3=A4rz 2025, 20:18:58 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Jonas Karlman:
> Rockchip SoCs RK3576 and RK3588 read data from the OTP using 32-bit
> words instead of normal 8-bit bytes. Similar RK3506, RK3528, RK3562 and
> RK3568 will read data from OTP using 16-bit words.
>=20
> The nvmem core stride and word_size cannot fully be used as cells is not
> always aligned. Continue to report a stride=3D1 and word_size=3D1 in
> nvmem_config and instead handle use of SoC specific word_size internally
> in the driver.
>=20
> Move current SoC specific word_size handling from the RK3588 read_reg
> operation to the main read_reg operation to help simplify the SoC
> specific read_reg operation and allow code reuse in a future RK3568
> reg_read operation.
>=20
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

On both rk3576 and rk3588 compared nvmem content before and after
the change, so

Tested-by: Heiko Stuebner <heiko@sntech.de>


> ---
> This closely matches how I refactored the Rockchip eFUSE and OTP driver
> in mainline U-Boot to handle word/block reads back in 2023, see [1].
>=20
> [1] http://lore.kernel.org/r/20230222224436.1570224-3-jonas@kwiboo.se/
> ---
>  drivers/nvmem/rockchip-otp.c | 72 ++++++++++++++++++++----------------
>  1 file changed, 40 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
> index d88f12c53242..45bbb6147fb7 100644
> --- a/drivers/nvmem/rockchip-otp.c
> +++ b/drivers/nvmem/rockchip-otp.c
> @@ -59,7 +59,6 @@
>  #define RK3588_OTPC_AUTO_EN		0x08
>  #define RK3588_OTPC_INT_ST		0x84
>  #define RK3588_OTPC_DOUT0		0x20
> -#define RK3588_NBYTES			4
>  #define RK3588_BURST_NUM		1
>  #define RK3588_BURST_SHIFT		8
>  #define RK3588_ADDR_SHIFT		16
> @@ -69,6 +68,7 @@
>  struct rockchip_data {
>  	int size;
>  	int read_offset;
> +	int word_size;
>  	const char * const *clks;
>  	int num_clks;
>  	nvmem_reg_read_t reg_read;
> @@ -185,48 +185,28 @@ static int px30_otp_read(void *context, unsigned in=
t offset,
>  }
> =20
>  static int rk3588_otp_read(void *context, unsigned int offset,
> -			   void *val, size_t bytes)
> +			   void *val, size_t count)
>  {
>  	struct rockchip_otp *otp =3D context;
> -	unsigned int addr_start, addr_end, addr_len;
> -	int ret, i =3D 0;
> -	u32 data;
> -	u8 *buf;
> -
> -	addr_start =3D round_down(offset, RK3588_NBYTES) / RK3588_NBYTES;
> -	addr_end =3D round_up(offset + bytes, RK3588_NBYTES) / RK3588_NBYTES;
> -	addr_len =3D addr_end - addr_start;
> -	addr_start +=3D otp->data->read_offset / RK3588_NBYTES;
> -
> -	buf =3D kzalloc(array_size(addr_len, RK3588_NBYTES), GFP_KERNEL);
> -	if (!buf)
> -		return -ENOMEM;
> +	u32 *buf =3D val;
> +	int ret;
> =20
> -	while (addr_len--) {
> -		writel((addr_start << RK3588_ADDR_SHIFT) |
> +	while (count--) {
> +		writel((offset++ << RK3588_ADDR_SHIFT) |
>  		       (RK3588_BURST_NUM << RK3588_BURST_SHIFT),
>  		       otp->base + RK3588_OTPC_AUTO_CTRL);
>  		writel(RK3588_AUTO_EN, otp->base + RK3588_OTPC_AUTO_EN);
> =20
>  		ret =3D rockchip_otp_wait_status(otp, RK3588_OTPC_INT_ST,
>  					       RK3588_RD_DONE);
> -		if (ret < 0) {
> +		if (ret) {
>  			dev_err(otp->dev, "timeout during read setup\n");
> -			goto read_end;
> +			return ret;
>  		}
> =20
> -		data =3D readl(otp->base + RK3588_OTPC_DOUT0);
> -		memcpy(&buf[i], &data, RK3588_NBYTES);
> -
> -		i +=3D RK3588_NBYTES;
> -		addr_start++;
> +		*buf++ =3D readl(otp->base + RK3588_OTPC_DOUT0);
>  	}
> =20
> -	memcpy(val, buf + offset % RK3588_NBYTES, bytes);
> -
> -read_end:
> -	kfree(buf);
> -
>  	return ret;
>  }
> =20
> @@ -234,7 +214,7 @@ static int rockchip_otp_read(void *context, unsigned =
int offset,
>  			     void *val, size_t bytes)
>  {
>  	struct rockchip_otp *otp =3D context;
> -	int ret;
> +	int ret, word_size;
> =20
>  	if (!otp->data || !otp->data->reg_read)
>  		return -EINVAL;
> @@ -245,8 +225,34 @@ static int rockchip_otp_read(void *context, unsigned=
 int offset,
>  		return ret;
>  	}
> =20
> -	ret =3D otp->data->reg_read(context, offset, val, bytes);
> +	offset +=3D otp->data->read_offset;
> +	word_size =3D otp->data->word_size;
> +
> +	if (word_size > 1) {
> +		unsigned int addr_start, addr_end;
> +		size_t count;
> +		u8 *buf;
> +
> +		addr_start =3D offset / word_size;
> +		addr_end =3D DIV_ROUND_UP(offset + bytes, word_size);
> +		count =3D addr_end - addr_start;
> +
> +		buf =3D kzalloc(array_size(count, word_size), GFP_KERNEL);
> +		if (!buf) {
> +			ret =3D -ENOMEM;
> +			goto err;
> +		}
> +
> +		ret =3D otp->data->reg_read(context, addr_start, buf, count);
> +		if (!ret)
> +			memcpy(val, buf + (offset % word_size), bytes);
> +
> +		kfree(buf);
> +	} else {
> +		ret =3D otp->data->reg_read(context, offset, val, bytes);
> +	}
> =20
> +err:
>  	clk_bulk_disable_unprepare(otp->data->num_clks, otp->clks);
> =20
>  	return ret;
> @@ -259,7 +265,7 @@ static struct nvmem_config otp_config =3D {
>  	.type =3D NVMEM_TYPE_OTP,
>  	.read_only =3D true,
>  	.stride =3D 1,
> -	.word_size =3D 1,
> +	.word_size =3D sizeof(u8),
>  	.reg_read =3D rockchip_otp_read,
>  };
> =20
> @@ -277,6 +283,7 @@ static const struct rockchip_data px30_data =3D {
>  static const struct rockchip_data rk3576_data =3D {
>  	.size =3D 0x100,
>  	.read_offset =3D 0x700,
> +	.word_size =3D sizeof(u32),
>  	.clks =3D px30_otp_clocks,
>  	.num_clks =3D ARRAY_SIZE(px30_otp_clocks),
>  	.reg_read =3D rk3588_otp_read,
> @@ -289,6 +296,7 @@ static const char * const rk3588_otp_clocks[] =3D {
>  static const struct rockchip_data rk3588_data =3D {
>  	.size =3D 0x400,
>  	.read_offset =3D 0xc00,
> +	.word_size =3D sizeof(u32),
>  	.clks =3D rk3588_otp_clocks,
>  	.num_clks =3D ARRAY_SIZE(rk3588_otp_clocks),
>  	.reg_read =3D rk3588_otp_read,
>=20




