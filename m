Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFADD12E5B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 17:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745775167; cv=none; b=Kz3VeJPyDvMeuxlFi1xwQjvXm+xcXvaYlZ/JnL1u2XJyUBS8Jgr9JRWjPYFJN3aWEXNLUM6/a+x/eyGElXKnbzAYTyPtslshnMCd1pnO36OLYZPfTjSDGV0lb9QngGSvHXJckYWKvgYzpZNF1VOwyRBe8kYnhvdBWMrvrtgTtPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745775167; c=relaxed/simple;
	bh=/OrUbkCzu4nqwzBxu6AIImeMV3rwxXLoaBvx5DACz+I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZOlWSFufjbDsBXSPKouIG/UW7O7bIUnb835nI9/2hODTdgablA/m8o6WLqdEIua3l784pxew0zvjy7V92g/QeIGXA6yITtcjlvz1zuIGFRG3BhayVqHUzL2NaY07y2E6jlyb5SqJAPn14XRPdudHhm9uhlJyzfzHqrWSXB7t+2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p/Z0OmT/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p/Z0OmT/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064AAC4CEED;
	Sun, 27 Apr 2025 17:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745775166;
	bh=/OrUbkCzu4nqwzBxu6AIImeMV3rwxXLoaBvx5DACz+I=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=p/Z0OmT/nFq7gCYSxjTM5K2wNvFe+CoLePBeB52zCTzbyfXux6uRYdpOVqechPj/D
	 3Lwz0uFZp25zw8lfGxMa1WrP5h+XHNl7mMQusrMyLvDtrzLvtClGy6VBC10MoAY64n
	 PNni/Am6zlkiSgX8BJ5f11FaXpvSlQqcrdATuqSTjdjxzP1YJhqhoyhx96CuhMET3n
	 s7SsZ2eIReMXx55PcSur+AzBS8KHwF0jQEkKxJa2EU6DM/PRiSE0+e2u3TQzDFjpej
	 ff5cre8LVHzeDFntr/RDrxyTsK+fNf//xqUo3Lr77zuHEX054XFWd/aOXQ4Q19Mq/+
	 MIzfHeYx2k0MQ==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 074181200068;
	Sun, 27 Apr 2025 13:32:45 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Sun, 27 Apr 2025 13:32:45 -0400
X-ME-Sender: <xms:PGoOaPHzwNJexKVruXMEbC9GeuYf4PseN64_PMfi-BFYS4iMmY_WfA>
    <xme:PGoOaMV_dD9BOsLzLzQnB6IUYPevW4CfCaBaz0ado0Gkx-lbbSKcAcDZl1khIMgq7
    nJ4fWwTDCepeNPXo0I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheekieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnh
    gvlhdrohhrgheqnecuggftrfgrthhtvghrnhepudffteefvdeljeehgfffgfejheeigfej
    ieevieffteejffefiedtueelgeeigfdunecuffhomhgrihhnpehgnhhurdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguodhm
    vghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdegqddvkeejtd
    dtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvgdpnhgspghr
    tghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlih
    gvnhekrdguvgdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihig
    rdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtg
    hpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihhnghhosehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegurghrfihisehlihhnuhhtrhhonhhigidrug
    gvpdhrtghpthhtohepjhhohhhnrdhoghhnvghssheslhhinhhuthhrohhnihigrdguvgdp
    rhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehtoh
    hrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:PGoOaBK9YUaec-XIWSNRTp2QCZj6JLG-_sG5OJoQD1QGKsD8dtqZXw>
    <xmx:PGoOaNEY9_QFFslcdEsQy-E4dsMq6MhiPo0ms5EcuC9YaZVayvU3DA>
    <xmx:PGoOaFUbcagcYisPo8qszCMHrbV7I4MgekZ5XWOFI8BbAhJdf9Sr_A>
    <xmx:PGoOaIOd-b-t6rzxY4H1x3jbI5hyRGuBrc-EZVj3TmGTEotj7oq8cw>
    <xmx:PWoOaE1ULUIVxm7czBH3o0Ki-js70mM4jECX9vL428f8a-2MZKdUK9cD>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CD4232220072; Sun, 27 Apr 2025 13:32:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Td35c5eaba32a0728
Date: Sun, 27 Apr 2025 19:32:14 +0200
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
Message-Id: <b97650f6-b541-4496-b84d-862fc7fd711b@app.fastmail.com>
In-Reply-To: <aA34I9rY1-1QQo0R@gmail.com>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <20250425084216.3913608-14-mingo@kernel.org>
 <956412a3-43c2-4d6e-bea2-2573c98233ae@app.fastmail.com>
 <8D770F85-5417-4A9E-80DE-1B6A890DECEF@zytor.com>
 <1d4ddcab-cf46-4d7e-9e33-de12b6bd350c@app.fastmail.com>
 <aA34I9rY1-1QQo0R@gmail.com>
Subject: Re: [PATCH 13/15] x86/cpu: Make CONFIG_X86_CX8 unconditional
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Apr 27, 2025, at 11:25, Ingo Molnar wrote:
> * Arnd Bergmann <arnd@kernel.org> wrote:
>> On Fri, Apr 25, 2025, at 17:15, H. Peter Anvin wrote:
>> 
>> I now found that both Debian 12 and gcc 11 changed their definition
>> if 686 to actually require nopl for Indirect branch tracking 
>> (-fcf-protection) in user space, as discussed in
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104713
>> 
>> So even if it makes sense for GeodeLX specific kernel to use CMOV,
>> any general-purpose i686 distro would still want to enable IBT
>> in userspace to gain IBT on Tiger Lake and newer 64-bit CPUs.
>
> And the kernel Debian 12 uses is a "686" one:
>
>   ./pool/main/l/linux-signed-i386/linux-image-6.1.0-32-686_6.1.129-1_i386.deb
>   ./pool/main/l/linux-signed-i386/linux-image-686_6.1.129-1_i386.deb
>
> and the kernel is set to CONFIG_MGEODE_LX=y:
>
>   $ grep CONFIG_MGEODE_LX ./boot/config-6.1.0-32-686
>   CONFIG_MGEODE_LX=y
>
> ... which CPU has CMOV support:
>
>   config X86_CMOV
>         def_bool y
>         depends on (MK7 || MPENTIUM4 || MPENTIUMM || MPENTIUMIII || 
> MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MCRUSOE || MEFFICEON || 
> MATOM || MGEODE_LX || X86_64)                                           
>                                                                         
>                                                                         
>                                                 ^^^^^^^^^
> So I'd argue that the kernel's x86-32 CPU support cutoff should match 
> the i386 CPU support cutoff of the Debian i386 installer.

I think this misses a few other bits of information, some of which
we already mentioned in this thread:

- Debian 13 no longer has any 32-bit kernel, so debian-i686 is
  primarily targeted at running on 64-bit kernels for memory
  constrained environments.

- Debian 12 started requiring NOPL in userspace, which is not
  supported on GeodeLX (or Crusoe), the kernel option should have
  been changed to M686 instead but was accidentally left at
  MGEODE_LX, so the kernel still works, but userspace doesn't.

- Anyone running Linux on an i586 machine likely already wants
  a custom kernel, regardless what the distros provide. This
  is especially true for the embedded targets.

> Survey of other distros:
>
>  - Fedora dropped x86-32 with Fedora 31, almost 5 years ago.
>
>  - Ubuntu dropped x86-32 after 18 LTS, more than 5 years ago. The LTS 
>    kernel is v5.6 based.
>
>  - Arch Linux dropped i686 support even earlier than that, the 
>    spin-off-community project of archlinux32.org has 486 and 686 
>    variants. 686 variant includes CMOV.
>
>  - Gentoo has an 'x86' variant with 486 and 686 stages. 686 stage 
>    includes CMOV.
>
> Ie. I think we can also make CMOV a hard requirement, and keep support 
> for all family 5 CPUs that have CMOV and have a chance to boot current 
> 32-bit distros. Even distros that had 486 builds have 686 variants that 
> should still work.
>
> I.e. remove support for M586MMX, M586TSC, MCYRIXIII, MGEODEGX1 and MK6 
> as well, these don't have CMOV support and won't even boot i386 Debian 
> 12.
>
> Summary, the plan would be to remove support for the following pre-CMOV 
> CPUs (the ones not yet in this series are marked 'NEW'):
>
>   M486
>   M486SX
>   M586
>   M586MMX         # NEW
>   M586TSC         # NEW
>   MCYRIXIII       # NEW
>   MELAN
>   MGEODEGX1       # NEW
>   MK6             # NEW
>   MWINCHIP3D
>   MWINCHIPC6

This would also mean dropping support for the pre-2015 Intel Quark
and DM&P Vortex86DX/DX2/MX/EX that never had a custom CONFIG_Mxxxx
option but are still relevant to some degree.
I think that would be a mistake. 

> And to keep these:
>
>   M686
>   MATOM
>   MCRUSOE
>   MEFFICEON
>   MGEODE_LX
>   MK7
>   MPENTIUM4
>   MPENTIUMII
>   MPENTIUMIII
>   MPENTIUMM
>   MVIAC3_2
>   MVIAC7

As Linus said, overall they are barely different from the
first group, and they are just as obsolete, only Atom and
Vortex86DX3/EmKore are less than 20 years old.

Here are some alternatives I like better than dropping i586:

a) keep my patch with an new bool option to pick between
   i586 and i686 targets, by any name.

b) always build with -march=i586 and leave only the -mtune
   flags; see if anyone cares enough to even benchmark
   and pick one of the other options if they can show
   a meaningful regression over -march=i686 -mtune=

c) keep the outcome of your v1 series, dropping only
   pre-i586 support, and leave my patch out. No change here,
   so at least no regression potential.

d) use -march=i686 (plus -mtune=) for normal builds, but
   keep support for the older cores guarded by
   X86_EXTENDED_PLATFORM or CONFIG_EXPERT, use -march=i586
   if at least one of those platforms is selected.

      Arnd
