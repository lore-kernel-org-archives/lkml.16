Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FFD2111
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 07:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743491314; cv=none; b=WkZ1UnRjP2k/Jg+TEQSvcPEIgyE80c+GTrcYqiUrY1jaSKmvfC4GZAMUncExRQHTrYmVYaNjyuikxTxNzv0rSJvezjQmqo/7miL1cD+3Ia/pKcFxU6jQNjQMpNOxjvn9siaZHM5aORVKyhXu/fx+RkXIiNQL1diwY/82KisUHUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743491314; c=relaxed/simple;
	bh=HdzcTzIYxOjkI/EP8DVMyX1MzVVG7E5H19mald2ev6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpkSoqcFUJxyC2PGmJpIUpcMu9GanZzEhSFcji/tFviOazDj0yJ8zbKpPseRzSb0TkI4uWYzoyLmaguWneKbTw7UOezAv3hKntyiJTbW7OLFZi3CmpbnXfnCWNF/ipVToM2gpqVg2C5glf2nSUTj5lxE+vJygyPRcwz7QSti5Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IV6T4DFA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IV6T4DFA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6052C4CEE8;
	Tue,  1 Apr 2025 07:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743491313;
	bh=HdzcTzIYxOjkI/EP8DVMyX1MzVVG7E5H19mald2ev6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IV6T4DFA8us8zEZKwLwRgqVT3B87dvjXVwQg2pmOOMFe0ylqmfHdMQjv8X2FimXVc
	 wye422W3LWbFnuYMg75RH6JHRhWSH7Ml/H93gXVgkz9pUwtdQU8Hzw/l2H+7xrSS1Z
	 ZHk0S6UlS/+RoUryqEZODYSjVhk9Of6aJ2+So4mvmRwCXRweyBA0gv9dCvsvvTBR4l
	 3mAkJJt3lFFN9NhgPMugPYzzxp6+1RhESYZjo54G9/3XuscuYS/LqpZwIoYICQo7A7
	 VTmPM+GNtsJE93aHElEyBIm2mmDCC2A3T23hxq8YF9n/wYRhTxFI/Ieqngl8S2ughG
	 MiKvo7BL+U1jA==
Date: Tue, 1 Apr 2025 09:08:28 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	kernel test robot <lkp@intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 08/11] objtool/loongarch: Add unwind hints in
 prepare_frametrace()
Message-ID: <Z-uQ7NqMzqAShWcH@gmail.com>
References: <cover.1743481539.git.jpoimboe@kernel.org>
 <270cadd8040dda74db2307f23497bb68e65db98d.1743481539.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <270cadd8040dda74db2307f23497bb68e65db98d.1743481539.git.jpoimboe@kernel.org>


* Josh Poimboeuf <jpoimboe@kernel.org> wrote:

> If 'regs' points to a local stack variable, prepare_frametrace() stores
> all registers to the stack.  This confuses objtool as it expects them to
> be restored from the stack later.
> 
> The stores don't affect stack tracing, so use unwind hints to hide them
> from objtool.
> 
> Fixes the following warnings:
> 
>   arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
>   arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-152
> 
> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
> Fixes: cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503280703.OARM8SrY-lkp@intel.com/
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Note, I skipped this fix from tip:objtool/urgent for the time being, 
because Tiezhu Yang indicated that he'd be reviewing and testing this 
patch.

Thanks,

	Ingo
