Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE7628640D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551411; cv=none; b=ZdJlqOfw7fKQIhgp2PtVVrwOaFjCwcAemN1w3Jd2plYU+WRmePuWttZGJBlOTdQwrmsoVAZm70P9lrtOTI8y8eSpgWfrJOYbVsH/VUFx3iTrKNkPPqW6beyqk/RYd2CiYOkOIRWWt0/Fs92unsjyv/x4Q27TJ82W34VhwGQM4IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551411; c=relaxed/simple;
	bh=YPD/+qM/EjqNwh7YB/Dd1xYf0Qv3JjSHbtK9dZaN9Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=btz5XfWHYJgN17CG83dLDkF7BLigb1b5AF5oZNc9GE414OZ0Kpt2zETOr+nRPeOWbH0yOSL5JFCxFS7hG70bvLi0yMg/2vD2H+o9eYOddi7ISeMwqCxOsujhvEqLSYdJyny5E/nKdiArhS6nbgxPv+rJLck1DpbAN3gSVvVA4HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvHqyyI8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvHqyyI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146D6C4CEEB;
	Tue,  6 May 2025 17:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746551411;
	bh=YPD/+qM/EjqNwh7YB/Dd1xYf0Qv3JjSHbtK9dZaN9Bg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MvHqyyI8Gwq6dFq7WjLsRBk2mJyfKKPyldnQsouxPQkQeaYQxR1/nrJ/SoUyZNoeD
	 NPtMZpTH3HL9MfS2AWs4/bFsbllXjCt7wDzm026xqV6CDyzfd7vTRiEF/6M34qLmnO
	 wQjzQEU6codvTUHMcduSKir3UWy8G8Q7mPlYn5JobD4dPwXMb6wbusr8c+98EdWtca
	 7fGLKqCqRPUP0OcMAsuvNXTHyoFo7QmdohkjclUWWZ1FMOt60bt0L/vy2HxjtWCJQo
	 QqrTChUwvnDO1OMl75jRXEb6sVGfdP59eY0hb+6C5f4vBGHdghDAaRSJs4BGzLl1RH
	 962Mr3clCgDNQ==
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
	Ivan Shapovalov <intelfx@intelfx.name>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 12/15] x86/kconfig/64: Enable popular kernel debugging options in the defconfig
Date: Tue,  6 May 2025 19:09:21 +0200
Message-ID: <20250506170924.3513161-13-mingo@kernel.org>
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

Since the x86 defconfig aims to be a distro kernel work-alike with
fewer drivers and a shorter build time, enable a handful of
kernel debugging options that are typically enabled on major Linux
distributions.

The options enabled is a superset of the latest Ubuntu and Fedora
kernel debugging configs, using Ubuntu's config-6.11.0-24-generic
file, Fedora's kernel-x86_64-fedora.config and RHEL's
kernel-x86_64-rhel.config from kernel-ark.git.

Notable features enabled:

 - CONFIG_UBSAN=y:

     Despite the runtime overhead, UBSAN is actively enabled
     in all 3 major Linux distros I checked, so we want it
     enabled in the defconfig as well - to better see the
     consequences.

 - CONFIG_DEBUG_SHIRQ=y:

     Fedora/RHEL have this enabled, while Ubuntu has it disabled.

 - CONFIG_LIST_HARDENED=y:

     Fedora/RHEL have CONFIG_DEBUG_LIST enabled, while Ubuntu has
     it disabled, so pick the lightweight LIST_HARDENED variant.

 - CONFIG_FUNCTION_PROFILER=y:

     This is enabled on all distros I checked as well.

DEBUGINFO is still disabled, despite enabled in all Linux distros,
because the ~10x .o bloat is still just so painful on anything
but the most powerful build boxes.

Note that while the following features seemingly get removed from
the defconfig :

  - CONFIG_BLK_DEV_INITRD=y
  - CONFIG_KPROBES=y
  - CONFIG_MAGIC_SYSRQ=y

they are actually still enabled in the actual .config, because they
get selected by other options indirectly.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Ivan Shapovalov <intelfx@intelfx.name>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 arch/x86/configs/defconfig.x86_64 | 46 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/arch/x86/configs/defconfig.x86_64 b/arch/x86/configs/defconfig.x86_64
index 02c4ba79946b..3c4a03633328 100644
--- a/arch/x86/configs/defconfig.x86_64
+++ b/arch/x86/configs/defconfig.x86_64
@@ -31,7 +31,6 @@ CONFIG_CGROUP_PERF=y
 CONFIG_CGROUP_BPF=y
 CONFIG_CGROUP_MISC=y
 CONFIG_CGROUP_DEBUG=y
-CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
 CONFIG_KEXEC=y
@@ -68,7 +67,6 @@ CONFIG_KVM_INTEL=y
 CONFIG_KVM_AMD=y
 CONFIG_KVM_XEN=y
 CONFIG_KVM_MAX_NR_VCPUS=4096
-CONFIG_KPROBES=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
@@ -303,14 +301,56 @@ CONFIG_SECURITY=y
 CONFIG_SECURITY_NETWORK=y
 CONFIG_SECURITY_SELINUX=y
 CONFIG_SECURITY_SELINUX_BOOTPARAM=y
+CONFIG_LIST_HARDENED=y
 CONFIG_PRINTK_TIME=y
+CONFIG_BOOT_PRINTK_DELAY=y
+CONFIG_DYNAMIC_DEBUG=y
 CONFIG_DEBUG_KERNEL=y
-CONFIG_MAGIC_SYSRQ=y
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_HEADERS_INSTALL=y
+CONFIG_DEBUG_SECTION_MISMATCH=y
+CONFIG_KGDB=y
+CONFIG_KGDB_TESTS=y
+CONFIG_KGDB_LOW_LEVEL_TRAP=y
+CONFIG_KGDB_KDB=y
+CONFIG_KDB_KEYBOARD=y
+CONFIG_UBSAN=y
+CONFIG_UBSAN_SHIFT=y
+CONFIG_PAGE_OWNER=y
+CONFIG_PAGE_POISONING=y
 CONFIG_DEBUG_WX=y
+CONFIG_PER_VMA_LOCK_STATS=y
 CONFIG_DEBUG_STACK_USAGE=y
+CONFIG_SCHED_STACK_END_CHECK=y
+CONFIG_KFENCE=y
+CONFIG_DEBUG_SHIRQ=y
+CONFIG_PANIC_ON_OOPS=y
+CONFIG_HARDLOCKUP_DETECTOR=y
+CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
+CONFIG_WQ_CPU_INTENSIVE_REPORT=y
 CONFIG_SCHEDSTATS=y
+CONFIG_NMI_CHECK_CPU=y
+CONFIG_RCU_CPU_STALL_CPUTIME=y
+CONFIG_BOOTTIME_TRACING=y
+CONFIG_FUNCTION_GRAPH_RETVAL=y
+CONFIG_FPROBE=y
+CONFIG_FUNCTION_PROFILER=y
+CONFIG_STACK_TRACER=y
+CONFIG_SCHED_TRACER=y
+CONFIG_HWLAT_TRACER=y
+CONFIG_TIMERLAT_TRACER=y
+CONFIG_MMIOTRACE=y
+CONFIG_FTRACE_SYSCALLS=y
 CONFIG_BLK_DEV_IO_TRACE=y
+CONFIG_USER_EVENTS=y
+CONFIG_HIST_TRIGGERS=y
+CONFIG_TRACE_EVENT_INJECT=y
+CONFIG_RV=y
+CONFIG_RV_MON_WWNR=y
 CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
 CONFIG_EARLY_PRINTK_DBGP=y
+CONFIG_EARLY_PRINTK_USB_XDBC=y
 CONFIG_DEBUG_BOOT_PARAMS=y
 CONFIG_DEBUG_ENTRY=y
+CONFIG_FUNCTION_ERROR_INJECTION=y
+CONFIG_MEMTEST=y
-- 
2.45.2

