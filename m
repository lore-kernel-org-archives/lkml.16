Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5882116EB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317065; cv=none; b=YhCOmHhfmZqmLtjpGN6MChBcZ9r+xPE+mfG/KAl4B6TOjuqjEdt9yWFFMFWEcUoEz2b4BTLZn/kmAhstZrdu6xKDpc5y6O55e2qSgrreIQLOuYo+iy7SSWVUEHJdeeuLUR3AWbUyAS+IdfRWyYgCXbpFtXBIF3dLPHxKp/TdG4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317065; c=relaxed/simple;
	bh=vbfued2uU3GT02rn8Jsz3N23RsRLimsTdInqGFiWRwY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SNld9YIx5cvKRWvlmS1uY1Wa1sezlI+L3kMjrPunqWkcO7N30Tnpako9db0lDEmVMUUzge7Tihihx3KUconW05UGNamOw698x0SwIYxtRnRxTYQz8mznHyOAxQZtEtgQzaakyJ3fH2+zu+LekA36e8BQApUicPQiZ7cIvwbXLTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=jUQA1QH5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=s3IzAOwM; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="jUQA1QH5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="s3IzAOwM"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 82AB125401D3;
	Tue, 22 Apr 2025 06:17:41 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Tue, 22 Apr 2025 06:17:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745317061;
	 x=1745403461; bh=6iva4M18jqvPbqUQsfEmLC6SwTowYiuBTDLYua0J8Eg=; b=
	jUQA1QH5M8T2MMgUeICA98D4v0hxkbLIrd3v1/YhAsrlEBy4A4OAxO/4eRDRKvnY
	rbEc4jUk9JHQDm5+QFCcw8mBc1WjpPAGvnGIJhu2QDh9GDDeabTHSnd6T4Hp5qt9
	8YzpZ0RQhEWm9qAAyXNC37AyLpffnZga8pihKnrSKgxqn1+HT5ODDxrfYDfTDCA3
	yK+d+iqnZffaW1WD5byXuXrTNRVj3N5zg2PqiMEYrE4IAFqBiDRL07UdgmWeo6zP
	MzFZg9kVe0/AB3OxJoEH3LammTSCtM/cdiZGGE0RvreH8QVKxZSudnWTvw9v17XA
	38x/GZL8cfAoS8whgMiLtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745317061; x=
	1745403461; bh=6iva4M18jqvPbqUQsfEmLC6SwTowYiuBTDLYua0J8Eg=; b=s
	3IzAOwMDJK/3tCzXq0BSl4o53pcm6apEVNWMmnVea+pRbKBPA/TJv8XloxfNqjGZ
	ry0rAEiQ/uYi4RB5LGyTysxrTk67uDhoAd18UD2m5pGPDScUDMWz83bIdCOhv8OW
	aBGaoupR36RJd/3n93h7SSsUQhcnfDyLemP0KbdtnqeTG+U2v8RlPTo0WiypSsyJ
	mVDgP3aiqdA+k6TcSrIUpKcofng00S7Cm6UCIW4sp8+0AuPqhQrXVWU3AGYJhyi0
	6A0pYvgn/WY3cHnhcwdA64eZHlTvC7mIbmCw/T4uM7lNwXrnQDd8eHvs0k2xhAUl
	lUT2v/rcu3ONKDqFZ9WIg==
X-ME-Sender: <xms:xWwHaLHckWPWFUj6mNfhGjM9P87HwRw5idbiCYetLDvA5DaAmeQI3A>
    <xme:xWwHaIUZhKrWFL75lmCdVof_hmkO-m9aHT_RwyVw-eSjbnj9bhKVzNY0_7BTnN31G
    k5qzVU8Q_kbOlCA1Sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefgeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomh
    dprhgtphhtthhopeholhhivhgvrhdrshgrnhhgsehinhhtvghlrdgtohhmpdhrtghpthht
    ohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhorhhvrghlughsse
    hlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehovgdqlhhkphes
    lhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:xWwHaNKzKB1leyBRIX9T12vDerzlDT5iIesupnLLFB1NwOHIdzZcuw>
    <xmx:xWwHaJGoXiJuMZKgqzvMzX46m0RMeEj8qeea5qI3gU-h_btNITf5Bg>
    <xmx:xWwHaBXQrw3RDmamFOuOWS7AlIetVVK-CBDr46DZHdUDRGofd7yPNg>
    <xmx:xWwHaEMTEVMfNQebUikiB0pvjZeDaAbcx4J2dTv_w5B69fgbQaYAAw>
    <xmx:xWwHaE1uhaP4QXGNC3h__nhamlSpe1C15aU9IO3tGeiPjDS6t3PFST6w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F1E982220073; Tue, 22 Apr 2025 06:17:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T98d234c297665c71
Date: Tue, 22 Apr 2025 12:16:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, "kernel test robot" <lkp@intel.com>,
 linux-kernel@vger.kernel.org, "Ingo Molnar" <mingo@kernel.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>
Message-Id: <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com>
In-Reply-To: <202504211553.3ba9400-lkp@intel.com>
References: <202504211553.3ba9400-lkp@intel.com>
Subject: Re: [linus:master] [x86/cpu]  f388f60ca9:
 BUG:soft_lockup-CPU##stuck_for#s![swapper:#]
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 21, 2025, at 10:12, kernel test robot wrote:
> Hello,
>
> by this commit, we notice big config diff [1]
>
> then in this rcutorture tests, parent runs quite clean, f388f60ca9 shows
> various random issues.

Thanks for the report!

From my initial reading, my patch most likely caught a preexisting bug,
but my patch itself is correct. It's worth investigating regardless,
at the minimum we should perhaps prevent an invalid configuration from
building or from booting.

> config: i386-randconfig-r071-20250410

Generally, I would not expect 'randconfig' kernels to pass all tests,
and what happened here is that removing the CONFIG_MK8 option made it
pick some completely different CPU

> compiler: gcc-12
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

The most relevant options here are

 -# CONFIG_M486SX is not set
 +CONFIG_M486SX=y
  # CONFIG_SMP is not set
  CONFIG_X86_GENERIC=y

In theory, setting X86_GENERIC should make a kernel built for an
older CPU work on any newer one. In practice, I'm not surprised
that this fails: While AMD K8 is ten years older than Intel Sandy
Bridge, they are architecturally still very similar. The i486SX
is another decade older, but its design is as far removed from
both K8 and Sandy Bridge as it gets.

It would be nice to not have to support 486sx any more.
We have discussed removing support for older CPUs without
TSC, FPU and CX8 in the past, but so far always kept them
around.

> [ 721.016779][ C0] hardirqs last disabled at (159506): 
> sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1049) 
> [ 721.016779][ C0] softirqs last enabled at (159174): handle_softirqs 
> (kernel/softirq.c:408 kernel/softirq.c:589) 
> [ 721.016779][ C0] softirqs last disabled at (159159): __do_softirq 
> (kernel/softirq.c:596) 
> [  721.016779][    C0] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 
> 6.14.0-rc3-00037-gf388f60ca904 #1
> [  721.016779][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 
> 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [ 721.016779][ C0] EIP: timekeeping_notify 
> (kernel/time/timekeeping.c:1522) 

Timekeeping code could be related, I see that CONFIG_X86_TSC
is disabled for i486SX configurations, so even if a TSC is present
in the emulated machine, it is not being used to measure time
accurately.

> -CONFIG_X86_CMPXCHG64=y

This could be another issue, if there is code that relies on
the cx8/cmpxchg8b feature to be used. Since this is a non-SMP
kernel, this is less likely to be the cause of the problem.

Can you try what happens when you enable the two options, either
by changing CONFIG_M486SX to CONFIG_M586TSC, or with a patch
like the one below? Note that CONFIG_X86_CMPXCHG64 recently
got renamed to CONFIG_X86_CX8, but they are the exact same thing.

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index f928cf6e3252..ac6cc69060f1 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -317,7 +317,6 @@ config X86_USE_PPRO_CHECKSUM
 
 config X86_TSC
        def_bool y
-       depends on (MWINCHIP3D || MCRUSOE || MEFFICEON || MCYRIXIII || MK7 || MK6 || MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPENTIUMII || M686 || M586MMX || M586TSC || MVIAC3_2 || MVIAC7 || MGEODEGX1 || MGEODE_LX || MATOM) || X86_64
 
 config X86_HAVE_PAE
        def_bool y
@@ -325,7 +324,6 @@ config X86_HAVE_PAE
 
 config X86_CX8
        def_bool y
-       depends on X86_HAVE_PAE || M586TSC || M586MMX || MK6 || MK7 || MGEODEGX1 || MGEODE_LX
 
 # this should be set for all -march=.. options where the compiler
 # generates cmov.

      Arnd
