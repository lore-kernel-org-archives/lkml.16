Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48265264A81;
	Tue,  8 Apr 2025 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102039; cv=none; b=tBSqYuHEJmI7LG9SkHOkDCNU9QA1sxWjgEYHEX/W8B3h1FrgtdZLIqazpQODKNSw1UPrq3J7Gr5JCoxl8uD7uyTTBhUtD8jpPpZqVqTInfEsmjIzI0ao4WtYIG2I+HIwjP+eTxK4aQ395N/odGdMeVLQKdbEEa0ENQ/zSxmcX84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102039; c=relaxed/simple;
	bh=B0IsYzujNWakaE1iqEpz4vSYxCtpvgN2LbAmzO0uIBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvLivtS4E4giYHuhy8ELd0SPSoIDve2VqazcvXyg0PR2M9xEzzb8d81jD3D+dkCp7pT1vSpqYQWKflfhKXhk1xHjj1p1YS6aMAXqgo3Tdq5cdPQfKvJ/urY51npwXzMjbu44atyOJyQIs6bu4wcARZ8S6xeg7g1OHshvrctX44A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhcFBuyB; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhcFBuyB"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5497590ffbbso1077859e87.1;
        Tue, 08 Apr 2025 01:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744102034; x=1744706834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kY40UyFStKuqJ+1ez/XLZm6hrcSWgcSElLoYXyYUisg=;
        b=VhcFBuyBtNZ3hPvctv0Pr30b3wlt1+NIKXU0SSVNJ+j/rvkqwIpETW0zLluXvSlR4Q
         AG1bNXCQpO7gl7WjUEXvv82q352wyyjJkFPnaFpM9AquSVIcHoAT2P757OCi5Ckd5tYY
         2JX++Mtw+/CQRKf7GBjgT4EgSgIu4YYAC6p057BF0OHMLAH+aSTu4dzk+R/ybWupRbpx
         v3LRNEcAx7u+d/USmjTcfERXyS58XtHhzzlUQE13/p1QPMyctV9AJ/AlP6fF45DIfEaz
         8H9Uz7yYEo0+CKwBLr1noKLZqWQ+SltFiSEAtFHO9oezZu36ZvQfk8eZ36RdOHhyVXjg
         iMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102034; x=1744706834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kY40UyFStKuqJ+1ez/XLZm6hrcSWgcSElLoYXyYUisg=;
        b=kiFXGkAaNLNAP26k7W+B6th2NjArWObWagL3QL3mTUgOXAlT4ufTptxzMlqp99oqpS
         noVqqY49hQX8UkrmeorW++b9TXIL2yTWhLgD+Se3l7ZNqDX/3TSFN8RDV3okEMBxLn6Q
         zd/OCZkCgw+CE9J82GH4axkmovtrXGprzoiAG4j/CCyQ1J4Au36tSyBDLn+PukVZ6EPd
         L9ga7af5FaMBJx4CZOSWS5BX9urZEFc2/17EYDQS75vLPUOIlgIXouAkmtEstKV0pjAA
         fuKikrIrl/TubyvLJhcSMZvUXcObOG1y1iIqmp8ViNZXq8QbwNHu1nzYw5HkyWwJb2wV
         CT+w==
X-Forwarded-Encrypted: i=1; AJvYcCVq9JkRxFwOjxCRoLgAzSw8iTaoCyyA8XV7JuoCETOcgPI2ZA7kmgYb9vlDrq/7i4Z3GxxFsDQVF7YjK3CJ@vger.kernel.org, AJvYcCXhARxLIFHlJf3s4ccMVo7viah/W/qrEOmZSK0hxfFw6wJWMoT40N1jRkraeDtFPyoEBsQahpcjJwT5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6kChcTKLhPGhoXo3Yu1B/lQVd2el2XexKVvIlZ366gSs9dtxI
	18IIskwF3kxuO5HA3X7ZMP4JhhWf2R9WHUz80qsrunyqRfbukty8aFdLuQ==
X-Gm-Gg: ASbGncux6nKoryQOMgSyDSUIjsV8GyUyzXYDoZEFayoiJf3e5opM6TivLmg3RT6jCAY
	cLYjnRWI9AJEZ1fPaluMKkVGC3pJ7XsKBZwT1fiddoK/+d3h7wxoYzOcI3Uw0PaMG/X7NdCFDHR
	wY5SFITdAIJvMPddM5rovSDWbG4bXI3gJIcbeLhHy56wyL+YMcnTzEoGNd0D33+PlEqRRZypB3/
	BV+/IMl+aS2kuaVp/zoMLOVOK7eUiV8bb2oC05IkR3OjKGG2Hzvti44He4CqM4E5MxPpaiErpX9
	oe5qhSegH5kJC4hIt0XLhfY0IQNL65z+14F10UqxRIbEbwo=
X-Google-Smtp-Source: AGHT+IHFiIIFDm1UowaX18Jk0lsFTWI1qWmwsrhka/r2unDV+KrF2q31ossm9zn29tkTzTTL1e0pOA==
X-Received: by 2002:a05:6512:4006:b0:545:48c:6352 with SMTP id 2adb3069b0e04-54c2334719cmr4516463e87.43.1744102034298;
        Tue, 08 Apr 2025 01:47:14 -0700 (PDT)
Received: from mva-rohm ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d73bsm1479868e87.183.2025.04.08.01.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:47:13 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:47:10 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/14] mfd: bd96801: Support ROHM BD96806
Message-ID: <ccc95ae33613648fdcba08915777d945412ac5c4.1744090658.git.mazziesaccount@gmail.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5eDF41KqnAFZJ5F+"
Content-Disposition: inline
In-Reply-To: <cover.1744090658.git.mazziesaccount@gmail.com>


--5eDF41KqnAFZJ5F+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ROHM BD96806 is from the software perspective almost identical to
the ROHM BD96802. The main difference is different voltage tuning
ranges. Add support differentiating these PMICs based on the compatible,
and invoking the regulator driver with correct IC type.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Lee Jones <lee@kernel.org>

---
Revision history:
v2 =3D> :
  - No changes
v1 =3D> v2:
 - Use chip_type enum
---
 drivers/mfd/rohm-bd96801.c       | 23 +++++++++++++++++++++++
 include/linux/mfd/rohm-generic.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/mfd/rohm-bd96801.c b/drivers/mfd/rohm-bd96801.c
index dd0be7d675b8..66fa017ad568 100644
--- a/drivers/mfd/rohm-bd96801.c
+++ b/drivers/mfd/rohm-bd96801.c
@@ -225,6 +225,11 @@ static struct mfd_cell bd96805_cells[] =3D {
 	[REGULATOR_CELL] =3D { .name =3D "bd96805-regulator", },
 };
=20
+static struct mfd_cell bd96806_cells[] =3D {
+	[WDG_CELL] =3D { .name =3D "bd96806-wdt", },
+	[REGULATOR_CELL] =3D { .name =3D "bd96806-regulator", },
+};
+
 static const struct regmap_range bd96801_volatile_ranges[] =3D {
 	/* Status registers */
 	regmap_reg_range(BD96801_REG_WD_FEED, BD96801_REG_WD_FAILCOUNT),
@@ -617,6 +622,20 @@ static const struct bd968xx bd96805_data =3D {
 	.unlock_val =3D BD96801_UNLOCK,
 };
=20
+static struct bd968xx bd96806_data =3D {
+	.errb_irqs =3D bd96802_reg_errb_irqs,
+	.intb_irqs =3D bd96802_reg_intb_irqs,
+	.num_errb_irqs =3D ARRAY_SIZE(bd96802_reg_errb_irqs),
+	.num_intb_irqs =3D ARRAY_SIZE(bd96802_reg_intb_irqs),
+	.errb_irq_chip =3D &bd96802_irq_chip_errb,
+	.intb_irq_chip =3D &bd96802_irq_chip_intb,
+	.regmap_config =3D &bd96802_regmap_config,
+	.cells =3D bd96806_cells,
+	.num_cells =3D ARRAY_SIZE(bd96806_cells),
+	.unlock_reg =3D BD96801_LOCK_REG,
+	.unlock_val =3D BD96801_UNLOCK,
+};
+
 static int bd96801_i2c_probe(struct i2c_client *i2c)
 {
 	struct regmap_irq_chip_data *intb_irq_data, *errb_irq_data;
@@ -642,6 +661,9 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
 	case ROHM_CHIP_TYPE_BD96805:
 		ddata =3D &bd96805_data;
 		break;
+	case ROHM_CHIP_TYPE_BD96806:
+		ddata =3D &bd96806_data;
+		break;
 	default:
 		dev_err(&i2c->dev, "Unknown IC\n");
 		return -EINVAL;
@@ -739,6 +761,7 @@ static const struct of_device_id bd96801_of_match[] =3D=
 {
 	{ .compatible =3D "rohm,bd96801", .data =3D (void *)ROHM_CHIP_TYPE_BD9680=
1 },
 	{ .compatible =3D "rohm,bd96802", .data =3D (void *)ROHM_CHIP_TYPE_BD9680=
2 },
 	{ .compatible =3D "rohm,bd96805", .data =3D (void *)ROHM_CHIP_TYPE_BD9680=
5 },
+	{ .compatible =3D "rohm,bd96806", .data =3D (void *)ROHM_CHIP_TYPE_BD9680=
6 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bd96801_of_match);
diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-gene=
ric.h
index 867acf5baefc..579e8dcfcca4 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -19,6 +19,7 @@ enum rohm_chip_type {
 	ROHM_CHIP_TYPE_BD96801,
 	ROHM_CHIP_TYPE_BD96802,
 	ROHM_CHIP_TYPE_BD96805,
+	ROHM_CHIP_TYPE_BD96806,
 	ROHM_CHIP_TYPE_AMOUNT
 };
=20
--=20
2.49.0


--5eDF41KqnAFZJ5F+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmf04o4ACgkQeFA3/03a
ocXSkQf9HjqegysJnNXSSi9wIIw9OBFQPPFKdtzVRX8qfLDX3y9ULAyI2vsGR7pp
/rlr2wyTzsgm8FmcYlPNCZvjpybPGnpUnh3Y06nrs2SxmzBUx4Xt8Dn8RusbyiHb
qEOYuR8am9ndj/K5u2qyfSygLDsFOhms3KsH7of9KbaTJFmUkOaDNrjTzBwau2BL
yl7rYna2bEII0Q7WgZMqRspg16NqhQI/L6SrfqMj1WoD481Xl7c4Bc43OJku8KR+
k/yj+bpdIA+32v0rom9gD8i6JfXidCb1T/kiTGYcBKhz0Hoc5PxWopC/RXD8p69I
x/8IEUIgZaKEGlASkpdXcJOYIS2Vgw==
=AtqN
-----END PGP SIGNATURE-----

--5eDF41KqnAFZJ5F+--
