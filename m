Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1556922A7F9
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746520770; cv=none; b=Tb/dBisAi/x/2G0fJtAEoi4P0viVvw0t3zFWIIljcoVfgxBYnL/q09nDKu68SfdGIck+3bMRZto4Ip0LYgoxdtrf34R8zvjh/aaxqyl7ED+k1UW4sRljpNyZDpi8BF77F2JhXhXXVFk8qr7QZAJ+sZ8zU+z5KBxkQxdIEtyNsR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746520770; c=relaxed/simple;
	bh=OPR0Evmn++KRcwI31lWC7U2y2REm/22m1q0P89MPaIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ng+ssmQEF6de4MHbTEJ2M7VbUc3Mj70UCRnZNGQc8I8OTbtGfOOJAqt91Up/Z7HxL4+xAcusGo5K29NSYV1Kt2pTb6IX9EbyNlzQcK0DkO5VrjhbMpDtU4n3fOz1sq0uNkZie5Qlnf23QLWF5guVrsYaM+jERTuOmB4ycVad42k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 788B641C84;
	Tue,  6 May 2025 08:39:21 +0000 (UTC)
Message-ID: <d5da7382-5e11-4c35-b096-d888e16effd5@ghiti.fr>
Date: Tue, 6 May 2025 10:39:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: defconfig: Remove EXPERT
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Hal Feng <hal.feng@starfivetech.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20250415122832.982610-1-joel@jms.id.au>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250415122832.982610-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeefhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemheekvgdumehfvdgsgeemjegrledvmeefvdeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemheekvgdumehfvdgsgeemjegrledvmeefvdeltddphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemheekvgdumehfvdgsgeemjegrledvmeefvdeltdgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepledprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvr
 hesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohephhgrlhdrfhgvnhhgsehsthgrrhhfihhvvghtvggthhdrtghomhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr

Hi Joel,

First sorry for the late reply.

On 15/04/2025 14:28, Joel Stanley wrote:
> The setting of EXPERT is a leftover from when the riscv defconfig was
> first added. As mentioned in the EXPERT Kconfig help text it is not
> intended to be set in the usual case.
>
> Upon removal a bunch of intrusive debug-related kernel options are no
> longer set, which is good. A few may want to come back in the future but
> let those be advocated for on a case by case basis.


I disagree with that, debug options are here to help us so I would not 
remove them.

Let's stick to the initial purpose which was to set MEDIA_SUPPORT_FILTER.

Thanks,

Alex


>
> NAMESPACES, SYSFS_SYSCALL and MEDIA_SUPPORT_FILTER default on and thus
> fall out of the defconfig.
>
> Set VIDEO_CADENCE_CSI2RX=y to ensure VIDEO_CADENCE_CSI2RX stays enabled.
>
> Set DEBUG_KERNEL=y in line with other arch defconfigs. This turns on
> tracing.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> This supersedes https://lore.kernel.org/all/20250404062235.671872-1-joel@jms.id.au/
> as it is a fix for the root cause: by removing EXPERT causes
> MEDIA_SUPPORT_FILTER=y like most other defconfigs and thus the
> unwanted MEDIA drivers stay disabled.
>
> To view the change between the old .config and the new, use a recipe
> such as:
>
> make ARCH=riscv defconfig && cp .config config-before-removing-expert
> git am 0001-riscv-defconfig-Remove-EXPERT.patch
> make ARCH=riscv defconfig
> diff -up config-before-removing-expert .config | grep "^+\|^-" | grep CONFIG
>
> The output when run on v6.15-rc1:
>
> -# CONFIG_PREEMPT_RT is not set
> -CONFIG_PREEMPT_COUNT=y
> -# CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is not set
> -CONFIG_EXPERT=y
> +# CONFIG_EXPERT is not set
> -# CONFIG_SGETMASK_SYSCALL is not set
> -# CONFIG_SYSFS_SYSCALL is not set
> +CONFIG_SYSFS_SYSCALL=y
> -# CONFIG_BASE_SMALL is not set
> -# CONFIG_DEBUG_RSEQ is not set
> -# CONFIG_PC104 is not set
> +CONFIG_TRACEPOINTS=y
> -# CONFIG_SUSPEND_SKIP_SYNC is not set
> +CONFIG_UPROBES=y
> -CONFIG_UNINLINE_SPIN_UNLOCK=y
> +CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
> +CONFIG_INLINE_READ_UNLOCK=y
> +CONFIG_INLINE_READ_UNLOCK_IRQ=y
> +CONFIG_INLINE_WRITE_UNLOCK=y
> +CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
> -# CONFIG_SLUB_TINY is not set
> +# CONFIG_NET_DROP_MONITOR is not set
> -# CONFIG_PCIE_BUS_TUNE_OFF is not set
> -CONFIG_PCIE_BUS_DEFAULT=y
> -# CONFIG_PCIE_BUS_SAFE is not set
> -# CONFIG_PCIE_BUS_PERFORMANCE is not set
> -# CONFIG_PCIE_BUS_PEER2PEER is not set
> -# CONFIG_FIRMWARE_MEMMAP is not set
> -# CONFIG_INPUT_FF_MEMLESS is not set
> +CONFIG_INPUT_FF_MEMLESS=y
> -# CONFIG_TTY_PRINTK is not set
> -# CONFIG_GPIO_SYSFS is not set
> -# CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER is not set
> +CONFIG_MEDIA_HIDE_ANCILLARY_SUBDRV=y
> -# CONFIG_VIDEO_CS3308 is not set
> -# CONFIG_VIDEO_CS5345 is not set
> -# CONFIG_VIDEO_CS53L32A is not set
> -# CONFIG_VIDEO_MSP3400 is not set
> -# CONFIG_VIDEO_SONY_BTF_MPX is not set
> -# CONFIG_VIDEO_TDA1997X is not set
> -# CONFIG_VIDEO_TDA7432 is not set
> -# CONFIG_VIDEO_TDA9840 is not set
> -# CONFIG_VIDEO_TEA6415C is not set
> -# CONFIG_VIDEO_TEA6420 is not set
> -# CONFIG_VIDEO_TLV320AIC23B is not set
> -# CONFIG_VIDEO_TVAUDIO is not set
> -# CONFIG_VIDEO_UDA1342 is not set
> -# CONFIG_VIDEO_VP27SMPX is not set
> -# CONFIG_VIDEO_WM8739 is not set
> -# CONFIG_VIDEO_WM8775 is not set
> -# CONFIG_VIDEO_SAA6588 is not set
> -# CONFIG_VIDEO_ADV7180 is not set
> -# CONFIG_VIDEO_ADV7183 is not set
> -# CONFIG_VIDEO_ADV748X is not set
> -# CONFIG_VIDEO_ADV7604 is not set
> -# CONFIG_VIDEO_ADV7842 is not set
> -# CONFIG_VIDEO_BT819 is not set
> -# CONFIG_VIDEO_BT856 is not set
> -# CONFIG_VIDEO_BT866 is not set
> -# CONFIG_VIDEO_ISL7998X is not set
> -# CONFIG_VIDEO_LT6911UXE is not set
> -# CONFIG_VIDEO_KS0127 is not set
> -# CONFIG_VIDEO_MAX9286 is not set
> -# CONFIG_VIDEO_ML86V7667 is not set
> -# CONFIG_VIDEO_SAA7110 is not set
> -# CONFIG_VIDEO_SAA711X is not set
> -# CONFIG_VIDEO_TC358743 is not set
> -# CONFIG_VIDEO_TC358746 is not set
> -# CONFIG_VIDEO_TVP514X is not set
> -# CONFIG_VIDEO_TVP5150 is not set
> -# CONFIG_VIDEO_TVP7002 is not set
> -# CONFIG_VIDEO_TW2804 is not set
> -# CONFIG_VIDEO_TW9900 is not set
> -# CONFIG_VIDEO_TW9903 is not set
> -# CONFIG_VIDEO_TW9906 is not set
> -# CONFIG_VIDEO_TW9910 is not set
> -# CONFIG_VIDEO_VPX3220 is not set
> -# CONFIG_VIDEO_SAA717X is not set
> -# CONFIG_VIDEO_CX25840 is not set
> -# CONFIG_VIDEO_ADV7170 is not set
> -# CONFIG_VIDEO_ADV7175 is not set
> -# CONFIG_VIDEO_ADV7343 is not set
> -# CONFIG_VIDEO_ADV7393 is not set
> -# CONFIG_VIDEO_ADV7511 is not set
> -# CONFIG_VIDEO_AK881X is not set
> -# CONFIG_VIDEO_SAA7127 is not set
> -# CONFIG_VIDEO_SAA7185 is not set
> -# CONFIG_VIDEO_THS8200 is not set
> -# CONFIG_VIDEO_UPD64031A is not set
> -# CONFIG_VIDEO_UPD64083 is not set
> -# CONFIG_VIDEO_SAA6752HS is not set
> -# CONFIG_VIDEO_I2C is not set
> -# CONFIG_VIDEO_M52790 is not set
> -# CONFIG_VIDEO_ST_MIPID02 is not set
> -# CONFIG_VIDEO_THS7303 is not set
> -# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
> -# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
> -# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
> -# CONFIG_DRM_WERROR is not set
> -# CONFIG_HID_A4TECH is not set
> +CONFIG_HID_A4TECH=y
> -# CONFIG_HID_BELKIN is not set
> +CONFIG_HID_BELKIN=y
> -# CONFIG_HID_CHERRY is not set
> -# CONFIG_HID_CHICONY is not set
> +CONFIG_HID_CHERRY=y
> +CONFIG_HID_CHICONY=y
> -# CONFIG_HID_CYPRESS is not set
> +CONFIG_HID_CYPRESS=y
> -# CONFIG_HID_EZKEY is not set
> +CONFIG_HID_EZKEY=y
> -# CONFIG_HID_ITE is not set
> +CONFIG_HID_ITE=y
> -# CONFIG_HID_KENSINGTON is not set
> +CONFIG_HID_KENSINGTON=y
> -# CONFIG_HID_REDRAGON is not set
> -# CONFIG_HID_MICROSOFT is not set
> -# CONFIG_HID_MONTEREY is not set
> +CONFIG_HID_REDRAGON=y
> +CONFIG_HID_MICROSOFT=y
> +CONFIG_HID_MONTEREY=y
> +# CONFIG_QCOM_PMIC_PDCHARGER_ULOG is not set
> -CONFIG_LIST_HARDENED=y
> +# CONFIG_LIST_HARDENED is not set
> -# CONFIG_CPUMASK_OFFSTACK is not set
> -# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
> -# CONFIG_VMLINUX_MAP is not set
> -CONFIG_DEBUG_PAGEALLOC=y
> -# CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
> +# CONFIG_DEBUG_PAGEALLOC is not set
> +# CONFIG_DEBUG_PAGE_REF is not set
> -CONFIG_SCHED_STACK_END_CHECK=y
> +# CONFIG_SCHED_STACK_END_CHECK is not set
> -CONFIG_DEBUG_VM_IRQSOFF=y
> -CONFIG_DEBUG_VM=y
> -# CONFIG_DEBUG_VM_MAPLE_TREE is not set
> -# CONFIG_DEBUG_VM_RB is not set
> -CONFIG_DEBUG_VM_PGFLAGS=y
> -CONFIG_DEBUG_VM_PGTABLE=y
> +# CONFIG_DEBUG_VM is not set
> +# CONFIG_DEBUG_VM_PGTABLE is not set
> -CONFIG_DEBUG_PER_CPU_MAPS=y
> +# CONFIG_DEBUG_PER_CPU_MAPS is not set
> -CONFIG_LOCKUP_DETECTOR=y
> -CONFIG_SOFTLOCKUP_DETECTOR=y
> -# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> +# CONFIG_SOFTLOCKUP_DETECTOR is not set
> -CONFIG_DETECT_HUNG_TASK=y
> -CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
> -# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> -CONFIG_DETECT_HUNG_TASK_BLOCKER=y
> -CONFIG_WQ_WATCHDOG=y
> +# CONFIG_DETECT_HUNG_TASK is not set
> +# CONFIG_WQ_WATCHDOG is not set
> -CONFIG_DEBUG_RT_MUTEXES=y
> -CONFIG_DEBUG_SPINLOCK=y
> -CONFIG_DEBUG_MUTEXES=y
> +# CONFIG_DEBUG_RT_MUTEXES is not set
> +# CONFIG_DEBUG_SPINLOCK is not set
> +# CONFIG_DEBUG_MUTEXES is not set
> -CONFIG_DEBUG_RWSEMS=y
> +# CONFIG_DEBUG_RWSEMS is not set
> -CONFIG_DEBUG_ATOMIC_SLEEP=y
> +# CONFIG_DEBUG_ATOMIC_SLEEP is not set
> -CONFIG_DEBUG_LIST=y
> -CONFIG_DEBUG_PLIST=y
> -CONFIG_DEBUG_SG=y
> +# CONFIG_DEBUG_LIST is not set
> +# CONFIG_DEBUG_PLIST is not set
> +# CONFIG_DEBUG_SG is not set
> -# CONFIG_RCU_TRACE is not set
> -CONFIG_RCU_EQS_DEBUG=y
> +CONFIG_RCU_TRACE=y
> +# CONFIG_RCU_EQS_DEBUG is not set
> +CONFIG_NOP_TRACER=y
> +CONFIG_TRACE_CLOCK=y
> +CONFIG_RING_BUFFER=y
> +CONFIG_EVENT_TRACING=y
> +CONFIG_CONTEXT_SWITCH_TRACER=y
> +CONFIG_TRACING=y
> -# CONFIG_FTRACE is not set
> +CONFIG_FTRACE=y
> +# CONFIG_BOOTTIME_TRACING is not set
> +# CONFIG_FUNCTION_TRACER is not set
> +# CONFIG_STACK_TRACER is not set
> +# CONFIG_IRQSOFF_TRACER is not set
> +# CONFIG_SCHED_TRACER is not set
> +# CONFIG_HWLAT_TRACER is not set
> +# CONFIG_OSNOISE_TRACER is not set
> +# CONFIG_TIMERLAT_TRACER is not set
> +# CONFIG_ENABLE_DEFAULT_TRACERS is not set
> +# CONFIG_FTRACE_SYSCALLS is not set
> +# CONFIG_TRACER_SNAPSHOT is not set
> +CONFIG_BRANCH_PROFILE_NONE=y
> +# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> +# CONFIG_PROFILE_ALL_BRANCHES is not set
> +# CONFIG_BLK_DEV_IO_TRACE is not set
> +CONFIG_UPROBE_EVENTS=y
> +CONFIG_BPF_EVENTS=y
> +CONFIG_DYNAMIC_EVENTS=y
> +CONFIG_PROBE_EVENTS=y
> +# CONFIG_SYNTH_EVENTS is not set
> +# CONFIG_USER_EVENTS is not set
> +# CONFIG_TRACE_EVENT_INJECT is not set
> +# CONFIG_TRACEPOINT_BENCHMARK is not set
> +# CONFIG_RING_BUFFER_BENCHMARK is not set
> +# CONFIG_TRACE_EVAL_MAP_FILE is not set
> +# CONFIG_RING_BUFFER_STARTUP_TEST is not set
> +# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
> +# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
> +# CONFIG_RV is not set
>
>   arch/riscv/configs/defconfig | 24 ++----------------------
>   1 file changed, 2 insertions(+), 22 deletions(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 3c8e16d71e17..286f490ead37 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -18,12 +18,9 @@ CONFIG_CGROUP_DEVICE=y
>   CONFIG_CGROUP_CPUACCT=y
>   CONFIG_CGROUP_PERF=y
>   CONFIG_CGROUP_BPF=y
> -CONFIG_NAMESPACES=y
>   CONFIG_USER_NS=y
>   CONFIG_CHECKPOINT_RESTORE=y
>   CONFIG_BLK_DEV_INITRD=y
> -CONFIG_EXPERT=y
> -# CONFIG_SYSFS_SYSCALL is not set
>   CONFIG_PROFILING=y
>   CONFIG_ARCH_MICROCHIP=y
>   CONFIG_ARCH_SIFIVE=y
> @@ -181,6 +178,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
>   CONFIG_REGULATOR_AXP20X=y
>   CONFIG_REGULATOR_GPIO=y
>   CONFIG_MEDIA_SUPPORT=m
> +CONFIG_MEDIA_PLATFORM_SUPPORT=y
>   CONFIG_VIDEO_CADENCE_CSI2RX=m
>   CONFIG_DRM=m
>   CONFIG_DRM_RADEON=m
> @@ -294,25 +292,7 @@ CONFIG_DEFAULT_SECURITY_DAC=y
>   CONFIG_CRYPTO_USER_API_HASH=y
>   CONFIG_CRYPTO_DEV_VIRTIO=y
>   CONFIG_PRINTK_TIME=y
> +CONFIG_DEBUG_KERNEL=y
>   CONFIG_DEBUG_FS=y
> -CONFIG_DEBUG_PAGEALLOC=y
> -CONFIG_SCHED_STACK_END_CHECK=y
> -CONFIG_DEBUG_VM=y
> -CONFIG_DEBUG_VM_PGFLAGS=y
> -CONFIG_DEBUG_MEMORY_INIT=y
> -CONFIG_DEBUG_PER_CPU_MAPS=y
> -CONFIG_SOFTLOCKUP_DETECTOR=y
> -CONFIG_WQ_WATCHDOG=y
> -CONFIG_DEBUG_RT_MUTEXES=y
> -CONFIG_DEBUG_SPINLOCK=y
> -CONFIG_DEBUG_MUTEXES=y
> -CONFIG_DEBUG_RWSEMS=y
> -CONFIG_DEBUG_ATOMIC_SLEEP=y
> -CONFIG_DEBUG_LIST=y
> -CONFIG_DEBUG_PLIST=y
> -CONFIG_DEBUG_SG=y
> -# CONFIG_RCU_TRACE is not set
> -CONFIG_RCU_EQS_DEBUG=y
> -# CONFIG_FTRACE is not set
>   # CONFIG_RUNTIME_TESTING_MENU is not set
>   CONFIG_MEMTEST=y
