Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289D2175D47
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724884; cv=none; b=d88ApJJNIOOtLAni0aqDMBLBhRaKmJXbUnm15sd3pReEe2Wkq935xStc4R53OasUBLpQoUy5425UgNwNA9PQlytylUhcjukiUi91t1T+PY7gGoAVS395f5I2+YKInS38seg6M+pSElivKHAAAsyV9AO1wmDduVGbdeR4CaeOc2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724884; c=relaxed/simple;
	bh=9lL5z/5ZnlWCseQ67IPO6Gbh/2cC7+gxybyIcI8QMkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hrnSuoJaHB58IaD3Xw8CwoMvp0umL9On/tiFUOyLGqbVUIXMrY4uNTE/BEINkX3BLOKAqbTvHLEKiJLYS1hK7lJp3iMUXnms5cUIJHrBQ1oHeQ02hAhQ9qIZvscjT1KaqtI0RqeZKXT6MnxapdpQJtMcFzbKZLnHoba/Q+78TRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wiaEkrsn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wiaEkrsn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so38274395e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744724879; x=1745329679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLNuOPp7/6q1u/JipORAthYcl23KJ0kTZ/zrq8XSK10=;
        b=wiaEkrsnARhZubpW5pC7sNh1u0Jg+iFgdlJGcVipLqDUTwjtRalgRpQJzbSpM3eC/k
         HZdodf/MLkp6GV0HR6AoAeaYWzfTi5gDNLVVOmDYBF/gbj7Ac6Ueu9Lq+0lVEepBIT88
         73Qr40Bsgh1ZMTkclqDFnBuWWzKd1O2sGPuTnC25T8Yff1d+rlaa7SOwcPABsWAyFB8t
         v2rwkpWWz5GaGYgYQQP/BywDi7Y9wbLJGEZmqxIGLQjXGOjDPEKkULkRi9gwc/II0lFX
         6TlaE4l1iGtcw1NdLh9Yt83F4GucGvJ3R7qScBzwfYjKPeN1Rhfp6vmx+JaHdz0xG/u2
         +6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724879; x=1745329679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLNuOPp7/6q1u/JipORAthYcl23KJ0kTZ/zrq8XSK10=;
        b=Ueb5ppS/TWAm9J7CqoIVbTDvILh+IReODKifo9GblWgXGye3cs9KoKepAycUgTURrC
         cRVcd9tS8KeqsMKaHo6CzvgmqqeQUyV4mxBgtL7QwJ25HXW3aWLHU6IOgVhACJUdR4Y9
         uAtIpY3T+mNBL3zQUMwD69pQRiU2mi4NtV7qDqPMNeaflStWSJOAOG3loeiTnsPe0j/s
         9CbO1EtG4+u6cR8FjHGHKalBSPNedztCiPU7u5tfRvYAss39wwVAIqizOSL396uVnGwT
         4WnX/VEr/3FI/fOh8oev2KuQPN4gL/FInXWa9KCqAGtGmnDPWe5zApvO9PE11tziyTOI
         a1xw==
X-Forwarded-Encrypted: i=1; AJvYcCVa+YLm0u7r23ioOWO70sNSnCWb0gEGiYGppadnTpiV+lNCFY0WYrMv+Rbu+unUhoY2ZoU+OK07K+IYxNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YznrrVEvKu/+coRSB0H/x86N2lAmEnvlrSY7UDrjNcEn/UR+QBZ
	L0zauYznpoCJXG5JdFtEUeW/GvMPA0UF6xGCfWw8ma4xwJYilEWIvY0fSQ0A+WM=
X-Gm-Gg: ASbGncvxddIRn+i2a3xl3i+fklJiKYbGUFncRZN+FCEMj8PO6x+uKqZdG6sogTDfQAZ
	4rmz4CmkxnWx0RPW2Cfl3gTAb9UoSs/pjPONDGeJ7UYDNAaWMEMgHBUc07xBLsSm6jKNFsPROX0
	aonFHxvfUmSfGKnPArMCZzZ2G9IxV8ofqYSNvJBxcdJgiOfysVKpdkULwpqsxGSFvi+73l1OMkw
	zBkrpyvzPGLPRa4HKVPjPt0Pf9/4fGbWGqDktqtu0Cv80YJYkX2s2WRUfxToBH1ojyZ98NrIUPm
	8GWtq2zjdq9/CE6g3oExQQXaWFFxkBl6MGFVgIVQ1dbanMJbLijzMcCqHzGgkg==
X-Google-Smtp-Source: AGHT+IEusx9V+EWA/jggcr6D9vXIrsx7SOzh1JnMQ08yxr3XdTQQwC6jFMkCy164NquHtj9I8blung==
X-Received: by 2002:a05:600c:3590:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-43f3a9aa721mr111498155e9.21.1744724879386;
        Tue, 15 Apr 2025 06:47:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d0fcsm210434195e9.19.2025.04.15.06.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:47:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 15 Apr 2025 15:47:53 +0200
Subject: [PATCH v6 1/7] dt-bindings: media: qcom,sm8550-iris: document
 SM8650 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-topic-sm8x50-iris-v10-v6-1-8ad319094055@linaro.org>
References: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
In-Reply-To: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2304;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9lL5z/5ZnlWCseQ67IPO6Gbh/2cC7+gxybyIcI8QMkY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn/mOKVg/1Jg0kiYLlIFPW57Hou8RbaRhsgIDzNaRQ
 FVVYct+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/5jigAKCRB33NvayMhJ0cgDEA
 Coi4IC0wHY2W+cJ5clSHLwLm7q8ECDZPqtxm0Nxbdi2OF2bTYPY+0rEXm5LV3r86342ns929POl72g
 xoJvF26u2nk2u2lEjLEheDc0vRDfAFjqT/ENZBEchcrKoaAuv8qK0y5Vp0NIhveh6W8i2qEoSBXdfU
 ur8mOJ9paPbYoM/DVeoyyPbIgQoPHALs/kuJ66ZJy8VMK8TzPZItW3NCqKHORx7vt9XY80R2Uxl3em
 j6rW2JCPv0cYLA0KVG3yoO5ZstIk71E3iwPMQ36UVJ3MQ/GqG2Mx/FFW1K7VubmyNDJ6VT15+M+4jU
 Ku12ggSq2ocqly727be9xlCOh49mUO9UCZ+tU6gRPQ8efhAKhl8RDnDetKnd0ijcfkFtQRNsh9dIll
 AnUYx6NNBVWblCGQ3Tc1EcGdvbYL42NKNjkPCW8moyhQAcPqTBTKJoZqJJOxCzPBgHjMPY02ZxxG+K
 duwIda3W8kdFUzmQzlidoADr0KvC1Ck6CKSvWMjIMavuYjafAtLbfJW70Cd+B/T10fpsozTaE3l++r
 CyNcs5NFssoxvTGTF0BrK5s3LDFP+aZNGOXkQO4eHAFUdZ9IzyOiYWMqJklLanCCyFM/kDXHyj+WWL
 fMEFh4jrss6BOAHneSaiDL3bN+tNcNmm0iDbPNdSJcEB8F50vYVcUZs/Hlkg==
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
index 6a89e9e3808758cfdbf6a51dfb9fc6559864253a..f567f84bd60d439b151bb1407855ba73582c3b83 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -14,9 +14,6 @@ description:
   The iris video processing unit is a video encode and decode accelerator
   present on Qualcomm platforms.
 
-allOf:
-  - $ref: qcom,venus-common.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -24,7 +21,9 @@ properties:
           - enum:
               - qcom,sa8775p-iris
           - const: qcom,sm8550-iris
-      - const: qcom,sm8550-iris
+      - enum:
+          - qcom,sm8550-iris
+          - qcom,sm8650-iris
 
   power-domains:
     maxItems: 4
@@ -54,11 +53,15 @@ properties:
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
@@ -80,6 +83,26 @@ required:
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

