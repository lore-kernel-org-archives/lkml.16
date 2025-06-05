Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D075FEE6;
	Thu,  5 Jun 2025 19:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749153159; cv=none; b=fLdnxRIPT+3dTXRlxFNhBKOtD1P1YwhmPyNZUMKkIOPXVDGdzWZnWxxxoWgz+1ihrWl2NQn3ZgrEfw/6JBDf+G4Z7+gl8g9utLi3gA0YiGA7ysZOynkgGPWSvKGXawcODeyKR7jQJ4SRAOog55xbNAKmf7FH+btXDnsLCo5KEA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749153159; c=relaxed/simple;
	bh=NrA8+ELzWL+5QvlJ0VNSAx2hi+8qSkXlIoSXyHc5fBA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kflgLTY4sPSXYuKNul+pyJcfFvgblwcFGJq9pGE2DMaZGp7U1JW1WlOyL6JH5whap2/Idsie2T8dqUgZdIlBQzkc1m1zyYrXWFT1LumXQ/C6hF6fIf7+RGSBZMBM5vmhONzuufbPoDCCzmLfbZLQhDnMUAdvCyP7AgN7lcOcnms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PWEUEkdX; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PWEUEkdX"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0D55041ED3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749153157; bh=pkg6djgNhdNpf9TwFs43z0gZDGrP/br4agW+AXMjS7s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PWEUEkdXLeUaTq6hJlXYvocAdjrlZn/7q75T0Uw9geVRFlNtqtLDL1eNX5gaLCdso
	 LTa+bmFN1n+YrqtvPSoHW/s+9enS9O2wzRYyxkHO5+meM09jne9OKZFFPDqqsMS+4w
	 bFSyg//3eW5kCobDLdRmbE8po6eeD8mHSgh5ltiv7Q7nB36SpBDDqAB1F5N63dQ3Jp
	 PH7O0zg48Cjp9j/HxGU20egzR+US+9kTHKiLO6m4EA+NHbuwlcHgFvZEjzwiw8UfiC
	 7Oh9WWorI8epQywWAtY/RqWEe1x0qylniDygzcSIULeGn7UwlcdH+VWVfMoHXbpR8f
	 VuM7JzlQOE6pA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0D55041ED3;
	Thu,  5 Jun 2025 19:52:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Matthew Wilcox <willy@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: [PATCH] scripts/kernel-doc: drop "_noprof" on function prototypes
In-Reply-To: <aEHwdoNCrF4-KY_i@casper.infradead.org>
References: <20240326054149.2121-1-rdunlap@infradead.org>
 <aEHq_Jy3hPQIzaO-@casper.infradead.org> <875xhaf145.fsf@trenco.lwn.net>
 <aEHwdoNCrF4-KY_i@casper.infradead.org>
Date: Thu, 05 Jun 2025 13:52:36 -0600
Message-ID: <871pryezjv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Matthew Wilcox <willy@infradead.org> writes:

> kernel-doc is our own format, so sure, we can add whatever marker
> we want to it.  I think it's not quite general enough because we have
> situations like:
>
> static inline void foo(int x)
> {
> 	numa_foo(x, NUMA_NO_NODE);
> };
>
> /**
>  * foo - Frobnicate
>  * @x: How many
>  * @nid: Which node
>  */
> void numa_foo(int x, int node)
> { .. }
>
> and now we're documenting a parameter that doesn't exist.  The only
> solution is to move the kdoc to the header file, which is annoying for
> everyone.  Or replicate the declaration in the C file and kdoc it there.

In this case, though, is there a reason to not document foo() as a
separate function?

jon
