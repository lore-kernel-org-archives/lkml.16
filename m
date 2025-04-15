Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF21C1A3056
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728770; cv=none; b=HMMtJE8KdQtnTcsOdI0NQDmOzqmCzFD4acqBp3mJKK6nNVlY0KR4HWd4hUzLnMhijXdy9AtOQvUaIrCJC3ug1hZTFpNyR+XBhFDvk5QO7FGeKzPhzc/OIvWIMGnRQFEwa+X6akvNMMIVAsyTUOzq7ir4JvU/otDMWg9W2wmWphQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728770; c=relaxed/simple;
	bh=xIesYGqrd51RI1bI3MW7wEcJi9adYQW4DsrOO8n7sIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YE9AtRL172XcMmdMkOd4oMxaXRGwN1AFFZod1+gWNkrhEfL2rzXG1Nijy3omweX0eSVLhVDE96Z3zYnPWfBYH81QAE972Sb8N333iwGeTQEcffdemSAwI84M9VSPkxv3R9aNO2w8JatVht3EIcvGsl6SmEST6jInOK4ec39uczg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c78S8arg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c78S8arg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171BDC4CEEB;
	Tue, 15 Apr 2025 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744728770;
	bh=xIesYGqrd51RI1bI3MW7wEcJi9adYQW4DsrOO8n7sIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c78S8argiE3N+N5ell9sxHjrSw3z3sm9QWSSV299ElxruWwqtyHr4XuQrj7nKTx9z
	 Km8HOL58VzY6OkLfQnINPTa+Mb8Dyoj6M7gAJ3nfCTtfoNM7GTFDF60Ti9QCWgoJ+Z
	 +YZgrwDQk0TS3SpN1QV1psl4nvwpguDnN2LIHnQKqIWu6QkLawfTVqNkyRjfh8ryMb
	 5HUTiWNJO3wMmDZLe2U6yIfKNbj2IIxHUdSdcyJtg6p35Ue2rIhqWDFGZ+OOxCVtCJ
	 zt3qpAQYzH1XdM3U8aVEP1+E7nIWIRaay+4qHw3o/kgR9vzmGyBjCrVXUyExd5Lnaa
	 GmoN2MsV5b0zg==
Date: Tue, 15 Apr 2025 07:52:47 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Uros Bizjak <ubizjak@gmail.com>
Subject: Re: [PATCH v2] noinstr: Use asm_inline() in
 instrumentation_{begin,end}()
Message-ID: <ivrnem5v2svx72fi5i5ibobdihjlal6cfibtimmzicar2pxkeb@qtlnpkakmkoq>
References: <165d2a0b882050f3f6cc0315af66cd2d16e5925b.1744676674.git.jpoimboe@kernel.org>
 <20250415074849.GJ5600@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250415074849.GJ5600@noisy.programming.kicks-ass.net>

On Tue, Apr 15, 2025 at 09:48:49AM +0200, Peter Zijlstra wrote:
> On Mon, Apr 14, 2025 at 05:27:11PM -0700, Josh Poimboeuf wrote:
> > Use asm_inline() in the instrumentation begin/end macros to prevent the
> > compiler from making poor inlining decisions based on the length of the
> > objtool annotations.
> > 
> > Without the objtool annotations, each macro resolves to a single NOP.
> > Using inline_asm() seems obviously correct here as it accurately
> > communicates the actual code size to the compiler.
> > 
> > These macros are used by WARN() and lockdep, so this change can affect a
> > lot of functions.
> > 
> > For a defconfig kernel built with GCC 14.2.1, bloat-o-meter reports a
> > 0.17% increase in text size:
> > 
> >   add/remove: 74/352 grow/shrink: 914/353 up/down: 80747/-47120 (33627)
> >   Total: Before=19460272, After=19493899, chg +0.17%
> 
> Hmm, I was surprised that defconfig was affected at all. Why does
> defconfig have DEBUG_ENTRY on?

Hm, looks like Ingo enabled that with:

  70c8dc910427 ("x86/defconfig: Enable CONFIG_DEBUG_ENTRY=y")

Though, is there any reason NOINSTR validation needs to depend on
DEBUG_ENTRY?

-- 
Josh
