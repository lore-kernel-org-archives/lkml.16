Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54D8263C76;
	Tue,  8 Apr 2025 08:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101651; cv=none; b=TAg9MwTotT8a/TgGOh+S1EMqp4T9+//nboHOzTOICVjfOAkotxbtI5engo1faNaNBEL7PbQvTElCy0apim4fZqT+UWDy6wsMZ2qJQuAh9mwKrLhIseIjoTIjbgN4I0T49radLrVhzankJSsTw2cN+dxU4LJeFz5OXgAmRt5lPkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101651; c=relaxed/simple;
	bh=6g0o8rlNt0So59LR2hUaKRMSF/T/nPzkvmVQ5bwYDUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlewxuvxSdCYenBMAleV2agXCbtMZThBV0jwH3zSl1WnWiCfo45ej3Ct6bqVwLhZxPVO775OJEVjzO4Tns32h0lXbo+rDgeJqpk715pQxXs4hYDepEL9LGJHU551L7TnDY5aGoOuQ2xMdpCbmAniU/FKjZUU2j4tEJV2fhdJW7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWHg/ECP; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWHg/ECP"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b10594812so5892381e87.1;
        Tue, 08 Apr 2025 01:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744101648; x=1744706448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tk/UFTEG9gpMYlZtIRnpVtRB71+cOedxfBYqxv4vnT8=;
        b=kWHg/ECPbekX3gUVoK7TG2vlQ56AsTthj5PP4VHZ9WD5o/8JP/Y2W1TBkyBiQwScwP
         3XGQ+HuQOo28bV1nB1Rt3zgJQVJxhhAcl4ZBEHUB/6CJW11qZHvVzLM/M1Fc0BjrcOHL
         /qDdxIxzwJLgdsHNYfgoGiYK1PMPnZAmA5OeT+gO6Icvg/r0Lf3FMWxwbSSMnp/i+iB3
         dIqspjBT9NBjL7ah1ymHSc6vXJHWQtlqoIfdf4Ad0A9IIfKcS5zDLtumG6x0hE6uvjKp
         kxLX71Ym7asNN9VnDJ5tVJEw/t8ytIxmLAq09F2V429OKJkTpCvH3FqSBWJL0YZh9LW2
         NtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101648; x=1744706448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tk/UFTEG9gpMYlZtIRnpVtRB71+cOedxfBYqxv4vnT8=;
        b=DFqDe49lfVfDvCjmZ0BY6fICjqJuSdjvw/0pgxG6Pi4wyAFH50vJ3+x8L/22cC0t+u
         J90mqosWyRaTa1+eNlG5lAo8FvUn4lLCZfawuEoxFCmN6IPkP4nhnn3wVR1Pt+o56eGd
         2tKN7nLa9f2qwtjXIG0ZjDw+ZgNYMo13hcjzBJEPL8Ja1xo59tw5ptwmoTP0TFdf98Im
         mVoQp7xtXO2Wc3yhMOGRKKwXdsLqKCwkwEr9V+QWXk8EOBPnEswBmWv70mvi+eReUIWH
         g3r3crZ0b8AvBuaUDhjZzagOBjf1LxoM/LaQFaK3iuBzsHVCsW5d5pPgxorLivU7yEN1
         7Jfg==
X-Forwarded-Encrypted: i=1; AJvYcCUUu8SUhZkkQzUJXGmNpMFjJBtv9UL3t4Q1ba8OterZbdDuvPP/2nx32znku/9AVhCmUMyVjSJ4CSM+DzM+@vger.kernel.org, AJvYcCUpCt8cYagdRVXHXUh2waEjGxbFr6Otm3ayON3u7Baf8YjXAVm5E3EXJ3webbnEhQD321zdQA9gj/Vm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7XKQwZyEVb2H644w9gCg32qOwDUrqPDU6grp1FDT3I2qMxZ/S
	OCr3jJbxWxjaJGzp5jcrmBBfLsJOedtLCAWRVMoF6AkYmLuYNdjn
X-Gm-Gg: ASbGncsoxzMky2vT8HAFjUxQZW7itZWXwh/LrdwVQRUPc/A6bEt9AQZz1OGv16uwZWf
	GV2ZFhiM8lfMRP6eZhEr4GqhGDMSEs6qaeErZukFUEJM+oOb1f7e+HFfbNU40yZqngm27vQwdzw
	IHZVJwKPSZHxJ1vwSeHjJNTuHyGCvwhc/elAH8g4Hz+NVB98mArOPlVpU1kf7G910QFpQ4d/k7B
	G5lZe2JxXyh6k9lROJGG1VoRnsOjKYQKcs7lzbVcyp8gfKzZ/ahzop3oVcAN2RASybWxF06tv8n
	g8c98+bgIIManIhbt7NkmbLt8HQzB9JyY2CF9jSFr5OGlu0=
X-Google-Smtp-Source: AGHT+IH1lqZkx3x6KkMxDwL0tiqrt9uhBg+ACTP3H4QEs+keahtse6WqTRkhYM0ElgD5zHg7AIwf0Q==
X-Received: by 2002:a05:6512:696:b0:542:91a5:2478 with SMTP id 2adb3069b0e04-54c232fa97bmr4745151e87.32.1744101647730;
        Tue, 08 Apr 2025 01:40:47 -0700 (PDT)
Received: from mva-rohm ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab81fsm1474671e87.4.2025.04.08.01.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:40:46 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:40:41 +0300
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
Subject: [PATCH v3 01/14] dt-bindings: regulator: Add ROHM BD96802 PMIC
Message-ID: <df7983e7c623041f14a4fbe409a2cff846e68a05.1744090658.git.mazziesaccount@gmail.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9TAgYV7IQ+9rs/T3"
Content-Disposition: inline
In-Reply-To: <cover.1744090658.git.mazziesaccount@gmail.com>


--9TAgYV7IQ+9rs/T3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

BD96802Qxx-C is an automotive grade configurable Power Management
Integrated Circuit supporting Functional Safety features for application
processors, SoCs and FPGAs. BD96802 is controlled via I2C, provides two
interrupt lines and has two controllable buck regulators.

The BD96802 belongs to the family of ROHM Scalable PMICs and is intended
to be used as a companion PMIC for the BD96801.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
 v1 =3D> :
  - No changes
---
 .../regulator/rohm,bd96802-regulator.yaml     | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd9680=
2-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd96802-regul=
ator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd96802-regula=
tor.yaml
new file mode 100644
index 000000000000..671eaf1096d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd96802-regulator.ya=
ml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/rohm,bd96802-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD96802 Power Management Integrated Circuit regulators
+
+maintainers:
+  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+
+description:
+  This module is part of the ROHM BD96802 MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/rohm,bd96802-pmic.yaml.
+
+  The regulator controller is represented as a sub-node of the PMIC node
+  on the device tree.
+
+  Regulator nodes should be named to buck1 and buck2.
+
+patternProperties:
+  "^buck[1-2]$":
+    type: object
+    description:
+      Properties for single BUCK regulator.
+    $ref: regulator.yaml#
+
+    properties:
+      rohm,initial-voltage-microvolt:
+        description:
+          Initial voltage for regulator. Voltage can be tuned +/-150 mV fr=
om
+          this value. NOTE, This can be modified via I2C only when PMIC is=
 in
+          STBY state.
+        minimum: 500000
+        maximum: 3300000
+
+      rohm,keep-on-stby:
+        description:
+          Keep the regulator powered when PMIC transitions to STBY state.
+        type: boolean
+
+    unevaluatedProperties: false
+
+additionalProperties: false
--=20
2.49.0


--9TAgYV7IQ+9rs/T3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmf04QkACgkQeFA3/03a
ocXyzQgAvuYk9R/hcXD8fKGKEXMPv0JNEeDCngPw0u0T6KjeL705Bn+mvKc1v2Pv
ixokhN2FrZan+fwOoaUU0JCPkgE7YWeaCHaR0il2h/gWYwnHja+yOtzrX3Lrv901
vhr+A7CX4RtaX1dSjdwZvERg4sOjS30CxSoATJFbGGVWxK98FJ5FUxN3e2o0v9Zu
HpxitZ8LeUjDOmOZywz1zpfDsJBZQ96MT+4WcSIwYQPsqDGDGOJnWpGXYOzLQC99
m0soFu9V5w5cPJ4j1Zif+roAHJ5m0G8dPGnK61ViFyWUMQpyGBOW6gLxQcUFhkkB
Cst6qlYOCZfyBNebcQfc3tonY4uVBQ==
=ohuK
-----END PGP SIGNATURE-----

--9TAgYV7IQ+9rs/T3--
