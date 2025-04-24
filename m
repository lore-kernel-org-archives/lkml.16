Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408231B4233
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745481711; cv=none; b=mkigVOxploFmNL+VG62YU1dh02EiGunLWhuoOdNvF3UrPE0qD2ZM7qbplmxDkmRa3Zh3pzIMPs23WaVl4V5OC/1Ti+WVWDxo4aXEAzzy8W1ynthDdB0mT4LK0foVlHsdb2bP9bIO3/Vj06aCPWsTq4Rv732jSfVlvNBiViUuQ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745481711; c=relaxed/simple;
	bh=D/Y6/EHMonZc0iYP7R/PSf9GY26fQNeAQSDvYFmK8JM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kN+yLsjYlgXFO1ORDjQtuysJLV60we5X4gRY+uPQ6Ry00xrSddRBrJL20QfxlOhu77eWWCPA+kUxhRMUNCz4giPp+tKLLhR7oraxzczVcTNdlbeWxGnXbLpxIRWUUlM9P7H8tlZQQz2/ZFdW0d88hndGXFwtn+gSAa3Oui++438=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=pufJE6Du; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TQNL2fLS; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="pufJE6Du";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TQNL2fLS"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6801C11401A3;
	Thu, 24 Apr 2025 04:01:48 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Thu, 24 Apr 2025 04:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745481708;
	 x=1745568108; bh=tCzfdIEPQk+Ked1eBto3FEOqBRQDz+qBwzWQxHxvs+U=; b=
	pufJE6Dux1/maYer3mM6ufjgni0zVYL3OTIvD7l44hZaTKG5wXKV9LDnGHo/pIXA
	VEGMb4YCfPPqoMr4S+A8tUpqGzdg6JrrrGVAeWFeBarjwpSRWGVllXysdS2uU02b
	MuKDr6O+idoBznmuMO5+WKiHQ0oOnNzuAZVe0gSJkg0B4O0BDRwJYodJSFjL6AAP
	abYycSEKBzO3Yusi2bwyhJ9MtlGlTDfH2LUvRo2rwygc7p3t1cJ4FApFnTMZHkvd
	fi/tCLDcVPjXwYb+7uZAwZorCKYTbnENlqqzqGuBiWbEPDAsABk1LgSbLuO/xKd8
	zVcQ7dRlxR25JE67gCKItA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745481708; x=
	1745568108; bh=tCzfdIEPQk+Ked1eBto3FEOqBRQDz+qBwzWQxHxvs+U=; b=T
	QNL2fLSQ9uIJGxrizeWCGw100TVB6p6SFWUeORXvPOus8IQjK7Moha0X8jsCucPZ
	cKZDeehgeI4eRRaHu0TpS4vUd3PhetREkUGcC6UgOX4R0KKIXhLGwfQGEssoyUXB
	uO/sIEutiWvwOnL3U+URpNLIC0eEZu7eiVwiunWIWhhdKEd4U8eVtrfaHk94qmrw
	G3fe87vuqJSM1ukF8nG5HN3DU5gEvwAUNIo/JgaAjdA2lA7zGiIyc7RinNn4m+CX
	bQmUd/7UEzwVGxA4KKFpK9sj+fT+Hqsur7cfj4XMv75zHwIryaDXLRBRnq1jJQBf
	9aqJ4eSEn/A3Ir0S19SFg==
X-ME-Sender: <xms:6-8JaPij_fi9iQ542pnnEUEd07zmRP41jkqKLEI2vg2b1Xu0mePKSQ>
    <xme:6-8JaMC85WXMSfIdZui_Hh_BDUIyNjCrtxGQb4IXGmS0M6Vtz66L5rpNCCwr0MLNk
    Rb_EOJzku4J0mPPyWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeekleefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeej
    feekkeelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepjhhsthhulhhtiies
    ghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtph
    htthhopeholhhivhgvrhdrshgrnhhgsehinhhtvghlrdgtohhmpdhrtghpthhtohepmhhi
    nhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgsohihugeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhg
    lhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepthhorhhvrghlughssehlih
    hnuhigqdhfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:6-8JaPE1xkLsM5sGm2OIy8bp5UR3TlbjNnIftx705cHh0VO-Z9R5Xg>
    <xmx:6-8JaMTp6n_VBlp8W3Veintkasp-DXj8Ztttw-I1IkRWLFleOJcOJw>
    <xmx:6-8JaMxk_zntweq-ooy0zvqqv4PTiJJzIs4Wux8yAs4jQsDNzcxdEQ>
    <xmx:6-8JaC7PQ3vOKbotClxQxbEU6BU0UQLh7kY44ek4X1qvDBVZtYfRXQ>
    <xmx:7O8JaDWWd0mnYUi-ouAKJMm5IeyUEc-w4BKYNJVvBVrTemj09QziEpXG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 22F5B2220074; Thu, 24 Apr 2025 04:01:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T98d234c297665c71
Date: Thu, 24 Apr 2025 09:59:38 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, "kernel test robot" <lkp@intel.com>,
 linux-kernel@vger.kernel.org, "Ingo Molnar" <mingo@kernel.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "John Stultz" <jstultz@google.com>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Stephen Boyd" <sboyd@kernel.org>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Message-Id: <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com>
In-Reply-To: <aAmeJmL0hUx2kcXC@xsang-OptiPlex-9020>
References: <202504211553.3ba9400-lkp@intel.com>
 <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com>
 <aAmeJmL0hUx2kcXC@xsang-OptiPlex-9020>
Subject: Re: [linus:master] [x86/cpu]  f388f60ca9:
 BUG:soft_lockup-CPU##stuck_for#s![swapper:#]
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Apr 24, 2025, at 04:12, Oliver Sang wrote:
> On Tue, Apr 22, 2025 at 12:16:33PM +0200, Arnd Bergmann wrote:

Cc:  x86 and timekeeping maintainers, see
https://lore.kernel.org/lkml/202504211553.3ba9400-lkp@intel.com/
for the thread so far.

>> > [ 721.016779][ C0] hardirqs last disabled at (159506): 
>> > sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1049) 
>> > [ 721.016779][ C0] softirqs last enabled at (159174): handle_softirqs 
>> > (kernel/softirq.c:408 kernel/softirq.c:589) 
>> > [ 721.016779][ C0] softirqs last disabled at (159159): __do_softirq 
>> > (kernel/softirq.c:596) 
>> > [  721.016779][    C0] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 
>> > 6.14.0-rc3-00037-gf388f60ca904 #1
>> > [  721.016779][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 
>> > 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
>> > [ 721.016779][ C0] EIP: timekeeping_notify 
>> > (kernel/time/timekeeping.c:1522) 
>> 
>> Timekeeping code could be related, I see that CONFIG_X86_TSC
>> is disabled for i486SX configurations, so even if a TSC is present
>> in the emulated machine, it is not being used to measure time
>> accurately.
>> 
>> > -CONFIG_X86_CMPXCHG64=y
>> 
>> This could be another issue, if there is code that relies on
>> the cx8/cmpxchg8b feature to be used. Since this is a non-SMP
>> kernel, this is less likely to be the cause of the problem.
>
> thanks a lot for all these details!
>
>> 
>> Can you try what happens when you enable the two options, either
>> by changing CONFIG_M486SX to CONFIG_M586TSC, or with a patch
>> like the one below? Note that CONFIG_X86_CMPXCHG64 recently
>> got renamed to CONFIG_X86_CX8, but they are the exact same thing.
>
> I applied your patch directly upon f388f60ca9 (change for X86_CMPXCHG64
> instead of X86_CX8 as you metnioned), commit id is
> c1f7ef63239411313163a7b1bff654236f48351c
>
...
> by running same tests, now it backs to the clean status like
> fc2d5cbe541032e7 (parent of f388f60ca9)

Thanks for confirming. So a 486-targeted kernel still passes
your tests on modern hardware if we force TSC and CX8 to
be enabled, but the boot fails if the options are turned
off in Kconfig (though available in emulated hardware).

To be completely sure, you could re-run the same test with
just one of these enabled, but I'm rather sure that the TSC
is the root cause. I tried reproducing the problem locally
with your .config on a qemu/tcg emulation running on an
arm64 host, but this seems to run fine, including the
rcutorture tests.

Comparing my results with your log file, I see that your
crash happens while changing the clocksource:

Your dmesg:
[   92.548514][    T1] hpet0: 3 comparators, 64-bit 100.000000 MHz counter
[  721.016745][    C0] watchdog: BUG: soft lockup - CPU#0 stuck for 626s! [swapper:1]

My dmesg:
[    1.154511][    T1] hpet0: 3 comparators, 64-bit 100.000000 MHz counter
[    1.157896][    T1] clocksource: Switched to clocksource tsc-early

There are also clearly some differences between TCG and KVM in
the handling of TSC, e.g. I get this warning from qemu itself
for the SandyBridge CPU:

qemu-system-i386: warning: TCG doesn't support requested feature: CPUID.01H:ECX.tsc-deadline [bit 24]

I tried a few other variations, including KVM on an x86 laptop
(using kvmclock or tsc-early clocksource), but none of them failed
the way yours did.

      Arnd
