Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5974B1E833F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745987289; cv=none; b=V/GyrXMPREQD4fiAPoLUHVZCQ71PclLuHCvHoouv7GfLfVmwJWAeVLjM1rUJn4gJkfU5dLZ/lt3uzY3TI7e5G9GT22LUMWZZZpYplHyWq5a1yrUHmS6pCtWUmBygtxKrFob6DddhY2e6IzfejC2IdHIe0unYcef83gHlymtoQ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745987289; c=relaxed/simple;
	bh=TFsHqaEhkzm+GjAye4kPSKIxJy2XQj4yPdb8QFBTIBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KcoCYqvvBRXF9HTQXrumpL6VpiScoSmAvZZWKiSI3HmdS4a07SBjQ770x3sQS1UBpPrRQxJ7sSJNWadcv69BLbi8jf7XPQE9Ckhgpuxabv4WOlAEVl2osFS5TqHjpMyZKjZiOzDpJBKeemB+5DjisJID5CrMvTYiAPVCVNOodUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFktP8UC; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFktP8UC"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-301cda78d48so8421284a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745987287; x=1746592087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rT31LZBxKQU6eu4tlFml+AuOML692n2PMZhnY9YLrtA=;
        b=aFktP8UCBIqmAH21iyCI8IRCqivbcAqxKJO+r3i7S4Du6LnejmzMH4AIdUI5aBFmBX
         pZ9D5FtSskf9KMRhGDgSi310UYxgCiqz62l5Y4Ad3unSih3YZEkjpz8lV2GSjPighQH0
         LG6781dDIOUo984qsOhumiahg66KDBNGq/kv5Or1xuuZlxhrtLqRARwYlei3DQYVkb8t
         LkjDoMFE3/YXS4gbloecjaL2wQVDaeh54v+ODb0Ldu9Zxjr0bqe1vC0DXrzVMfAGZE5M
         JSMm0Lk55AlINbwQ4esvOXDivDmZHoG/wuCQgvvhSkz8ele7JayNCC//am8Mm+BCdype
         oYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745987287; x=1746592087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rT31LZBxKQU6eu4tlFml+AuOML692n2PMZhnY9YLrtA=;
        b=JMrDg6dYaVSDVBRuQ+fipX8/9i1tsqt6FHcT+NNQ7Dw4ltB4kPjOcf06HLLFR4L7rg
         zz2cjmuxV045TWHM4KVaqQm/c3kP0bLAjXe4gEEbn6rWQXHtPArYNvEoz5MCMnFakubn
         YmG5m/vA6EXxzmmJJyyI5IqouMKXMfonloHiN6EGIQWerNyd7I3+e0reDX7mP/zsKzlY
         85BIZLH2gvJYaFwXWxCl8xVkmwHdgBstVVZhw3ix1HJcy55ABn/kMSgODTNq/p9SBy6e
         MTosT/C8OBxRC6lgcTVHVkm2Bvqoh2l6HcJxrcWFTvxGNEQSgwr9CBq97GhBOPSITN5a
         U6kA==
X-Forwarded-Encrypted: i=1; AJvYcCVfNICAY9Wr0ke++Ze9yoiEn2rMd8cZFI2NhexuqnN7Re4RI6Atc6j+pZNu5L7AgFvLMYeGbVCoSWVxD3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+JKDsbJ7YHm+VnqKR1givQcmCSI/QS+AifcpOqmCEEU1F5+lg
	ytzjt72pcLCeHEoz9HQalsEhR2OJDwaEAFiPwcNvnEQ2Psajgm7q
X-Gm-Gg: ASbGnctnFKDPubmc438C38ilJ3Eh6DzFe6p/HcJDQj2NmmRb2/rwoWjhD/PRYZjeq3P
	qVcjK7dyCHTVXIRwDZB69VdKzoOyMgMRcDuJOK31akoVp+YFDABI+seVU1GUITMd2+5FsfMCwcP
	IaisdCveD5re2L2pGM3rwkqABbTEeGE3n0VRkI/JVf9TphsiE3AIs86MtYSuFGfdnK7uYph709A
	kANtfrbAQhd7Qd37bncuXtcowNpibGNX57XrnFAHVVCNiU8E+lQSrLjRRbqWyMyef26OOmAcKXx
	MdMv+eX0DauRXqdBzsrI0qFdkvP4SA6F9y5r1nuAX/MLSllg11EobyOYvv1CFeyT7X+p4TusmX1
	UJSjl7A6Vv8k=
X-Google-Smtp-Source: AGHT+IHs8ctUZrSNL4gP9gYydAnVaHBNQJH8vTsp9SOtrT3bTdbngoqV9WtXcIXTZkQTZdyv3JUqTQ==
X-Received: by 2002:a17:90b:1f8e:b0:2f4:432d:250d with SMTP id 98e67ed59e1d1-30a33302091mr2229467a91.21.1745987287552;
        Tue, 29 Apr 2025 21:28:07 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a1113csm493273a91.22.2025.04.29.21.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 21:28:06 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id EFAB9E9482A; Wed, 30 Apr 2025 13:28:04 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 12/12] um: nommu: plug nommu code into build system
Date: Wed, 30 Apr 2025 13:27:18 +0900
Message-ID: <5a59722b1cab960187461701df76d6f4d3f1249f.1745980082.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745980082.git.thehajime@gmail.com>
References: <cover.1745980082.git.thehajime@gmail.com>
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
 arch/um/Kconfig                        | 14 +++++-
 arch/um/configs/x86_64_nommu_defconfig | 64 ++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100644 arch/um/configs/x86_64_nommu_defconfig

diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index 79509c7f39de..84b2ee7129ae 100644
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
@@ -191,8 +194,15 @@ config MAGIC_SYSRQ
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
index 000000000000..c2e0fb546987
--- /dev/null
+++ b/arch/um/configs/x86_64_nommu_defconfig
@@ -0,0 +1,64 @@
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
+CONFIG_UML_SOUND=m
+CONFIG_UML_NET=y
+CONFIG_UML_NET_ETHERTAP=y
+CONFIG_UML_NET_TUNTAP=y
+CONFIG_UML_NET_SLIP=y
+CONFIG_UML_NET_DAEMON=y
+CONFIG_UML_NET_MCAST=y
+CONFIG_UML_NET_SLIRP=y
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
+CONFIG_SOUND=m
+CONFIG_EXT4_FS=y
+CONFIG_REISERFS_FS=y
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

