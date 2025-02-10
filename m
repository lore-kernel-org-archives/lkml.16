Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE1417BB6
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190628; cv=none; b=j0GIsHmrd9R49kURY9JtM5XH/AE9ppq8sZlS+r97zwmGfOl1aMsc4VKAxGQRXaBaPQhUWtxXY6lLc5jNneHEFGi7H79I/YUntawFrHBUqpbNxANHEhscM/QIsNj9k3ujIrIyPPQ/eal92+1aVi4gBoFHEpV4KDZBkn5Xf/04VuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190628; c=relaxed/simple;
	bh=218uK2aOa7OjlahlmQYbEW3aMaS47kIhfyibDh7XCRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwRl4OSH70C3zZWFBgafWSrUZy/0LA0O1dIHa8bwf89oW2i1zIVCIkzFxR6I7Fvr4qjBHRzCQ8yOmO9GR06D9qViqjsu7QLqUfUVjxegpWm6EugemVhXnPzyxCF1dxDlMOWie2h25psh+vtek1leOpD3iD/sWgofGXkjYWJkcqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2C461BA8;
	Mon, 10 Feb 2025 04:30:47 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A03C3F5A1;
	Mon, 10 Feb 2025 04:30:19 -0800 (PST)
Date: Mon, 10 Feb 2025 12:30:16 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
	sstabellini@kernel.org, tglx@linutronix.de, peterz@infradead.org,
	luto@kernel.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kees@kernel.org, wad@chromium.org,
	akpm@linux-foundation.org, samitolvanen@google.com,
	masahiroy@kernel.org, hca@linux.ibm.com, aliceryhl@google.com,
	rppt@kernel.org, xur@google.com, paulmck@kernel.org, arnd@arndb.de,
	mbenes@suse.cz, puranjay@kernel.org, pcc@google.com,
	ardb@kernel.org, sudeep.holla@arm.com, guohanjun@huawei.com,
	rafael@kernel.org, liuwei09@cestc.cn, dwmw@amazon.co.uk,
	Jonathan.Cameron@huawei.com, liaochang1@huawei.com,
	kristina.martsenko@arm.com, ptosi@google.com, broonie@kernel.org,
	thiago.bauermann@linaro.org, kevin.brodsky@arm.com,
	joey.gouly@arm.com, liuyuntao12@huawei.com, leobras@redhat.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v5 00/22] arm64: entry: Convert to generic entry
Message-ID: <Z6nxWM8cnhd32yfW@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <c34ebe3f-b78a-1a17-0c6a-48d3874f8be9@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c34ebe3f-b78a-1a17-0c6a-48d3874f8be9@huawei.com>

On Sat, Feb 08, 2025 at 09:15:08AM +0800, Jinjie Ruan wrote:
> On 2024/12/6 18:17, Jinjie Ruan wrote:
> > Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
> > to use the generic entry infrastructure from kernel/entry/*. The generic
> > entry makes maintainers' work easier and codes more elegant, which aslo
> > removed a lot of duplicate code.
> > 
> > The main steps are as follows:
> > - Make arm64 easier to use irqentry_enter/exit().
> > - Make arm64 closer to the PREEMPT_DYNAMIC code of generic entry.
> > - Split generic entry into generic irq entry and generic syscall to
> >   make the single patch more concentrated in switching to one thing.
> > - Switch to generic irq entry.
> > - Make arm64 closer to the generic syscall code.
> > - Switch to generic entry completely.
> > 
> > Changes in v5:
> > - Not change arm32 and keep inerrupts_enabled() macro for gicv3 driver.
> > - Move irqentry_state definition into arch/arm64/kernel/entry-common.c.
> > - Avoid removing the __enter_from_*() and __exit_to_*() wrappers.
> > - Update "irqentry_state_t ret/irq_state" to "state"
> >   to keep it consistently.
> > - Use generic irq entry header for PREEMPT_DYNAMIC after split
> >   the generic entry.
> > - Also refactor the ARM64 syscall code.
> > - Introduce arch_ptrace_report_syscall_entry/exit(), instead of
> >   arch_pre/post_report_syscall_entry/exit() to simplify code.
> > - Make the syscall patches clear separation.
> > - Update the commit message.
> 
> Gentle Ping.

I've left soem comments.

As I mentioned previously, I'd very much prefer that we do the syscall
entry logic changes *later* (i.e. as a follow-up patch series), after
we've got the irq/exception entry logic sorted.

I reckon we've got just enough time to get the irq/exception entry
changes ready this cycle, with another round or two of review. So can we
please put the syscall bits aside for now? ... that and run all the
tests you mention in patch 22 on the irq/exception entry changes alone.

Mark.
