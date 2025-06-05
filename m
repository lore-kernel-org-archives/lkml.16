Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43AB22A813;
	Thu,  5 Jun 2025 23:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749165150; cv=none; b=KR2qSk45x66AbrD5od10qLwCZgzpUvBmHNR4OtWzcwMZyzsRTvAxCfSZ5XAI90KnWtpaDriZY6ToymH6fKiT3GI3xP3PTddUmtWgeb7iPrzNZBjQx1u6hYiaC7yYfpRxYr0BWzOzUB4BcHxTbAvqsxPNpMixf/pGIj3ubJadawk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749165150; c=relaxed/simple;
	bh=Ci6A4TFTpO2e4A0ATma25lRCvLwjkVFjqcgFSOSkBbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6o2vsgQ7iGvpKTNnzeZLl6IyW1j8umgNKlpkCtjuEvPsAQg7iVGcfFELSKXKXmVw026kPc9ueHdv+qyxz04U8CQ2G+qjfj/WDwVTBS4+jR5MCDyhTBnp9uqUgKtumzvNlCaGU3CCjiWUJQqubygP/+PzquBZjEounFFTk2rz5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vb7afVui; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vb7afVui"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e09f57ed4so24920115ad.0;
        Thu, 05 Jun 2025 16:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749165148; x=1749769948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGLlbBsnnIaeeQBBuPKiX5lfWhSVjFvIfqJzWD4CoEg=;
        b=Vb7afVuiFdIzF7muZVchIwxd5DenYexo529o5BC8iWFjqzrHpowIZJslLlrfRKkuR6
         yvtMZnbt5823iBHYV1JUluR77kG4TIP/ImwKm/Q/RVsK8tnmrBwWwI0UdYoJGOCSR0ys
         g8VI/GtFHlHHRQ3cWQRidjqi7lmncOv5EDvyxwozvKKiWFCEL0HYTBQBom7sY+R2pYX7
         lzt0TMT981T3Srf4754tMD6w5gTe/5hslxg/MHLTr+Gb653SgdI9aTN5bG5PEP2U/dyk
         ZYnqFMZ0VrgIM4K25zLAAVsvs4EQ6v2UljWeYP7eeMqhCESQ/KZK4Otnw2R/QyTlv5MU
         nmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749165148; x=1749769948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGLlbBsnnIaeeQBBuPKiX5lfWhSVjFvIfqJzWD4CoEg=;
        b=GSqJn3QhFqG8l4Gbh44z7JjCMJq4s+4jg4+3bYvYtDgrp+QwH2BMQx534rRz10BmLc
         YkPvb2J65gQdigNaLJ1rLbxiTA2RnNbG4tbzD1LlR+YuKUJzXm3FGeVUk+Sc/09H++hG
         JyRbkGwrjV2udHa2FxlaGIs73E+3blCVO9jRmCeOREaJf385cw/zmMaHSioKyLsofMOv
         rAImwqeFeU85a1NMwvwvATm643+5vp9J1yDPPl5QNTljfE94TP1RIwVZ1mYRDazHBDe0
         c/uDShAh2A7eIil1FotlB2kAKye7jqXOJs/VTM/KB0uj9gBAAhEkDbr7nANhwDZwnMqH
         ViOw==
X-Forwarded-Encrypted: i=1; AJvYcCVY09zkZ8e9Mgeft06YPtJEVa1RO3wx7gxJArEXRXlU4BQ5GOVYxdCSjsXUgYZ2gmAxFCL5aEDgJ2OAwIM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0S2yChsGW8fsiswURhH5lB5fi6r2Io3tvVZnoSRLvxVEuSFAf
	ltbnwKPBfTAACjsJYvaGRgoG5ubtgzew0n1dUkj467MP07KekDPZCU3K
X-Gm-Gg: ASbGnctyaybK63q37wkMCwPV2CAxcxATQ1JGAi+sTegYQPpNT287ehbz60ErhFhW9OY
	Nrh8V2mtWlMbRI3ceF1Or96iSpaL46nRrw1fR3alx5NG/E1zqcqPY1juqg1mh3Hw+PwbxuJ1cqA
	UBdL7l/pKvzSOcW2W7yztKRNlWiQpJ/bo0h0aONFXZlTT2Kb8RXnulQq+mgmW/MgoiT9g/h/m0W
	h66za4qCmWTZukPKN5Rxpyr8BolCpHS0qdHo9NBNMIPa0ZjPN6erpBrbfxxM6EKjCAhGNIAfdcw
	n0MKF2dWmtvFniPDtobHE7zUXcMxMEmqOhDJlboo6upxB9y/jV+kWgU4JLDEqA==
X-Google-Smtp-Source: AGHT+IEszKa/fdB71e59frDQVq5vnwuvFpTqT925Qa9IfUFVt0czkwycEAf1Jufba0YHOCUi49s/3Q==
X-Received: by 2002:a17:902:d58f:b0:231:c9bb:6106 with SMTP id d9443c01a7336-23602063997mr12987455ad.9.1749165148080;
        Thu, 05 Jun 2025 16:12:28 -0700 (PDT)
Received: from wash.local ([50.46.184.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603097091sm1346175ad.69.2025.06.05.16.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 16:12:27 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 05 Jun 2025 16:11:51 -0700
Subject: [PATCH v4 1/3] dt-bindings: arm: rockchip: Add Radxa CM5 IO board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-rk3588s-cm5-io-dts-upstream-v4-1-8445db5ca6b0@gmail.com>
References: <20250605-rk3588s-cm5-io-dts-upstream-v4-0-8445db5ca6b0@gmail.com>
In-Reply-To: <20250605-rk3588s-cm5-io-dts-upstream-v4-0-8445db5ca6b0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Joseph Kogut <joseph.kogut@gmail.com>, 
 Steve deRosier <derosier@cal-sierra.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Add device tree binding for the Radxa CM5 IO board.

This board is based on the rk3588s.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 650fb833d96ef67ea1bba33c0767777378a38fa7..64b0a0dfcf12a75af908ab723d5a4dd9bfba8167 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -840,6 +840,13 @@ properties:
           - const: radxa,cm3
           - const: rockchip,rk3566
 
+      - description: Radxa Compute Module 5 (CM5)
+        items:
+          - enum:
+              - radxa,cm5-io
+          - const: radxa,cm5
+          - const: rockchip,rk3588s
+
       - description: Radxa CM3 Industrial
         items:
           - enum:

-- 
2.49.0

