Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0D2278E62
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776849; cv=none; b=l0MONoValDlizG0uoDEppz4xb3Kzet9kGJ/SGnROGNfewR5rXks7s00D2Av/65XZ9X6WjEluk2Huaq8N7WcAdke7rzjDs38Ntzsiu7g7HtLGfA6PcjB2JoyKPe9/PG8GWpNZ6L0N92+jX9njwG9MUBic3R2dUGaN2LvIPVkLU9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776849; c=relaxed/simple;
	bh=Mdc/oXeJi1I+adR9Ftm7JPGX/onfKA6xKKXhoBhE8sI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A+txYql+2nDI73gh2Nug0zEsl/hzhrpluUOzsBKHtyK51BmLAubkDVO0SrCHGbAtzptCAHdmlrjMVkx5I9gSU9qkRhpx9cqUxugvthm2qaHRoL4KuUhheneMNG0sbq4iX/6MOBBMvRDwqqqwwBtS22pKcQVldSdh4pn9vpPOb+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SxmgBHDe; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SxmgBHDe"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22fd4e7ea48so3484815ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 00:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776847; x=1747381647; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cA0yISDxPF9g5T2ZPfjTueF/jIC5Kq4+wTcKq9ODUXQ=;
        b=SxmgBHDezhnAI25CIu8rxzvanWWsmpFdP4fusF+rEIOJ6lEa2BaBEINsoyX8bFOO/v
         sB3L/9vSJ+sTHL7mWPqf9VNT6VeJYnPmFCraLlbqzBw2jppTid14tM8LtwiP+HbpNRZ/
         Cahe6FrcIfCB41UcYCpniox+HB8Giw4ERNlwHFShthpwZBRecvh1r+ntibYabSicrMUO
         VTwQrXV64/Uw0LV2kgnjwJJ67vH7+zFi+d82frgOtFssAZhFLzpZdAoOPcMXc1YYGmtj
         CiMRpA13Gq8WsEOo+RZY6Z/aoVR12CV9Vn2fY3wf2MR7/hsSSciIUcNdp5SS2JzqLYoI
         Onjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776847; x=1747381647;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cA0yISDxPF9g5T2ZPfjTueF/jIC5Kq4+wTcKq9ODUXQ=;
        b=B+8vP2zs4j/YwoCRlE245BwxU4P03ibyqtBit56C7hXcARHlg/O8u/xRv1VZZd8uYz
         g9+I//vFxUcGqdibmhkUOlY0ivbknXYF9LYtOkA+4EEGTFEZ7WB+Vj2c/cr/RjPr2frU
         vC7c6tYyQS/eZh0heJ8CIQ+0At5Fr0VCu7DxRQCjs6/YWntieXgilcG1jSwRV24Lxbh5
         6mUHahrGP9SUssz5w7eBpePbbQxJ+CrO2CzJOAQLBM9mCzM7PQRsupR0l3v7eWGoc5Rd
         QKfk1ilW1/fmNNJ7IO0BLZCxciMNu/6m/GcvlkucBGqX8Tl4zRcY2/YtjU8Vu0ejfMAp
         9Rpw==
X-Forwarded-Encrypted: i=1; AJvYcCXxvHaXt+0a9US4qQZokz0m7tFm9t55839q+Kbjq5TBTxYVIwHRfbaFkKwLYdFACjHIWeUdI5NnbMF3i4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxahG9BbZj8CQ8ygM6mSEFDEDAMyyb7OPaX/PdZieQK1hRq7hLz
	T0IFKHyY3HffR6XqOieAepmoPNgnsyY3CeGJDR53gie3MjzuuK0osPWHeP0Kfwd5IZWHgHBsbO2
	FoIJQRTgURtFe55QwVg==
X-Google-Smtp-Source: AGHT+IFlDUYjFmNLjZAtgvspY6ix2dHys/RJQDHcQLdAfrz+DupB+ruuhonXRKp9ueOFjqDPInrpTwbWkYVKg2ph
X-Received: from plle3.prod.google.com ([2002:a17:903:1663:b0:223:3b74:1b21])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f68f:b0:223:66a1:4503 with SMTP id d9443c01a7336-22fc8b73d0emr28784975ad.30.1746776847032;
 Fri, 09 May 2025 00:47:27 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:35 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-18-changyuanl@google.com>
Subject: [PATCH v8 17/17] Documentation: KHO: Add memblock bindings
From: Changyuan Lyu <changyuanl@google.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

We introduced KHO into Linux: A framework that allows Linux to pass
metadata and memory across kexec from Linux to Linux. KHO reuses fdt
as file format and shares a lot of the same properties of firmware-to-
Linux boot formats: It needs a stable, documented ABI that allows for
forward and backward compatibility as well as versioning.

As first user of KHO, we introduced memblock which can now preserve
memory ranges reserved with reserve_mem command line options contents
across kexec, so you can use the post-kexec kernel to read traces from
the pre-kexec kernel.

This patch adds memblock schemas similar to "device" device tree ones to
a new kho bindings directory. This allows us to force contributors to
document the data that moves across KHO kexecs and catch breaking change
during review.

Co-developed-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 .../kho/bindings/memblock/memblock.yaml       | 39 ++++++++++++++++++
 .../kho/bindings/memblock/reserve-mem.yaml    | 40 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 80 insertions(+)
 create mode 100644 Documentation/core-api/kho/bindings/memblock/memblock.yaml
 create mode 100644 Documentation/core-api/kho/bindings/memblock/reserve-mem.yaml

diff --git a/Documentation/core-api/kho/bindings/memblock/memblock.yaml b/Documentation/core-api/kho/bindings/memblock/memblock.yaml
new file mode 100644
index 0000000000000..d388c28eb91d1
--- /dev/null
+++ b/Documentation/core-api/kho/bindings/memblock/memblock.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+title: Memblock reserved memory
+
+maintainers:
+  - Mike Rapoport <rppt@kernel.org>
+
+description: |
+  Memblock can serialize its current memory reservations created with
+  reserve_mem command line option across kexec through KHO.
+  The post-KHO kernel can then consume these reservations and they are
+  guaranteed to have the same physical address.
+
+properties:
+  compatible:
+    enum:
+      - reserve-mem-v1
+
+patternProperties:
+  "$[0-9a-f_]+^":
+    $ref: reserve-mem.yaml#
+    description: reserved memory regions
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    memblock {
+      compatible = "memblock-v1";
+      n1 {
+        compatible = "reserve-mem-v1";
+        start = <0xc06b 0x4000000>;
+        size = <0x04 0x00>;
+      };
+    };
diff --git a/Documentation/core-api/kho/bindings/memblock/reserve-mem.yaml b/Documentation/core-api/kho/bindings/memblock/reserve-mem.yaml
new file mode 100644
index 0000000000000..10282d3d1bcdc
--- /dev/null
+++ b/Documentation/core-api/kho/bindings/memblock/reserve-mem.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+title: Memblock reserved memory regions
+
+maintainers:
+  - Mike Rapoport <rppt@kernel.org>
+
+description: |
+  Memblock can serialize its current memory reservations created with
+  reserve_mem command line option across kexec through KHO.
+  This object describes each such region.
+
+properties:
+  compatible:
+    enum:
+      - reserve-mem-v1
+
+  start:
+    description: |
+      physical address (u64) of the reserved memory region.
+
+  size:
+    description: |
+      size (u64) of the reserved memory region.
+
+required:
+  - compatible
+  - start
+  - size
+
+additionalProperties: false
+
+examples:
+  - |
+    n1 {
+      compatible = "reserve-mem-v1";
+      start = <0xc06b 0x4000000>;
+      size = <0x04 0x00>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 72345ca65edda..d7bd49dae2e0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15447,6 +15447,7 @@ M:	Mike Rapoport <rppt@kernel.org>
 L:	linux-mm@kvack.org
 S:	Maintained
 F:	Documentation/core-api/boot-time-mm.rst
+F:	Documentation/core-api/kho/bindings/memblock/*
 F:	include/linux/memblock.h
 F:	mm/memblock.c
 F:	mm/mm_init.c
-- 
2.49.0.1015.ga840276032-goog

