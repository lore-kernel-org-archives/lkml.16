Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D63828DB72
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746640562; cv=none; b=LUDZAkps8J72icfoR9coC/jhr1VfFQqAL3hjyIbBjRdCyeXMu+5LKYXM5IPcuzKj8JsksF+h3eyu9yWRkmt80vAtaYLz6sQfSTIG5Eg+kb8vUC+DclF+PWxeywHZR8deqiB0AHOvVdWJg25P9Z8q1eaMPHSrtoD1g1DehjWwBeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746640562; c=relaxed/simple;
	bh=GMuKJRRP6ckILTHMR9/qp0/L4kzYzuwQVlEW9eBJX3U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YX3VcgGutxocLijac9k//kl+5mn3lMUtYeHf1TQ0kjAmkKPCTyQ8URMM20630Z/DRXRSSSIo44unIWXnMfMufsOPlPH/i9Jh6u8En48OipXcSrhQXrAAhJUdv1+Dr+WgkPHf0XKR8vId5cv0dD1aeq2oTZuWKJiezTpAnJ8RmsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=CHmm0FlD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vie4D6QS; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="CHmm0FlD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vie4D6QS"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3A1B325400EA;
	Wed,  7 May 2025 13:55:59 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Wed, 07 May 2025 13:55:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746640559;
	 x=1746726959; bh=rCK89sW3v3TRn5wSDYQOhmaWKO5bm1HcAwn8rrLNI8w=; b=
	CHmm0FlDmiTs04MQdJbce42B2hvmsZ3sdbsMaSqM2GfPz854atQDTfboZC1I++F8
	T54157vdL5le2harj89qaZEprKkWarOGwFbeZFBsv+MIbZefEtffkhZl/laOvRRk
	Fm1kwAg5UsX9Fr8RUHOor71jpSzjLtetEJ29kFRvUp9zgfWdvvnpURUFH9GBXOhk
	wJK0iW6ySvZ4iMgjM1dZpSrj1lMezGg+Oqin9ermsF8C3/OrDQR9VBWdK1Imnwn/
	F7uaIW6m/hMSaYXI+tm610TkN/y13HER01jUsDF5n18bx1c9FwAk9CyRzWfNsu5z
	2e6T24snaWb4kHC8JBHOqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746640559; x=
	1746726959; bh=rCK89sW3v3TRn5wSDYQOhmaWKO5bm1HcAwn8rrLNI8w=; b=v
	ie4D6QSmHeZYfoH07HeOwaP9DbKn55RtjqCBNoBnZRJWBS6yIGN5vpxvdFIHZSrO
	AsHgWfFM4UFi4heTbFQF4vnwXhmoasg6dj43F6IrI6DUEN943EU7sTL+PMTilDgM
	WXwD5N35vqpOkzQobMHLQxpgv1p3n+ssV1yLFRs+QS7diNKijMt5Zafq8A0zkTi7
	dOXV+d4rjaFXwuTlWQprgl+YiyZzG5pCwJapSofXjlRCsOphNGZDu02s2g6YSxJB
	5KmXTle8wYimC8CZ3UXVvWNFYcCxdVLaB69tqYtOIKHmpnRT2/yJr4N/V5ppShO9
	XWQb/9vHF8jrr64HPOZkA==
X-ME-Sender: <xms:rZ4baGTGixPHjHgRmkfsb8k0PXvGi5MF1yp6hSWIj-ew-q0coO-3ew>
    <xme:rZ4baLxs58p-MA31fXe3-F7aFtIX9-BqTty8SGliu0LNH_V-xF8ork27W5R0Ii3m9
    Ba7fimPWhMe6EWWjOk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegufihmfiesrghmrgiiohhnrdgtohdruhhkpdhrtghpthhtohepphgv
    thgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghruggssehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehtohhrvhgrlh
    gusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmhhitghh
    rghlrdhlkhhmlhesmhgrrhhkohhvihdrnhgvthdprhgtphhtthhopehvkhhuiihnvghtsh
    esrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:rZ4baD2M6oxC3W_H-Dq6tJkol1XJR8-4hVZsKt0bIomTeZQtIKuFjA>
    <xmx:rZ4baCDw-yyieQu-QIIuA2pql6a7Fv02sljqpXoffWmfbk6pTSWpcg>
    <xmx:rZ4baPjBxdoWjbpmoZIafkEeDZQ1mfTRAn3YWr-44Av4r-R7pOPGxQ>
    <xmx:rZ4baOoC_zOnu3AoihzkcOQH1tlqOKNcvuPO-tpeMYKvW7i151cuXw>
    <xmx:r54baAodHzurgO7_g9wngvPYU8lC5qKF3Q2fMME_gloZ9OZa7b0-ALdm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7CD031C20067; Wed,  7 May 2025 13:55:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T3cfc56977be09ec7
Date: Wed, 07 May 2025 19:55:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ingo Molnar" <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Borislav Petkov" <bp@alien8.de>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Vitaly Kuznetsov" <vkuznets@redhat.com>, "Ard Biesheuvel" <ardb@kernel.org>,
 "David Woodhouse" <dwmw@amazon.co.uk>,
 "Masahiro Yamada" <yamada.masahiro@socionext.com>,
 "Michal Marek" <michal.lkml@markovi.net>
Message-Id: <b6303b13-88ff-478e-9c57-f43c605dc1d5@app.fastmail.com>
In-Reply-To: <aBubMpHlXQZYeevi@gmail.com>
References: <20250506170924.3513161-1-mingo@kernel.org>
 <20250506170924.3513161-16-mingo@kernel.org>
 <667849c3-e522-4fbb-9d45-fbe28f7e6da7@app.fastmail.com>
 <aBubMpHlXQZYeevi@gmail.com>
Subject: Re: [PATCH 15/15] x86/kconfig/32: Synchronize the x86-32 defconfig to the
 x86-64 defconfig
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, May 7, 2025, at 19:41, Ingo Molnar wrote:
> * Arnd Bergmann <arnd@arndb.de> wrote:
>
>> On Tue, May 6, 2025, at 19:09, Ingo Molnar wrote:
>>
>> > Just a mechanic synchronization of kernel options enabled: nobody 
>> > really develops kernel features on x86-32 anymore, so make sure the 
>> > defconfig is roughly equivalent to the 64-bit one, so that testing 
>> > doesn't cover some combination that nobody cares about.
>> 
>> What is the size increase here?
>>
>> Some of the options you enable look like they might add a lot of code 
>> to the vmlinux binary, and 32-bit are often might more limited than 
>> 64-bit ones.
>
> 16.5MB -> 20.8MB, so well within usual RAM limits of x86-32 testing.

Right, that seems fine.

>> > @@ -50,7 +76,11 @@ CONFIG_ACPI_BGRT=y
>> >  CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
>> >  CONFIG_CPU_FREQ_GOV_ONDEMAND=y
>> >  CONFIG_X86_ACPI_CPUFREQ=y
>> > -CONFIG_KPROBES=y
>> > +CONFIG_KVM=y
>> > +CONFIG_KVM_INTEL=y
>> > +CONFIG_KVM_AMD=y
>> > +CONFIG_KVM_XEN=y
>> > +CONFIG_KVM_MAX_NR_VCPUS=4096
>> >  CONFIG_JUMP_LABEL=y
>> >  CONFIG_COMPAT_32BIT_TIME=y
>> >  CONFIG_MODULES=y
>> 
>> I have a series to completely remove KVM support for 32-bit. There is 
>> one powerpc platform that may keep it, but there is really no point 
>> in enabling it here when there are practically zero 32-bit machines 
>> that can use it.
>
> That's OK, it will go away once it's removed.
>
> This is an intentionally mechanical mirroring of the 64-bit Kconfig 
> over to 32-bit, we've done this in the past as well.

ok.

      Arnd
