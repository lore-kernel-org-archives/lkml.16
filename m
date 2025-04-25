Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B90924A06D;
	Fri, 25 Apr 2025 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587993; cv=none; b=lAoiIVDtZqhkenVKaLK+3+C3JKGh9F1Pnt4cTtk69o9ly8p1fL0eDYurILGC3NiJKbjp67O55h0h/+KWCjrh8UgHQaOaQ74W7BkXf0TANVV1C7BxJ4lsOjehdQh7Gz2kGycL2KT6VULe9R9LcCMUa4SyxYWIaTH7jpOlRBvHyac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587993; c=relaxed/simple;
	bh=7MoBmJQeZLl1d5tdgIVwQgJNL7HZP8gebnQnY4ucRwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eGZJZhN/99HUi8c8rBWLCC/+Wj/vbhZnZWl5HgKdrdWuvfAIkaBBnJ9PuWyIFgPzgdPcsJmdYgy51pI3eoOJIO4r7Q5gwqBmzHFMrb1zZsCLvUAesgOAI8v//TCSq3WES8hVYPDPNk1Rz9iKjnCRPUhj9zDv49N+MkFHun5vm0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DT+dtedJ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DT+dtedJ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223fb0f619dso25139635ad.1;
        Fri, 25 Apr 2025 06:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587991; x=1746192791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pep0nEe9nBYLhazzxkyxDOa4AuBJd4R+Hgm/7v3gc7Q=;
        b=DT+dtedJz2seF+Z/TPllASE5TMLCLBhC/5zU2Yiyfg6Zmw0qJOMoMVhfSi0rP+Z8GB
         DJ04hbzb/SBHwxyQkcq0b4tomRCv8D1mOMw8uFYIbAMtfjhCot1RGox9R3hQXzsHw0Y6
         yikC6TpOiKd0XtQTMdWPi/jVfTd4q+HpcP3PBQ6JthjcIa7JY/AHUh3yJdpj0F2r2+FU
         rpr+CQXr4cXUbiLpo0bupmnFrBIWTkZrhLzTnPi48yXhd4kejGhOwFPVgpLiaqxZTpr1
         +J8FaRMurIq37iPWvulEBGR3KGNkmmEiQywy/lGFiAvycrbXKYqwArY2XIf5/IDst69r
         DzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587991; x=1746192791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pep0nEe9nBYLhazzxkyxDOa4AuBJd4R+Hgm/7v3gc7Q=;
        b=KRxkgvbPShjjhXhQ+vSwZW2309SNtahv0r3WxCkesw98GfZ8U5+0YZDFQNf1oMt0hx
         a3mjYWz4teCua+kNSq2ovH1F+4f+VEKSxZgKGoc2f28wJ/Muv2WLJCLxMbZ/eMk92CZ5
         qvpFbpp73ruchZkmSE34VKSVAWuqk+kTfUUlsal/FBNP1AfCXac74jkisjUlbEQALJAn
         uPuVwqYXI9qWqaqSCdo9nwN4K2/U3xRf3c5RvFSCqxyXmXQvy4ItMq49PhRp2kTKdNSw
         2C0bSu6hYCffXUSLrGsZY1DFVypYtJUbPO8k1ix+jaJ6ksNTio5JPOaEeXdh9R6oWecf
         Knuw==
X-Forwarded-Encrypted: i=1; AJvYcCVRzGRHDRzqfYjK57sRBAo0WI046MZc8Z+eKVd+YNp7pRNRLlfrPE/49GHNKVvn8suX0+BQ0g3WjWEhdJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGx+62uXKHiMamiHv9rtzCmLTmA6DX7KAyCGHUUe9SibHrN26L
	bP+9I84bZ5P2YhcOaif4QXw2zSdO9d9i/6cLSkvu6gi+AQT680sn
X-Gm-Gg: ASbGncu1n+ipWYG8z2B33yCIR96bODWCFhiPY0aMArcKVPODDTxUIsXAJzHlbA2YY7C
	pJ+PWVjl6Imn1JTW5ys83jltn4pqbdgTBdKr8Mp7JFeEiq6kztt7Q2R2LuUtyA+7p7t8q9ZIykN
	X5jPVwHdM6QERj3RXvR9BGzHIpMFE1nLEWQ3qMREvW+xGuB7dafNVA5sCdV6KFC9DCpO1wXoWAr
	0IAxSfjCQKUcAEJugczk9fmpsQX+0pb/q76pOACNE+X3r1u/IfFBuKYY6lSVMz/GCmcnJftLLTk
	QtWF/QNSAc9EQtyhmvSsTxHOtLttrEdBqMNZKTXYzKsdEIyf51iO
X-Google-Smtp-Source: AGHT+IG4gdZGqoCFY00Bz2qafpDH6e8Ix477pgjTWfraJWV+LLOKEsFlXxB9rbKhcUQiL3rNHJ+myg==
X-Received: by 2002:a17:903:4410:b0:227:e980:9190 with SMTP id d9443c01a7336-22dbf742dcdmr41822465ad.44.1745587990612;
        Fri, 25 Apr 2025 06:33:10 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e766bsm31834165ad.149.2025.04.25.06.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:33:10 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 17:32:56 +0400
Subject: [PATCH v3 1/2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper
 boards
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-apc_paper_binding-v3-1-846b0855420e@gmail.com>
References: <20250425-apc_paper_binding-v3-0-846b0855420e@gmail.com>
In-Reply-To: <20250425-apc_paper_binding-v3-0-846b0855420e@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745587999; l=1622;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=7MoBmJQeZLl1d5tdgIVwQgJNL7HZP8gebnQnY4ucRwo=;
 b=PCaiVieYKaF9KNg1bFpg51Oenx56aifgRnz4KdSOazltlzSwfLotz3hjw+68lvbSFv2WxfshI
 tA7p/S2WUaqALUrP0dY5PBdthUCyrkcMSAqLN8ST3RzFJ5+h2Fc5KOF
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

APC Rock is a development board based on WonderMedia WM8950 SoC
released around 2013. Paper is the same as Rock but lacking a
VGA port and shipped with a recycled cardboard case.

While at that, put myself as the maintainer, given that Tony is
unavailable as of lately.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 Documentation/devicetree/bindings/arm/vt8500.yaml | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/vt8500.yaml b/Documentation/devicetree/bindings/arm/vt8500.yaml
index 5d5ad5a60451f569e6ef30c924a1964d02e1aa82..f2164144a7af29ca77761bc58fe7f4558e7d101c 100644
--- a/Documentation/devicetree/bindings/arm/vt8500.yaml
+++ b/Documentation/devicetree/bindings/arm/vt8500.yaml
@@ -7,19 +7,24 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: VIA/Wondermedia VT8500 Platforms
 
 maintainers:
-  - Tony Prisk <linux@prisktech.co.nz>
-description: test
+  - Alexey Charkov <alchark@gmail.com>
 
 properties:
   $nodename:
     const: '/'
   compatible:
-    items:
-      - enum:
-          - via,vt8500
-          - wm,wm8505
-          - wm,wm8650
-          - wm,wm8750
-          - wm,wm8850
+    oneOf:
+      - items:
+          - enum:
+              - via,vt8500
+              - wm,wm8505
+              - wm,wm8650
+              - wm,wm8750
+              - wm,wm8850
+
+      - description: VIA APC Rock and Paper boards
+        items:
+          - const: via,apc-rock
+          - const: wm,wm8950
 
 additionalProperties: true

-- 
2.49.0

