Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C126C481C4
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315648; cv=none; b=QCE77lfWW9YbM3i43yORG+uzsAYzTwGfUGndGQMby7MEnoqY6onTtr0r8FKj8Dyj4/4hbpLs35rdXzt+1h4cZ92GV+V61Pq8rRKWfhJHxk53fruTpySot2Cutaes9opoO2q+80c2HlQGPu0OU/J7RJYPS5KpX6OSPLmgVjzYboo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315648; c=relaxed/simple;
	bh=X2qIQbip9P9ugc2OC4RHxRSk9Q5ysGY92qa3dfyugqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RH13tu4Akh2DbUhgevk4WXNtP+OMpwZu8AVdqiw07feIIS03YpMKsYVUB1vJKHWuKub4FC5RvFHmxkKyzr12nE8JSYLSTsj50VYbeqy01V8ktw6Al1dL4SPVGtyoJ5D/a+bG3eaTYVe8Vo88LQlBob2BXrgpafyCO2QwlEpZ6KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTzek3Rf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTzek3Rf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224ADC4CEEF;
	Thu, 15 May 2025 13:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747315648;
	bh=X2qIQbip9P9ugc2OC4RHxRSk9Q5ysGY92qa3dfyugqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BTzek3RfgvBS131Qe9ED5bvo4vwTXJey2SDAlxi6wZFhPA2IMpIHsTIt2fI7c7Qw2
	 hV24r0ffEHDgII4kTR/QFHIJxYwEugPs3jPgfiHeS3QqqbBE9b/jCbzJmoXW1ikJX5
	 nnOf5XlIDvmVBufRlNhPGYaePfl10PLOgwpBsemzIDVDTjERk/5oUoZjHSGXbNlYGy
	 yWbnQXxMPJ8AzhC1QO2DSgy0sgwBX+YUmfwfum2gY3Ntjm19q0HNpXIjjBxrAAQWQR
	 KXEPFU+OGiz6qiByiBxxEQnq/ybd0+Gbtp4OH7F3pzRXmb+zWkWEe4NoDS13NQTpK/
	 nVxv5VpovyfWQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 01/13] x86/kconfig/64: Refresh defconfig
Date: Thu, 15 May 2025 15:27:07 +0200
Message-ID: <20250515132719.31868-2-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515132719.31868-1-mingo@kernel.org>
References: <20250515132719.31868-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the x86-64 defconfig to pick up changes in the
general Kconfig environment: removed options, different
defaults, renames, etc.

No changes to the actual result of 'make ARCH=x86 defconfig'.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 arch/x86/configs/x86_64_defconfig | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_defconfig
index 61e25f6209ed..7d7310cdf8b0 100644
--- a/arch/x86/configs/x86_64_defconfig
+++ b/arch/x86/configs/x86_64_defconfig
@@ -27,6 +27,7 @@ CONFIG_CGROUP_DEBUG=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
+CONFIG_KEXEC=y
 CONFIG_SMP=y
 CONFIG_HYPERVISOR_GUEST=y
 CONFIG_PARAVIRT=y
@@ -40,8 +41,6 @@ CONFIG_EFI=y
 CONFIG_EFI_STUB=y
 CONFIG_EFI_MIXED=y
 CONFIG_HZ_1000=y
-CONFIG_KEXEC=y
-CONFIG_CRASH_DUMP=y
 CONFIG_HIBERNATION=y
 CONFIG_PM_DEBUG=y
 CONFIG_PM_TRACE_RTC=y
@@ -63,9 +62,7 @@ CONFIG_BINFMT_MISC=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
-CONFIG_UNIX=y
 CONFIG_XFRM_USER=y
-CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_ADVANCED_ROUTER=y
 CONFIG_IP_MULTIPLE_TABLES=y
@@ -205,7 +202,6 @@ CONFIG_SND_HDA_INTEL=y
 CONFIG_SND_HDA_HWDEP=y
 CONFIG_HIDRAW=y
 CONFIG_HID_GYRATION=y
-CONFIG_LOGITECH_FF=y
 CONFIG_HID_NTRIG=y
 CONFIG_HID_PANTHERLORD=y
 CONFIG_PANTHERLORD_FF=y
@@ -239,7 +235,6 @@ CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
 CONFIG_QUOTA=y
 CONFIG_QUOTA_NETLINK_INTERFACE=y
-# CONFIG_PRINT_QUOTA_WARNING is not set
 CONFIG_QFMT_V2=y
 CONFIG_AUTOFS_FS=y
 CONFIG_ISO9660_FS=y
@@ -264,13 +259,11 @@ CONFIG_SECURITY=y
 CONFIG_SECURITY_NETWORK=y
 CONFIG_SECURITY_SELINUX=y
 CONFIG_SECURITY_SELINUX_BOOTPARAM=y
-CONFIG_SECURITY_SELINUX_DISABLE=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_WX=y
 CONFIG_DEBUG_STACK_USAGE=y
-# CONFIG_SCHED_DEBUG is not set
 CONFIG_SCHEDSTATS=y
 CONFIG_BLK_DEV_IO_TRACE=y
 CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
-- 
2.45.2

