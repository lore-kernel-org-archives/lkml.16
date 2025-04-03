Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15698241CB2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670743; cv=none; b=oMYYNbQFuQSZD0qxT+DOXmgSD+YvMW0UOrg4FPjyxtyyfnH8FWxMaA076ZtiQ1C0zrmGNYOYOeii9LHVQTfvDQdogDZ1o4MdMQo/drXAJkZ9skVRA1U1zLSRYlP9TOFPGr1BqpQpJc+ri+Hh8PxsUnDlYKYxi8LP1cueRQ1U+z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670743; c=relaxed/simple;
	bh=eBSaOtqyWe991gSlYJyL39sE3ZfA8WvCAtDmKcJjlV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BK8LyI1gwrykD6hm9wx8Hinkyqziu5UJsNScIj22WlVOSLbQkXWMGdNXDSY++5wZbhviQoLitktWUOj8HgX+NUGnWD18Q4YbLWvaxUVUIE515agpqQdDDS+WHH9yiOlXQkG9pISDd8ZwA1d/RmncdTngr7jr6Dc7xxcyuglKt7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cY0Nnwp5; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cY0Nnwp5"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so1167618a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670739; x=1744275539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+M3GihTjnRn1Hrg1CuNjUwnXLbiE9TQN/WleV7zPWg=;
        b=cY0Nnwp5I/MG2UQCN5wjD7QuohUOEvoiHhMIN+hzvjQrqXl9zZhLAbYNUIlmW21ntU
         h8ZvVGIK02i8d+P7rKJDrlheKXoWqwT9pzHlpSgGQf4lBhunUQYp8t5wwGuB1jJ+y4/y
         DtDj7LuX+wqqqBNY07Tlp3U6yaSwSdKbD3Ing/VvZk+LJdL08Zlw0kygLvmoAarhmIDw
         0DNhjyeV2wIu/2KqAoJL2MtbHONyihBtERWNemLxoEz2jJgNBX5cFAArbGDl8GySrQR0
         jtL7T+Mcqlj2SmIJPWm3hrrYLNEC0PLrhuJ4C3KxVMhe4/j0VuViNtZv2YX8hnWO+GNY
         z8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670739; x=1744275539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+M3GihTjnRn1Hrg1CuNjUwnXLbiE9TQN/WleV7zPWg=;
        b=V8QxD+5UsOhff9pUkBq6dTLPXlgdFjAqeV9CkDRbYD4lpZFFJqpIxA+ds0hGFU8zPW
         v5/Kty2FXM/nnw+u3rs03MTAV0GrgVZpe6v9vSpAmVxsq4jQIiJw4URMFH93DRSGUsU/
         zG+5tApUw0nRjb/KTjnOsTa34nX3CE2uz3NRi44uvPtSCVQOe+KAL8R/RPL3GDeWi13L
         Ia/HZRAxdOZ+eW4axsj37wh1pkx14plf6z1l0ic/s8asL9qs7cVxkO0DEu0dV6YduJ7c
         +0m+m9KrhAb/MSzb3vRWAbkL0EukF5Msq5m6N2YnjAVRWewohS8fyPdmKd4DVZXe7T64
         kv3g==
X-Forwarded-Encrypted: i=1; AJvYcCW3/kRWpq4hO4ciiN7XoAQ9qtC8p4AVxgea1D2L4//oT3E96YCMUnikO8w+Ud1wKITPDnWbHTCXfvyen3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGPLv840g0IEJBX7xObrtAP+Bqp5qepZn7WeEq/pymZpxKVITX
	WEINsII9Co2zbT3NCwbiYZuRi3rP3VkNTcIGzbrgo0B2kIf2i31pcbyqz7U/VO4=
X-Gm-Gg: ASbGncuwtONTG+/2UfUq9n74SnipyoC7ddnyskOZfkLjr96CygB0S5kM8TjLBkx4qsc
	KsTmTs+Y7f8yB9GdRG7ma4aXk8j39yznheBIfwQxjh1RRwHzF0eZHFw4IsCD8ha987BZrpmspMw
	lnDtMS640my+RLKb6motQtJ8fxOzechfdp5fWVGSTMjqmlJF4dF1pq/i/GtMu+auPUL0rkh87kD
	GtRxwsLbKBFtf+55cVNFU69SekN72oa8b2Zag0ju+/kC4M/OggYbicM/145RuZTrKQbqk458tYS
	XaOffDzUFt+cwQEm9rm9cYMVorWZOaHQDC0y0OGJ5KdZ9z1PuUtsh6sB5Hu1B3quDnKoeFj1DG6
	h6qujOk6Crr7kij3gbxjKnVZ87/3tDq51rDjE1D0=
X-Google-Smtp-Source: AGHT+IEO1QurBQVznveFvWun3Jg1GT4794QiV4XVF3U5z9BB/kH5NvSDatCmfwTx4VFKQZlezuZZbw==
X-Received: by 2002:a05:6402:3513:b0:5e5:e396:3f9a with SMTP id 4fb4d7f45d1cf-5edfdf1ce8emr15075770a12.31.1743670739159;
        Thu, 03 Apr 2025 01:58:59 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:58:58 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:53 +0100
Subject: [PATCH v3 01/32] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-1-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Samsung S2MPG10 PMIC is similar to the existing PMICs supported by
this binding.

It is a Power Management IC for mobile applications with buck
converters, various LDOs, power meters, RTC, clock outputs, and
additional GPIOs interfaces.

Unlike other Samsung PMICs, communication is not via I2C, but via the
Samsung ACPM firmware, it therefore doesn't need a 'reg' property but
needs to be a child of the ACPM firmware node instead.

S2MPG10 can also act as a system power controller allowing
implementation of a true cold-reset of the system.

Support for the other components like regulators and power meters will
be added in subsequent future patches.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
* keep 'regulators' subnode required even for s2mpg10 (Krzysztof)

v2:
* drop ACPM phandle 'exynos,acpm-ipc', and expect this to be a child
  node of ACPM directly instead
* allow, but still don't enforce, regulators subnode, to ease adding it
  in the future
* deny 'reg' property, it's incorrect to optionally have it for S2MPG10
* enforce 'interrupts' or 'interrupts-extended' property. S2MPG10 can
  not work without. Note this is done as-is using the oneOf, because
  dtschema's fixups.py doesn't handle this nesting itself
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index ac5d0c149796b6a4034b5d4245bfa8be0433cfab..d6b9e29147965b6d8eef786b0fb5b5f198ab69ab 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-pmic
       - samsung,s2mps11-pmic
       - samsung,s2mps13-pmic
       - samsung,s2mps14-pmic
@@ -58,16 +59,39 @@ properties:
       reset (setting buck voltages to default values).
     type: boolean
 
+  system-power-controller: true
+
   wakeup-source: true
 
 required:
   - compatible
-  - reg
   - regulators
 
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
+        reg: false
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+      oneOf:
+        - required: [interrupts]
+        - required: [interrupts-extended]
+
+    else:
+      properties:
+        system-power-controller: false
+
+      required:
+        - reg
+
   - if:
       properties:
         compatible:

-- 
2.49.0.472.ge94155a9ec-goog

