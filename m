Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFADE19D071;
	Wed, 28 May 2025 00:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748393400; cv=none; b=C5hFRWodL2Ut/QNg6IDzp9Jq+FDtTx7QPMsaYC9iMMhgF1QlAV8uLanShhSrZjs4toLbRTrdS2HQHHPIhLbYQvbZcl+rUbW3njJWRWIj+7v4mWimjFiogAC2tMuF8qT5lAsjmOQKaoEHa/bwEAreduKTgR8sF1qI8wWxMxk25mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748393400; c=relaxed/simple;
	bh=sha92VV2+EoWCtweAw6u4LEaoBkrA672UXEMQEJ/fb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vBusZIEc7AwGNV3VW2v9aCF0UDNJFRFgQEcIqnr0U+3rPzb/cFXG9cQCXZZm9V3Ujf3ue7kY7QhKau12O8cJ8Hx0TKqVo0kPqPfHU7bzoddSn6RmtiSY7kuaNy6ZhrOqFVOx+2GcCkfBckKJDE/r5YrlVOViYq6AeeMH54YpCeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzqtRiWp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzqtRiWp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso31890355e9.3;
        Tue, 27 May 2025 17:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748393397; x=1748998197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxDe1Iovh/54xVOcGCnW4Kv10vEVui1DA2AOmG48Hnk=;
        b=gzqtRiWpowAxxs2ofz9URqeNMe+zTCjKmTZ7kk7+h/O9UzVKOV16MCsfcI/YaDjJgP
         v4XfRJCy+JnL65a70tFkJP12WqH8R/ZZAWOf/tNFRvVwpY2k2Nt5e17z6OHir9BVZapc
         2pLLWcW33sOUKPxvDXaT7VErGQr0gtQitxjPBaYndBBzbzMWGOMiu5vHJn2oBzPJon0b
         eWwgC+TZOxMd6f5Q7Cs9muvaY8BYMAXFNORMaMNYO+sMboo0web3Lu97ioGWHQVsnqUb
         mY+p3nqAhf6EmM1D/WSRAfLi96WPYtYaefQyftLP32xi99S/cMBx3HlWHIVOmS4HeMNG
         2d8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748393397; x=1748998197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxDe1Iovh/54xVOcGCnW4Kv10vEVui1DA2AOmG48Hnk=;
        b=Dl8LxIXUjc4J8hBLG1/+QVQ2JQh+hrGaZawqZNG3dgyN44Myo6smigFklcfT0dvp1V
         60woK2TenmwAl0OMNy4ztEYsnepx4plYFLouLJKVNp2kNbNgPQoQYmVmrDg7RgBuVvrE
         Hq6RVS8bzn1HLao3pzdtKSJ+PeDFStSu5ldMbFBDqAGK131Oc7OrSymKtS7I/M8+ZnV+
         Lsck/i4qqI8AWeHNu8YPaFqFUR0hdx1/FKjnmrJNxEoFgdmZZU1+NMqngWVB91YEq9w2
         +xZ2xzb7DuFmMsTuO9jd5RqnrFyGFQXM/NiwgXkSi4g/b3jMm3515f8+L9MUuruAdiUe
         GF4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdCRJ6g2TFHTE9vcqQ8Jr/qnavqUJNbvvuk90tWCzy0NvJEEv5a8z6DjrTweGnH6yU9tINtKJA+Qc4@vger.kernel.org, AJvYcCVHv05k88dH6gM1OpuIK2k8uxfXjwR2nl95EcHIVRamBF3g6eaxucLPgyCqnpF60j+OmpBXsmcRhPo8@vger.kernel.org, AJvYcCVJmr+HEGt2A2ZBZ5jtNHk4hcOgxdlulom+ya/NUN0Qi5XRqoLR9ZQkkr8kYahZ/7kXbCEmkbxdswRwi+P0@vger.kernel.org
X-Gm-Message-State: AOJu0YzGGhLUug/ArNepLVEzxrgwO3gNH3oA/PPWMYVhS1yfIwCta2zz
	b8iKd42OrSDv2cpGLmmdkhkxVOy6Y58xpFcyQd8vTYUhQ5Y2JlK+cg9Q
X-Gm-Gg: ASbGncurzm9m1KVvCjVU0uQxsCHATw2EMqbmHCIqFayNnwO2jgYn2nAmF8lmkQ01pTc
	pWudsGtqEGTeCAuWmLA9vq3gFHXJkv86XaXJ/8kDDZ46WEN0AgKYqDubLVgKXKem7TpQ0+pgbeW
	CU7uGpyHPsc5mqDYjORcjFfS9MGJ5CTbu4ngGyUC3lxM3vVrmLdvmAfyYsSgkzddVmGgVItKh/k
	VdkuxuETp/IIwgqbcTfNvs0Fur8v1MbqZ8NhMfHsNGqoyf1Zu4IaxY9MNVPSQPDXShKSg0e9MKE
	BiN/0yLI5i5YG4UQ8XAbTIbfobbIiJ2Kk1NH/O7ZMpVUgjkblkvOaLaeYK6/L7W2FmNUZKFrSp0
	6UOiots3jcoW8dr3b35uO
X-Google-Smtp-Source: AGHT+IGKiU6nJZAZ6d1xXPf7WTCE/PBbuojcXSbox+UrDOgX4+jyarqxqtL7YEwhys25u43dgyucaA==
X-Received: by 2002:a05:600c:3e14:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-44c92a54b22mr124921965e9.23.1748393396817;
        Tue, 27 May 2025 17:49:56 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44fccee6c54sm33682535e9.1.2025.05.27.17.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 17:49:56 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 4/5] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Wed, 28 May 2025 02:49:17 +0200
Message-ID: <20250528004924.19970-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250528004924.19970-1-ansuelsmth@gmail.com>
References: <20250528004924.19970-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN7583 clock. This is based on the EN7523
clock schema but use a more specific compatible (airoha,an7583-clock) as
the SCU now also provide very different peripherals.

Airoha AN7583 clock reg handling is also different as it's inherited
by the parent node.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml        | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fe2c5c1baf43..06c823539ba9 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -32,6 +32,7 @@ properties:
       - enum:
           - airoha,en7523-scu
           - airoha,en7581-scu
+          - airoha,an7583-clock
 
   reg:
     items:
@@ -51,7 +52,6 @@ properties:
 
 required:
   - compatible
-  - reg
   - '#clock-cells'
 
 allOf:
@@ -66,6 +66,9 @@ allOf:
 
         '#reset-cells': false
 
+      required:
+        - reg
+
   - if:
       properties:
         compatible:
@@ -75,6 +78,17 @@ allOf:
         reg:
           maxItems: 1
 
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-clock
+    then:
+      properties:
+        reg: false
+
 additionalProperties: false
 
 examples:
-- 
2.48.1

