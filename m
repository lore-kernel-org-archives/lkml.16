Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C300827A90A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928627; cv=none; b=d6a/ZBCUth16VPUTGhXLDrbibJBh30bvQBxwlJXyftWEszVzTBV7OwFev3L0i/gJ2g+L0/lepuYagSIuqf2JDqCGq4P/0tJ+2IvBXpeL5ZdqaxjQ0B47NAMM5+yNnDBElXqZ13eu30MuJCU5iLvpMwVpvA12mduAaMXr/Gu1dS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928627; c=relaxed/simple;
	bh=cwq6nm1+OxWeJ13fp75cMTzR+m7KZjqWlbkYMLaYpX0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Bl8dX9Gwce8p6fsWx1Wz25MUjFqK1K6BToyuOxdqdudm24hvFT58/ZZstC4ZQXX9KtCtdhX/IhEwc1PRiw4+9jRjo8DJSMrCKcWYNFh3jeeK+RCL0i++hP6qyZW04RE6SpZq5mGYsKZz6xU6KviEkaH9FWV8Unevw+LyJyuHS5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWNdQbgT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWNdQbgT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE341C4CEEB;
	Tue, 29 Apr 2025 12:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745928627;
	bh=cwq6nm1+OxWeJ13fp75cMTzR+m7KZjqWlbkYMLaYpX0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=BWNdQbgTq7VkSbBFEop6BC2jiFxBGOhQB2jmlJFM4eVb0K2ISYEKM3jAtwsvEeU31
	 g7i2t/HK5JzulxUlRnJDw2X4xYbcqkTKe1Fx+ShS6CqYviKEqaZh0Rqj5Q3W4WYSXv
	 1s6Rf1zUB3m3c+HTDO6oUCt8sU4Nn8UB2ofLNo/gCqjg6KgIjLbYkBc7AdUbf4nISt
	 jdgIv5yBaFYT7hR+abwYL81yW/QoGYhJym4fqD7F8twJpLJntQZVzB3LytD8PERgTR
	 /1BfYzPNjsH7TiUAzVusQtHBcJIqh9HfgtOzGZkzasp0R/q6eru29xQ1UFSWm14gBo
	 n6vpZ9ffcTHhQ==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id AB3101200043;
	Tue, 29 Apr 2025 08:10:25 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Tue, 29 Apr 2025 08:10:25 -0400
X-ME-Sender: <xms:scEQaBJDGVFto2gnz3ZNsJFZp-YiFrAhZvrhD8t9IPQTryi5cCj3JA>
    <xme:scEQaNLWkfI_OHGKrYgaG9mP7BhNHK8XO8mTK6J2j5lbdCPe8bg5-5mNH3Bmu5Yv4
    myQBnZnkO-C1hVeXa0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefjeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:scEQaJt7EWyckidknsSqKFLuixG8yqkqEjH9n6d_lz2IKBZRe596Lw>
    <xmx:scEQaCZPRlrg4kIWGtngU8mtl0eqMw_VGzfByRuEC5v6nlrq6B4mqw>
    <xmx:scEQaIabV8K6E95rq4s8x6pF7eeAumS95t0l35VkuQBUy4NmZJBZvw>
    <xmx:scEQaGA4domGGx0IGqmjOKGbGwmGvW5-a3O2nwn0fuACFwtVNBuNTA>
    <xmx:scEQaGbSGWlzJqkjddU-x5c7SNG0VYgNAGe5OCF6riXqvr32Al52Ek0e>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 84F282220074; Tue, 29 Apr 2025 08:10:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Td35c5eaba32a0728
Date: Tue, 29 Apr 2025 14:10:05 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Ingo Molnar" <mingo@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 "Ahmed S . Darwish" <darwi@linutronix.de>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "John Ogness" <john.ogness@linutronix.de>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Thomas Gleixner" <tglx@linutronix.de>
Message-Id: <3005bc00-7ee2-4854-aef7-e274a9940fb2@app.fastmail.com>
In-Reply-To: <aBCoesvpVU0-njjH@gmail.com>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <20250425084216.3913608-14-mingo@kernel.org>
 <956412a3-43c2-4d6e-bea2-2573c98233ae@app.fastmail.com>
 <8D770F85-5417-4A9E-80DE-1B6A890DECEF@zytor.com>
 <1d4ddcab-cf46-4d7e-9e33-de12b6bd350c@app.fastmail.com>
 <aA34I9rY1-1QQo0R@gmail.com>
 <b97650f6-b541-4496-b84d-862fc7fd711b@app.fastmail.com>
 <aA9HaA2u-tdVA2ET@gmail.com>
 <6c363c6f-7152-4d09-96db-861eda759a35@app.fastmail.com>
 <aBCoesvpVU0-njjH@gmail.com>
Subject: Re: [PATCH 13/15] x86/cpu: Make CONFIG_X86_CX8 unconditional
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Apr 29, 2025, at 12:22, Ingo Molnar wrote:
> * Arnd Bergmann <arnd@kernel.org> wrote:
>
> This is the current upstream status quo of x86-32 compiler flags, which 
> results in significant .text bloat:
>
>       text         data     bss     dec     hex filename
>   15427023      7601010 1744896 24772929        17a0141 vmlinux.M586
>   16578295      7598826 1744896 25922017        18b89e1 vmlinux.M686

>  - +7.5% increase in text size (+5.6% according to bloatometer),
>  - +2% increase in instruction count,
>  - the number of branches increases by +1.3%,
>  - while there's a -0.7% reduction in number of CALLs done.
>
> I believe this is mostly the result of increased amount of inlining GCC 
> 14.2.0 does on march=i686 vs. march=i586.

I can reproduce +7% numbers like the ones you have shown when
CONFIG_X86_GENERIC is disabled, but not if I turn that on,
or with my "[RFC] x86/cpu: rework instruction set selection"
patch applied.

What makes this confusing is that the -march=i686 option does
two things: it changes the allowed instructions to include cmov,
and it changes the implicit -mtune= argument to the same value,
unless you pass an explicit -mtune= as well.

Selecting the i686 instruction set by itself does not change
the amount of inlining at all, you can see that by comparing the
i586 and i686 output when CONFIG_X86_GENERIC=y is set, or if you
change the flags in the Makefile

What really kills it is the implied -mtune=i686, these are the
results of manually changing the flags:

   text	   data	    bss	    dec	    hex	filename
7235028	4240706	1691648	13167382	 c8eb16	vmlinux # i585
7218356	4240718	1691648	13150722	 c8aa02	vmlinux # i686, tune=i586
7299828	4240706	1691648	13232182	 c9e836	vmlinux # i586, tune=generic
7278948	4244826	1691648	13215422	 c9a6be	vmlinux # i686, tune=generic
7784708	4239410	1691648	13715766	 d14936	vmlinux # i586, tune=i686
7768340	4239446	1691648	13699434	 d1096a	vmlinux # i686

If you set the CONFIG_M586/M686 options, you get an additional
effect from a couple of changed Kconfig options, that lead to
the i686 further shrinking a little more, mainly from less
padding:

-CONFIG_X86_F00F_BUG=y
-CONFIG_X86_ALIGNMENT_16=y
+CONFIG_X86_USE_PPRO_CHECKSUM=y
-CONFIG_X86_MINIMUM_CPU_FAMILY=5
+CONFIG_X86_CMOV=y
+CONFIG_X86_MINIMUM_CPU_FAMILY=6
+CONFIG_X86_DEBUGCTLMSR=y
-CONFIG_CPU_SUP_CYRIX_32=y
-CONFIG_FUNCTION_PADDING_CFI=11
-CONFIG_FUNCTION_PADDING_BYTES=16
+CONFIG_FUNCTION_PADDING_CFI=0
+CONFIG_FUNCTION_PADDING_BYTES=4
+CONFIG_X86_REQUIRED_FEATURE_CMOV=y
-CONFIG_FUNCTION_ALIGNMENT_16B=y
-CONFIG_FUNCTION_ALIGNMENT=16
+CONFIG_FUNCTION_ALIGNMENT=4

      Arnd
