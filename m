Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EE326462C;
	Mon, 10 Feb 2025 21:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739222815; cv=none; b=F6l2DHmvJdhZS7ClxWlzfcpC7Sz/HSULSD6y0w8O+bDorazhwuBvKdSHK93dksulDQK/lLr+3wEZ3meV/NKj2Hd6+EjdhiS8RV/wrGFIdXywA3LKHx0+lXmpnQpyy/vloj40hBfZQBtJ2fmJxuQ/XQAcpNC1Q7eQhUdxJ3v892g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739222815; c=relaxed/simple;
	bh=ofm1ktslAjBtWS0yfrjTo5bd77wR/QRUhpc5kK/lkEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NB6Yw+r4LL5nzNcAYkausCo9Y7jtRI/XRYq+ayVHS3aQTmI9bjVOO5reOaAPnRpTk+IqNIqIu1K7jQ+w+ETg/YE5cR4qp48v9xpmHanDAINjb5LpNhUBNRSf+xNAY93P4LvB5Rv2JzbPvCbAXiB46Rc/bXOH1jOoE5J9yDXaQTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vl2lsKYL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vl2lsKYL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE27C4CED1;
	Mon, 10 Feb 2025 21:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739222815;
	bh=ofm1ktslAjBtWS0yfrjTo5bd77wR/QRUhpc5kK/lkEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vl2lsKYLUtR0YlnfLqjy5wD3rTLZSCKRFzJQ2EOsbpDUzjv2fH1yNizTHcYIzjgNs
	 SRjtKp4T3/KG7rLVCHt9xLvsAVL1ex00WyW9JpbdD73zKC9YXgLAtePfxswHRQ4jH1
	 y0kGr9Xp/vDI9fdOrE301Wfnsq+gMv1inwa2a5dIW296epc9c5HehSC0yfYXpWOVfw
	 JkvY8Q/06i4shaKcyb+MPsCnrQN4Cu8chRnugQ+WExUk1BiKwh6t8xuWODKJADUK1X
	 4tIDwB/TukU2O9sLkFYrzXtkrfLX+hH2ItIWEyDfQaCvNAJsVhRDbyDa75RwCbNE5E
	 N0cCZU/Hm+mMA==
Date: Mon, 10 Feb 2025 13:26:53 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/9] Add jump table support for objtool on LoongArch
Message-ID: <20250210212653.oidcl4aqyrcu3yzi@jpoimboe>
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
 <ef1e3e7c-0117-175c-5a85-091382696748@loongson.cn>
 <20250115013444.anzoct6gvs56m225@jpoimboe>
 <4612bfd8-442e-fecb-240f-46e735b48540@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4612bfd8-442e-fecb-240f-46e735b48540@loongson.cn>

On Mon, Feb 10, 2025 at 02:07:43PM +0800, Tiezhu Yang wrote:
> On 01/15/2025 09:34 AM, Josh Poimboeuf wrote:
> > On Sat, Jan 11, 2025 at 02:57:42PM +0800, Tiezhu Yang wrote:
> > > Hi Josh and Peter,
> > > 
> > > On 12/17/2024 09:08 AM, Tiezhu Yang wrote:
> > > > This version is based on tip/tip.git objtool/core branch [1], add some weak
> > > > and arch-specific functions to make the generic code more readable, tested
> > > > with the latest upstream mainline Binutils, GCC and Clang.
> > > 
> > > ...
> > > 
> > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=objtool/core
> > > > 
> > > > Tiezhu Yang (9):
> > > >   objtool: Handle various symbol types of rodata
> > > >   objtool: Handle different entry size of rodata
> > > >   objtool: Handle PC relative relocation type
> > > >   objtool: Handle unreachable entry of rodata
> > > >   objtool/LoongArch: Add support for switch table
> > > >   objtool/LoongArch: Add support for goto table
> > > >   LoongArch: Enable jump table for objtool
> > > >   LoongArch: Convert unreachable() to BUG()
> > > >   drm/amd/display: Mark dc_fixpt_from_fraction() noinline
> > > 
> > > Are you OK with the first 8 patches?
> > > What's the merge plan for this series?
> > 
> > Sorry, my inbox is still reeling from the holidays.  I will review this
> > soon.
> 
> What are the status of the first 8 patches?
> What is the next step? Is there anything else to be done here?
> I would really appreciate any advice on how to get this merged.

Please post a new revision rebased on tip/master, with patch 4 dropped,
and I'll queue them up for -tip.  Thanks for your patience.

-- 
Josh
