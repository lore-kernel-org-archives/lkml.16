Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F9B2686A0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108627; cv=none; b=NaW+v2jI2f+0lXcoPVqmOb0LYx8rrvdc3kcxpGvCjNVXDtmRawlvBZhMsLSmP42TaBATzq2759ob3d0Csdeo72diVA9WgktIdwcEz6SLBv0oFFmWEFTKjHREoJhIf6FzLD7JxYyK8IZopB/lytxQAadqu8spBSogB+7pJZAwIDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108627; c=relaxed/simple;
	bh=RKIzGkJ9K6o+c6b2EpnYpCH+wdgLRLW0kNgcGBhVPwE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fL5g+KyRCkg+SDgWh578npNpHtf5+NBlMiUsBoQk/+QjN0exxmzRtoyb5CysUhQjRni8Rfk9Za6l6q6ZAAY1Sa8pS/O5OAkbZY6WqQEOKNov6qP8iQLlq+m1/Dzgx2mR7AmjyaPY/eagS5OQU2I/s/hoyi2ErCczGx+KBLVzg4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C2BDF92009C; Tue,  8 Apr 2025 12:37:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id BB7FF92009B;
	Tue,  8 Apr 2025 11:37:02 +0100 (BST)
Date: Tue, 8 Apr 2025 11:37:02 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Oerg866 <oerg866@googlemail.com>
cc: Borislav Petkov <bp@alien8.de>, Kevin Koster <lkml@ombertech.com>, 
    Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
    Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
    x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
In-Reply-To: <CANpbe9Vyss7wEd0rQA7Z=mfi6WTkm5JjCJjTkcsqGCd0mGA2aw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2504081115310.29566@angie.orcam.me.uk>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com> <20250405130306.ca9822c1f27db119cc973603@ombertech.com> <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local> <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
 <20250406174633.2c581923c145687476191753@ombertech.com> <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local> <20250407095848.7933a358c9f450fe03fb8234@ombertech.com> <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local> <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
 <20250407135533.GDZ_PZVZ-2CKmhbt7d@fat_crate.local> <CANpbe9Vyss7wEd0rQA7Z=mfi6WTkm5JjCJjTkcsqGCd0mGA2aw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Apr 2025, Oerg866 wrote:

> One of my projects uses a modern Linux kernel to install Windows 9x (sorry!)
> onto a legacy (or modern, if that's your thing) systems, including
> magical things like VESA Local Bus 486 systems, way faster than the
> official MS installer ever could. There's quirks here and there, especially
> with regards to libata and obscure IDE/SCSI controllers, but other than
> that the kernel does its job and it does it extremely well.

 FWIW I run a plain EISA 486 box to verify our defxx driver keeps working 
with an EISA FDDI network interface, one of the host bus attachments the 
driver supports.  I also run a dual Pentium MMX box (i430HX chipset), 
which I recently used for i386 GNU toolchain/C library verification in the 
course of upstreaming some stuff for my day job (it's the very box I used 
for APIC fiddling some 25 years ago, which Ingo may remember).

 Both machines are permanently wired for continuous use and remote control 
in my remote lab and run fairly recent versions of the kernel (as my time 
permits upgrading).

 I note that the lack of support for SW DMA mode in libata has degraded 
performance of a PATA drive (the rest is SCSI) in the MMX box compared to 
old IDE code, forcing the drive to use PIO 1.  Alas, I've found no time so 
far to look into porting that stuff over and said drive is not essential 
for that system.

  Maciej
