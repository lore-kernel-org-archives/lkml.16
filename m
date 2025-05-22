Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B154F28ECDA
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925582; cv=none; b=M4453vYmFhrE0PwWJ1MksH5JTIFALJEaZ2ojCXTRL2PPMarSKd72qVfxG99Weze+KlEExw8P1Ckc5VmpdfOJ2IMSZ1upZBn6C6dIpHpEES6dwHrP8VpswvEVcuUgYV1ez/Y2wc6AL6JKI/rPwt/Alii3VunxVhzS/AFX/F2b7YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925582; c=relaxed/simple;
	bh=6rY5jl63nY3/JfWeYRv5XBTxDAeF2jM1LlH7p8EvP6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Khf+H18vdfDisU4Qk1MSHoTiVcd0NceMKC120GGLeI58eoafkktVpEOi6N13g7SLDaJoHhIa68IbRPbC98hlTHhCFIFdsoSPAxcQgeAGIGhkt/7SjQ9kS/A/MPS4SPgUUB7QGIiWzQaR+JLPgLyDREQNQAFROpypw8inVL9LiMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zdEcrcjL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zdEcrcjL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-44b1f5b917fso1397455e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925579; x=1748530379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fk8IPoQziwfYwbuUI7UFNnBkSt01Uwd7OzuOBIvOZw=;
        b=zdEcrcjLIDVb1q2E0q5SEvkG75uin9EpaxQffYUo1UvE6WszSXJnuyAilAS3F+PJW+
         D0ux3yqnMfWTQ94SXrWtOkqEx5XF0+0dSuMd2tUV/K7Xx72beIrJsJLp1cisWLP0sm4M
         GxUaXoHyBOTP+tSltvtXtbkvs7MuX5kco6zn2U7WkUvl8QULsBP9BDepDxGjalNcmXmZ
         AM2RGlIu4llm0FNl0GUsjm1j/o4jK9XzJ9CF8jEV44u3F5BSuqb73lUqlVIdwpooSfam
         yUw+OPFKhsARS1nv0feJ0EWcda7mh4aglWHS5jrSuS7yh7qD1g2h6Sw68Xu7gzlSE1BF
         vnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925579; x=1748530379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fk8IPoQziwfYwbuUI7UFNnBkSt01Uwd7OzuOBIvOZw=;
        b=V88uKcV9bAXIoJBjOd1p3I8xqNh5C5vB0wD25/JfmL5YNjp8yLhayfN17++UQeFpi4
         k546sWDQGHGzFSbXthgYB88lhcKsoMkWSlBSN+WbXFYIHUPeECRTQ9xD5wVhoQHVJmG9
         T+0v3eAjShfdxLjJCV2iHnhiHhL+9a7RakwoHs3+Rkc855BGcljut5crfgeHO7pDuRle
         l6tKU/M6nv9iA5FmeBMYwVIk2Z5x+sA0dCiiq7J6lhn7hkQDvo1vcebZpR+bR87U3rUK
         Xju4VqjSH2pWLL/wGZBFU4HK76j69hcy3k8xoAm0/JwLkl4+Eyo3+sfJnbf8/QcwIwJV
         E1RQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7QEvYfQt17GYkITS2ERhQBbsWfnWsVd6NSkzKwEypTAbe4e5BVhIqBzwFVsI9hAeHtJfnwBbNaQZGqAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP3na1F1goCy7bF//KaovJNzuwCELSV8rwI3+d0fNQxe3OLlQm
	DwfSAoGvXGioOUQaednwzrlBlR2rJbzac7dhVbov1lOvr+CMQ+OWVkXAClVSZemg47s=
X-Gm-Gg: ASbGncusRuNuyO0I/9cxyMZ6yP9h01Hu/+erjXby9Zuc3lzXO0qR8tc1okFQCH6+Tur
	LZgPwdO+KiZbleqEo9Sq+NpjkNlRZ6Wqz1cleeEv30fDBvHQKHGVTRFGALeRfkh7ApEu+B2Kc8C
	ib04+wzJcVuzk7EEMdzbvrKYtu2Qfr8qH3HBJml0TpGd+53mU/PKjd5fOkUSTYXe7fPRKgjBtku
	EjHE+vxeTJrptI7hARk6SFG/0nQc7KfYjHrj8CmayKMjfCqFw/OxLhYezLTvYPwF86tt2KgnXZG
	IBP3aRdPpy9leXdwi8OiofaMM1qRRc8XJqHrKqlPVjjr/cUwExCqr/ydpIrn
X-Google-Smtp-Source: AGHT+IGFpmPzY89cA+sps7xchhXwbvS4hLuhbFCBxUqce+aMcHX4nBXLpUwuU9xg1nYZbcfMggR6Bw==
X-Received: by 2002:a05:600c:530c:b0:442:f4a3:8c5c with SMTP id 5b1f17b1804b1-442fd6272f8mr316774415e9.10.1747925578910;
        Thu, 22 May 2025 07:52:58 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:58 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:41 +0100
Subject: [PATCH v2 12/14] dt-bindings: spi: dspi: Add S32G support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-12-bea884630cfb@linaro.org>
References: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
In-Reply-To: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chao Fu <B44548@freescale.com>, 
 Xiubo Li <Li.Xiubo@freescale.com>, Lukasz Majewski <lukma@denx.de>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>

Document S32G compatible strings. 's32g2' and 's32g3' use the same
driver so 's32g2' must follow 's32g3'. The SPI controller supports
target mode when the "spi-slave" flag is used so add an example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/devicetree/bindings/spi/fsl,dspi.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
index 7ca8fceda717..63f4b779a255 100644
--- a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
@@ -23,6 +23,7 @@ properties:
           - fsl,ls2080a-dspi
           - fsl,ls2085a-dspi
           - fsl,lx2160a-dspi
+          - nxp,s32g2-dspi
       - items:
           - enum:
               - fsl,ls1012a-dspi
@@ -37,6 +38,9 @@ properties:
       - items:
           - const: fsl,lx2160a-dspi
           - const: fsl,ls2085a-dspi
+      - items:
+          - const: nxp,s32g3-dspi
+          - const: nxp,s32g2-dspi
 
   reg:
     maxItems: 1
@@ -114,3 +118,17 @@ examples:
                 spi-cs-hold-delay-ns = <50>;
         };
     };
+  # S32G3 in target mode
+  - |
+    spi@401d4000 {
+        compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
+        reg = <0x401d4000 0x1000>;
+        interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 26>;
+        clock-names = "dspi";
+        spi-num-chipselects = <8>;
+        bus-num = <0>;
+        dmas = <&edma0 0 7>, <&edma0 0 8>;
+        dma-names = "tx", "rx";
+        spi-slave;
+    };

-- 
2.34.1

