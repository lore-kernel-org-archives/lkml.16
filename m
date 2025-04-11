Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AAD27C169
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370601; cv=none; b=Ctwv6itybUmEoWvwFBt/GzUq7y/THfiw7/oxXpIp6fbKGKIOl6gbdNlaR3nivzWcfXDRK8g3fcB94CKVOEpCYN8c3vbG7ENBjAkxvY/qPzvJZ2LpbfiJfQT/n2bJzjU6NNb/Z12kNHEN1vXnFpygWu9MmFCkUsmlDssoI7v9TkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370601; c=relaxed/simple;
	bh=ybxTvRpd4kO2zs6zw9WFj8Wii5NFzbC0WuWOhetK+9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dmm9/QUO93A5G/wyb/GfSpGFCga0hlzr3c+KUtFekYgeJfshCqtg9ONvP4rjoEcP8gxQ7jRs1YqfOpgfvo9hMAg4Tu4zL3E0WXfVqXgtt8Rmzp37+GYJX7PZgBr06cGBGowb6XFLydz85iAKn9CB3CVWVdjENFitqIeImtEQ/Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yfFas8St; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yfFas8St"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so13909935e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744370598; x=1744975398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zofAE/MmL+K+bf5Y8iHtvKsWsqHj4tjabm2BNgmObl0=;
        b=yfFas8St6hTJljk/EGzIcHrRhjqu2X9Y6nN6JjF3z+fTKEcmUkRg1Hc8RvuvW+l/KK
         MRz4icFYIChJEaPVLp5b5FOTq36iTfVt+630rDXqfJ/QZ0HrltUrx10wMCuOH5G8YwjN
         zKZ7yevBnYOmUmfBjOopYT5HC7x2yL6U9t3khlHeRbFrYRvzzW73iFTH5Tc4W3k0ba5s
         SMLpL7hxObEb/OS/1Ecz5mUViCWts1aZHNKgbAq1GcebJjx0ZPthTFxikc8oLREWY5Bn
         QHgcAQEXrr0dBE4hGc2B+tODYd9zdpR+ACT3Gc4ZM9ej9SEfHcYQfVdKEpAcZcLK2MLl
         wgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370598; x=1744975398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zofAE/MmL+K+bf5Y8iHtvKsWsqHj4tjabm2BNgmObl0=;
        b=rjqdEGW9E4knXWAlOHjX4l4RMoUu/DYigOVxW8XR/qYmKYYs6V40rS1ZIEHyu6I5rt
         b0zU/9NoDDHj2K+SowICR8KLYT1kv5qTIqY+JHq6d8EqqQC8HMbM+h2bWleg4uGSvxeI
         7LrrGyHjSA3JBHbamXjn45grwpEmx6ydB8PUiOfjlgpAiie5OjHfc5Tev0vQw5JL3wjR
         nufcPEHde04b8nlM2IREiz+IVN9RXU2Kw8kZhdcotyDUzHHA63IKBT9eUmFRput2M1pf
         n0SX0KDwH2+1j2hy3jaGUYLcG18aSsi4bpexlbDB/6Rf4U/vs0dzXwx7RWZmpwwfHDS0
         namQ==
X-Gm-Message-State: AOJu0YxFFYlIqAScs+L6UzUnAg+NV8tA6wWGOi2KIxhXK+vmGuambDuV
	711SCbNxBHSbS70JgEbNUzpx0eT763toMeoRSfp3p1YcYaGuVou2hHEBsUmWXG8=
X-Gm-Gg: ASbGnctqB+uGM+dLlE08sVMLBgT7OhwyYfyHSFmoJ6i/sZ9S2cuhHMnss1Omx7DuIL/
	pUQQWEujvi1Me1DLduXSxPDPmaK+Ejbfd/926ywW/JuhcTOcEjRsMHjlWGqtu9WnZ/876ggGD3M
	ePT1GX5lWxjp1GYikz8dEjgodkJcVWyTqRvguYyZ/V1snxcgxR7CUJ6R4kSTn6WsG0Yni43k2md
	zk/YT3YHxzee4KyI2Oyx5rMFlu2kBo3J7H32oA0/74BIGH8x1mu4N+WoIXwEm+j2/A7K1ddfr3V
	K6CNSmkMutaaud2QZxtpnuLANd2XOLwtkeFWDi8y6uMR4D6cmDMFHdlhIhL9TQk5hA==
X-Google-Smtp-Source: AGHT+IGfHiXWGnshyAfpjAm+tW2i79tpgHT5G8fC087kVhtu13VTr02cY1k71fRuQTMpc39v63xumQ==
X-Received: by 2002:a05:600c:1c8e:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-43f3a958fe5mr17042925e9.17.1744370598396;
        Fri, 11 Apr 2025 04:23:18 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm85171445e9.30.2025.04.11.04.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:23:17 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	srini@kernel.org,
	Rudraksha Gupta <guptarud@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v3 13/13] dt-bindings: nvmem: Add compatible for MSM8960
Date: Fri, 11 Apr 2025 12:22:51 +0100
Message-Id: <20250411112251.68002-14-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
References: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rudraksha Gupta <guptarud@gmail.com>

Document the QFPROM on MSM8960.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 2b39d27da57b..3f6dc6a3a9f1 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,msm8916-qfprom
           - qcom,msm8917-qfprom
           - qcom,msm8937-qfprom
+          - qcom,msm8960-qfprom
           - qcom,msm8974-qfprom
           - qcom,msm8976-qfprom
           - qcom,msm8996-qfprom
-- 
2.25.1

