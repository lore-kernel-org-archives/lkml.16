Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5337719E967
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 03:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747540566; cv=none; b=JRAc5cTRalXJZadIr6aHq08z4wcs3+Xc/dpcbCVagv0OwYGS4f5DnyWWiGthR14eBsnLZeCJtUD8DnKcTF8SsEMbw2X4xL3VG9TUUe7JcmMgjqKLzfeknOq3sYtLPD07Xn2+bIg9BU+KkuTRtFy8JjLpbgnEIS8t08lJQyhuFXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747540566; c=relaxed/simple;
	bh=X2R0lRUo/S7bGxarvGbPnwAztmFTvYyHEDZhH43YC3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pOe6iU6nWumPl+LBzGWcXsTWm9dH1UNYRNVTR5XHAKhzZi8LGo3ZZ1vlxXYyit06WW6MvZotGaPfdb2gdqwW4NPYnHMAmOj9APFiHBgWTYGzImgMrQpQnTsns5lUBCUFUM4iWE6Mxd8+g4nuH70YU+vIG1w18LXx71K049cecso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=ycXQfllt; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="ycXQfllt"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a0b9e2d640so2953482f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 20:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1747540562; x=1748145362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ag1YP0aXAY2InPlmdvx0/NdA/nmWNYGDzlXrc3yzqww=;
        b=ycXQflltcldEpdp0Ji+dA+6y6aYVDaNXbM4E6vf6cRi/M6SRrmRBr8N5GV+hVdAH8v
         uh2KXwyctlCTpdi5iOdHKDVZDUOV745o2riqdoh7fMzda0LEAhs0GiB9IrKoxi9TAh+6
         MVKN+xKisYFxhmc4hHsDVe949pg8UN1ZakUDowLY6OpZlX2dtN8kiFufA44uL0mvkx1E
         Dty03c554mR0aYYJmYlMcGRoN4+Y4Cp6a2T3gGCZfV8Q3zr2R30La1AW3QAAbnI8Cw6v
         e94moIMvweqmlovAOE+vLjuU9NBmQg5RF0AJyJ4/SIxk73J7erks6ns5jw1sLmNS4o6r
         Bmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747540562; x=1748145362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ag1YP0aXAY2InPlmdvx0/NdA/nmWNYGDzlXrc3yzqww=;
        b=tWnHzc394hDKiqI4objVr9G4r8MG6vwoxgDpZJenQbSHC9vsKS0hp1j15wysZy9l8B
         7YihYlBmjUiZn6A3616dGLBIA5WkzRdXKJap/gM9Ge/W4u15Pk6Oj+lgoXh/SLtUOdGy
         z803Usi0dDjyR51+cuoJ1AxVnPntrrZgMmDg1nAKj/DBlZe63CcnrW+ZSEJvJg7NLC+W
         dhIEVbryuODtx5yaEA0kA892iRs9ZbfNzNNiM27phcjpsTj4Tzb9YHiChR0K/teAOB/p
         UWd9QacqMZV4+syyk5VnNvPTFm6xBf0hFCztx15Z3p0rEc1hZUQFY6Yrbs5AU0i5uEjk
         Px1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjqxR8/arpAGjHVgLs2NwsTMBRb1g/bUHE1flpwdO8eys0oWZCO1j4qVehGiIvztpqwLKqwAH1kF7eJok=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCRMGQ5ywlk8xSUxUCE9sDnn6DWYOFA7eAOunA3zQNwwkBOdei
	4kSE9tj1HkVyydGPH+3ek4IM6G/SliDOZYNWaFwTILitNRWOxFBQWdoi/HLSc072L+Q=
X-Gm-Gg: ASbGncuKn1HgvG7wIcu6onsd9QIFKJFcvqJTqsfp5I4OLY1mcLQaRBtynYOWaEHNzue
	6PhhpaOZELiy9u7TNzNjHoM/If8ml+WGHDcqNZ/P3uSmEWLu2x/yUtSWL5oQIQSHWL5PYaJRiey
	G8qCpp4JP+cc6uu/NzD9ZUFvAUtN5D3GMgEm4ytBMtNT+BS6VhMVNTR8ptTvFX/53juvyhmqxmM
	UhZHR4s18RKTBJUg/RCMa+fligs8wlJeIuIPMzGHciolW/R8NoRl1fmIaH0fJzu/d+Dvo/b5ScH
	E/1kz1Vp0gav62X36J8OSgo4uyYcx1N1YwvenThOpDF+1jKpNFj3qFk=
X-Google-Smtp-Source: AGHT+IG93wDD2jjXIrPe3sZUfvLXdAyBTc/CB1QOVVGZp0c5rnsjMhnrqRbw/as6MuAHMcVhp6gCcA==
X-Received: by 2002:a05:6000:2012:b0:3a0:b84d:805c with SMTP id ffacd0b85a97d-3a35c84ac4cmr7035704f8f.49.1747540562426;
        Sat, 17 May 2025 20:56:02 -0700 (PDT)
Received: from gen8.tailc1103.ts.net ([193.57.185.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a362b4e2e1sm6730947f8f.96.2025.05.17.20.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 20:56:01 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
To: Oliver O'Halloran <oohall@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	nvdimm@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Drew Fustini <drew@pdp7.com>
Subject: [PATCH] dt-bindings: pmem: Convert binding to YAML
Date: Sat, 17 May 2025 20:55:38 -0700
Message-ID: <20250518035539.7961-1-drew@pdp7.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the PMEM device tree binding from text to YAML. This will allow
device trees with pmem-region nodes to pass dtbs_check.

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
 .../devicetree/bindings/pmem/pmem-region.yaml | 49 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pmem/pmem-region.yaml

diff --git a/Documentation/devicetree/bindings/pmem/pmem-region.yaml b/Documentation/devicetree/bindings/pmem/pmem-region.yaml
new file mode 100644
index 000000000000..a4aa4ce3318b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pmem/pmem-region.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pmem-region.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+maintainers:
+  - Bjorn Helgaas <bhelgaas@google.com>
+  - Oliver O'Halloran <oohall@gmail.com>
+
+title: Persistent Memory Regions
+
+description: |
+  Persistent memory refers to a class of memory devices that are:
+
+    a) Usable as main system memory (i.e. cacheable), and
+    b) Retain their contents across power failure.
+
+  Given b) it is best to think of persistent memory as a kind of memory mapped
+  storage device. To ensure data integrity the operating system needs to manage
+  persistent regions separately to the normal memory pool. To aid with that this
+  binding provides a standardised interface for discovering where persistent
+  memory regions exist inside the physical address space.
+
+properties:
+  compatible:
+    const: pmem-region
+
+  reg:
+    maxItems: 1
+
+  volatile:
+    description: |
+      Indicates the region is volatile (non-persistent) and the OS can skip
+      cache flushes for writes
+    type: boolean
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmem@5000 {
+        compatible = "pmem-region";
+        reg = <0x00005000 0x00001000>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..68012219f3f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13564,7 +13564,7 @@ M:	Oliver O'Halloran <oohall@gmail.com>
 L:	nvdimm@lists.linux.dev
 S:	Supported
 Q:	https://patchwork.kernel.org/project/linux-nvdimm/list/
-F:	Documentation/devicetree/bindings/pmem/pmem-region.txt
+F:	Documentation/devicetree/bindings/pmem/pmem-region.yaml
 F:	drivers/nvdimm/of_pmem.c
 
 LIBNVDIMM: NON-VOLATILE MEMORY DEVICE SUBSYSTEM
-- 
2.43.0

