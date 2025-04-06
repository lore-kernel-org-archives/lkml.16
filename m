Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F7B198E9B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 17:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743961316; cv=none; b=UOpqQeL10NiIsnjN0qVT/hoK+yKEwYgWxMmTxFp4xZ0sJWBqV2eMOQcV3B+Zqa1mokzL2uK+7cq4TRzDZKHGqVUjFOV8hIRtJR1VL+QnCOMIDkiUZziIupf2uil2exPZdJC9nyw4bzGeBmJaawHPf4jCRXN7skTbEd8GLhoDEz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743961316; c=relaxed/simple;
	bh=GQJQOcyzkHyEyDoT+1KpK14lt8QAJdaIBs+Grx9wHRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgBBlxsyihRi03AcdVsj2LeqZn0c7ns5QHP/ZGViGNQRZekg4uEgHTOjY/I4PmwSN5hJ9eHxfuV07v309QTA9Va+mjE42n9YiXNyTXxzjzfUwA7LTG/QPNfpU96ctRM8U3u6hLp72Z25T+5IRAUNjRsO1A4PfSA1atZCaOHr3G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqtFoqMB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqtFoqMB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE45DC4CEE7;
	Sun,  6 Apr 2025 17:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743961314;
	bh=GQJQOcyzkHyEyDoT+1KpK14lt8QAJdaIBs+Grx9wHRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqtFoqMBTy70cj4DBA77pPwLU9WirYaKswJUtkSkbLkBPGqgv3+Sy6JVb2BTNoR7G
	 eHE4BGM2/OaS/iWpHgDd337MbfIGAi17tehatsd8BQRJAgKR0FbBfDblibIBF+PK34
	 BEIcS39+H55gKn7qqBQ3xRb50EEirUFRD1LN04nz3vHYpCcibNJ97Fmz/cWBqufPEk
	 zj68vP1gFa2aUtJxVJoGL9vJawPSP7tC8uDzPWLhXp9aHtzWlV0LVGgIIinaK/kOL9
	 offKrEhUSWU6fqrBDf4emyEjkHqAOYDmNMiktCk6VOvUaYISpXBbg4FI8i8KVNX/kX
	 aVGbKHj/tuRjg==
Date: Sun, 6 Apr 2025 19:41:50 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] objtool: Fix SYSCALL instruction handling and
 INSN_CONTEXT_SWITCH
Message-ID: <Z_K83hCo-IgEHvM_@gmail.com>
References: <9b23e4413873bee38961e628b0c73f6d3a26d494.1743799705.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b23e4413873bee38961e628b0c73f6d3a26d494.1743799705.git.jpoimboe@kernel.org>


* Josh Poimboeuf <jpoimboe@kernel.org> wrote:

> The !CONFIG_IA32_EMULATION version of xen_entry_SYSCALL_compat() ends
> with a SYSCALL instruction.  In Xen, SYSCALL is a hypercall.  Usually
> that would return, but in this case it's a hypercall to IRET, which
> doesn't return.
> 
> Objtool doesn't know that, so it falls through to the next function,
> triggering a false positive:
> 
>   vmlinux.o: warning: objtool: xen_reschedule_interrupt+0x2a: RET before UNTRAIN
> 
> Fix that by adding UD2 after the SYSCALL to avoid the undefined behavior
> and prevent the objtool fallthrough, and teach validate_unret() to stop
> control flow on the UD2 like validate_branch() already does.
> 
> Unfortunately that's not the whole story.  While that works for
> validate_unret(), it breaks validate_branch() which terminates control
> flow after the SYSCALL, triggering an unreachable instruction warning on
> the UD2.
> 
> The real problem here is that INSN_CONTEXT_SWITCH is ambiguous.  It can
> represent both call semantics (SYSCALL, SYSENTER) and return semantics
> (SYSRET, IRET, RETS, RETU).  Those differ significantly: calls preserve
> control flow whereas returns terminate it.
> 
> validate_branch() uses an arbitrary rule for INSN_CONTEXT_SWITCH that
> almost works by accident: if in a function, keep going; otherwise stop.
> It should instead be based on the semantics of the underlying
> instruction.
> 
> INSN_CONTEXT_SWITCH's original purpose was to enable the "unsupported
> instruction in callable function" warning.  But that warning really has
> no reason to exist.  It has never found any bugs, and those instructions
> are only in entry code anyway.  So just get rid of it.
> 
> That in turn allows objtool to stop caring about SYSCALL or SYSENTER.
> Their call semantic means they usually don't affect control flow in the
> containing function/code, and can just be INSN_OTHER.  The far
> returns/jumps can also be ignored as those aren't used anywhere.
> 
> With SYSCALL and SYSENTER removed, INSN_CONTEXT_SWITCH now has a sane
> well-defined return semantic.  Rename it to INSN_EXCEPTION_RETURN to
> better reflect its meaning.

I think this should be split up into a series of ~3 patches. :-/

Thanks,

	Ingo
