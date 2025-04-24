Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1841722A7FF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484468; cv=none; b=Bk3/amzze+6iU2QFYARUFdVeIdIoojxyLpR4QqAckA5aYyV4tP/IIKSgr8JplB5e3nazTyds5zOO30EmStATomKqWtyzxicif2bY3EjXGGddskcNxqz98n+HRyG94Wm8yYyQ+L8uOnJq03D5Jy+TEt6ByObvZx2sil0yZF1jY88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484468; c=relaxed/simple;
	bh=/Zg+SvYYhV8lAw93gW64NAyn68dIsXhG9VArVA4Apio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IiY7bPLgI5Cw7Snmqe1/ohhqTAaKxum2gnTAy98pCc6NzkGNrPwLjBFf6QXtdC30n33iC8IlE99V2dFguWCP8kvDSxkdzSejNkAj4qEAHpSfb7J88fZCZ/5FNXqFWyYf9qveCJtRQg64hrp/iaKk6rUuuJpjgvFTUBnQE7sXBwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BtRZ9VF6; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BtRZ9VF6"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acb5cf13996so8963766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484464; x=1746089264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0naMJuU9gAe+qN+udfyQSJ+gDe9HTRKDpMwSOS1Ylc=;
        b=BtRZ9VF6V0lnt/F1WQsdL0UfWKzbmyIiQAwmUWQL6wfMLHIxClka6+9IKjIwFataZ3
         viodzhQdcCJ0COS4M8byMpYpqmj1wl2opo/RQPLJJn+TDPfYkpqPQmxJQkNesdIccIy/
         hkvqDJZMuhOdJE9djcfHhbhby1lwtdGx5xHyT7MLOQEKgRYd1+M81KmoJRdRLRgn1sL9
         aFLo7blAjmAA4SDfDDsgevu/P3e6adNkjIESpA+at7J/uDyQy2Ex2b6MYWHggyT8dTHZ
         weInL9bovxR4cVFErDrCLYC70xLpf7bw7ZiywCaexu+qxXYBTYa5xtxNv+EJEahzrger
         vvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484464; x=1746089264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0naMJuU9gAe+qN+udfyQSJ+gDe9HTRKDpMwSOS1Ylc=;
        b=E1BB0tGPECc1FYWwH3dd3ukzLcWebRO1IIwf1B/oX/Ump1axToJvSlFUBxctMC7A2A
         RcEPY6a/7//SFDSAccl/n2pqn4Sek4QkNP6fYwjDbwkQsHL1Dw7ABJTG3y6eACCssWzQ
         lxcDgKIAChLxN3sKbXfHclBBEXsvk+c1ZOz7LGXSg67VIoeFN1iTaVTdS94vnaCdlqSG
         F8T1B0gu7sYLExf1QLQgfBgDFh0qW4da1xMkWVT52CdK/p7Za0GXKN3zW/KaW2UEotiA
         z7mGi4XtUlYkV8Ocn0xCQStnh+KbjQoVDOOLuLXlc2nIDBgOWavssDqjOVK7gbca88zP
         eyrw==
X-Forwarded-Encrypted: i=1; AJvYcCXOrHSXzdWLi886mBotOryX5ZB68UxyJ1y0PmnZpQY7w75vC/1jq4LVW6+Am7CwOx4dHkMVtadwEf4Ajdk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/cgLKtgoHrCjjUi8rTMRmQkUmk4JDDmebndn3myLGHhX8Q+LW
	m7dmS1yEMHZAbtWNPTa2CXWH2Ut7fYZsw8HhhHdZesMCZkODSWboLUN9w+jsJfk=
X-Gm-Gg: ASbGncvfmjyNalO+qVUuSKHsVGelDWTIF/26qLxjcoAyKf2Z8E4CB9D9TgpjLX06EDo
	uhwLcKCA3/rRYT2sUwS64kMRVYZRjqQVHio2UU0mvjcDIaxKpaDaxOpXs7DEvTsH+uBxzxibEyT
	Z6WW24pyuUsEcfaBqeeyBaC1Tlc6p2Q/WuWXZ4Sq+2EncJ/Ng8bN+1cXdYtrlLVr1xYGNwG1g75
	a1QFW7Iiskd6iDZISzzIxV5nJ7AdVrW2b3P46Z40nQ3rvgG1jAnxvytlaZ/QaD7vP5CwiWn8miv
	8wwLNCLyfFbfqZyKs0HJBlzarmh8evJgh6dhWsIChgHX/NDkaA==
X-Google-Smtp-Source: AGHT+IEqtIDEk3bgbvlxAZRptnb7L3v+POmbybrom8KtYglKCBdm5DoZlFBkTfsuHhG8/g5OHyFgfg==
X-Received: by 2002:a17:907:3f0f:b0:acb:6464:5f9f with SMTP id a640c23a62f3a-ace57220445mr58086466b.3.1745484464256;
        Thu, 24 Apr 2025 01:47:44 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59830ff3sm71378866b.7.2025.04.24.01.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:47:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: allwinner: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:47:37 +0200
Message-ID: <20250424084737.105215-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250424084737.105215-1-krzysztof.kozlowski@linaro.org>
References: <20250424084737.105215-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  sun8i-h3-nanopi-neo-air.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
index 6d85370e04f1..9a2742363cd0 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts
@@ -94,7 +94,7 @@ &mmc1 {
 	non-removable;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		interrupt-parent = <&pio>;
-- 
2.45.2

