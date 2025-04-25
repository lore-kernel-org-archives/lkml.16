Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7481B25DAEB;
	Fri, 25 Apr 2025 15:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745593353; cv=none; b=F0Foh2txQGaNo8aTyHSmhwfDCxiPbDkNeeBEnSSUQFGzaYQ5+U5b+F/OhQ5/vXQCG87qNh751gLVGHhkZ9SbZZFnLlhyRGqGidDdp7O+86dXr4rKJaimCFnwtFi7JjRQlEAjtHNUAXa3dby9Qyjh1zJw5Xq4qE3Mdf0mi3D/KOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745593353; c=relaxed/simple;
	bh=eITcbj1L60r7L2HnV6pDbRtxNcGPDn1rrU3xxeHimUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YbWwHtrW9CymmTNWDbsZC4S+dpSo8BddJ3o9KSwWUQlB1BYdIwwdY1KXYdK6MeBpMwe2mYJ5LagqHs5c8t+D0bnss5H7OW+qBTix1Xc3zTmpu0S6QPkhA/RgBPcAHIvrp1IARunecER5YYgQVYRC58LiVb17r9OWg0bsL++33HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcL3Orqg; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcL3Orqg"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736b0c68092so2047357b3a.0;
        Fri, 25 Apr 2025 08:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745593352; x=1746198152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Md7OwEIxBb/AOmWc2CKicH7/AjSUhK7eVTt1OZEiqnY=;
        b=VcL3Orqgp6gFB9Mo1Xr0gqlKkWYqHEFOuJNGpu2q45djEklHPFib928GrxthSQBYkb
         MgQwUwYuOpIT+EIH4UajH+8YzLvWbIzTAV/4Zy9tqfA26XST1BrhAC+eSH1pb1kez3A5
         v6KxFaePeGjdn2jONATIqpZXMkf5XtT/E1RXyeq1hjlcRbxqPHSgKfHIDNueFTealsmq
         eQ8yB79kU9HfD0zF5u36bQMlGd/oCDFHOcP4awl3/qqzcxS8R+Pf1lviP5nFNTAA5T5W
         2sbJZ4l3joq3+Pp8kRtcARMVfH6BxSt+gjAr6LqmaswlpxzKAEfii0qqsmjPXE6yDfF7
         gWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745593352; x=1746198152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Md7OwEIxBb/AOmWc2CKicH7/AjSUhK7eVTt1OZEiqnY=;
        b=VD13fXv6rciFQz7RRkA/JzBAThEMSV2ay3R9wBeRI/Y8KTgBV++RMImTbYLx/9LmKn
         ZZSjcYMsdXA4FG+GrGi0u52LfPYjB7Ta5ktnl6HLLJk3R+ydFvzA1gUVo3K/O2tPi37J
         U973w65RHTJsTLqpHoWdTVgc7aIZd5XNIjQj1pprnvSOcBI1dvhcSJorQpXwUXHMs1J0
         WNXJu/fpRXf3TLTaUB0XFRRPd/T0lqocvWyhECIYCH4eJFgNVo+tlsAtsP8DuNFduuNP
         C8LC/mAqtl3/YDoPubUlwfsnZGAfaxQGbEfw/hiMjbPZFkrfTttsG/CauKaOkMqBBtQ8
         uxvw==
X-Forwarded-Encrypted: i=1; AJvYcCXihQw7J3AmDMCSJ67EB8dJgO9V3PWX/YYpC4vPIQmOYEwAU1D4OSTVjl66yl4RIsOTyTe80lLEFawCSCY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1vLqf+npT4lUUflwWJfHJjQP2g1fOdIJfQJ4ep+upUjONTdJu
	9S0rZj4RfsAIkJV+bj+QmxGT2tbJahHnxpo32qpig9SgjvSZIbWV
X-Gm-Gg: ASbGnctgHYOCz0D+lLvHAPwPTLORpdzLTIMAXgF15AY5hrYnEaEIY3xMrS21imWX2Hy
	8et/KNsSfteAeAEgnJC2XGsDFj1MGrnIAkctwU6mBI2IMXbDdYMTRL9YC8J8ZPoHQAsi2rTN4Eu
	kpiqkgDrpfr31XC+EJzPKILJIbdfqt5FC03l/J7LO1rbdDGpoJjDj5GNB6JkNIhGX5FOFCN2y/B
	b+C65W8qgg7qjohdeBU65RiYUZWfnRQ9VnGRyx1gsPnTEIuA/UgiMpDsDOneRQI9asvqjESz/eW
	SAwaYYE440rXzKaTvfphP5hgzujAtPSgced317PidISwaR9Z9ntJ
X-Google-Smtp-Source: AGHT+IGeqmJGp3jUM7OBNFTR4SzWYeDt4a7Rox6kca268T04kWWvcnC42XpCBklitFhGhK2gKp2AOg==
X-Received: by 2002:a05:6a20:1594:b0:1f3:4427:74ae with SMTP id adf61e73a8af0-2045b75d899mr3863539637.25.1745593351666;
        Fri, 25 Apr 2025 08:02:31 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f76f45bcsm2996984a12.13.2025.04.25.08.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:02:31 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 19:02:22 +0400
Subject: [PATCH v5 1/2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper
 boards
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-apc_paper_binding-v5-1-3aef49e97332@gmail.com>
References: <20250425-apc_paper_binding-v5-0-3aef49e97332@gmail.com>
In-Reply-To: <20250425-apc_paper_binding-v5-0-3aef49e97332@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745593359; l=1490;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=eITcbj1L60r7L2HnV6pDbRtxNcGPDn1rrU3xxeHimUk=;
 b=1I8MCnYO5+9K1wrul6CZEDvk6WpFKf+Jm2p5Tf+u9qQNVpzU/Ft/EfKLhqbPcjGB/43ogYBps
 X4/iVJ8KfmMCuV66U5v9c31Ehldxt+7VRx7UB+N+KBbdkttJghOWvMH
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

APC Rock is a development board based on WonderMedia WM8950 SoC
released around 2013. Paper is the same as Rock but lacking a
VGA port and shipped with a recycled cardboard case.

While at that, put myself as the maintainer, given that Tony is
unavailable as of lately.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 Documentation/devicetree/bindings/arm/vt8500.yaml | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/vt8500.yaml b/Documentation/devicetree/bindings/arm/vt8500.yaml
index 5d5ad5a60451f569e6ef30c924a1964d02e1aa82..fa47b8989bbfb3001ae7bf6b6db4ef16132f047a 100644
--- a/Documentation/devicetree/bindings/arm/vt8500.yaml
+++ b/Documentation/devicetree/bindings/arm/vt8500.yaml
@@ -7,14 +7,13 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
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
+    oneOf:
       - enum:
           - via,vt8500
           - wm,wm8505
@@ -22,4 +21,9 @@ properties:
           - wm,wm8750
           - wm,wm8850
 
+      - description: VIA APC Rock and Paper boards
+        items:
+          - const: via,apc-rock
+          - const: wm,wm8950
+
 additionalProperties: true

-- 
2.49.0

