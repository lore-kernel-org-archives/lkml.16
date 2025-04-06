Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0047D1F94A
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743967763; cv=none; b=qXNNLRy+QIyxmP7c9k4VbqwWPnm7QayARIcivsYxwZLjVDfng6YT5OC9b9MotzFhHHJJ0i+cMJFKFXyaWX4/7fCWnVgxTme77JB1uj2QwljRFJQK57rT7LO/1MiU3IHi2olrxoKG/CVPnaBjzpxd6uQvWAfXPGnS/Z7jG5/rEJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743967763; c=relaxed/simple;
	bh=jDi+HIOpbawWC7qilkpTXhiYekhAaJKSeE8mmCpFSrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5Hix0DFRPezRTR4iPOqGXpxOYGuptuVeOs8YvaSWG2/ZWTA/IPGOjmGFooUjmDSa8VbLcPJU1dsmXgePKKuPqzCtvuBjD6YY2AEejqtxKp0E+e4jiZ59DCpyjopPNHVRFELTRyPSBiGwBr1CIBgLNyNfqCrOp2hlfj3+b/1wNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=slFIDz1v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="slFIDz1v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D023C4CEE3;
	Sun,  6 Apr 2025 19:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743967762;
	bh=jDi+HIOpbawWC7qilkpTXhiYekhAaJKSeE8mmCpFSrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=slFIDz1vbs0vmYwwLtt/dSjrADAYMRtWPtDHQ1pPWdAVcRgyaoHtIXSP9EHMZ1F7X
	 bfOaRKSfMc6uVyWiu1z6AKySIbMJ8NDQPjZtu+L+PppbOMVouvQe5YBd9dnxCcW2Td
	 1EZpNdWaxYjNpewMLe0Gt0pvIfvbNCF3VU2J3CV+fJus/lgxDC/S09ErUzyTExQQqo
	 hvmn+v+vRYrzsPn7qjhgYMizf6E5YZkrrDIVqt+twDHLFj4S8wuIr44rdwHXWcxx6j
	 RUFBSJl994fLp7XF1FR+XSI8UwUd6OCGSoKJ5mf4NIL/0l84G+7l87KIcWzBcuMisV
	 mS8Gf6fZXClrA==
Date: Sun, 6 Apr 2025 12:29:19 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] objtool: Fix SYSCALL instruction handling and
 INSN_CONTEXT_SWITCH
Message-ID: <txsy3gkg5h5rdy3iy557ibk3tztpoxfszl7cxobzr4zhvgys2r@svmjohvqrknn>
References: <9b23e4413873bee38961e628b0c73f6d3a26d494.1743799705.git.jpoimboe@kernel.org>
 <Z_K83hCo-IgEHvM_@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z_K83hCo-IgEHvM_@gmail.com>

On Sun, Apr 06, 2025 at 07:41:50PM +0200, Ingo Molnar wrote:
> * Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > The !CONFIG_IA32_EMULATION version of xen_entry_SYSCALL_compat() ends
> > with a SYSCALL instruction.  In Xen, SYSCALL is a hypercall.  Usually
> > that would return, but in this case it's a hypercall to IRET, which
> > doesn't return.
> > 
> > Objtool doesn't know that, so it falls through to the next function,
> > triggering a false positive:
> > 
> >   vmlinux.o: warning: objtool: xen_reschedule_interrupt+0x2a: RET before UNTRAIN
> > 
> > Fix that by adding UD2 after the SYSCALL to avoid the undefined behavior
> > and prevent the objtool fallthrough, and teach validate_unret() to stop
> > control flow on the UD2 like validate_branch() already does.
> > 
> > Unfortunately that's not the whole story.  While that works for
> > validate_unret(), it breaks validate_branch() which terminates control
> > flow after the SYSCALL, triggering an unreachable instruction warning on
> > the UD2.
> > 
> > The real problem here is that INSN_CONTEXT_SWITCH is ambiguous.  It can
> > represent both call semantics (SYSCALL, SYSENTER) and return semantics
> > (SYSRET, IRET, RETS, RETU).  Those differ significantly: calls preserve
> > control flow whereas returns terminate it.
> > 
> > validate_branch() uses an arbitrary rule for INSN_CONTEXT_SWITCH that
> > almost works by accident: if in a function, keep going; otherwise stop.
> > It should instead be based on the semantics of the underlying
> > instruction.
> > 
> > INSN_CONTEXT_SWITCH's original purpose was to enable the "unsupported
> > instruction in callable function" warning.  But that warning really has
> > no reason to exist.  It has never found any bugs, and those instructions
> > are only in entry code anyway.  So just get rid of it.
> > 
> > That in turn allows objtool to stop caring about SYSCALL or SYSENTER.
> > Their call semantic means they usually don't affect control flow in the
> > containing function/code, and can just be INSN_OTHER.  The far
> > returns/jumps can also be ignored as those aren't used anywhere.
> > 
> > With SYSCALL and SYSENTER removed, INSN_CONTEXT_SWITCH now has a sane
> > well-defined return semantic.  Rename it to INSN_EXCEPTION_RETURN to
> > better reflect its meaning.
> 
> I think this should be split up into a series of ~3 patches. :-/

Yeah, you're probably right.  Let me see how I can split that up.

-- 
Josh
