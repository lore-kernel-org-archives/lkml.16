Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B322C19CC11
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050757; cv=none; b=XQk+EWOhcxzbbe1zvZtV8JsSQ0NAJkUr0i5BNZD7JgKkWC5ARQUbeAnnbfW3RY/wkfRn+72lE7S0S5Fbwyb4EFoC5p2hYu1OyPGjMQzn2wq42j9un/2ndAIK/MMx2GzoRiWdjGhCnplYaT2a6qbC0+EdV05kpsGzaAsAm2iuxZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050757; c=relaxed/simple;
	bh=bSQGBA37BpSgsJdlJNGFk9NhBYGGguunmVcoDXGfnjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ft7z1at9u3t4Ip8HKCMWkWHdnNUweHa7t0Ck0QZe0agbPXYmgMnIs6arDMN70WLd7jMJq3ks9Bbb8qcv3C9tlrJp35iWJtD8XOxkgbHyQB4g6C5/vu3I/gfToXxiWRwHOsq+rJpw+Z+URylkKztii/Amn0umSOnDoqJAbnH57Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DGFX2T4L; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DGFX2T4L"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6049431b0e9so11192113a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050752; x=1749655552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVsIds4atv9b1Ndpam+Ic3xTK6Dfgv1Ul4T9xSV77wk=;
        b=DGFX2T4L2ZSmj6paX1JwvA40YP3nsWpLH0f5OAvJkqhTD7f3GyzGcU7z7Hh6IseysM
         VXt/UXiZl19ISEP9RJ0IYYzoKAlvf4uU+oERlo7JFVfTe+Vph9NfZDfO+CaNvDlKS5wX
         PwhmPgbVHnwPjufawdDCHegbm4pkB1HVzwMHG6kHwRKIEOgz+Pr1vZyiP9GpjnPdB4MY
         QeoidF9MLpVKIfs8xrN0kKLs9IDTisc1LUtVJTX/AG+xflu3AXPsu7+nt4A3flDtaYzI
         msmOm2gBJ6USXX5BK49hNtNaz3chcW0KDck5j5lPP/7121j349A1xOAECFgyg6046f1g
         FLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050752; x=1749655552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVsIds4atv9b1Ndpam+Ic3xTK6Dfgv1Ul4T9xSV77wk=;
        b=AgD4bBHUL5szGozgYyTMJJaahz3jNcvY8/ZcgiAcUMU2DMESHdOXCwQtohFCrx+v72
         9K5oCrS8ZS0lyBqPGlG1j0HPjJKo778QQplczmjjRLI8mUZc+XmZk+Io/svb34un57J+
         S+5alt6ggAGiyAIRDgH3Sv3evNrco29OmfJT/SpgvNI9ztIgpxDXTBzKn5cfk2BMzdy0
         UYVXtGPIIhuxJ5SJHJ6ImHF6KEyuene4Eq7NQcqy3y+YPuh8yryHcCeR46K28E061TcE
         dIeqQGCj6Rc/EigTUPEZaprgC5ZfxFSWDHAKd7J6RFq8ilEEde5vYUbTlCDHOjRm+ZSk
         SXMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6rIEchv3dHtyTliwvhNXDVrOYgcyxrNvsD5NMVCEDFM6EFZ26J1JT39v9ne4P3k5WsWNWli79NADijos=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUvgIUi8HqmRyVQvyWlLCYEEW45ZWNrdnrwYhhxYIONpz2+0dX
	K+Ly4p6BMXrUq7P8jDPUMTZKnLxfI5CTkYRtCvztUwfkyk/NQoONTk6emEGMzrigOig=
X-Gm-Gg: ASbGncsq5gWNYqVgKjLUDXTmkCJAm/Ar/ikJq1jX41Ao1Y5NusMih9qY8LzQHH4STdz
	CLiD6tVUnfPWlFFBpBHtro9cDHzh7K5oL0x5V7uZTnnmNWuLT7ZieIgq9RD5FjPdd855wFUa66O
	evQfuU8Y5z9fTMFr9CgTytXJ68PQ+rYr6RPygeiqo5myr8OuGpxaiAkI1YMQ5omDOoEDEboOgJc
	Bl3S5oO89gQtq3DsaiosdZIs/9OMtdRyU3SX5pefMMeFuN1tAqkYrlyr2uxOO1XBXJPbbqQ0L1E
	tv7JRIf+YbVxtyRCKMPvGyYdIRPbK3qjF3jUxqy1n8fIaB0ZT2e8hgUt9RUp9c5MTdw0E2SEqCo
	m5uftJNzPJeP/fWxyMAVnQplwRRAnqokjYZU=
X-Google-Smtp-Source: AGHT+IGmpFLzdEaYYr7iQUhbbgsCIhZWT7QbCctj4zySD94PvS5LvY7Sr6dL7NlPVuoHoEkdg0F3SA==
X-Received: by 2002:a05:6402:34cb:b0:606:a26c:6f50 with SMTP id 4fb4d7f45d1cf-606e944ea6bmr3149657a12.5.1749050746634;
        Wed, 04 Jun 2025 08:25:46 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:46 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:43 +0100
Subject: [PATCH 04/17] dt-bindings: mfd: samsung,s2mps11: add s2mpg10-pmic
 regulators
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-4-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
In-Reply-To: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Add a regulators node to the s2mpg10-pmic to describe the regulators
available on this PMIC.

Additionally, describe the supply inputs of the regulator rails, with
the supply names matching the datasheet.

Note 1: S2MPG10 is typically used as the main-PMIC together with an
S2MPG11 PMIC in a main/sub configuration, hence the datasheet and the
binding both suffix the supplies with an 'm'.

Note 2: The binding needs to switch from 'additionalProperties' to
'unevaluatedProperties', to allow adding the specific -supply
properties for S2MPG10 only, as otherwise we'd have to resort to a
global wildcard with negating inside each of the compatible matches.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 33 +++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index d6b9e29147965b6d8eef786b0fb5b5f198ab69ab..0b834a02368f7867a2d093cbb3a9f374bb2acf41 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -67,7 +67,7 @@ required:
   - compatible
   - regulators
 
-additionalProperties: false
+unevaluatedProperties: false
 
 allOf:
   - if:
@@ -78,9 +78,40 @@ allOf:
     then:
       properties:
         reg: false
+
+        regulators:
+          $ref: /schemas/regulator/samsung,s2mpg10-regulator.yaml
+
         samsung,s2mps11-acokb-ground: false
         samsung,s2mps11-wrstbi-ground: false
 
+      patternProperties:
+        "^vinb([1-9]|10)m-supply$":
+          description:
+            Phandle to the power supply for each buck rail of this PMIC. There
+            is a 1:1 mapping of supply to rail, e.g. vinb1m-supply supplies
+            buck1m.
+
+        "^vinl([1-9]|1[0-5])m-supply$":
+          description: |
+            Phandle to the power supply for one or multiple LDO rails of this
+            PMIC. The mapping of supply to rail(s) is as follows
+              vinl1m - ldo13m
+              vinl2m - ldo15m
+              vinl3m - ldo1m, ldo5m, ldo7m
+              vinl4m - ldo3m, ldo8m
+              vinl5m - ldo16m
+              vinl6m - ldo17m
+              vinl7m - ldo6m, ldo11m, ldo24m, ldo28m
+              vinl8m - ldo12m
+              vinl9m - ldo2m, ldo4m
+              vinl10m - ldo9m, ldo14m, ldo18m, 19m, ldo20m, ldo25m
+              vinl11m - ldo23m, ldo31m
+              vinl12m - ldo29m
+              vinl13m - ldo30m
+              vinl14m - ldo21m
+              vinl15m - ldo10m, ldo22m, ldo26m, ldo27m
+
       oneOf:
         - required: [interrupts]
         - required: [interrupts-extended]

-- 
2.49.0.1204.g71687c7c1d-goog

