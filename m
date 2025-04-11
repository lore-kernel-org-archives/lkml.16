Received: from mail-oa1-f74.google.com (mail-oa1-f74.google.com [209.85.160.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD07727D779
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349929; cv=none; b=oLnKLtH5YFZUfAmGB0B7sfeEGYs1Lmfq2+HqSBu+aBVEF47DsrkYjBQKFvV7sySbWrC778YKlBAIs4yktsOvgkTaL/naz8eQXDzI5W9M+34gMboHyk4esUrINXUMjD5GKYGxn8+KajqXDxVNhdjXGcMHTHVfHl8prmV3yEJweuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349929; c=relaxed/simple;
	bh=4kHfpKk1VoSUqf1iEbD0lJaQGhASEC7+kfKMWqTLH74=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bb7HnV8jiD/fCDFbuq/bLtQ1S9xdaxbJqMAk0n/lPMGO4sjSUF/Jtf5muPqlLnc/wPdYIpiU4hEn8ZrENw2emCPQrx56jrgDErPQuyVB8SnN6EqPiCJ67qP6KJ51Z4PJzOFDTYw77e98ZZkrgpGkK7rwqvuPdKLYwruvvCTlRLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4j4sdiQs; arc=none smtp.client-ip=209.85.160.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4j4sdiQs"
Received: by mail-oa1-f74.google.com with SMTP id 586e51a60fabf-2c2bb3bed7cso480978fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744349927; x=1744954727; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J3pOG049tN04I3gAeVWk6hcyObwRwUDj/yys8nKxPg8=;
        b=4j4sdiQsjMrAVecorbSp2t6WxCS/b7mByaAlyFRwc01z7PMBOxwOxpAGuskp8GoY+e
         hNHQhwgfz4vE1D84F62+MgAxI/4kKZLvr0lgkOCFDfB51zS9L3OT4rJGV7xRD5GD2PjI
         aT80h7LLNCY2X5Dao2xqBHzFScujvs2HUfpXT97skbi0o+afwamQsDDgDgOM69DdxPRa
         l1RYZl3Mlpk+0n7bAxX++nkCyjtaGYeVQbWSO8llCiyT+mgAazMeRwyu0s3z+y005iSX
         oxtPJVutAD/UUxnf9H7iy9fXHfqnpT3CBtV4FhdnOM7I2ZC7iKOhG7pHUoz9A3xc00he
         pp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349927; x=1744954727;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J3pOG049tN04I3gAeVWk6hcyObwRwUDj/yys8nKxPg8=;
        b=B4c2wxUTYx2StGpCPMnPXUvnetB+PaRBdOLYtdXhxYUuLV4ereD+YUprecmwpL9v0u
         9Gl4TfFY+ap0dtnKOpgwz45GAd1NiJmAjxqahSV1Vw1G1bFYJfjw94YdxyYxlgHXYiVa
         lRGp7sCnauT5vL3mNIqK7ZsLqzrR3O1oVlIWhJK57vUzDGoZGscgxhjJR5aZzASIjJaz
         0R2KzMmqmWSZRf+WSSHqp4R+FvNvHg878uXOuQaPzTiIG6G3IbiX8V/xA83xaQClCj/k
         +NxVafk9x+G+hRe2rswFdXL89aFRRJ1iI8CaVV9XGdL3KlDeNr2tBPodwOyJez2Irw7o
         9V6A==
X-Gm-Message-State: AOJu0YzUo2IvfPRYGUyRykI4MVhVeCBF3Jm9qVKZUFL8qR/q+qKkp2ca
	iztT/p5dDGxSDIHuPK5E1VI/8y2J9g8UN1uQ3sMJHjiR1HgS4B66WyaV3OLHBiWQ0vYSEf8gEYU
	cef8DQd+SeApI6jl7sYvwEBA4dt0BQQATp/pKyA8krhgEq8KkJn+GBQlJ/KMGJvhGyNn8bBrDmW
	+zdUWfN5kFVVUPw5ya5D+HJbraOFlabTuSHk3bVVIhfMvb75kl4sE67MCd2ImxMA==
X-Google-Smtp-Source: AGHT+IEJNpRI4+8yaXJk8414f64tfdUZ+FcyahilW3BlIEGi90JnnJd1CB5TgY9EhsFB2ykTGHq1Hj397rCuMwxE
X-Received: from oabvp10.prod.google.com ([2002:a05:6871:a00a:b0:2c1:5f7a:eba8])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6871:4006:b0:29e:671b:6003 with SMTP id 586e51a60fabf-2d0d5f55d6emr854516fac.32.1744349926748;
 Thu, 10 Apr 2025 22:38:46 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:37:45 -0700
In-Reply-To: <20250411053745.1817356-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411053745.1817356-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250411053745.1817356-15-changyuanl@google.com>
Subject: [PATCH v6 14/14] Documentation: KHO: Add memblock bindings
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de, robh@kernel.org, 
	rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org, Changyuan Lyu <changyuanl@google.com>
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
index b3be800e5ea46..60e4093042e1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15425,6 +15425,7 @@ M:	Mike Rapoport <rppt@kernel.org>
 L:	linux-mm@kvack.org
 S:	Maintained
 F:	Documentation/core-api/boot-time-mm.rst
+F:	Documentation/core-api/kho/bindings/memblock/*
 F:	include/linux/memblock.h
 F:	mm/memblock.c
 F:	mm/mm_init.c
-- 
2.49.0.604.gff1f9ca942-goog

