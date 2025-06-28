Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C2E2BAF9;
	Sat, 28 Jun 2025 13:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751117114; cv=none; b=BWBczxDEQ4c7YeNYje5O5L5SLww6I/HQVJL1dR49jevRrVRMtebCuvESuXxLwPzPeY7o0HPTWgtiEAX4J9jkKWlq+K/c7LYJwfoNDHUhXPzrNJzfGP/8qGRHLwNBj3xKrKvF4xLio6KcOPnGts/fwtVy7Lc0V3LHYYMP3/GJoYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751117114; c=relaxed/simple;
	bh=a/VRXOBHb+54bJLtyVDnQXqlX8sSkyFG+BAHc8Z76v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ua0/la0Fky9IPLcffM0OW9QuFbdEtT68w20fSy5s1birTLzQNDABPT3w1f0Lk+kbDmc/7xyM9qg2K4xY26ysfj2Ubl2FziE7nCUTyGTDmX5/O6vFWiQoIODY/ltv0V886Kye4l5S+M7HoVwMauKtoOsW0pBWMPlWIlOgi36puQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=SyV9Eq5A; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T/sfxZf2; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="SyV9Eq5A";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="T/sfxZf2"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id AA2C3EC02C2;
	Sat, 28 Jun 2025 09:25:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 28 Jun 2025 09:25:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1751117110; x=1751203510; bh=+DXqWG5G2Q
	yQpZZ3WaDiy1a334HccLT+TaSWZASvRlY=; b=SyV9Eq5ALNAKFps5UIkWAtGPNd
	DrUA2p3YdFAddWYrbns/zRl/fwEP5cHewxMytBzkOIGZA50YGhEHC9e8P/l57ig8
	7uZwtEvIgJmam7eu0Lt9LKD1yKNWXen8RJiGI3ayiiPVgfpYDwNMAmOfwniNNAfh
	nA0pypWNisUoFxWVxxrlLs5iip5HcyXwQ8D2ABIabR7s23Z/dbcdAbjIrUboPjZ+
	SdPaxt7oJX4ewInEzsiJyzXMipeNOgUarbiuHmHaPBVLrl57S1kg1pNkP+xVA0cU
	eOkAB4C/7OKrbF5XvH+8s+j3mQTK9KUh3obPUalI+YbfnPGV77BtiWgAxnKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751117110; x=1751203510; bh=+DXqWG5G2QyQpZZ3WaDiy1a334HccLT+TaS
	WZASvRlY=; b=T/sfxZf2BIhXU/Q0p81DtiJDKWEgwxekOSA0c/Ebj0VpqsJICb/
	UHEC6+oPRxth4thKNBs7UJItW2omHaGXCaD1mBT3GADoCAj4oDoBWHeaJCEVGvrJ
	rsgRhpM0uSBDMpdMXM/OsCgA/YkAjWCFalNDbXYTcBmMqBGteIqlAbcE/BxlJUMM
	tFwS41ouyFpqhi46R76q+bLLdJsFak651QoLZ1WM0FOaoEE1gvhcK+PDV3FjSXhr
	JhR8HE+BSv7ISNzpudfv01GmPPovdmnRKOWqI+iNtJnAio3RsuDZEoPw+4vyj1wG
	1FyWb3lqv8NAl/u1xaEuRu3CTFKVa5KMPaA==
X-ME-Sender: <xms:Ne1faFLXLjXtyZ7aktRs1oNrSMOBPW5a6vgD5c5d35zC1gQe0dspbw>
    <xme:Ne1faBJ2851feDkLPumPAVvxcZGYowZWsitNRp4DRbIHDKcvcWV7GHu6sAuJWGv9S
    RD0XDQfNTdh7STJ8_c>
X-ME-Received: <xmr:Ne1faNvJtWjwVzG76yezLzcP5l7vh7S2bsSFoLYYu6FAew8BoM2C9EdCld37SeHgmIzqXN-H0GUgbfzfSzSehpQwOgUSoxfu3WU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeitdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcuifhr
    uhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvdffve
    elgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnh
    gvthdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtgho
    mhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtth
    hopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhh
    sehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegrrdhhihhnuggsohhrgheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgt
    ohhmpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:Ne1faGYgiS0zsNKdAhS_HbppMNWRp22w5s9bCPujoAbeqe3VohHqLA>
    <xmx:Ne1faMYzyiS_XVoFfm5W0Ea_PphlCEM2RVRL1UrFMZ4ulXulFG2PpQ>
    <xmx:Ne1faKCLCkQnpqhVrghfeOb5yVj4PFrZUSgYtXz6qwGp9zgt0HTWRQ>
    <xmx:Ne1faKbEDFxdtTLERSLTtvnvzDaWnvyq_hqdpQu8odr4ll7K4NvgKw>
    <xmx:Nu1faNeom0iqmYOXF3shAY5x3MB1UzbBOt0ndIOBtMC2HpuuaS-XRO0u>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Jun 2025 09:25:09 -0400 (EDT)
Date: Sat, 28 Jun 2025 15:25:07 +0200
From: Janne Grunau <j@jannau.net>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: init: Fix generics in *_init! macros
Message-ID: <20250628132507.GA1546990@robin.jannau.net>
References: <20250628-rust_init_trailing_comma-v1-1-2d162ae1a757@jannau.net>
 <DAY60NP32ZDA.155XFXZ9AOF70@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DAY60NP32ZDA.155XFXZ9AOF70@kernel.org>

On Sat, Jun 28, 2025 at 02:29:11PM +0200, Benno Lossin wrote:
> On Sat Jun 28, 2025 at 1:36 PM CEST, Janne Grunau via B4 Relay wrote:
> > From: Janne Grunau <j@jannau.net>
> >
> > The match pattern for a optional trailing comma in the list of generics
> > is erroneously repeated in the code block resulting in following error:
> >
> > | error: attempted to repeat an expression containing no syntax variables matched as repeating at this depth
> > |    --> rust/kernel/init.rs:301:73
> > |     |
> > | 301 |         ::pin_init::try_pin_init!($(&$this in)? $t $(::<$($generics),* $(,)?>)? {
> > |     |                                                                         ^^^
> >
> > Remove "$(,)?" from all code blocks in the try_init! and try_pin_init!
> > definitions.
> 
> Oops, that's a good catch! Seems like nobody used the generics before...

Nobody upstream, it's used downstream in the asahi tree.

> Do you need this to go in as a fix into v6.16, or is it fine if I pick
> it for v6.17, since it's only a build failure?

I don't need it since I have to carry it anyway in the downstream tree
but I think it would be good idea to fix it in v6.16.
Since it's in the kernel crate (the macros in pin-init are fine) I'd
propose that Miguel picks it with other rust fixes.

Janne
