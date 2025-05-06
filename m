Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CEB28136B
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746539515; cv=none; b=juUlNNCvnKR5EB4/2Du3c2hw/Ywhwg1x5WtKG9WeIFfSh0bTVfNTrVG4o5Nt1PZDOhqqdTLQM9RrhmobgJfpvgHDXDbvEbAEmx3U31OspKmoFifrnsTNiTca11Pb6w5nGET01FrubYqR+qUk3RUVQ2VjHcccsFA0esyCDGzkp+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746539515; c=relaxed/simple;
	bh=VN8kNRaE7xqcUHXaKiKW+pGLcT2hFYDK2BhLpgUv/4k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sQ7E+V3VseOzf50uvBnZo4AUL/51peILHctCrrn+ZcW/g/4u37faCDY6K6zxBjepmcg8AIw35FW2kY/mvvdwX2R3g4rhTeC8iWFdE20MYYZmHj2H+G24sHK7xWOFlmCzzurc/xBgsz3vVvR33fdalcxzHgUVooBP1th8srqN3nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 0192092009C; Tue,  6 May 2025 15:51:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id EF14F92009B;
	Tue,  6 May 2025 14:51:51 +0100 (BST)
Date: Tue, 6 May 2025 14:51:51 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Borislav Petkov <bp@alien8.de>
cc: "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>, 
    linux-kernel@vger.kernel.org, "Ahmed S . Darwish" <darwi@linutronix.de>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    John Ogness <john.ogness@linutronix.de>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
In-Reply-To: <20250505205405.GNaBklbdKLbadRATbr@fat_crate.local>
Message-ID: <alpine.DEB.2.21.2505060059010.31828@angie.orcam.me.uk>
References: <20250425084216.3913608-1-mingo@kernel.org> <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk> <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com> <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk> <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com>
 <20250505205405.GNaBklbdKLbadRATbr@fat_crate.local>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 May 2025, Borislav Petkov wrote:

> > One thing that happened with i386 was that we found out that the only
> > remaining "users" were people dragging out an old machine to test if the
> > kernel still booted.
> 
> Follow this thread:
> 
> https://lore.kernel.org/r/CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com
> 
> People booting latest kernel on 486 without CPUID support. 

 No such hardware here:

processor	: 0
vendor_id	: GenuineIntel
cpu family	: 4
model		: 3
model name	: 486 DX/2
stepping	: 5
fdiv_bug	: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 1
wp		: yes
flags		: fpu vme cpuid
bugs		: itlb_multihit
bogomips	: 32.56
clflush size	: 32
cache_alignment	: 32
address sizes	: 32 bits physical, 32 bits virtual
power management:

Sadly it's not one with 4MiB page support (that would be stepping 6).

> There's stable and older kernels, those folks can use those and that's it.

 Doesn't work for ongoing driver maintenance (and yes, distractions such 
as this only keep me from taking care of outstanding stuff, like figuring 
out why the defxx driver reproducibly crashes with my POWER9 box running 
glibc verification remotely for my RISC-V box; it's all intertwined and an 
issue in one place affects other ones, sigh).

  Maciej
