Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D0C218ADE
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025143; cv=none; b=o3q4AEA2aKSq+y5MQgwtNrUIF3Ft5zBdroZ5b9CsiudbR59KGkhUTIXpW4rZpqXABrVJagLxKMsanpL0jaiOZUyBJcIDACRLKJHmM7WaGPqpY0ISY+kyl9c+/1RVToxc0rMI5GH7GUWYZuvoaIqsq129R4R5YAoXCYMujoN0Gxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025143; c=relaxed/simple;
	bh=EslNEbGkoEtGZPgNzSbXr84zl40yV8m1mM0v265VQvE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AGkxz9gTUAJ+xV4ECJTZUB1xR0AkFd9BzpZ1+91gM7U+WG2nYcB6BMO2TixcYmmIS1OKq1QBkkeI3hWd1B7iRQrApj9eyRJuRK/h1nxJSBXyuB56Md0GJ3iTUTeJy61k4RnU3T8kxLWAZ+wosE7JD8Saod7bK2//zCx4to3QHZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mIGpYvuO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mIGpYvuO"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4e6a0c274so630815f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 01:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749025140; x=1749629940; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IMiMkiTF0Z00OlwzviIMPLOkZdxr4W49dCOYPK/ZpVY=;
        b=mIGpYvuOHCjKomlYTQ4uMwwrTevmSOc2ukO3WhCaV+9k+1q4fM57HMI0k9w3sMOWdW
         a9FepbbOSkA7SPSdFhlP09gVt13hivgMKF9ihPA8vQKqv89QlBOFhH8F7cVgd2HNPrg4
         wcGPQGCY4LSGIFdZiKLwo8B6/F5F3bUE7my7R67F3qmgztVK5EOKNE0Do98Xg1OuPQG4
         fD+iyPcfEMYHOy3NPYPEY2xqv3Cfh4SlWWKA1GX8z+XgQDxdBfk7bCYGj4EtfxyUTrCS
         lrEPzf9IFpJJPGoU3BhtCz97KYIRUASVwWNjH4YQ5bIJxple+m28MqRDvShx6KtVIoCj
         PPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749025140; x=1749629940;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMiMkiTF0Z00OlwzviIMPLOkZdxr4W49dCOYPK/ZpVY=;
        b=jZd0qERBovHPh3zUuQDz1uO9St/vG9gWNqZ2y/3MldKSc7imNlvnXRkat9VwFxOtf6
         u9pIh5UBaQL6DbxP5rq/8XuAZk71AikqbRhSAxyrnGeNWZDCofh76SWtxCHwtK3+078X
         dP9K7ZsOjAh4JP4grtWWaQVQISBBC4kV83/aW9P9Op79Y8sADO1US/VIp3+8o+b+dxSt
         dZiyznkT6OUGLsb7TftG6qJNxDLhp8S6kM32pgWM88T3+dTqhbYNSWZYh2a2g9dFk0Ax
         RcWOLrNcRlbGHTn8qqWK+YbkZFN29nXRLvyv7k+5TWcuHn/nnpJ7tfzEX89DcuOfZ8Z1
         zGCA==
X-Forwarded-Encrypted: i=1; AJvYcCWu5628f/X9fL7FMhTn761bNdsaKF4ff3UInL7boRucI98FjefWHF1tktChuA0GhojJRfpWu/MWAajca9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqJxMgdMTWUZCKkMx7Y8Do3mPSoTfO/Ndj8cYiE9zNVsFOIWz5
	qz9SUtbmDji0RLm8xRrMr9vP+Q6gN9j3qZqREKCukU2vElS/VjiLx36TLBir6O+e7Fo=
X-Gm-Gg: ASbGncvMlffoq+uGpvFJZcB9n6+6xwCUr8BnejQcrFH65CnlsG1GpGc4spNu5CxgKKg
	gLeYrd8rw5LOTfDIAiCuySmSU356N6ZTWU8z5yaRxFr4eR4XhJCezwrxrfZRsZlCQ6UB05CrkY4
	yEgXxh/lC4STrI8Tm2Dl8LzCnxckd4ENtY80Z33uy55SSVLXHoeVeQm5BecF4jp3FB8yHFkZr1g
	voX83daegHOV0uvi0DGrArT9VtiYWYJ+Dy7dCkiK3OZ1Q4PhvAvk/DTAAgRiRscgxbFWdKrqQj5
	Dxr1PzcpZF2/kTouM9OguwJG4YvnF1MVGUKc8+dsKZHABsm0ufKx6Rxg/UOmlfXHPEbKyJWr4SU
	djaJMsi3W5y+J70zMBgjrJA==
X-Google-Smtp-Source: AGHT+IGQDltAdK05Fw11inWndjZRxULWek/GxMwsA6OXvhVhdjJ8bm9JYWwetuY8H/FAb8SLNfuwKg==
X-Received: by 2002:a05:6000:1a86:b0:3a4:dd00:9ac3 with SMTP id ffacd0b85a97d-3a51d9789b1mr540032f8f.12.1749025139734;
        Wed, 04 Jun 2025 01:18:59 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d80065e0sm198301215e9.29.2025.06.04.01.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 01:18:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] dt-bindings: power: supply: Few cleanups around
 monitored-battery
Date: Wed, 04 Jun 2025 10:18:20 +0200
Message-Id: <20250604-dt-bindings-psy-monitored-battery-v1-0-7f755ff75218@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEwBQGgC/x2NQQqDMBAAvyJ7diEaLaVfKR5Msto9dCO7oVTEv
 xu8DMxl5gAjZTJ4NQco/dg4S5WubSB+ZlkJOVWH3vWje7gBU8HAklhWw812/GbhkpUShrkU0h3
 908cYKv3YQe1sSgv/78d7Os8L1ghAF3MAAAA=
X-Change-ID: 20250604-dt-bindings-psy-monitored-battery-383ccb383351
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jakob Hauser <jahau@rocketmail.com>, David Heidelberg <david@ixit.cz>, 
 Dmitry Osipenko <digetx@gmail.com>, Tobias Schrammm <t.schramm@manjaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1930;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=EslNEbGkoEtGZPgNzSbXr84zl40yV8m1mM0v265VQvE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoQAFP0q6p3Md047rFs8XK9lvNwEHiD07KFK1wf
 aKho7OfiNOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEABTwAKCRDBN2bmhouD
 10kAD/9+ewY94g516RgISR2hTlXUOvV1mN4U2JDYN0SqKKHDmKhhBY2u1RcUQ2NU9mdDCiQmuES
 AiChnX+LznSGTSV/Fls4v7KJJ/dypq6wZdj1gj0U6iQLkkzymLCyIWUa5JEK+8571B7nmLSN5UQ
 x+P6QAUe87VM4rRg9M0rkMf8W+HxGzoF1Xwpurc+Xix81+3tzQB0ZzTj+oAJiWVRD+c+DLzrgHa
 qgRddcHN/8BnYMRFe3CZz49PyALOigaaPRcnoD/ufic/uWRx/xWgNLdJ0jPANx640WCnEmCHz5r
 ynrwbZuoAGcfQGt1etu+OSxGZWSufd486M/+oEiUYr3XZg03Wmko5G2biwTtBZNVQVIhIf8q0iI
 uV041jbic4CSHpL8GHpLoGuTuHrVdSEK4tKu+G13CKQQT7FR7FSJNE2pguj4tBGTVuifbybMCWT
 bGt67GHwmxFoMqs7JL01a7Rb+pptMbbvr6znG+RBunHrYLSTRcokDt/vj+vf7MtguCQRBHx95bu
 ASkdck1Boudvhdt+rqCkR51K9JAU2slJveMMIX3diTmGB9XcYuO8ZZLrbPTs+x3w7Q2ayHS0etR
 GbkwQWAHa6uj1schUY0nCGnVKGGfAPTXdaU86MLtIHzusWYN5MuxVLocMNiqDgyNoHw1rW1LH7w
 PPsYXMAofsbSIZg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Reference the common power supply schema to bring the definition of
monitored-battery property allowing to drop redundant pieces.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      dt-bindings: power: supply: bq2515x: Add missing power-supply ref
      dt-bindings: power: supply: bq256xx: Add missing power-supply ref
      dt-bindings: power: supply: qcom,pmi8998: Add missing power-supply ref
      dt-bindings: power: supply: richtek,rt5033: Add missing power-supply ref
      dt-bindings: power: supply: summit,smb347: Add missing power-supply ref
      dt-bindings: power: supply: Drop redundant monitored-battery ref

 Documentation/devicetree/bindings/power/supply/bq24190.yaml        | 1 -
 Documentation/devicetree/bindings/power/supply/bq2515x.yaml        | 7 ++++---
 Documentation/devicetree/bindings/power/supply/bq256xx.yaml        | 5 ++---
 Documentation/devicetree/bindings/power/supply/bq25980.yaml        | 4 +---
 Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml | 5 +----
 .../devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml     | 7 ++++---
 .../devicetree/bindings/power/supply/richtek,rt5033-charger.yaml   | 4 +++-
 .../devicetree/bindings/power/supply/stericsson,ab8500-btemp.yaml  | 4 +---
 .../bindings/power/supply/stericsson,ab8500-chargalg.yaml          | 4 +---
 .../bindings/power/supply/stericsson,ab8500-charger.yaml           | 4 +---
 .../devicetree/bindings/power/supply/stericsson,ab8500-fg.yaml     | 4 +---
 .../devicetree/bindings/power/supply/summit,smb347-charger.yaml    | 5 ++---
 .../power/supply/x-powers,axp20x-battery-power-supply.yaml         | 6 +-----
 13 files changed, 22 insertions(+), 38 deletions(-)
---
base-commit: 3be1a7a31fbda82f3604b6c31e4f390110de1b46
change-id: 20250604-dt-bindings-psy-monitored-battery-383ccb383351

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

