Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F0324EF8A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691524; cv=none; b=kycKMLkck+/nIPKtsfYclmh+xvXHd0Xvpqm8UxxHlmA+F5wjNtMX2quufBI3m6y0q2n03GLmJE1TsD0ZdQ85BCxm8XI28Z2TJz7z3mw2E7z4uHwAIfIrmTgV0MKlLFUVCh3r6j65QALauhUrGI90ljxgP9HykJWCYn4QvWmLgEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691524; c=relaxed/simple;
	bh=4g9wUdzBEHF2DXwrsn4sDVm7Nmec/oEeQKsxWFnBuaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DlevPi8DKNguFzJIsVNZAOMJU9/OMPUE37Kxl85z5dF+3cVQyKg5QNVupELPyQwZqMq7raPhBK3C1y6iZDOv6FNlyw8Wc5Fpc3A4VcU/PPfMoS9Axzc5IKHhHsm/3edGpcrMoPNytfJlovMm82aZ1/JHY9Nw/PSNq25zTsQ5trE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jOUn3Anl; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jOUn3Anl"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so851075f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743691521; x=1744296321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoVQYZpiH0Di4cmCzPcvMx2OkQBw+j3GHZ8ITdSC16E=;
        b=jOUn3Anl1fhXfGLOdkln2AYeubwj/T8UT1341fOgBzdwQb/HNhOb3N98hZoZ3TS1VR
         1Vg/PJ97Z4jd3uyVpB4bOEz28NBoCmRrREOgirC549dCk3m5ssN0/ypkjpWZZFZFbOZj
         cL2Xu6badHlst9A7zL0PKXxncOU4qdONLbRepG7jW61w+8CVPH8M8XMUoYrW9P6+PBIf
         ViAIf8pGmcas6pDCWrY2uCoB+MvQajlcRtjq0WtJbf9wMyhInvLnAHsB2eoJ1qyrZMMy
         JbR3tt4bJiuMWag6OXJ8GkEKNv9oTEaAhqrOwlI50T/1l2jZR2YErpH6OpdX65JQaY9M
         WnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691521; x=1744296321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoVQYZpiH0Di4cmCzPcvMx2OkQBw+j3GHZ8ITdSC16E=;
        b=A13sR94a4eg9WL0YqGyprndOxBZx0S6sqp0+2ipyT293nF0RMSKFbxOGgkTkI55Pf7
         3TvNlL/Qb9hriJnv0/c6tqYVjT18mlJ6UwSvPfz+qCu2o5+Emy06Q1+W2xrVKcHonUl+
         taCuqvxKgQDA5KRM5aqpeogGAluqJhchnpW9fqiJG5LMA8Jsv80auQkqyEHw6Ivei5TP
         YriEzdS/X8zJIDclYWKU+2UggsEfD1+f0gmtfXdg0kbtq5cAyxVQZaHL9IdN6pani8/S
         PKOr7TINtOsohj7Ue/rmwSvj/wPAeajhPykda17u75fDuJu9X20o889qKbcsbCRJgJw0
         i8bg==
X-Gm-Message-State: AOJu0YyLNno7Iu4TNAgwqoF1bo/o8ijDVsUoGaBpfu0/ofWidNm1wV+S
	VYP9ImKq/vgzj9b7InKLSY3Auezej2xViSx30HCyINN6E4VJ8WtDQYHL0gJSF+k=
X-Gm-Gg: ASbGncv33QtbBu3cqtzVca9IdC6jNphYXNNs86ya1EBDfHaYqZi29V7MQxvqwkGvpGu
	iA8WkSrSZ+4F5aVF48jqumhglHJ3rj4LWieiPA7mcKPOZ+/reX4qrL+5TDPzMZZ/q1oVmGXnR5G
	/SZluwIuCIK1wc0l6eawLbs9ecM/rm27pNxnoskIwrQO5VqOy0VccVEfFXgwqCiQAx1qoaZZJHM
	0dOHrrzOW8/ylNDA1Ib/DZaIYv8oGlUqHMNUljhp2q4GamIQYTSVWV6HgOZ2hvK4ebK2sVpma/p
	Jww5WypIesgnIgh50e/cgjn1O9VUjs0x2WMKZEYdKt0lU59tPI+P/cW6VvUneJhRIFXJdw==
X-Google-Smtp-Source: AGHT+IGcixCHeUvxVA+SokVzbkM0TdI4VCHTRUpdymwjpifxBEFybnXh8mPiF+Vct2sLKpvJWpNQHg==
X-Received: by 2002:a05:6000:4313:b0:391:3049:d58d with SMTP id ffacd0b85a97d-39c2f85ef42mr2705028f8f.0.1743691520634;
        Thu, 03 Apr 2025 07:45:20 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm2044374f8f.66.2025.04.03.07.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:45:19 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 02/13] dt-bindings: nvmem: rockchip,otp: add missing limits for clock-names
Date: Thu,  3 Apr 2025 15:44:50 +0100
Message-Id: <20250403144501.202742-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
References: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=UQK0J97pNwCPOKGAeMM7qvUdjF+FdCoH8EtiOEwCJys=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn7p7i+g2DzChB+wfimV6C2cDoSMG8RnsgqbIoU f2SZtwwcu+JATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ+6e4gAKCRB6of1ZxzRV Nw9PB/4nSbjEtuTJNOJjKTciKFqApfqpV8WGhxi0PQIGU3aavZ9RK84PuKh9Sozwa6BEowDcB4A k9yhZ/kFDmAgHWZH9nSoNb9pVCDnpdH/tf4N1zbiafUm4dCBXm3lLg6btghQBjhFUQ7C4M6FaRB FzkSiEOHKOZJaJ0ttCdSfXdoBMem98ef00+NBENWO4H7OP3RTXeDQvv/BaWbpTgFXzsoqUb39oI h3BX9A4TpUY4+1totge6pCy/cak2RI22hmnMy41ASQ7o+BDcQXr8gz5u2MXSzRBs1ADKY6Qv3hM aaGFgfxAA+jiION/KIknceYCJTSXnpdRw/7KVYNUQRmPOz2L
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Heiko Stuebner <heiko@sntech.de>

The clocks property correctly declares minItems and maxItems for its
variants, but clock-names does not. Both properties are always used
together, so should declare the same limits.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index a44d44b32809..3201ff8f9334 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
@@ -62,6 +62,8 @@ allOf:
       properties:
         clocks:
           maxItems: 3
+        clock-names:
+          maxItems: 3
         resets:
           maxItems: 1
         reset-names:
@@ -78,6 +80,8 @@ allOf:
       properties:
         clocks:
           minItems: 4
+        clock-names:
+          minItems: 4
         resets:
           minItems: 3
         reset-names:
-- 
2.25.1

