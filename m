Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77070155398
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738225535; cv=none; b=iIrCsQLfzubi/zfjt+Wp3lnxKjHs9lgtXIfJadCEN1yaxKwinPkoAakMtfj+uVFoIpzfOYJuBajhEh1nPrmbg3p//lrFoul7nSxjQJubI0XyfJELGgeJNizWM0H8dIPCDnYTaEYRtlMNa0LzlQa4dA/VQ0xmgzA1GWTJXxhlZtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738225535; c=relaxed/simple;
	bh=dHB9ys8nqNWxi9uyTLYUlHiNLl8nSuSmkA4aXHYnfzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jn5hgk1obQZEYx0Ik7pFNKDtfR+JBUnKsV9bpT9yH1Moea/52SX5kuaJnkeH/5npCKPoHIkkxiwVdnsnJDnMxxXJ/GRsGX33Qfmv8N31G8s5EKROyDKl1n5hpYapo3QvCNLVuhXr4d8K9U6G0Ox7pmdQBJHRiVFkmra/7u8oU8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEWGJMF2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEWGJMF2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D756C4CED2;
	Thu, 30 Jan 2025 08:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738225534;
	bh=dHB9ys8nqNWxi9uyTLYUlHiNLl8nSuSmkA4aXHYnfzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QEWGJMF2wiCqyZQXMkM9iG+v3ABjKkFdUIB04H4N+kLVleMCG+yJGOPbrR9GFHwTE
	 09BCDr8MgmQ02R3KVizxgsLRQQUpXIqQvn0DK7XKjm1Fz3aUbpsYy5PlW0jyv4x+Ht
	 rKtuba5yfxJSv4JMcodHAvonF2UpAZgEDpW+CTm7sQ8SxUPzfDt8DVWyn5o2l4uiaG
	 /E5Q+zwFb4HdCrnIbOKnqJ7tACFUcV9uyGyecRdsMlIGqBuglO8/wzYi8ieRKnguOC
	 hQGs1uDqgqDcgDoOfuQxIoiqd3/kpJln0jmWuPyc3sDEVGFiXJCQ0uKV7JeNGJWhqu
	 Sv655aLwwRi4A==
Date: Thu, 30 Jan 2025 00:25:32 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Yonghong Song <yonghong.song@linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>, Song Liu <song@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Kernel Team <kernel-team@fb.com>
Subject: Re: objtool failure caused some kernel functionality not working
Message-ID: <20250130082532.mvfz5v2ikqixtesc@jpoimboe>
References: <0bf90fc0-2287-4ce0-b810-6e383e695981@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0bf90fc0-2287-4ce0-b810-6e383e695981@linux.dev>

On Wed, Jan 29, 2025 at 11:10:14PM -0800, Yonghong Song wrote:
> The llvm18 does not have issues. I tried to bisect what changed in llvm19 and
> found the following llvm patch is responsible:
> 
> https://github.com/llvm/llvm-project/pull/96089
> 
> Basically, the compiler might be able to create a jump target which actually
> not possible at runtime. For example, in one of examples in the above llvm patch, something
> like
>    if i >= 3 goto out;  /* i unsigned */
>    switch i, label default_unreachable:
>      case 0:  goto label1;
>      case 1:  goto label2;
>      case 2:  goto label3;
>    label1: ...; return;
>    label2: ...; return;
>    label3: ...; return;
>    default_unreachable:
> 
> I think that this should be a valid code from compiler perspective.
> 
> Can we fix objtool to handle jump target which is immediately after the func body?Thanks, Yonghong

I actually have a fix for that, can you try this?

  https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?h=objtool/core&id=fbb454b7bb39955c324693e73a5cf7e448632553

-- 
Josh
