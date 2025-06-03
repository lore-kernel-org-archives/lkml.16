Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32288280337
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943885; cv=none; b=pAbY8ElZWo9LK1L1ptjtsrXqcuY1GOA5zqpCShpj+QcuFUhW7QS3jv8cdaEov3hD/CDuKGNbA3hGPaeXH/PmgvK9Dimdij5q09bF7giESKNnfxDsv+W270SWbKqa4Ocg5Ib32heTzSeBStpvpckl0tk7QtDh/v+U5peS4uw90H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943885; c=relaxed/simple;
	bh=blskJ2FjJwEJPN7safgtQTCZY8u74F0u49MfXay3a1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWMl5ahqGC1LT/KpxJBrJKDp9KjClFPBXpCbdQhnoJT8gOP+Zx2dntewnxIcYv6p0NWarzVVnwO8UnNDlAEWJDz2BPp3Et/+R874IUJsgrpUVbVsIZ5hPFvyYeeMWSzOrwjoNGw5vA8q61HyMh5kmU5mbDQNqKHu95RbCQ5yfCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BA5312FC;
	Tue,  3 Jun 2025 02:44:25 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 013613F5A1;
	Tue,  3 Jun 2025 02:44:39 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:44:35 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
	geert@linux-m68k.org, broonie@kernel.org, mcgrof@kernel.org,
	joey.gouly@arm.com, kristina.martsenko@arm.com, rppt@kernel.org,
	pcc@google.com, bigeasy@linutronix.de, ptosi@google.com,
	james.morse@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ada.coupriediaz@arm.com
Subject: Re: [PATCH] arm64/trap: fix broken ct->nmi_nesting when die() is
 called in a kthread
Message-ID: <aD7EA2Bmp-mrWZaN@J2N7QTR9R3.cambridge.arm.com>
References: <20250530092723.3307630-1-yeoreum.yun@arm.com>
 <20250602124738.GD1227@willie-the-truck>
 <aD27GxSWsFekORcy@e129823.arm.com>
 <aD2_Jp7CQgnp15Kx@J2N7QTR9R3>
 <aD3kfTx8sF8/Yar/@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD3kfTx8sF8/Yar/@e129823.arm.com>

On Mon, Jun 02, 2025 at 06:50:53PM +0100, Yeoreum Yun wrote:
> > One of the reasons we treak BRK as an NMI is that exception entry for
> > BRK will leave all DAIF bits set, whereas schedule() should be called
> > with debug and SError unmasked (but IRQ+FIQ masked). Generally, calling
> > ct_nmi_enter() prevents preemption (and hence calls to schedule()).
> 
> I think ct_nmi_enter() doesn't prevents preemption but
> debug_exception_enter() disables preemption.

Yep, sorry for the confusion there. I had erroneously pattern-matched on
the nmi_nesting values and I had confused that with the similar
manipulation of the preempt count.

> > Another is that we may have a BUG() or WARN() in entry code where the
> > task could be in an inconsistent state, and we need to treat the
> > exception like an NMI to avoid consuming that inconsistent state.
> 
> So, let's think the "inconsistent" state like:
>   -> el0_enter()
> 	  -> enter_from_user_mode()
> 		  -> before update ct_state (context_tracking.state), call BUG()/WARN()
> 			  -> el1_dbg()
> 
> It need to call ct_nmi_enter() in el1_dbg() right?

Yes. The critical things are that RCU may not be watching, and all other
entry accounting may be in an intermediate/inconsistent state, since the
BUG()/WARN() could be anywhere in that C code. Currently that means we
must call ct_nmi_enter().

The other problem to bear in mind is that we don't have a way to
distinguish these BUG()/WARN() cases from others throughout the kernel,
which is why we currently unconditionally treat this as an NMI entry.

> > To handle that properly, we need to:
> >
> > (a) Figure out what to do with entry code. Last I looked I was under the
> >     impression that x86 either didn't have a problem here, or simply
> >     ignored it.
> 
> TBH, in above case, x86 seems context_traking.state will be broken...

That's certainly possible, that was the impression I had last time I
looked, but I haven't looked at this in detail for a short while, and I
may have missed something.

> > (b) Handle BUG/WARN traps separately from other BRKs, such that we can
> >     use local_daif_inherit(), and treat this as a special function call
> >     rather than an NMI.
> >
> > (c) Somehow teach make_task_dead() to handle the case where DAIF.D
> >     and/or DAIF.A are set. Most likely we simply have to panic() here,
> >     as with BUG() in interrupt context.
> 
> Right... It should handle for DAIF.D and DAIF.A bits...

Yes.

[...]

> > As-is, I think an extra warning in the case of a BUG() is fine given
> > the larger functional issues.
> >
> > I do not think this patch is correct as-is.
> 
> So, what I think:
>   1. arm64_enter_el1_dbg() should ct_nmi_enter() as it is.
>   2. in bug_handler() while handling BUG_TYPE, add above ct_nmi_exit()
>      conditional call.
>   3. DAIF.D and DAIF.A handling.

No, that is not safe. In step 2, calling ct_nmi_exit() would undo *all*
of the ct_nmi_enter() logic, and may stop RCU from watching if the
exception was entered from some intermediate/inconsistent state.

If we want to change anything now, it should be the DAIF.DA handling,
but even for that I'm not sure what the best approach is, and that'll
require some changes to core code.

Please leave this as-if for now.

Mark.
