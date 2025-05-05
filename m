Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8979214226
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443434; cv=none; b=I6KPJlJHvyQHdAA+1uV2xzIhJHwo5UjB7OMX5/aQ6szexjogo2bauRKkwfYCfJrYYj3QiqeIZ/X3Y2v9eXYXCjm1U9ZGrHJJsNdh7D3bkyUexTNtEXHfuvQtMq1qiLg6xUFCoTWDh5E3SA1fVHRqiLNL5J2zV+h+ibHFf0ezQhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443434; c=relaxed/simple;
	bh=d9aWtdPFc7Gw+SlMMmk8a7/GMzqd2tG1kqnHVDm7MAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GjeKuh4CcxHVDz/Qrb4y4WYbyYENv55Ziv1+Zd0vwSNu/geAFE0I2Sx0o1F0jzry5DE4FuBo48Y15ZGKWef38iL7n1H6CSxr5vP/whMsO0X0vpgxODWGHtyT4R8/7U5DxlFb8Dinv00CUqQ2QMCGz922hkTgQxTNdxxbZUPloo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sdd04ZRO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sdd04ZRO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3A9C4CEE9;
	Mon,  5 May 2025 11:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746443433;
	bh=d9aWtdPFc7Gw+SlMMmk8a7/GMzqd2tG1kqnHVDm7MAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sdd04ZROepfkn8VJjMhlu6okePRz2otAOBCcC5POMqm1Q71omnJb/rblPbHH5ALtx
	 ce5RsnFASCE4l9J4S/e+c4VCiqOuHSR0pFuBIqBQRDO3HGio2yLl/QAr2iXXaixx5t
	 Zl2VnpkxLFOhos8nGaDh0jWdHx8ivLaTXq1dmvXimIfoeNZi9fjsKh8qrBwanMae6c
	 VxnkN580HyvdBuIhW3QHMleqlqZL5dovhnV5ydr/e0eJmadip/q6q0XEQHKXo+kNTi
	 jbrXRQ2I8SirO9J4PYB4vM2UT9p2n1kQneHWn1105cw5d2UH1TOnAA0U0hRfnsVFJ1
	 zIiLEwh2jBkUQ==
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
Subject: [PATCH 13/15] x86/kconfig/64: Enable popular scheduler, cgroups and namespaces options in the defconfig
Date: Mon,  5 May 2025 13:09:44 +0200
Message-ID: <20250505110946.1095363-14-mingo@kernel.org>
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
index 3d585c33016b..09e9a8823dc1 100644
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
@@ -298,7 +318,6 @@ CONFIG_SECURITY_SELINUX_BOOTPARAM=y
 CONFIG_PRINTK_TIME=y
 CONFIG_BOOT_PRINTK_DELAY=y
 CONFIG_DYNAMIC_DEBUG=y
-CONFIG_DEBUG_KERNEL=y
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_HEADERS_INSTALL=y
 CONFIG_DEBUG_SECTION_MISMATCH=y
-- 
2.45.2

