Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB02217722;
	Tue,  8 Apr 2025 08:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101942; cv=none; b=Haj0qV5gaxijOeuU7ug8BUsdHS1fyVt5xFk1DdHUzxs+yCIKGGbtCdgdFkxxcvq5mw0VCuYJ/UFnUNLL89JKOA8Wjy6aVpzlGz3gNKl3jvLkLVSPWF0h7zHvoVfxwrLteBnU+S5dpijf3q4LMD0WP9Net1It5PS7/Rms9bXsy10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101942; c=relaxed/simple;
	bh=sLvf21rVNWomUQG5k9ZPTcaWpn10t+lcmpz+HNHsmtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ebg6vYB+GQmtgftYRyKoOCJnw1gEVadB+NIWhaPdTS60G2DnVXSfhq+pWV5ZQ2PUvH8R+21CjRhcYC8gP4mOtEOtRoR1MnLiNr4npCf7tuVZj8bLyJE3cg9C9szWR+rLZnMkibWfEUhdiPLsJb2R4WZb978lSsxo4LH6nICOcpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGiMFZpd; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGiMFZpd"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-549967c72bcso6386712e87.3;
        Tue, 08 Apr 2025 01:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744101939; x=1744706739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fiASz7X6YTLEoQItcOUoHHCw8d0tzecDYkytVX747ww=;
        b=WGiMFZpdiH/nlxvH8gIwUsNjwvgBMV/48GYOh32OEAk+ZtpQwAL2PRb5l0jCirUiua
         x0sn6enKhU+oL6P2TG6gMmbXRxRSv43AJVFI86AGHbchgCxYtSMFwlRMcEuPLthNez50
         PuYl+E+xecfNrH3qRCmE4bXRgcsuuBMkUI3lLWHu+O0SlHtDAF0R+q6R/f33YowtITcG
         vJzocT2uuXtvRort+6IwPejD6naoXzWwmCCj5GW0R2/mcqyzrhdAw10VxyFu9lPvgZAd
         VD+j8gUQIQ9AG0T+ZYEUs4kBYSdod3LZJFjSzCI9OTOecME8HOiwlh5I/1z2l+QM3j7Z
         w7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101939; x=1744706739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiASz7X6YTLEoQItcOUoHHCw8d0tzecDYkytVX747ww=;
        b=mlohmxh17H+KaqEG1MCWQRqAdHNWSro6irHhu4d1Vey4xSVaYzCxhBwdvIj/xjIdim
         Splzp5CuVFtH9Qc1/rELlPEYX2FCdXjaVOS7x0NhjlGNDj8pDQmC4Xr+CWVBBdPANs4F
         3yUBiEgZHqjrNA20rQLAH7vfG7Pmpk9X0LITcj3SfIoGEFfnLh9ryyyVGlxCX9CeJSpR
         3nwpLRPwFU6g9bC8L5waR+EqHsXvzZUzul6ZCQXZovFXu6ktMb3tvj7KwxErngvECUha
         N4Pq35MUbX29ZucMnQ90KAVXjA0Ko0JKGkH3juZ5Eb8e2pC2VbpBrWUVfnO0ZIrA7eAQ
         pLLw==
X-Forwarded-Encrypted: i=1; AJvYcCUYeAXXTq3j4MBNiNeMKUhMr68bhKO/1Mc57ZUJkS3bVMF5WObu7/XV5CP1OPn/d2th1ZXZPtSdlsSz1tzv@vger.kernel.org, AJvYcCWEe4WKqOCTkmmD2yLlvseZUGeL/rBhNt9CIqdXQYUk1Hyp6lfUpoVGtjZMEh6DSJxAeewfFkkd3WWQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxItkJnZdmexr1EQuq/vCjv18l5tWa1d4b8gSOmIstIwwCxgFz1
	YUbmPKMleo9YhUBoe3V0cu3dC6lslagRTmxl3Zn8gtPEllA/1QOk
X-Gm-Gg: ASbGncsxqv/826BTJfZiXCTLQoyVFWJUm6lrKFB8A8dpKE4t/L9xeuXn2ydilXt8FWi
	sc0oIXrczACusT9AMnm09cOZysD7WaZdmFdi6nMp8bf0QTzpFX6r7NYPFPqzPO9GUOwXNc6U5CZ
	k0Zt/SDa1BdOutZyGq+hf9UWYVt+5EdEzSfhLlEb/PM/hVkBx64OXu0ouSthPGb9zx/2wfxLuxd
	y7aK7TR9csFpOkNT4l6voQRvjsKqU7in59iyYg/m9HIIRGLnFcA87DC/kcXFo3Tx+HwVG1GvX2x
	uEC9++/r4bPk6yzXFToiMUqshHSOCEQPm2MNQiITWypL0TM=
X-Google-Smtp-Source: AGHT+IFY1WB0syv81ug/dqCCGJDSDg/3wtxzQRQj8mpjqeXIQIR57DK5+WuACwfvz9qnRDOhLfgvXw==
X-Received: by 2002:a05:6512:2250:b0:54b:e9b:db23 with SMTP id 2adb3069b0e04-54c233752e4mr4096866e87.37.1744101938749;
        Tue, 08 Apr 2025 01:45:38 -0700 (PDT)
Received: from mva-rohm ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635c7dsm1449533e87.144.2025.04.08.01.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:45:37 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:45:34 +0300
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
Subject: [PATCH v3 07/14] regulator: bd96801: Drop IC name from the IRQ
 resources
Message-ID: <73ec2425655ab19c9f0cf990419641ad36561590.1744090658.git.mazziesaccount@gmail.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZmLH3/FVCnQZwSAe"
Content-Disposition: inline
In-Reply-To: <cover.1744090658.git.mazziesaccount@gmail.com>


--ZmLH3/FVCnQZwSAe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The resources generated in the BD96801 MFD driver are only visible to
the sub-drivers whose resource fields they are added. This makes
abbreviating the resource name with the IC name pointless. It just adds
confusion in those sub-drivers which do not really care the exact model
that generates the IRQ but just want to know the purpose IRQ was
generated for. Thus, as a preparatory fix to simplify adding support for
ROHM BD96802 PMIC the IC name "bd96801-" prefix was dropped from the IRQ
resource names. Adapt the regulator driver to this change.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
 v1 =3D> :
  - No changes

NOTE: This commit shall break the driver unless
5ba9557e5d41 ("mfd: bd96801: Drop IC name from the IRQ resources")
is also included. Compilation should not be broken though so squashing
should not be mandatory as long as both this regiulator commit and the
MFD commit will end up in same release.
---
 drivers/regulator/bd96801-regulator.c | 83 +++++++++++++--------------
 1 file changed, 40 insertions(+), 43 deletions(-)

diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96=
801-regulator.c
index 3a9d772491a8..48cdd583e92d 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -198,89 +198,89 @@ struct bd96801_irqinfo {
=20
 static const struct bd96801_irqinfo buck1_irqinfo[] =3D {
 	BD96801_IRQINFO(BD96801_PROT_OCP, "buck1-over-curr-h", 500,
-			"bd96801-buck1-overcurr-h"),
+			"buck1-overcurr-h"),
 	BD96801_IRQINFO(BD96801_PROT_OCP, "buck1-over-curr-l", 500,
-			"bd96801-buck1-overcurr-l"),
+			"buck1-overcurr-l"),
 	BD96801_IRQINFO(BD96801_PROT_OCP, "buck1-over-curr-n", 500,
-			"bd96801-buck1-overcurr-n"),
+			"buck1-overcurr-n"),
 	BD96801_IRQINFO(BD96801_PROT_OVP, "buck1-over-voltage", 500,
-			"bd96801-buck1-overvolt"),
+			"buck1-overvolt"),
 	BD96801_IRQINFO(BD96801_PROT_UVP, "buck1-under-voltage", 500,
-			"bd96801-buck1-undervolt"),
+			"buck1-undervolt"),
 	BD96801_IRQINFO(BD96801_PROT_TEMP, "buck1-over-temp", 500,
-			"bd96801-buck1-thermal")
+			"buck1-thermal")
 };
=20
 static const struct bd96801_irqinfo buck2_irqinfo[] =3D {
 	BD96801_IRQINFO(BD96801_PROT_OCP, "buck2-over-curr-h", 500,
-			"bd96801-buck2-overcurr-h"),
+			"buck2-overcurr-h"),
 	BD96801_IRQINFO(BD96801_PROT_OCP, "buck2-over-curr-l", 500,
-			"bd96801-buck2-overcurr-l"),
+			"buck2-overcurr-l"),
 	BD96801_IRQINFO(BD96801_PROT_OCP, "buck2-over-curr-n", 500,
-			"bd96801-buck2-overcurr-n"),
+			"buck2-overcurr-n"),
 	BD96801_IRQINFO(BD96801_PROT_OVP, "buck2-over-voltage", 500,
-			"bd96801-buck2-overvolt"),
+			"buck2-overvolt"),
 	BD96801_IRQINFO(BD96801_PROT_UVP, "buck2-under-voltage", 500,
-			"bd96801-buck2-undervolt"),
+			"buck2-undervolt"),
 	BD96801_IRQINFO(BD96801_PROT_TEMP, "buck2-over-temp", 500,
-			"bd96801-buck2-thermal")
+			"buck2-thermal")
 };
=20
 static const struct bd96801_irqinfo buck3_irqinfo[] =3D {
 	BD96801_IRQINFO(BD96801_PROT_OCP, "buck3-over-curr-h", 500,
-			"bd96801-buck3-overcurr-h"),
+			"buck3-overcurr-h"),
 	BD96801_IRQINFO(BD96801_PROT_OCP, "buck3-over-curr-l", 500,
-			"bd96801-buck3-overcurr-l"),
+			"buck3-overcurr-l"),
 	BD96801_IRQINFO(BD96801_PROT_OCP, "buck3-over-curr-n", 500,
-			"bd96801-buck3-overcurr-n"),
+			"buck3-overcurr-n"),
 	BD96801_IRQINFO(BD96801_PROT_OVP, "buck3-over-voltage", 500,
-			"bd96801-buck3-overvolt"),
+			"buck3-overvolt"),
 	BD96801_IRQINFO(BD96801_PROT_UVP, "buck3-under-voltage", 500,
-			"bd96801-buck3-undervolt"),
+			"buck3-undervolt"),
 	BD96801_IRQINFO(BD96801_PROT_TEMP, "buck3-over-temp", 500,
-			"bd96801-buck3-thermal")
+			"buck3-thermal")
 };
=20
 static const struct bd96801_irqinfo buck4_irqinfo[] =3D {
 	BD96801_IRQINFO(BD96801_PROT_OCP, "buck4-over-curr-h", 500,
-			"bd96801-buck4-overcurr-h"),
+			"buck4-overcurr-h"),
 	BD96801_IRQINFO(BD96801_PROT_OCP, "buck4-over-curr-l", 500,
-			"bd96801-buck4-overcurr-l"),
+			"buck4-overcurr-l"),
 	BD96801_IRQINFO(BD96801_PROT_OCP, "buck4-over-curr-n", 500,
-			"bd96801-buck4-overcurr-n"),
+			"buck4-overcurr-n"),
 	BD96801_IRQINFO(BD96801_PROT_OVP, "buck4-over-voltage", 500,
-			"bd96801-buck4-overvolt"),
+			"buck4-overvolt"),
 	BD96801_IRQINFO(BD96801_PROT_UVP, "buck4-under-voltage", 500,
-			"bd96801-buck4-undervolt"),
+			"buck4-undervolt"),
 	BD96801_IRQINFO(BD96801_PROT_TEMP, "buck4-over-temp", 500,
-			"bd96801-buck4-thermal")
+			"buck4-thermal")
 };
=20
 static const struct bd96801_irqinfo ldo5_irqinfo[] =3D {
 	BD96801_IRQINFO(BD96801_PROT_OCP, "ldo5-overcurr", 500,
-			"bd96801-ldo5-overcurr"),
+			"ldo5-overcurr"),
 	BD96801_IRQINFO(BD96801_PROT_OVP, "ldo5-over-voltage", 500,
-			"bd96801-ldo5-overvolt"),
+			"ldo5-overvolt"),
 	BD96801_IRQINFO(BD96801_PROT_UVP, "ldo5-under-voltage", 500,
-			"bd96801-ldo5-undervolt"),
+			"ldo5-undervolt"),
 };
=20
 static const struct bd96801_irqinfo ldo6_irqinfo[] =3D {
 	BD96801_IRQINFO(BD96801_PROT_OCP, "ldo6-overcurr", 500,
-			"bd96801-ldo6-overcurr"),
+			"ldo6-overcurr"),
 	BD96801_IRQINFO(BD96801_PROT_OVP, "ldo6-over-voltage", 500,
-			"bd96801-ldo6-overvolt"),
+			"ldo6-overvolt"),
 	BD96801_IRQINFO(BD96801_PROT_UVP, "ldo6-under-voltage", 500,
-			"bd96801-ldo6-undervolt"),
+			"ldo6-undervolt"),
 };
=20
 static const struct bd96801_irqinfo ldo7_irqinfo[] =3D {
 	BD96801_IRQINFO(BD96801_PROT_OCP, "ldo7-overcurr", 500,
-			"bd96801-ldo7-overcurr"),
+			"ldo7-overcurr"),
 	BD96801_IRQINFO(BD96801_PROT_OVP, "ldo7-over-voltage", 500,
-			"bd96801-ldo7-overvolt"),
+			"ldo7-overvolt"),
 	BD96801_IRQINFO(BD96801_PROT_UVP, "ldo7-under-voltage", 500,
-			"bd96801-ldo7-undervolt"),
+			"ldo7-undervolt"),
 };
=20
 struct bd96801_irq_desc {
@@ -741,8 +741,7 @@ static int bd96801_rdev_errb_irqs(struct platform_devic=
e *pdev,
 	int i;
 	void *retp;
 	static const char * const single_out_errb_irqs[] =3D {
-		"bd96801-%s-pvin-err", "bd96801-%s-ovp-err",
-		"bd96801-%s-uvp-err", "bd96801-%s-shdn-err",
+		"%s-pvin-err", "%s-ovp-err", "%s-uvp-err", "%s-shdn-err",
 	};
=20
 	for (i =3D 0; i < ARRAY_SIZE(single_out_errb_irqs); i++) {
@@ -779,12 +778,10 @@ static int bd96801_global_errb_irqs(struct platform_d=
evice *pdev,
 	int i, num_irqs;
 	void *retp;
 	static const char * const global_errb_irqs[] =3D {
-		"bd96801-otp-err", "bd96801-dbist-err", "bd96801-eep-err",
-		"bd96801-abist-err", "bd96801-prstb-err", "bd96801-drmoserr1",
-		"bd96801-drmoserr2", "bd96801-slave-err", "bd96801-vref-err",
-		"bd96801-tsd", "bd96801-uvlo-err", "bd96801-ovlo-err",
-		"bd96801-osc-err", "bd96801-pon-err", "bd96801-poff-err",
-		"bd96801-cmd-shdn-err", "bd96801-int-shdn-err"
+		"otp-err", "dbist-err", "eep-err", "abist-err", "prstb-err",
+		"drmoserr1", "drmoserr2", "slave-err", "vref-err", "tsd",
+		"uvlo-err", "ovlo-err", "osc-err", "pon-err", "poff-err",
+		"cmd-shdn-err", "int-shdn-err"
 	};
=20
 	num_irqs =3D ARRAY_SIZE(global_errb_irqs);
@@ -956,12 +953,12 @@ static int bd96801_probe(struct platform_device *pdev)
 	if (temp_notif_ldos) {
 		int irq;
 		struct regulator_irq_desc tw_desc =3D {
-			.name =3D "bd96801-core-thermal",
+			.name =3D "core-thermal",
 			.irq_off_ms =3D 500,
 			.map_event =3D ldo_map_notif,
 		};
=20
-		irq =3D platform_get_irq_byname(pdev, "bd96801-core-thermal");
+		irq =3D platform_get_irq_byname(pdev, "core-thermal");
 		if (irq < 0)
 			return irq;
=20
--=20
2.49.0


--ZmLH3/FVCnQZwSAe
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmf04i4ACgkQeFA3/03a
ocXeAgf9ERCccNBfYEDRbtOEc5BFkrSpl/Rp91OuTQX26psegrM8SDmODdJHc2xD
hMuDC9lA9mu0aoOTH+zITYHuVNe5srDs4RuoA0CzulKjns6li88XBaT4WPQvQGJs
4tWVdjbzfbabhsLdDHNWkuJlvkPGgUcBwfpXV2lU+dkNFH5Burfu0WSBb4XTfiZa
QG0wRIQnYX/iSNb0d0MY/8F43hoLzgfibts4IXjRvhQFGklVY+5IDBM/FpUv9tQN
CXSqPHT+KSb08JGuMPmCe2ygKQ97gLJxowG/yODTv26MaeFwPY28im2wZDMDEL6Z
IqsJMYHADIC53ddO+K3VffwJTb+n1w==
=nsq+
-----END PGP SIGNATURE-----

--ZmLH3/FVCnQZwSAe--
