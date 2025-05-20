Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEB0176ADB
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 02:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707440; cv=none; b=SzxhRvjLhvlJHL4jmfgr6mEBp/xw+1u1jcpxY9FsTfxGOOWq/2SutD4kMhLiS2OatKoH8mcCr/L44zXhiaevLek+m8n13FvHkvgP/9mkODfKVoQetfhgevtGX77p3B5Uw6j0zpzcoatoIiy/uRqie+yPIm+oWJWyAF9XzyLiTl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707440; c=relaxed/simple;
	bh=0ELGpuT6X196vDWFxZcQyQLTCIT3NcPHZVI0ad0L2tU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gIPalb5KWTvC7nJY2lFau72vpGpG3CYBkM6wb67gs5hy5ygzdWPpm8hJmcoPnCiJJWLQGjZjvf/puC1/smYoz0m9V5Mw5yxzZAbQ3bcTh1r/FhQlCGpVmlAp8LeRkpcKzLPKYYhAQI+su0ttwiV4sghAy/p38qqGjrq9lTAbKO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=blEKiG6S; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="blEKiG6S"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b27015122c4so1600830a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1747707437; x=1748312237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qgc1WWyAa4IDJXeZMlquPom4mmmQ18LfyHJ9MogW4mM=;
        b=blEKiG6SpqCLBtjghxT5NAgvhZhieKpNdlgX5smT8ZbUcTaROo8ghLIw5txeIQLPpV
         pjGtgGpPmRCQsNq1+Aw5sdontUtUswGqkOP/rC5aoGanD08hD9SlBhoRJlsWQZXiWVFm
         qitIw0GVUpNGsy51d/z/LiKr+VwbZoUhZhBvnEMoweVwDhGnu6qcrXcFMo5LTrBtCo8m
         fdu9tVsa32QOuwo0in4i6BXWsn31lvrzrV7sTzs7Ej1XplqCzK1lRTEglX4pE94r2gR/
         jES+e4EIq2XQKEDV+C+A8Y3/RC7PQGc25zJi3+nmIcfZbAguYCwJFixX/+TR4vLGq/ys
         GjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747707437; x=1748312237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qgc1WWyAa4IDJXeZMlquPom4mmmQ18LfyHJ9MogW4mM=;
        b=KNKmeiQeFs4hAP+Qy6Fkz1aIvL1J8EamQsobs+BHd6VLs2hQ3sGoxZhUv/ARpoxqOq
         I9SqUecXIDwXCX1Yd5tWa7DDfYPwAe23NLWjt0ohH/hIRpKB8Kwp5h60ywOfqxxGf2Lp
         /Rqg7wFD4VKzp8gq2udFM1JfNOOkZtNO9nN9HIkz93oR8m79RdnHsxAi2A8hmbzWtfSn
         VSzpYrjW6WYplO3Dt+pjTO1ZN0xjcel8GHfUb2cS7C/hsqaLESBHKnHAXm0w4u/aXnEA
         pjP0Kn8GP18PmFPqcocYP+SnUFT7eAF0+Qhxwj23cZXXY6BtV80RadywMFEeDVacFFXo
         du4w==
X-Forwarded-Encrypted: i=1; AJvYcCVUdE5QTEWH+DFbH9/IEljyagt7gjoKSAS1bK4Vzz8fgAURaXxRNqKU62tcpwE+PqPgBAE7xsPCaPzqkFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0VxC7D9pPBbTXs7zFlOGOVCr/RB+28/1bxe38TDZ+ibh3xcPq
	aFn0746cSNNRTW2PLxU/Z73cmt6uctLSYRO1gOHH6k0E5UBOeVaEF0JK6xsvL/RAzQI=
X-Gm-Gg: ASbGncuQas7bm+Mu9hdu8+DoLUB5R6Uqm0kcBnTVaRxNSJlIyQfopSd359Zhsj03V14
	qQqptPUQIEHHxhctw+JbnKlHMpY88GUGsV/oj28wEn7BdeiA9wOoLw15/XFzQwFI8hP1K3lf5SG
	etByvwl63jCAYpcPi9m24iPWXJshw32MM4TRtsYvCA2fT9EesQID+CK5wGfoSsJ9l/n13rGEZor
	0mEdGUPHqpPf7beD3GkxWxFF0kZOSxzu/jZW2B/xvxF3jtadfyNSkrFuuQyBvBXF/VuKYnsDRrj
	2F8s6RWmK2Oz4DmXFOgZ9q0fLVZyusQMk84L0tg7ZjA4Z7QiBoRKYV5q0ptBrZ0nftlHkVgus5Y
	FB5urk1FWhw==
X-Google-Smtp-Source: AGHT+IGIdIH2mqsPlYNb8bZRO78i8ULrukpluljyciVMskkMfers0XHXo5DCyjiVjVUdhAJ/Ropdmw==
X-Received: by 2002:a17:903:18d:b0:220:c4e8:3b9d with SMTP id d9443c01a7336-231d4596b26mr191179295ad.37.1747707437566;
        Mon, 19 May 2025 19:17:17 -0700 (PDT)
Received: from x1.tailc1103.ts.net (97-120-251-212.ptld.qwest.net. [97.120.251.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebaf5esm66904945ad.194.2025.05.19.19.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 19:17:17 -0700 (PDT)
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
Date: Mon, 19 May 2025 19:14:40 -0700
Message-Id: <20250520021440.24324-1-drew@pdp7.com>
X-Mailer: git-send-email 2.34.1
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
v2: remove the txt file to make the conversion complete

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

