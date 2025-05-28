Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71311E2858
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748413032; cv=fail; b=j6KBuqoxCzsJBHdDp9PJIwWkijcMb2KCWmXVED182OyzcYCMfCgL2nsr45OMegT7KT3I83SRm2VUlwz1sM/qqEJIQM9gnY3nEROid6Nt8yTaKD2FsX5hbTYNwscFNpZ45pEvdLG4/MFyiMPasEMNzN9WvZNR+ukov+Zy49qNhfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748413032; c=relaxed/simple;
	bh=MCWis4V4cMntS12cdVoBUX/N1eeYl/hMBd518yUZHo0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=KHDSz14ZqdFoVo/Ai5TyUAScZKd8BYZ98KXY7btzS4xOVgpz9wsjeicXCUdpwvQROUvokkzKF8pmRYq2WNAiOfCjYoUojpln+wK8bCCXK7JbrgmmvOp8RTG92UwnTZKb9PNb2Ci5BnSzUzQRl4w6OwHiGA2N7XfPkXIA9Cnviwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=permerror (0-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=2wbrvJXD; arc=none smtp.client-ip=209.85.215.174; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; arc=fail smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="2wbrvJXD"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23461842024so26674345ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 23:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748413029; x=1749017829;
        h=content-transfer-encoding:lines:status:mime-version
         :list-unsubscribe:list-subscribe:list-id:precedence:dkim-signature
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGq8qB8BWQm+0UxnK/sByjGjmVPXqUa9SVsBlG80qmM=;
        b=sP/KWebOWMNZFuV9wvvyQ2nhEyYZMuSrbnNK3dhBXpHfC0UdxMdHnmF3APrKpvPaCR
         6lOAMLeMOykVqo+kR2ZhOfznNAb2lgV7zjvXJzkEUEvOkmXkkZR9s98DZicIMymsde+g
         FN2SvLIsezOQxvAEn/hPUCktt8kZksuq4PIBbHtaYYZ0IMeVu5Ydx/E+3/JZx7b8aYsR
         CHqHXYTU5kQVAJiVLvXLppjLYynTmeYhh3YJjTM5xH3/JVdCN/lSCRSrMz+Bs0vHGDfu
         9gIyl1EM2oU6rZtFzC0BZsiL4/0Z786QcOyF0BtOtz+Tlpg+l3D0JWaobCkQDsrcyPGd
         ozxA==
X-Forwarded-Encrypted: i=2; AJvYcCWw83mnXBuiczXr4CFTdjfd9SEKerwwyrzJmUgMD8OaXr5tFbXHpFQ2TQoIueY/AhOCXSDkXE+YneTvsmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG8nVC3exYVd29J69Wpc3tEzCIcCunNMTH/qp4aZ8PpTE5Vx66
	JbtmZdNYcGKC5P8qlivOu6G0blVGCrJqwyJPwjQb8XQhS7p4FpFOIwdlhB77yvpwQMzwTjME9fc
	9kQm5iio=
X-Gm-Gg: ASbGncuWLwnTRRArsRKc+PWGUou421EjUMpL3/ePslXgoPt8jr6UXS6bctcfSzQW4V+
	xZaA+7m7VbPKA0trOn4LbLr9SDl3oGFNxHJnGC55hiL/pp/OhqlqKwM+dlJy/L3vr9v4QNzhd1w
	TTNrr8rT5Zo7LD/rvqtNOo1FV57BuEx24QZ9/iNwS5m3WxamkC8bFiOucqC0EylqtM8jY85web8
	pYOhyLDwxa27qj35P/PDUo7DkQr/EcNuu+Be036Yu+Td3HFqT43SvWI2XmMfCvVPYhf3JEebBRR
	tNm7UayQsIvjrfQoSJeVTvnR34gDWQ+7q4F6f1LU9/sl0rJN9SB5VxO2Xb+arTo7lJOvDe4HRu3
	U3pd3uzGPow==
X-Google-Smtp-Source: AGHT+IFzBJdsDTUHGKodotOsjn8lID1Nfc3u4PJKKlIRamyNvsoDz6+vH3RLaEonKqIClc+bFdyRvA==
X-Received: by 2002:a17:902:ea0e:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-234cc7cd572mr20347475ad.37.1748413028872;
        Tue, 27 May 2025 23:17:08 -0700 (PDT)
Received: from x1.tailc1103.ts.net (97-120-251-212.ptld.qwest.net. [97.120.251.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d2fd253esm4603935ad.16.2025.05.27.23.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 23:17:08 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
To: drew@pdp7.com,
	Oliver O'Halloran <oohall@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	nvdimm@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2] dt-bindings: pmem: Convert binding to YAML
Date: Tue, 27 May 2025 23:17:04 -0700
Message-ID: <20250520021440.24324-1-drew@pdp7.com>
X-Mailer: git-send-email 2.34.1
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174]) (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits)) (No client certificate requested) by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0D178F45 for <nvdimm@lists.linux.dev>; Tue, 20 May 2025 02:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116; t=1747707441; cv=none; b=pvu0oByWG/Q8/vzvtLA1TwXVmh6idczRFHbFiV2CQReRaclSE6MhN3VLg83+uTFC6JJ/wT++ybVAv+vnJZFEawkKwWLYOLFNKc7glGTJxSnUBBIxqqnOFAi/hRLXzj465opA044fMDHEARCY1lCN2XeTgHwviH6kFzLnuhXdfcQ=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116; t=1747707441; c=relaxed/simple; bh=0ELGpuT6X196vDWFxZcQyQLTCIT3NcPHZVI0ad0L2tU=; h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o2nDaGVxx3/TtAWdmO21qtZd5P6fY1LFI1G8TziiHBptoPCbiawLzqYYMzBJ0jaSXamcrLAvUsSh9OS8SLdXzs1fiMiiXUkoGydkR9oHmpLbsUMuU7b4YRE255yKTPEjost8m61SoIQZSO1PK33GhA/AdG9ES8BA6ZoiKnVOikA=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=2wbrvJXD; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b1ff9b276c2so3076177a12.1 for <nvdimm@lists.linux.dev>; Mon, 19 May 2025 19:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1747707437; x=1748312237; darn=lists.linux.dev; h=content-transfer-encoding:mime-version:message-id:date:subject:cc :to:from:from:to:cc:subject:date:message-id:reply-to; bh=Qgc1WWyAa4IDJXeZMlquPom4mmmQ18LfyHJ9MogW4mM=; b=2wbrvJXDrz69BG0Lfo0ABVVGfxRC/OAO1Tz+B+DjH2fjPAeiySTYhoZOjXwnZDgEck W2mqGX2L5CuVv1YR3PIvvEDTFm8wxq4G2DoJXvdbtQWWsDd8sAM0PXttKrTVZJCWBKp4 gC2r3GnGd7aG/EwzcWTp4wFPIH5iTKPRJnUXW/sqOsInT9PbT3ZjUIhjSOtt7E11YD4K VBUt7613W3mNgA/gXIFy3BcYRzenh+azTNQULkZgGBGKPGaFbuWKYREEwlwc+fsNJds2 IU82MJ4Ap9ZPY46UT9kwm7mXYu62XmYcLbvw8pZpjmioaf+doJYfYqOIQ3UtZ+gOUtBN RvYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8mVG72K/47zIu5yyAOWtKZ602UUhCnMwwMgNMzx8nLWYC+++b495NcJKwhefzle55drbRQN0=@lists.linux.dev
X-Received: by 2002:a17:903:18d:b0:220:c4e8:3b9d with SMTP id d9443c01a7336-231d4596b26mr191179295ad.37.1747707437566; Mon, 19 May 2025 19:17:17 -0700 (PDT)
Received: from x1.tailc1103.ts.net (97-120-251-212.ptld.qwest.net. [97.120.251.212]) by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebaf5esm66904945ad.194.2025.05.19.19.17.16 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256); Mon, 19 May 2025 19:17:17 -0700 (PDT)
X-Mailer: git-send-email 2.34.1
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20250528061704.8oPGHCwfZdsPra2Myo9fqrW9gSkvucYDWKUuzPDGZUA@z>

Convert the PMEM device tree binding from text to YAML. This will allow
device trees with pmem-region nodes to pass dtbs_check.

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
v2 resend:
 - actually put v2 in the Subject
 - add Conor's Acked-by
   - https://lore.kernel.org/all/20250520-refract-fling-d064e11ddbdf@spud/

v2:
 - remove the txt file to make the conversion complete
 - https://lore.kernel.org/all/20250520021440.24324-1-drew@pdp7.com/

v1:
 - https://lore.kernel.org/all/20250518035539.7961-1-drew@pdp7.com/

 .../devicetree/bindings/pmem/pmem-region.txt  | 65 -------------------
 .../devicetree/bindings/pmem/pmem-region.yaml | 49 ++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 50 insertions(+), 66 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pmem/pmem-region.txt
 create mode 100644 Documentation/devicetree/bindings/pmem/pmem-region.yaml

diff --git a/Documentation/devicetree/bindings/pmem/pmem-region.txt b/Documentation/devicetree/bindings/pmem/pmem-region.txt
deleted file mode 100644
index cd79975e85ec..000000000000
--- a/Documentation/devicetree/bindings/pmem/pmem-region.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-Device-tree bindings for persistent memory regions
------------------------------------------------------
-
-Persistent memory refers to a class of memory devices that are:
-
-	a) Usable as main system memory (i.e. cacheable), and
-	b) Retain their contents across power failure.
-
-Given b) it is best to think of persistent memory as a kind of memory mapped
-storage device. To ensure data integrity the operating system needs to manage
-persistent regions separately to the normal memory pool. To aid with that this
-binding provides a standardised interface for discovering where persistent
-memory regions exist inside the physical address space.
-
-Bindings for the region nodes:
------------------------------
-
-Required properties:
-	- compatible = "pmem-region"
-
-	- reg = <base, size>;
-		The reg property should specify an address range that is
-		translatable to a system physical address range. This address
-		range should be mappable as normal system memory would be
-		(i.e cacheable).
-
-		If the reg property contains multiple address ranges
-		each address range will be treated as though it was specified
-		in a separate device node. Having multiple address ranges in a
-		node implies no special relationship between the two ranges.
-
-Optional properties:
-	- Any relevant NUMA associativity properties for the target platform.
-
-	- volatile; This property indicates that this region is actually
-	  backed by non-persistent memory. This lets the OS know that it
-	  may skip the cache flushes required to ensure data is made
-	  persistent after a write.
-
-	  If this property is absent then the OS must assume that the region
-	  is backed by non-volatile memory.
-
-Examples:
---------------------
-
-	/*
-	 * This node specifies one 4KB region spanning from
-	 * 0x5000 to 0x5fff that is backed by non-volatile memory.
-	 */
-	pmem@5000 {
-		compatible = "pmem-region";
-		reg = <0x00005000 0x00001000>;
-	};
-
-	/*
-	 * This node specifies two 4KB regions that are backed by
-	 * volatile (normal) memory.
-	 */
-	pmem@6000 {
-		compatible = "pmem-region";
-		reg = < 0x00006000 0x00001000
-			0x00008000 0x00001000 >;
-		volatile;
-	};
-
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
2.34.1


