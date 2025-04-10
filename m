Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0F81EFF80
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302616; cv=none; b=b48gbelOw6jos2DCGw+XNm6tTzmXHGwh1HzQgxBkT0dqQhfFA9zrv0XcfdWJL9tj3Vqb3hnDjqhhqta3ymWKXWZ3OqflrepAEA50WBSREC7MpQeD4dAga1f2DhDEiTGR532SZvGOFfnnBZD6THBQ5YNrgjcAIuKaWNFjSqlSLmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302616; c=relaxed/simple;
	bh=ykuyFmkKMHJIXqo4oh3w0kqcgoBIO3smwRfR/rRJkQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bYUJ8ZVkoP9cqqQmO+1jSatc+/2UjPjRmLalTPAXp6TijJA441rck/VNHMxek/u3c4yQO5cK2H3hPwkxWGnluJ4jhgv21r4qMeA32bSAUkge8P6A0TAd42Ke8psAvZTN7uUvvAFrpfjAH2K9wCBcfU4mVV0Wa1eJ11w5coWpRE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wWCq0unH; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wWCq0unH"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1199584f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302611; x=1744907411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYQ/bnYqcpDq9DEnr3MypQ+/gd8s486fsMpMYGxMvlw=;
        b=wWCq0unHeB4wHikVtMnq1FTGPC3uBR8GacH6WxkmFlmE+QmcrBE0IXjmvNB/U+HMYa
         hT/DO4Q/KGQPzf37eqtBd/7U7TC/fwFLsZpQ3pgz+bkFEp+1GIhZibUVedfb30xdHn5o
         xk8jA/oLzbEdPNVuWIE0eJGZj66ZdPlosa+64f1SZwihvKalqP3KSS9f9S14iZmAjLo2
         gGB1kWBBSPhKYMi1+NvCFAiHq5WBgSMpPS48fblitpY6yQADE359Z3iQ3FuCLxHj0bLX
         DIcKAQvKz2S76BdE00oO8KMU1erxf7cl4FXJ8qG5ogPxo1gmcoGAfuitOX7mLEFskXNt
         U2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302611; x=1744907411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYQ/bnYqcpDq9DEnr3MypQ+/gd8s486fsMpMYGxMvlw=;
        b=IGJF0pBjGbJ4mTkCEwsjV/sM64Zzo3+cV8Z+ktpYDM7eg/9HosP9U7iJw/du7bQPsP
         /T1PevY4jOD3FxfcedHSHXnYy6MmvkMoRODb+6Ua10X6gMCE2fFr3mk9UpuOUJIoDELr
         h7c0twpiCbP3Ib6pZ7vQH1LX5n2CsG2mfQe7OwA3nJyBWD5RQwmtSehYMrYZbLJjLaVC
         gCiyDtTmGU+2S9AtAjsO6MFDp88HWpQKtLK/5fG092nX2psTA7I1tNzTUQwdmNOAjRaL
         ZxNKbSKN11R1EcP/oVm6UeNyMhblAkEb/hdJ8bMEH3Y0uCzXaNoomziHMQxcuEuxOogM
         efYA==
X-Gm-Message-State: AOJu0YzFEBVB1TH4kxF0ozLeQZxI1QcfjJrH7BmyAk4dTw2dpFtK3f7Y
	YI4nB87/hDQYSTIZDH4eJjtoXfg04gBuPUhxGMbZGopVpoYw61oqBmiGXN+aE3fnI+wjzqsqEcP
	W
X-Gm-Gg: ASbGncuKCjQiaIcFwlqyV9rE2QFimCEinKTg7JjxajFkZ6BuN1V9VMvVUMqTiFd5Lhm
	2PX+GDm2s9atvtY57uKNKmLsv0931Vgr5yDwOavLX/zB7KZe5SPIDHqUcxO7ABcWxEulAMSyX9B
	Ict24YMpagV0gb5Zad39XkTMqDivbjnBUpmLaAUmqzrn20+v5//kB72ye01zc/DqwtaL+Osg9Cn
	4Ep5zian62suA/oBeYNjcGa5mM1avc3eju/pWdCj9QfejDN+T57YrCORTnjoDBPx0EnlkWddwAK
	0SxUe083iDAt5bq8hREZbbGcAXsr9JhX6ojF+iyEDMynDiRHbLeLiYz1hdLpRg==
X-Google-Smtp-Source: AGHT+IFV6YhdZkPcWRiBwQVYxNCnscM5FEJq3aM7UfRULZk1GKfyFRsc4++grb2K1Ep+6ZyvjZSzCA==
X-Received: by 2002:a05:6000:4404:b0:39c:268b:8b66 with SMTP id ffacd0b85a97d-39d8f4e4407mr2261773f8f.43.1744302611222;
        Thu, 10 Apr 2025 09:30:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8936129dsm5350663f8f.18.2025.04.10.09.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:30:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 10 Apr 2025 18:30:02 +0200
Subject: [PATCH RFC v5 3/8] dt-bindings: media: qcom,sm8550-iris: document
 SM8650 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-topic-sm8x50-upstream-iris-catalog-v5-3-44a431574c25@linaro.org>
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
In-Reply-To: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2152;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ykuyFmkKMHJIXqo4oh3w0kqcgoBIO3smwRfR/rRJkQQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn9/INPzUYtOoyWklDXoeefSnzcVEVy7d/Jx/eXS+2
 aoWQIyOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/fyDQAKCRB33NvayMhJ0Vs1D/
 95RLXTgsq4KVMRGQZkrlZnwR/LV+zfacDGth7gKK/ThiW+Xi9ACiccImr49qLwzT75s5UxHKGQzhWF
 dFyIWUEwidNffW9+q374IC6ZU0AeacHAH/08jLdhlQtOqrItFPTqTooMO3JWQd2AKeNWWwO0dJtIRd
 uH4ZJsbFxWKmfTaUW1G0tLwwPaOyUPM/m/uUrPWctQFJrWBb6UbKEmLDK3kBy737jVk4Bf9F594cms
 LY1KxTKP+7dO5AQpkknqDbwphbIvjO1OkgJMET4BCUrbv8n9VVLw5GKsjo81UNdJ1qWAbhrWow/lI4
 ZhMYyb9OoxEKR7z3SXVC+oqdD92eR+pVF4Ucb3YY8oZm8joCGxP8gsFqc4T2a8y6AFY2X6nv21OIP6
 Grihg2/RHJlUiSSUrp+0Nv6LNS3HVqf+EEpVFYoxHZ1ROrjPNpAUnsNKQLZQQDvPaWa8Fr5E1BQ9B0
 cdFdytU9aiHdLz5mrAoHRAS8F0m+UGC8SNculetNxMdUmKHDS4KNgWgBsEYSz8cC6nWebnOcxEackU
 PUBfsFI8xHGeJJk11bS5VggRZ+eMJmvUrBkOQhtubEVJpH/Muf+bSKz0P8Wuz48GVjR/uzcwxKsMhj
 nE2zHZeF9v+0EjeY2zXBlKp8rw+Iu8ukLwjTERSCncY3M9HBpq8QtmahTNcQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the IRIS video decoder and encoder accelerator found in the
SM8650 platform, it requires 2 more reset lines in addition to the
properties required for the SM8550 platform.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 33 ++++++++++++++++++----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index e424ea84c211f473a799481fd5463a16580187ed..536cf458dcb08141e5a1ec8c3df964196e599a57 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -14,12 +14,11 @@ description:
   The iris video processing unit is a video encode and decode accelerator
   present on Qualcomm platforms.
 
-allOf:
-  - $ref: qcom,venus-common.yaml#
-
 properties:
   compatible:
-    const: qcom,sm8550-iris
+    enum:
+      - qcom,sm8550-iris
+      - qcom,sm8650-iris
 
   power-domains:
     maxItems: 4
@@ -49,11 +48,15 @@ properties:
       - const: video-mem
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   reset-names:
+    minItems: 1
     items:
       - const: bus
+      - const: xo
+      - const: core
 
   iommus:
     maxItems: 2
@@ -75,6 +78,26 @@ required:
   - iommus
   - dma-coherent
 
+allOf:
+  - $ref: qcom,venus-common.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8650-iris
+    then:
+      properties:
+        resets:
+          minItems: 3
+        reset-names:
+          minItems: 3
+    else:
+      properties:
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

