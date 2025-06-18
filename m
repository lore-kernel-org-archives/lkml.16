Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCD31C5496
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750223858; cv=none; b=kCmUH6w8Rsg8l2E+69AONGceKOcsSXA6xIPArha2rXpGtS3C2OaO72iIKskqKwLSQqVyZWVXyFumGJr3wSDQ6tLO0TIahr2VWioW+zCvFTudUD493DDxvYtQu25iUetDuwyyzIx/ES14N2qqUr+7/WLfWTbghihh0ZH2eBo6HfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750223858; c=relaxed/simple;
	bh=WexBtDk2E9LKCacblwmFztJs1P58mwxrFjwv2qAp77I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhfYqxUvZiJXLvMZX+UgVDgoNMiiUX3QofI0kpajb3RqALpchc5YITQZooBvW2RZMVwcUffxoQBHHbeTRiTS2bbsVNn3FW8wL8zVMefyV5LV/At07s3u9X40Yrt0vY5CujxEYEeDkJkIqW5YUIob4V4ucWkI5OwosCsCf8HnQ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UsiC4fJC; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UsiC4fJC"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a44b3526e6so85689361cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 22:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750223856; x=1750828656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZS0GU7imY1C4qrYwHoQAIT1W20r16a6TjrlPEOgXYU=;
        b=UsiC4fJCfeVLCnArzIBYSLHwIgFyf4d2X0KnxqLG+OeHRAoyStS1U0aBdQvKwU8r6A
         LIozT2SGaHYBlLg35UnVDnLQpJSzrBQrU6cu5NTNT0dCTTZvI3BleF4oNOs1Y12W4wlL
         Dc+55KWD38tmZSJ/CLtrQ0BZaozV/FQL0iT0D35nh94zVsBSOfiCKTwc2+De6NPJ4JAy
         cDxEk9kKFeOppOQpVvsRH5k7aV8+BAZs6AYd1IMnjD6Xam4VjgX5zhSQUpJHaffPwjdr
         926uIBdyoXDpiUdiZUwUNjEIHhHpbmcC/FCxo4KnjdTaKLD9GdnL80nVloB8/VHM22AK
         HwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750223856; x=1750828656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZS0GU7imY1C4qrYwHoQAIT1W20r16a6TjrlPEOgXYU=;
        b=Q8+Cik9rS3oDp+2r8PXFUFNUqepQY55UApGczbVOUDuWS1W+HajzBBiT+vdCfl9Gkq
         DjmZ7s374aKhu0R/MeME+OqZSkcbFGFT1N4gifzxJddHQsDOGNtgSLPhz5K9sphhnpBn
         P5ZHbtc7NQNS0EIb3Co9wSqxtV67HyBNnWDXZp55FQDRWdQGuIydVitLtGpEB8IQJ41/
         34LnDzNX9V1PnCvijV5Ox9h3psp2gbrBFR9wKSKuIAMT8MLvgQiOGG0CHjjkvQxK01+9
         t+wJrmLKgtf1mvMYNWqz6s4eJTryqkIJ3ovwlJLATnuBwOyvKnTyMQ8gHrmZdOCOonoI
         E2sw==
X-Forwarded-Encrypted: i=1; AJvYcCXhXuJmXbl3SIvrTzxGbHMTVpy5t2s8e+ZcP3+j0BvwzGOC5zsUmDaygx/gGdDi2vCdj3V1RaWwHm1uW6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpK3ToY48TevYGPoW4tJlrCzJUF1qy1QdmDJ1sOubqo5NJp6cA
	7w2uR5vz/2crMl8jvjH0tbRZCCghNUfs1Lvv9xyHxwwMbHxzCMJsv+50
X-Gm-Gg: ASbGncszsMrRPZDTeuH2L1JudIEMzcHdS5Y6t1Rh5lk1NaRjW9GndE6qpNUqPA6nWKm
	Pfzi6ulcnkggqbYscouEmes0CCmQjkhazMCQBvZ1E39hitfM8Touh2Dv/udAk02i9M4pgSRd90+
	HvHui4/Le4qrFVqEzr+gkiBXe+uxfM4Ese/gW42vUl37Y8mqgKMf1GwSjQxZFKceOx86Oj635X1
	j5qrCh/vMyfeGMvM+2vNykjPckGHu5yTT82f8080Y4zVoMVrdinGkVt/9q82tLzRC6nctjJR5uD
	AzlPVgR7B7pYvhUn8hKYxkBQOPURfHgTva6XeDht/xZVkLQvtygJsbW/Nz8ThP4CAyBMV5HRb42
	ARyo0LBO/Gfoq424NVcO2bH36Bt3kP1q6aWxaUTJd7mK156f25mSK
X-Google-Smtp-Source: AGHT+IFQ4YD0qeScvPjSCrO4CwY/Hgqethao3wAwOto+pCfvumm509Bf6OSurwwYn1HLYC7oOT7Mlw==
X-Received: by 2002:a05:6214:5707:b0:6ec:edf9:4658 with SMTP id 6a1803df08f44-6fb477262e5mr291009876d6.18.1750223855822;
        Tue, 17 Jun 2025 22:17:35 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb58e7687dsm22210186d6.115.2025.06.17.22.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 22:17:35 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id C5A1E1200043;
	Wed, 18 Jun 2025 01:17:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 18 Jun 2025 01:17:34 -0400
X-ME-Sender: <xms:7ktSaEEi3QN8ZVkJhJEH77Rov2hii83pxGYv3fZtWuiRi_u2Dj_d1w>
    <xme:7ktSaNUX0IsevyHG5jo2XA4a2X0R84t5lKsBsoaxZCwCxij6Vz-lzUD67zm_OE09d
    q0SAWXfKLZI_us5yg>
X-ME-Received: <xmr:7ktSaOLbvyJtb0TFolxGfCXYLGycJY_XG2daAdgAwgRbSsldfKUGak4afw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhi
    nhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    rghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehlohhnghhmrghnsehrvgguhhgrth
    drtghomhdprhgtphhtthhopehnihgtkhdruggvshgruhhlnhhivghrshdolhhkmhhlsehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepmhhorhgsohesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:7ktSaGEXeSDHYgEejXy_6cV88ozFH7yT0WoAmeYr11vHB50lBkQQdA>
    <xmx:7ktSaKXeP4afb2DjUpraCTkAUGL0HAhpV0GPrS2VkLIqGR_ynC3Ngw>
    <xmx:7ktSaJOmPGKEbdvgX-_4sMwdepUi9NcK3dlWDPqS2D4YxTEB4BwNrg>
    <xmx:7ktSaB2QnM1GGuwTmvO3_bYhNQUc4aRH5aSMzZnrBp1iMsxEWSW3OA>
    <xmx:7ktSaDU3kD7vaQmpTlxFrBAip30dOlRrg3WGuoyOMptaGyK5K7Z6QxkI>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 01:17:34 -0400 (EDT)
Date: Tue, 17 Jun 2025 22:17:32 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Waiman Long <longman@redhat.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] lockdep: avoid struct return in lock_stats()
Message-ID: <aFJL7GW_mdX-VZIR@Mac.home>
References: <20250610092941.2642847-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610092941.2642847-1-arnd@kernel.org>

On Tue, Jun 10, 2025 at 11:29:21AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Returning a large structure from the lock_stats() function causes clang
> to have multiple copies of it on the stack and copy between them, which
> can end up exceeding the frame size warning limit:
> 
> kernel/locking/lockdep.c:300:25: error: stack frame size (1464) exceeds limit (1280) in 'lock_stats' [-Werror,-Wframe-larger-than]
>   300 | struct lock_class_stats lock_stats(struct lock_class *class)
> 
> Change the calling conventions to directly operate on the caller's copy,
> which apparently is what gcc does already.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Queued for more tests and reviews, thanks!

Regards,
Boqun
