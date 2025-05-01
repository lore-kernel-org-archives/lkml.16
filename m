Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A1E27E1C9
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140147; cv=none; b=QLupbK+dqfsUL1enDVTB9fFWavPWbPPGL55bBD0kDJyvWzxbrD0XvVFPbwNlxEGwPT+F7AHjNP3GyVJQkLb94suPSu9PY+hAzE8MO6tPH/XXLFHZjSjzAwV34r95nt7JAzqnbv35BALwtOx2mJo9riCavWrY9nGzBvLgUjzsUXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140147; c=relaxed/simple;
	bh=m+nwY4X/QYgxlK5z5uhVGT+hoDTY+WviKN2Y+UDLviI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BihMkqVRBkPIvIVZ8Z6lMI2Kw5NDwFAsv/0DcpBpXUljUh9o/XZ8BVuwufRXv7mFm+m+DkG6fe45sdI7do692mtZU4bNf8SDDNRMoi/kpw3VEn/G/fKfjBYFmCMeHt3W6ugBC14oTLla6K/JebT58bCIn3+wzFcl5NGYHEsYwyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hr/5nExg; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hr/5nExg"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2265a09dbfcso18716375ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 15:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140145; x=1746744945; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sv7OPZtLL9NTgdhcB8PcItisGgab/W7eSOheRILRTr4=;
        b=hr/5nExgUYy9/Gd4W+7wlWbekWMGkLYZG+R9CP+NNw/mQR+wh9re5SrtYYBGnn/qml
         0eDMYvcSgKy3ZDpndQGxM1RA6ha3FixoCVY2UIVrliPNIel8QskLTyjhrFJ/KoJnTJFE
         mS4aK3DdKPm/3KhrDuMDVCeiBbEy5BHIdG/r05Kaj0PNJAI/eD8wsTR8KN+cRGZCANqz
         NG4Kp/B/S9UR9Jn339+Ae8DbsiiobI54thkCWsuRa9xUXBW+m680yGiY2YNpXind+63+
         +bpyfnwKxelwV9GubWpremKg4D9s22uVhsr5RfygApzYqvQZyBSuvDN9/aVZBVRllywv
         A19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140145; x=1746744945;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sv7OPZtLL9NTgdhcB8PcItisGgab/W7eSOheRILRTr4=;
        b=k7dYPD3hqdJivIbk5Ena9bvuX8yI+7hEvB+Obg66LyUNBrmT9XsCq0ei2cYF7YNatr
         WkbDcrp2BCYzZJ2vcEj7N1h4oLiiH+v6Qb5ayy5CrEwRc8vajl4+8bNknN/UkMYUTyoc
         5WbcikHzVVr9OqdUJtaCC4rP0/FnJ3Doesbpt8yNB9nInIc0LEHg/JOUGllmxZX3h2oo
         gBc7PwIJTjS0tjyCWZMRTB0GTXihf/6C2O27TATZvFYHKba/Fr8xMrTMdORy5HhDpbC3
         oorIsq6FbURxvlHFgBEDIze5oGeQiyBcRv7UHFtmt5mHiCPgsJ/KSerJDfLdy/KwRNqq
         Q7OA==
X-Gm-Message-State: AOJu0Yyzp3+aNto7wAmfFim//HwYs7BLc5YAQ9WTt/O1qPWWlYj5m4F8
	S0g3FPN6FdDi6Kc1vg73qrtb5Nx8dD5JZfUjpULjTNspGtEP2vV8ekyFFwFxOfG0GDOsSK87liE
	Sjt12ehOkDLLGbJQEhPkecKp9YQcWLsS1M3KkVeBakyw+LZnCk3H5uABfZQpt8GFEsKduVHYjJK
	8KqaHweYXj7acUmRjvS2oL9lLmVK5nfTyDnwIdQYikacgqkGLnlFlgw9Pf2Eb3gA==
X-Google-Smtp-Source: AGHT+IGvDB0b6tRaZywAygUkvHb3ftmY9cjA/TeIVahFtlLUDS3mCQQhHTIj7eCYcPhn8l6gQq61MczG+HsWtj9H
X-Received: from pjd15.prod.google.com ([2002:a17:90b:54cf:b0:301:2a0f:b03d])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:c94a:b0:22c:33b2:e430 with SMTP id d9443c01a7336-22e102b68ffmr9458715ad.6.1746140144950;
 Thu, 01 May 2025 15:55:44 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:25 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-19-changyuanl@google.com>
Subject: [PATCH v7 18/18] Documentation: KHO: Add memblock bindings
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: changyuanl@google.com, akpm@linux-foundation.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
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
2.49.0.906.g1f30a19c02-goog

