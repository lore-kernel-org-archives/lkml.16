Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E3178F4B;
	Fri, 25 Apr 2025 14:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745591656; cv=none; b=Pi5CNNI54U4iWXgUGUTMmJtesQxlNzgKOc93wXIVVE/5l2MjObV3rgRmw48QJlRX+BVJG5Q2YANqqpvQm+8p5M0GEfxCUk4yKmcsx6ZKm5PeR5ZJALBgQZN4rzPLxsZDp2ZGFBbo/XhV5UYP4pP5P8MuPC5N4GDtUdEFdJNcXjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745591656; c=relaxed/simple;
	bh=7MoBmJQeZLl1d5tdgIVwQgJNL7HZP8gebnQnY4ucRwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d+NnX2oSbaIBF4WdoupJWj5qYYuBXUoIXxI1wrMYFm6DDUYylZAASFlTkbGgQsx3jXgOTry6UIrnPUMNEqTkqQpraIunSb5V6u0OAnzNLkujwcfJW9k/4wiJoaMzYRO6SgD1rK380Kfn7RpB8tahbMpXueLIUIfYJZgnEARCfeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkLnu9Fw; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkLnu9Fw"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223fd89d036so30054235ad.1;
        Fri, 25 Apr 2025 07:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745591654; x=1746196454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pep0nEe9nBYLhazzxkyxDOa4AuBJd4R+Hgm/7v3gc7Q=;
        b=OkLnu9Fw5nN/sf5iTWUJsOvWC5peAEYiunnrKF7RhhHTuVo8flteHzuHXD6xi5wMS9
         ZpJn0NycX9FsIn/qCvgfTuv7gzJwH9Zqd/CyXe2wI3Ukbq+aIiG+C1pLcJ3xEKnGlrsn
         /9QeLL7CDaj0DilP6YV66XJpS1KK32NKYkQxvohKOf1cmrv/dFYIz7jXgtIQ2BiBBgkN
         qz2RwurCHo1HU7I4S8S7DRaFA+P+zOCFOHPO2QOhv7Axyw661cgukMTe9irXU37M4juP
         OmhrW5Qmr4qyE/MON862E6T5tmmztsPe7qXp3mzwzNjrtPGa6dQkf3jwGQZcW67aYaxN
         +ZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591654; x=1746196454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pep0nEe9nBYLhazzxkyxDOa4AuBJd4R+Hgm/7v3gc7Q=;
        b=fjZjWFwLplOdcobu7KbDwXpaw5NRzJuIxj1OuPR7hY0D57PkVtvkGMDBto6PTW8WJW
         4bOIQIhXhGAM5tPo57IsKbZihgBU0AgSbeW9iJCa0wBBjhrLIElLkhRBQT4xBsJQ4BI7
         +9DDwsn7l2pv91KE+nRFqvrGMRgr5E87jBlZVJhU58+LKAnR/aOvYtVHCl5xTucVh/dN
         JlY2r2a7y/QS/vG9cLR29hIgtJXldluX+gQB2+H8ocD4AvRPBn0/nFMVmXIxSiOsuAzp
         mNlY7S9dC1Jmx0K+KoBBKn2ucGoMJDzwznxuuy/eWbHzlw7S9oqhZ54pC1tCLw7KyLfq
         BPNA==
X-Forwarded-Encrypted: i=1; AJvYcCU3uJF5q2+EhsypInYLk25bDP1U3tOY8UTqfSKL2Y4qarDzPV9MtJWQD2++SmN2Nrd2szol8Mn0VhjEctA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBqQK2cCCiz+sDabnYUFfKiHtTEfb2GTZnY0vgazzqBaeHGxlc
	tJVmje0hI73UAx2gzupVzjRHZRnrtqTi7ikWmRB98oZCTS/3RVtY
X-Gm-Gg: ASbGncs4XuWpaXcs9+iKiUBPPje/8dKvPMFJrwQlM93femvBez0035T08fMqHdbKTTD
	9535P8MrBx0C6GY49c/+Z0KrCYd6eM2lTt81bnY6UlEbnTU4A1j4/yRW4S+1T7hMo+x2MZHIe+P
	TFgEGjP17gu5t2jMFdkqGUZS2mQ+9u2zn6GnbY7qm2E9rYNrBsjGV1WfHLHwUIT8FITjsskJzDZ
	T+Mpkg/B2VyJMNWCpv3AS+PKtSl45TYvgDJjSJJSriy03WuYwsjllwhwA/sw21NhSOOTT0Dtydp
	NH6hgDUG8RuMdtJIj4CgQPriVXiNh2O9WQiQsY1dPyAMHbeT++lO
X-Google-Smtp-Source: AGHT+IEcth0n/p22LWn2V8E8hbKZoQEDrKaCxIGxb667TJCFfUnCcjwg4Wa+wnAp2NhbEJka85wSJQ==
X-Received: by 2002:a17:903:3c47:b0:21f:4c8b:c514 with SMTP id d9443c01a7336-22dbf635456mr41642505ad.45.1745591654499;
        Fri, 25 Apr 2025 07:34:14 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216c35sm32860695ad.233.2025.04.25.07.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:34:14 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 18:34:13 +0400
Subject: [PATCH v4 1/2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper
 boards
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-apc_paper_binding-v4-1-0ec2d0febe21@gmail.com>
References: <20250425-apc_paper_binding-v4-0-0ec2d0febe21@gmail.com>
In-Reply-To: <20250425-apc_paper_binding-v4-0-0ec2d0febe21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745591663; l=1622;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=7MoBmJQeZLl1d5tdgIVwQgJNL7HZP8gebnQnY4ucRwo=;
 b=ZogAjhlcaxC3gJmCAVTDtMtupBzVVHeqIG6M/2afBJrBzqAKQZ4y+P+6tHwEWWNynupPAtqt4
 bZIhzoL+75OCFB8MKwO8MbxZ40WC8ZjxH+yyJ52r5DjB94IbdFh9SFQ
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

