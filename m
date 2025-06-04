Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC87218B47E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050748; cv=none; b=hpqLJSzpn2UTNTFY+5bZnVoW7IdzhjxWdXPlcCB1zD03dp2CRE+5rEPk5aS/iGujTgl9swCPXUhpGmgp5b3GtOlyE3r1lY5dp8o8AzOaPN1euWVvsRqmEnQ918iA81uCwD/XXEn5qFEU/gCScfM5Jr99Ee1MIfu4/C5LpJtg9PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050748; c=relaxed/simple;
	bh=/zu0WY1mTLJkmQKe0QzKVdlleBAaRvg5u4/DVEDJoYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qri1V1PaNRJeHSmjs+a4X4gyMDZ8KNcIS0fBXJ/Kt+7O4yucm/ftNMEOCg+KVFOPtMDC9A2tiuw2RHCTtKymUy8v321ebatDWabw9CCo8KQCdC5iqOt9NU4vW0cnK2xKenvrfzCXSPku3GEV9HfbLL7oqlRYICgqSLkyRREioeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qI8omZnY; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qI8omZnY"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso13503486a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050745; x=1749655545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tj36HcfLXbrHMi0m60w9d5+4mHUGkz0YH63xXCl7mlk=;
        b=qI8omZnYK63Gb3gfqVrMQYrcAeOkEb7jdjavka/WAWHIxL/QL5ypm1bm5xzQsrx2DV
         ljun/e+RnC0KerzAN1vGJ07NRXgwlz+wbzV+WsH3g8pzg3UrZfamdIySsqhV9aWnzXrB
         V3vbLMhg9JfSP/rSmTuu6iYGxwXw6KW5pT9DaJ1TBTqs583OYDJ+blmh80W9BZvWb6dE
         mEDCsvZuY0zj7+rwBxMs05Le9ZmeX9pY4At4EzMURjgqoo18iXr7m5Ztkgd5WE1pV9W6
         mR0QY7S4KwByWpvk92AiVpT4jS9MUKHA/2jHtwD1S4UTYUagd/Txp563a9yt3lzQDSGf
         5VoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050745; x=1749655545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tj36HcfLXbrHMi0m60w9d5+4mHUGkz0YH63xXCl7mlk=;
        b=Voo73aya+hD+ERUnML0ytvvGLU8fYAJMFfM2lXCDBH1M/c4i/o36I8zCKzJ7PhtIEB
         g/DRNKnxNOA6HfVSdH7BSmW2k8lNFlpkNefb9+NZNpm0sVZHHbeNnrxD36fqV+A/c/ZW
         xNEHpor6PTOab4E4yJ9vwgN/8h7J3PnJzrqlVmLpbL/HfKw2Q+SyOSGFSQLczZkq1C37
         T235m2twE+yNDRUlFxC3vfWJDSlb7I3K/edPgpL0TXJld+BNDRTNpgXQaCED13gY5/ok
         hqN1kaaDaXwjbutA2pyHGyn//bQJalILD1nRktZnc17pgkbH790uU1jRR2mJKCFmxz3l
         CNfw==
X-Forwarded-Encrypted: i=1; AJvYcCUZDygcKxuI0mMkA1pq9+9wF//iAr4I6XpVLT4g3LbCm71qnhXsl2jKM5HuEmmQEVoQWGXXKFEqFoweNZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC4Pf4ltCy3dACzTNwlmyOrpBXMcHaI4RNToiKhpI9OscmOiyS
	RA75aEsG1Blf2bgeB839EIRP3A8Br6tLffVCop3mtH7RGl7yt/Qm5UitZ+8xFCnIkxQ=
X-Gm-Gg: ASbGncsBP63J994HSRGx1JGKNLSaV1+TYOD0JDnkM/SNlQV8bI3n81M6Iqs8dgU22d+
	0CRyHMUDQ3nEJ2Wr/seskwQVonPgXRbGBVA4qbo0A3gG4/zHjGQh+YPePt51o2aoToh4sHQzft7
	QFzXClMumATSgsiu3EvlSQ0irxKGGhiygnzfjUcoAZ4zOWGKcN6c6Uu0WwYCaqyb8F5G/GRwdNy
	9/fGPQlIOm26Lh/j4YingYzp/D7qLJzAD7EcCakPxLXBYlnOz+6J3VgEK765cRG37wz5sLCnF1C
	lBxeIRd6Ko23PJEJdN+uQcnuiqNKD5F7G1t2EXrNf5nu1rUJzsQeXwGsdGZbVrfy2ejS8+3XVjg
	2WCntLZt/fF5bFqwvTsqgrxB3qtAoR8w7YYdxbkifwy+tRw==
X-Google-Smtp-Source: AGHT+IHDbl+PPXNilHwRHoApPiua2emH1u8FPEEM6gtKEx+PJ/5CtghVWo7/Vf4dwmLj4wdHx4mOIQ==
X-Received: by 2002:a05:6402:510a:b0:602:120c:f8d8 with SMTP id 4fb4d7f45d1cf-606ea179fb9mr3445618a12.18.1749050744799;
        Wed, 04 Jun 2025 08:25:44 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:40 +0100
Subject: [PATCH 01/17] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-1-6038740f49ae@linaro.org>
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

Using lowercase for the buck and ldo nodenames is preferred, as
evidenced e.g. in [1].

Convert the example here to lowercase before we add any bindings
describing the s2mpg1x regulators that will enforce the spelling.

Link: https://lore.kernel.org/all/20250223-mysterious-infrared-civet-e5bcbf@krzk-bin/ [1]
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 9785aac3b5f34955bbfe2718eec48581d050954f..62a3a7dac5bd250a7f216c72f3315cd9632d93e1 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -64,7 +64,7 @@ examples:
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 
             regulators {
-                LDO1 {
+                ldo1m {
                     regulator-name = "vdd_ldo1";
                     regulator-min-microvolt = <700000>;
                     regulator-max-microvolt = <1300000>;
@@ -73,7 +73,7 @@ examples:
 
                 // ...
 
-                BUCK1 {
+                buck8m {
                     regulator-name = "vdd_mif";
                     regulator-min-microvolt = <450000>;
                     regulator-max-microvolt = <1300000>;

-- 
2.49.0.1204.g71687c7c1d-goog

