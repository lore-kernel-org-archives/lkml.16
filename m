Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2124322F769
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484477; cv=none; b=FPl12jKfaHYZfpzFlgGAYOibAZ+fWDC5mfZYNtXvb9O4+/SsXmjHR5SutQU13IuuL0iUDgaBMCO/stt42ME+Le54cmCEKHjUFZquyBD3fYsOS4BuGOxeK5Hd9+bW/bfhhfXwLnUAhEqcouL3YVAdz/c0ehHUBbdYtlPtZLit37o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484477; c=relaxed/simple;
	bh=v9NulOKFzzn4VjJSv/C3GeIHdwxmdTo/iASPuVTpKQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pQMPhDK7q8mDvEfS2nwNWSuZSkCrtkbB/QZ1lJleDm5Ucs75bNqTKd6FATzd+OsW+fbk6tekAinWQXgJIqiLG4OopVbOIU2F4YiYuPnmQM5tlirHYglNd9IQes6SqwQ2BoKko5ksfpGSsZmBF3mxRlMOl4a/uKxtYCOZGl+Y/1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SE8ksqsK; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SE8ksqsK"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac3123c0ef9so7677366b.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484472; x=1746089272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cCBG5OKG/N3lD91xNoXYGEZyIt+oU9U/CB++e5u2IUo=;
        b=SE8ksqsK0lfxE7OVNW/efLYXcmjlAf+PKG6/MmtpFYaX2kiBcunEJykFPWxqrbVN2i
         1IT75nxdPLKlfuasFUqfjlZLcqU6KNGwK7564WO23CI7kmEdtB6Po2AcoUaWef70Xmaq
         OehLDwjJpNhLaS9ZcK0sA47vNMQMTtY9CTWGjBBmw4igIKzyxLI5ytBk7sJNsefil5zc
         KizOGMRHJSJ1gpKqdSqZr6dH+3Ez4IYXqEp3m1I8eIpq0t0HsrxO2wLSECKyfHZh8CjI
         l9kHIh1sJ/hyI1oAFDoD1wYAnLBUycL5NnsBjMeOITIKHMDYt9BxqwfdBpjtN+hqMMM4
         IMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484472; x=1746089272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cCBG5OKG/N3lD91xNoXYGEZyIt+oU9U/CB++e5u2IUo=;
        b=eKf0XtLedjlXbdayMeZ8V+xD9eeVS1FGCCukgZYrx+N8OAarPCFkhvRBiJ3tu2t+0v
         uZhPB4ZMalX+eNAq2k6HCwMBoT4YNw+UCrenW2hbpeVgTAuM5QHXZyX65+iDP7l9Z9zy
         uOTQT+unynAotb0gOsycCmGIYssl8qxTBFYVZvqvo1nCGSXM4zNBdAsDg0HSrjF2ug7M
         ldz5sYYj/7x9g+yUwuXQ9o/JmcRsSQH/0WcDs4w5OROtZ5aZ1o1iUPdvOB8YKIrjVOrA
         83rznA/74lppRIpoax47or1kvs+LBo2Xp+CKBvixEdPnR1UrtPAoJ3yES82SbZN60tp/
         nPGA==
X-Forwarded-Encrypted: i=1; AJvYcCUHiXhJ38nuD2d9/7tATXKENj54WOSFZuIQIUc50V8ZlGSfAbxutcASE7lujphLDvWyPvKyFlFzFNtbKLM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiwody4KZE34bWZ2pOWEcQI/oy0BvKBGRY+Pmgmx3vkJhDojMz
	FUCUsLpE5wYOXU0uZpQ58mysGaEKWoryceGmZwN3Gx74V3bmG4aINO+JIAluno8=
X-Gm-Gg: ASbGncsiWPMA8nxRr5A4x/mPhlvrsB/zKcFapMiLENFBdlP9CaONxvXwUFvV3/KZRV+
	QBhNHkfQdNEs6H3Dp657ooIkbINs2ZfHmPUGkv3UKgG2ZmDW6nTKWSa0KWjCIZYkGrHq8cxKOeW
	RnplAgG5GOPeN+ImNOzbjcZMcg9S4RZ352g80N+fuzb37A4ZGYuMuxzZn11w1p4VzcjrqWGTEEA
	dXf355g3TYgCLYfQli5zNYO1lukfz74+iDEPmLxS6UrPHtZLLHnmsGCaZAUw+CFjP5nXs7c7J/0
	0kb1IEQaaxo8OWXi4q8pXZ0sO7pShoBLaQVy2/agUv3DFxHLxw==
X-Google-Smtp-Source: AGHT+IGYMQ2nZIejb29IR4qkaCq3mrCgC2opvXN3m7rH6EYZg1uUUZwVfU4xVuZHISo6zU7Qmm70ZQ==
X-Received: by 2002:a17:907:72d4:b0:abf:7a26:c45a with SMTP id a640c23a62f3a-ace573b05c2mr52344766b.11.1745484472280;
        Thu, 24 Apr 2025 01:47:52 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c25bdbsm71213966b.141.2025.04.24.01.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:47:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: renesas: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:47:48 +0200
Message-ID: <20250424084748.105255-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  r8a774a1-beacon-rzg2m-kit.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 1489bc8d2f4e..d40a7224f9c3 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -300,7 +300,7 @@ &sdhi2 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		interrupts-extended = <&gpio1 27 IRQ_TYPE_LEVEL_LOW>;
-- 
2.45.2

