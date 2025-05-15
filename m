Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF482149DF0
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326762; cv=none; b=Ej2olnaQNZJdQTRK+hXtvEAhBi/fAK7Ty1QOrEQmW+qfn3RybcvRAerYhUzFm7Kc0C2GPl2AUX+c//QvHChuBzTFZ4dYAZTds0r14BNMTDjKAEdAVGw6Mbs0omeF4pAlSh/eJs8TjeqkISLaq11jLYonUBL37Als/AK8j6KCFcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326762; c=relaxed/simple;
	bh=iVepeN/PtbU8HavBrPI8KLPMURWxiETrybxcjDQyqng=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bTJVC0NXC/G4sEShpHS23xc+isafXvtW9CO0zp75HEmkUuLCV6r6t7JPJ8IwKCF0HLzchrDPmbWiGhrGxPTWPNoc0dKjQvlp9Bcmr0ZtcuVhfLrwhaTYw4O6RzvmeZ02PliphflpWW2GRVqMTKag48NGKW+4GUh53ou1FFPGZFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 52C5392009C; Thu, 15 May 2025 18:32:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 4B9A492009B;
	Thu, 15 May 2025 17:32:32 +0100 (BST)
Date: Thu, 15 May 2025 17:32:32 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
    Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
    Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
    "Ahmed S . Darwish" <darwi@linutronix.de>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    John Ogness <john.ogness@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
In-Reply-To: <CAHk-=wi3kX2BHU7ABRRE=8-XYYXe8+ZffoxycHYT4TNQee0nBg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2505150206120.27710@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk> <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com> <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk> <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com> <20250505205405.GNaBklbdKLbadRATbr@fat_crate.local>
 <alpine.DEB.2.21.2505060059010.31828@angie.orcam.me.uk> <20250506141631.GEaBoZvzPCWh88xDzu@fat_crate.local> <alpine.DEB.2.21.2505062228200.21337@angie.orcam.me.uk> <8C172B63-38E1-427B-8511-25ECE5B9E780@alien8.de> <alpine.DEB.2.21.2505121225000.46553@angie.orcam.me.uk>
 <20250512134853.GGaCH8RUjJwgHq25qx@fat_crate.local> <alpine.DEB.2.21.2505121810040.46553@angie.orcam.me.uk> <CAADWXX8+-=pcOUeu_cwX_vkkkGp6jn0GQLUhZX8MxGGRjKz=Lg@mail.gmail.com> <a719b6ec1ccba2ecad7421a2cdf1660d1be16888.camel@physik.fu-berlin.de>
 <alpine.DEB.2.21.2505131735170.46553@angie.orcam.me.uk> <CAHk-=wi3kX2BHU7ABRRE=8-XYYXe8+ZffoxycHYT4TNQee0nBg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 May 2025, Linus Torvalds wrote:

> But I really don't think we've ever been *so* strict about pgp keys
> having all the proper pgp key signature chains. Yes, it's the normal
> rule and the regular way people identify themselves, but nothing
> should ever be mindlessly black-and-white.

 I agree about being reasonable.  However times are such that we need to 
be extremely vigilant.  I wish we were back in the 1990s when the worst 
threat online seemed to be unsolicited offers received via e-mail for 
various enlargement treatments; sadly not for the brain.

  Maciej
