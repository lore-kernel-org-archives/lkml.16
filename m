Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8DB2222D5
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551372; cv=none; b=WC+M0m006Lahuj5yfjiQ0J1UDSyRNJjam/RKfwERCGhgz6oTmnaSWy2+eS1gCeFhEV5k3kYKjQkaDn0wMcuh2epkyli+BiXo1c7zKbaaqp5ESUnY/xtRehBfH5VxW7XJ3AmcDJtGYp26oACHFf53KCVXmwBps2Jzfz10/PwajUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551372; c=relaxed/simple;
	bh=X2qIQbip9P9ugc2OC4RHxRSk9Q5ysGY92qa3dfyugqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oHNEwebp1fmj9gzfgqFBapECev7tItGUtipXLV4moB4Bz4f24YTUszCPDR4WWxh42YUScle37b3p2Y/9BvNpqnbEVylF4YrAhpODr30Zbh0mPuYWl7PYFaO6dAwb+Eqb3mvUqEOxC9Trlih+ResrgIxMEMOqdVGpJnb+YxhHesY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YH2t2reW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YH2t2reW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC99C4CEE4;
	Tue,  6 May 2025 17:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746551372;
	bh=X2qIQbip9P9ugc2OC4RHxRSk9Q5ysGY92qa3dfyugqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YH2t2reWZga3xro3jIdX7SQAlc8AuC0c3fzEIkMVHnzET/mLtUOb5rUSkCzspXyuQ
	 kk0g21n+Bn0PO9hOPFWHShxhCmZfAm7eJstOjE3DUAufYqyP/WgM5tqM6AEYg+YP4V
	 A9bYlV2X3XkLErLu6f96JHoTw2wIl7UOR8hmKF9gEVXRV8a5bc5sdmHZHMfYfrKelz
	 8oLddeBkUGPsEvIQl6YblN2eQFiR52FJZUiN6I82L7RTflVH6BSd8BTle/MfCYLgtY
	 jl4RSWTLtgMpMqk2hh84iaMrRPSm7R+s+ghxPA+ln+824RGtv54cefyjZwZAJutQ+d
	 vhOtJHSc4T6qQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Ingo Molnar <mingo@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 01/15] x86/kconfig/64: Refresh defconfig
Date: Tue,  6 May 2025 19:09:10 +0200
Message-ID: <20250506170924.3513161-2-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506170924.3513161-1-mingo@kernel.org>
References: <20250506170924.3513161-1-mingo@kernel.org>
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

