Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404CC1917ED
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935660; cv=none; b=Pk574N65gKK8mnfbIVymML4IYt79UDOABo5Hv+vd5ls88BPtnvv4v3Ab5tDKUTCdjByc0aAvbHI07DeGlPlabi+3AdO3Ydi2/F5v63wMz96U21DTBmQE68Mxy1UOSLLsyzlUrE/mheR7RxNakrBZRje0hbmz5a5+XkF5RI+bc+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935660; c=relaxed/simple;
	bh=BA1jWJVLID2R9S0NjaKb06T2AIwSrYnas/chmrTU1rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R+r4h6V3MBIedyrcn5KnEY/LR3jMB4lQgEJ0shbSYvVjlxdoHt3G1iFxJ0rxqTfoACmUron+f5JbdZL5BaNyx+O5EiOWicblcZ/vlB6whPykCH633/3/YhH5++q6CBxY3A+Q6f5wl8pE3KCc37jhZ2B2hFvYHs1nD5M6/gKqtAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Muqhb8Ad; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Muqhb8Ad"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so67167785e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935655; x=1748540455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BeVSdZTcESAIY7Aim6YoJ9ax5VRvE2UjSLkzmxKP1NA=;
        b=Muqhb8AddjGNLkck7BnH5XbhAgpOCaWKnfp5eRoGrgnqceHhL1k+JhcCTQmY8MXG0G
         5YRqM891x9LpkCoWXv6+4A3FAJtbp38jUxW4oJXsg/o2pn/hg5GHU5fuTJ3Ab5IcSWWR
         kAnBaGPgkDwtBY3nl1+nDstvgH9N9AXs/SMXBrVyQQUW/ABAvlw/g7nAt6B0vjor1Pxv
         hMkHhZdNKzMCb9KOO5IgVOYmuuos30Uhf/cwUHnIhctfqew19UqrfbBAAK1k6CR6w7FA
         pF1zbvmFPYnKfhftZzKDsrRvKCfzYyGcwmMZ+jSSdyI8Cf7XZoLAMvAmXR9eOClRleOb
         64yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935655; x=1748540455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeVSdZTcESAIY7Aim6YoJ9ax5VRvE2UjSLkzmxKP1NA=;
        b=L/vkuok8FLvjl458r4icYo2fdPkn1h3EVM4g0iOt8pw3WMTi1cC69CuHZiEO6NGnGC
         AYiyUx1xFObvOGeCshRrOx2+OkDgvQ7+xo+ASoYKekzxAMOmFYycPp9r7h1iUeFI0c1b
         Jn6gRlASPHvxIHtgSKT9pJ+5OuBlxk/oD/Pmop6ssgXV8OpSQBMnrpd77v65PuV5apBn
         CuhMlmU45ZE2vnGQJPfLr/ALvv3PZsWoTduIig+PF7UkKkhZvGnLVGtTkdwOXqTqb9n+
         6l4XWdSsKLQN60Af5+5KCQzMqkQ0xuOK+FZpp8OxSpQHc0GjLe11WE7pmwTuaoEClF5C
         ib6A==
X-Forwarded-Encrypted: i=1; AJvYcCVFGEQTI62gk3z9bqqju8DkzUjUUeq6igoOeGPA4910anih7xEwHbouj10BlcJMXNkmS7mbZyb7NpUZ7xA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEzHgT0TDOgbaiRJjBk3IEANiRBmAhlvgvYTLO1plrT6+WoXWN
	K7LZZvrNZTUBszFzi11qtxmYl4S6hlYW6goHDEKcd0rPFoPf0QiSIiYiW3AO+cugPwY=
X-Gm-Gg: ASbGncvFYJbblO3bLcHBc7yXUkeO0k/ThnEaOkZS0vwIN/F2TN2tT1Lrx+05F9yUx7f
	MPNzRm7g64cn7Y8M9EEbmLAqc1ElfDTV06jCw3TQa5LvwtRypmULxEokdYaYOf0eIXkxBkh+XkG
	L7Ms+pY06BzC+ZP1DkbWjUvSXnFzd5yGUUk4AX1cYMjQQmQwQoWhcTSgxJh57buh78q9uWgJ9j0
	m4IQGB+wq+fSCPMdXvoE40lNZRwBVnnVLI/9nRjZLj/x4t8Acbr4tavaFgG5WyA4ujtVOKZGzsz
	24OAAB54CfQGNqK0XE78Cr6b7LWPF7rQjERQG2SxkkDtYtl2p3mWSyPpE7o=
X-Google-Smtp-Source: AGHT+IHIlbYVvYafpeIO81i57615R3Scfy/N8bbFiofLBN4IPVuaPtS1SroaRCpdNZVnFOjNX4w3Fw==
X-Received: by 2002:a05:600c:34c4:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-442fd6752e7mr269251575e9.27.1747935655391;
        Thu, 22 May 2025 10:40:55 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:40:54 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:51 +0100
Subject: [PATCH v3 01/12] ASoC: dt-bindings: qcom: Add SM6115 LPASS rxmacro
 and vamacro codecs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-1-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2

Document compatibles for Qualcomm SM6115 SoC digital RX and
VA (voice activation) macro codecs and their clocks.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml        | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml        | 22 ++++++++++++++++------
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 92f95eb74b1928fde11ad86ab6344f274bdf7790..697c5591ae7cb82633ff0159fb31d08b57c11b97 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-rx-macro
+          - qcom,sm6115-lpass-rx-macro
           - qcom,sm8250-lpass-rx-macro
           - qcom,sm8450-lpass-rx-macro
           - qcom,sm8550-lpass-rx-macro
@@ -80,6 +81,24 @@ allOf:
                 - const: npl
                 - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6115-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: dcodec
+            - const: fsgen
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index f41deaa6f4df57c8186acf4cd7bb99e38dbf89f0..a70c0f36389269756b724889c335c1b0bae157d2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,10 +14,15 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
           - qcom,sc8280xp-lpass-va-macro
+      - items:
+          - enum:
+              - qcom,sm6115-lpass-va-macro
+          - const: qcom,sm8450-lpass-va-macro
       - items:
           - enum:
               - qcom,sm8650-lpass-va-macro
@@ -109,14 +114,19 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 3
           maxItems: 4
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
-            - const: npl
+          oneOf:
+            - items:
+                - const: mclk
+                - const: macro
+                - const: dcodec
+                - const: npl
+            - items:
+                - const: mclk
+                - const: dcodec
+                - const: npl
 
   - if:
       properties:

-- 
2.47.2

