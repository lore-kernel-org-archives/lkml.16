Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE891E9B3D;
	Thu,  3 Jul 2025 18:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751566500; cv=none; b=AEYE0KbibutSgu2rHu2DrQYqw8o0NSbxa4CgThu62b4gEsL0GChUwrrZBlLruXOb/VSGlGU1jNpJhlRAzmJc0UOVsn3JguEhXx2GsuYFzZxPFSM4EzB8kK/AP+gWqkGv2lU6vNbj94uNdYDB3PSiB7bcD2fKjiYMZ5q527xCqW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751566500; c=relaxed/simple;
	bh=4tmv4kBhtr//pdreZeFS5MzU2BVhzzxT++y88Tq80fw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Tqb4gHlIzK5PxNCqKiZJ1IGPyZsrbHraLS4QcQqOEVEKEQl/VyJD7jbiIHWXfZ+lNy4r/aSrSsyRozKuQxMHg9fip1SgDmPtTtIfM3bOp40NnE+6opk87I/T/v69a8WGKj1tGPtgtx1PVygUbrW8Fak1uaAW/LCHB+4X37MRWlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NO7CnyWU; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NO7CnyWU"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 22B6E406FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751566498; bh=HrGX+LEQVqk6CWb6KR0i5FrRu1VS4HPsCcy3YOJM2cA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NO7CnyWU6xy3TvhPy5iJM4OV5ta7cOwBh0I4nIpb6W6nTdTRo3WSZ2RgKGAOYDbiz
	 0IdFPMfiQHw0GSRfIIdQ6icXonndvG8i1tAX9rjSyPOBHkd7pjOzZGCtBDQo86PnNZ
	 5mnsHo9RGfycxJu6gwTuFNYqIHSGH4AAGbN7YuCcFNokA53kDB0qUTiT4mOuCTNoP9
	 emdfDhdHZbtnO9+vEG+vVaG6Q0K+jk3QIX3rrtUnTr7k+roBVgKZ1iBdQ3okonZXKk
	 hNon+Taph9jblawIVJG05DjH3dplbejrAJpDc+hHjnskzRNpqwyAtjyIOUhJ6ff+XK
	 o4p6i0WFwnc5g==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 22B6E406FA;
	Thu,  3 Jul 2025 18:14:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 2/7] docs: kdoc: micro-optimize KernRe
In-Reply-To: <20250703173848.721de72c@sal.lan>
References: <20250701205730.146687-1-corbet@lwn.net>
 <20250701205730.146687-3-corbet@lwn.net> <20250703173848.721de72c@sal.lan>
Date: Thu, 03 Jul 2025 12:14:57 -0600
Message-ID: <878ql5kuou.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hmm... I opted for this particular way of checking is that I
> expect that check inside a hash at dict would be faster than
> letting it crash then raise an exception. 

Raising an exception is not quite a "crash" and, if the caching is doing
any good, it should be ... exceptional.  That pattern is often shown as
a better way to do conditional dict lookups, so I've tended to follow
it, even though I'm not a big fan of exceptions in general.

> Btw, one easy way to check how much it affects performance
> (if any) would be to run it in "rogue" mode with:
>
> 	$ time ./scripts/kernel-doc.py -N .
>
> This will run kernel-doc.py for all files at the entire Kernel
> tree, only reporting problems. If you want to do changes like
> this that might introduce performance regressions, I suggest
> running it once, just to fill disk caches, and then run it
> again before/after such changes.
>
> Anyway, I did such measurements before/after your patch.
> the difference was not relevant: just one second of difference:
>
> original code:
>
> real	1m20,839s
> user	1m19,594s
> sys	0m0,998s
>
> after your change:
>
> real	1m21,805s
> user	1m20,612s
> sys	0m0,929s
>
> I don't mind myself to be one second slower, but this is hardly
> a micro-optimization ;-)

Docs builds generally went slightly faster for me, but that is always a
noisy signal.

Anyway, I am not tied to this patch and can drop it.  Or I suppose I
could just redo it with .get(), which avoids both the double lookup and
the exception.

Thanks,

jon
