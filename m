Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258A82673A3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209831; cv=none; b=avnGM5CveABJYP9nrvPeX0efYrxfxiOjN8PmUy0qNC8zRHkTlmgn9YuRHUz/Pbl+RZX9vksjxJkTKicx7+jngkojx2JAo1pysex+goPdUr0gqSImqsE9YBXCWkQU56J3fyOczObraL0m5SuWnqwLCK2H044Y5uy/VLFX/nopRhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209831; c=relaxed/simple;
	bh=AQEmlAiyQVKEv+Eym+pu0l2fbr7oQtf08qsmZpffl0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9o4yxbvqeUhkOk7sDEq+T9MiSnhrYveTDq2slKB9V7M2E+bQtKv8Hz4+Bdaglao9Yp5oHIFk7H9Pj3rWSjnLov2kd7JfGD6ab8BYqQxZON/kuyNP/o9HMSMUK4gLPJi/OlybBMFREfGFSL965RK9khk4uML8xMmZipv9BlaDYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=v9CcRUcw; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="v9CcRUcw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lXAtUWl+TYjkSdWZluavjU5zi8D2SOC5COayB+U2vLw=; b=v9CcRUcwC50bzVnTTn6Zm8uQiq
	F/Gx4rQMQPg3XD8sRYa5YX2SpwseK1s85wCdOL1fgvH1Ft3EmpE0FyEGWPOrIj4EAQLNy9YNm7/Gt
	qChUMLvGagBd1v+xO2aY+Vw+lfe2JZtGSppPJSGYOG6JegyHwgF9LZ+vg8Xskc64B2+9CJHpe7N+e
	2feIt1Z7JQiDt6d5uAM2roFe2tuvPctbzI91Z2tKY/llzhJXESHpp3t+7cTmzjZzekneVyl7ABSI9
	SHTiwTAx380e5xQVbDf0WtUynDNAPw+HJESD84i9z//Oxyjjh4z62SKTGRvmbpdWngd8ISE1DNX0c
	oSUjAp+w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WeX-00000001bS0-1muU;
	Wed, 09 Apr 2025 14:43:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 85A883003FA; Wed,  9 Apr 2025 16:43:45 +0200 (CEST)
Date: Wed, 9 Apr 2025 16:43:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 0/4] objtool: Fix INSN_CONTEXT_SWITCH
Message-ID: <20250409144345.GG9833@noisy.programming.kicks-ass.net>
References: <cover.1744095216.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744095216.git.jpoimboe@kernel.org>

On Tue, Apr 08, 2025 at 12:02:12AM -0700, Josh Poimboeuf wrote:
> I decided to keep the "unsupported instruction in callable function"
> warning, it's not hurting anything.  As a result we now have
> INSN_SYSCALL and INSN_SYSRET.
> 
> v4:
> - split up patches
> - don't get rid of "unsupported instruction in callable function" warning
> - split INSN_CONTEXT_SWITCH -> INSN_SYSCALL / INSN_SYSRET
> 
> v3: https://lore.kernel.org/9b23e4413873bee38961e628b0c73f6d3a26d494.1743799705.git.jpoimboe@kernel.org
> 
> Josh Poimboeuf (4):
>   objtool: Fix INSN_CONTEXT_SWITCH handling in validate_unret()
>   objtool: Split INSN_CONTEXT_SWITCH into INSN_SYSCALL and INSN_SYSRET
>   objtool: Stop UNRET validation on UD2
>   objtool, xen: Fix INSN_SYSCALL / INSN_SYSRET semantics

This looks nice, thanks for doing that. Belated:

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
