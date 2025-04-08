Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859A2222589;
	Tue,  8 Apr 2025 08:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102005; cv=none; b=HbzLw3FyQgx6Bl9KsEXZWYD2yv4fK1c4jPivUK6J5CtI7sgd2nyX2005S8nkwxY68bqqfzX5lLnz3X06/tSu7gAmIPfHv74m7iRx7aKir0Wle+Fg+yZte9zIH8eVA9iiYacG+6qljs/+Q243AAEkr+wJngZwCL8ccwBEq9X5iCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102005; c=relaxed/simple;
	bh=43g+QLxn2k6Simbx23b0FY6XvWLybPvT/yOCvNqXsvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDjtspZntJXgJiEKX/sguWYwoXhDux0uppjt/ElEu5j9n21nF20smKcgr3PbfBnoRSoJDnrRsXtT1ANE1ByISKisAi1B50PdNWUHjx0IPHOGnMpHbVOV1KMuYx/HBZctIsagXfDZa2JLisftOV+Fn20QPjN1JettVlxuVRSFqyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXfpkqkX; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXfpkqkX"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bfca745c7so47568371fa.0;
        Tue, 08 Apr 2025 01:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744102002; x=1744706802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8mtfxKsQQapjbo5YvTPoRWm9hBaUtn7hhAIIctmbCNM=;
        b=iXfpkqkXo5GuE8yk8GpIhpgTJDuXpCaoQKooCyIJ+vwpjgKBvnD9mp7j/xW5UNbM8a
         Z8RJAXyCyMI8YHVYks4xI7Wjft7Q8LvcvnhYVGpCu9cQSxkgXsbGDH5dsinU1CQjwuEd
         uYgiQpLbp+k8LQTVDpvYO4WcNCZn8MrYquUJYDk5F5619svU/yBG6D6RM3Joj2RdsltI
         8IfpnGqyy0Vz+vo+fRFPoFBOCakwFscMO4RK0N9xr2ojCNlTY/2poJ/MByzGvL6hxuwJ
         69CUEoSHyEn1bgrzTY0IObJa0q4N6fsPHBcBVXs+IF9GvuS/eZayTNan2j0des3D8sT6
         PNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102002; x=1744706802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mtfxKsQQapjbo5YvTPoRWm9hBaUtn7hhAIIctmbCNM=;
        b=Pc5InCyNeEukF+ups8uUEH4zdePhxHH49PzX1ixtUVtURWvvcZjU6u9YMGJfb0+HEC
         NIJTETLFrbP23BJavXOu1mLw2unGgkyungrmYgFlf1EyHpAF+Pc2yrTGrOr366EBI30R
         nDLBFroIWEy1duhKeLPa+pJauJEnE9VbuMLnZr/BdZwJfgLxi42IudEefGJzVZZJmtrR
         juQvg3JdL68tT1w/jpCYWBhzOsQ7PFMrj+0wlHg4AaT89XW71OHabZ1x00xruniMtwuy
         Sf97gRZm0TIuzpQcuY7/heAEsSCwZG8jbQ+L6fe20vteiwfKklWi5Wlpp60+cd/OZo48
         QgeA==
X-Forwarded-Encrypted: i=1; AJvYcCUiDKL+t+8vJE+ykqzpS3GR3OQXdHFxXHHEqdTomfovbo5/lyp6ljy6wG42EcDZ2If4E5iFHup/n1Ou@vger.kernel.org, AJvYcCXMqfyJqpnIJaK67h/GgdQQJ3NnYD19iVqf/y+4oR5OmGJvrR/iZDmcGTX0++ApMyoIf9gcoptK15aq6w0p@vger.kernel.org
X-Gm-Message-State: AOJu0YwV5IB+BJBFagVcqjNSySq0OS8KW3BsHrXTnyQ83n3nE3UgZ+EL
	yJ4P9p3XTsVC8ap4aZEXEav0gJ9BQVJLlzukYkcEJ5ail2ACCht0
X-Gm-Gg: ASbGncuXTJRiGUM+Le9DJTY8oBuPusNTE3AKaVqt1EbPpFqnXDbbF1g7iFnCxewBOBl
	fdi3+Gz193Twgc3CBMQ/IeSyW4L9tJvrdLx5eTGdxwRJQ84dcPdy7YQB1jw/N4Hz/UjOoZRjZIs
	mEznFmUskyNU5aUxicGmZMetU/KJMfku3m9q0+JbZVILINR16HMPVuXik7yXWKTQ1wiM0IyklkG
	o6FzpIAh/bwIkHHFmsTbpNvydrTY+bwQil5fbSDI+r5O+a37+TrTIMPvVDilJ0gMB1H3BT5ILJe
	sXyO1DFiNj96ZgnTQJep2wWIsv28uwgzW979O3aOVUvGXlM=
X-Google-Smtp-Source: AGHT+IH3XxeoAIMnEzmAmkTH61nsD9S8UARdeLp3Wh7RSEMCyr4PuOO/s1agGjaM9HBsGMBArymXRw==
X-Received: by 2002:a2e:a108:0:b0:30c:c8d:ba3c with SMTP id 38308e7fff4ca-30f16523422mr37612661fa.17.1744102001477;
        Tue, 08 Apr 2025 01:46:41 -0700 (PDT)
Received: from mva-rohm ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031bcd03sm19224811fa.74.2025.04.08.01.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:46:40 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:46:36 +0300
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
Subject: [PATCH v3 10/14] mfd: bd96801: Support ROHM BD96805
Message-ID: <8680097dc083f191bea56d3ac7c6fe5c005644ec.1744090658.git.mazziesaccount@gmail.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GLZ3ucmsZvcwQGKL"
Content-Disposition: inline
In-Reply-To: <cover.1744090658.git.mazziesaccount@gmail.com>


--GLZ3ucmsZvcwQGKL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ROHM BD96805 is from the software perspective almost identical to
the ROHM BD96801. The main difference is different voltage tuning
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
 drivers/mfd/rohm-bd96801.c       | 22 ++++++++++++++++++++++
 include/linux/mfd/rohm-generic.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/mfd/rohm-bd96801.c b/drivers/mfd/rohm-bd96801.c
index e5ee5f556a55..dd0be7d675b8 100644
--- a/drivers/mfd/rohm-bd96801.c
+++ b/drivers/mfd/rohm-bd96801.c
@@ -220,6 +220,10 @@ static struct mfd_cell bd96802_cells[] =3D {
 	[WDG_CELL] =3D { .name =3D "bd96801-wdt", },
 	[REGULATOR_CELL] =3D { .name =3D "bd96802-regulator", },
 };
+static struct mfd_cell bd96805_cells[] =3D {
+	[WDG_CELL] =3D { .name =3D "bd96801-wdt", },
+	[REGULATOR_CELL] =3D { .name =3D "bd96805-regulator", },
+};
=20
 static const struct regmap_range bd96801_volatile_ranges[] =3D {
 	/* Status registers */
@@ -599,6 +603,20 @@ static const struct bd968xx bd96802_data =3D {
 	.unlock_val =3D BD96801_UNLOCK,
 };
=20
+static const struct bd968xx bd96805_data =3D {
+	.errb_irqs =3D bd96801_reg_errb_irqs,
+	.intb_irqs =3D bd96801_reg_intb_irqs,
+	.num_errb_irqs =3D ARRAY_SIZE(bd96801_reg_errb_irqs),
+	.num_intb_irqs =3D ARRAY_SIZE(bd96801_reg_intb_irqs),
+	.errb_irq_chip =3D &bd96801_irq_chip_errb,
+	.intb_irq_chip =3D &bd96801_irq_chip_intb,
+	.regmap_config =3D &bd96801_regmap_config,
+	.cells =3D bd96805_cells,
+	.num_cells =3D ARRAY_SIZE(bd96805_cells),
+	.unlock_reg =3D BD96801_LOCK_REG,
+	.unlock_val =3D BD96801_UNLOCK,
+};
+
 static int bd96801_i2c_probe(struct i2c_client *i2c)
 {
 	struct regmap_irq_chip_data *intb_irq_data, *errb_irq_data;
@@ -621,6 +639,9 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
 	case ROHM_CHIP_TYPE_BD96802:
 		ddata =3D &bd96802_data;
 		break;
+	case ROHM_CHIP_TYPE_BD96805:
+		ddata =3D &bd96805_data;
+		break;
 	default:
 		dev_err(&i2c->dev, "Unknown IC\n");
 		return -EINVAL;
@@ -717,6 +738,7 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
 static const struct of_device_id bd96801_of_match[] =3D {
 	{ .compatible =3D "rohm,bd96801", .data =3D (void *)ROHM_CHIP_TYPE_BD9680=
1 },
 	{ .compatible =3D "rohm,bd96802", .data =3D (void *)ROHM_CHIP_TYPE_BD9680=
2 },
+	{ .compatible =3D "rohm,bd96805", .data =3D (void *)ROHM_CHIP_TYPE_BD9680=
5 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bd96801_of_match);
diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-gene=
ric.h
index 11b86f9129e3..867acf5baefc 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -18,6 +18,7 @@ enum rohm_chip_type {
 	ROHM_CHIP_TYPE_BD71847,
 	ROHM_CHIP_TYPE_BD96801,
 	ROHM_CHIP_TYPE_BD96802,
+	ROHM_CHIP_TYPE_BD96805,
 	ROHM_CHIP_TYPE_AMOUNT
 };
=20
--=20
2.49.0


--GLZ3ucmsZvcwQGKL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmf04mwACgkQeFA3/03a
ocXL4wgApnhmiCvfr9yvnquuePPZ8tHUrwK133yiyye6ajvzJHV3E1L0Y0+Eoykp
qcvQcdjnzgA7BQut8498qHBIr46LqbdsTZ75bdPbf7Eq25CODZXR9Je0dp53XkW3
m6y9cod2ZqvnWGx1nKDiB64WrPK/D00c+EuzG4WCS7ppdLFVGG8rSIKwn2UVcfhA
sK58C8ZTc4I394YYjKvvwvGgE6Kpb2mniWDFRie9LqxZgtDuKrngmaGq3UC7G51f
QaHJvalbWYfuQZvd8+i9bKcp1mhPJnuNymiqvIdRKbk3Z8cEPexDwrf2s2ArGGdn
boePM+IaaerqriwZzz9MpfGgeaP1yA==
=VaXE
-----END PGP SIGNATURE-----

--GLZ3ucmsZvcwQGKL--
