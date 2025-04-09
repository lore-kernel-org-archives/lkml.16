Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DD425E836;
	Wed,  9 Apr 2025 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744208798; cv=none; b=Mr6AyjCjGmR5fltPjh620n09ct9O1NLE16F/YZReeAkO4pclVY3LdhOj0wxCkZTEUQt0hRZq+V84Mw+Kt4AWvzrSwBCbSlewIpTDvhn72tbQaTsMbV99jMDeVVPI5SlbLr69b0ooq1d0hDbrv/V+/TdFSuJl5lrFX2oy0wNYQbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744208798; c=relaxed/simple;
	bh=ISzOGYjfEwHL6gSIuR7OkHy//PCA55CQ35Cejl1vCjc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UC29ojJ8oDBtakOjRr/Mv4WjFtw0ccTq/KFR6bKHevcimhP1L1Dy0tZXzodpw/FmRA3IU+ZUoyesD2bLEzX6CMqqKgHO00HYb/vi/JnyGhYopZ24vkYnNozGCf/SqfVP//6M/88swpvqbxRW2pNNfO0vD0CW0GCm4qsk58sr0c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Y1BbvLAC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iAOOv5bS; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Y1BbvLAC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iAOOv5bS"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 562302540169;
	Wed,  9 Apr 2025 10:26:34 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Wed, 09 Apr 2025 10:26:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744208794;
	 x=1744295194; bh=x3ZOzUdjtOFEuhwm/cEU4y2EYS4Yk/OhdGqcU/ZOYUc=; b=
	Y1BbvLACgsmfOucFr02y1rD7MJGoemJUJeW52i2NlM7IPVt5/89qC12Z+JMRJPJA
	D2lM5JCjDyu7MXKXhBSypuX1MQ0WBt5WczGCo+p6tQ64EKPprfgJdfdQQUrA5t6P
	MfMBELg7Py08YDC0filjwfHxJQpQ2rGr6FUJ8OM/oTQPqzJCJVn73cgw/yJKIykP
	vvi/kcqPmoYyI7hxVWfbdtx6X7TGYQvTTBPfYZDXapAFBeNm3q7Q5UwVjRj8d+1Z
	DtCsE2VFJVRPHYmY8Dad5lmn2yHLQ/p5q1/eVOXZD2AuJPD1AA1m+yy19d4mQOy7
	UTLS8QXzpICcBF46SvKzoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744208794; x=
	1744295194; bh=x3ZOzUdjtOFEuhwm/cEU4y2EYS4Yk/OhdGqcU/ZOYUc=; b=i
	AOOv5bSXN4zOuAhHIH4Vnwzu70mVL/q61W/3Rr6LqXXmYj0Ol/MvOzv7ppWzzbaL
	4i4hjp/ycjO4PxLWIF8KbcOWpZ52Mpgbkk8lSrqTGid3CvHcPtEVI3ppNGahxJjU
	/m66S8s5qxEFL/nZhrjA+ZlXzaXrnUb67cWJ7Ojk6CCMVC9WQ6hMEUugHFG0RTN+
	Wm55V+7Izo2ZedVMI4sRaxNK5S2+YnLXeUCThDDAeuqvjDLSGUThtIyPHtuQTc27
	ij6584i4h+ibcyyP8EIdXIq4IhadhXPsLvL6UD52h7lolypp7EmxOkfSyLBa5eEi
	thjY9XHKUHchMOx9MFY/Q==
X-ME-Sender: <xms:mYP2ZwQxcmHCBTElBtemUn65cg2NTinW55Gi_aI96z74njjfWVc8Yg>
    <xme:mYP2Z9ySTgWG7AWS-5uPOOJBU30ZA5Weq_d97SnhxREvpZHQ7WUU01mmysUBhcq0O
    Gv17yYKvcGP2eXyg5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeivdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshgrshgthhgrrdgsihhstghhohhffhes
    rghrmhdrtghomhdprhgtphhtthhopehtihhmohhthhihrdhhrgihvghssegrrhhmrdgtoh
    hmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlphhivghrrghlih
    hsiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgriieskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllh
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:mYP2Z92HlvwhatWvgobJpwRwqu66wOkDzubjSB1rNKGkbHuyOlMmdw>
    <xmx:mYP2Z0DTx_RoxVa7Z4Au6mNklIHZtswjXlpjNvTSu09A1matMP6cCw>
    <xmx:mYP2Z5g2JDyJsHveBwK0Bv30ps0u7LgESsWOI5BP6qmObSKqQvKzuA>
    <xmx:mYP2Zwprfsk7p3d4zRQC5PAwBxyk1uT9B_MRSEGcymoZBLcpu19iIA>
    <xmx:moP2Z9t--rONNyP_3OX_CvoZi5R7nx2eVEhmVNI42lyG57C2EDQj5cDm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CCD372220073; Wed,  9 Apr 2025 10:26:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T274101974a25e0dd
Date: Wed, 09 Apr 2025 16:25:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lorenzo Pieralisi" <lpieralisi@kernel.org>
Cc: "Marc Zyngier" <maz@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Sascha Bischoff" <sascha.bischoff@arm.com>,
 "Timothy Hayes" <timothy.hayes@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Message-Id: <6e71b946-d6c0-48ee-b1e9-7c767a4dda12@app.fastmail.com>
In-Reply-To: <Z/Zy2zxD33/7sRrx@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <ed63bb91-e9ac-409a-a9a0-25b233fe2e15@app.fastmail.com>
 <Z/ZH5IBQAZ8rc9Cz@lpieralisi>
 <e7e4e9f0-a9e4-48d4-9bed-a4c52453ee8e@app.fastmail.com>
 <Z/Zy2zxD33/7sRrx@lpieralisi>
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 9, 2025, at 15:15, Lorenzo Pieralisi wrote:
> On Wed, Apr 09, 2025 at 12:56:52PM +0200, Arnd Bergmann wrote:
>
> KMALLOC_MAX_SIZE is set according to MAX_PAGE_ORDER, that should
> be fine for most set-ups (well, obviously implementations that
> only support a 1-level IST can't expect a very large number of
> IRQs -  we set that to 12 bits worth of IDs deliberately but
> given the current memory allocation limits it can be much higher).
>
> A 2-level IST can easily manage 24-bits worth of IDs split into
> two-level tables with the current kmalloc() limits.
>
> For the ITS DT and ITT the same reasoning goes, so the capping
> is the (rare) exception not the rule and I don't expect this to be a
> problem at all or I am missing something.

Ok, just mention that estimation in the source code. If someone
ever runs into the limit and it does become a problem, they can
then figure out whether they have an unusually small
KMALLOC_MAX_SIZE or an unusually large number of interupts.

>> >> Do you expect actual implementation to not be cache-coherent?
>> >
>> > It is allowed by the architecture - I don't have a crystal ball
>> > but if I want to add support for a non-coherent IRS the DMA mapping
>> > like sequence above has to be there - alternatives are welcome.
>> 
>> I see that we have a few GICv3 implementations that are marked
>> as non-coherent in DT. I don't understand why they'd do that,
>> but I guess there is not much to be done about it.
>
> You don't understand why the GIC HW is not coherent or why we set it
> up as such in the driver ?

I meant why hardware would be built like that. I would have
assumed that the GIC is designed to be closely tied to the
CPU core and the L2 cache, so it shouldn't be hard to make
it coherent even if the rest of the system is not.

>> The only other idea I have would be to use an uncached allocation
>> for the non-coherent case, the same way that dma_alloc_coherent()
>> or maybe dma_alloc_wc() does. This still has the same problem
>> with bypassing the dma-mapping.h interface because of the lack
>> of a device pointer, but it would at least avoid the cache flushes
>> at runtime. If I read this code right, the data in here is only
>> written by the CPU and read by the GIC, so a WC buffer wouldn't
>> be more expensive, right?
>
> The IST is also written by the GIC, the CPU reads it (explicity, with a
> memory read rather than through instructions) only if the table is two
> level and we are allocating L2 entries on demand to check whether an
> L2 entry is valid.
>
> I am not sure the CMOs are that bad given that's what we do
> for GICv3 already but it is worth looking into it.

If the reads are common enough, then an uncached mapping would
likely be slower than the flushes. Not sure which way is better
without L2, you'd probably have to measure on real hardware,
though you could perhaps do that on a GICv3 one if the access
patterns are similar enough.

      Arnd
