Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE6E265632;
	Tue,  8 Apr 2025 08:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102054; cv=none; b=WEpPM07MJt6x5DGIuByLXW9ZnZX8plWum7V8WnV2TsTV5XgONKpvm2dVI2kQoFXiMsl4+dny7W+ceElqMSlwSTEbbqKOTww9MHXntamH17Oi4tAMT/qTCAhqqlNp/7fIy0zgBtsqsgHPiZGfkVwHlxTmpsWUHWtj5cqQHWTUlvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102054; c=relaxed/simple;
	bh=XRgvqW9EWsOPpwNI7y8NrfRviZdX0KDdD7gHC8eXhU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzcT5UjDlY2pt9W3aCcLUAmBqb+m5JNRaH/0O9AHDcBFid6H7a/qSM23/rdcqKFisHu9C+nbX3s0T8manco8Wwr9p93AHZRFhsrfURQXfvRW+H9sX0Bv6jSDykmBCId4bYjt5SmoR5MwtGY9FCgPZDcN17bbvo553SkyFOuowV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZlY69To; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZlY69To"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499614d3d2so6102146e87.3;
        Tue, 08 Apr 2025 01:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744102049; x=1744706849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=97YqxkwPrcHMXlgcLTnrN+rNxcl4tswuncCydUOp6J4=;
        b=MZlY69To5CQsCmyIsLG8nxnhsAnoR5ovUPD0L0yRkNcc9aiATh8OQtAe/AAr4brCpo
         w9HGysCtnPLdsnOtpWhRb8e45neNwStqJAd/dwkkt2IGaDgxe6YGmxJ3JY6oAxZZoL63
         QXatFqWaWmIEpmmvf7BKGFdL5jaG463Yg1piXF+O+G5mHo0BXYXPRaxF5ESKZW+pU/3v
         zaGJlm1FmUDQcxQ6iokV7NgxypGU5zcCRvl3dQ5lYCgRcg9O8/uA2r2thQAr4NDrszBN
         hoIu4lvrltQNu7ctRuL0C7euVWeD8D6P8KEyPg8QRt62nESK+qErLxewf8Tw0CXFk4v/
         hvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102049; x=1744706849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97YqxkwPrcHMXlgcLTnrN+rNxcl4tswuncCydUOp6J4=;
        b=iLmfjYy60pXrRfX0bZDDiyCwN+pV9lqKPHP4/a10zyTplFfrn/vulFDpbJchuRk5HX
         JNeMGDnuSa1IcKJEtMyyNuTbcWAHyGzEiW8Dd4N/Efrm7VUDbzVmMQYwzL1HGu0iHWLP
         ItATFbr4YsOyXw6EtQ0oVvPQHcSBMbgmz72Nw2+Mf3wGcOw7N/Z//wPGR6KcnVlAOuDY
         tXEzBNXljWl8Erg2D9VLN/P56NDEq5K8kw2G8H2ZQ4cSuJsuErqj8jWLs03U0vL8kKxy
         1eCi4sdrIGiWchP3Y8JFrcJzY51FF+h6HT7kEH2gRhOx9lLXxBVrVx//4G9nIOWAlI8l
         Ra6A==
X-Forwarded-Encrypted: i=1; AJvYcCUNlx9CiwbgUDtf7IpYgx/bajI6GLBrD+34qaRvV9J2kPAkB11mGeXtA44jmrMAfz3ZC6WLW4mtn2q2nN3t@vger.kernel.org, AJvYcCXjfLixq6tL1eCZ9QKaDop83O0/NXAnB7/YWEDHaIKXOGfLbyr3rezCi2lepv4bYKu9NejoaSEIb8cl@vger.kernel.org
X-Gm-Message-State: AOJu0YyS+8058R+C/31G7c7Urz+U3nWNeX8/5bOgY8dIcTNKwdUpqHxd
	d6sZ22zqpUtmlnUXI/okfirf8LzsNwGSUoyTNrS5NAgli6ii2Q7u
X-Gm-Gg: ASbGncuaNkJbVcLOsOMPQjJd3SmjG1htBsrYjhLkbjPL1TWs05y2aaYncCyvvODqOm3
	e9EYsxyrvPd0TgpzJ2zLoZWpR3sra5n5E9SInTjZJtb+vLOapxs6upV5Bo6CMzBob+KqTcjpLRU
	YGoCvP4CRAOkzXHvg98ArlDRX62eDRXFY4Q0VAnPlqmbeJUFOmJKSyhB2lSwKlp6MwXJ4svpHBc
	gq2Ub9eOwzeQUOtMKqGHMS8mL4zU9EayVK/Ssox21AHeNFAUkNAB1tbrpEa65IkmbVF0/NG+m4n
	3SW4cn333RTvJHZ2W3X+P0kye9Bfb99Q/MPINbUVjpUgYv0=
X-Google-Smtp-Source: AGHT+IF7SJcccsnduHu5jkJ1HbC4GEiPiOtNh2rR3korl8q/qcNX1wm/k+UK3bdTUJsbs0O2ZRIG/Q==
X-Received: by 2002:a05:6512:3501:b0:549:5802:b32d with SMTP id 2adb3069b0e04-54c232bf59bmr4492580e87.3.1744102049115;
        Tue, 08 Apr 2025 01:47:29 -0700 (PDT)
Received: from mva-rohm ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d57csm1453096e87.182.2025.04.08.01.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:47:28 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:47:24 +0300
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
Subject: [PATCH v3 13/14] regulator: bd96801: Support ROHM BD96806 PMIC
Message-ID: <5d15660e0e71c70fda8df1694bec0e4fba7f251e.1744090658.git.mazziesaccount@gmail.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jL7ECNHk55Y7tZrA"
Content-Disposition: inline
In-Reply-To: <cover.1744090658.git.mazziesaccount@gmail.com>


--jL7ECNHk55Y7tZrA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ROHM BD96806 is from the software perspective almost identical to
the ROHM BD96802. The main difference is different voltage tuning
ranges.

Add support differentiating these PMICs and provide correct voltages
for both models.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Mark Brown <broonie@kernel.org>

---
Revision history:
v2 =3D> v3:
 - Fix initial voltage values
 - Add a define for BD96806 voltages to help spotting mistakes in values
   filled to the respective PMIC's regulator descs
---
 drivers/regulator/bd96801-regulator.c | 69 +++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96=
801-regulator.c
index 9c7109a2ab96..24d21172298b 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -182,6 +182,10 @@ static const struct linear_range bd96805_buck_init_vol=
ts[] =3D {
 	REGULATOR_LINEAR_RANGE(3300000 - 310000, 0xed, 0xff, 0),
 };
=20
+/* BD96806 uses same voltage ranges for bucks as BD96805 */
+#define bd96806_tune_volts bd96805_tune_volts
+#define bd96806_buck_init_volts bd96805_buck_init_volts
+
 static const struct linear_range bd96801_ldo_int_volts[] =3D {
 	REGULATOR_LINEAR_RANGE(300000, 0x00, 0x78, 25000),
 	REGULATOR_LINEAR_RANGE(3300000, 0x79, 0xff, 0),
@@ -966,6 +970,70 @@ static const struct bd96801_pmic_data bd96805_data =3D=
 {
 	.num_regulators =3D 7,
 };
=20
+static const struct bd96801_pmic_data bd96806_data =3D {
+	.regulator_data =3D {
+	{
+		.desc =3D {
+			.name =3D "buck1",
+			.of_match =3D of_match_ptr("buck1"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_BUCK1,
+			.ops =3D &bd96801_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96806_tune_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96806_tune_volts),
+			.n_voltages =3D BD96805_BUCK_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_BUCK1_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_BUCK1_VSEL_REG,
+			.vsel_mask =3D BD96805_BUCK_VSEL_MASK,
+			.ramp_reg =3D BD96801_BUCK1_VSEL_REG,
+			.ramp_mask =3D BD96801_MASK_RAMP_DELAY,
+			.ramp_delay_table =3D &buck_ramp_table[0],
+			.n_ramp_values =3D ARRAY_SIZE(buck_ramp_table),
+			.owner =3D THIS_MODULE,
+		},
+		.init_ranges =3D bd96806_buck_init_volts,
+		.num_ranges =3D ARRAY_SIZE(bd96806_buck_init_volts),
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&buck1_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(buck1_irqinfo),
+		},
+	},
+	{
+		.desc =3D {
+			.name =3D "buck2",
+			.of_match =3D of_match_ptr("buck2"),
+			.regulators_node =3D of_match_ptr("regulators"),
+			.id =3D BD96801_BUCK2,
+			.ops =3D &bd96801_buck_ops,
+			.type =3D REGULATOR_VOLTAGE,
+			.linear_ranges =3D bd96806_tune_volts,
+			.n_linear_ranges =3D ARRAY_SIZE(bd96806_tune_volts),
+			.n_voltages =3D BD96805_BUCK_VOLTS,
+			.enable_reg =3D BD96801_REG_ENABLE,
+			.enable_mask =3D BD96801_BUCK2_EN_MASK,
+			.enable_is_inverted =3D true,
+			.vsel_reg =3D BD96801_BUCK2_VSEL_REG,
+			.vsel_mask =3D BD96805_BUCK_VSEL_MASK,
+			.ramp_reg =3D BD96801_BUCK2_VSEL_REG,
+			.ramp_mask =3D BD96801_MASK_RAMP_DELAY,
+			.ramp_delay_table =3D &buck_ramp_table[0],
+			.n_ramp_values =3D ARRAY_SIZE(buck_ramp_table),
+			.owner =3D THIS_MODULE,
+		},
+		.irq_desc =3D {
+			.irqinfo =3D (struct bd96801_irqinfo *)&buck2_irqinfo[0],
+			.num_irqs =3D ARRAY_SIZE(buck2_irqinfo),
+		},
+		.init_ranges =3D bd96806_buck_init_volts,
+		.num_ranges =3D ARRAY_SIZE(bd96806_buck_init_volts),
+	},
+	},
+	.num_regulators =3D 2,
+};
+
 static int initialize_pmic_data(struct platform_device *pdev,
 				struct bd96801_pmic_data *pdata)
 {
@@ -1264,6 +1332,7 @@ static const struct platform_device_id bd96801_pmic_i=
d[] =3D {
 	{ "bd96801-regulator", (kernel_ulong_t)&bd96801_data },
 	{ "bd96802-regulator", (kernel_ulong_t)&bd96802_data },
 	{ "bd96805-regulator", (kernel_ulong_t)&bd96805_data },
+	{ "bd96806-regulator", (kernel_ulong_t)&bd96806_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, bd96801_pmic_id);
--=20
2.49.0


--jL7ECNHk55Y7tZrA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmf04psACgkQeFA3/03a
ocWuJAf7BTTq1cgeHyLXfHiSUYiLUW8K7jHUnChE/qmWYQgO6MI2km+HfrGxqOOH
b3zFazhgcATq257LuAQTbKBjeKh0Tcv40rnGK3nkN+KLohjKWJ8v5Z6Pk06Metk/
HII+xggTRTBv1jtvzb/NyrHQKHZheGQyLa0fe7zD+wdGeN8L/1z+NrBajgtbRviM
MX4gQaLOZxQ1PVETKkInLjjKUR/5xvGPX5ufOzRYsIV55mpiwtcN3oeVL8oNB8xg
O3LdFZcJKoK0uQzdTktyr/1zLhmx/ADLxmh82jF7Tckt7mg5yP86Wo9moPpkfno4
1EFnzk+0641H0QKP0de2HmOoXcCYfA==
=UbfD
-----END PGP SIGNATURE-----

--jL7ECNHk55Y7tZrA--
