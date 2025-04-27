Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE92E26AF5
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 21:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745789215; cv=none; b=GepSvs7rra8tWhEhfNMCUPLtHjuXF/iBKzF6+VBEyTQqrkY6R5OcB/lQaL4gOYnG9khlP1kgOo3ChmYDAanQfMcHQSgJYWLlev40lpmaWtWn/KFJI9ywsPxk7xmfTc6bCO3apZigEsyrex1u07fvPiAzMq7DH4agkLwSBJeJEek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745789215; c=relaxed/simple;
	bh=+P0Z3PvPK1gV/LsyaBB6y6AtD1FSzlRiX/MPttTZFnk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=MAtyvs2Unka3VAIprjzu9czmXpM5V+V/vuWREidH0UrrHL6W/BpqjtHjqoNewkzigGgN3tdBReEU+CQ4wR6pF9Ig5QoROproPB3X08AkCWaOppDYF4gTiDBpBzFewd2oka7VG5qzX31cFs07ExxMEIUOi9/IbZw4XvoqNUJYXDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=EnY4bf/W; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="EnY4bf/W"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53RLQQ8M2378754
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 27 Apr 2025 14:26:26 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53RLQQ8M2378754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745789187;
	bh=+NpmUcoauFK2icq+gt17CSvkWzD2kbSH/sDL18x2II8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=EnY4bf/WDqAUGvsNHxie3QInD6kIoIJLhQK0y1rFgej2K9La4PgZpSEbh+e1nl/iJ
	 ouaBcA/aeCz3LRCU6UjCttluqP6bri6HMuQLRU+ZcE7/FRUAH+r9kgJ7gbSJ0REk6m
	 4dWhZyqPNonLupJX1Ce//WqMGb7AUwwLPnPqck2qzx50+cmrGWoB1qE4OX28xDuW6L
	 cx8UZKoMEIcjL6TrfLI6vFUJiQtpyO230xg6kijOlVdqhCB0/x351JpTVoiW29+EW0
	 /lPoz8eUykawgwyYkE31lPOLNX4qkbUcd3G+lNq9a+P3to8all9rmoABM6H/3Gr+7p
	 6WAjBGb8/KfVQ==
Date: Sun, 27 Apr 2025 14:26:24 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Arnd Bergmann <arnd@kernel.org>, Ingo Molnar <mingo@kernel.org>
CC: linux-kernel@vger.kernel.org, "Ahmed S . Darwish" <darwi@linutronix.de>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        John Ogness <john.ogness@linutronix.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 13/15] x86/cpu: Make CONFIG_X86_CX8 unconditional
User-Agent: K-9 Mail for Android
In-Reply-To: <b97650f6-b541-4496-b84d-862fc7fd711b@app.fastmail.com>
References: <20250425084216.3913608-1-mingo@kernel.org> <20250425084216.3913608-14-mingo@kernel.org> <956412a3-43c2-4d6e-bea2-2573c98233ae@app.fastmail.com> <8D770F85-5417-4A9E-80DE-1B6A890DECEF@zytor.com> <1d4ddcab-cf46-4d7e-9e33-de12b6bd350c@app.fastmail.com> <aA34I9rY1-1QQo0R@gmail.com> <b97650f6-b541-4496-b84d-862fc7fd711b@app.fastmail.com>
Message-ID: <B0D2F96E-F090-4D60-94B5-9FAD3536A4BD@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 27, 2025 10:32:14 AM PDT, Arnd Bergmann <arnd@kernel=2Eorg> wrote:
>On Sun, Apr 27, 2025, at 11:25, Ingo Molnar wrote:
>> * Arnd Bergmann <arnd@kernel=2Eorg> wrote:
>>> On Fri, Apr 25, 2025, at 17:15, H=2E Peter Anvin wrote:
>>>=20
>>> I now found that both Debian 12 and gcc 11 changed their definition
>>> if 686 to actually require nopl for Indirect branch tracking=20
>>> (-fcf-protection) in user space, as discussed in
>>> https://gcc=2Egnu=2Eorg/bugzilla/show_bug=2Ecgi?id=3D104713
>>>=20
>>> So even if it makes sense for GeodeLX specific kernel to use CMOV,
>>> any general-purpose i686 distro would still want to enable IBT
>>> in userspace to gain IBT on Tiger Lake and newer 64-bit CPUs=2E
>>
>> And the kernel Debian 12 uses is a "686" one:
>>
>>   =2E/pool/main/l/linux-signed-i386/linux-image-6=2E1=2E0-32-686_6=2E1=
=2E129-1_i386=2Edeb
>>   =2E/pool/main/l/linux-signed-i386/linux-image-686_6=2E1=2E129-1_i386=
=2Edeb
>>
>> and the kernel is set to CONFIG_MGEODE_LX=3Dy:
>>
>>   $ grep CONFIG_MGEODE_LX =2E/boot/config-6=2E1=2E0-32-686
>>   CONFIG_MGEODE_LX=3Dy
>>
>> =2E=2E=2E which CPU has CMOV support:
>>
>>   config X86_CMOV
>>         def_bool y
>>         depends on (MK7 || MPENTIUM4 || MPENTIUMM || MPENTIUMIII ||=20
>> MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MCRUSOE || MEFFICEON ||=20
>> MATOM || MGEODE_LX || X86_64)                                          =
=20
>>                                                                        =
=20
>>                                                                        =
=20
>>                                                 ^^^^^^^^^
>> So I'd argue that the kernel's x86-32 CPU support cutoff should match=
=20
>> the i386 CPU support cutoff of the Debian i386 installer=2E
>
>I think this misses a few other bits of information, some of which
>we already mentioned in this thread:
>
>- Debian 13 no longer has any 32-bit kernel, so debian-i686 is
>  primarily targeted at running on 64-bit kernels for memory
>  constrained environments=2E
>
>- Debian 12 started requiring NOPL in userspace, which is not
>  supported on GeodeLX (or Crusoe), the kernel option should have
>  been changed to M686 instead but was accidentally left at
>  MGEODE_LX, so the kernel still works, but userspace doesn't=2E
>
>- Anyone running Linux on an i586 machine likely already wants
>  a custom kernel, regardless what the distros provide=2E This
>  is especially true for the embedded targets=2E
>
>> Survey of other distros:
>>
>>  - Fedora dropped x86-32 with Fedora 31, almost 5 years ago=2E
>>
>>  - Ubuntu dropped x86-32 after 18 LTS, more than 5 years ago=2E The LTS=
=20
>>    kernel is v5=2E6 based=2E
>>
>>  - Arch Linux dropped i686 support even earlier than that, the=20
>>    spin-off-community project of archlinux32=2Eorg has 486 and 686=20
>>    variants=2E 686 variant includes CMOV=2E
>>
>>  - Gentoo has an 'x86' variant with 486 and 686 stages=2E 686 stage=20
>>    includes CMOV=2E
>>
>> Ie=2E I think we can also make CMOV a hard requirement, and keep suppor=
t=20
>> for all family 5 CPUs that have CMOV and have a chance to boot current=
=20
>> 32-bit distros=2E Even distros that had 486 builds have 686 variants th=
at=20
>> should still work=2E
>>
>> I=2Ee=2E remove support for M586MMX, M586TSC, MCYRIXIII, MGEODEGX1 and =
MK6=20
>> as well, these don't have CMOV support and won't even boot i386 Debian=
=20
>> 12=2E
>>
>> Summary, the plan would be to remove support for the following pre-CMOV=
=20
>> CPUs (the ones not yet in this series are marked 'NEW'):
>>
>>   M486
>>   M486SX
>>   M586
>>   M586MMX         # NEW
>>   M586TSC         # NEW
>>   MCYRIXIII       # NEW
>>   MELAN
>>   MGEODEGX1       # NEW
>>   MK6             # NEW
>>   MWINCHIP3D
>>   MWINCHIPC6
>
>This would also mean dropping support for the pre-2015 Intel Quark
>and DM&P Vortex86DX/DX2/MX/EX that never had a custom CONFIG_Mxxxx
>option but are still relevant to some degree=2E
>I think that would be a mistake=2E=20
>
>> And to keep these:
>>
>>   M686
>>   MATOM
>>   MCRUSOE
>>   MEFFICEON
>>   MGEODE_LX
>>   MK7
>>   MPENTIUM4
>>   MPENTIUMII
>>   MPENTIUMIII
>>   MPENTIUMM
>>   MVIAC3_2
>>   MVIAC7
>
>As Linus said, overall they are barely different from the
>first group, and they are just as obsolete, only Atom and
>Vortex86DX3/EmKore are less than 20 years old=2E
>
>Here are some alternatives I like better than dropping i586:
>
>a) keep my patch with an new bool option to pick between
>   i586 and i686 targets, by any name=2E
>
>b) always build with -march=3Di586 and leave only the -mtune
>   flags; see if anyone cares enough to even benchmark
>   and pick one of the other options if they can show
>   a meaningful regression over -march=3Di686 -mtune=3D
>
>c) keep the outcome of your v1 series, dropping only
>   pre-i586 support, and leave my patch out=2E No change here,
>   so at least no regression potential=2E
>
>d) use -march=3Di686 (plus -mtune=3D) for normal builds, but
>   keep support for the older cores guarded by
>   X86_EXTENDED_PLATFORM or CONFIG_EXPERT, use -march=3Di586
>   if at least one of those platforms is selected=2E
>
>      Arnd

Interesting=2E They really should be using x32 for that application=2E=2E=
=2E
