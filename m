Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5AF2046A5
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443397; cv=none; b=kpMDB4YXZQAFtmQdZFl8pnmFt0ZDqkqFDwcYmUCA8hTOF2oucmcfxhEc8rDC3PMD917u8h7swJKyMRaMiPqG4mdsMPnz1RpTnxWNOwG7+OUGs3awft16R/leVdZx03YpMGaSV+SbDOuW7pTKxaN40pBSfWpHYTYlkAoCW0iCtzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443397; c=relaxed/simple;
	bh=dOJtECNKkBxi48qMeisCrCtM6mzZ/b4yWbrlZ7GczE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEhEgumQlgoAaSCJwC8oOVnMMZi8WNXjeHnlMz3VViMy1zJV75fYzXalynYV/uI8E+anPT6weLriKnmOKpx6oS+Y6+LUBMjzomNad6sfbDhKgzfStJppzcj8blIOKpFJfw/IxltOQXz+MvtXdZvxbxiPORz8J7bCmGB6E8opzOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uL+tuao1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uL+tuao1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA9FC4CEE9;
	Mon,  5 May 2025 11:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746443397;
	bh=dOJtECNKkBxi48qMeisCrCtM6mzZ/b4yWbrlZ7GczE8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uL+tuao1EXLrpxJDj+wx3DhP/JsGkCASuSg0ar3xwaqRyMrpY3/DAa9TcBYfF15H6
	 mHlXMDfi3mRVg5dCvJAc9YqaN8ovbjXtEeSbgXAM3i0WD4QmTi1E/dMDEOYLKbvl6s
	 GTEJXPcKY3ug9fOkucoMTn6wM3rA/gQjVDXpzRXXb3LGoBhUm3jr2qBXukT9jY59wX
	 ORMp1Ysdul/QRwGhB5FOGAddFnafwGZBbc9J1pzOP7ljYc8TDtUPaTJoeCPACeMWmY
	 5Le9vBHof1aBa41thlQx5Xvj82fbMKxVbSLdSusR3jXJEwafCIoR4gMzVVDSvEm21A
	 pLCbKMdVwrGgA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 02/15] x86/kconfig/32: Refresh defconfig
Date: Mon,  5 May 2025 13:09:33 +0200
Message-ID: <20250505110946.1095363-3-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250505110946.1095363-1-mingo@kernel.org>
References: <20250505110946.1095363-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the x86-32 defconfig to pick up changes in the
general Kconfig environment: removed options, different
defaults, renames, etc.

No changes to the actual result of 'make ARCH=i386 defconfig'.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 arch/x86/configs/i386_defconfig | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/x86/configs/i386_defconfig b/arch/x86/configs/i386_defconfig
index 91801138b10b..e983f1db22dd 100644
--- a/arch/x86/configs/i386_defconfig
+++ b/arch/x86/configs/i386_defconfig
@@ -28,6 +28,7 @@ CONFIG_CGROUP_DEBUG=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
+CONFIG_KEXEC=y
 CONFIG_SMP=y
 CONFIG_HYPERVISOR_GUEST=y
 CONFIG_PARAVIRT=y
@@ -40,8 +41,6 @@ CONFIG_X86_CHECK_BIOS_CORRUPTION=y
 CONFIG_EFI=y
 CONFIG_EFI_STUB=y
 CONFIG_HZ_1000=y
-CONFIG_KEXEC=y
-CONFIG_CRASH_DUMP=y
 # CONFIG_MITIGATION_RETHUNK is not set
 CONFIG_HIBERNATION=y
 CONFIG_PM_DEBUG=y
@@ -64,9 +63,7 @@ CONFIG_BINFMT_MISC=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
-CONFIG_UNIX=y
 CONFIG_XFRM_USER=y
-CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_ADVANCED_ROUTER=y
 CONFIG_IP_MULTIPLE_TABLES=y
@@ -138,6 +135,7 @@ CONFIG_CONNECTOR=y
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_VIRTIO_BLK=y
+# CONFIG_INTEL_MEI is not set
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
 CONFIG_CHR_DEV_SG=y
@@ -211,7 +209,6 @@ CONFIG_SND_HDA_INTEL=y
 CONFIG_SND_HDA_HWDEP=y
 CONFIG_HIDRAW=y
 CONFIG_HID_GYRATION=y
-CONFIG_LOGITECH_FF=y
 CONFIG_HID_NTRIG=y
 CONFIG_HID_PANTHERLORD=y
 CONFIG_PANTHERLORD_FF=y
@@ -242,7 +239,6 @@ CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
 CONFIG_QUOTA=y
 CONFIG_QUOTA_NETLINK_INTERFACE=y
-# CONFIG_PRINT_QUOTA_WARNING is not set
 CONFIG_QFMT_V2=y
 CONFIG_AUTOFS_FS=y
 CONFIG_ISO9660_FS=y
@@ -267,19 +263,15 @@ CONFIG_SECURITY=y
 CONFIG_SECURITY_NETWORK=y
 CONFIG_SECURITY_SELINUX=y
 CONFIG_SECURITY_SELINUX_BOOTPARAM=y
-CONFIG_SECURITY_SELINUX_DISABLE=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_FRAME_WARN=1024
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_WX=y
 CONFIG_DEBUG_STACK_USAGE=y
-# CONFIG_SCHED_DEBUG is not set
 CONFIG_SCHEDSTATS=y
 CONFIG_BLK_DEV_IO_TRACE=y
 CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
 CONFIG_EARLY_PRINTK_DBGP=y
 CONFIG_DEBUG_BOOT_PARAMS=y
-CONFIG_UNWINDER_FRAME_POINTER=y
 CONFIG_DEBUG_ENTRY=y
-# CONFIG_64BIT is not set
+CONFIG_UNWINDER_FRAME_POINTER=y
-- 
2.45.2

