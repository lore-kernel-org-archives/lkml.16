Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3264F229B2D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744841053; cv=none; b=imQB2y7BOCaRQzP1VXLNk6D11bz3oWnkDoPYK4dhk8JluVc4HBsl9KeUWP5TRoaKpb+bNlHAuOxv5DssBEd1GR5EW0fJuoTmyv9i/eaa71Frf6audo8fCKiHjSWnX4BUmOdAQ5ixrqqsVMS1ix8g9GCZObdDYghA76ViwWoF+yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744841053; c=relaxed/simple;
	bh=gSxlhszI66ERCI3nrFsLvE3Q6T6jmOFikPkhA+dNYhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fw+3O6opONuiWamJcon+ZSKQ0ZxP4gSVsv5jl3NEzRJAopg7tR2oUJ3piIGTJhpSNx5EQTpu+tO6REtRL+l0clakb/H0indVhwIDO6VuTsykmdwK8LqXXbzUkleQH5ecfmBtbsb3eitvwX3AzvXPMi/y8Zi4g2RptAjcXfBZ/rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=YhNK+7/3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nDxjyZmn; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="YhNK+7/3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nDxjyZmn"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 40B0D1380169;
	Wed, 16 Apr 2025 18:04:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 16 Apr 2025 18:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1744841050; x=1744927450; bh=1TWmWr2OgZ
	PZ1/Z1kcBe1cqlt8sQxsAJX/DKNvgHIF8=; b=YhNK+7/31jCPLpMwG2GPhSrkkX
	UfB8TxtegRIX3QQeVu9a4WQ+MiwbizDcmOdQtJUBKq2NcQcfllj9hUB7yMPPkUb+
	/fqnk8hpUVyvV7eX7ZmF8REU9Q3/JsGyp99MlE86YvjYWVHivVYnHIRXET5iKuKZ
	X5FqN+mrc/7jydWlO5motCPyDLk+2q5cwcrDKPjk/klOqa1LmA1OkvLdDBuLXEya
	EtuzieVkjftc1F6IL6dbgegjBHuGsgcbXcRMdjdTdZKrdxOYHwZvQGLcyxgBpUZ8
	f5hlgPC0gHIIk8BWrLB/3RGQBw2HDE1iZP57WLaAAf8u16SjcPlAQoR+Ok6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744841050; x=1744927450; bh=1TWmWr2OgZPZ1/Z1kcBe1cqlt8sQxsAJX/D
	KNvgHIF8=; b=nDxjyZmnMO5CYBcOVh8rGncN74JXK6Xvf49IG9CcLEp556WNr2d
	0kRZsqlXv1RxALylXnxhssx3Vs4w1NQHGKeLHVbFTinUKZxhjmKmF65F7kqfWnwa
	ZlyRaRjcL8xcMcrhsE8/upgK9F2sjVbjrSNc0wJrcFipTV+fJdk6Hb7qFtdWzCw7
	x4BMhdq++aLn4Nsn0K7oKxJAdFh989Iaq99/zS8TAAJLQ+QkeMWYvSF/g184bWjD
	grfR30COGOTMuFJT6SZzLbNlXir+A9KwpNU32T88uELVIsYvyfmKoKpZvfIBkk6K
	i2IRX3/5L9VjY84J5IZWB+CtzhoWI4dzhbw==
X-ME-Sender: <xms:WCkAaC_ZEUbYS6WnTfkGcrEO0u9Vv8W58_f8GbzvtJyEb4qcd41rZg>
    <xme:WCkAaCvPAyDD7igpbqNRNB4uxs3X0KPcb3SQGFehoxSFrnk8x5lrARPIvAYxKZaYb
    JslVdDn-HzsOT9EvgQ>
X-ME-Received: <xmr:WCkAaIAvxEps5TmMBPq1pl1BhBEPvuNM_heRDwBPbElSU6jEGZbrmorACSmplBvDOcOHLI5vXqtgk0Dzd3oGhuy9T0ORlFNH3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdejheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    jeenucfhrhhomheplfgrnhhnvgcuifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqe
    enucggtffrrghtthgvrhhnpefgvdffveelgedujeeffeehheekheelheefgfejffeftedu
    geethfeuudefheefteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepuddvpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrd
    hiohdprhgtphhtthhopehfnhhklhdrkhgvrhhnvghlsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvug
    esghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhr
    tghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtoheplhhumhgrgheskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:WCkAaKelGCfwGmKHNuC8sn3WnFTFJMlFRN57jrso-jefZE5Y9AHMaA>
    <xmx:WCkAaHNWio4Bi0XBrc_YBrn6f-2qIMT43aTY3rlfFX8yUjrcRB4nSQ>
    <xmx:WCkAaEm9fOdzHUNbdbKUdjRZOrs3qWhgkAo29KjB0qQH0Fr7E4B5cA>
    <xmx:WCkAaJu_FeKFm4aNCikD0YFvriBJsoG_lsjeiyF95HXB4IT0dWycqA>
    <xmx:WikAaB4YDyaaQmaw0W0C3qa7i7bV_bmsw1tPbkfedwe4m0JZHMMyyM2V>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Apr 2025 18:04:08 -0400 (EDT)
Date: Thu, 17 Apr 2025 00:04:06 +0200
From: Janne Grunau <j@jannau.net>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Apple Display Pipe driver fixes
Message-ID: <20250416220406.GB8400@robin.jannau.net>
References: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
 <aAAZDuuj64iLJevQ@blossom>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aAAZDuuj64iLJevQ@blossom>

On Wed, Apr 16, 2025 at 04:54:38PM -0400, Alyssa Rosenzweig wrote:
> > This is preferable to driver changes since keeps the device powered on
> > if the adpdrm module is not available during boot.
> 
> Struggling to parse this sentence, do you mean to say:
> 
> > Driver changes are preferred, since that patch keeps the device
> > powered on if the adpdrm module is not available during boot.

no. The sentence misses "it" between "since" and "keeps". I meant to say
that the linked devicetree change is preferable. A hypothetical
adp_drv.c change to keep the power-domain during s2idle only works if
the driver is loaded.

The changes in this series (especially Patch 1/4) just prevent the
soft-locked CPU after resume. The touch bar display won't display
anything.

Janne
