Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA59205E01;
	Mon,  3 Feb 2025 12:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585146; cv=none; b=UG8VwFZanvXMe+uI7QTIahioON/MmAI6/9gSulF3Qi8qpaW5J1nI1wogLuM6qSKEVkDMPgulMZ+LqX6gtwNlJ6GSzRjFbI76s8ng7hBJLTGfdUQxHsbiexnW0+OUOgchHAJF4bslcaIzbmzvXTIwoqunXrMtRHF9QOTLDGIkJVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585146; c=relaxed/simple;
	bh=TcKqDidlzZE30cof1ogOw1soncsTPmmEW4myoxbnDYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7IaJF0h3RNH7ukLcrjLNRbuZOhEGBb+yy5nyICDMvvFpgg0yN5XYsMLE0IdMNNFe56Tb3OMkdNunrjKIEUK43Efj4MTBJZrjiE9JuIscEgdDqCRbMsuHig+r1kPDKOC/gHde5jP4H8+3n6FNymqMIcQwVHs+u4IUxDtRUgGxjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYZjvm4E; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYZjvm4E"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-219f8263ae0so76825975ad.0;
        Mon, 03 Feb 2025 04:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738585144; x=1739189944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkArynpSqp3cWfJCyboVvj5WV1Udsg6X2+BBCytGm7Y=;
        b=TYZjvm4E8DkwU+A0les3FPF4zRBBOrvLKrRlEUUJ5N+rd+X3pm8+nsBSGggJsCwVzj
         z0s4gy5Htk3CpeTSwmBTZTMkxIescaQo5SwlV13HCueXA6/6tb4TJF4nGNd0g3ybHXQY
         glSCD1sFdpBdl2ImVezWl36NtQH0ldKalQqAQBqguzZom/bCC0mB7OWA12F4Bhc3Lkkl
         37HWB/ona03akMxZrRvVMqU/0TmAcevHj4x9c51za7nS2g3tAyftziy0jobuvrcITHUx
         qgZsIYK6IS0FUBk/YP2eM62KrciyqSJdTfi/DusGg19V/skMnTAVDifvk0zHkq2h3kpj
         QIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585144; x=1739189944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkArynpSqp3cWfJCyboVvj5WV1Udsg6X2+BBCytGm7Y=;
        b=vzWAcXjY4iMaXmVYpOtNE0/pf7wbgEK/uEbpru4JgNyeOsjsh5N0u/yzveab5KP5PU
         z26boL4rriilVb0VIRUMiFuzHeGXGaUNs2tfK/KRT2MziDpyyUHFZYXqgOwrBNNJdXcu
         WKw++yC8AGPYPcZ9gJjUatx9oOpWEgQ783xqrMTb4HGDq512VYUS7+Q+onLrQ1SvSzN8
         gx0xL8gZ0KRXrBBmVm36flM95jyc8Hke5i2ZvAQDnLy/psJgnCHX9OR7BqDbYmxWOWFZ
         WPJp2i1M0H+/U7OtXtwAerfrhqidV3hO/jNu7g7hTS1MGQ61JhsMtS0t3kVExhokAWjW
         7zFw==
X-Forwarded-Encrypted: i=1; AJvYcCWER9fp1Emh+qLZnL+P8H7si6PuLlR5qbVw8pu1jNE5lBW/oMjpp4UMu4Ya3wcMIMhOti8OIjJurso7Qxbi@vger.kernel.org, AJvYcCXm8RzRh+GXrdERXJBiuqsLk2SJavshun20B6cPQYUhEUEVJWrUGaleFr8w8DSfTJq0QYLk/smSqS3u@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+93/ScbF3q0l3b6/+gmr4SbBiy4je3efPLK4kp3cab4BbX4Tg
	cugecCletzj0JJ2TnCBHBzwFExFVEZKZnkorBtjwSkcgR4Wuhuve
X-Gm-Gg: ASbGncvbZ56l+wluYva+q8/WcUb+XhKY6bOCS2kiKorUaMMHvehNITkY1h1bC0X6LO6
	9mT7S1SzNkWfuwZA9PzYPkL5wNyJSgXjF33cqJcuXl1h+yv6SeytNk29Vh3gLdnB5OBaO2ET8w/
	QVAPJBFTQQJJyGRUYOPkviDYD4Vd1gC6oDJOVgXHXh5eZws3HXPbz3nqJbEexmeT5UMu9dsocgf
	qUtaD2GdC4jtgUcA3RFXwy/Rt0BYXmhfRPglg4vgCNB8KfyiVAnZ64hxdpobH71YnjJds/m0I5b
	pkPNKvkK9RYi9t2k
X-Google-Smtp-Source: AGHT+IH234xwtUPOxphuk4OU/QS0XsrqNUoO1+smVE8tewsNcYKC6gtQXb6XlCEF1IIRTZGJuOd4Wg==
X-Received: by 2002:a17:90a:d2d0:b0:2ee:5edc:4b2 with SMTP id 98e67ed59e1d1-2f83ac026b1mr31193292a91.20.1738585144502;
        Mon, 03 Feb 2025 04:19:04 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f8489aefc4sm8789225a91.12.2025.02.03.04.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:19:04 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v7 RESEND 02/11] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11, T2 compatibles
Date: Mon,  3 Feb 2025 20:15:46 +0800
Message-ID: <20250203121831.36053-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203121831.36053-1-towinchenmi@gmail.com>
References: <20250203121831.36053-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 59a6af735a21..6e9a670eaf56 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -31,6 +31,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr-pwrstate
+          - apple,t7000-pmgr-pwrstate
+          - apple,s8000-pmgr-pwrstate
+          - apple,t8010-pmgr-pwrstate
+          - apple,t8015-pmgr-pwrstate
           - apple,t8103-pmgr-pwrstate
           - apple,t8112-pmgr-pwrstate
           - apple,t6000-pmgr-pwrstate
-- 
2.48.1

