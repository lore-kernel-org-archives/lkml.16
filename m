Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2CC21B9DA
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007358; cv=none; b=rgb1q8qn7b8lTHstPWaAhb5V1W0MZE4TssEKtk/8N3aH//SBy+a4FrTslZSVx81AL0mXBSuASTR/2KMEcU04bjmdgweNvxh3RUh514F4Fgu1auMZqsa03dRy5bZ45DEzy6n+yNSydm9UsQATR8S8ZSphR0+itYCGdOFtxKVmuLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007358; c=relaxed/simple;
	bh=DDoOiVWP7KZImpai6u0PVHDpzkeoi2DbnaMeS2WpWmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hspOXA2IFRyRsmn5fC9BkjKCtmaTKgwLxOKeSGd4Nz/byxmQ64QW8r7ZsZMDbMO6LwYO8h7Nhsk51Ia3cJjzyN7AXYTP3+xs4n3xG6gCmeIL5s1/lglLAoB5qShp0q2xlqjqNzFQO7l/+t3QFSEHsHVRom0TqrvGQd3CODoq8e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YhCm067e; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YhCm067e"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so2836874a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751007354; x=1751612154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/MltAVAkbR8k6TCTW4CyO6wlIYS6CBRLi/IFlrjf90=;
        b=YhCm067eU/raIk9FCTXkBe80jv60EoqO2R7/Bh1awKzhDZeMEvST8FwyHi3kJ1Jc+h
         87WbbKiT06isBplt6J43Iuh7IUZ7n3W09RQJ/Olhbkfw8c8SuFaV5DJGsnwMDPnTThj3
         C5nFiqC6oVS8MxY2n/3eAEUmViA5Pwf8aIhyO6P60Jnx75hX7iv+BoT9Cj+WcVr95DjK
         PRodeoOgBHWhTnB8CNcUXiopJA/mzXMwv3xSCF3IH8tiooVV0nDgjPxaoWERCWKvEA8K
         WA3yG03gsBhmbMyO8ZWVKam9IbOz30t+hZHrpyBAtFIQyg/2dLBmV6KysRp0F/CEQkgy
         gTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751007354; x=1751612154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/MltAVAkbR8k6TCTW4CyO6wlIYS6CBRLi/IFlrjf90=;
        b=wLhRTfQbcVgHqAOix5l+JvpndLrt74KvPq2RklpTZBw99xtoeDjRpzZIZDbAnDQ69z
         DXSHi+U3WjL4QQdWF7D2nF4+91Kh9ByW1E+0xVVbyPOmNzikIqY2OqYusV2UBvpopYa1
         YFhw+KQE8fqE+iGrn2+8uKf4xH5lDJWQ+Bj4Ana8DAqCL4whRf80MpHeq6GCT1bLNYis
         oTHMwqKAM0m+P93DNN0Hw2x5plhf+V3kDOY+IOBEyw1URHDnuGUtGkthX/depqErgx+6
         EMCWwjiHhoUEv5rFVdht2+b+1Ez6ldTdAAUxcOsSh4tn7dSaGcCmeWqpUwcDOhar+bYZ
         8ZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIRye+7Sq+N5m//q0rrxAyYKn6v7cE4gh8qQPyptgtmUn83PtZXZJThHe1aHgT9oXrZ06mtWV1UoZlaTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxToWYHr4/SgQzVOj2pKb+Bn8RN9D6lIYmZmj2o5JAuWPv4x/xb
	CtewaOSTZuZCy6ybZtj2W8TYbKFsc/76lXMYfrr5Ln3H2fYywuljoBHuytskZZ05vbs=
X-Gm-Gg: ASbGnct1a3IMLTU1F7CBHWRsQH0wyyGNsdy1y9iR7EJUOMElPxveGVvRTXSbAp1xrQP
	JqdlSvxg7ezbaFjOpExts4NouuPjxD+vONga9xSUwU7iZ1cHKOxUmhrwYdvCHT2UFfK97Ai3KDb
	+345ZBiuRlgJ0EDl5SCAUpzEq4h/rJEHXr1rzGCRWgir2RlITOfEL8iUXBni6dxD1YcCIJdyFHV
	FCbmOrcbPlHIDXzT1ajHf041txic9ej+SLNCk/pVctB3Jkz3BkMHkyWqx2Upzx03ke+/QDuTfPw
	+kFDoaqHn90yqGphApNAHS2njygUPttWi/V/r/7DegpHeydvbNMnXIN1EKMgYWtAPvaxk3u3QS3
	SZKWx4gLVeejD/n/xo93KppIE4QASmG9j
X-Google-Smtp-Source: AGHT+IEPOegvS5x8uAfxLou6BqkH4jPPap2DV8GxhIYNv+0+kp7YUsrnViWajQTwwmSuckNTkr/hcA==
X-Received: by 2002:a17:906:478f:b0:ade:c643:62ce with SMTP id a640c23a62f3a-ae35016e6d6mr183382166b.56.1751007354155;
        Thu, 26 Jun 2025 23:55:54 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290ffb4sm1019451a12.36.2025.06.26.23.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:55:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Jun 2025 08:55:43 +0200
Subject: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: document
 SM7635 ADSP & CDSP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-sm7635-remoteprocs-v2-2-0fa518f8bf6d@fairphone.com>
References: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
In-Reply-To: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751007352; l=2202;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DDoOiVWP7KZImpai6u0PVHDpzkeoi2DbnaMeS2WpWmY=;
 b=rEYZ0sl+6FbVHfD363nhKpPvyLoXc0/GrxUiNcWrTXEXL1tlkyPbvtPFub8YAxVWHHcqZLevW
 927VTS6GeQaCNRCaSA4ODimaVc+E6Wr2QnkQZm30Y84tyDwRgj0VKGy
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the ADSP & CDSP remoteprocs on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 2dd479cf48217a0799ab4e4318026d8b93c3c995..44cc329be5067ab6cbaa0a467669cb3f55c7e714 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,6 +18,8 @@ properties:
     oneOf:
       - enum:
           - qcom,sdx75-mpss-pas
+          - qcom,sm7635-adsp-pas
+          - qcom,sm7635-cdsp-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
           - qcom,sm8550-mpss-pas
@@ -165,6 +167,24 @@ allOf:
           minItems: 5
           maxItems: 5
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm7635-adsp-pas
+            - qcom,sm7635-cdsp-pas
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+          maxItems: 6
+        interrupt-names:
+          minItems: 6
+          maxItems: 6
+        memory-region:
+          minItems: 2
+          maxItems: 2
+
   - if:
       properties:
         compatible:
@@ -185,6 +205,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7635-adsp-pas
               - qcom,sm8550-adsp-pas
               - qcom,sm8650-adsp-pas
               - qcom,sm8750-adsp-pas
@@ -239,6 +260,22 @@ allOf:
             - const: mxc
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm7635-cdsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+
 unevaluatedProperties: false
 
 examples:

-- 
2.50.0

