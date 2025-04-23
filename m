Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A560752F88;
	Wed, 23 Apr 2025 19:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745435918; cv=none; b=jYf8WeaSX7uPV3WO2QlEEV2scbtTkn1zPkMRoYVEJ4Acle2N/GuUNWCjViQT6ZYLLEj3qbw0LRAIWjENLwhdv0zmt7uc9mjNHr5p7VSiiomDaStkqmV1wcC11GVGJNaa7/949nyP8CRdSYiHy94aVSgi7TCHVoxEcLS8k0+Cgvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745435918; c=relaxed/simple;
	bh=P4t9q9q6HNFRvbE1rkBp9UJp/QgyD0QTFlp6sfgadw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvHIEZUhD5bscPRkHJzPrr/SWFBBKekZpoCJ8ljf1ncNHYMisQm77W6BGWC/m+Hqow0hGtE2FRx2pmZ13CNLi7gUwnzL8KimWg6ZdqWHR2gqWQJfxZSgH3gKaOm3dldVkpemmd8qx3T8gjYbzqt3+RSL8iOfiHDEhqdv2vxd/lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCIH+JvB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCIH+JvB"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224019ad9edso2560945ad.1;
        Wed, 23 Apr 2025 12:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745435916; x=1746040716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTG8DAFdHnp2dP0ywoyFdyZYrfquR0mqHFgjbLDe2VA=;
        b=GCIH+JvB/CIZjtwDlWmN66Ab785q8RaQ3LRmdMqaZAP6GODhmzCzB/hmEq7UwhxlLm
         vPf0DLQMc0vVRVgPi7Ix6QTDM0ayudWb7+GAViiNzr5vKOh84BIUoLslLMtF82qkX3Ws
         4xubl3z8DWoDpDvY3j0BlMbiQqJNEp51mgBMG1n0JKD703W4V++rw2v8aUN5vVijL89b
         GfMK4r/Fl1F459Rl0gPKkuWifw9ayuUQwB3iUmJ6+dfYiqGQudXDtv1JKrt10QFBisdT
         2UdhOe34Qc8RxaDYp1abv9IVEbLMRUviyENVYmF7xtbcRZ6y/VR3i1bqGTTPR0NI+6aG
         mebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745435916; x=1746040716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTG8DAFdHnp2dP0ywoyFdyZYrfquR0mqHFgjbLDe2VA=;
        b=FneRHNSwf5JjyQT09ScMOe7OY8PHCRwNqlAVS04rMIgFUb/Z0mxYRQDAdnRuBtOx/j
         0xEUQQvM75A+QMkTllVnqlGViw89N0jNRQ9IhM4dR5P4WHnj5IsNSjVJK6JJSC6yP2BV
         zeKLNPm3GEr+HtvXouiaACzuBk91pTwV4PURD7CLMH+waSdvOucQwnZWrZzLm1oeYuvA
         ZyW5eyHFC7z1qnvMmUoysZY0OoLV8la6PzGyegLLeh4lhK/GkFFD1907RGF45MUtsDgE
         poq7OZ0xgJJcssEHg6sTidM9HHaiwQZLs2mzKLTYdI5dQvYniPkGNLRpi4mXxaagmAu0
         3kxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrLIOG4VODoDG3XdImVxvrzr6Ijl9i3LQkw7TGFssF1hHXVqrSK8EmxHyLPxgsPYKAUtYj3o4rWNeZXFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsaO0E8beCYKzTa7saDf2lQaeFs54LdeI2tsuB59TS+r/qqWgQ
	pjTRqaCoMUa9+AUhEz8PXvgLdVqLWs0uHt9uhGVgy5mhOv+2g0JE
X-Gm-Gg: ASbGncsQmV9rBC9JSxE4IBLL6p7+CDpjJZXFN9jTxFBu99nL6WJeI1oTlGtxEiLIE2O
	LdAQ3hI+UA7hO4lLXKKeUtaPHOGhU38YAi0ttmqD8qbLwQsnv0+SCkZxFZkczn3fyb58vAgf8SE
	OibomcnObB1tWZ2RDplwueNdmLyUEQ9i//FhiHGevSaEOnpClv1e1QPRpv9u1wjAX/MuqcienV1
	Aj1Yn4wEoZGath5e3uxRuLkgSmA3lLOlGns3SnJTAfmG4QpWxODZbJevDRPrsjrN5Y/rRId2Dr/
	cEX3qErNbn1C0KnMtVeGVXoiVBzRG/puguys3KZNATwFI3fWl2OT
X-Google-Smtp-Source: AGHT+IGVUpukk6IH6oBCSYckzehJVWDoFyKFCFz+R+5pqwO+XdOKln8KhlOaepxc13szHyqhG89q2g==
X-Received: by 2002:a17:902:f549:b0:223:635d:3e38 with SMTP id d9443c01a7336-22db1a8d6b1mr8150975ad.15.1745435915841;
        Wed, 23 Apr 2025 12:18:35 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4897sm108204025ad.143.2025.04.23.12.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:18:35 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 23 Apr 2025 23:18:31 +0400
Subject: [PATCH 1/3] dt-bindings: soc: Add VIA/WonderMedia SoC
 identification
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-wmt-soc-driver-v1-1-bd8bf32521c2@gmail.com>
References: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
In-Reply-To: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745435922; l=1697;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=P4t9q9q6HNFRvbE1rkBp9UJp/QgyD0QTFlp6sfgadw0=;
 b=1+FGgFYBJHV6/0XVa9XKgAQpOA3+7YGbHCSVG44rcyhweBnrNGsV6t1fFSPmZwqEi3gpKQ+l5
 5/ZxGQqAHWbA20ME5pMssU9tVhASX90L+ZOFiK0yIPPt0jBjpLVuRQ9
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VIA/WonderMedia SoC's have a chip ID register inside their system
configuration controller space, which can be used to identify
appropriate hardware quirks at runtime. Add binding for it.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../devicetree/bindings/soc/vt8500/via,scc-id.yaml | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/vt8500/via,scc-id.yaml b/Documentation/devicetree/bindings/soc/vt8500/via,scc-id.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..eac72bd66fd6331c8d9316288bc1acc3e337efaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/vt8500/via,scc-id.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/vt8500/via,scc-id.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/WonderMedia SoC system configuration information
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+description:
+  The system configuration controller on VIA/WonderMedia SoC's contains a chip
+  identifier and revision used to differentiate between different hardware
+  versions of on-chip IP blocks having their own peculiarities which may or
+  may not be captured by their respective DT compatible strings
+
+properties:
+  compatible:
+    items:
+      - const: via,scc-id
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    system-configuration@d8120000 {
+        compatible = "via,scc-id";
+        reg = <0xd8120000 0x4>;
+    };

-- 
2.49.0

