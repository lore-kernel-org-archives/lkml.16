Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBC31C27
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 08:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749197951; cv=none; b=GOTMBb/QnXF61y+SpRWeVEGV0aTsmAFI4N5b6MVJAMVQIG8fLx56E/h/U0xp5T6s6jd3DNRQt5LEtFo0s1vKGD11qrkQlIXR4SfQsPqOSKexyyaLCKiyHJYixxCHPizx9sDwMiTjdyx20X67+9DCyb6sVQe+PhQ9JM/af+m4Wnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749197951; c=relaxed/simple;
	bh=7zs9RrF4Is4C2gar4hVdfBkJcKOVqMYc4c/E37+I8fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdW2RMarFerUt7MyVgtP/ZME0lCgV6HPPySYc/+EPbukRUCg9A7ahFaFxYd+C6EAAJXR+DsBUfKWr8e6sLty9r5NXVs6nTlPjVb6/Hl5saA3nCEKcAofmbWWkcQoMcsxfa67sVHv/I1lPjm/2qwqdSYSqjeb6252AE+fc3Q+SBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lk1cC2/0; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lk1cC2/0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yjoLRs9EAMLzIj5nbMGgLiuljEHvVksleD7tSDqaBxs=; b=lk1cC2/0p+1Kr6WpyNPQBEMOVd
	pUIwb/Yu5yPQ2nobs3Qq9HL0hnTMD5JLWkQKn9DdMADf3RSLARJ+MFEbUgz7bfEreYxOxKbQH2HIE
	5dH7MalZ9E0pXJoGQf88CUblOTlUsn6QXgt1NyfoeorOGHYatBV8mo++A/wCZdozj2Vvxg5Wfy0nG
	WD5Q6vJ+50wSDThh383uu+2pfze+25/zNCKqsFufHoo99P4Zh+R7siXLPTcPsJbKJPl6YPLx6jiTk
	FQewEtCz+u3mq3O6J2Dhir58jNum+PDty9jigws98zWJ0AlRBkku5ZrH5WyeG7yH2nMHRbP6SApWW
	Y5FHTKmw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNSI5-00000001Fbq-3Uui;
	Fri, 06 Jun 2025 08:19:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B0D1430078B; Fri,  6 Jun 2025 10:19:04 +0200 (CEST)
Date: Fri, 6 Jun 2025 10:19:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, torvalds@linux-foundation.org,
	mingo@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
Message-ID: <20250606081904.GK30486@noisy.programming.kicks-ass.net>
References: <20250605164733.737543-1-mjguzik@gmail.com>
 <20250605190054.GH30486@noisy.programming.kicks-ass.net>
 <CAFULd4Z4SJZErfV1AG_a-+SDd=gnXa88=suRAFN3RHB5M+=bFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFULd4Z4SJZErfV1AG_a-+SDd=gnXa88=suRAFN3RHB5M+=bFw@mail.gmail.com>

On Fri, Jun 06, 2025 at 09:27:07AM +0200, Uros Bizjak wrote:

> Now, to use function call instead of "rep movsb", you can
> use -mstringop-strategy=libcall instead of some objtool substitution
> (-O2 -mno-sse -mstringop-strategy=libcall):
> 
> foo:
>        subq    $8, %rsp
>        movl    $160, %edx
>        leaq    16(%rsp), %rsi
>        call    memcpy
>        addq    $8, %rsp
>        ret
> 
> Which IMO is what you are looking for.

Well, no, because I can't replace the 'call memcpy' with "cs;cs;cs;rep
movsb" on good machines.

We want the "rep movsb" / "rep stosb" interface so we can actually use
those instructions when they're good, but then fall back to an
out-of-line function (with the same calling convention as the
instruction) when they're not so very good.


