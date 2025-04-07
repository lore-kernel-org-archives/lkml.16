Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EDA1FCFD3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039465; cv=none; b=pOywaSzCufCDX1mzuvPi4IISUnXPOsunpBrflqAM4WsrokjX2RxlzGyWnLO+aP8S0VrYoQHg7/98m9kQmReZvvRJoDvECcl663NIpM+EdxmYhuFmfwMiZmcrnT49eaH0LuoTlyQdBnKRN+K3PhpO9tALKIlrwGL/76pa0Y8XZPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039465; c=relaxed/simple;
	bh=CeUr7VtrtDVG3f4pna9r8Lu1ToiXfg1Ot4m0nP20rJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GjxaS252Y4rluAPpPUr7ilehOEloHEgUM5TlWHgiHqT4Y1kMoT2xI0qPshfPoBaZ//KjmazXX2X1OtXUHDBxNu3kf3Jzh/K7THhgEdrG/0ozjOoOvIwshYwt8TdvURwH/FE4ZVkp5CVRF0u4CCuwAsA28haXxwXUOXRWPVKMWwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s1Fyc7ef; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s1Fyc7ef"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-391342fc0b5so3558934f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039461; x=1744644261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PvIr3fZaBEgjprc2ipD5ThXrnHkh3G3Z/8wBWGmdR/A=;
        b=s1Fyc7efjBUg1LBDy6rYE1R1mZP97obsToRZrhy3BXiZ0bl7B6+LdVNMepVftD6kZz
         Y+Nt2CrWvTnPWjKXrBbN82fhMofjdZUVqNBZT1lGg1zeSDxqEerNqIoKmVCHkELmWnaQ
         PnnCX2cntBPZaPddxGRIRUZQT8rJ+eij8AkGsMwk2O21UZMpqi8GZ3LSecSv2yaY2kiW
         objBNHVkSZmfpn1eP+PiTVFyLfnuCSFPC3LtRlin2A3E6KhM/SF38tLLMgrMkrUtOion
         dGWs9n+uB2RdBm7z/mbKUKd9/7LUzPM8VtMelQyi37YySJ2YfJ68lvgG1hTWU60rHiW+
         0GvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039461; x=1744644261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvIr3fZaBEgjprc2ipD5ThXrnHkh3G3Z/8wBWGmdR/A=;
        b=XykTUJFVxO4/9UGpwlhT4cUv59jcrFDkaIQts4Wv/RlAfutqo32bQ2DF+CMVV6XuKz
         fO6rGkb6bMNFmh9YeYeCf6DNzaU2bOdMvdvDFeyQwhqt4nF5KKxasnn0WVaMYYz1iEQV
         10bhxkjlY6Dm4CdZUm69vxXvIA2ZDDPjLkVd7LOBwdS074lLgAxQS8lC/CYAU+kkt1cc
         0OsxJxb1G7sR+p9g0mkFz3mZ/By3Tm+pjSrLp1ceVkYyt5BT1yl29UHXls6ddoMei8tq
         nw0MgYlOv1M8ctNHYH2/7LmSCszapunRxzSN/14+KZRg3V2U5deYfJP3QnqOwgqri/lN
         gkCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnMm2F8MyZPiaLTyfqACIlfV3uYbdpHU53/vIGAG4oTa2fh+zODqQNKTeLYORQn8z5qaoa8DhhF5MnyhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJxY84JvQ2ExSOsK7v0Arf6jK9CbQhz+CBL3THIZb7l5+UZ3wp
	FGm/49wSHuIlybh5AFue6Db7NLK3AKaB9z7cfqAUBXzZ76Uc9g8LctSiXvq95KcoKNACFcpRxPQ
	P
X-Gm-Gg: ASbGncuShaPzDU4ZCZEP0nGc9HhsLxB78fxnJJ43I54TbWLijwc8Lqw17KkzQpUPQoC
	FOHmxSrK2hK2kjySs+gCC3t325r6I28HRmzJrZ2Fq/vZIFOblIHS4nUP2KGXXC0f9un2ePRFFxg
	rXhraZ0UoSdcu1TZlpaot8G1t7aU7WiMXjZzWFvTQ9yr4Yvl2Yg5geU2MKt+h3oUZzZLjeWPwRd
	N9MLCX/8kRi8CWcfFvTUp5ukN83QXrR2U0WIdvPMkV7dtZzKMsJLu/jm5bcG8soJPwuHgE4F0lO
	IWznELJ4fI2NKqW3bGvu8YmF9uCcDypFJSOq83rIg1JqSHgSuWH7cdOnV4rTmvt37w==
X-Google-Smtp-Source: AGHT+IHDvNkFMbe0TQoAjLEsRn6aHFXvNsA/xJyh/TzfjeC5kl1IMD7S/50UpNYPAwREaXC+RsXCWA==
X-Received: by 2002:a05:6000:250c:b0:391:298c:d673 with SMTP id ffacd0b85a97d-39cba9827afmr11110612f8f.40.1744039461083;
        Mon, 07 Apr 2025 08:24:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b42besm12212001f8f.41.2025.04.07.08.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:24:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Apr 2025 17:24:13 +0200
Subject: [PATCH v3 1/5] dt-bindings: media: qcom,sm8550-iris: document
 SM8650 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-topic-sm8x50-iris-v10-v3-1-63569f6d04aa@linaro.org>
References: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
In-Reply-To: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=CeUr7VtrtDVG3f4pna9r8Lu1ToiXfg1Ot4m0nP20rJw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn8+4h/z7HWBd83Gst2hqpaTLu6ts1CrD8MZEN+M3g
 zR819MqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/PuIQAKCRB33NvayMhJ0TudD/
 4jh0ymmQzp5rU3R4//ei293Upl0nBCujyw+FQ+b+kB3SvkHMHpnD61P/sOteVebXw+Q7zq+7zrl68b
 Xn8r+yMLhUjKPlqWdqgM8+Wbt9S23DTyOqmMRpW/KdfvjPxG58yhejZWskd7bv5Lvg/fm8+F/C36x4
 O4As0zjuSYtrxJAteqvVopaG8zNxH7QRIevQiSlx2E03t7A3s6n4ZNxc1cvpbM/Pkwm+vWYx3M/Dge
 IrZ7Eo6nDMnqNthvsZnkcE1uW/h2JXvdkawynD0EVXVa9LHXcvbanwkPJRkfLQqOpVXQwNtbV6u2nB
 s3qqV0kns4+3YXZkdRo21LLj3hMRIpzK47Kzytq9u5rDDrNORjVhmEw1HZmXQcCIiHmeXmstxJ3gwG
 t6TiJaDmW4lG6Ys4uM4C+VYjU/jlXuhtvu+Pg4pk56ID1Bnf+kfYXSO3c9Wdclcm5eM/M0t+grQ+SE
 P+z1yRROcTqcbION2KBrwfhn2hpChfXpaxn2/fMyNtwhqrKa0+5xSoDYtVTRedeiVUWgLaDPxkZSEP
 tLsRu1RfzmBQsrkoXNRxTDgsHNBZQ0zjNzRYxf5rqbUASo6jCPIMBEwGuLE0eQ1eONS+xv1Ch1pMHQ
 B/JyrvtQA3D7JdXY4KiALqqM6bCqSm8AXbSJn6UUrM7IgN/Wz/MjX1YzFsjg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the IRIS video decoder and encoder accelerator found in the
SM8650 platform, it requires 2 more reset lines in addition to the
properties required for the SM8550 platform.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

