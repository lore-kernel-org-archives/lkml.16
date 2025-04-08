Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C58A94A;
	Tue,  8 Apr 2025 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101900; cv=none; b=CYJ81WCZzQhwg62zaKj7grFxkmbjaetg9n2SUxFH1dln9Kb21Mr/EjlM+O8EnPjy31UR5QevWsj7xXhFzb+5KyvZ5o9nt7K/DsNZNAnD7jn/MuxPta71cTFX+eb7NFIVw3Ta4EkFexhyGWj358WigUlMkPHQCeGC5w6Xl+GaW0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101900; c=relaxed/simple;
	bh=VZe2OngXdsBxSy64qOinDtrkbgVY8smaaFF6+zHeCMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rw0QFhMFLuUPJHbUsp1HBLwArUjcsRvTMXDQaFbjZVPcoH1jlfd6bfhcGLE3btXlLLrtmRSkfI0z9nhRkMtaEUxWmu/kyE+VMa86wX36AV8nET3cSr9Wf3tGx/Muf2Dq7x9yDHpq+xq1ny/GVqpzvKvVa5JKmLS9E7W6YaYH9eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUVUS/px; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUVUS/px"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b10956398so6102347e87.0;
        Tue, 08 Apr 2025 01:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744101896; x=1744706696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W4E5dsKLqNXfeqjLjmXvcZnG4XsV2gvaRLcqjfHJkRA=;
        b=CUVUS/pxzuAWqBETmup24OYUFcmxJVDhsmFRaGEcnffz5Y7bSzQOJ97K2bUw5b1nbB
         67hCckdUq5Wt3UvZRVZilrxrvpwEaIRWs0X+SZXSAXGQRZSQTacKh8jdXe2oR29ixREk
         BV9189km5isnhICWxSrJqMUY2z1e7oZ/iXDLll2LsMoTTeQofs+r9JhHWPOF+q436bxx
         5IW6BfRdCvU7+0W/oLvrdSCliMT/C3kcwgGL+Gwmepmoe9I8q36AqBy74Ba/xDrhAMTY
         RM4g/ZmdQGr5oDra6BLRYBb87vnSdfXCR4NIybIizgD/QBy46eBQYwrb/Go06bRSK87K
         Qd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101896; x=1744706696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4E5dsKLqNXfeqjLjmXvcZnG4XsV2gvaRLcqjfHJkRA=;
        b=FsOgwLYOoufocbuAm4KPbp66Q4yaXBU5/iIhtSAhZIUHFU6zA37MYwmYN9DtVhscoB
         gdyhJgouXZvESFZaeft5sykdoq3BOsmuf+FGUZeJfUyUIYJCVU9p0YPRoAqE+pPJ1WAB
         gEdzw1ERcqJqjv9VLSwAdfJGk9GhsCWVqfEePVmsdfhmYMcXE14yrGYH6xFJn0/YTKep
         aN75FBFrZVyF8A2GbU6ZIKy5yyHydw+xgC0M/M3GC4qJ8NbsiEl1o2XnSOOamOHyIHZl
         HW/9edRA4+oeGzgjlaytONvGmSnZs3xCqCf6ffLdWci5RXtwCR93nQLWpCArM6fN28cc
         9Guw==
X-Forwarded-Encrypted: i=1; AJvYcCXBwlu7CgUNzGl+oKPUilPc13M0YJYJ81cg1w6fHKRIgzh99aoJmhBt3UW1TrXIW6DHAm9QT1jU3FIrSWa7@vger.kernel.org, AJvYcCXpuHzF+BJ1JdzfPkgJb+PEuuPIi2mxgrRKbJpb6uU4d7Ai1f4pmF3XGw4b6cnQUYl+mzBvoo70CHpa@vger.kernel.org
X-Gm-Message-State: AOJu0YzXXrBsdK/BDCFw4W19n0m2bYzeZ2BsKvGhlbMLEMzHNsULKnK1
	v9F8AzEWr6375QLAXlDtX8Y0vnlPrCHRm4qhf04qXX8xaWeISREo
X-Gm-Gg: ASbGncu+npcp08Mfo0hp4oIbRFAlNe8y9oFXO27pG+hzGhFnm+6fnD8DkCILnNmOEjh
	UC4cvXW2CRC8rpymJDqXKrQzAQyz9leJEUeyLuG0uE3HwBvECGplpPiwMyvkjlZaPvQHCfGNAAP
	XShxuV5ZE0FLoxAgpD5cULMJHYHfbSwNvgkdaSrr6HUmcuPj2C/3bYNKYWuo/jeJNpr920L2vTJ
	5DJygjHFjodPPHKRdp+CUNP7ZCf1w1VrCmwGHiK+CwCC1YHmBRxoAbzwdKQCcDOpSxc+TC7eDVY
	zKLgDeKTr4T9zUC155a246ZK2nCmCmn1Hh/Wz4opQYK3TWE=
X-Google-Smtp-Source: AGHT+IF7I9IBJRm9zC8vFnPl0qdxqoNVwxn05woOD9dD5DExk5Rg0J3ij+T6VLyltYRyT7y3BX93Nw==
X-Received: by 2002:a05:6512:6d6:b0:54a:f66d:5620 with SMTP id 2adb3069b0e04-54c3bb92db9mr751174e87.8.1744101895940;
        Tue, 08 Apr 2025 01:44:55 -0700 (PDT)
Received: from mva-rohm ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635bf7sm1520825e87.137.2025.04.08.01.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:44:55 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:44:48 +0300
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
Subject: [PATCH v3 05/14] mfd: rohm-bd96801: Add chip info
Message-ID: <826f9aa28795a2aa70ea41a3688ff9a83ec25a98.1744090658.git.mazziesaccount@gmail.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nf8ZO/YTJbro2ttd"
Content-Disposition: inline
In-Reply-To: <cover.1744090658.git.mazziesaccount@gmail.com>


--nf8ZO/YTJbro2ttd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Prepare for adding support for BD96802 which is very similar to BD96801.
Separate chip specific data into own structure which can be picked based
on the type of the IC.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Lee Jones <lee@kernel.org>

---
Revision history:
 v2 =3D> :
  - No changes
 v1 =3D> v2:
  - Use chip_type enum
  - Rename cd to ddata
---
 drivers/mfd/rohm-bd96801.c | 90 +++++++++++++++++++++++++++-----------
 1 file changed, 64 insertions(+), 26 deletions(-)

diff --git a/drivers/mfd/rohm-bd96801.c b/drivers/mfd/rohm-bd96801.c
index 60ec8db790a7..52e25d7ca888 100644
--- a/drivers/mfd/rohm-bd96801.c
+++ b/drivers/mfd/rohm-bd96801.c
@@ -40,7 +40,21 @@
 #include <linux/mfd/rohm-bd96801.h>
 #include <linux/mfd/rohm-generic.h>
=20
-static const struct resource regulator_errb_irqs[] =3D {
+struct bd968xx {
+	const struct resource *errb_irqs;
+	const struct resource *intb_irqs;
+	int num_errb_irqs;
+	int num_intb_irqs;
+	const struct regmap_irq_chip *errb_irq_chip;
+	const struct regmap_irq_chip *intb_irq_chip;
+	const struct regmap_config *regmap_config;
+	struct mfd_cell *cells;
+	int num_cells;
+	int unlock_reg;
+	int unlock_val;
+};
+
+static const struct resource bd96801_reg_errb_irqs[] =3D {
 	DEFINE_RES_IRQ_NAMED(BD96801_OTP_ERR_STAT, "bd96801-otp-err"),
 	DEFINE_RES_IRQ_NAMED(BD96801_DBIST_ERR_STAT, "bd96801-dbist-err"),
 	DEFINE_RES_IRQ_NAMED(BD96801_EEP_ERR_STAT, "bd96801-eep-err"),
@@ -98,7 +112,7 @@ static const struct resource regulator_errb_irqs[] =3D {
 	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_SHDN_ERR_STAT, "bd96801-ldo7-shdn-err"),
 };
=20
-static const struct resource regulator_intb_irqs[] =3D {
+static const struct resource bd96801_reg_intb_irqs[] =3D {
 	DEFINE_RES_IRQ_NAMED(BD96801_TW_STAT, "bd96801-core-thermal"),
=20
 	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_OCPH_STAT, "bd96801-buck1-overcurr-h"),
@@ -345,18 +359,44 @@ static const struct regmap_config bd96801_regmap_conf=
ig =3D {
 	.cache_type =3D REGCACHE_MAPLE,
 };
=20
+static const struct bd968xx bd96801_data =3D {
+	.errb_irqs =3D bd96801_reg_errb_irqs,
+	.intb_irqs =3D bd96801_reg_intb_irqs,
+	.num_errb_irqs =3D ARRAY_SIZE(bd96801_reg_errb_irqs),
+	.num_intb_irqs =3D ARRAY_SIZE(bd96801_reg_intb_irqs),
+	.errb_irq_chip =3D &bd96801_irq_chip_errb,
+	.intb_irq_chip =3D &bd96801_irq_chip_intb,
+	.regmap_config =3D &bd96801_regmap_config,
+	.cells =3D bd96801_cells,
+	.num_cells =3D ARRAY_SIZE(bd96801_cells),
+	.unlock_reg =3D BD96801_LOCK_REG,
+	.unlock_val =3D BD96801_UNLOCK,
+};
+
 static int bd96801_i2c_probe(struct i2c_client *i2c)
 {
 	struct regmap_irq_chip_data *intb_irq_data, *errb_irq_data;
 	struct irq_domain *intb_domain, *errb_domain;
+	const struct bd968xx *ddata;
 	const struct fwnode_handle *fwnode;
 	struct resource *regulator_res;
 	struct resource wdg_irq;
 	struct regmap *regmap;
-	int intb_irq, errb_irq, num_intb, num_errb =3D 0;
+	int intb_irq, errb_irq, num_errb =3D 0;
 	int num_regu_irqs, wdg_irq_no;
+	unsigned int chip_type;
 	int i, ret;
=20
+	chip_type =3D (unsigned int)(uintptr_t)device_get_match_data(&i2c->dev);
+	switch (chip_type) {
+	case ROHM_CHIP_TYPE_BD96801:
+		ddata =3D &bd96801_data;
+		break;
+	default:
+		dev_err(&i2c->dev, "Unknown IC\n");
+		return -EINVAL;
+	}
+
 	fwnode =3D dev_fwnode(&i2c->dev);
 	if (!fwnode)
 		return dev_err_probe(&i2c->dev, -EINVAL, "Failed to find fwnode\n");
@@ -365,34 +405,32 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
 	if (intb_irq < 0)
 		return dev_err_probe(&i2c->dev, intb_irq, "INTB IRQ not configured\n");
=20
-	num_intb =3D  ARRAY_SIZE(regulator_intb_irqs);
-
 	/* ERRB may be omitted if processor is powered by the PMIC */
 	errb_irq =3D fwnode_irq_get_byname(fwnode, "errb");
-	if (errb_irq < 0)
-		errb_irq =3D 0;
+	if (errb_irq =3D=3D -EPROBE_DEFER)
+		return errb_irq;
=20
-	if (errb_irq)
-		num_errb =3D ARRAY_SIZE(regulator_errb_irqs);
+	if (errb_irq > 0)
+		num_errb =3D ddata->num_errb_irqs;
=20
-	num_regu_irqs =3D num_intb + num_errb;
+	num_regu_irqs =3D ddata->num_intb_irqs + num_errb;
=20
 	regulator_res =3D devm_kcalloc(&i2c->dev, num_regu_irqs,
 				     sizeof(*regulator_res), GFP_KERNEL);
 	if (!regulator_res)
 		return -ENOMEM;
=20
-	regmap =3D devm_regmap_init_i2c(i2c, &bd96801_regmap_config);
+	regmap =3D devm_regmap_init_i2c(i2c, ddata->regmap_config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(&i2c->dev, PTR_ERR(regmap),
 				    "Regmap initialization failed\n");
=20
-	ret =3D regmap_write(regmap, BD96801_LOCK_REG, BD96801_UNLOCK);
+	ret =3D regmap_write(regmap, ddata->unlock_reg, ddata->unlock_val);
 	if (ret)
 		return dev_err_probe(&i2c->dev, ret, "Failed to unlock PMIC\n");
=20
 	ret =3D devm_regmap_add_irq_chip(&i2c->dev, regmap, intb_irq,
-				       IRQF_ONESHOT, 0, &bd96801_irq_chip_intb,
+				       IRQF_ONESHOT, 0, ddata->intb_irq_chip,
 				       &intb_irq_data);
 	if (ret)
 		return dev_err_probe(&i2c->dev, ret, "Failed to add INTB IRQ chip\n");
@@ -404,24 +442,25 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
 	 * has two domains so we do IRQ mapping here and provide the
 	 * already mapped IRQ numbers to sub-devices.
 	 */
-	for (i =3D 0; i < num_intb; i++) {
+	for (i =3D 0; i < ddata->num_intb_irqs; i++) {
 		struct resource *res =3D &regulator_res[i];
=20
-		*res =3D regulator_intb_irqs[i];
+		*res =3D ddata->intb_irqs[i];
 		res->start =3D res->end =3D irq_create_mapping(intb_domain,
 							    res->start);
 	}
=20
 	wdg_irq_no =3D irq_create_mapping(intb_domain, BD96801_WDT_ERR_STAT);
 	wdg_irq =3D DEFINE_RES_IRQ_NAMED(wdg_irq_no, "bd96801-wdg");
-	bd96801_cells[WDG_CELL].resources =3D &wdg_irq;
-	bd96801_cells[WDG_CELL].num_resources =3D 1;
+
+	ddata->cells[WDG_CELL].resources =3D &wdg_irq;
+	ddata->cells[WDG_CELL].num_resources =3D 1;
=20
 	if (!num_errb)
 		goto skip_errb;
=20
 	ret =3D devm_regmap_add_irq_chip(&i2c->dev, regmap, errb_irq, IRQF_ONESHO=
T,
-				       0, &bd96801_irq_chip_errb, &errb_irq_data);
+				       0, ddata->errb_irq_chip, &errb_irq_data);
 	if (ret)
 		return dev_err_probe(&i2c->dev, ret,
 				     "Failed to add ERRB IRQ chip\n");
@@ -429,18 +468,17 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
 	errb_domain =3D regmap_irq_get_domain(errb_irq_data);
=20
 	for (i =3D 0; i < num_errb; i++) {
-		struct resource *res =3D &regulator_res[num_intb + i];
+		struct resource *res =3D &regulator_res[ddata->num_intb_irqs + i];
=20
-		*res =3D regulator_errb_irqs[i];
+		*res =3D ddata->errb_irqs[i];
 		res->start =3D res->end =3D irq_create_mapping(errb_domain, res->start);
 	}
=20
 skip_errb:
-	bd96801_cells[REGULATOR_CELL].resources =3D regulator_res;
-	bd96801_cells[REGULATOR_CELL].num_resources =3D num_regu_irqs;
-
-	ret =3D devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO, bd96801_cell=
s,
-				   ARRAY_SIZE(bd96801_cells), NULL, 0, NULL);
+	ddata->cells[REGULATOR_CELL].resources =3D regulator_res;
+	ddata->cells[REGULATOR_CELL].num_resources =3D num_regu_irqs;
+	ret =3D devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO, ddata->cells,
+				   ddata->num_cells, NULL, 0, NULL);
 	if (ret)
 		dev_err_probe(&i2c->dev, ret, "Failed to create subdevices\n");
=20
@@ -448,7 +486,7 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
 }
=20
 static const struct of_device_id bd96801_of_match[] =3D {
-	{ .compatible =3D "rohm,bd96801",	},
+	{ .compatible =3D "rohm,bd96801", .data =3D (void *)ROHM_CHIP_TYPE_BD9680=
1 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bd96801_of_match);
--=20
2.49.0


--nf8ZO/YTJbro2ttd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmf04gAACgkQeFA3/03a
ocUJmQgAop53pY36p1Crjf/XU52DVZkssQ+/rmTOhQHdd3cJssNVSlQtnwEKIexC
9UBov7w0++wIiPds5yrAxFsEpD+jVn48KZpUjhCQj1/cBpwxPg2+TmJTFjxi4Q8D
R06bJnBnA8x6eXJq3mjv2SHLre+QoyWvqGHibeAOM/rUmkHqPNBGaZopXAqLpoab
A57KKTHGvFQjT4iw4qw+eoPei2tmd+3vw6Y3/JA97DXWNVODADQL5ZNvajiJco9Y
2EXxHOnFuMVZLOCY3zx0jOUU2bGKf+6KqY8mxNnJhekQiEMqDy0mTHShbZyNu7ya
Tq1TchOhusYn/AK6AWbIfRHM/BjYYg==
=c4Gi
-----END PGP SIGNATURE-----

--nf8ZO/YTJbro2ttd--
