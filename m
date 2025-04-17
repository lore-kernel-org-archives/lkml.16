Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7E88462
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744915492; cv=none; b=lAZwwfbq/URFq4LksEaMBbhZDQsFzxOYempkBI8n9SxZZ1MJOj0RYyJczXrwgKvGfqckVZvK0ErWthxVABRI4eSSGZFAnPvKrF+/dSqAOFDG+29gTxSwvYfKRdn+E1RqAEFgxugmTV1dN5daWW0dQX44uBaWacKIJbYe2Mowai4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744915492; c=relaxed/simple;
	bh=VNambXyeIHQ+MPofQIKI8LZb9w950n+4SWJrBF6ZD30=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=STM0ujni1ouxjCDYRpe8Fj7W93gW9SAj21NWcGe38+5rDuga0/UCpDEh9swEifNYC7YkipzyJFaT9Gp/5JOvG4MAmuikHZ8kHofqeqm2tlYqIFQRi8ak8qGTOKvLOP6W+/auSy0DFpf60V+eWjira1iU88H06qypxLZCrxJoow0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=SFvT8iyB; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="SFvT8iyB"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53HIi8xU4149562
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 17 Apr 2025 11:44:09 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53HIi8xU4149562
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744915450;
	bh=7OqEEE7EuKkstsubHWZLqMOLXkWpnuVuB/GL6W5HW8o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=SFvT8iyBvbhsuqvLRp2iIcz02vonZGZPdXAiSlgiPxxRgZ64lj8SJ0tr//bvbxY8A
	 1sc+l+eT8bb5olJaiHkfxsxQnstuyOj83XilJIjBGfUQLZ1MZ2b2F7IVPW5iXriIl9
	 I4hcRo84e92ApgSikX4OqkbogVjYYugaO30W7+P8IXepghuhNntaQm6Gd1ak9tH+h4
	 MYjVfavRefqiFmffbPMHaUpTe5X1pBycteBThpwtAfJ7U+Vl57XYX6hoNWMrX00dkT
	 RWabkYLZ9jRRvLCBWJQXeBrsLUbTT3DL1LyShLr4n5X6p+zt2/KYFvwfGsoRj+/8c1
	 QUEwaft4Mjicw==
Date: Thu, 17 Apr 2025 11:44:06 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
CC: LKML <linux-kernel@vger.kernel.org>
Subject: Re: e820: Undefined type not treated as AddressRangeReserved
User-Agent: K-9 Mail for Android
In-Reply-To: <074c2637-1b65-428e-b3e2-24384780e936@molgen.mpg.de>
References: <074c2637-1b65-428e-b3e2-24384780e936@molgen.mpg.de>
Message-ID: <084FA661-17FD-4FC7-B863-92A4FE112201@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 16, 2025 11:49:04 PM PDT, Paul Menzel <pmenzel@molgen=2Empg=2Ede> =
wrote:
>Dear Linux folks,
>
>
>Some firmware, like coreboot with older FILO payload [1] or GRUB as paylo=
ad [2], mark memory regions(?) with type E820 type 13 (Undefined), that is =
reserved for future use=2E Other payloads like SeaBIOS mark it as 2 (Addres=
sRangeReserved)=2E As a result, userspace is not able to access this region=
, which can be worked around by booting with `iomem=3Drelaxed`, or probably=
 with the `memmap` parameter=2E
>
>    $ grep -A1 3ff7b000 /proc/iomem # FILO
>    3ff7b000-3fffffff : Unknown E820 type
>      3ffa1000-3ffa8fff : BOOT0000:00
>
>    $ grep -A1 3ff7b000 /proc/iomem # SeaBIOS, that marks it as reserved
>    3ff7b000-3fffffff : Reserved
>      3ffa1000-3ffa8fff : BOOT0000:00
>
>Table 15-374 *Address Range Types* in the ACPI specification 6=2E3 says:
>
>> Reserved for future use=2E OSPM must treat any range of this type as if
>> the type returned was AddressRangeReserved=2E
>
>Could and should Linux be adapted to follow the specification, and fix so=
me real-world use cases? I looked at `arch/x86/include/asm/e820/types=2Eh` =
and `arch/x86/kernel/e820=2Ec`, but failed to find the place where to imple=
ment this, and how to name the macros for the undefined regions=2E
>
>
>Kind regards,
>
>Paul
>
>
>[1]: https://review=2Ecoreboot=2Eorg/c/filo/+/51120
>[2]: https://ticket=2Ecoreboot=2Eorg/issues/590
>[3]: https://uefi=2Eorg/sites/default/files/resources/ACPI_6_3_final_Jan3=
0=2Epdf
>
>
>diff --git a/arch/x86/include/asm/e820/types=2Eh b/arch/x86/include/asm/e=
820/types=2Eh
>index 80c4a7266629=2E=2E1b341914d438 100644
>--- a/arch/x86/include/asm/e820/types=2Eh
>+++ b/arch/x86/include/asm/e820/types=2Eh
>@@ -14,6 +14,10 @@ enum e820_type {
>        E820_TYPE_NVS           =3D 4,
>        E820_TYPE_UNUSABLE      =3D 5,
>        E820_TYPE_PMEM          =3D 7,
>+       E820_TYPE_UNDEFINED_8   =3D 8, /* reserved for future use */
>+       E820_TYPE_UNDEFINED_9   =3D 9, /* reserved for future use */
>+       E820_TYPE_UNDEFINED_10  =3D 10, /* reserved for future use */
>+       E820_TYPE_UNDEFINED_11  =3D 11, /* reserved for future use */
>
>        /*
>         * This is a non-standardized way to represent ADR or
>@@ -28,6 +32,8 @@ enum e820_type {
>         */
>        E820_TYPE_PRAM          =3D 12,
>
>+       E820_TYPE_UNDEFINED_13  =3D 13, /* reserved for future use */
>+
>        /*
>         * Special-purpose memory is indicated to the system via the
>         * EFI_MEMORY_SP attribute=2E Define an e820 translation of this

Don't create macros; *all* unknown memory types *must* be treated as equiv=
alent to 2=2E
