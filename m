Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA52633991
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745745961; cv=none; b=YXqt+MPzHGufc+NsM/fO1tk4RGx5tavmW+HkHorZTub3Peg7B2U5bBA6efy0L17xINueB5urnkwP/hTpm/QdBGCkYHh8hTJEbXhBGeNu9iXGTeq3PWGkBk92B16z4whyruJesK+o5T+aOrEhZylMOilYoELfXJuJ3o4o/6z9mS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745745961; c=relaxed/simple;
	bh=wQ+9+CaKroXSFjH6SdbYajYrQLIb9k+/sJK4T31VvCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCIdnNahaZrZK17GGttXD0Ka8AjWJ5eb8UMzswVEIG076TiZeGZUnH41C2OmQUCxjnRxGJox/a0NdHZXwKMsl7r/NUe+12oE34DdZmMfn7K9Ry9wDhiM33oYiR1EUeDO4FKZjMxQZSpy4s22K+UpkJErKzWq5cmiaTKwS3fgH6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuzM6TUb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuzM6TUb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A060C4CEE3;
	Sun, 27 Apr 2025 09:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745745960;
	bh=wQ+9+CaKroXSFjH6SdbYajYrQLIb9k+/sJK4T31VvCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VuzM6TUbkGoHtmE1u6yd9RZcBQMs+s/atFXXzgWjTC/A45OYt2lEJP6nWsR9lJRj2
	 4HD20nvkGwURzDu8yLZPesQcd7I6PkyvtD3ZQARP8Hc+kZgponcqPrT4n/pvcYKJM1
	 PxIpri24zsK5BOzMAINm2cv/U1ogVZGD7NpfFNqPSfNX20Bjpuh2RE7F+pnibZpvgf
	 0IMub8m26x2Yc81OT0k5G6KRlLwhuLtoUPSqWOKnaU5RTwpeWMYnMQwX7rU90G4fP+
	 FyudpJxJeReJLUzdFEcmZHEeHsjSKfalKblXliD7IzMLP9jaiNC8ZdBsvggE1iUe6D
	 NwVD4YDvd27eA==
Date: Sun, 27 Apr 2025 11:25:55 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
	"Ahmed S . Darwish" <darwi@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 13/15] x86/cpu: Make CONFIG_X86_CX8 unconditional
Message-ID: <aA34I9rY1-1QQo0R@gmail.com>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <20250425084216.3913608-14-mingo@kernel.org>
 <956412a3-43c2-4d6e-bea2-2573c98233ae@app.fastmail.com>
 <8D770F85-5417-4A9E-80DE-1B6A890DECEF@zytor.com>
 <1d4ddcab-cf46-4d7e-9e33-de12b6bd350c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d4ddcab-cf46-4d7e-9e33-de12b6bd350c@app.fastmail.com>


* Arnd Bergmann <arnd@kernel.org> wrote:

> On Fri, Apr 25, 2025, at 17:15, H. Peter Anvin wrote:
> > On April 25, 2025 5:10:27 AM PDT, Arnd Bergmann <arnd@kernel.org> wrote:
> >>
> >>I just noticed this one: the final 'default "4"' is no longer possible
> >>here and can be removed. All the remaining CPUs report family "5" or
> >>higher.
> >>
> >>There is an old issue for some rare CPUs (Geode LX and Crusoe) that
> >>support CMOV but report family=6. These to boot a kernel with X86_MINIMUM_CPU_FAMILY=6 because it triggers the boot time check.
> >>
> >
> > They report family=5 because family=6 implies fcomi and nopl support 
> > (in the case of Crusoe, they have fcomi but didn't support movl.)
> 
> Ah right, I see now. I had only checked that the kernel itself
> no longer uses nopl after your ba0593bf553c ("x86: completely
> disable NOPL on 32 bits"), and I had seen that Debian intentionally
> builds 32-bit i686 kernels with CONFIG_MGEODEGX1.
> 
> I now found that both Debian 12 and gcc 11 changed their definition
> if 686 to actually require nopl for Indirect branch tracking 
> (-fcf-protection) in user space, as discussed in
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104713
> 
> So even if it makes sense for GeodeLX specific kernel to use CMOV,
> any general-purpose i686 distro would still want to enable IBT
> in userspace to gain IBT on Tiger Lake and newer 64-bit CPUs.

And the kernel Debian 12 uses is a "686" one:

  ./pool/main/l/linux-signed-i386/linux-image-6.1.0-32-686_6.1.129-1_i386.deb
  ./pool/main/l/linux-signed-i386/linux-image-686_6.1.129-1_i386.deb

and the kernel is set to CONFIG_MGEODE_LX=y:

  $ grep CONFIG_MGEODE_LX ./boot/config-6.1.0-32-686
  CONFIG_MGEODE_LX=y

... which CPU has CMOV support:

  config X86_CMOV
        def_bool y
        depends on (MK7 || MPENTIUM4 || MPENTIUMM || MPENTIUMIII || MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MCRUSOE || MEFFICEON || MATOM || MGEODE_LX || X86_64)                                                                                                                                                                                                                                           ^^^^^^^^^
So I'd argue that the kernel's x86-32 CPU support cutoff should match 
the i386 CPU support cutoff of the Debian i386 installer.

Survey of other distros:

 - Fedora dropped x86-32 with Fedora 31, almost 5 years ago.

 - Ubuntu dropped x86-32 after 18 LTS, more than 5 years ago. The LTS 
   kernel is v5.6 based.

 - Arch Linux dropped i686 support even earlier than that, the 
   spin-off-community project of archlinux32.org has 486 and 686 
   variants. 686 variant includes CMOV.

 - Gentoo has an 'x86' variant with 486 and 686 stages. 686 stage 
   includes CMOV.

Ie. I think we can also make CMOV a hard requirement, and keep support 
for all family 5 CPUs that have CMOV and have a chance to boot current 
32-bit distros. Even distros that had 486 builds have 686 variants that 
should still work.

I.e. remove support for M586MMX, M586TSC, MCYRIXIII, MGEODEGX1 and MK6 
as well, these don't have CMOV support and won't even boot i386 Debian 
12.

Summary, the plan would be to remove support for the following pre-CMOV 
CPUs (the ones not yet in this series are marked 'NEW'):

  M486
  M486SX
  M586
  M586MMX         # NEW
  M586TSC         # NEW
  MCYRIXIII       # NEW
  MELAN
  MGEODEGX1       # NEW
  MK6             # NEW
  MWINCHIP3D
  MWINCHIPC6

And to keep these:

  M686
  MATOM
  MCRUSOE
  MEFFICEON
  MGEODE_LX
  MK7
  MPENTIUM4
  MPENTIUMII
  MPENTIUMIII
  MPENTIUMM
  MVIAC3_2
  MVIAC7

Thanks,

	Ingo
