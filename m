Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5221DD9D3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543329; cv=none; b=Qlix/MpbhSF5Cqn3jTU96NJROwYq7nCqJgT0ivdQyNDn86grdeZVOXN4fW8IudO1tnDAJv1HWrWkw0C7jC/jwgoBB3MaBwDETGb2Ce2LNK9F/yeZqs+vl2t2AX0CISpIhfhydN5HmqG0KZrEDbq5e14brUwgxdPGuJ12QLZ217E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543329; c=relaxed/simple;
	bh=bs8hHYrJ2J5luP5ifRomqnXf1A+DitgxZLsrwXw0I7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q26FqrcjGRZBXQwzK826Bd7gHlC4la7ZfcxFUqTB+SEjn42FBTyqsKkhCUxOvzB3B1Xwja3TGRJM64HhISocbHbgzsAK+qnqjoI38rAiy+1JJX7VMT+T6UjAT8jEzB/jbmxAA5CfuuGPhUryFfxbh+3kYZbwEctjNm2j9lv4CnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1D554426A;
	Tue, 10 Jun 2025 08:15:22 +0000 (UTC)
Message-ID: <2e082beb-63dd-4395-a3ba-1be4acc28910@ghiti.fr>
Date: Tue, 10 Jun 2025 10:15:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: vDSO: Correct inline assembly constraints in
 the getrandom syscall wrapper
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Xi Ruoyao <xry111@xry111.site>
Cc: Vineet Gupta <vineetg@rivosinc.com>, Nathan Chancellor
 <nathan@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250605091112-7cd6b3bd-a466-486a-aebc-7bf0b2a8ac31@linutronix.de>
 <20250606092443.73650-2-xry111@xry111.site>
 <94f9af73-0b2d-484c-ba1d-d4435908336b@rivosinc.com>
 <6163d55a1e7910f89dda114a2ee52c9df5235dad.camel@xry111.site>
 <20250610090648-c6d4e08a-3efa-4c19-9a03-d04a65d18af2@linutronix.de>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250610090648-c6d4e08a-3efa-4c19-9a03-d04a65d18af2@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepgeelgfevteefheeuvdetueefhfeiueetkedvffduudekhfeuvdduhfdujeffkeehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhnuhdrohhrghdpghhithhhuhgsrdgtohhmpdhinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemsgehvdgsmeehlegufhemkeefkegvmeegudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegshedvsgemheelughfmeekfeekvgemgeduledphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemsgehvdgsmeehlegufhemkeefkegvmeegudelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehthhhomhgrshdrfigvihhsshhstghhuhhhsehlihhnuhhtrhhonhhigidru
 ggvpdhrtghpthhtohepgihrhiduudduseigrhihudduuddrshhithgvpdhrtghpthhtohepvhhinhgvvghtghesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeflrghsohhnseiigidvtgegrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepghhuohhrvghnsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr

Hi,

On 6/10/25 09:11, Thomas Weißschuh wrote:
> On Sat, Jun 07, 2025 at 10:16:34PM +0800, Xi Ruoyao wrote:
>> On Fri, 2025-06-06 at 15:01 -0700, Vineet Gupta wrote:
>>> On 6/6/25 02:24, Xi Ruoyao wrote:
>>>> As recently pointed out by Thomas, if a register is forced for two
>>>> different register variables, among them one is used as "+" (both input
>>>> and output) and another is only used as input, Clang would treat the
>>>> conflicting input parameters as undefined behaviour and optimize away
>>>> the argument assignment.
>>>>
>>>> Per an example in the GCC documentation, for this purpose we can use "="
>>>> (only output) for the output, and "0" for the input for that we must
>>>> reuse the same register as the output.  And GCC developers have
>>>> confirmed using a simple "r" (that we use for most vDSO implementations)
>>>> instead of "0" is also fine.
>>>>
>>>> Link: https://lore.kernel.org/all/20250603-loongarch-vdso-syscall-v1-1-6d12d6dfbdd0@linutronix.de/
>>>> Link: https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Local-Register-Variables.html
>>>> Link: https://gcc.gnu.org/pipermail/gcc-help/2025-June/144266.html
>>>> Cc: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>>>> Cc: Nathan Chancellor <nathan@kernel.org>
>>>> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
>>>> ---
>>>>
>>>> v1 -> v2: Keep using "r" for buffer to follow the existing convention
>>>> (that the GCC developers have confirmed fine).
>>>>
>>>>   arch/riscv/include/asm/vdso/getrandom.h | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/riscv/include/asm/vdso/getrandom.h b/arch/riscv/include/asm/vdso/getrandom.h
>>>> index 8dc92441702a..c6d66895c1f5 100644
>>>> --- a/arch/riscv/include/asm/vdso/getrandom.h
>>>> +++ b/arch/riscv/include/asm/vdso/getrandom.h
>>>> @@ -18,7 +18,7 @@ static __always_inline ssize_t getrandom_syscall(void *_buffer, size_t _len, uns
>>>>   	register unsigned int flags asm("a2") = _flags;
>>>>   
>>>>   	asm volatile ("ecall\n"
>>>> -		      : "+r" (ret)
>>>> +		      : "=r" (ret)
>>>>   		      : "r" (nr), "r" (buffer), "r" (len), "r" (flags)
>>>>   		      : "memory");
>>> My 2 cents as I've dabbled into this for ARC glibc syscall macros [1] where r0
>>> is both the first syscall/function arg and also the function/syscall return.
>>>
>>> The v2 approach still keeps 2 different variables in same local reg which has
>>> potential for any future compiler shenanigans.
>>> Segher's example avoided specifying the same reg.
>>> What about something like the following: seems to generate the right code (with
>>> gcc 15)
>>>
>>>         register long ret asm("a0");
>> Then it would be better to rename this variable to just "a0".  And I
>> guess Thomas doesn't want a new convention different from all other
>> syscall wrappers in vDSO...
> Indeed. I want to keep it consistent. Especially for a bugfix.
> Speaking of which, IMO this patch should have a Fixes tag.


Yes, here it is:

Fixes: ee0d03053e70 ("RISC-V: vDSO: Wire up getrandom() vDSO 
implementation")


>
> Then we could start a new discussion about changing it to something else everywhere.
> Although I don't think that the single-variable variant is better.


Vineet feel free to propose something for all architectures if you think 
that's better.

For now, I'll merge this version for inclusion in -rc2,

Thanks,

Alex


>
>>>         register long nr asm("a7") = __NR_getrandom;
>>>         register size_t len asm("a1") = _len;
>>>         register unsigned int flags asm("a2") = _flags;
>>>         ret = (unsigned long) _buffer;
>>>
>>>         asm volatile ("ecall\n"
>>>                       : "+r" (ret)                                 // keep "+r"
>>> for input _buffer / output ret
>>>                       : "r" (nr), "r" (len), "r" (flags)
>>>                       : "memory");
>>>
>>>         return ret;
>>>
>>> Thx,
>>> -Vineet
>>>
>>> [1] https://github.com/bminor/glibc/blob/master/sysdeps/unix/sysv/linux/arc/sysdep.h
>> -- 
>> Xi Ruoyao <xry111@xry111.site>
>> School of Aerospace Science and Technology, Xidian University
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
