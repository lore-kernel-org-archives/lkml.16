Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95BA2F49E1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269582; cv=none; b=GlrBDyNIs+WS0h4BrgnjDwPbyyeiuYHIwD3vyseoUoyjIb0D4uymPtDURtHBGoon/7ARyhCdY39EDAyAFJwuX9I1hG9kzY/SBuX2RATY6+aiQEFSmN3wEHb7XmhKkO5QRMA7RQX2wZP1ZNdYDRzdJ0PNxRotSHjdgD42agQKEkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269582; c=relaxed/simple;
	bh=fmZrUX+w5GRKLPQ6AezJr3PHVV/NpAmhCjBVvP/zgV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUvCP+dHy+QGr5lBgbnxltRSsRalWofqIyWH/fdGoACbRUtCx39Ann1yYGbUMSRLel3hlsRduE2MAIaC1/lj8WVWYyxJ8pr3OApIR74gGjjwUxmxkN8/MI6ugkbzdsNFpFh9a4ECDSgX71Nq6MZZqn5P1nTTEA4CA5SqpOT51iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQZFXzd0; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQZFXzd0"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a745fc9bafso11773251cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750269579; x=1750874379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjmCh2/RB+w/n9IlBVg0npjaJbBC2jl3/Xrb2/91//s=;
        b=OQZFXzd0tRpBi/Bv2jeJyxmgriOlIg75YAYySM69gtt+GyGskuxcT8yTE1HO0plzGZ
         TaYo/F9+I1JE9jePE9AHCXGn8PopMWKh0UsRFpQbm7eSxXzheI5yAhE/aKTtyX+uAkTH
         wc3/6T6dt1VAPGGoRdl9C4ZMGWxEfrjnYYkHcVG/55O8dVTV4Hs2g5sJyxCK4stIDbmy
         WyPQs37XZP/1L0lodHWhKdnntzxG+uh6FL3Q1XRyRVRxbcS1sULSDrW3U4D5u4/N7a/e
         ExPoV1yhW5bZzA/gD6d7r9/Qou8o0/xcgaU8C+YjKYPdAmC0sQw4aEWtJ9I4P1NESTSl
         Dqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750269579; x=1750874379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjmCh2/RB+w/n9IlBVg0npjaJbBC2jl3/Xrb2/91//s=;
        b=DEu4DcfS4/A9iKioRxjoVQG6MMA4aOVbhwc5HrwoCo2j6Wn1YjU4t4fZuFMItB+miM
         BCM/1RgBEQJ0sF9G6xfrJ3abeD+JpjvFj8Zbmexn0aAcfvtR92ZiLyOIEozkvfqTEzef
         B3OH4184g2OzvwWNZS2RXOpc44W2tg0OrPazgszsBno3fNlb6LdPv6f2oJfkYoOElFHi
         XSoAbom23Pd75eNQ82Lu0mzItbRfhnyppgD2ytJicaJDmaszBbLI3nswUUevPwJBLFCp
         GGz1X3irLH+vB5ixDWHOJXNJuQoyJwuc9MKMO0QIraL5UaDxHyGPkeGrf5ILhXjOUuMb
         MaiA==
X-Forwarded-Encrypted: i=1; AJvYcCVTFqZUd1RYuc0Ir2TL781/J0kq8GpeI9lYASl8MWMwH8/JnDfzwfpDXAU+UFDpeUOohZn6PR0pFG3gd7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBP0STWgXzfJJ3ttDzKpXEEmPcN52p1M87mB0292h6Xxrm35Av
	rTP4fcdYynIFpa4fox/9pMlieYG0d9xKjkOmkxjJoy3mVK7JAzMevd55PZBfrA==
X-Gm-Gg: ASbGncuw5J4sitECMFa7yDzAunAuL/C8kk6hUYyoh9TtHNO20cFJ8Nw24+L38G7OuCl
	H0sP/qkr5rLg7qW153Wo97kRsMZOUYOpYCgiUeRNPhdFuT+LoBLtsj06m7YLkolyq9i7lh6zJpO
	krXWGtXAktMhnunpJYY/lMD+2gPjhjs5Lcy7aFOKZLrFfnXcJB4eQa19dMQlkcH73mOFjSmLhOP
	QAADZpgV4//3wpYQcXmYxDVbe9WSHSNO/GoFdvhct9ePeH8xNw4N0ORjAWIfrniJqNj4CGBsLCi
	r5dcqqbBvIxq8qJxa0iEZFEQ6pYvqhpZqzVqOMJqpaoUHonieK8d3slsPVDcaxSsZvdcTIqaPeI
	PFb1DvGd3iBPxBl/QMbnyZtSjqsIy9SrgmQSth58KQ61sz4GKBlae
X-Google-Smtp-Source: AGHT+IFfORX76A4PwFogl79kwJZveqv/EbaWp9oKMTo98AdTS9tAyOQPsmDqXkwcIunjnzULtBL8/A==
X-Received: by 2002:a05:622a:2b06:b0:4a6:f4ca:68e4 with SMTP id d75a77b69052e-4a76e24af94mr8076831cf.13.1750269579574;
        Wed, 18 Jun 2025 10:59:39 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a2e750bsm74136901cf.17.2025.06.18.10.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:59:39 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9C7BA1200066;
	Wed, 18 Jun 2025 13:59:38 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 18 Jun 2025 13:59:38 -0400
X-ME-Sender: <xms:iv5SaBMc5vxgyOcxKyMIwnxd-qGUpum9E1IiYN3bsnWUPN7xEZ21AA>
    <xme:iv5SaD8irQ49qG8EqEOt61s20LuFKDAh1sZeHnlbw76QA_Zx9Vb7Lm4HYLeWp1bsv
    27MXwkFSGXTNjPZxw>
X-ME-Received: <xmr:iv5SaASH8PdRN-ursnLCEAJlEBVZno8wxs5KtfA86NC9W9CC9P4bfMCqhzrpBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeffedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteeh
    uddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdp
    rhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrh
    iisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrght
    rdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggs
    rdguvgdprhgtphhtthhopehlohhnghhmrghnsehrvgguhhgrthdrtghomhdprhgtphhtth
    hopehnihgtkhdruggvshgruhhlnhhivghrshdolhhkmhhlsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:iv5SaNuASt_xmeY6r1dDUrlO0ROclXOsQKF6oMzcpiHAf7YK7xAIqg>
    <xmx:iv5SaJdjpfLWvFxPSqpTlIrMTHJuMaQdwURbstUa3xO5Q5PFWGjhoA>
    <xmx:iv5SaJ2t_ynaGML6DRNWvpM-3p5S8TRiDh2cYWSqDizlPTADC4xGVA>
    <xmx:iv5SaF-LMT1UwbH465GnXPFkxihZnUGhaS2jmutesWGVX0DahapFGQ>
    <xmx:iv5SaE9-lHcHQGb0hXgWJuxi63fzUgKUs-4Rm6-J5WLp6A2rYxbHoj2E>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 13:59:38 -0400 (EDT)
Date: Wed, 18 Jun 2025 10:59:37 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Waiman Long <longman@redhat.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] lockdep: avoid struct return in lock_stats()
Message-ID: <aFL-iZL467DTBj8k@tardis.local>
References: <20250610092941.2642847-1-arnd@kernel.org>
 <aFJL7GW_mdX-VZIR@Mac.home>
 <aFL8i4Uraaw9390B@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFL8i4Uraaw9390B@smile.fi.intel.com>

On Wed, Jun 18, 2025 at 08:51:07PM +0300, Andy Shevchenko wrote:
> On Tue, Jun 17, 2025 at 10:17:32PM -0700, Boqun Feng wrote:
> > On Tue, Jun 10, 2025 at 11:29:21AM +0200, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > > 
> > > Returning a large structure from the lock_stats() function causes clang
> > > to have multiple copies of it on the stack and copy between them, which
> > > can end up exceeding the frame size warning limit:
> > > 
> > > kernel/locking/lockdep.c:300:25: error: stack frame size (1464) exceeds limit (1280) in 'lock_stats' [-Werror,-Wframe-larger-than]
> > >   300 | struct lock_class_stats lock_stats(struct lock_class *class)
> > > 
> > > Change the calling conventions to directly operate on the caller's copy,
> > > which apparently is what gcc does already.
> > > 
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > Queued for more tests and reviews, thanks!
> 
> What about this one:
>     lockdep: change 'static const' variables to enum values
> 
> ?
> 
> (I can't quickly find the pointer right now, but I think in lore.kernel.org you can find it)
> 

This one:

	https://lore.kernel.org/lkml/20250409122314.2848028-6-arnd@kernel.org/

? I will take a look (give me some time to learn about that compiler
option), but seems trivial enough, should be in the next merge window if
no problem found. Thanks for bringing it up.

Regards,
Boqun

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
