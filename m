Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8861E18EFD4
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750330492; cv=none; b=fDoEVISupQUA/H9p4v7d4mFBzdT3KxUqluwUTeRy5XwgSTJVc2zbBDjvtFjIyZ4soVxsgjS1OoHasj9wDM3VRwCH75+Wu7j69ORPlhbnRnvXRAE7X/WgI6Up2ZrB7YUwev41ueFVxJeHMB5Jw3ooGDbrU0umDTkMZCEFHpR6R/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750330492; c=relaxed/simple;
	bh=QqVzPTbie3A9TvuOlY17KcQzypNzkfvBHCByV6vt1Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGwTPZeacsROoE1bqkwSnz0fEaZ4P4hWoE9PqvoKSzuOM/k2V2+vYFpMObtDcUCDOE1uHEGQyPT4hTutjA+1rvLFRc3voPiIWCr09KkFpffvHcKCDfPvWUowqWLa8ghl4f/toAc0DONsXoODzvWylIrReQnN5xMkIbwfbG/wCZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XnigmRmq; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XnigmRmq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=H9hr3tlsnhidjOFODG9DbxD4YaZN1ZX69cfLfOX1Jsk=; b=XnigmRmqze649VXgPYYNmISL8r
	9uulw26JKf3uxR8JnkRycP84b9zigcJ36hZzL05uea6d0hN7FjdhoOm5b3BpEcD4+4b8sNFcmVKXH
	LbIa7TsXTwyf/LJ7D/FhQILQPsUnlJHEJeAipX/kbe345RHaio35jOzS1QMoer/c+FriLnOVquUT0
	bPlC3x6DC1c+sDWLKn3XCoscwnkXWUD7Bm+8wuYXgjrcZUmQaqbEucguTipkbLbdIZOerfVNUIsCb
	pm+Kt/SgJzmOmbEFeE0zteKdfusGEiSSo/ywaLcT5FtyBy+gQPinxiF2CgyZXhLUpMvc1Ffx1vfAy
	fjXWY9Mw==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSCut-00000008LBL-0vwJ;
	Thu, 19 Jun 2025 10:54:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 553F230890E; Thu, 19 Jun 2025 12:49:35 +0200 (CEST)
Date: Thu, 19 Jun 2025 12:49:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
	nik.borisov@suse.com, Lukas Bulwahn <lbulwahn@redhat.com>
Subject: Re: double free in alternatives/retpoline
Message-ID: <20250619104935.GE1613376@noisy.programming.kicks-ass.net>
References: <CAPM=9ty750Ex93+9d6DJ1hFJE8XuhXOf7Q7dgXryvhGYLwHbdg@mail.gmail.com>
 <CAHk-=wgd=MdzRHO=bV=g0G0mMV+7ek-q2WnQ8P5sxwJdau-t=g@mail.gmail.com>
 <CAPM=9tyG7+6ZQuBQY=nwiPxywWgVtOHus7cH-KjKMgn+0ADv8Q@mail.gmail.com>
 <aFPFHSLd_b538ovf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFPFHSLd_b538ovf@kernel.org>

On Thu, Jun 19, 2025 at 11:06:53AM +0300, Mike Rapoport wrote:

> Looking more closely, there is a typo in its_alloc(), it uses CONFIG_MODULE
> to choose an its_array to reallocate while it should have been using
> CONFIG_MODULES.
> 
> Lukas Bulwahn sent a fix for that:
> 
> https://lore.kernel.org/all/20250616100432.22941-1-lukas.bulwahn@redhat.com

Indeed. That fix is currently sitting in tip/x86/urgent and should make
its way to Linus soon.

