Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE31D1F3B93
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743778016; cv=none; b=QFitpIg/dd5PvDj6A7+7aytAw9vepqnKCxUm5WfvyvbjXAlCv5PIa+cy4Pn3SjolTFOcAQupFQ4lGVuY/rUC0gsQnxonFLi7WgdPXPY7ptLlTaLEfqlWRZpIQPXBnybUeNwatOQnzuUzc5piIhDphx/lFlxUPUY53KUltcsUqeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743778016; c=relaxed/simple;
	bh=40syZVcnfUXD89GXXgTZ/pgthTazyz56LsPed6PHiys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pP6MK1kXIiaI5vV0c7v8PhmPhtgAX0fCInLFbOyuHPeJu97dcuemzPXX9P8Eb8KtPMZ92NRcAhA6FycU/hDAFvVj63qlSE9fytzRE2iDg3fvulOaxaCm17uf6kXws//+UBlbqGS2CE6kF9ghK1O7B9Kc0g7vOGsjHjd397p4OF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHOFdCnu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHOFdCnu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B0DC4CEDD;
	Fri,  4 Apr 2025 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743778015;
	bh=40syZVcnfUXD89GXXgTZ/pgthTazyz56LsPed6PHiys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tHOFdCnuqlcy5Qk/wcwvwViT/Lv4KNOXXc3gQayVY4OIZJCFsq5S0pCkLBFE6gEuS
	 xWTMry4Wah1ccz6dXtIvzPcIqWtd/0tVrt5RSkW8nq+g3JADUFFej8bhpnt+oHlUNb
	 gTdx0EDgdrIcNJFkhymCL7wxMQitpGhBxMovOM7zT1oOtUapIfWlZ/EbEU0CLxGqp/
	 ftpqNIU13VUvk8WWBKgcIAZU2DduZOINmtdJcu/w2/NJnh+RyXb7Ao5W05FvE2of/J
	 ipjWFHs33L6P9RAlledHJPC6+2Gdt188quHmXw6wBeBMkqwjQQ8211a9dQR4uaTO9Z
	 JxUKyw8DrVkyQ==
Date: Fri, 4 Apr 2025 07:46:52 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] objtool: Fix SYSCALL instruction handling and
 INSN_CONTEXT_SWITCH
Message-ID: <iqalk74mk6onmntltkpodnbtp7zxxgx3u3ycuipmkizcmz7uvm@b7j7kubwzpl6>
References: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>
 <20250404104938.GO25239@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404104938.GO25239@noisy.programming.kicks-ass.net>

On Fri, Apr 04, 2025 at 12:49:38PM +0200, Peter Zijlstra wrote:
> On Thu, Apr 03, 2025 at 11:48:13AM -0700, Josh Poimboeuf wrote:
> 
> > The real problem here is that INSN_CONTEXT_SWITCH is ambiguous.  It can
> > represent both call semantics (SYSCALL, SYSENTER) and return semantics
> > (SYSRET, IRET, RETS, RETU).  Those differ significantly: calls preserve
> > control flow whereas returns terminate it.
> 
> Does that not rather suggest we should perhaps have INSN_SYSCALL /
> INSN_SYSRET to replace the single ambiguous thing?

Is there any reason to have INSN_SYSCALL in the first place?

-- 
Josh
