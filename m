Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAA31DDC08
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720142; cv=none; b=ZA8IFEigui4NPQ83jHnpdL6v05ZkPILedfjxQ143l1h4wgH9tqoBp6049vdKvP3oKXxyNDz+cxJHCF22sGXEJSzv/eSW+8aMdU8N6NChWMdwVpaDyKXyUHXQtUre7d1kiP5wgMt7Ukte20pBQ8Nx6JbqnDhnwVoCHLF+5a8DWvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720142; c=relaxed/simple;
	bh=4QSAgNY4Km1oiqTQNbwqDdtTwr9iNr3eU8Ecixocle0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZZfeCSTEaitg2I01uStowFvw5rkc85nPiCHxdHKsxtoLC46b0x8B1OeSg3Jw51VFiLIXTMNtq3v81D94YSfwK2lo19eXadQwjoy7PgHm8Es71TTEOxWJTu3YLQn7QTS/RwLa1CBjbbwVjG00va8OEy6sinM5m2wMysiUC/5BRBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciNhnYcn; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciNhnYcn"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736e52948ebso6088899b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744720139; x=1745324939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FENkVPZrdXUfWlwZOpIjF8fd7DB1ly5m5isMQSaF4Ak=;
        b=ciNhnYcn5AVi0pJkQSHMQnF2Xb+AImgoM5FDNUP2ZIAZwuwOD3G131yfTJewOQbo7q
         FEi8PgIUoCfFvQf+5+4bnnWFTOm2gea/ARdOynHGc3JfTJUzJ+DZB7gjYvKyqhxjM5UJ
         8C+zFvF/FQurNLKen0cowN0S4SRlkgUpGSOQJsVpm5m8CZaVALGJqwAxV2XVa3pQn7C3
         ogWGwHjajIxt0pRjcAdfuDdOl3wVL1UUb9GFctpHWKHN4FvDIiz4Itf5b+pHc8t63Bn6
         p0FHixBITGaVTBgX9CCiSRpNxwF5hEclu8Zlg/wJ/jnxTWzsSrxJRJqTmtvbX3x9StGO
         jMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744720139; x=1745324939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FENkVPZrdXUfWlwZOpIjF8fd7DB1ly5m5isMQSaF4Ak=;
        b=ObTYITC4RUb1+F+fEDhcknUrxf5M8ypGUqGW+EE9nF1hDDkYWQKlBI50yHZF41b8dt
         /V++bdkIVPamk9uNqX8Vt3Qr5XFUUUp+rXrMzVNdalCHWP0NRu0IGU6UbrHgsYZ01Nd2
         nyfDOAleACV2gkbJJyCR5r5M7YNK/8co20IeI2SKvvvVqywuzaeFMO8tzFiJBqzaduIJ
         0VRXYFG188sEIDU4JnXqfgWBvIxkS29ZNrAAMBXjiFlcpFsxifkjljQ2/xHSD1fVwVqt
         sLb//nuE2fYbDpwTEtOSjw8XjN7EZPYHpxats5pwxyDVKqJTYJ/wCpATeZpWFnnX2+cg
         G69Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfpqU2HzMIbAJ6ZfIxiU/STbngSaKzbsShZDBUuvoGcjgdZgUjVn7Xp94eNjFoq384tZsEfgAuBwkJ6OU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiWCI642gVECETkFjYUUbsCfo9y5L/dWDC/CurpYttqUhmIgK5
	exOMb7liEKZX5NvOmBWqGSEFaiWNxxWtIR/MxrOT8lURe34PlWoG
X-Gm-Gg: ASbGncta6/V4BC+leW100rCsYl+QxIWKwYD7E2RvSb3O4WVdVv/FaeTO0xecWbQ5u5d
	QSzjoNlVaw05rXD5zmxPWPH9ebXJBMscnGyBk+vZDuAQwBUtjsqGLrXKUti2Sy6+LWDyzVJoEbh
	8YW2Dvrh1GKCWUs5gHt9v18uuGsgT9VVESuU9Ju4ro9YB3kqwyUm76SiRZFTiIae95NUypmyZH3
	CkTXs2ZgQDGJo799JnVmoDuluKREkYD/52eXMH8+TODRGxWe72UbC2CFm9c0qsUX4d17CGVSqcM
	QpFV/MrxdJC8I6MvIwmkXGLN2ce6Wri7Tmqqw4J9mJPnas+rhD82qdK1FviHfQ==
X-Google-Smtp-Source: AGHT+IE9rRI3sV/c1IEbsmtgMV/3FSBB8AbgRXFWGUElqksSl5VBAp1cIvmxwGtICoaKZ3jNaZNcZA==
X-Received: by 2002:a05:6a00:1484:b0:731:737c:3224 with SMTP id d2e1a72fcca58-73bd11fa27dmr21712379b3a.10.1744720139495;
        Tue, 15 Apr 2025 05:28:59 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198e9csm8334898b3a.28.2025.04.15.05.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:28:58 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: defconfig: Remove EXPERT
Date: Tue, 15 Apr 2025 21:58:31 +0930
Message-ID: <20250415122832.982610-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The setting of EXPERT is a leftover from when the riscv defconfig was
first added. As mentioned in the EXPERT Kconfig help text it is not
intended to be set in the usual case.

Upon removal a bunch of intrusive debug-related kernel options are no
longer set, which is good. A few may want to come back in the future but
let those be advocated for on a case by case basis.

NAMESPACES, SYSFS_SYSCALL and MEDIA_SUPPORT_FILTER default on and thus
fall out of the defconfig.

Set VIDEO_CADENCE_CSI2RX=y to ensure VIDEO_CADENCE_CSI2RX stays enabled.

Set DEBUG_KERNEL=y in line with other arch defconfigs. This turns on
tracing.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
This supersedes https://lore.kernel.org/all/20250404062235.671872-1-joel@jms.id.au/
as it is a fix for the root cause: by removing EXPERT causes
MEDIA_SUPPORT_FILTER=y like most other defconfigs and thus the
unwanted MEDIA drivers stay disabled.

To view the change between the old .config and the new, use a recipe
such as:

make ARCH=riscv defconfig && cp .config config-before-removing-expert
git am 0001-riscv-defconfig-Remove-EXPERT.patch
make ARCH=riscv defconfig
diff -up config-before-removing-expert .config | grep "^+\|^-" | grep CONFIG

The output when run on v6.15-rc1:

-# CONFIG_PREEMPT_RT is not set
-CONFIG_PREEMPT_COUNT=y
-# CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is not set
-CONFIG_EXPERT=y
+# CONFIG_EXPERT is not set
-# CONFIG_SGETMASK_SYSCALL is not set
-# CONFIG_SYSFS_SYSCALL is not set
+CONFIG_SYSFS_SYSCALL=y
-# CONFIG_BASE_SMALL is not set
-# CONFIG_DEBUG_RSEQ is not set
-# CONFIG_PC104 is not set
+CONFIG_TRACEPOINTS=y
-# CONFIG_SUSPEND_SKIP_SYNC is not set
+CONFIG_UPROBES=y
-CONFIG_UNINLINE_SPIN_UNLOCK=y
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+CONFIG_INLINE_READ_UNLOCK=y
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+CONFIG_INLINE_WRITE_UNLOCK=y
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
-# CONFIG_SLUB_TINY is not set
+# CONFIG_NET_DROP_MONITOR is not set
-# CONFIG_PCIE_BUS_TUNE_OFF is not set
-CONFIG_PCIE_BUS_DEFAULT=y
-# CONFIG_PCIE_BUS_SAFE is not set
-# CONFIG_PCIE_BUS_PERFORMANCE is not set
-# CONFIG_PCIE_BUS_PEER2PEER is not set
-# CONFIG_FIRMWARE_MEMMAP is not set
-# CONFIG_INPUT_FF_MEMLESS is not set
+CONFIG_INPUT_FF_MEMLESS=y
-# CONFIG_TTY_PRINTK is not set
-# CONFIG_GPIO_SYSFS is not set
-# CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER is not set
+CONFIG_MEDIA_HIDE_ANCILLARY_SUBDRV=y
-# CONFIG_VIDEO_CS3308 is not set
-# CONFIG_VIDEO_CS5345 is not set
-# CONFIG_VIDEO_CS53L32A is not set
-# CONFIG_VIDEO_MSP3400 is not set
-# CONFIG_VIDEO_SONY_BTF_MPX is not set
-# CONFIG_VIDEO_TDA1997X is not set
-# CONFIG_VIDEO_TDA7432 is not set
-# CONFIG_VIDEO_TDA9840 is not set
-# CONFIG_VIDEO_TEA6415C is not set
-# CONFIG_VIDEO_TEA6420 is not set
-# CONFIG_VIDEO_TLV320AIC23B is not set
-# CONFIG_VIDEO_TVAUDIO is not set
-# CONFIG_VIDEO_UDA1342 is not set
-# CONFIG_VIDEO_VP27SMPX is not set
-# CONFIG_VIDEO_WM8739 is not set
-# CONFIG_VIDEO_WM8775 is not set
-# CONFIG_VIDEO_SAA6588 is not set
-# CONFIG_VIDEO_ADV7180 is not set
-# CONFIG_VIDEO_ADV7183 is not set
-# CONFIG_VIDEO_ADV748X is not set
-# CONFIG_VIDEO_ADV7604 is not set
-# CONFIG_VIDEO_ADV7842 is not set
-# CONFIG_VIDEO_BT819 is not set
-# CONFIG_VIDEO_BT856 is not set
-# CONFIG_VIDEO_BT866 is not set
-# CONFIG_VIDEO_ISL7998X is not set
-# CONFIG_VIDEO_LT6911UXE is not set
-# CONFIG_VIDEO_KS0127 is not set
-# CONFIG_VIDEO_MAX9286 is not set
-# CONFIG_VIDEO_ML86V7667 is not set
-# CONFIG_VIDEO_SAA7110 is not set
-# CONFIG_VIDEO_SAA711X is not set
-# CONFIG_VIDEO_TC358743 is not set
-# CONFIG_VIDEO_TC358746 is not set
-# CONFIG_VIDEO_TVP514X is not set
-# CONFIG_VIDEO_TVP5150 is not set
-# CONFIG_VIDEO_TVP7002 is not set
-# CONFIG_VIDEO_TW2804 is not set
-# CONFIG_VIDEO_TW9900 is not set
-# CONFIG_VIDEO_TW9903 is not set
-# CONFIG_VIDEO_TW9906 is not set
-# CONFIG_VIDEO_TW9910 is not set
-# CONFIG_VIDEO_VPX3220 is not set
-# CONFIG_VIDEO_SAA717X is not set
-# CONFIG_VIDEO_CX25840 is not set
-# CONFIG_VIDEO_ADV7170 is not set
-# CONFIG_VIDEO_ADV7175 is not set
-# CONFIG_VIDEO_ADV7343 is not set
-# CONFIG_VIDEO_ADV7393 is not set
-# CONFIG_VIDEO_ADV7511 is not set
-# CONFIG_VIDEO_AK881X is not set
-# CONFIG_VIDEO_SAA7127 is not set
-# CONFIG_VIDEO_SAA7185 is not set
-# CONFIG_VIDEO_THS8200 is not set
-# CONFIG_VIDEO_UPD64031A is not set
-# CONFIG_VIDEO_UPD64083 is not set
-# CONFIG_VIDEO_SAA6752HS is not set
-# CONFIG_VIDEO_I2C is not set
-# CONFIG_VIDEO_M52790 is not set
-# CONFIG_VIDEO_ST_MIPID02 is not set
-# CONFIG_VIDEO_THS7303 is not set
-# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
-# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
-# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
-# CONFIG_DRM_WERROR is not set
-# CONFIG_HID_A4TECH is not set
+CONFIG_HID_A4TECH=y
-# CONFIG_HID_BELKIN is not set
+CONFIG_HID_BELKIN=y
-# CONFIG_HID_CHERRY is not set
-# CONFIG_HID_CHICONY is not set
+CONFIG_HID_CHERRY=y
+CONFIG_HID_CHICONY=y
-# CONFIG_HID_CYPRESS is not set
+CONFIG_HID_CYPRESS=y
-# CONFIG_HID_EZKEY is not set
+CONFIG_HID_EZKEY=y
-# CONFIG_HID_ITE is not set
+CONFIG_HID_ITE=y
-# CONFIG_HID_KENSINGTON is not set
+CONFIG_HID_KENSINGTON=y
-# CONFIG_HID_REDRAGON is not set
-# CONFIG_HID_MICROSOFT is not set
-# CONFIG_HID_MONTEREY is not set
+CONFIG_HID_REDRAGON=y
+CONFIG_HID_MICROSOFT=y
+CONFIG_HID_MONTEREY=y
+# CONFIG_QCOM_PMIC_PDCHARGER_ULOG is not set
-CONFIG_LIST_HARDENED=y
+# CONFIG_LIST_HARDENED is not set
-# CONFIG_CPUMASK_OFFSTACK is not set
-# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
-# CONFIG_VMLINUX_MAP is not set
-CONFIG_DEBUG_PAGEALLOC=y
-# CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
+# CONFIG_DEBUG_PAGEALLOC is not set
+# CONFIG_DEBUG_PAGE_REF is not set
-CONFIG_SCHED_STACK_END_CHECK=y
+# CONFIG_SCHED_STACK_END_CHECK is not set
-CONFIG_DEBUG_VM_IRQSOFF=y
-CONFIG_DEBUG_VM=y
-# CONFIG_DEBUG_VM_MAPLE_TREE is not set
-# CONFIG_DEBUG_VM_RB is not set
-CONFIG_DEBUG_VM_PGFLAGS=y
-CONFIG_DEBUG_VM_PGTABLE=y
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_VM_PGTABLE is not set
-CONFIG_DEBUG_PER_CPU_MAPS=y
+# CONFIG_DEBUG_PER_CPU_MAPS is not set
-CONFIG_LOCKUP_DETECTOR=y
-CONFIG_SOFTLOCKUP_DETECTOR=y
-# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
+# CONFIG_SOFTLOCKUP_DETECTOR is not set
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
-# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
-CONFIG_DETECT_HUNG_TASK_BLOCKER=y
-CONFIG_WQ_WATCHDOG=y
+# CONFIG_DETECT_HUNG_TASK is not set
+# CONFIG_WQ_WATCHDOG is not set
-CONFIG_DEBUG_RT_MUTEXES=y
-CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_MUTEXES=y
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
-CONFIG_DEBUG_RWSEMS=y
+# CONFIG_DEBUG_RWSEMS is not set
-CONFIG_DEBUG_ATOMIC_SLEEP=y
+# CONFIG_DEBUG_ATOMIC_SLEEP is not set
-CONFIG_DEBUG_LIST=y
-CONFIG_DEBUG_PLIST=y
-CONFIG_DEBUG_SG=y
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_PLIST is not set
+# CONFIG_DEBUG_SG is not set
-# CONFIG_RCU_TRACE is not set
-CONFIG_RCU_EQS_DEBUG=y
+CONFIG_RCU_TRACE=y
+# CONFIG_RCU_EQS_DEBUG is not set
+CONFIG_NOP_TRACER=y
+CONFIG_TRACE_CLOCK=y
+CONFIG_RING_BUFFER=y
+CONFIG_EVENT_TRACING=y
+CONFIG_CONTEXT_SWITCH_TRACER=y
+CONFIG_TRACING=y
-# CONFIG_FTRACE is not set
+CONFIG_FTRACE=y
+# CONFIG_BOOTTIME_TRACING is not set
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_HWLAT_TRACER is not set
+# CONFIG_OSNOISE_TRACER is not set
+# CONFIG_TIMERLAT_TRACER is not set
+# CONFIG_ENABLE_DEFAULT_TRACERS is not set
+# CONFIG_FTRACE_SYSCALLS is not set
+# CONFIG_TRACER_SNAPSHOT is not set
+CONFIG_BRANCH_PROFILE_NONE=y
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+CONFIG_UPROBE_EVENTS=y
+CONFIG_BPF_EVENTS=y
+CONFIG_DYNAMIC_EVENTS=y
+CONFIG_PROBE_EVENTS=y
+# CONFIG_SYNTH_EVENTS is not set
+# CONFIG_USER_EVENTS is not set
+# CONFIG_TRACE_EVENT_INJECT is not set
+# CONFIG_TRACEPOINT_BENCHMARK is not set
+# CONFIG_RING_BUFFER_BENCHMARK is not set
+# CONFIG_TRACE_EVAL_MAP_FILE is not set
+# CONFIG_RING_BUFFER_STARTUP_TEST is not set
+# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
+# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
+# CONFIG_RV is not set

 arch/riscv/configs/defconfig | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3c8e16d71e17..286f490ead37 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -18,12 +18,9 @@ CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_PERF=y
 CONFIG_CGROUP_BPF=y
-CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
 CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-# CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_MICROCHIP=y
 CONFIG_ARCH_SIFIVE=y
@@ -181,6 +178,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_MEDIA_SUPPORT=m
+CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
@@ -294,25 +292,7 @@ CONFIG_DEFAULT_SECURITY_DAC=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
 CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_FS=y
-CONFIG_DEBUG_PAGEALLOC=y
-CONFIG_SCHED_STACK_END_CHECK=y
-CONFIG_DEBUG_VM=y
-CONFIG_DEBUG_VM_PGFLAGS=y
-CONFIG_DEBUG_MEMORY_INIT=y
-CONFIG_DEBUG_PER_CPU_MAPS=y
-CONFIG_SOFTLOCKUP_DETECTOR=y
-CONFIG_WQ_WATCHDOG=y
-CONFIG_DEBUG_RT_MUTEXES=y
-CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_MUTEXES=y
-CONFIG_DEBUG_RWSEMS=y
-CONFIG_DEBUG_ATOMIC_SLEEP=y
-CONFIG_DEBUG_LIST=y
-CONFIG_DEBUG_PLIST=y
-CONFIG_DEBUG_SG=y
-# CONFIG_RCU_TRACE is not set
-CONFIG_RCU_EQS_DEBUG=y
-# CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
-- 
2.47.2

