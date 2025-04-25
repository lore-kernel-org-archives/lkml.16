Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1507233712
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579721; cv=none; b=cCaRVIJuNn2Vu4IWXuXTfVbmXoio1puobz7hPXclA0hlLTm54ClT7MxpFmnM2DEco+nzF2oY5ajJcgt5XiyvrPvYLJsuPZ7pbi5qFeTFs9WsyGCSmewGpj08djEEHU69tpFQWFauK2knmbvswN0nkAcpDBiSegO/jSQGp5gcVCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579721; c=relaxed/simple;
	bh=Jz6HwpESKskwrSDUk/MVpHJjC1/vKAJLsm/R6AHLNFk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ABH52JAVFfnKwU1eltW5e60+5AzL7Agxx2OGiY8UKcbV0jyFWjIYsbAHZ6keh5OLcifBoXapcM0/5w8QREPDlekLgDNT46iQOdc1M+QSwE4fNUznmq6F8CL1y5BVmFy+ZuaBjzvm4uZNR64HI/Sr5kkek7bpu10g5eZOMbmOiYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fW8/UWV9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fW8/UWV9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5689C4CEEB;
	Fri, 25 Apr 2025 11:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745579718;
	bh=Jz6HwpESKskwrSDUk/MVpHJjC1/vKAJLsm/R6AHLNFk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=fW8/UWV97/RnA5oJHPTKuY0ncOFjzeh/1EsSA+IWCZPeEl+G0x1LHD/G5AKPYmREw
	 0kum5K44MbHSGMKd0ZqCZWSyHSayaBf4T6tf488Erc2HqXjvOGKJ5cS4s/y/ipLHqf
	 j3m2VjnCxgPWRe1H6DyMdbdRzycmOFhUhM8LSXLHEyMkD989qFz4rBDfj9msoleKvj
	 nguhtXllG+EE2+/Q+6svD9+5D04nFmFRt0OXAePrcamVh1nZ5+1MofaR8LOa2hXYJ7
	 45p29V960v8XB0B2v1AGlA0wWwxMNwPFF8ZhfBKCgbt9jdnX/LSUScpZIOTmlxWqk8
	 5ULh+lVng7RLQ==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8435B120006C;
	Fri, 25 Apr 2025 07:15:16 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Fri, 25 Apr 2025 07:15:16 -0400
X-ME-Sender: <xms:xG4LaMsyR4FO0u6_-wCBIYjZO5UYgO56eaOt02JnehaQaxk3QVX_qA>
    <xme:xG4LaJceDShTEZ68LgTRcmApfb2oRTR5cYR-srI8CRHZf_mTtZaSf2lh4y0_6Mkf5
    H2dOiE1HZFLXBcGG2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvudelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnh
    gvlhdrohhrgheqnecuggftrfgrthhtvghrnhepjeejffetteefteekieejudeguedvgfef
    feeitdduieekgeegfeekhfduhfelhfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvg
    hlrdhorhhgsegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopegrnh
    gurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepphgvthgv
    rhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghruggssehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegurghrfihisehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepjhhohhhnrdhogh
    hnvghssheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouh
    hnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:xG4LaHwIpvNMGLj4WPrz7DoFlrYl5hVqALduY6g16n6scwDtecnURw>
    <xmx:xG4LaPNwhIilW5ioS4D9tjzowRGiYCITuAyDfho4TaQB0b-oqMI9sA>
    <xmx:xG4LaM8tJjQiMffFDuL6BzEZ12cSycjLSTtP_fPowDfauJxQFLoR5A>
    <xmx:xG4LaHUXJL93l0BEjk_OLgJEYIkv0H_5L8Ba22nRckoPWxJ9kjcCIA>
    <xmx:xG4LaFes6lePAz8oGDKVHJg1sX1-btmWwWS3cThEqxkUh9S2cC26PHur>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 522AB2220073; Fri, 25 Apr 2025 07:15:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Te1e50bc317cc892a
Date: Fri, 25 Apr 2025 13:13:28 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Ingo Molnar" <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: "Ahmed S . Darwish" <darwi@linutronix.de>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "John Ogness" <john.ogness@linutronix.de>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Thomas Gleixner" <tglx@linutronix.de>
Message-Id: <209d0668-35fa-4499-adcb-319f26254be9@app.fastmail.com>
In-Reply-To: <20250425084216.3913608-1-mingo@kernel.org>
References: <20250425084216.3913608-1-mingo@kernel.org>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less CPUs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Apr 25, 2025, at 10:41, Ingo Molnar wrote:
> In the x86 architecture we have various complicated hardware emulation
> facilities on x86-32 to support ancient 32-bit CPUs that very very few
> people are using with modern kernels. This compatibility glue is sometimes
> even causing problems that people spend time to resolve, which time could
> be spent on other things.
>
> As Linus recently remarked:
>
>  > I really get the feeling that it's time to leave i486 support behind.
>  > There's zero real reason for anybody to waste one second of
>  > development effort on this kind of issue.
>
> This series increases minimum kernel support features to include TSC and
> CX8 (CMPXCHG8B) hardware support, which removes 486 (and derivatives) support
> and early-586 (and derivatives) support.

Looks all good to me, thanks for including my earlier feedback.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
