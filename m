Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9E7154457
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 23:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743289859; cv=none; b=qcC7v/OJQn5NwOwzMb59tJrWin6o8R6QnB/qXGcF0jAiC8IqklPOttjpemTDEOYsm2+lqqqTg1ZVBVSgkI1PJeA3iOS+DMM6crVPuc0JirG6pCdnbsyjRJffj19okMkOZTCiRTWkGuUmc+34n42GXMmFw4gqSrX4bN0JmZyXn7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743289859; c=relaxed/simple;
	bh=yNG+tcg3bkGMRmKDyF0ZU3qzdGdoZkmSJHEkGsbqsPk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Jf9Hm+mYDk60AjfKyxTqVmzcNawsrUW81bvjr6OUZ34y8lOiirrCOTuyqAkG1nisPIR6K/PSKdj4sPTLuBOEzYU0dNd9QSvtxHORCigZDtwhdLbeLt6bIj5oCAb5+vLG5Sb7AyUhbwi6P5q9SjgFgW4AgzVfXmdzp1QfApaPPvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=l2xPvVDp; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="l2xPvVDp"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52TNA3Ov2580043
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sat, 29 Mar 2025 16:10:03 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52TNA3Ov2580043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743289804;
	bh=OEfoSCTzEOXBa6AAUflz2XVDqPSOJTr9iSl0+7k2xOM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=l2xPvVDpamu6GlKE1H//5XxjyUiLxm//rSH5It3S446rnBJSyxoMpB2cKg30OYpfR
	 ywaYfqF8XFL5rpyKPT5Evdr/gUiClKPtDiR4Geae6TMY1yDIkejMyyfGWSl90v0WzQ
	 wIP4Osbk9LOa0bX4ZUlYRj/mQXTYYWA6MynCr8Kb94p6BBQXeyb44VzSPNjwhxIcQL
	 vGz7ozRfnxCVXh9f8KtBGNf/t8O0g8AdwhUrSEBB7XKU8fz9F1Ru2tdbU6owxt3PbQ
	 3iCiEyT41lfaZ/RNkzVjHYGXV0HDR/459KnC+0ACuF+IEUF6nea4CgF/YiIJhJ9y5o
	 riKf22wfiUKfA==
Date: Sat, 29 Mar 2025 16:10:01 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Uros Bizjak <ubizjak@gmail.com>, Ingo Molnar <mingo@kernel.org>
CC: x86@kernel.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_-tip_2/2=5D_x86/hweight=3A_Use_POPCN?=
 =?US-ASCII?Q?T_when_available_with_X86=5FNATIVE=5FCPU_option?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFULd4bCnnL-CBFwgAQtN9S+sUE_wikda6E+8k9632J9b62dCg@mail.gmail.com>
References: <20250325164854.199420-1-ubizjak@gmail.com> <20250325164854.199420-2-ubizjak@gmail.com> <Z-Mme_OxuhYfxgzO@gmail.com> <CAFULd4bCnnL-CBFwgAQtN9S+sUE_wikda6E+8k9632J9b62dCg@mail.gmail.com>
Message-ID: <10FC5E45-98DB-4C34-A0FE-16B2BB588F11@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 29, 2025 2:19:37 AM PDT, Uros Bizjak <ubizjak@gmail=2Ecom> wrote:
>On Tue, Mar 25, 2025 at 10:56=E2=80=AFPM Ingo Molnar <mingo@kernel=2Eorg>=
 wrote:
>>
>>
>> * Uros Bizjak <ubizjak@gmail=2Ecom> wrote:
>>
>> > Emit naked POPCNT instruction when available with X86_NATIVE_CPU
>> > option=2E The compiler is not bound by ABI when emitting the instruct=
ion
>> > without the fallback call to __sw_hweight{32,64}() library function
>> > and has much more freedom to allocate input and output operands,
>> > including memory input operand=2E
>> >
>> > The code size of x86_64 defconfig (with X86_NATIVE_CPU option)
>> > shrinks by 599 bytes:
>> >
>> >   add/remove: 0/0 grow/shrink: 45/197 up/down: 843/-1442 (-599)
>> >   Total: Before=3D22710531, After=3D22709932, chg -0=2E00%
>> >
>> > The asm changes from e=2Eg=2E:
>> >
>> >          3bf9c:       48 8b 3d 00 00 00 00    mov    0x0(%rip),%rdi
>> >          3bfa3:       e8 00 00 00 00          call   3bfa8 <=2E=2E=2E=
>
>> >          3bfa8:       90                      nop
>> >          3bfa9:       90                      nop
>> >
>> > with:
>> >
>> >            34b:       31 c0                   xor    %eax,%eax
>> >            34d:       f3 48 0f b8 c7          popcnt %rdi,%rax
>> >
>> > in the =2Ealtinstr_replacement section
>> >
>> > to:
>> >
>> >          3bfdc:       31 c0                   xor    %eax,%eax
>> >          3bfde:       f3 48 0f b8 05 00 00    popcnt 0x0(%rip),%rax
>> >          3bfe5:       00 00
>> >
>> > where there is no need for an entry in the =2Ealtinstr_replacement
>> > section, shrinking all text sections by 9476 bytes:
>> >
>> >           text           data     bss      dec            hex filenam=
e
>> >       27267068        4643047  814852 32724967        1f357e7 vmlinux=
-old=2Eo
>> >       27257592        4643047  814852 32715491        1f332e3 vmlinux=
-new=2Eo
>>
>> > +#ifdef __POPCNT__
>> > +     asm_inline (ASM_FORCE_CLR "popcntl %[val], %[cnt]"
>> > +                 : [cnt] "=3D&r" (res)
>> > +                 : [val] ASM_INPUT_RM (w));
>> > +#else
>> >       asm_inline (ALTERNATIVE(ANNOTATE_IGNORE_ALTERNATIVE
>> >                               "call __sw_hweight32",
>> >                               ASM_CLR "popcntl %[val], %[cnt]",
>> >                               X86_FEATURE_POPCNT)
>> >                        : [cnt] "=3Da" (res), ASM_CALL_CONSTRAINT
>> >                        : [val] REG_IN (w));
>>
>> So a better optimization I think would be to declare and implement
>> __sw_hweight32 with a different, less intrusive function call ABI that
>
>With an external function, the ABI specifies the location of input
>argument and function result=2E Unless we want to declare the whole
>function as asm() inline function (with some 20 instructions), we have
>to specify the location of function arguments and where the function
>result is to be found in the asm() that calls the external function=2E
>Register allocator then uses this information to move arguments to the
>right place before the call=2E
>
>The above approach, when used to emulate an insn,  has a drawback=2E
>When the instruction is available as an alternative, it still has
>fixed input and output registers, forced by the ABI of the function
>call=2E Register allocator has to move registers unnecessarily to
>satisfy the constraints of the function call, not the instruction
>itself=2E
>
>The proposed solution builds on the fact that with -march=3Dnative (and
>also when -mpopcnt is specified on the command line) , the compiler
>signals the availability of certain ISA by defining the corresponding
>definition=2E We can use this definition to relax the constraints to fit
>the instruction, not the ABI of the fallback function call=2E On x86, we
>can also access memory directly, avoiding clobbering a temporary input
>register=2E
>
>Without the fix for (obsolete) false dependency, the change becomes simpl=
y:
>
>#ifdef __POPCNT__
>     asm ("popcntl %[val], %[cnt]"
>                 : [cnt] "=3Dr" (res)
>                 : [val] ASM_INPUT_RM (w));
>#else
>
>and besides the reported savings of 600 bytes in the =2Etext section
>also allows the register allocator to schedule registers (and input
>arguments from memory) more optimally, not counting additional 9k
>saved space in the alternative section=2E
>
>The patch is also an example, how -march=3Dnative enables further
>optimizations involving additional ISAs=2E
>
>Thanks,
>Uros=2E
>

If you have __POPCNT__ defined, could you not simply use __builtin_popcnt(=
)?
