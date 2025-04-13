Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887D5185955
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 23:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744586451; cv=none; b=lAU0hHH1NGGokQNpAlISPc6RS72ZdVMxWCCX16yWtpy/43B0OJHE+xLD23gBxLi3+03dzCCCcex9o8qrzwpaEPi2IQNvdQracPw7AAl14X80Nm7mMs33fWCb3Q7XtwZ3Dr5k27+r4PPNgp/PkCm/CB1B5k8Bn6UBVu/A/7u4nQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744586451; c=relaxed/simple;
	bh=YonfdUK3i2uYh6N9ENHRqISEUEW1DmFbEDSVGXt2v4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0yP6/2IQf1uohudkxrAfddgsv3GER/LRTZdwcRaEubV+Gjrvtn5J1gsDGvQD/YeYguwm5PYM1XkFymwIWhXSOVY/Xvhc0uIRqgsAJVOU9Mme2bYiHB05QVwZ6xiDOepczYhI350+i3hFsPieTqTMdwIitOQGtshm19TUeidNFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sW85wA4L; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sW85wA4L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=R26bN0qNw7kenH3Kz+A/StBpUHxCh3qUso9yG2t8eI4=; b=sW85wA4Lki2RraiLg26J2UY8a4
	VRJC7lFxmdj+JP1J5F8E/yQ/K8/T5XGPhhVu7EnwYGeJCRqaTTF+ySuWESCNqnwNdVRXvOyqORlzu
	MSWHMW7U8fhL6QktXC9BDlYS4Ow61uQe/cCzIlaPny1IlT6w610K0Cs2oPLyCS4MX4Ph7e06chYG3
	XcLQ7m+jwNvAKgq+0f0SsQ56xv3O77u5ELVczs1mqOVv1QvRewlTPYx6cvOidMP3psOKoR5MTGJwG
	WDkFoWC96gQkD2nCivJFouZ4c8iuj/Wun3eAgjVjbsFZzl45W3l8jO2WCFOovPwPT71Ff9eqrTW75
	j7gx75ZQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u46d2-00000007Nln-2DQd;
	Sun, 13 Apr 2025 23:20:44 +0000
Date: Mon, 14 Apr 2025 00:20:44 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <21cnbao@gmail.com>
Cc: gaoxu <gaoxu2@honor.com>, Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"surenb@google.com" <surenb@google.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	yipengxiang <yipengxiang@honor.com>
Subject: Re: [PATCH] mm: simplify zone_idx()
Message-ID: <Z_xGzAx13diuCdvv@casper.infradead.org>
References: <2d42decac5194c2c8d897b0424f0dcf3@honor.com>
 <Z_fYsyEA9hSEOoxp@kernel.org>
 <CAGsJ_4wACEvWe-Fcx9fShkF8okEVb3srGDVCn0v0QjALq7nneg@mail.gmail.com>
 <bdf6988006d546d498ccb2b7c14c6fe0@honor.com>
 <CAGsJ_4xDc_5q8dBYVq-Ga0iKJD9pTQdYSHrKw8R=1RHNb4+r7Q@mail.gmail.com>
 <c915776e308f49e7867ecb50afa44d36@honor.com>
 <CAGsJ_4x+5Pm6r655k+H9A67-d9AchD9qgsEKgU5oY6N1=JbTRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4x+5Pm6r655k+H9A67-d9AchD9qgsEKgU5oY6N1=JbTRA@mail.gmail.com>

On Mon, Apr 14, 2025 at 09:57:26AM +1200, Barry Song wrote:
> On Sat, Apr 12, 2025 at 10:06 PM gaoxu <gaoxu2@honor.com> wrote:
> > The zone info obtained through T32 in the Android 15-6.6 system(arm64):
> > (struct zone) struct (1664 bytes,
>
> I don't have a strong opinion on whether we need `zone_idx`—I'm okay
> with having it or not. If you'd like to add it, feel free to send out
> a v2 noting that it doesn't increase the struct size. If no one
> objects, it might be a nice cleanup.

Plus it's already 1664 bytes!  And we have, what, 4 zones per NUMA node?
Growing it doesn't feel like a big deal.  Although "saves two assembly
instructions" is also not exactly a big win.  If it saved a cacheline
reference, that might be more interesting, but it seems like it's more
likely to introduce a cacheline reference than save one.  Maybe just
not worth doing?
