Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0383619D897
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295105; cv=none; b=QtdukSqzJti+l1JGTUtlj6bogq/TROfmYppNqbrIAvx0UQZ43jZSW6ut4NjnbJg6w0ZInCwpaVhREVEVbRH014qUTfVCWJYaZJa2jA7uDjnTzYFVyr7x8raTp3UT5sjDM+x5IruduThSegoU9m92Ua8y2H6vHfhqw8jd+QtmdSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295105; c=relaxed/simple;
	bh=MryEApqacNPUDPx//9kRjyNmysSr/3bbD7GV9l6RwME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNpkwua28tW/TrV0PNF7w7AgcXa1J3tMjx5KZUKaqSlPAp8pNzB3ITk/TwRqxgnLylAWbMjdK2DsaH56MZwXR9ymDAYbP39oyqdDlax2fL4YNy0U8PSi6A+IcF/ldaMolAsoMZtD+pVyGKGkzDYgXViFHKysJiuCq/k4Xi18pok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjQ6kb80; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjQ6kb80"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235ea292956so3218965ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750295103; x=1750899903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CZO2OAKV3OtJLgmf9ZQYFE78DDsp7kzC/L9szpctPA=;
        b=CjQ6kb80iTqsB1WNU5cewjJSMRx6sOTDmNAbpi4lTKfdw3KJvMlSHyVli4GA0c2o1k
         ed79ENia1roeJ6HsT3u84ipEhLAqNcDTJMW+yGGR0G1u/VIzgpp9vMbhi+H5J58tCIHC
         2PloX15H39c7FFvCEPgk2OFXQOtUh4c04x43RA1ooffYbU9DCpCjshZqN49jAY/dsbP/
         11qgUixlePsEGHi2TbSlabsMWOIpBUgLgbXLeXJpbHN7MaJTp72JODmL1kj+oy9qzgPN
         ZMdqICdfC3MekaC/fnBoWrEdAMl4/04pLUyeioYYHyprg6mWY5xhqURRto6S2qYRMLMV
         AmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750295103; x=1750899903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CZO2OAKV3OtJLgmf9ZQYFE78DDsp7kzC/L9szpctPA=;
        b=E3jTuS7x6PrnHOsppwgFs8U3hoEY5cvmIT/UMdPK3SrSaB4E9+dj39xlkCGlkYWZZ1
         uLa9/Z+jv+2j1hEy6lydyYHmSz3qz6WXWCKkJuozfgzLwPhJhSt2rf71tCYe6pilq5pA
         rtEfMzGWV46cp6ZFSYh2hZjGAFhFpXDrxa2zzl7RfXKECmx9x8mgRXt+xGe2kLX+hVFN
         4hJiNrGdUr+FkUppTs7/iDpS5AvJ56j1RaPIlr/HnpimLJAUMq+suj+jA47ZNUw5TlGI
         ePOgKQPMyqCjBASA5CaugeQMqtkIVE0cL6WdyRud+QxSRHwp1r3gRDo76UELp6KxtmIe
         8DSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV68ZFDkjfuBR4a239kj9juyRXshHsV+7rIXg0QZQCXBBcxMVWKCzKEP3MX2JFwagyXm+3w1OnoMRzyRmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCvWrt4Aj6lzdhlmsmxtaUKKCmLCuvR6RBukH8rpr83jlyoSMj
	5sXXYkYsa6Sxgy9K7//fU8ybNnTEFaz/7LcGtJ4aN0CnLeP3JQD2B/773Ej3ag==
X-Gm-Gg: ASbGncubP9G57cHZ4uF7h2cSWQCkx0EFhrUUdhUlWir63d8h9iO2LFt8Na/BA9+F/H2
	30QKSXej8pGBKS8NBX7iXfF3U5H+7TpGZmbJb9xpKVZ1qE6S8Cs6jYBUxFyJhLU/H6LcfcbQw5M
	LK1VZcxhsfTMLLXG5PEo72DHNuCZFvIWV0wkZ/yEAUYl+1cDpyvST7EXRrewrVfWZO5vGflC1bV
	44GAqsmniy65HORcsTLhT72UvglzHGinXXNT50nxXIRaigyvfBxNWfuA5Y1MX86pMmkYpooLuCx
	6znri4ywvjPSlhzFP5k8tZDmifBvFU3Jm4oG/wgw8ktaS/gdid+AltOkVG0PId2Wwzyq8/F4Jji
	GcnZBjVoKbe2/SGFGvPmvG4Oef8SKg683
X-Google-Smtp-Source: AGHT+IF/lWU7GJLzDXdk1F2IZNf7VWmrNUNbM5q/vElUar5FDwrpd2kD0dJvfnbrgPtrERVIQruzoA==
X-Received: by 2002:a17:903:94d:b0:234:909b:3dba with SMTP id d9443c01a7336-2366b005fb0mr274698465ad.20.1750295103301;
        Wed, 18 Jun 2025 18:05:03 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea905fsm108088795ad.166.2025.06.18.18.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 18:05:02 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id CEC31ED6543; Thu, 19 Jun 2025 10:05:00 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 13/13] um: nommu: plug nommu code into build system
Date: Thu, 19 Jun 2025 10:04:17 +0900
Message-ID: <03d0cd2581d0e143a5644df5d42fc00a550fc72a.1750294482.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750294482.git.thehajime@gmail.com>
References: <cover.1750294482.git.thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nommu kernel for um build.  defconfig is also provided.

Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
Signed-off-by: Ricardo Koller <ricarkol@google.com>
---
 arch/um/Kconfig                        | 14 ++++++-
 arch/um/configs/x86_64_nommu_defconfig | 54 ++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 2 deletions(-)
 create mode 100644 arch/um/configs/x86_64_nommu_defconfig

diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index f08e8a7fac93..81a79c7a5a6f 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -31,14 +31,17 @@ config UML
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select TRACE_IRQFLAGS_SUPPORT
 	select TTY # Needed for line.c
-	select HAVE_ARCH_VMAP_STACK
+	select HAVE_ARCH_VMAP_STACK if MMU
 	select HAVE_RUST
 	select ARCH_HAS_UBSAN
 	select HAVE_ARCH_TRACEHOOK
 	select THREAD_INFO_IN_TASK
+	select UACCESS_MEMCPY if !MMU
+	select GENERIC_STRNLEN_USER if !MMU
+	select GENERIC_STRNCPY_FROM_USER if !MMU
 
 config MMU
-	bool
+	bool "MMU-based Paged Memory Management Support" if 64BIT
 	default y
 
 config UML_DMA_EMULATION
@@ -185,8 +188,15 @@ config MAGIC_SYSRQ
 	  The keys are documented in <file:Documentation/admin-guide/sysrq.rst>. Don't say Y
 	  unless you really know what this hack does.
 
+config ARCH_FORCE_MAX_ORDER
+	int "Order of maximal physically contiguous allocations" if EXPERT
+	default "10" if MMU
+	default "16" if !MMU
+
 config KERNEL_STACK_ORDER
 	int "Kernel stack size order"
+	default 3 if !MMU
+	range 3 10 if !MMU
 	default 2 if 64BIT
 	range 2 10 if 64BIT
 	default 1 if !64BIT
diff --git a/arch/um/configs/x86_64_nommu_defconfig b/arch/um/configs/x86_64_nommu_defconfig
new file mode 100644
index 000000000000..02cb87091c9f
--- /dev/null
+++ b/arch/um/configs/x86_64_nommu_defconfig
@@ -0,0 +1,54 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+# CONFIG_PID_NS is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+# CONFIG_MMU is not set
+CONFIG_HOSTFS=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_SSL=y
+CONFIG_NULL_CHAN=y
+CONFIG_PORT_CHAN=y
+CONFIG_PTY_CHAN=y
+CONFIG_TTY_CHAN=y
+CONFIG_CON_CHAN="pts"
+CONFIG_SSL_CHAN="pts"
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_IOSCHED_BFQ=m
+CONFIG_BINFMT_MISC=m
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_BLK_DEV_UBD=y
+CONFIG_BLK_DEV_LOOP=m
+CONFIG_BLK_DEV_NBD=m
+CONFIG_DUMMY=m
+CONFIG_TUN=m
+CONFIG_PPP=m
+CONFIG_SLIP=m
+CONFIG_LEGACY_PTY_COUNT=32
+CONFIG_UML_RANDOM=y
+CONFIG_EXT4_FS=y
+CONFIG_QUOTA=y
+CONFIG_AUTOFS_FS=m
+CONFIG_ISO9660_FS=m
+CONFIG_JOLIET=y
+CONFIG_NLS=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
+CONFIG_FRAME_WARN=1024
+CONFIG_IPV6=y
-- 
2.43.0

