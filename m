Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5FB21CC40
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 21:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750628029; cv=none; b=ur+C2m81ysaXoT4cORkyfr6F3zd+j0SaeQcZ6XdEIdqyc2YHJoAfiZXttBal4KEtm2jxWPNEr+PJpB6FgA2AmaeuvxuAKnuwIcGgdn9GNcFhCE0zYOH5gGFnH1SWF2ow8ZF1wuBl9qNmRMHXvVCCIs07sRG2vN7eSp8tSj0KT7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750628029; c=relaxed/simple;
	bh=MryEApqacNPUDPx//9kRjyNmysSr/3bbD7GV9l6RwME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJxQiADOt0t2Fr/6oc/+PJTvTZkvDQXmHp31Vy0UHY7lZOL8pF4yAisTVkLlA63AJqKC5BPRLgcuK10leSPWk0nGFs2YNpkjd4Fol8LZyq0VVgM8nXrGAVBpYJKuJYvqI7hQRLAizw8dhmleSHdThFjEZiGZiDE5LPnhIDu1n/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkayZplr; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkayZplr"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-236192f8770so23921785ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 14:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750628027; x=1751232827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CZO2OAKV3OtJLgmf9ZQYFE78DDsp7kzC/L9szpctPA=;
        b=AkayZplrElO0Azrs+uCy56R0njFWNekTZwHyZ6O8q0J1fN8N5M4T4c8G81Ww5I1PON
         QkQBgJT4kvdR4nt8GqPrLhN70d6ASTbpWwveFM3C8dDcQIvoOTd8Ql35BA58EgCDhD/n
         EZX81MpWl/RoYJNwDNSVN6rSXErhvfVpnVePWX/KBTKR9CR/LTVfz7n3N44Tm84k+g03
         dspJUFywH0biMmwzrEZDggdAsj7zMjislC5erA4h36Vr2SDt7QIKJRcQqKXOlzq/Rwwr
         vytzTgyDcZ1tVLM9/ueblEJshs8pY6mybdXDUXjpMabFDY5QHnr02+melSs66QRh2sqm
         W1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750628027; x=1751232827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CZO2OAKV3OtJLgmf9ZQYFE78DDsp7kzC/L9szpctPA=;
        b=MtKPyqdHetAxMMOgaU6ChVQswEz1dLOhTMHyU3zXSPx01L/xQPQYMMeAMYxw3atedc
         3Bhg4YUHTfyLVapJ2aI+SXK+mHdz2N6vYnveWz24BeRuWZil0XsAstQ3lreCQbxigc1v
         G6U4TXzH8jr4LHsyuAGFchSR73YxNlowMx9ESGC/ondDNPZ9xl++4dpIPAYcPf2yiPBl
         zEmZMst7VBuiJlIIuVrBuCcplkOYYAmU/HkcffU4vkGQ4RSQ7RY9zF705WxufPgnUdOc
         0ZAwAj/chYUUBmAK/8nIa/hi/0kFeG31gTbDe3YffflChBLMIMD9mlRINBg5RBJq40QO
         p0CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUNdFslSVKMMQ7Cvqf67rKMoDqRLZByMnAGFnK+0HEcF3+bRyavbISGb+BPn/N8AmahZwbqBMq6uagGXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJk8o6+Z4gtOfXSoMhP9gzS8RYNUNeNNOoMV8bydCzEmp8NEYX
	pr4LnzhnxWVxHiXN1fsQCEt9sVB2bDT3wJzvguPPdkGd83DJhpJ8lKjpms6roA==
X-Gm-Gg: ASbGnctR3dZ083eRRyeUv6SdBfFKS+nmtgV3jM2TIeieXEcN7Y2H5op3zfqBKoZ7zdy
	ld4I4aOUJqJgQRrdW8vGzMm1Vk9JBg0TlywuGEv/zHem62uFc6K+poI9MSM0kouYETD7UYyiGbm
	4V1BI+bHIKJTJcOLr4MnL2FwOry4Zasr+IsXoyR6Dl38YMSHVJi8orVo9a5TSZX0gWIHZvwNXOl
	xNsEPl5r31Hnuu/G3WWvfJR6EybNNSgey6eooP3pQ04tVpgDvdmq04PC380gV1KLTCuXz1VAhiU
	WX1OZThpM0L0jS4LBNlcjDiUEaqjSw2v4P5XVAi8osYsZY6MY4N6A2CjfRwNGOIbbv4nV0eDU7z
	jwzQSvu+grd9OIHCEEcCh4KakwuqsptAI
X-Google-Smtp-Source: AGHT+IHxp56Xls+moSgffTIGwer9X/frbYltlT1Wotdht1GfPvk8Ri0YMlmgTa9DA+cKj0epHgkh4Q==
X-Received: by 2002:a17:902:f64a:b0:236:8b70:191b with SMTP id d9443c01a7336-237dad62920mr129643705ad.0.1750628026800;
        Sun, 22 Jun 2025 14:33:46 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83d1390sm66931345ad.68.2025.06.22.14.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 14:33:46 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id E3DE1EF1EBE; Mon, 23 Jun 2025 06:33:44 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 13/13] um: nommu: plug nommu code into build system
Date: Mon, 23 Jun 2025 06:33:11 +0900
Message-ID: <2b8eb79a28dd4cca358236347847679c7a968f04.1750594487.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750594487.git.thehajime@gmail.com>
References: <cover.1750594487.git.thehajime@gmail.com>
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

