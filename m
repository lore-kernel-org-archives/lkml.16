Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E5C1367
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745839318; cv=none; b=h2fq9j8ng8549T4KrQQ9pvV/CzXv+GElM1G9VtA6xJw9lD5tA1V/XT4ALasOJMZAXVl1/xdzBVwcZRSV1Ms7q3Qq4wCdmaaidWxpduny8oUW28ADdXyXG74mCPJSteTTOGj75+5hof0/vODKuGwu5KppKDlVBxuUE0pQSdVBl78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745839318; c=relaxed/simple;
	bh=bTeGTMOF8DYOE8sSNsyIBusGRI519Pame5N8Rpm2j1o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RvxjEut2CA4FqM4Zj5YabxBFi215qhqemjzHPlyHcMo6z1WtnNow+qHUvSPrpkVMiM34ZHqOtbcrlBmtrd/t2bDdRp4VhzRSR8kgrYolENSOU2/DJuZaOrnZ0kBIOb05iLFuBclZgnxLeRZ0+J9eEwXp8alGAsHwqJKg9IH1oWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsxEHsX5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsxEHsX5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B80C4CEE9;
	Mon, 28 Apr 2025 11:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745839317;
	bh=bTeGTMOF8DYOE8sSNsyIBusGRI519Pame5N8Rpm2j1o=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=HsxEHsX5qa8GjJpuWU7enHyBbRY86Dx7h8ZWu87a+kF6ROYwE3O6wpZ9xyXNYklP9
	 VLs5pKHpp+Qe8wpNSCjSBkpAvHRB7yfpyaZ//gnayKvCm6RQioNgl/Unaos246TAEr
	 xmuqPdtiI6dc/RSNSIcxiJyzHAdflBWUJWQ8WkfeWxYDUvLhXM2XqKBEn89jPyePUh
	 39b4K9to+UL/fo+rO6zTObvKtbOfwWFyYKpBywI9KsME0o5L6QA79clD+CTyJWcATt
	 5P1+lxoqT3FNUQupcUwETsNSeNn2x6/m8/9Cl+qjrEjCXnyql/pGdwpyMVyl6P/8RY
	 DAZ7LiI8RSJrg==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6B400120007B;
	Mon, 28 Apr 2025 07:21:56 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Mon, 28 Apr 2025 07:21:56 -0400
X-ME-Sender: <xms:1GQPaHGFbTXqLgRY4x7WAqLSg3VSy219YaVSqRN1UTqTqR1s1v032Q>
    <xme:1GQPaEVzp2-KoAzEFKLz1u10LXPga9DzAd_6UXdogyq4XSQqEWRpq1AKDMnsGXzfm
    wRyEX7_m_B3NOP7lmE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddviedtkeduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:1GQPaJJq2AyxzBZzbnAMd2_h2xoE4XytKnJIoQAsBkgq8htGD9XgEQ>
    <xmx:1GQPaFH4XweXi-nfdUAiB5CafwiHXrHMESJ177CaagaR5InB7EGiww>
    <xmx:1GQPaNVE5cFHILUY-cIcOTPCoe4uQNAqPVESOls1zVnz1de7qBKMpA>
    <xmx:1GQPaANJuDU99feE8ExJZh4f5gW1dI0owmjbVJrxt0E1ZzUxZumTBA>
    <xmx:1GQPaM1ZccwVKXaqIbjlFyRZXJ4HXI9Ln759Rd3tG1OSk3NkNQFMa6No>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 46B762220074; Mon, 28 Apr 2025 07:21:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Td35c5eaba32a0728
Date: Mon, 28 Apr 2025 13:21:11 +0200
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
Message-Id: <6c363c6f-7152-4d09-96db-861eda759a35@app.fastmail.com>
In-Reply-To: <aA9HaA2u-tdVA2ET@gmail.com>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <20250425084216.3913608-14-mingo@kernel.org>
 <956412a3-43c2-4d6e-bea2-2573c98233ae@app.fastmail.com>
 <8D770F85-5417-4A9E-80DE-1B6A890DECEF@zytor.com>
 <1d4ddcab-cf46-4d7e-9e33-de12b6bd350c@app.fastmail.com>
 <aA34I9rY1-1QQo0R@gmail.com>
 <b97650f6-b541-4496-b84d-862fc7fd711b@app.fastmail.com>
 <aA9HaA2u-tdVA2ET@gmail.com>
Subject: Re: [PATCH 13/15] x86/cpu: Make CONFIG_X86_CX8 unconditional
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 28, 2025, at 11:16, Ingo Molnar wrote:
> * Arnd Bergmann <arnd@kernel.org> wrote:
>> 
>> b) always build with -march=i586 and leave only the -mtune
>>    flags; see if anyone cares enough to even benchmark
>>    and pick one of the other options if they can show
>>    a meaningful regression over -march=i686 -mtune=
>
> That's actually a good idea IMO. I looked at the code generation with 
> current compilers and it turns out that M686 is *substantially* worse 
> in code generation than M586, as apparently the extra CMOV instructions 
> bloat up the generated code:
>
>       text	   data	    bss	    dec	    hex	filename
>   15427023	7601010	1744896	24772929	17a0141	vmlinux.M586
>   16578295	7598826	1744896	25922017	18b89e1	vmlinux.M686
>
>  - +7.5% increase in text size (5.6% according to bloatometer),
>  - +2% increase in instruction count,
>  - while number of branches increases by +1.3%.
>
> But it's not about CMOV: I checked about a dozen functions that end up 
> using CMOV, and the 'conditional' part of CMOV does seem to reduce 
> branches for those functions by a minor degree and ends up reducing 
> their size as well. So CMOV helps, a bit.
>
> The substantial code bloat comes from some other aspect of GCC's 
> march=i686 flag ... I bet it's primarily inlining: there's a 0.7% 
> reduction in number of calls done.

I had tried the same thing already, but saw a different result,
For me, the i686 output is 0.2% smaller than the i586 one (both
-mtune=generic), using gcc-14.2. or just 0.1% with clang-21,
which is roughly what I expected:

   text	   data	    bss	    dec	    hex	filename
7454055	4158218	1695744	13308017	 cb1071	build/tmp/vmlinux-i586
7433427	4154146	1695744	13283317	 caaff5	build/tmp/vmlinux-i686
7318514	4052573	1687552	13058639	 c7424f	build/tmp/vmlinux-i586-clang
7309938	4052573	1687552	13050063	 c720cf	build/tmp/vmlinux-i686-clang

I do see a larger difference compared to other -mtune= options, here is
the same config with "clang-21 -march=i586 -mtune=i686" instead of
"-march=i586 -mtune=generic":

7254510	4056669	1687552	12998731	 c6584b	build/tmp/vmlinux

There is a good chance that the -mtune= optimizations totally
dwarf cmov not just in code size difference but also actual
performance, the bit I'm unsure about is whether we still need
to worry about any core where this is not the case (I'm guessing
not but have no way to prove that).

      Arnd
