Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459E526988A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745847732; cv=none; b=ll+XDgYCRrrnKaAbYmoOPFjG6CmwMLRQb1khOw0BuczBLtCqDU82cSgB4Ru/CJCi4ukyGSJJViHrWQ8VswvzrHfg1gKo0DXaQdpCEfrkeirgf7+kemtlwME2/5DWOSvX/Tby3buJd6NIF05Sy2YBPOTzfylZN9X7XMsvmZ3mDAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745847732; c=relaxed/simple;
	bh=L5imQO0qcFG4QdZ72jpgSy7QTYRj+EgAQUNi2zrRdQo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=kNIHCd2TJ4cwdSMP4vtZ/4YKRiHW6Ttvn5ioi/uScWSrTJSBBDbxmkwzx2Xzc49AAQWzNxGAWURjMh9erAyOoubJ5BjuV83yzOWB1gHKstknokpEA+Rn9EItZueRe7bQOz9LtiE+g+ACo3wftbr7kmApO0kh3BnyKCmSS17tZ7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=d5coOTOb; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="d5coOTOb"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53SDfBUB3511020
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 28 Apr 2025 06:41:12 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53SDfBUB3511020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745847673;
	bh=3fiGytVgsyIVAVWo//vH0oNLU1kTYSiRQ5TfaW8qnQE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=d5coOTOb40CjM5j3IjHJXijGHQ0hfWuJeFrZwI3hcyWuQbSQVQp6mGhhACmu/uRXU
	 lKV3NMeTU/CvOXmxYu+o1kPJ9lt+/eXDXE0O5pntTxNltYkJGcgYRuPeTicyR8y+hE
	 wwbc35YWb4az+82gOXbk+SyxUgH/gJfOJ4flelYDLMyTJ11X+e6T6zI8xyMldqJM0V
	 AV3rS5lFI23vazOqZKGjj9M9lkYUYAhFx/II5GFWBnA+g0RxDgaowN95jjrnva39go
	 mPWCSIlCKCOb3MkX1vYlQD0mzhkQ8aMeJKvG1Owl2cbvpHXfWRttAx0rKwRb/rP/ZN
	 zd8yxPBa8VWmQ==
Date: Mon, 28 Apr 2025 06:41:09 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ingo Molnar <mingo@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Arnd Bergmann <arnd@arndb.de>,
        Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_bitops/32=3A_Convert_variable?=
 =?US-ASCII?Q?=5Fffs=28=29_and_fls=28=29_zero-case_handling_to_C?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aA8q4Ot-1zTzv_Kt@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com> <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com> <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com> <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com> <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <aA8q4Ot-1zTzv_Kt@gmail.com>
Message-ID: <8E8C8B78-2D92-4D34-BA89-909F7F2FEA55@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 28, 2025 12:14:40 AM PDT, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>* Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>> And once we remove 486, I think we can do the optimization below to=20
>> just assume the output doesn't get clobbered by BS*L in the=20
>> zero-case, right?
>>=20
>> In the text size space it's a substantial optimization on x86-32=20
>> defconfig:
>>=20
>>         text	   data	       bss	     dec	    hex	filename
>>   16,577,728    7598826    1744896      25921450        18b87aa vmlinux=
=2Evanilla      # CMOV+BS*L
>>   16,577,908	7598838	   1744896	25921642	18b886a	vmlinux=2Elinus_patch =
 # if()+BS*L
>>   16,573,568	7602922	   1744896	25921386	18b876a	vmlinux=2Enoclobber   =
 # BS*L
>
>And BTW, *that* is a price that all of non-486 x86-32 was paying for=20
>486 support=2E=2E=2E
>
>And, just out of intellectual curiosity, I also tried to measure the=20
>code generation price of the +1 standards-quirk in the fls()/ffs()=20
>interface as well:
>
>         text	   data	       bss	     dec	    hex	filename
>   16,577,728   7598826    1744896      25921450        18b87aa vmlinux=
=2Evanilla      # CMOV+BS*L
>   16,577,908	7598838	   1744896	25921642	18b886a	vmlinux=2Elinus_patch  =
# if()+BS*L
>   16,573,568	7602922	   1744896	25921386	18b876a	vmlinux=2Enoclobber    =
# BS*L
>   =2E=2E=2E=2E=2E=2E=2E=2E=2E=2E
>   16,573,552	7602922	   1744896	25921370	18b875a	vmlinux=2Ebroken       =
# BROKEN: 0 baseline instead of 1
>
>=2E=2E=2E and unless I messed up the patch, it seems to have a surprising=
ly=20
>low impact - maybe because the compiler can amortize its cost by=20
>adjusting all dependent code mostly at build time, so the +1 doesn't=20
>end up being generated most of the time?
>
>Thanks,
>
>	Ingo
>
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D>
>
>This broken patch is broken: it intentionally breaks the ffs()/fls()=20
>interface in an attempt to measure the code generation effects of=20
>interface details=2E
>
>NOT-Signed-off-by: <anyone@anywhere=2Eanytime>
>---
> arch/x86/include/asm/bitops=2Eh | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/arch/x86/include/asm/bitops=2Eh b/arch/x86/include/asm/bitop=
s=2Eh
>index e3e94a806656=2E=2E21707696bafe 100644
>--- a/arch/x86/include/asm/bitops=2Eh
>+++ b/arch/x86/include/asm/bitops=2Eh
>@@ -318,7 +318,7 @@ static __always_inline int variable_ffs(int x)
> 	    : "=3Dr" (r)
> 	    : ASM_INPUT_RM (x), "0" (-1));
>=20
>-	return r + 1;
>+	return r;
> }
>=20
> /**
>@@ -362,7 +362,7 @@ static __always_inline int fls(unsigned int x)
> 	    : "=3Dr" (r)
> 	    : ASM_INPUT_RM (x), "0" (-1));
>=20
>-	return r + 1;
>+	return r;
> }
>=20
> /**

My recollection was that you can't assume that even for 586; that it is on=
ly safe for 686, but it has been a long time=2E=2E=2E
