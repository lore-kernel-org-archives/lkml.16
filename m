Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFEE253949
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589344; cv=none; b=amOhnixTbOLBEMbjkDUFpa2OsoTl8QIT+Xr3YKYsFFCKo9+Jo9AwDyr2fvO4GVMPMK/mpeuJhSDNsnKOjNE3+Xmd6CL0r/NsTyv/o4eC22MTmcLWlaKtRNMLNDnPdIAObEYttPfzOIXsxaHWvyyMR+qYt0EO1QgwByHmaGLnH1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589344; c=relaxed/simple;
	bh=4sj9iDnjyACR9Ifsrqmh5zn0gaIOK/D3AZ1jijsPi00=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=W/CMy00Jp92uYWEDeZsFkxL9321Mo4R16V+Zt4P36UtAKo+DWomVO6AhPgeQR9y70jttN7xz9nwu+OILQcW6V9N2JsyzYu796S8+05QAbjv/Yoat9EQiVR0T2FOoHXC6oYDdsS/OHD/DJ4W+Z/FJalaqgnvwHoT8nj76VExwPeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVRptpDC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVRptpDC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76364C4CEE8;
	Fri, 25 Apr 2025 13:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745589343;
	bh=4sj9iDnjyACR9Ifsrqmh5zn0gaIOK/D3AZ1jijsPi00=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=XVRptpDCNLY3v2NvWw6o2JAUaVzGLGGqs6sF3CKLNtcUz5DC++rsJ+HEFCMP0Q/oF
	 76X/ciOy+sfU9aFJe/UXY3fo0on5L9SB/1B323sdOKMcV9G0CxseKNDKjUfH8p87qJ
	 0m6GRFgManCTvrt8bzxYQFc1fxMYgLu4l3nE6vnS46+8IJ1X4IMI17c9E3lYhloPHy
	 fPtpBV5TakF2Bfr050xrzP0EnvI6ths4QwjxWR/41JWu4YqcnuWcGwXbdyQuq+smYg
	 F0ofXZe/wMt1qYIqKvMGnsqQLHosoK2CpcNXBpVg1N+LgGGKQBoPvUR733MUCFW3p1
	 3HY1O+dFFxF1g==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8304A1200070;
	Fri, 25 Apr 2025 09:55:42 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Fri, 25 Apr 2025 09:55:42 -0400
X-ME-Sender: <xms:XpQLaM_gIYNZWs0BeNJm0dydNpseUCxzG3oeATy0mCq2P2qS21OBOQ>
    <xme:XpQLaEvOME5gGy5IK8lKU2zPfqFGHEBKEz8XmleI0XkqDyqYy0bJKK8_khA0B4zIP
    Dynpv_ACVTEqHv0J4M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvheduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:XpQLaCCQo1LKqtYUquUjZjtl5xCD-mCxyP70k-gVYp3B7PNpA3jOUg>
    <xmx:XpQLaMeJhAUHs4X8JKZHP4OyZbeN5DRBCvXMAwwzJwXU__waV-xX1g>
    <xmx:XpQLaBM47z4GRpD9HrR97HXajpxou2oHBXyVT2YHbQOTza-5X9jYHA>
    <xmx:XpQLaGmOpmQsCEnNNKTRbSS7X-CCc3pTIHmxu1Oewyzyg8uRcXEPXA>
    <xmx:XpQLaDuKRkjc0K7vyHOUC75wSZhSdI0T0II38zvjRS6DfXKNzNJwbkpq>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5B4F82220073; Fri, 25 Apr 2025 09:55:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T7f4ee6b822a03030
Date: Fri, 25 Apr 2025 15:55:21 +0200
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
Message-Id: <39e5a78e-6079-4469-95b8-71cc9e756259@app.fastmail.com>
In-Reply-To: <20250425084216.3913608-16-mingo@kernel.org>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <20250425084216.3913608-16-mingo@kernel.org>
Subject: Re: [PATCH 15/15] x86/atomics: Remove !CONFIG_X86_CX8 methods
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Apr 25, 2025, at 10:42, Ingo Molnar wrote:

> +#define arch_cmpxchg64			__cmpxchg64
> +#define arch_cmpxchg64_local		__cmpxchg64_local
> +#define arch_try_cmpxchg64		__try_cmpxchg64
> +#define arch_try_cmpxchg64_local	__try_cmpxchg64_local
> 
>  #define system_has_cmpxchg64()		boot_cpu_has(X86_FEATURE_CX8)

system_has_cmpxchg64() should now become a constant.

     Arnd
