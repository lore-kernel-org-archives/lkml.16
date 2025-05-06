Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED2B27A47B
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531050; cv=none; b=ZGFxVlTl2qmM1+J4PQ8gndzCEHe0WhXhpcH73bEAAk74Tf+oV5Iucntjrbkk3uLZwYHin/JO6/V0FI6TthevG1IXqrnUI4nfwc8LnKZgyb8CoysmY8eTKht2E0YRKhSNlgBQRjqf4EVVM5ZS1GgLpgTfPtUEFb+qduJdg2j6yjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531050; c=relaxed/simple;
	bh=q98xqKFjGRMzO5Pe32WV61ovibF1PADIdgxopkEP380=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgiFIHoPpYVddSksCqLsesMExCB7+/LyTLB3RTiYVXG97wcxNaXRxczY5zXMz9mUDcqBlwHUvK5BnGuSpv80906lnHVUA+wMG+0uXmiNQGPyLLj1V/Ayq9L7vpkHF117egdN0ynMgR8ewQhW6AUgXUYT3gcmtN8MZBTaqaWO/vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=am/AWlqN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="am/AWlqN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4341DC4CEE4;
	Tue,  6 May 2025 11:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746531049;
	bh=q98xqKFjGRMzO5Pe32WV61ovibF1PADIdgxopkEP380=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=am/AWlqNbEyJuJTD24FvaXXq08TODUoGJ5rRXLpCVVlavHEwnmcYFhvWO1oJ5chk5
	 kYckhs5HB9PK13QrMFaePzb12NxrNZGCGrSoqwcnxa3XMSSihUfsUM6/BtBdI5nkLD
	 n4cDBFaa6KnMkuntQtYgVT2OvYWaPympSCYKM4NsTapn71/Y0lLrmsABZu3Om3SsWc
	 FoaBQGsG/Hwc60yY8G34JfusPridzafAbw2mebHK/gspE8+Qc64QbihcBEE3pJivLT
	 xD2wV2BA5Qu51pEHzXC3LGPprT79Rbumna7vMZ6D7UHkFC/XPRSG+v2cAiFAYFenoB
	 OXfplBHzQ8eYA==
Date: Tue, 6 May 2025 13:30:46 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 00/15] x86/kconfig: Enable various kernel features in the
 defconfig, add the 'x86_32' subarchitecture build target and misc cleanups
Message-ID: <aBny5oqNWTZS6xkH@gmail.com>
References: <20250505110946.1095363-1-mingo@kernel.org>
 <20250506074500.GI4198@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506074500.GI4198@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> One thing I'd been pondering for a while, but have absolutely no 
> bandwidth for what so ever, is a more fragment based config setup.
> 
> Much like we now have defconfig, kvm_guest.config, debug.config and 
> xen.config etc..
> 
> My main 'complain' is more that defconfig is too fat already, and 
> here you are making it fatter still -- notably, I don't need i915 in 
> most of the kernels I build (my test machines are all headless).
> 
> Could we not instead move things out into fragments, so that people 
> can compose the bits they need?
> 
> The other day, I was looking for a kvm_host.config fragment, to pair 
> with the kvm_guest.config we do have.
> 
> Similarly, all that UBSAN, MM and assorted debug cruft is already in 
> debug.config (although I do think debug.config is *too* heavy).

Yeah, so I don't disagree with the 'fragment' approach in principle, 
although I don't have the bandwidth either right now. :)

I do have a 'fulldebug' 'fragment' myself, enabled externally via a 
script that uses the 'scripts/config -e' flag to enable individual 
options:

	DYNAMIC_DEBUG=y
	DYNAMIC_DEBUG_CORE=y
	SYMBOLIC_ERRNAME=y
	DEBUG_BUGVERBOSE=y
	DEBUG_KERNEL=y
	DEBUG_MISC=y
	AS_HAS_NON_CONST_ULEB128=y
	DEBUG_INFO_COMPRESSED_NONE=y
	PAHOLE_HAS_SPLIT_BTF=y
	PAHOLE_HAS_LANG_EXCLUDE=y
	GDB_SCRIPTS=y
	SECTION_MISMATCH_WARN_ONLY=y
	OBJTOOL=y
	NOINSTR_VALIDATION=y
	MAGIC_SYSRQ=y
	MAGIC_SYSRQ_SERIAL=y
	DEBUG_FS=y
	DEBUG_FS_ALLOW_ALL=y
	HAVE_ARCH_KGDB=y
	KGDB=y
	KGDB_HONOUR_BLOCKLIST=y
	KGDB_SERIAL_CONSOLE=y
	KGDB_LOW_LEVEL_TRAP=y
	KGDB_KDB=y
	KDB_KEYBOARD=y
	ARCH_HAS_EARLY_DEBUG=y
	ARCH_HAS_UBSAN=y
	HAVE_ARCH_KCSAN=y
	HAVE_KCSAN_COMPILER=y
	PAGE_EXTENSION=y
	SLUB_DEBUG=y
	PAGE_TABLE_CHECK=y
	PAGE_TABLE_CHECK_ENFORCED=y
	PAGE_POISONING=y
	ARCH_HAS_DEBUG_WX=y
	DEBUG_WX=y
	ARCH_HAS_PTDUMP=y
	PTDUMP=y
	HAVE_DEBUG_KMEMLEAK=y
	SCHED_STACK_END_CHECK=y
	ARCH_HAS_DEBUG_VM_PGTABLE=y
	DEBUG_VM_IRQSOFF=y
	DEBUG_VM=y
	DEBUG_VM_MAPLE_TREE=y
	DEBUG_VM_RB=y
	DEBUG_VM_PGFLAGS=y
	DEBUG_VM_PGTABLE=y
	ARCH_HAS_DEBUG_VIRTUAL=y
	DEBUG_VIRTUAL=y
	DEBUG_MEMORY_INIT=y
	DEBUG_PER_CPU_MAPS=y
	ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
	HAVE_ARCH_KASAN=y
	HAVE_ARCH_KASAN_VMALLOC=y
	CC_HAS_KASAN_GENERIC=y
	CC_HAS_KASAN_SW_TAGS=y
	CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
	HAVE_ARCH_KFENCE=y
	KFENCE=y
	HAVE_ARCH_KMSAN=y
	LOCKUP_DETECTOR=y
	SOFTLOCKUP_DETECTOR=y
	HAVE_HARDLOCKUP_DETECTOR_BUDDY=y
	HARDLOCKUP_DETECTOR=y
	HARDLOCKUP_DETECTOR_PERF=y
	HARDLOCKUP_DETECTOR_COUNTS_HRTIMER=y
	HARDLOCKUP_CHECK_TIMESTAMP=y
	DETECT_HUNG_TASK=y
	DETECT_HUNG_TASK_BLOCKER=y
	WQ_CPU_INTENSIVE_REPORT=y
	SCHED_INFO=y
	SCHEDSTATS=y
	DEBUG_PREEMPT=y
	LOCK_DEBUGGING_SUPPORT=y
	PROVE_LOCKING=y
	PROVE_RAW_LOCK_NESTING=y
	LOCK_STAT=y
	DEBUG_RT_MUTEXES=y
	DEBUG_SPINLOCK=y
	DEBUG_MUTEXES=y
	DEBUG_WW_MUTEX_SLOWPATH=y
	DEBUG_RWSEMS=y
	DEBUG_LOCK_ALLOC=y
	LOCKDEP=y
	DEBUG_LOCKDEP=y
	DEBUG_ATOMIC_SLEEP=y
	DEBUG_LOCKING_API_SELFTESTS=y
	CSD_LOCK_WAIT_DEBUG=y
	CSD_LOCK_WAIT_DEBUG_DEFAULT=y
	TRACE_IRQFLAGS=y
	TRACE_IRQFLAGS_NMI=y
	NMI_CHECK_CPU=y
	DEBUG_IRQFLAGS=y
	STACKTRACE=y
	DEBUG_LIST=y
	DEBUG_PLIST=y
	DEBUG_SG=y
	DEBUG_NOTIFIERS=y
	DEBUG_MAPLE_TREE=y
	PROVE_RCU=y
	RCU_CPU_STALL_CPUTIME=y
	USER_STACKTRACE_SUPPORT=y
	NOP_TRACER=y
	HAVE_RETHOOK=y
	RETHOOK=y
	HAVE_FUNCTION_TRACER=y
	HAVE_FUNCTION_GRAPH_TRACER=y
	HAVE_FUNCTION_GRAPH_FREGS=y
	HAVE_FTRACE_GRAPH_FUNC=y
	HAVE_DYNAMIC_FTRACE=y
	HAVE_DYNAMIC_FTRACE_WITH_REGS=y
	HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
	HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
	HAVE_FTRACE_REGS_HAVING_PT_REGS=y
	HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
	HAVE_FTRACE_MCOUNT_RECORD=y
	HAVE_SYSCALL_TRACEPOINTS=y
	HAVE_FENTRY=y
	HAVE_OBJTOOL_MCOUNT=y
	HAVE_OBJTOOL_NOP_MCOUNT=y
	HAVE_C_RECORDMCOUNT=y
	HAVE_BUILDTIME_MCOUNT_SORT=y
	BUILDTIME_MCOUNT_SORT=y
	TRACER_MAX_TRACE=y
	TRACE_CLOCK=y
	RING_BUFFER=y
	EVENT_TRACING=y
	CONTEXT_SWITCH_TRACER=y
	PREEMPTIRQ_TRACEPOINTS=y
	TRACING=y
	GENERIC_TRACER=y
	TRACING_SUPPORT=y
	FTRACE=y
	BOOTTIME_TRACING=y
	FUNCTION_TRACER=y
	FUNCTION_GRAPH_TRACER=y
	FUNCTION_GRAPH_RETVAL=y
	DYNAMIC_FTRACE=y
	DYNAMIC_FTRACE_WITH_REGS=y
	DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
	DYNAMIC_FTRACE_WITH_ARGS=y
	FPROBE=y
	FUNCTION_PROFILER=y
	STACK_TRACER=y
	SCHED_TRACER=y
	HWLAT_TRACER=y
	OSNOISE_TRACER=y
	TIMERLAT_TRACER=y
	MMIOTRACE=y
	FTRACE_SYSCALLS=y
	TRACER_SNAPSHOT=y
	BRANCH_PROFILE_NONE=y
	BLK_DEV_IO_TRACE=y
	FPROBE_EVENTS=y
	KPROBE_EVENTS=y
	UPROBE_EVENTS=y
	DYNAMIC_EVENTS=y
	PROBE_EVENTS=y
	FTRACE_MCOUNT_RECORD=y
	FTRACE_MCOUNT_USE_CC=y
	TRACING_MAP=y
	SYNTH_EVENTS=y
	USER_EVENTS=y
	HIST_TRIGGERS=y
	TRACE_EVENT_INJECT=y
	DA_MON_EVENTS=y
	DA_MON_EVENTS_ID=y
	RV=y
	RV_MON_WWNR=y
	RV_REACTORS=y
	RV_REACT_PRINTK=y
	RV_REACT_PANIC=y
	SAMPLES=y
	HAVE_SAMPLE_FTRACE_DIRECT=y
	HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
	ARCH_HAS_DEVMEM_IS_ALLOWED=y
	STRICT_DEVMEM=y
	EARLY_PRINTK_USB=y
	EARLY_PRINTK=y
	EARLY_PRINTK_DBGP=y
	EARLY_PRINTK_USB_XDBC=y
	HAVE_MMIOTRACE_SUPPORT=y
	IO_DELAY_0XED=y
	DEBUG_ENTRY=y
	X86_DEBUG_FPU=y
	UNWINDER_ORC=y
	FUNCTION_ERROR_INJECTION=y
	ARCH_HAS_KCOV=y
	CC_HAS_SANCOV_TRACE_PC=y
	RUNTIME_TESTING_MENU=y
	ARCH_USE_MEMTEST=y
	MEMTEST=y

These are all the debug options that don't reasult in an unusable 
kernel (such as they don't spam the syslog, etc.).

Also note that the goal of 'defconfig' is to provide something that is 
relevant to 99.9% of our users: ie. something reasonably close to what 
actual Linux distributions in the field are using, minus (most) driver 
noise. Ie. in a way it's the 'community default' in essence, following 
the choices of the wider kernel community that end up being used by the 
majority of our users, with judgement calls when an option isn't 
universally enabled.

Thanks,

	Ingo
