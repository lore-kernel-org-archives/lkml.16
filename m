Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3243020DD47
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070005; cv=none; b=Ejth6ssF5fLfDPWB+TNKHGoRgieRJ9EK2eH6j/8NrU8rtcNamk3zbU94DNQPCbB5LO3fl6HVcZpdWys2c0PMQNZkjxhg44bStM4X2Cty/7Nz8w629JFJZllhgicBQkSxrrsmEUHBonaLKbp78HVWA8uuAyD+20RXzRMFuSoQgQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070005; c=relaxed/simple;
	bh=nzVmJfufed+ekMZEjdRDlysNfkHvhI2RIGmGqRITGrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EMInsRxXghJhrMl6AFTan/aIktnM2N+ruIlK/R39UDUZjB+pPL6/MwkaYWM7V6paevT5nxsqiGXaWHMgYjLNttd5xtGXCgXX6kVNf/lyzXR5GWP9K7xeR0NrnM56Qnij9avXi1cnqmQPGyMlfwTzHWWYRFLTC1RWPc5nHtjrfPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hIVhyRMl; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hIVhyRMl"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a823036so7951415e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070001; x=1743674801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGhDhYESbCVLGZrKJ7EvUOhY/AIfq8zAGCvPtzsm0PA=;
        b=hIVhyRMlKMflEvXMQV5ueApdn2nsXlgpeaCM9JWCGQkxyJulKbXdd45LpKvySlItim
         k65fJ47tK3jbdraszg9XVWmZzLlIt1dyxTxNhiTACiQPr/ulfYCogspa21ZyyzsQHayL
         S5tPVKrTIMI4uF2GR3eHR9BFADKcW9g18hnDMaBejnTc1T3HqTahJXS/meA20lFGWhy/
         igohQcXtGV1cziaT3TWlYj9PlGJZIFNEI2cHDDGxpRk9mDNwe1PdrAs1a1dS+7TnBjY4
         47GjbWeIac9/B4oR9dq0Lsa/Wix39xD2UfoGVfsNkTLSECZ9WQxh1QxtlnpBRMS+5hgM
         a/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070001; x=1743674801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGhDhYESbCVLGZrKJ7EvUOhY/AIfq8zAGCvPtzsm0PA=;
        b=w9C2oqKptijeQBNSSMumACoNnVu+26ZKKJGi856Wx5YQbkgTdeodFSu3RQ7lOdaN7B
         clWu60DsDgT/8yd2WGdhRdUVecnSlzJwK4M08B0NWxsO1Hv+uG2g/2dsJ3cpurKwO7sO
         cbeJcMDVMJFU6tc2fcmFwIU/P5L2k6cCMJWR2pffgJ6nXblY6+wbjq4U3zMMJtDAOqR6
         3FVrYRMvLPuxaFb79bMzfprISwxPXIKsu5BSp+sTXGWiFflPfZaYXmQw9oqRaCO8SRyN
         JcyrREzJZfi7we5B2cBP9yQwS9Hm0D6K7WC7Wvs6vg3xT428ZALAelk4BXZmutiTjQwB
         KJEA==
X-Forwarded-Encrypted: i=1; AJvYcCXcOgtfwBZdbhJasCruaH9d542Sq3QlIDBLIwZVSvepdG/HbP/sjbK3duO+muaH360TXYEeamocdD9ly28=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKc7cqpNoqzHm3YLQydCyOBJa3biRpz1bS9hw/+KsKBEkwBWqR
	oGLG60zv0GLiHkRUk2BWeGS120l58/90u9gGtgrInVoWjQg2Znlpt4JT75WFnVw=
X-Gm-Gg: ASbGncunQ8Zji5WOBP5+Qo1lraHNrMP2tOWWk9Q16H8/MRTi74O8y2CyP0U9gXCEpji
	Bp+dVute3vSB3VFDCagj+kCWGX0G0aMjFpEJ009KIJi0pUqFj0ccbKiJcj6boxhy5Yol9ZE5F/y
	0Yku4qw9nfjMfsPDfvX+TEpr7+3ysvdPr/5gLY4rKimr15e831Knxm1xUKlZlYT+imxeJcbuMUQ
	4q1kMEKzsGUOO2xZpmbzhLzzyUmvg/QM0kk49hFubIs3lMAJxwQ7r08cT5Uy1DvI++BZKb00ImD
	O3JOpirhvmfaj5IDOtcLwmVPDM8Tbl9aLdxyR13jyKVm9EqeoN9Q6YUnoufzURUGsamLo2L7teV
	Ohi+O
X-Google-Smtp-Source: AGHT+IHbYEkEV56STjfU0lTRDtdedS8WvMVSd1pZC2L1XQBbBW4aRCx0Kn4wXUGWvcbo2+wiKfBSJQ==
X-Received: by 2002:a5d:5f42:0:b0:399:6ad6:34 with SMTP id ffacd0b85a97d-39ad1760701mr2932999f8f.35.1743070001456;
        Thu, 27 Mar 2025 03:06:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ac3ce3dd1sm10843204f8f.88.2025.03.27.03.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:06:40 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/6] dt-bindings: mux: add optional regulator binding to gpio mux
Date: Thu, 27 Mar 2025 10:06:28 +0000
Message-Id: <20250327100633.11530-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi Mux Switch is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable. One such platform is Lenovo
T14s.

This patch adds required bindings in gpio-mux to add such optional regulator.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mux/gpio-mux.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.yaml b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
index b597c1f2c577..ef7e33ec85d4 100644
--- a/Documentation/devicetree/bindings/mux/gpio-mux.yaml
+++ b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
@@ -25,6 +25,10 @@ properties:
     description:
       List of gpios used to control the multiplexer, least significant bit first.
 
+  mux-supply:
+    description:
+      Regulator to power on the multiplexer.
+
   '#mux-control-cells':
     enum: [ 0, 1 ]
 
-- 
2.39.5

