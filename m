Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18842266EF6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107391; cv=none; b=V+f+w2MwvdjtlHeKcgkBc6xhII8WPLix7irLHD6T8751KgkTQr9W5pq0prfAsefy8OcwmRbmnsEqwcKLFtcuTGwrItPvgWpdd1AncmNaxwMXENnerVffJgplXAc0zwoPQBFchI0qiR1QbJMTZ/DNqN0VnChcHnRmeod47JW4D4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107391; c=relaxed/simple;
	bh=x/Vq1ulfJyLt/8bph2k3JJ9FH8R/3+iOzyNqANplotM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sp+BzYwVsCCTsO+U7Mh09JUovjW8aX+EhdxPS4af8ywrCsTX5p12pFrr3xGOtgQSo8PahUWUm22I7B/ggsso2GMrz7EzKhvZxUfAH05nlePG0xmq77+Lu5Pq56OC6q93hEB6VCpTGOvRO/pR3MQwqceIKQkXC0Cj/NUrbqqKpN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id ECBE392009C; Tue,  8 Apr 2025 12:16:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E915D92009B;
	Tue,  8 Apr 2025 11:16:26 +0100 (BST)
Date: Tue, 8 Apr 2025 11:16:26 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Borislav Petkov <bp@alien8.de>
cc: Kevin Koster <lkml@ombertech.com>, Thomas Gleixner <tglx@linutronix.de>, 
    Oerg866 <oerg866@googlemail.com>, linux-kernel@vger.kernel.org, 
    Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
    x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
In-Reply-To: <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
Message-ID: <alpine.DEB.2.21.2504081107390.29566@angie.orcam.me.uk>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com> <20250405130306.ca9822c1f27db119cc973603@ombertech.com> <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local> <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
 <20250406174633.2c581923c145687476191753@ombertech.com> <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 6 Apr 2025, Borislav Petkov wrote:

> > But if I move "cpuid_1_eax = native_cpuid_eax(1);" to after the
> > microcode_loader_disabled() check in amd.c, like in the first patch, it
> > boots fine!
> 
> Yeah, I noticed that too last night. Here's a hopefully better version after
> I ran it on my 32-bit Atom - I don't have your old rust and maybe you should
> simply throw it in the garbage - that thing is probably not worth the
> electricity it uses to power up... :-)

 C'mon, these are good room heaters with nice extra side effects. ;)

  Maciej
