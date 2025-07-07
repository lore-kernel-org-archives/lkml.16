Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF52294A0A;
	Mon,  7 Jul 2025 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885055; cv=none; b=eUfPi94Qop6KFgsSP20gcgHRIx2IBaLRGcHo601zb0GivzF8V7vXRGXxbJZCTD1EBQ/A0J7fNgNSbpPN1iJ1FoBFq9IOwukZob5c1BUXgzW+9YfAuyT0zLbXCgNCVsZMLfXxnsuxWInPKCle1fRqkxxL851MjsCoQaFiILIFwOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885055; c=relaxed/simple;
	bh=c5yRczUDFSdAdgPbN6dY3TNT3pnHLBR0hx9+hGQJrKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKTBCaixYPNXxAwuw3EtrHoMo/KTLehoSM8NeBA55uskeBgNC4rafwwPj/lff5Jb+ExqpN6PDiwzRhXfM8Q2aJAFQDHh+GDQbe/UGnxboElPStP2oMblOnQebHOEzhtX3rvawM53Rx0dKOngPykm+WVLfFBe2vWl5a2fHql2Zqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CCFDA3410B7;
	Mon, 07 Jul 2025 10:44:12 +0000 (UTC)
Date: Mon, 7 Jul 2025 10:44:03 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Alex Elder <elder@riscstar.com>, linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Immutable tag between SpacemiT's reset and clock
 trees for v6.17
Message-ID: <20250707104403-GYA312629@gentoo>
References: <20250703151823-GYA312602@gentoo>
 <daf9ddad1aa24ee18abdc11a9b26ef03bdcbae16.camel@pengutronix.de>
 <20250706040646-GYA408198@gentoo>
 <3732050b6b756868543012c1a1cebbe7cce74d61.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3732050b6b756868543012c1a1cebbe7cce74d61.camel@pengutronix.de>

Hi Philipp,

On 11:46 Mon 07 Jul     , Philipp Zabel wrote:
> On So, 2025-07-06 at 04:06 +0000, Yixun Lan wrote:
> > Hi Philipp,
> > 
> > On 12:02 Fri 04 Jul     , Philipp Zabel wrote:
> > > On Do, 2025-07-03 at 15:18 +0000, Yixun Lan wrote:
> > > > Hi Philipp,
> > > > 
> > > > Please pull the following change into the reset tree. This
> > > > allows you to apply the patch 5 of the SpacemiT reset driver [1].
> > > > 
> > > > Thanks,
> > > > Yixun Lan
> > > > 
> > > > Link: https://lore.kernel.org/r/20250702113709.291748-6-elder@riscstar.com [1]
> > > 
> > > Sorry I didn't notice before, this is missing k1-syscon.h from Patch 2.
> > >  
> > no problem
> > 
> > > Can we get a clock maintainer ack to place patch 2 in the shared tag as
> > > well? Otherwise you could split patch 2 into soc and clk parts.
> > for the ack, I'd assume Stephen have no objection (Cc him explicitly)
> > 
> > technically, there is no problem to place more patches in the shared
> > tag, since the tag will be both sent(by me) to clock and reset tree,
> > so no conflicts in the end.
> > 
> > if you expect to at least pass compiling test with patch 5 in reset
> > branch only, then patch 1, 2, 3 should be included, otherwise need to
> > pull clk branch for additional dependency patches.
> 
> 3 as well? Oh, that's for struct spacemit_ccu_adev. IMHO this patch
> series is not well structured for applying across trees. This should
> have been a single patch that adds include/soc/spacemit/k1-syscon.h, to
> be shared by both clk and reset trees, and no other dependencies
> between clk and reset patches for this to work well.

I feel this is much difficult, e.g. the patch 2 touches both drivers/clk
and include/soc/spacemit/k1-syscon.h - moving definitions, and splitting
into two patches sounds weird

> 
> > I would propose to have shared tag to include patch 1-4, then you can
> > pick patch 5, in this way, it should both pass all tests (both
> > compile-time and run-time)would would 
> 
> Since this is a new driver, passing run-time tests is not a concern.
> Compile-time is, since that would break bisectability for everyone.
> 
make sense

> > what do you think?
> 
> I feel like it's easier and safer for the whole series to be merged via
> the clk tree. Since this adds a new reset driver, the only possible
> merge conflicts are trivial ones in drivers/reset/{Kconfig,Makefile}.
> 
ok, I agree, then let's route the whole series via clk tree, and I assume 
Stephen is fine with this, since it's indeed much simple.

thanks

-- 
Yixun Lan (dlan)
