Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578B222578C
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448838; cv=none; b=DZKbK7VekJjZ9+8aM3OGEWSuk4ESCORD8s8jjc8XZRikb4gGhLprqxIHMzpW1EN3EptdqYmGAH9/di+hYpjWGWYxy0laeVnewbGAfqmS/+IuzIALIxqa/dvWvE9K0TkSblMld59jnegqEu3aoYRl23nd0pzSr3m2I020spAUDuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448838; c=relaxed/simple;
	bh=x1tl3ZQPpj091yoRGJprI4x2dL5+lB0dp6VIN5Zm8O4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=cf7eP+hoIIIpCLMGJLZbVVBfE6kI7FjN/h5NYe++B3ZCMRbI/Pc/sTsQGT8hDjSI8DyQkgh7XacNzfRMPFQZ2ZtCK2Mcy8OxLky8wXB4cR7wLKXZ42hrJ5dvt/T5lcOPlR0YRv+IVvcdOamIqsdoXGkW2M/xVbqSqSwY2I/TCVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Dzi1YSIJ; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Dzi1YSIJ"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 545CeBGc271872
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 5 May 2025 05:40:12 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 545CeBGc271872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1746448812;
	bh=p1Ktmz8xT8NrchrPJLDum2KDNImjm8pPFBZXtB9CPQg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Dzi1YSIJc8YeI8Dw7pibgs2kYiLI0fB+j4MvuqwjeU77kosmWJywsc2D6tJ1kiErW
	 TXo/iYMIXc4VbgGVkcU64hQxZN/Uk2WCQTb75x6h0MGpJIn0yIZoJfgZhn208pq0wf
	 sW3FDFtzYz1CG9BjAFiq0axPuem2ATNA41scpLm0fu8tYnJBiiUHbWI2bNpMaUUDOx
	 zRZjqdp8TEOBsn4McjxXV9i3BXSg8qeWxH1v4Gr0u19GdIv6mqhe1fKRhZAWB2ih6T
	 7og0rGlLvO+un3XTZ5JOCb6lUTjTVeeUJlgBU5FdntIf71EyF6GYWSddf2WmUJtXpF
	 9GzozdLRGql/Q==
Date: Mon, 05 May 2025 05:40:10 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_-tip=5D_x86/asm=3A_Use_=25a_in?=
 =?US-ASCII?Q?stead_of_=25c=28=25=25rip=29_in_rip=5Frel=5Fptr=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMj1kXF68cZ1B-hf845x8bkYZJW1kn69QenVoHnrjAeFRrXbsw@mail.gmail.com>
References: <20250504184342.125253-1-ubizjak@gmail.com> <dd4c1795-ee0f-4589-9430-d759e59d5b96@zytor.com> <CAMj1kXHLfa2OzT+mo8qFxp5NtLHxaxnO3+skt_we=QOTtPFUqw@mail.gmail.com> <79AB4DAE-18EE-4F3C-980F-46304C021EC1@zytor.com> <CAMj1kXHG8JPLR5BjhSh+nJLhFoC-cT+-me4nc5kHXSxFUaw1aQ@mail.gmail.com> <D503B59D-AE83-4B2A-BC26-13F01A18C14B@zytor.com> <CAMj1kXF68cZ1B-hf845x8bkYZJW1kn69QenVoHnrjAeFRrXbsw@mail.gmail.com>
Message-ID: <1B5EAB1D-501C-43F0-8491-6E7491C45738@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 5, 2025 5:01:26 AM PDT, Ard Biesheuvel <ardb@kernel=2Eorg> wrote:
>On Mon, 5 May 2025 at 13:50, H=2E Peter Anvin <hpa@zytor=2Ecom> wrote:
>>
>> On May 5, 2025 3:42:46 AM PDT, Ard Biesheuvel <ardb@kernel=2Eorg> wrote=
:
>> >On Mon, 5 May 2025 at 08:09, H=2E Peter Anvin <hpa@zytor=2Ecom> wrote:
>> >>
>> >> On May 4, 2025 10:48:19 PM PDT, Ard Biesheuvel <ardb@kernel=2Eorg> w=
rote:
>> >> >On Mon, 5 May 2025 at 04:59, H=2E Peter Anvin <hpa@zytor=2Ecom> wro=
te:
>> >> >>
>> >> >> On 5/4/25 11:43, Uros Bizjak wrote:
>> >> >> > The "a" asm operand modifier substitutes a memory reference, wi=
th the
>> >> >> > actual operand treated as address=2E  For x86_64, when a symbol=
 is
>> >> >> > provided, the "a" modifier emits "sym(%rip)" instead of "sym"=
=2E
>> >> >> >
>> >> >
>> >> >Clang does not
>> >> >
>> >> >https://godbolt=2Eorg/z/5Y58T45f5
>> >> >
>> >> >> > No functional changes intended=2E
>> >> >> >
>> >> >
>> >> >NAK=2E There is a functional change with Clang, which does not emit
>> >> >%(rip), and this is the whole point of this thing=2E
>> >> >
>> >> >> > Signed-off-by: Uros Bizjak <ubizjak@gmail=2Ecom>
>> >> >> > Cc: Thomas Gleixner <tglx@linutronix=2Ede>
>> >> >> > Cc: Ingo Molnar <mingo@kernel=2Eorg>
>> >> >> > Cc: Borislav Petkov <bp@alien8=2Ede>
>> >> >> > Cc: Dave Hansen <dave=2Ehansen@linux=2Eintel=2Ecom>
>> >> >> > Cc: "H=2E Peter Anvin" <hpa@zytor=2Ecom>
>> >> >> > Cc: Ard Biesheuvel <ardb@kernel=2Eorg>
>> >> >> > ---
>> >> >> >   arch/x86/include/asm/asm=2Eh | 2 +-
>> >> >> >   1 file changed, 1 insertion(+), 1 deletion(-)
>> >> >> >
>> >> >> > diff --git a/arch/x86/include/asm/asm=2Eh b/arch/x86/include/as=
m/asm=2Eh
>> >> >> > index f963848024a5=2E=2Ed7610b99b8d8 100644
>> >> >> > --- a/arch/x86/include/asm/asm=2Eh
>> >> >> > +++ b/arch/x86/include/asm/asm=2Eh
>> >> >> > @@ -116,7 +116,7 @@
>> >> >> >   #ifndef __ASSEMBLER__
>> >> >> >   static __always_inline __pure void *rip_rel_ptr(void *p)
>> >> >> >   {
>> >> >> > -     asm("leaq %c1(%%rip), %0" : "=3Dr"(p) : "i"(p));
>> >> >> > +     asm("leaq %a1, %0" : "=3Dr"(p) : "i"(p));
>> >> >> >
>> >> >> >       return p;
>> >> >> >   }
>> >> >>
>> >> >> Also, this function really should be __attribute_const__ rather t=
han __pure=2E
>> >> >>
>> >> >
>> >> >No it should really not=2E
>> >> >
>> >> >rip_rel_ptr() will yield different results depending on whether it =
is
>> >> >called [by the same code] from the 1:1 mapping or the ordinary kern=
el
>> >> >virtual mapping of memory, and this is basically the entire reason =
we
>> >> >need it in the first place=2E
>> >> >
>> >> >Lying to the compiler about this is not a good idea imo=2E
>> >>
>> >> Goddamnit, another clang bug=2E Someone fix the damned thing, please=
=2E=2E=2E
>> >
>> >How is this a bug? The %a modifier is documented as producing a memory
>> >reference - the fact that GCC on x86_64 always emits a RIP-relative
>> >reference regardless of whether we are generating PIC code or not is
>> >an implementation detail, and not fundamental to yield correct code=2E
>> >
>> >Clang produces something that matches the constraints that we gave it
>> >- we cannot blame the tools for the mess of our own making where we
>> >call C code from alternative mappings of memory, while we lie to the
>> >compiler that the code is position dependent and non-relocatable=2E
>>
>> It is documented to produce an (%rip) reference in the gcc documentatio=
n, and gcc is the reference for inline assembly=2E
>>
>
>Got a link? The one below documents it as a generic modifier, and does
>not mention rIP at all=2E
>
>https://gcc=2Egnu=2Eorg/onlinedocs/gcc/Extended-Asm=2Ehtml#Generic-Operan=
d-Modifiers
>
>> Furthermore, documentation is not reality=2E Code is=2E
>
>Not sure I follow your point here=2E You claim Clang is buggy because
>GCC does not behave according to its own documentation?

Yes=2E Because it isn't the documentation that is authoritative=2E=2E=2E e=
specially not for inline asm (the gcc documentation notably lags behind the=
 code, and it is only recently that it has even begun catching up=2E)

The same is true for nearly all interfaces=2E x86, the Linux ABI, you pick=
 it=2E If the man pages don't match the kernel, that's a bug in the man pag=
es, and if someone tries to build a Linux compatibility layer based on a bu=
ggy man page, that's still wrong=2E=20

Understanding this has been a major friction between the kernel and compil=
er communities for decades, and it seems that when a new compiler group (fi=
rst clang, later rust) gets in contact with the kernel this is a barrier th=
at needs to be re-overcome every time=2E
