Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83AA202F7B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443395; cv=none; b=MhVzIquzkMp49snYE+oxHjSeSoAOCSaBEnuExeUmBjQTIhsI0uvxbNalzzgmftVPOyGMr616rG/UVW60pnzSbXEQwqKjCvCt/ghgiJtIRsK0wNvyZYVvZp4W/8Hj54AWSRdtki92DDT1wJtfa9Bf9FliHCdnYl6acOYXdFpTFuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443395; c=relaxed/simple;
	bh=X2qIQbip9P9ugc2OC4RHxRSk9Q5ysGY92qa3dfyugqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sAUqIMPA/J2/UVMdAvlheiXEHic1WMU4FhLS1LM00GVDrHG+WGea8Z7ixJkVR6ML+ddaQB+t1DsbCzEW2WY3v+IWw6dlbcpGuihVMvs88iLbLayj9rVdgjN9dUqF/Vweh7g8YaXivrq3+VMAvgc9iDS5DWTP/1Gm5LsEV1uf9+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYAiKTWi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYAiKTWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78B2C4CEF0;
	Mon,  5 May 2025 11:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746443394;
	bh=X2qIQbip9P9ugc2OC4RHxRSk9Q5ysGY92qa3dfyugqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FYAiKTWiLdkAVbk72gTa/ddmT6rJYs5nclntfFDpqMyY8bUR9zhhprGa5PpebO4Qd
	 rClki15n+/d5OUFa+rxQGw4AxAJFyOf0OSanQk0XraImvCygvJG4Q3jI7jJ/3PfRSX
	 gLtfYnTail48vYuvPmdQ/H/eJmo95xpMAXiggehIn2Ovu4R/ieG8KPruzvtGJPve66
	 KjAyBiJAUr92IPNYTBJ5tgUnZ8XHU2sVCIgkItNxgEf+MkgR4GAf+WAOsLsEOesbGW
	 s8s/VOt/YezJ4s3xUUn/iq/EJWzUIBHiy+aGmrSUgfDdh4vqmLJ4z7X9RTgvd/HpT7
	 LdQ+Mx6N0DJEA==
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
Subject: [PATCH 01/15] x86/kconfig/64: Refresh defconfig
Date: Mon,  5 May 2025 13:09:32 +0200
Message-ID: <20250505110946.1095363-2-mingo@kernel.org>
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

