Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AB928641C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551414; cv=none; b=LjnFHAcBYdi2GqHCCIzBNbXglCAmX1fumuFqFGqJ1bCoVJCJZgwGz4ohly0L7lsmPTvWXyq6ubE/0eegeQvMhIb+Wv4OKNyhnTUYTlWA0iPFtXyO0RBSrcSGN06XkR+/Gr6a4JEmeS8t8uw88VmP28zJVJoyMKRP5D/Xw3dTi7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551414; c=relaxed/simple;
	bh=jMn/lAFBuycsH7qWAp3z2qLPZB7aY3xdlbdcRMAyUR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kuqZawj2u4h0O9sYJ1Y8ZDos/BCiHQYDqLa1TRrV+GCgygmTHUj/Xa04f/zy1YTAqF07EzfAaJHRqlLMXMYeEyHkFtetMp3VKBxhEGuQxqPeHDrJmmkP3AndJDkGLtN061WDt0H8zA3h5xUrVEx1hBNGQqntbtrwMLM0V09GENs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cY0BytsJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cY0BytsJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8351CC4CEEF;
	Tue,  6 May 2025 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746551414;
	bh=jMn/lAFBuycsH7qWAp3z2qLPZB7aY3xdlbdcRMAyUR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cY0BytsJS5Rr5LFr5GLGdan3ytv6FeuTi1cyq4AIPN+wnxiosiZcIDAgU3EbJhBdP
	 Q92UedQtyv7QbpS6hS/cnE1W8p98VbzT6RV8BaG7HpQRrB9nTy2DiN8lR6IlXh87yD
	 9m+FXkB22w2I1fik2MkKkmWNQ8fxy1ZYgC8Umf1/IPWu4Z821r6kp1wtwhpf81/gZz
	 gfYj9A74j7AJTSnAk7KMzqOT3bIBUjPt9qE+2qXWYo5wc+JNAW814GE4Vtlxm9r/b2
	 ZXy3vqatkOMQzwEmZUmNaTiSNPwVStW7j383LmTqt5huNx4paz2cZAjczZkvI8TngG
	 Cqjgj7IhdP+gA==
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
Subject: [PATCH 13/15] x86/kconfig/64: Enable popular scheduler, cgroups and namespaces options in the defconfig
Date: Tue,  6 May 2025 19:09:22 +0200
Message-ID: <20250506170924.3513161-14-mingo@kernel.org>
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
popular scheduler and cgroups options that are typically enabled
on major Linux distributions.

The options enabled is a superset of the latest Ubuntu and Fedora
kernel debugging configs, using Ubuntu's config-6.11.0-24-generic
file, Fedora's kernel-x86_64-fedora.config and RHEL's
kernel-x86_64-rhel.config from kernel-ark.git.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 arch/x86/configs/defconfig.x86_64 | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/arch/x86/configs/defconfig.x86_64 b/arch/x86/configs/defconfig.x86_64
index 3c4a03633328..225aed921e21 100644
--- a/arch/x86/configs/defconfig.x86_64
+++ b/arch/x86/configs/defconfig.x86_64
@@ -2,6 +2,7 @@ CONFIG_WERROR=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_AUDIT=y
+# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BPF_SYSCALL=y
@@ -11,26 +12,45 @@ CONFIG_BPF_PRELOAD=y
 CONFIG_BPF_PRELOAD_UMD=y
 CONFIG_BPF_LSM=y
 CONFIG_PREEMPT_VOLUNTARY=y
+CONFIG_SCHED_CORE=y
+CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
+CONFIG_IRQ_TIME_ACCOUNTING=y
 CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_TASKSTATS=y
 CONFIG_TASK_DELAY_ACCT=y
 CONFIG_TASK_XACCT=y
 CONFIG_TASK_IO_ACCOUNTING=y
+CONFIG_PSI=y
+CONFIG_PSI_DEFAULT_DISABLED=y
 CONFIG_LOG_BUF_SHIFT=18
-CONFIG_CGROUPS=y
+CONFIG_PRINTK_INDEX=y
+CONFIG_UCLAMP_TASK=y
+CONFIG_NUMA_BALANCING=y
+CONFIG_MEMCG=y
+CONFIG_MEMCG_V1=y
 CONFIG_BLK_CGROUP=y
-CONFIG_CGROUP_SCHED=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_UCLAMP_TASK_GROUP=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_RDMA=y
+CONFIG_CGROUP_DMEM=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_HUGETLB=y
 CONFIG_CPUSETS=y
+CONFIG_CPUSETS_V1=y
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_PERF=y
 CONFIG_CGROUP_BPF=y
 CONFIG_CGROUP_MISC=y
 CONFIG_CGROUP_DEBUG=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
+CONFIG_CHECKPOINT_RESTORE=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_SYSFS_SYSCALL=y
+CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
 CONFIG_KEXEC=y
@@ -305,7 +325,6 @@ CONFIG_LIST_HARDENED=y
 CONFIG_PRINTK_TIME=y
 CONFIG_BOOT_PRINTK_DELAY=y
 CONFIG_DYNAMIC_DEBUG=y
-CONFIG_DEBUG_KERNEL=y
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_HEADERS_INSTALL=y
 CONFIG_DEBUG_SECTION_MISMATCH=y
-- 
2.45.2

