Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5731156B81
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749032380; cv=none; b=Tr77x0mH4ilq3d/IUyWeBMZE5o0WgdmJ57MIYN88ACwwBVWdunSpgu4oUP0OzbGU+sFd6kkZ6FqV06bNuYdePYCRO7wkmD6HbJvH5kOeWHgD3nHmzrm6Y1syF5LvZHOfke5FCVX6f4t9FWqh1AWyfwfVIwPtilYKluS74aCmy2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749032380; c=relaxed/simple;
	bh=dqyE9slUR1QxgVP87pCAXxy72IefKePiX8duGwbuDm4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=I/X6IdREO5Lu6WEIYt+97u4YLs2ZwLyqEXKc0t3vtYIHUMliumclwGSWqy8+6yYLcA0Ya0dXpkDvradYLxkVxHgtyJHKhMU4INWd64J6FWepETHBTD7utSnm3XaNFxyTvfOZ4AvW+K4tNUvanf7+hy4KUQZOSJeOYQNocpFml4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kode54.net; spf=pass smtp.mailfrom=kode54.net; dkim=pass (2048-bit key) header.d=kode54.net header.i=@kode54.net header.b=COaL8z7y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oBNLR88B; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kode54.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kode54.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kode54.net header.i=@kode54.net header.b="COaL8z7y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oBNLR88B"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4AF27114021A;
	Wed,  4 Jun 2025 06:19:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 04 Jun 2025 06:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749032377;
	 x=1749118777; bh=jzGfamnjXuCdedVs8bQG0PhMF8FNUo4KELx4ukznBgI=; b=
	COaL8z7ywEU3KkCXoUjOZ3PU4xeaPio4ibht5ldgb9sXfv6KlvA4cnLxi5IYGEyR
	0riG6rvZ/DrCgYAzrNW6FEZB4aAa+vRSVOJiW5EU7HdeUvT+guGUXchHbxOmEDhw
	AcH+qEPeV+bSSwS04ziKanTm2Byw7TTp+c/zcZuq7uV4up+J28nu0LgxOZxdokPR
	oi1SS/cjI5lMdtKUBVY3XPdG2LewiB6Hk3qeaDsZm2FcTy2zG9VKQuqBkjieKXAY
	lVpDTAP07wmPY0SUIq0n687rrU9xFeNcrRkRim+j8VqMwXM7opTQ+TW8M54Vb3kL
	Y2YxifR7jt0U+0/z89Jp7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749032377; x=
	1749118777; bh=jzGfamnjXuCdedVs8bQG0PhMF8FNUo4KELx4ukznBgI=; b=o
	BNLR88BDvnsgqaq2Y+921FMc5FPnaWf54q0ak1+tMA7ktTfYwiXihX1qridzKkdV
	XcVeionCH2XFA6xZRpbuSMmxda9iJw71zHeDA1zzy2xsVAGTJk+fc2zi1eqrfPYr
	L2kR9g3Ux7o40fM8Cmrfbdxw0YXq+QjkvEUu7g3Ba0+gGD/6/Fg089+YJ2cZkH6v
	z32pNLcrpSh55Jwois8Lk/Pk7O3BgYLMXWBKpmE7gwrApgZxYZOia3kTN91Lb7Gf
	dDdSPaCDtYuKSwGxuDcR+IpDW96IhHbjnTKC7I9g2rI1MEMrDTOaXQrtgX/DmhiX
	FP8wA9vAthwY125q1awKQ==
X-ME-Sender: <xms:uR1AaDa6aoFGvp4vOQuuRws4GGuQkjbVOtaTokhc9PYjDKFImNPkCA>
    <xme:uR1AaCbpe8NzHBhVfo9Jxtvn7PgfvPB-4ETVWthUnhpv5yxcs0bHvknZUK_7yo9fI
    8jU7uT7y1L7I3mLI08>
X-ME-Received: <xmr:uR1AaF_BomkHQAgmjEzSy2bspZ3L6cvC9AVXy7JkvEj9XwzzKNnswSP3C5Ezp6JKF4RNvuldKKfEvx8q3hXtwcCrebct1K1iCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepggfgtgffkffvvefuhffofhgjsehtqhertdertdej
    necuhfhrohhmpedfvehhrhhishhtohhphhgvrhcuufhnohifhhhilhhlfdcuoegthhhrih
    hssehkohguvgehgedrnhgvtheqnecuggftrfgrthhtvghrnhepieejleekhfdukeeukedv
    jedtueeuleetgedvueevtedtkeejkeeiudeggeetvedunecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheptghhrhhisheskhhouggvheegrdhnvght
    pdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehphh
    hilhhiphhprdhrvghishhnvghrsehlihhnsghithdrtghomhdprhgtphhtthhopegthhhr
    ihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopehpshhtrghnnh
    gvrhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishht
    shdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnh
    gvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsihhmohhnrgesfhhf
    fihllhdrtghhpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehphhgrshhtrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgv
    lhdqsghouhhntggvsheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-ME-Proxy: <xmx:uR1AaJobfx6tESM5eLtXUEIkuw61AFpGRbIp0iOWprpKyTT0B9sOVg>
    <xmx:uR1AaOrgJmkhj45RwJ91OwWpPAgs3YVVovdskxIPIBBnXQpRD1lPSQ>
    <xmx:uR1AaPSbPni4LUcKH-J9-ZQKNFd4urnq1CMSDn7ZTGpMbu1g1o5F0w>
    <xmx:uR1AaGowU0ImgiUKztk3WPusm9Xyxlj1wtMMojEF6WPtavARjusi3Q>
    <xmx:uR1AaEsVoPamp5bPtP2SyB3XtNY1F6fjvpVlg55PcGctvNkrah39LDBW>
Feedback-ID: i9ec6488d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Jun 2025 06:19:36 -0400 (EDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 03:19:35 -0700
Message-Id: <DADO8D07ZTFD.1A1L9QSSMDTXR@kode54.net>
To: "Philipp Reisner" <philipp.reisner@linbit.com>
Cc: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Philipp
 Stanner" <pstanner@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Danilo
 Krummrich" <dakr@kernel.org>, "Philipp Stanner" <phasta@kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
From: "Christopher Snowhill" <chris@kode54.net>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
 <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
 <CADGDV=U_7CdkdEiLX9kj9yHsXhwb5zP_eGXpwmrj20cmgzMAtA@mail.gmail.com>
 <eb5f3198-7625-40f4-bc23-cac969664e85@amd.com>
 <582e10673bb749f18ebf8a18f46ca573df396576.camel@redhat.com>
 <b055ff59-4653-44d9-a2e0-bb43eb158315@amd.com>
 <DA7PC2LNU79K.28KBFOL3MGI1S@kode54.net>
 <CADGDV=WJjcLds5T1uAst7ctOMbApnLR6ixH8wvgvKvF-YS6kog@mail.gmail.com>
In-Reply-To: <CADGDV=WJjcLds5T1uAst7ctOMbApnLR6ixH8wvgvKvF-YS6kog@mail.gmail.com>

On Mon Jun 2, 2025 at 3:25 AM PDT, Philipp Reisner wrote:
> Hi Christopher,
>
> Thanks for following up. The bug still annoys me from time to time.
> It triggered last on May 8, May 12, and May 18.
> The crash on May 18 was already with the 6.14.5 kernel.
>
>> Could this sleep wake issue also be caused by a similar thing to the
>> panics and SMU hangs I was experiencing with my own issue? It's an issue
>> known to have the same workaround for both 6000 and 7000 series users. A
>> specific kernel commit seems to affect it as well.
>>
>
> I posted the stack trace earlier in the thread. The question is, what
> was the stack
> trace of the issue you are referring to?
>
>>
>> If you could test whether you can still reproduce the error after
>> disabling GFXOFF states with the following kernel commandline override:
>>
>> amdgpu.ppfeaturemask=3D0xfff73fff
>>
>
> that disables PP_OVERDRIVE_MASK, PP_GFXOFF_MASK,
> and PP_GFX_DCS_MASK.
>
> IMHO, that looks like a mitigation for something different than the non-r=
eady
> compute schedulers that seem to be the root cause for the NULL pointer de=
refs
> in my case.

Indeed, it's mitigating something that leads to SMU firmware hangs. I
made a guess, I probably guessed poorly, that your compute units may be
failing to wake up due to a SMU hang. But you have no SMU hang log
notices, so it's probably not that. Oh well.

>
> Anyhow, I will give it a try, and will report back if my workstation
> does not deref
> NULL pointers for more than three weeks with that amdgpu.ppfeaturemask se=
t.
>
> Best regards,
>  Philipp

