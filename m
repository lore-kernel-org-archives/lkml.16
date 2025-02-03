Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E576F2054E6
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738612523; cv=none; b=oyAbzLUrMqkd8cc0i0U1PiHIPZwX3JuRyRLhdgnmT5Ua9fprkFH5zoGv1/iAymXN/bKvKXv7T2U8CPksFXfSOHwy0A8888vjlvZ60ViMtEYh0nbXyo3YuKf+hQtpP5AkdHQ5mmkYqtFrI/FVNybjITd2W88BKQfHGx8HK3RvwpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738612523; c=relaxed/simple;
	bh=BDZHGe3iemPGez3pzwaLOI7GEAerd/phH6DGRMNp+Rk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=P/rw+JA228G1OuDjXRIe3AkbJVgAkwSi5E3kCcKGg+FuXLin1OBLWXRyFkSPBVzpsW6CGSYDQxCfaH2YKfiorO+P5W+hzE/2RPPEq1VxQkRInhV+lbi0DpwLpsSMAvQZ+W4wmlQliDzAC9PpMDDtp75jb6/wrPe8YCDrjrm5vyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1qXBYg1T; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1qXBYg1T"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e0e224cbso2640423f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 11:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1738612518; x=1739217318; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8YhPTaXfXtAUhE+gdweJ01mmY6a0qqNP4efKoxnGZQ=;
        b=1qXBYg1TjwCdsYw1Odt8X0bQXtsBYWdL9tur4qFYEiikHgYmD81Yezqmj6qzj3VW2z
         BDYZxJzkClWEpH0ptIYWRoCGkBOqwT68a622ue5PPB0P0ePY6JcmJ75sQeJEypd6HybC
         vKphrpQ2HmMvX7F/PUwbnhL6OC+Y9STxrrV2uRgpjZ+2F5OdS9SeyqDK2XMx7tvPjF84
         M3MFkc0ctwbeDZgWDmVde+5EO1BdEKTF7tm3qp475g+oH2clgEG4kVMba9hj9pMKmCYM
         MpZ3FoqHN57RCXLe48qFplPR30jfAVY4lapWr5ccZkx5SZXYrMmIe6tQJUjpKtyoKuPL
         o9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738612518; x=1739217318;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D8YhPTaXfXtAUhE+gdweJ01mmY6a0qqNP4efKoxnGZQ=;
        b=j5pKFPhfNoGezALXvr1ynwnS+Xw/5zwL3L2dIUGPyolPVIQvd0Zg0zIkmsicBiWHBA
         4sbFw/JG6rlDsc7fAIMODmiYn3ttuNwOdGUVVjyc91pwsDYKDYZ1/vzPjHVe/cLPRlXg
         zV7LdRSOYpol/jLCXVIvdTYTs2p8+T2yy3oqP5UetZIh6x21Gy9wI/u0EMPqYqDN3Gyh
         kcVvLFep9yNbpmGQIhx8yEfWGZyn1zOq4StOoT7utjhwZcpWVSOrZOsOYA0tOOVOSN4m
         JP7y2PY/DKCAKvOclsEN4DRrB950fabr1QyZziAk/S3m53L3HVUF1claBVhlRLmyN2UN
         3Yyw==
X-Forwarded-Encrypted: i=1; AJvYcCU2oPTP1lB37+TK+RDGBT071S7cKRx3XmQSSlyZOJ/oLCIDdCrYikgnQCSKhLGQybab6eBJNpKkZLTSwwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyshQti/Vmt/e4tEyUsDCGcPd+fSYyhJckvoep49tCY30BdS9Mi
	aLCASIMQZG/b2Ci/Ffoi30JNJzMb6bJVKEHugZR9v6YI07R09nRNQ+XDjtWaPf8=
X-Gm-Gg: ASbGncs196Wpqte6CYFgbI4L3FtqMOD9LbWqxwDOl+QA7E1wc6OTWNxvaV7JsA2vcuL
	0Yib/QRB5Us17aHHq7mSVQuJW4gytfx/QIrANautBhA7ZXpujp/Ck+PpNitCnoclyBzVCuW+hmq
	o9nv3oAVMvX5pKYEGddfGztpuX+10NsijcmIeg+J+kH5ak1w5c69FrnGcnGY480AL6cME/dggtW
	qrSZqvlnj6Y2t9jA9/628Aw2N+sJ4LIYBsYOwAjG0do0+r07SZmLHnDIG7iqRnQ/F61FHyDlGbD
	NJCruPkSoxTsyxoF2siqLh4=
X-Google-Smtp-Source: AGHT+IGUb0hkRoS5GVIYb0W1IYzz8SmBTmBgFWuSomLYc+ljWVnKU0RMxTGBNhLRiNl/wb16fxed3A==
X-Received: by 2002:a5d:6d86:0:b0:38c:5c7a:dfae with SMTP id ffacd0b85a97d-38c5c7ae299mr16338581f8f.43.1738612518074;
        Mon, 03 Feb 2025 11:55:18 -0800 (PST)
Received: from localhost ([2a02:a03f:6bc3:6b01:62c7:350e:556e:d0f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122e59sm13824214f8f.55.2025.02.03.11.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 11:55:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Feb 2025 20:55:17 +0100
Message-Id: <D7J2P81TEPM2.3I05E0D61QV6Y@fairphone.com>
Cc: <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <phone-devel@vger.kernel.org>,
 <linux@mainlining.org>, <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH 2/2] Input: goodix_berlin - Add support for Berlin-A
 series
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Jens Reidel" <adrian@travitia.xyz>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bastien Nocera" <hadess@hadess.net>, "Hans de Goede"
 <hdegoede@redhat.com>, "Neil Armstrong" <neil.armstrong@linaro.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250203174309.21574-1-adrian@travitia.xyz>
 <20250203174309.21574-3-adrian@travitia.xyz>
In-Reply-To: <20250203174309.21574-3-adrian@travitia.xyz>

On Mon Feb 3, 2025 at 6:43 PM CET, Jens Reidel wrote:
> The current implementation of the goodix_berlin driver lacks support for
> revisions A and B of the Berlin IC. This change adds support for the
> gt9897 IC, which is a Berlin-A revision part.
>
> The differences between revision D and A are rather minor, a handful of
> address changes and a slightly larger read buffer. They were taken from
> the driver published by Goodix, which does a few more things that don't
> appear to be necessary for the touchscreen to work properly.

Thanks for sending this, works fine on Fairphone 5 on v6.14-rc1 kernel,
after also applying these general fixes:
https://lore.kernel.org/linux-input/20250103-goodix-berlin-fixes-v1-0-b0147=
37b08b2@fairphone.com/

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Regards
Luca

>
> Signed-off-by: Jens Reidel <adrian@travitia.xyz>
> ---
>  drivers/input/touchscreen/goodix_berlin.h     |  9 ++++
>  .../input/touchscreen/goodix_berlin_core.c    | 27 +++++++++---
>  drivers/input/touchscreen/goodix_berlin_i2c.c |  6 ++-
>  drivers/input/touchscreen/goodix_berlin_spi.c | 44 +++++++++++++++----
>  4 files changed, 72 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/to=
uchscreen/goodix_berlin.h
> index 38b6f9ddbdef..a5232e58c166 100644
> --- a/drivers/input/touchscreen/goodix_berlin.h
> +++ b/drivers/input/touchscreen/goodix_berlin.h
> @@ -12,6 +12,15 @@
> =20
>  #include <linux/pm.h>
> =20
> +enum goodix_berlin_ic_type {
> +	IC_TYPE_BERLIN_A,
> +	IC_TYPE_BERLIN_D,
> +};
> +
> +struct goodix_berlin_ic_data {
> +	enum goodix_berlin_ic_type ic_type;
> +};
> +
>  struct device;
>  struct input_id;
>  struct regmap;
> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/inp=
ut/touchscreen/goodix_berlin_core.c
> index 3fc03cf0ca23..b892ab901d64 100644
> --- a/drivers/input/touchscreen/goodix_berlin_core.c
> +++ b/drivers/input/touchscreen/goodix_berlin_core.c
> @@ -12,7 +12,7 @@
>   * to the previous generations.
>   *
>   * Currently the driver only handles Multitouch events with already
> - * programmed firmware and "config" for "Revision D" Berlin IC.
> + * programmed firmware and "config" for "Revision A/D" Berlin IC.
>   *
>   * Support is missing for:
>   * - ESD Management
> @@ -20,7 +20,7 @@
>   * - "Config" update/flashing
>   * - Stylus Events
>   * - Gesture Events
> - * - Support for older revisions (A & B)
> + * - Support for revision B
>   */
> =20
>  #include <linux/bitfield.h>
> @@ -28,6 +28,7 @@
>  #include <linux/input.h>
>  #include <linux/input/mt.h>
>  #include <linux/input/touchscreen.h>
> +#include <linux/of.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/sizes.h>
> @@ -54,9 +55,11 @@
>  #define GOODIX_BERLIN_DEV_CONFIRM_VAL		0xAA
>  #define GOODIX_BERLIN_BOOTOPTION_ADDR		0x10000
>  #define GOODIX_BERLIN_FW_VERSION_INFO_ADDR	0x10014
> +#define GOODIX_BERLIN_FW_VERSION_INFO_ADDR_A	0x1000C
> =20
>  #define GOODIX_BERLIN_IC_INFO_MAX_LEN		SZ_1K
>  #define GOODIX_BERLIN_IC_INFO_ADDR		0x10070
> +#define GOODIX_BERLIN_IC_INFO_ADDR_A		0x10068
> =20
>  #define GOODIX_BERLIN_CHECKSUM_SIZE		sizeof(u16)
> =20
> @@ -297,9 +300,16 @@ static void goodix_berlin_power_off(struct goodix_be=
rlin_core *cd)
> =20
>  static int goodix_berlin_read_version(struct goodix_berlin_core *cd)
>  {
> +	const struct goodix_berlin_ic_data *ic_data =3D of_device_get_match_dat=
a(cd->dev);
> +	int fw_version_info_addr;
>  	int error;
> =20
> -	error =3D regmap_raw_read(cd->regmap, GOODIX_BERLIN_FW_VERSION_INFO_ADD=
R,
> +	if (ic_data->ic_type =3D=3D IC_TYPE_BERLIN_A)
> +		fw_version_info_addr =3D GOODIX_BERLIN_FW_VERSION_INFO_ADDR_A;
> +	else
> +		fw_version_info_addr =3D GOODIX_BERLIN_FW_VERSION_INFO_ADDR;
> +
> +	error =3D regmap_raw_read(cd->regmap, fw_version_info_addr,
>  				&cd->fw_version, sizeof(cd->fw_version));
>  	if (error) {
>  		dev_err(cd->dev, "error reading fw version, %d\n", error);
> @@ -358,16 +368,23 @@ static int goodix_berlin_parse_ic_info(struct goodi=
x_berlin_core *cd,
> =20
>  static int goodix_berlin_get_ic_info(struct goodix_berlin_core *cd)
>  {
> +	const struct goodix_berlin_ic_data *ic_data =3D of_device_get_match_dat=
a(cd->dev);
>  	u8 *afe_data __free(kfree) =3D NULL;
>  	__le16 length_raw;
>  	u16 length;
> +	int ic_info_addr;
>  	int error;
> =20
> +	if (ic_data->ic_type =3D=3D IC_TYPE_BERLIN_A)
> +		ic_info_addr =3D GOODIX_BERLIN_IC_INFO_ADDR_A;
> +	else
> +		ic_info_addr =3D GOODIX_BERLIN_IC_INFO_ADDR;
> +
>  	afe_data =3D kzalloc(GOODIX_BERLIN_IC_INFO_MAX_LEN, GFP_KERNEL);
>  	if (!afe_data)
>  		return -ENOMEM;
> =20
> -	error =3D regmap_raw_read(cd->regmap, GOODIX_BERLIN_IC_INFO_ADDR,
> +	error =3D regmap_raw_read(cd->regmap, ic_info_addr,
>  				&length_raw, sizeof(length_raw));
>  	if (error) {
>  		dev_err(cd->dev, "failed get ic info length, %d\n", error);
> @@ -380,7 +397,7 @@ static int goodix_berlin_get_ic_info(struct goodix_be=
rlin_core *cd)
>  		return -EINVAL;
>  	}
> =20
> -	error =3D regmap_raw_read(cd->regmap, GOODIX_BERLIN_IC_INFO_ADDR,
> +	error =3D regmap_raw_read(cd->regmap, ic_info_addr,
>  				afe_data, length);
>  	if (error) {
>  		dev_err(cd->dev, "failed get ic info data, %d\n", error);
> diff --git a/drivers/input/touchscreen/goodix_berlin_i2c.c b/drivers/inpu=
t/touchscreen/goodix_berlin_i2c.c
> index ad7a60d94338..b3fd063b4242 100644
> --- a/drivers/input/touchscreen/goodix_berlin_i2c.c
> +++ b/drivers/input/touchscreen/goodix_berlin_i2c.c
> @@ -53,8 +53,12 @@ static const struct i2c_device_id goodix_berlin_i2c_id=
[] =3D {
> =20
>  MODULE_DEVICE_TABLE(i2c, goodix_berlin_i2c_id);
> =20
> +static const struct goodix_berlin_ic_data gt9916_data =3D {
> +	.ic_type =3D IC_TYPE_BERLIN_D,
> +};
> +
>  static const struct of_device_id goodix_berlin_i2c_of_match[] =3D {
> -	{ .compatible =3D "goodix,gt9916", },
> +	{ .compatible =3D "goodix,gt9916", .data =3D &gt9916_data },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, goodix_berlin_i2c_of_match);
> diff --git a/drivers/input/touchscreen/goodix_berlin_spi.c b/drivers/inpu=
t/touchscreen/goodix_berlin_spi.c
> index 0662e87b8692..f48f11a76b6d 100644
> --- a/drivers/input/touchscreen/goodix_berlin_spi.c
> +++ b/drivers/input/touchscreen/goodix_berlin_spi.c
> @@ -10,6 +10,7 @@
>  #include <linux/unaligned.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/regmap.h>
>  #include <linux/spi/spi.h>
>  #include <linux/input.h>
> @@ -19,9 +20,13 @@
>  #define GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN	1
>  #define GOODIX_BERLIN_REGISTER_WIDTH		4
>  #define GOODIX_BERLIN_SPI_READ_DUMMY_LEN	3
> +#define GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A	4
>  #define GOODIX_BERLIN_SPI_READ_PREFIX_LEN	(GOODIX_BERLIN_SPI_TRANS_PREFI=
X_LEN + \
>  						 GOODIX_BERLIN_REGISTER_WIDTH + \
>  						 GOODIX_BERLIN_SPI_READ_DUMMY_LEN)
> +#define GOODIX_BERLIN_SPI_READ_PREFIX_LEN_A	(GOODIX_BERLIN_SPI_TRANS_PRE=
FIX_LEN + \
> +						 GOODIX_BERLIN_REGISTER_WIDTH + \
> +						 GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A)
>  #define GOODIX_BERLIN_SPI_WRITE_PREFIX_LEN	(GOODIX_BERLIN_SPI_TRANS_PREF=
IX_LEN + \
>  						 GOODIX_BERLIN_REGISTER_WIDTH)
> =20
> @@ -33,32 +38,41 @@ static int goodix_berlin_spi_read(void *context, cons=
t void *reg_buf,
>  				  size_t val_size)
>  {
>  	struct spi_device *spi =3D context;
> +	const struct goodix_berlin_ic_data *ic_data =3D of_device_get_match_dat=
a(&spi->dev);
>  	struct spi_transfer xfers;
>  	struct spi_message spi_msg;
>  	const u32 *reg =3D reg_buf; /* reg is stored as native u32 at start of =
buffer */
> +	ssize_t read_prefix_len, read_dummy_len;
>  	int error;
> =20
> +	if (ic_data->ic_type =3D=3D IC_TYPE_BERLIN_A) {
> +		read_prefix_len =3D GOODIX_BERLIN_SPI_READ_PREFIX_LEN_A;
> +		read_dummy_len =3D GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A;
> +	} else {
> +		read_prefix_len =3D GOODIX_BERLIN_SPI_READ_PREFIX_LEN;
> +		read_dummy_len =3D GOODIX_BERLIN_SPI_READ_DUMMY_LEN;
> +	}
> +
>  	if (reg_size !=3D GOODIX_BERLIN_REGISTER_WIDTH)
>  		return -EINVAL;
> =20
>  	u8 *buf __free(kfree) =3D
> -		kzalloc(GOODIX_BERLIN_SPI_READ_PREFIX_LEN + val_size,
> -			GFP_KERNEL);
> +		kzalloc(read_prefix_len + val_size, GFP_KERNEL);
>  	if (!buf)
>  		return -ENOMEM;
> =20
>  	spi_message_init(&spi_msg);
>  	memset(&xfers, 0, sizeof(xfers));
> =20
> -	/* buffer format: 0xF1 + addr(4bytes) + dummy(3bytes) + data */
> +	/* buffer format: 0xF1 + addr(4bytes) + dummy(3/4bytes) + data */
>  	buf[0] =3D GOODIX_BERLIN_SPI_READ_FLAG;
>  	put_unaligned_be32(*reg, buf + GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN);
>  	memset(buf + GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + GOODIX_BERLIN_REGISTE=
R_WIDTH,
> -	       0xff, GOODIX_BERLIN_SPI_READ_DUMMY_LEN);
> +	       0xff, read_dummy_len);
> =20
>  	xfers.tx_buf =3D buf;
>  	xfers.rx_buf =3D buf;
> -	xfers.len =3D GOODIX_BERLIN_SPI_READ_PREFIX_LEN + val_size;
> +	xfers.len =3D read_prefix_len + val_size;
>  	xfers.cs_change =3D 0;
>  	spi_message_add_tail(&xfers, &spi_msg);
> =20
> @@ -68,7 +82,7 @@ static int goodix_berlin_spi_read(void *context, const =
void *reg_buf,
>  		return error;
>  	}
> =20
> -	memcpy(val_buf, buf + GOODIX_BERLIN_SPI_READ_PREFIX_LEN, val_size);
> +	memcpy(val_buf, buf + read_prefix_len, val_size);
>  	return error;
>  }
> =20
> @@ -123,6 +137,7 @@ static const struct input_id goodix_berlin_spi_input_=
id =3D {
> =20
>  static int goodix_berlin_spi_probe(struct spi_device *spi)
>  {
> +	const struct goodix_berlin_ic_data *ic_data =3D of_device_get_match_dat=
a(&spi->dev);
>  	struct regmap_config regmap_config;
>  	struct regmap *regmap;
>  	size_t max_size;
> @@ -137,7 +152,10 @@ static int goodix_berlin_spi_probe(struct spi_device=
 *spi)
>  	max_size =3D spi_max_transfer_size(spi);
> =20
>  	regmap_config =3D goodix_berlin_spi_regmap_conf;
> -	regmap_config.max_raw_read =3D max_size - GOODIX_BERLIN_SPI_READ_PREFIX=
_LEN;
> +	if (ic_data->ic_type =3D=3D IC_TYPE_BERLIN_A)
> +		regmap_config.max_raw_read =3D max_size - GOODIX_BERLIN_SPI_READ_PREFI=
X_LEN_A;
> +	else
> +		regmap_config.max_raw_read =3D max_size - GOODIX_BERLIN_SPI_READ_PREFI=
X_LEN;
>  	regmap_config.max_raw_write =3D max_size - GOODIX_BERLIN_SPI_WRITE_PREF=
IX_LEN;
> =20
>  	regmap =3D devm_regmap_init(&spi->dev, NULL, spi, &regmap_config);
> @@ -153,13 +171,23 @@ static int goodix_berlin_spi_probe(struct spi_devic=
e *spi)
>  }
> =20
>  static const struct spi_device_id goodix_berlin_spi_ids[] =3D {
> +	{ "gt9897" },
>  	{ "gt9916" },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(spi, goodix_berlin_spi_ids);
> =20
> +static const struct goodix_berlin_ic_data gt9897_data =3D {
> +	.ic_type =3D IC_TYPE_BERLIN_A,
> +};
> +
> +static const struct goodix_berlin_ic_data gt9916_data =3D {
> +	.ic_type =3D IC_TYPE_BERLIN_D,
> +};
> +
>  static const struct of_device_id goodix_berlin_spi_of_match[] =3D {
> -	{ .compatible =3D "goodix,gt9916", },
> +	{ .compatible =3D "goodix,gt9897", .data =3D &gt9897_data },
> +	{ .compatible =3D "goodix,gt9916", .data =3D &gt9916_data },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, goodix_berlin_spi_of_match);

