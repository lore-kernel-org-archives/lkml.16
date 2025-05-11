Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0931A3154
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746965243; cv=none; b=F8L3m/spysuASX5iuJs+KFiveFCaTFybxLuA5Tr2M5lJ2SPytcTe5ML0HXClxPVrU5UBqmLuprKS0dFPMVwaQadNRxxLSKy3RvyV+PB1LDmoLxQFT0/TYKJOCX8D5SyRPtpgZhm7GnZnDjsZjyQMNBBGrnMADsXRHvF2KdboUcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746965243; c=relaxed/simple;
	bh=DCwIbmjJDmtjJ922UHpo2Jm989ZTO9G08QPk/q5rzJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gojvzNvNnmkZBKjKBJIAUVX0oS2CDvRhhj9Rr0AUR/9NBDP7hYp/eBa730FSafIWltLYXJs/RZZWiab7CG/zWpFbZzDW43Zf8hvaSOWDonryQVgHxARd9oNmvbS7Ny6IGSqO4Rw/7c/ekXTqM7U6+4iZdAQaUs+eyK3ybX5sI8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=a6MiAJhG; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="a6MiAJhG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DCwIbmjJDmtjJ922UHpo2Jm989ZTO9G08QPk/q5rzJg=; b=a6MiAJhG2gipOeMQdRhzGYUgMg
	hx4LskN2Thr/plcQbpQeyX4k7nY021WwSF3CxS5L6jhXQhlhayAJkasslOtd8me+I8jWeARZWPfmc
	2KvoucRDw4l653J/ZDCphgklLwHxjrFnfSZwlWQlJlJyVlq8aBhPDbP7ggzkmKFEwx4dAJQHIQzfU
	LSuXJSzl9xt/ruu7Yd8DB6d+Q28pzSXL5imT7pTtullpje/ohEidHfAyHS08kpU9rGifGVp+P/HFu
	Xt75bnIYRfprIrq6kIKzc3BssgdwzH4/WsJzhoTHKAy9sHCu1+GaFPsMfG5HOeWbSc8JGvUy8TMhB
	tNAh7tgA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE5Sg-00000008wZx-0E5P;
	Sun, 11 May 2025 12:07:18 +0000
Date: Sun, 11 May 2025 13:07:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Yin Guoyu <y04609127@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: Kernel panic - not syncing: System is deadlocked on memory
Message-ID: <aCCS9TMcaySNvl0J@casper.infradead.org>
References: <CAJNGr6ve_6o6drwe_+bRW6UU4Ew9EjaZYaBgx0JAQjYb+A8VSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJNGr6ve_6o6drwe_+bRW6UU4Ew9EjaZYaBgx0JAQjYb+A8VSA@mail.gmail.com>

On Sun, May 11, 2025 at 07:35:14PM +0800, Yin Guoyu wrote:
> Hi,
> When I test the Linux kernel (commit
> 38fec10eb60d687e30c8c6b5420d86e8149f7557), I encountered a kernel
> panic issue related to memory allocation, specifically in the
> alloc_pages_mpol function. The panic message indicates "System is
> deadlocked on memory," and the call trace points to
> __alloc_frozen_pages_noprof failing to allocate pages, leading to an
> OOM condition.

congratulations, you ran syzkaller as root and got the system to crash.
come back when you've learned something.
