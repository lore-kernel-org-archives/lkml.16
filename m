Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F376622126C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583050; cv=none; b=tNDbibv7SEiV1APiZZGq+56b2xP3M/ouI5VqRbwsqQgQQ9HtB+IuYL4NdpCdjS5HELA51RXeHctVaUCIM7ITWmq9SN7I0HPr9O2fbvFZ/0Aq6YR2SntJTWzd+uIJfQyUrZ4GX06AnXikMP87n0WsapYwHoetQ0sf0i66H7Ig6ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583050; c=relaxed/simple;
	bh=FVLdy/reYIaU7YLW3jcTrS26AvzbBotUMnk7uUPToP8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=NCJ2xHhV9uI/VJZx2UdiCXTQcZIfU4PDnyCTptInXIt7cZYzKbZbX43+D4w6WIgZyMq+4bTkZibk+Ob5mibB9pJTqkovb3jVt2pNL380fvdBM2KjjNvf2sVoVJ2IWXoSV3SxAaozD5WFIWO1R2i2dK1Vu9YqcQvjXwDGnGKHJjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pk3DXMfo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pk3DXMfo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64729C4CEE9;
	Fri, 25 Apr 2025 12:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745583049;
	bh=FVLdy/reYIaU7YLW3jcTrS26AvzbBotUMnk7uUPToP8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=pk3DXMfo8n5FX9sh79Ao35bt1zWuaJ8I7jfJSvDmR1Zj/vQjVEn66MndX5EakgYc9
	 qxblgy29DYCj6UWyRs/UatAGDdq+2Ho79/gi2Do/NeRtSOEx7uoYhzTIoaUzU76BWg
	 3AHrnpUEe2slskEXaPZG852DJ5g8viK07ohgrRSmyhPwaIxoYQks+iOcmst/drRRyL
	 TFCugs5pSPk13WjTEQSljAwVtgw3x+sUwwkNiqmZr8LeC3ztyuQinGs27mNrLK+Qh2
	 ANZD0YQs5EM92mjnHZqixN+3KXlYI5wUtXNhk8a49banTMoLMNLx5QZeQm02BXRUKy
	 QX/3pSXw1Orig==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6EC901200043;
	Fri, 25 Apr 2025 08:10:48 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Fri, 25 Apr 2025 08:10:48 -0400
X-ME-Sender: <xms:yHsLaAa3hQQziR5QSaZDrSrC8AoSGuDsaO7CFir28h-YWnCP2Hz_PA>
    <xme:yHsLaLZt3ERCl04ydlDf7WURTxF5YglLRF5H278oYxNQCMh9E0P4fGIa3lTLGtr59
    gzofpzQx1c5xL2-UBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvfedtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:yHsLaK-SlEsG46a6ztLYJ-hIdqNdBQ3bgl3w0IJCvOdI40eynh2Xpg>
    <xmx:yHsLaKoaQ-rNUNgyu1Uo9m76lAZ6U18ZDkH4rZyURzz8bLDSJLRUbA>
    <xmx:yHsLaLragkWw-1XOTiAN1qjtmWHf2uGvwuEq2ow6mc-ibrN4sD9Xow>
    <xmx:yHsLaITZmJl50QKA3CWAFgJ6b7ETcnfWFPzAE4Rv6x16NCe4hP0Ckw>
    <xmx:yHsLaLrGzimQskFbU0o0Zy14dJxdqnv38UUPKnKVe1SdQL2tAevDsQgF>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3D8992220074; Fri, 25 Apr 2025 08:10:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Td35c5eaba32a0728
Date: Fri, 25 Apr 2025 14:10:27 +0200
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
Message-Id: <956412a3-43c2-4d6e-bea2-2573c98233ae@app.fastmail.com>
In-Reply-To: <20250425084216.3913608-14-mingo@kernel.org>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <20250425084216.3913608-14-mingo@kernel.org>
Subject: Re: [PATCH 13/15] x86/cpu: Make CONFIG_X86_CX8 unconditional
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Apr 25, 2025, at 10:42, Ingo Molnar wrote:
> @@ -257,7 +256,7 @@ config X86_MINIMUM_CPU_FAMILY
>  	int
>  	default "64" if X86_64
>  	default "6" if X86_32 && (MPENTIUM4 || MPENTIUMM || MPENTIUMIII || 
> MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MEFFICEON || MATOM || MK7)
> -	default "5" if X86_32 && X86_CX8
> +	default "5" if X86_32
>  	default "4"
> 

I just noticed this one: the final 'default "4"' is no longer possible
here and can be removed. All the remaining CPUs report family "5" or
higher.

There is an old issue for some rare CPUs (Geode LX and Crusoe) that
support CMOV but report family=6. These to boot a kernel with X86_MINIMUM_CPU_FAMILY=6 because it triggers the boot time check.

     Arnd
