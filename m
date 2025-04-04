Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA226433CB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743778924; cv=none; b=HFrP6foddWTsLU+WjRHN+nkpgL4YVIWMSm+4eHoh2eev2b697hyY973FBeUMi9SBnNVFPj9n2eb0A0An7y9VMhQQAdLdTm6JJ++SDMV2bHt3Zybrz9U+K6Skz02kCtbSxXEtoM4kw1G2lcBgOuk5KfTrm4iyPYPERlkT/ebwCRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743778924; c=relaxed/simple;
	bh=CqbyQtUPKRAX/H+qLjNgGz4FAFiDQpzZKr4w2dtfToY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXfCe9Q8zRDPhpsS+wM3XaxyYabxQGCWXX3DzKBoWh7Eqrr/vT0VRaKLJ9we9Q4eZaz+R9h/zqKx0AuW0hq3e4iu9HCA8RVJFarK+6OcMbTriDo3m6w8DqQH/vSdAro2/OpCE46hb+5Ku2qsN6vCodcBu563HsWpSqtFgGSKllQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOi0tukl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOi0tukl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F0BC4CEDD;
	Fri,  4 Apr 2025 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743778924;
	bh=CqbyQtUPKRAX/H+qLjNgGz4FAFiDQpzZKr4w2dtfToY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YOi0tuklxiT8dLuaH7v5rUvr8BU+/wU/VUrJ3untWftHxLGE/F6kPkXADLaXQnBCm
	 kOXf3aZOr8naLVi62VaAvJd5TlLUc7O6Um3tXm90buZV6You3om617CDVW/U2eJB5U
	 7C+7VS+zdx72lG2QI5WAEtaUf8+QSW0DK7PFUBY5r13SgrJUmpYTHWimdYiadRNBcU
	 7+UJC0J1VsW2sP7KLE6ybQocXbjsjfJLe24HJWnWePiqvnl+5A6lceHqp0AFD3bDBq
	 ZP+sigDeSRsP29Wow7QorEXw2dQ3FckXcwCCS2pPs8eIOGhv5R2GN4clbAf0jg+FjU
	 BIC89ZYkrMFcQ==
Date: Fri, 4 Apr 2025 08:02:01 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] objtool: Fix SYSCALL instruction handling and
 INSN_CONTEXT_SWITCH
Message-ID: <hb5qpz6aujuwy3eence2iuswyas5bqb4azxwcz6benvg6755wb@bmpye6gqwpyj>
References: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>
 <20250404104938.GO25239@noisy.programming.kicks-ass.net>
 <iqalk74mk6onmntltkpodnbtp7zxxgx3u3ycuipmkizcmz7uvm@b7j7kubwzpl6>
 <20250404145412.GP25239@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404145412.GP25239@noisy.programming.kicks-ass.net>

On Fri, Apr 04, 2025 at 04:54:12PM +0200, Peter Zijlstra wrote:
> On Fri, Apr 04, 2025 at 07:46:52AM -0700, Josh Poimboeuf wrote:
> > On Fri, Apr 04, 2025 at 12:49:38PM +0200, Peter Zijlstra wrote:
> > > On Thu, Apr 03, 2025 at 11:48:13AM -0700, Josh Poimboeuf wrote:
> > > 
> > > > The real problem here is that INSN_CONTEXT_SWITCH is ambiguous.  It can
> > > > represent both call semantics (SYSCALL, SYSENTER) and return semantics
> > > > (SYSRET, IRET, RETS, RETU).  Those differ significantly: calls preserve
> > > > control flow whereas returns terminate it.
> > > 
> > > Does that not rather suggest we should perhaps have INSN_SYSCALL /
> > > INSN_SYSRET to replace the single ambiguous thing?
> > 
> > Is there any reason to have INSN_SYSCALL in the first place?
> 
> This xen hyperclal thing?

SYSCALL does a hypercall.  It usually returns.  Which means we don't
need to care about it, except for the one case where it "calls" IRET.

That's the one with a UD2.  Similar to replacing unreachable() with
BUG().

-- 
Josh
