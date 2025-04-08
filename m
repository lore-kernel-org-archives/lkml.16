Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6402627EA;
	Tue,  8 Apr 2025 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101494; cv=none; b=OI3uqU9s9AHa8L0VomQ+HXjQthmzgfxc/s3hEf4+0pbWBpeSPK0EMAx+JbwVfSqWe9ZXEmT6zI5GF9fJWrvwl/Vvk9ynxE8j2MToWbN+kXnMxlGIL5jcDWZrV1XH4Q4ni24cIjfL98hvW2IBKkF+3sVHVQG+OSrZkEAjJdnt/j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101494; c=relaxed/simple;
	bh=XX34lPy+Q29lQ57hsRPpZu70XY8syx0PGiPZ9KWfto4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UcUdXsMaof60w/gMGe6rH1FaTh6GQyvTZ2TAERWT4bmLURbVJAg1n+h/dR7ULNWYrilrx2rtFNusmwvNv2UFDeSsjb/jX9x0wZB3vHS+9OrGk8ZSztK26jssn3+hZ0CugUuYz42s0z1xSsnyims5xlI61eK+8iA2KEsUmN/QJjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=d3gSowO5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c0vX2+O/; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="d3gSowO5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c0vX2+O/"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C4F48114017C;
	Tue,  8 Apr 2025 04:38:11 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Tue, 08 Apr 2025 04:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744101491;
	 x=1744187891; bh=VlvkU1faDx+thQEdDrOoGOPLhFtXWFIgx9WnhEz6y6Y=; b=
	d3gSowO5zzowHZ2h4AqNsVzu9wnZXqlT1UveryZFYO11x/R+WzxEbG7SbS0ZCKPd
	y8bicZcOBeg/URkB010IHD4eZ4BY9pmR23R3IEgF2aStwFFpx/v7+mi022toaFpr
	9uGD4z3t6Fv6a6HnTPFUpTN/xYmHSG8eOmR1SmwvGW01bcgpV96+Nz6JPvM+SJ2J
	/Y6FqkFXSghM9MKEt//4vfLMH/n9YKzqohfpd/BiIUYMe12+ysS3Lwq36PeU1x3n
	2IyOq+6Ksb4fqk0ZKwuhCGAuOyoxmlHrlawmmdhD+UtavNBO4KQ92Nj9pqaEWwJA
	y2mYP84KYYHZ5wJNf41A/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744101491; x=
	1744187891; bh=VlvkU1faDx+thQEdDrOoGOPLhFtXWFIgx9WnhEz6y6Y=; b=c
	0vX2+O/tBfL+SfZ/cBvm6NUH0nAu6SUQeZe1kW++6GCH0XCzRzHVhkdH+nIcW79Q
	Id00SH6dNRVSyhObO2J1FIkNCL/93+L+NhMs24v886kOoekO80jyFf6uTHExLTWd
	2MZoQyfbVFCYtqvt/UFs1oJlmDAaY2hT5U7hCQnYGf3ilwFirYmMlS4GAPOuWpZc
	mNuIjIckRSmXqskOYZ4CJOhSquM32S4Mi73WkJ0Koe4A3yUu2Iz3tWC+2y6WxjkF
	ZQdf/u4a1TtcIVYRU0ibiaOZ0PdW6R6+DSdyx/SbwZhcDumnynvG14+xsehBuxb4
	WrEsNwxeZ5L10Ao7opjLQ==
X-ME-Sender: <xms:cuD0Zznghr422oPqDPolst399HuAmFd-Clo7xVYEpSpf4Ac0XLubkw>
    <xme:cuD0Z23KYreNX_nkPYOohrNeTmnZeZrcqHUL_ASDg_jcR8_vTrW1oSoK9YJhlB1aD
    EhHFzxhgIp8INrtzUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddviedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnmhgrghejsehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepmhgrthhtshhtkeeksehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrg
    hrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhrtghpthhtohepthhorhhv
    rghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehmrg
    gtrhhosehorhgtrghmrdhmvgdruhhkpdhrtghpthhtohepghhlrghusghithiisehphhih
    shhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepihhnkhesuhhnshgvvghnrd
    hprghrthhspdhrtghpthhtoheplhhinhhugidqrghlphhhrgesvhhgvghrrdhkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:cuD0Z5p2yvCKgKIGVW4kpMODvptzKgkFKhSjrwpjtl1CCgpuRVZCog>
    <xmx:cuD0Z7lHnpNeAU1-5Y_dV16uJuIqhP4BJXwcpWr2-nx558x4W_uITg>
    <xmx:cuD0Zx2EpNc5h69ZU2yEht0pz4693TraFiNHcUMpFq4XDJz146rQDA>
    <xmx:cuD0Z6vqYBG4PBFu0HbdLrZvGeiipMCwJwyQJ7dASSI2saQ1fo6PRw>
    <xmx:c-D0Zz5O0f_2t6RPrZkGXiK8j5klBf1TEFNJ5yOBW8jX3idx6r7qqAr8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1F6232220073; Tue,  8 Apr 2025 04:38:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T56050b542f246355
Date: Tue, 08 Apr 2025 10:37:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@unseen.parts>, "Matt Turner" <mattst88@gmail.com>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Magnus Lindholm" <linmag7@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <e1356a60-525b-4405-ad5b-eb6e93de8fef@app.fastmail.com>
In-Reply-To: 
 <CAHk-=whKa0-myNkpq2aMCQ=o7S+Sqj--TQEM8wfC9b2C04jidA@mail.gmail.com>
References: <alpine.DEB.2.21.2502181912230.65342@angie.orcam.me.uk>
 <CAHk-=wgBZk1FFOyiTKLnz4jNe-eZtYsrztcYRRXZZxF8evk1Rw@mail.gmail.com>
 <alpine.DEB.2.21.2502202106200.65342@angie.orcam.me.uk>
 <alpine.DEB.2.21.2504072042350.29566@angie.orcam.me.uk>
 <CAHk-=whKa0-myNkpq2aMCQ=o7S+Sqj--TQEM8wfC9b2C04jidA@mail.gmail.com>
Subject: Re: [PATCH] Alpha: Emulate unaligned LDx_L/STx_C for data consistency
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Apr 8, 2025, at 02:34, Linus Torvalds wrote:
> On Mon, 7 Apr 2025 at 13:46, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>>
>>  So unless I'm proved otherwise (e.g. that all such code paths are now
>> gone from networking, which may or may not be the case: I saw IPX go but I
>> can see AppleTalk still around; or that no sub-longword accesses are ever
>> used in the relevant networking paths), I'm going to keep kernel emulation
>> in v2, because what just used to be wrapped in an unaligned LDQ/STQ pair,
>> which we trapped on and emulated, will now become an LDQ_L/STQ_C loop.
>>
>>  Do you happen to know what the situation is here?
>
> I think networking ends up using 'get_unaligned()' properly for header
> accesses these days for any of this.
>
> If you don't, some architectures will literally silently give you
> garbage back and not even fault.
>
> Admittedly that's mainly some really broken old 32-bit ARM stuff and
> hopefully it's all dead by now.

Yes, the last one doing this was EBSA110, which we removed in 2020.

> So unless you actually *see* the unaligned faults, I really think you
> shouldn't emulate them.
>
> And I'd like to know where they are if you do see them

FWIW, all the major architectures that have variants without
unaligned load/store (arm32, mips, ppc, riscv) trap and emulate
them for both user and kernel access for normal memory, but
they don't emulate it for atomic ll/sc type instructions.
These instructions also trap and kill the task on the
architectures that can do hardware unaligned access (x86
cmpxchg8b being a notable exception).

     Arnd
