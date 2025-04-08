Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA60263C76;
	Tue,  8 Apr 2025 08:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101667; cv=none; b=FD/mZGzdmYbhUgWKAzrNhjp3kjoThcgwHgbzG2rNrgF51R2URo622jiN0IyUam226jwMzyNOFWAvYrOoU6BxbaeiLX7uoCF/wzFlKLqKvePNtCwFIL/OooU3h3xksB4cf/ip5AmbaL4g3tRqrHTaom/4zQ4aUtRuFHqqsuLj1Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101667; c=relaxed/simple;
	bh=rbA5kWVn72MochhUrr+TIrCjnhGDliNJF7QO6kl6BnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxekhU8bPRFq4ubUeUDUqBWKvElT+ScTZtjOmYy3Ppl1Q5fKFTxNUsj6EqTdNV0sBkrk9TqH8GZX4XDj5BK34FaITCRhsWfeqhCNUml8Vovyf1dBGeMRaqyWozaoYR90Fo18yrnflpX1E1t7lTdc2xkl4Cw39O3DsJ9LCYe7Xw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUuhzlYB; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUuhzlYB"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so65528671fa.1;
        Tue, 08 Apr 2025 01:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744101663; x=1744706463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AbaNWwhJf4SYFSK7vy9l8dMqnFKzhciPzyfY7gb2cBo=;
        b=YUuhzlYBGZz7057cINic6MYzYz0FIlB6EiLlDbAtRfV6j6yxEt/9vaYkQ/OqBJBnFs
         iqBsgTE10ug6HDzFSwVpGTaqs87DAIVOG5cqGw9/t/61OMJLpPV9LBUlFSAgd+Ngy7bU
         1ToigcjjHxfrEeJJ8NEfLr3vVfBkCJ594Yx8o508YuVo7I4kS63OtroVRx+UIT8OYrih
         lvqV/ii9esG6ob/876DMUr9cN7y84Jfl8xCq+HAouetROgY/QWgje7Yc3K1Up7hqJiz9
         ZrycoTsoBxBbCR0pROhOJDEaaDOiT3M6Mtp/63J6XANNTBhaCVITS/g0CZAQMoV8VgSG
         99JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101663; x=1744706463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbaNWwhJf4SYFSK7vy9l8dMqnFKzhciPzyfY7gb2cBo=;
        b=K7ffGktM5sACFd0tftCfh9c2s4GAlr5lfq0ArUWIpEuyyeDhk5j18kfyfLNy7/MXKr
         bcGUKxavLg2ahIc2BlVbAkXOh3xGcB6Io/9tOzYhU+KNRvRVq/HKSUnQhm0W8Ex2L0EX
         aL6WL7BQd0aj5I9It1o9l9ktT/eYjhkNLj7M3mQlKEzj6SUXQ8FAIMscBv5YmGycmLaI
         +q+uBCLRUIsWlCJL1PIGPaQhnM5s1GxSH7Lwf9AKy3UUkqRauN8b7RBDOWZEc1bsFqr8
         iFQ+fKtTci3oS3QGIdFuJUCcrSJsXuKj78AcVmExbR65lv4Z4m9o1ZG4yYW2F4Ujs6Bz
         BGMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy2HxBT2hNKNAmMdp51QJEJLJYisHxNVe4qJJ0fTARUr0wsrl+VuI5AfX3SDgbSOHVNP+RSdT+86bjRFsa@vger.kernel.org, AJvYcCWxMan8rMZwFLFikTznw3oq1oatIOv/sDUPNFzDMw1xpk9Ty4w6+hqq4Jw4Zm9bm4PEsWAgBIdOq9on@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8j8MMTm3NVYsjS2mi2gk6nXcs43oDQGedIUrjZ8OGLm1iZKL4
	DPm0WirIF0fcaLNyumtfFSm0rMXVY6fdGBfyZqlheVgtV6Q88eQb
X-Gm-Gg: ASbGncvhJn43Ml03LdZK0Xl2gfSXtnQmxlmgycUj/5wKFI3T6B/vsynCwxA+BYeUa/H
	b4dOyNGACrpkl62J9QyubKJsewPK+63EE7pKw6pbWl/2Ie3oE9pDno0049Fc8To81bMQTXWUlv9
	mO9C+MVCJ6ytLcUthy4ojrYdZ3xs3o1fWb40nvcqyGYdiPRlXWHciji5ww5RGRWuZIJURwWKxl/
	6jaBc6QV59lVCwEPDbBFwt23WovE34oVA0X3IqI44FKtlsVIIWmjuEramWxzDISOMcAlMZ28Yxh
	sshd1gtXd9albtk6DHfRl9UJJ6zHJG6B8ZttXoO9ytu8c7s=
X-Google-Smtp-Source: AGHT+IHWmcNXCBMRk5nvKVKyj3/IUAfaW7ZnqctenSVZ/IRv3gGo8Ho4wuyAuY0VgrMTXU+PRKP1zQ==
X-Received: by 2002:a05:6512:324e:b0:549:68a7:177c with SMTP id 2adb3069b0e04-54c3bb909aemr698149e87.7.1744101663012;
        Tue, 08 Apr 2025 01:41:03 -0700 (PDT)
Received: from mva-rohm ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e67232bsm1462570e87.235.2025.04.08.01.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:41:02 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:40:56 +0300
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
Subject: [PATCH v3 02/14] dt-bindings: mfd: Add ROHM BD96802 PMIC
Message-ID: <ed55edffca3b0a2d7e8bcd9ebd8d8abd9a9b7dfe.1744090658.git.mazziesaccount@gmail.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="amvf/jsfoaly+ZEr"
Content-Disposition: inline
In-Reply-To: <cover.1744090658.git.mazziesaccount@gmail.com>


--amvf/jsfoaly+ZEr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

BD96802Qxx-C is an automotive grade configurable Power Management
Integrated Circuit supporting Functional Safety features for application
processors, SoCs and FPGAs. BD96802 is controlled via I2C, provides two
interrupt lines and has two controllable buck regulators.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
 v2 =3D> v3:
  - Drop the description of 'reg'
  - Fix the buck node names in the example (to lowercase)
 v1 =3D> v2:
  - No changes
---
 .../bindings/mfd/rohm,bd96802-pmic.yaml       | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd96802-pmic=
=2Eyaml

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd96802-pmic.yaml b=
/Documentation/devicetree/bindings/mfd/rohm,bd96802-pmic.yaml
new file mode 100644
index 000000000000..ccabbebf9a29
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd96802-pmic.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/rohm,bd96802-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD96802 Scalable Power Management Integrated Circuit
+
+maintainers:
+  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+
+description: |
+  BD96802Qxx-C is an automotive grade configurable Power Management
+  Integrated Circuit supporting Functional Safety features for application
+  processors, SoCs and FPGAs
+
+properties:
+  compatible:
+    const: rohm,bd96802
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      The PMIC provides intb and errb IRQ lines. The errb IRQ line is used
+      for fatal IRQs which will cause the PMIC to shut down power outputs.
+      In many systems this will shut down the SoC contolling the PMIC and
+      connecting/handling the errb can be omitted. However, there are cases
+      where the SoC is not powered by the PMIC. In that case it may be
+      useful to connect the errb and handle errb events.
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - enum: [intb, errb]
+      - const: errb
+
+  regulators:
+    $ref: ../regulator/rohm,bd96802-regulator.yaml
+    description:
+      List of child nodes that specify the regulators.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        pmic: pmic@62 {
+            reg =3D <0x62>;
+            compatible =3D "rohm,bd96802";
+            interrupt-parent =3D <&gpio1>;
+            interrupts =3D <29 IRQ_TYPE_LEVEL_LOW>, <6 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-names =3D "intb", "errb";
+
+            regulators {
+                buck1 {
+                    regulator-name =3D "buck1";
+                    regulator-ramp-delay =3D <1250>;
+                    /* 0.5V min INITIAL - 150 mV tune */
+                    regulator-min-microvolt =3D <350000>;
+                    /* 3.3V + 150mV tune */
+                    regulator-max-microvolt =3D <3450000>;
+
+                    /* These can be set only when PMIC is in STBY */
+                    rohm,initial-voltage-microvolt =3D <500000>;
+                    regulator-ov-error-microvolt =3D <230000>;
+                    regulator-uv-error-microvolt =3D <230000>;
+                    regulator-temp-protection-kelvin =3D <1>;
+                    regulator-temp-warn-kelvin =3D <0>;
+                };
+                buck2 {
+                    regulator-name =3D "buck2";
+                    regulator-min-microvolt =3D <350000>;
+                    regulator-max-microvolt =3D <3450000>;
+
+                    rohm,initial-voltage-microvolt =3D <3000000>;
+                    regulator-ov-error-microvolt =3D <18000>;
+                    regulator-uv-error-microvolt =3D <18000>;
+                    regulator-temp-protection-kelvin =3D <1>;
+                    regulator-temp-warn-kelvin =3D <1>;
+                };
+            };
+        };
+    };
--=20
2.49.0


--amvf/jsfoaly+ZEr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmf04RcACgkQeFA3/03a
ocXjkwgAs1J6m1oknfTtFWGNmU85w4nKfNvojb6ByT7t8dElzzq/feMN83XjUO4q
GufwkutdUKsGOGYl3+i1K6DeCD+xbmPEds1Ta2QZCQwohwk3GkNEGILIGHYU6jH1
VoA8WNtUBJdTKTlXF5Z88oxPoSU4pauJALWkpgpH1Q5o8Vddu21S3gGTkXsu9n6I
fyfFG6D3s8bGJNwrYBRetS5DFZkDntRDzKzMcmTdM811aTVFayKec4/wmZleNAj2
CheA0Lcutyx7USvfH+e9jCD/1cIo/JKYXkcaP5bXomuU7VfiC5EmHTpixWb/DdQP
RMFf4chOVqBOlqv2g4+QMySxKAgHTA==
=ugb9
-----END PGP SIGNATURE-----

--amvf/jsfoaly+ZEr--
