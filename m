Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D9F1A5B8C
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 06:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746425390; cv=none; b=T77MPPv/gfHzDmOA+RyAzAT3W5VfklH51cjxsY+v+R330MAeHL3XoobsH/8g1jGrFsiTcmnO94yxFPrTXG0etYuFAdr+9CJGXPi75Hl5eq6RYSvEnKCzpsDpw6Jq7mfZah1cVfj97zDM1PbTcy9vXwWyP459B2VfpxJ15O2xZ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746425390; c=relaxed/simple;
	bh=JQkUm5o6692V087bKe0SRaY0ALZ2tI+JewasvHLCNYc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=oilIEbL90U51CIX47dMfh3yh/QvOy1woLAULBAVXxZcgebPTHmbP+fhmtaW5u/vG29zzz6kvuiN9zmc+mT+2Er5utT2bTZPMJ1axboQgUKuVOIn6JDT9DhuGyKpnWrxVOXpTRv4924HCzdlWbpTjUiQ9b3luPmJNGzdx/Aoa9o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=SQ7kNww7; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="SQ7kNww7"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54569G43119314
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 4 May 2025 23:09:17 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54569G43119314
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1746425359;
	bh=0IaZkUILJGHTgcOhQ3Z0aYItD8c0y9pYjyiKDmh/bsg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=SQ7kNww7Q5DtYd0O2RYOvHsrUERo9Q4bjPJsy6/3knQPS/BhZL57YuXXZAsHjWmkv
	 mWA++SDw7P+YS86+lAG2gVgN6jfPwl+BgEI4PcaRIVixZT/r1gK3ChCsfk37FNxFZI
	 iLj1tc5ATEsRnvS830s2PvKrhLu+y0F061SehUI3ExBLfb5MWWrSYu/p1N4xg0ARnb
	 wRew3kbBAPtNoNVlJtElLHshycPkpZ7PR+rVISfyUyGWXQfkjpCmDQofVWNtXWkRJk
	 qtv2ugJpIDLV2Y75jNLVcfrWXWL+ziUUXQwcgzCi0l5nkQvzlrWYimZvyR4BUBXylF
	 tGZPRknWzTFMw==
Date: Sun, 04 May 2025 23:09:15 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_-tip=5D_x86/asm=3A_Use_=25a_in?=
 =?US-ASCII?Q?stead_of_=25c=28=25=25rip=29_in_rip=5Frel=5Fptr=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMj1kXHLfa2OzT+mo8qFxp5NtLHxaxnO3+skt_we=QOTtPFUqw@mail.gmail.com>
References: <20250504184342.125253-1-ubizjak@gmail.com> <dd4c1795-ee0f-4589-9430-d759e59d5b96@zytor.com> <CAMj1kXHLfa2OzT+mo8qFxp5NtLHxaxnO3+skt_we=QOTtPFUqw@mail.gmail.com>
Message-ID: <79AB4DAE-18EE-4F3C-980F-46304C021EC1@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 4, 2025 10:48:19 PM PDT, Ard Biesheuvel <ardb@kernel=2Eorg> wrote:
>On Mon, 5 May 2025 at 04:59, H=2E Peter Anvin <hpa@zytor=2Ecom> wrote:
>>
>> On 5/4/25 11:43, Uros Bizjak wrote:
>> > The "a" asm operand modifier substitutes a memory reference, with the
>> > actual operand treated as address=2E  For x86_64, when a symbol is
>> > provided, the "a" modifier emits "sym(%rip)" instead of "sym"=2E
>> >
>
>Clang does not
>
>https://godbolt=2Eorg/z/5Y58T45f5
>
>> > No functional changes intended=2E
>> >
>
>NAK=2E There is a functional change with Clang, which does not emit
>%(rip), and this is the whole point of this thing=2E
>
>> > Signed-off-by: Uros Bizjak <ubizjak@gmail=2Ecom>
>> > Cc: Thomas Gleixner <tglx@linutronix=2Ede>
>> > Cc: Ingo Molnar <mingo@kernel=2Eorg>
>> > Cc: Borislav Petkov <bp@alien8=2Ede>
>> > Cc: Dave Hansen <dave=2Ehansen@linux=2Eintel=2Ecom>
>> > Cc: "H=2E Peter Anvin" <hpa@zytor=2Ecom>
>> > Cc: Ard Biesheuvel <ardb@kernel=2Eorg>
>> > ---
>> >   arch/x86/include/asm/asm=2Eh | 2 +-
>> >   1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/arch/x86/include/asm/asm=2Eh b/arch/x86/include/asm/asm=
=2Eh
>> > index f963848024a5=2E=2Ed7610b99b8d8 100644
>> > --- a/arch/x86/include/asm/asm=2Eh
>> > +++ b/arch/x86/include/asm/asm=2Eh
>> > @@ -116,7 +116,7 @@
>> >   #ifndef __ASSEMBLER__
>> >   static __always_inline __pure void *rip_rel_ptr(void *p)
>> >   {
>> > -     asm("leaq %c1(%%rip), %0" : "=3Dr"(p) : "i"(p));
>> > +     asm("leaq %a1, %0" : "=3Dr"(p) : "i"(p));
>> >
>> >       return p;
>> >   }
>>
>> Also, this function really should be __attribute_const__ rather than __=
pure=2E
>>
>
>No it should really not=2E
>
>rip_rel_ptr() will yield different results depending on whether it is
>called [by the same code] from the 1:1 mapping or the ordinary kernel
>virtual mapping of memory, and this is basically the entire reason we
>need it in the first place=2E
>
>Lying to the compiler about this is not a good idea imo=2E

Goddamnit, another clang bug=2E Someone fix the damned thing, please=2E=2E=
=2E
