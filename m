Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A19A289378
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746549881; cv=none; b=AAIKtagi533VIdm3WEYwBdmcG7lkubbkPcNCqH59eLdUG6uVmacr9n7R8D9V4bAufGW+my12p7gPxSXjcXKqhR7rs0nXYgcgfnDvMQrh2C+fZuA+l9S7HUs4uaYCDQVm1yQdU2JU/2uwHXwrN+X1gxLGwxER7dkjVNe0uEY9sps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746549881; c=relaxed/simple;
	bh=wpqJCi8HG3WiomHyP8fMfm6jQ/iezinu9YOFtJXTSG4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Tu+N4M9uRLbgSZeXe51o07epsyJv6jwF2SKWdcbzPSx/GPCwlazPwFNijgUHAHaMGwnsLZONdBCbRK8cQtghISSHgs6zIHsJK7/E2NIsHJF8fv7o/bNiIFPBoPJDMkwq26OKOl1nVzf3/mb0FevA+7Ixf9SUhjAy2CL+4u0VjQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=U6P+bqI3; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="U6P+bqI3"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 546Gi3k5975950
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 6 May 2025 09:44:04 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 546Gi3k5975950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1746549845;
	bh=lrUXxvgqxewJgKKyCt+6+ALiF2c29NTphVVao6dyW5s=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=U6P+bqI3yEOS+sdxVqiCsAz4xHXjHXZpKGwisKWH3Izac1i+ONC3MMOxz8Go0WocJ
	 Ul5CfdzYprhgO+5HJDnUiP3FCL9zOgWMWTPIiH5M+mCpQbp6b6rs8LvyFvct8/dP32
	 AbiDworhuWibVabUkNHh5DeLPwRiewIXOd/1T5wu7Mm1rQhj5/u+nveRMgVoVnPCWs
	 fUTHOOTBX4O24lRLXwnbKvWmm2qbnqJ/lKWyKsOXGcQJQ7kftrSOdBv2t9tAePRpV4
	 A2Q/vYiSP6CppdqDqSEOlxq9k+ptHTAy0z5uOidv/hvvUpTZMCXEiZq2pwAxzgKiY/
	 2+r/hBzDJme3g==
Date: Tue, 06 May 2025 09:44:01 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>
CC: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
        "Ahmed S . Darwish" <darwi@linutronix.de>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        John Ogness <john.ogness@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_0/15=5D_x86=3A_Remove_su?=
 =?US-ASCII?Q?pport_for_TSC-less_and_CX8-less_CPUs?=
User-Agent: K-9 Mail for Android
In-Reply-To: <alpine.DEB.2.21.2505061104490.31828@angie.orcam.me.uk>
References: <20250425084216.3913608-1-mingo@kernel.org> <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk> <CAHk-=wicfBCyMj_x5BiL32o55jqXfnxgn=X5BZZjA-FFER82Jg@mail.gmail.com> <alpine.DEB.2.21.2505061104490.31828@angie.orcam.me.uk>
Message-ID: <A5AC3B8B-335C-4594-B0DC-D9247B286A37@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 6, 2025 6:53:34 AM PDT, "Maciej W=2E Rozycki" <macro@orcam=2Eme=2Euk=
> wrote:
>On Mon, 5 May 2025, Linus Torvalds wrote:
>
>> >  We also have platforms that lack atomics, let alone double-precision=
 ones
>> > and they're fine too, so why is x86 different?
>>=20
>> So I don't know if you saw this thread:
>>=20
>>    https://lore=2Ekernel=2Eorg/all/202504211553=2E3ba9400-lkp@intel=2Ec=
om/
>>=20
>> where I initially thought that it was the lack of TSC, but it looks
>> like it's the CMPXCHG8B code that ends up causing problems=2E
>
> I did glance over (in my effort to process outstanding 40k mailing list=
=20
>messages in two days), but haven't spotted CMPXCHG8B being the culprit;=
=20
>thanks for the pointer=2E
>
>> And the core issue boils down to "there's no point in wasting time on
>> even debugging this"=2E
>
> Sadly I tend to agree, being unable, owing to time constraints, to commi=
t=20
>myself to doing such debugging (NB glibc verification crashes i386 Linux=
=20
>reliably on Pentium MMX, apparently due to FP context corruption, and I=
=20
>need to prioritise debugging that, once I've figured out which actual tes=
t=20
>case triggers it, as due to the oddity of the glibc test system it's quit=
e=20
>tough getting the logs matched between the host and the target system)=2E
>
>> So basically, the support for i486 costs us more than it is worth=2E
>
> So the cost has to be reduced and just as I proposed on the previous=20
>iteration last year this can be solved quite easily without sacrificing=
=20
>i486 support by adding #UD handler for CMPXCHG8B, just as we did for=20
>analogous stuff with some RISC platforms years if not decades ago=2E
>
> I was told in said discussion that decoding x86 address modes was not as
>easy as with RISC modes (thank you, Captain Obvious!), but still that=20
>boils down to indexing into registers by ModR/M and SIB bit-fields, with =
a=20
>couple of corner cases, which ought to be less than a screenful of code=
=2E =20
>If objdump(1) can do it, so can we=2E
>
> No i486 has ever run Linux SMP=2E  Back in the day I tried hard to chase=
 by=20
>the spec a single i486 system built around the APIC and Intel MP Spec and=
=20
>could not find any=2E  Compaq had some proprietary stuff (Corollary bus?)=
 we=20
>never had support for=2E  And we discarded support for the discrete i8248=
9DX=20
>APIC years ago anyway that some Pentium systems used too for the original=
=20
>P5 microarchitecture or to go beyond dual=2E  So said emulation would hav=
e=20
>to handle the UP case only, which ought to be straightforward and well=20
>contained=2E
>
> Thoughts?
>
>  Maciej

However, building a #UD instruction emulator is a project in itself that s=
omeone would have to take on=2E It isn't inherently simpler =E2=80=93 quite=
 the opposite =E2=80=93 than the alternatives calling to a stub function th=
an we have now=2E

We have the tools to do it; there is now a full x86 instruction decoder in=
 the kernel that one could use to do this, but=2E=2E=2E

a=2E Someone would have to take it on;
b=2E It will need continuous testing;
c=2E That someone would *also* have to go through the additional effort of=
 keeping the mainline code clean for the maintainers of the modern hardware=
=2E

And at some point we will be at a point where we were with i386 that the o=
nly users are occasional testers=2E

With regards to EISA, you still haven't clarified if there is a true use c=
ase or if this is a museum/nostalgia project=2E There isn't anything *wrong=
* with museum projects, not at all (I recently got to play SPACEWAR! on a r=
eal PDP-1; it was amazing) but imposing a maintenance burden on the mainlin=
e developers of one of the most heavily used architecture on the planet is =
not practical=2E

If someone really wanted to, they could maybe fork off, say, arch/i486 and=
 maintain the a version of the kernel limited to these old machines, but it=
 would require someone being willing to do the work=2E=20
