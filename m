Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B307130205A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893542; cv=none; b=o/INuhcLi+xMmEstLAD2QWIumjL2A6AsMw9nKRC482yaTX4OiloPz96GphoS9hbs9VsgGxyKvpU5oiE/g6YRUntLY7sek6H/NPMYDbN8aGZ5eWQousnW3SFJ6X90pjLdLdqFpWSP9elNFpiZM+8vK5SlB2Skm73jq7/mFRHCorM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893542; c=relaxed/simple;
	bh=BXlvF5+wG9a49YHeDegji45HdU5XmiXcQcZPm60p+6w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SdKtnKIi0+aY3AW/YQCR7LO3o1PVX6SpBdlsBcP9L+1sTmI1NCXwq40tRtD/6vxBLB+WD7f+2UXzHDgivl3npqq+0G7DJAQes1TLO8L5EeIULPfq3GvxT5WJq3XRWTmZLK621YmuTbbKmS7iLu8yA4o95m9/fmkuEQdQ2Zbnls0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=LMZcWpmE; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="LMZcWpmE"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e8273504c67so357624276.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750893539; x=1751498339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CZq9og4E2iYswOQvh/BeoWWVk3VTVb3cQyp5vwN8F0=;
        b=LMZcWpmEd+mGHvMWRndtZ5bjTxLeaTg+SwAC5/GblcAP/iiibpiP6S6I8YiG2SpbaZ
         A4t8VzmuO2EgyI9n4BAz3r5fni9q3DSnU6hJAyKklvwHE8/MSNTN76L/6Gv8wlICu7QO
         0a+oigJW/gBxKuhle3RdC2Iv1SE+i4V5VrjS7Bci82A37dvS9Wv3WWKIAby02x1GGEUM
         KBL1WZSz9Jtlg1QQK3OJpcKRxenmToTfOzagbnUFP5EEygvbmQfW1yKliL2vv2PoJeT/
         TobkeYLBk1gVr1EXb6gkfIxAdS+ym5NdFkzbV2klVCHPFpcL0axqY/gllCatFySSXn++
         UlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750893539; x=1751498339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CZq9og4E2iYswOQvh/BeoWWVk3VTVb3cQyp5vwN8F0=;
        b=kExIEFYz62Dp3hSeQv553rbE2nBT6ZJP6cfvm3ujg0VpFXfoPcxTgDjFpG8VUm+WoL
         H+VChlB4AO0lrxCMxkip7FYQ4jAweSP3FRF+Y2MBjn3JM8Z+AmFoOGNcZt2l8g8g8uL1
         OlXJ665AdvXiAE8nySYVpRoTD6cq3HU2LRkNmMEcp89885svdlgMY5to8HEN0ir40rx2
         9AqE5VWJ7uRmvdogiMMXZDMsWPdOZCD6/I+wsuWs9bkGGeUUG+6o6f9tmk5Mwbw96z0D
         pA6i7ikOAkwwFmYutbdmvoT6a8fSFeH/awrXjsqxhMcsZGa46bqo6hF5TxVTPvE5mJ5C
         jtAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOQ5kJ2xOqZIFCUTfRIUOxb2c4WCZqtutqE/N+DTbh7gd89mtugRveqFY8pLsw5ZGGpLN/BCrWHphG6w0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj2BV50OqIWs7ZvOWVxz+dS7sD/XGxyaXtXAli5jKDTmt0yFJI
	LNsSOss0sLKCVpD8aUNiRoIwR1I9pdsRGvJyfmFO5iiREQ1wFxrH3WD6w+aLTaNwvGQ=
X-Gm-Gg: ASbGncuzC0JK+mq5dDNAZktS/ig8gumJ9dBKhuA3BoEG/iW19XvVmfrZaldsOkPIOtP
	PwdhLplf68jIuUSQrxQ/pglVZ6zEcTDoBzj+qBTMVx7zrf0xu4f0wcdoHPfEGKCKUXC5ikYqcsO
	nycpnpbOQsEHmRKnrkWT2CtOss6GF0N2wfqfkpdFa5yjc0En6TUXIx4iFnLfyo0XoP9FC2j9It4
	9BsQv8NBreHJMUB7cVWZgxgota1IBl8NPx0N4cHtPPaVbG29lMVhOIJXbFLUuNowyiOkw2tx7P0
	Wi2WuEnHXFV9T8wcOmk0sjW89FqUROCojfX4X8ndkNb08NojJW1TaPvh15Row/hfb5k6MKG7324
	0XfiTxvQt+5KyCNzi/YOKlCs07eYDNmZESZrM5iGbxsCMfI2sVYbJ
X-Google-Smtp-Source: AGHT+IEvjiL52mwTnep5Cm1LT/Mafe7xzjNymqDf9OgtY/gdqSxumZYzT41sOZggnwLsDEbcl9BxxQ==
X-Received: by 2002:a05:6902:2808:b0:e82:1a1e:8b04 with SMTP id 3f1490d57ef6-e86019486d4mr6292329276.33.1750893538669;
        Wed, 25 Jun 2025 16:18:58 -0700 (PDT)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac5c538sm3942684276.33.2025.06.25.16.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:18:58 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v1 09/32] liveupdate: kho: move to kernel/liveupdate
Date: Wed, 25 Jun 2025 23:17:56 +0000
Message-ID: <20250625231838.1897085-10-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
References: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move KHO to kernel/liveupdate/ in preparation of placing all Live Update
core kernel related files to the same place.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/core-api/kho/concepts.rst       |  2 +-
 MAINTAINERS                                   |  2 +-
 init/Kconfig                                  |  2 ++
 kernel/Kconfig.kexec                          | 25 ----------------
 kernel/Makefile                               |  3 +-
 kernel/liveupdate/Kconfig                     | 30 +++++++++++++++++++
 kernel/liveupdate/Makefile                    |  7 +++++
 kernel/{ => liveupdate}/kexec_handover.c      |  6 ++--
 .../{ => liveupdate}/kexec_handover_debug.c   |  0
 .../kexec_handover_internal.h                 |  0
 10 files changed, 45 insertions(+), 32 deletions(-)
 create mode 100644 kernel/liveupdate/Kconfig
 create mode 100644 kernel/liveupdate/Makefile
 rename kernel/{ => liveupdate}/kexec_handover.c (99%)
 rename kernel/{ => liveupdate}/kexec_handover_debug.c (100%)
 rename kernel/{ => liveupdate}/kexec_handover_internal.h (100%)

diff --git a/Documentation/core-api/kho/concepts.rst b/Documentation/core-api/kho/concepts.rst
index 36d5c05cfb30..d626d1dbd678 100644
--- a/Documentation/core-api/kho/concepts.rst
+++ b/Documentation/core-api/kho/concepts.rst
@@ -70,5 +70,5 @@ in the FDT. That state is called the KHO finalization phase.
 
 Public API
 ==========
-.. kernel-doc:: kernel/kexec_handover.c
+.. kernel-doc:: kernel/liveupdate/kexec_handover.c
    :export:
diff --git a/MAINTAINERS b/MAINTAINERS
index 8ef6df1c4611..fd097e53fff2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13353,7 +13353,7 @@ S:	Maintained
 F:	Documentation/admin-guide/mm/kho.rst
 F:	Documentation/core-api/kho/*
 F:	include/linux/kexec_handover.h
-F:	kernel/kexec_handover*
+F:	kernel/liveupdate/kexec_handover*
 
 KEYS-ENCRYPTED
 M:	Mimi Zohar <zohar@linux.ibm.com>
diff --git a/init/Kconfig b/init/Kconfig
index af4c2f085455..a144d1111be5 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2079,6 +2079,8 @@ config TRACEPOINTS
 
 source "kernel/Kconfig.kexec"
 
+source "kernel/liveupdate/Kconfig"
+
 endmenu		# General setup
 
 source "arch/Kconfig"
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 2b18a06bc5b2..ceadf4a66496 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -94,31 +94,6 @@ config KEXEC_JUMP
 	  Jump between original kernel and kexeced kernel and invoke
 	  code in physical address mode via KEXEC
 
-config KEXEC_HANDOVER
-	bool "kexec handover"
-	depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXEC_FILE
-	depends on !DEFERRED_STRUCT_PAGE_INIT
-	select MEMBLOCK_KHO_SCRATCH
-	select KEXEC_FILE
-	select DEBUG_FS
-	select LIBFDT
-	select CMA
-	help
-	  Allow kexec to hand over state across kernels by generating and
-	  passing additional metadata to the target kernel. This is useful
-	  to keep data or state alive across the kexec. For this to work,
-	  both source and target kernels need to have this option enabled.
-
-config KEXEC_HANDOVER_DEBUG
-	bool "kexec handover debug interface"
-	depends on KEXEC_HANDOVER
-	depends on DEBUG_FS
-	help
-	  Allow to control kexec handover device tree via debugfs
-	  interface, i.e. finalize the state or aborting the finalization.
-	  Also, enables inspecting the KHO fdt trees with the debugfs binary
-	  blobs.
-
 config CRASH_DUMP
 	bool "kernel crash dumps"
 	default ARCH_DEFAULT_CRASH_DUMP
diff --git a/kernel/Makefile b/kernel/Makefile
index e4b4afa86a70..632f692512d7 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -53,6 +53,7 @@ obj-y += printk/
 obj-y += irq/
 obj-y += rcu/
 obj-y += livepatch/
+obj-y += liveupdate/
 obj-y += dma/
 obj-y += entry/
 obj-$(CONFIG_MODULES) += module/
@@ -81,8 +82,6 @@ obj-$(CONFIG_CRASH_DM_CRYPT) += crash_dump_dm_crypt.o
 obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC_FILE) += kexec_file.o
 obj-$(CONFIG_KEXEC_ELF) += kexec_elf.o
-obj-$(CONFIG_KEXEC_HANDOVER) += kexec_handover.o
-obj-$(CONFIG_KEXEC_HANDOVER_DEBUG) += kexec_handover_debug.o
 obj-$(CONFIG_BACKTRACE_SELF_TEST) += backtracetest.o
 obj-$(CONFIG_COMPAT) += compat.o
 obj-$(CONFIG_CGROUPS) += cgroup/
diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
new file mode 100644
index 000000000000..eebe564b385d
--- /dev/null
+++ b/kernel/liveupdate/Kconfig
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menu "Live Update"
+
+config KEXEC_HANDOVER
+	bool "kexec handover"
+	depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXEC_FILE
+	depends on !DEFERRED_STRUCT_PAGE_INIT
+	select MEMBLOCK_KHO_SCRATCH
+	select KEXEC_FILE
+	select DEBUG_FS
+	select LIBFDT
+	select CMA
+	help
+	  Allow kexec to hand over state across kernels by generating and
+	  passing additional metadata to the target kernel. This is useful
+	  to keep data or state alive across the kexec. For this to work,
+	  both source and target kernels need to have this option enabled.
+
+config KEXEC_HANDOVER_DEBUG
+	bool "kexec handover debug interface"
+	depends on KEXEC_HANDOVER
+	depends on DEBUG_FS
+	help
+	  Allow to control kexec handover device tree via debugfs
+	  interface, i.e. finalize the state or aborting the finalization.
+	  Also, enables inspecting the KHO fdt trees with the debugfs binary
+	  blobs.
+
+endmenu
diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
new file mode 100644
index 000000000000..72cf7a8e6739
--- /dev/null
+++ b/kernel/liveupdate/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the linux kernel.
+#
+
+obj-$(CONFIG_KEXEC_HANDOVER)		+= kexec_handover.o
+obj-$(CONFIG_KEXEC_HANDOVER_DEBUG)	+= kexec_handover_debug.o
diff --git a/kernel/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
similarity index 99%
rename from kernel/kexec_handover.c
rename to kernel/liveupdate/kexec_handover.c
index 7ec9b0826a6e..d7eb0f055477 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -23,8 +23,8 @@
  * KHO is tightly coupled with mm init and needs access to some of mm
  * internal APIs.
  */
-#include "../mm/internal.h"
-#include "kexec_internal.h"
+#include "../../mm/internal.h"
+#include "../kexec_internal.h"
 #include "kexec_handover_internal.h"
 
 #define KHO_FDT_COMPATIBLE "kho-v1"
@@ -825,7 +825,7 @@ static int __kho_finalize(void)
 	err |= fdt_finish_reservemap(root);
 	err |= fdt_begin_node(root, "");
 	err |= fdt_property_string(root, "compatible", KHO_FDT_COMPATIBLE);
-	/**
+	/*
 	 * Reserve the preserved-memory-map property in the root FDT, so
 	 * that all property definitions will precede subnodes created by
 	 * KHO callers.
diff --git a/kernel/kexec_handover_debug.c b/kernel/liveupdate/kexec_handover_debug.c
similarity index 100%
rename from kernel/kexec_handover_debug.c
rename to kernel/liveupdate/kexec_handover_debug.c
diff --git a/kernel/kexec_handover_internal.h b/kernel/liveupdate/kexec_handover_internal.h
similarity index 100%
rename from kernel/kexec_handover_internal.h
rename to kernel/liveupdate/kexec_handover_internal.h
-- 
2.50.0.727.gbf7dc18ff4-goog

