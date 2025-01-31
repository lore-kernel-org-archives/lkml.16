Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D7A28EC
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738316318; cv=none; b=M4cDBN11suH+9G5ZoBH/mDAe9ICUkTbE7sVNG2fVTvCVOUwopnYgbb0RlL7rFFsZU0x6O8drzKDQGE2JQpnX5FQ4VL1s5S1s9kQ5mIHFZtjAzkyLAD50frinc+mpVi7igWTq1GWPcsmD0Aa6xi1B6hRVxHdymXGUk43KpVBifOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738316318; c=relaxed/simple;
	bh=CuzzDmNyJ2wp5kDzaqAUxzlefGcbKNqsOdAi699Net4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VobKvpCfbQyPiczxmgX0RQIHlNNZGKy9SQfOObMZ2mhpNi9MpM5g3szjjF4UavRhONOFLxi2jjjxn/CThYaUBnWAWCdte8N9hr3qAr1xTzRqzovzSbbQnhMbzQv9MCfXEVT0hZWgqwo9IxjvWvAy9XBJVuKs0cSI9ADZVNewYO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=vTf6XdCS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=amKbH8fd; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="vTf6XdCS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="amKbH8fd"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5517C1140141;
	Fri, 31 Jan 2025 04:38:35 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 31 Jan 2025 04:38:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738316315;
	 x=1738402715; bh=SUreHfhb4SIjGUASIEXntyv2VIisTLVIPpk5iuMJPRw=; b=
	vTf6XdCS8iXwj7m1lOtrvo81BnIdi/FkjOiyj+JpMvsXboMUNuMYO2Dlv4Rnk/4J
	8/3L/f4DoxjYlLjV1rfmkApD+KXIjF23bEpEfWCTFFrAA4RPlyJcXy4guZd0KmZh
	MdzYnQC1PIdBMkhJgJz3EoHFmMVynwkNtIVPJTA50FPAzdnc2myrIZFmRpiLqP+v
	7vuMNSJihAvcjlc8kGxQwtnMg/cVPuzxVdtxS4uoD/96ZbeUESICFSOxFXQtgWhI
	pGirDxWRq6e65fatxGNKmacG/LsnWn5iSn/Uvo/d4ih/ngP33PZURMLVEgKCNIsg
	HnAISAjv1tFOlZQfWCcbVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738316315; x=
	1738402715; bh=SUreHfhb4SIjGUASIEXntyv2VIisTLVIPpk5iuMJPRw=; b=a
	mKbH8fdPC3Lbp+nU/U5W4KfoRD6qYCvjATdqfNUxIqKnhfDM0oNXANsA91avHwi3
	cqJYvFlkeBjrtuwq3udTdQbve4IBi/RcAFEcgm5+Y5twzzTQfCFzY5Gyn98db/Ch
	EqaWjl9e0vjYPaCt4Hh5749CEk8/mvB8Ti/G14fwI20ekShhdDSXUuse0pBWtUMM
	fRTS04hazaUYfNtpsW4cTZLItFCJ7GWRiIsMnCJJEN5Yp130WqJ6j38F/R4ohSZr
	a2rLzjWiujdHR7ONwIdxNtfF+tlg+DMWcjsHLx3czUmsIkaIbZE87/cp2WWKwwM7
	U1GCCQbY761H4T4hOgR1A==
X-ME-Sender: <xms:GZqcZ03RcnkFfhcSAGfz8WGjDNWLquBf893o-AeVRUqHso2Tav0pKQ>
    <xme:GZqcZ_Fn4N5YSnvqNmjL6Y0kzAzY0NcAmuIcWRW8IEwMopta0LG0C0TZN1f9e2DVn
    e8wYggMl9YPxIgB9TA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghroh
    ihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgu
    rdgruhdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epshgvghhhvghrsehkvghrnhgvlhdrtghrrghshhhinhhgrdhorhhgpdhrtghpthhtohep
    nhgrvhgvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrgguugihsehlihhnuh
    igrdhisghmrdgtohhmpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhs
    rdhoiihlrggsshdrohhrghdprhgtphhtthhopehjuhhlihgrnhesohhuthgvrhdqlhhimh
    hithhsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:GZqcZ84fe0qQPbXth6ga6sK7Q3dzQPpM6SF0ltUTKZ1owHbgpIiwpw>
    <xmx:GZqcZ90Ky4_FX9qgZBIKoiKPaVYlULTQYzGeOO9gEaaJIzIh5Y2RJQ>
    <xmx:GZqcZ3HyNYsgHm4LcV6mk4876zpVck1ugCIcYnFsMORNw9F7iU8bUw>
    <xmx:GZqcZ29c3Lxdf0JiUdZHRIF9vlhPomwlsHHSr9OQ1pvpIBapYDYagw>
    <xmx:G5qcZ9aXicAKPpueTzkCG6T3EtKSsgWK07wi-FEKOZx51a8hPHgsrUR2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A2B5B2220072; Fri, 31 Jan 2025 04:38:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 31 Jan 2025 10:37:55 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Segher Boessenkool" <segher@kernel.crashing.org>,
 "Julian Vetter" <julian@outer-limits.org>
Cc: "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Message-Id: <83b60736-3856-4804-b25d-d0c8cbf9b185@app.fastmail.com>
In-Reply-To: <20250129111406.GW20626@gate.crashing.org>
References: <20250129094510.2038339-1-julian@outer-limits.org>
 <20250129111406.GW20626@gate.crashing.org>
Subject: Re: [PATCH v2] powerpc: Remove eieio() in PowerPC IO functions
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jan 29, 2025, at 12:14, Segher Boessenkool wrote:
> On Wed, Jan 29, 2025 at 10:45:10AM +0100, Julian Vetter wrote:
>> Remove the eieio() calls in IO functions for PowerPC. While other
>> architectures permit prefetching, combining, and reordering, the eieio()
>> calls on PowerPC prevent such optimizations.
>
> Yes, and it is crucial to prevent combining, it is part of the semantics
> of these functions.  This is a much bigger problem on PowerPC than on
> architectures which optimise memory accesses much less.  So most other
> archs can get away with it much easier (but it is still completely wrong
> there).

Unfortunately it's not well documented what the actual behavior is
supposed to be across architectures, so part of the work that Julian
is doing is to make them behave consistently. My impression is that
we actually do want combining (and reordering) here in memcpy_fromio,
unless there are specific drivers that depend on the non-combining
behavior. My earlier observations towards this are:

- memcpy_fromio() is almost always used on RAM behind a bus, not MMIO
  registers.

- there has been a push towards using instruction sequences on arm64
  make sure we get the most (write) combining for the I/O string functions
  to get better performance

- There is only an eieio in powerpc memcpy_fromio() but no barrier
  inside the memcpy_toio() or memset_io() loops. If it was necessary
  to prevent combining, this would likely be for both load and store
  loops here.

- I tried to trace the history of memcpy_fromio() and found that
  it was originally just a loop around readl(), which at the time
  was eieio() and a pointer dereference and byteswap. The readl()
  definition has changed many times after that, but memcpy_fromio()
  never changed again, which makes it most likely that this was
  just forgotten in the conversion rather than intentional.

If you can think of callers of memcpy_fromio() that depend on the
eieio(), we probably need to fix other architectures as well and
go back to Julian's original idea of adding a new barrier into the
common code and have an architecture specific definition for that
barrier.

For the insb()/insw()/insl() case, I think you are correct that
the eieio is required on powerpc and likely others as well, since
the CPU combining multiple reads on a single address into a single
one would clearly break the concept.
On Arm and other architectures that prevent combining of MMIO
reads based on page table flags, we don't need a barrier here,
but there is a good chance that these barriers are in fact
missing on some alpha and some mips implementations of
readsl() etc: The alpha ioread32_rep() and insl() have barriers
inside, but it also uses the generic readsl() which does not.

> You are keeping the trap;isync things, which a) have a way bigger
> performance impact, and b) are merely a debugging aid (if some i/o
> access kills the system, it will be clear where that came from).  And
> that isn't even the biggest thing of course, there is a heavyweight
> sync in there as well.

The barriers around memcpy_toio()/memcpy_fromio() are a separate
question that we should address as well. I somehow thought that
other architectures had the same barriers as readl/writel around
the string functions, but it does seem like it's only powerpc
at this point.

Intuitively I would have expected that a memcpy_toio() etc
has the same barriers as a writel() around it for consistency, on
the other hand it's only powerpc that has these, and if the
functions are indeed only meant to work on RAM behind MMIO,
they would not not have to serialize against DMA the same way
that writel does because there are no side-effects.

I'm still looking for more insights on that, but if we can
agree that memcpy_{from,to}io don't need the outer barriers,
it seems best to address this at the same time as the internal
eieio() in memcpy_fromio(), provided we agree on removing
those as well.

      Arnd
