Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC5D1E47C5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745391451; cv=none; b=qyePLv9fmUnk9hwvrD6AyXkWcakbq6wgfQICR647hBh7srYnVDdVur29Z6mL+L8C1W7sm3LOcqTBL3yPb7QSQsa7r7CyTGCiWhq2iZJCdHRp/PfFzynxa7WfFDzZ9teV+XwSBvZJfIjFSc6DI1Q8Eh+0NvfVXp+VGtlhqm2fDU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745391451; c=relaxed/simple;
	bh=7DLJVm3N0JmP4hmUEkWwaz4ULDAWWUBUnfX/0IKUKN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCrsS9cYJPfQZ/utYctT1iT5cDFfrYkixoQ0xm/GxexBMBCxx7iLGImmnVphCtFCPqDOW+LHkLARKMjlEk0exNCJM7QOt/joEQ7HC64r3lJFyGOi2CnvW0h+wNMQeHrW5NhtVOzYcQT6HoRzgVo2mjIDfpsDj2QZtGDw+iKF89c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7FBC4396E;
	Wed, 23 Apr 2025 06:57:21 +0000 (UTC)
Message-ID: <267bf21f-a42d-4209-8348-e91d45c6e463@ghiti.fr>
Date: Wed, 23 Apr 2025 08:57:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] riscv: Optimize gcd() performance by selecting
 CPU_NO_EFFICIENT_FFS
Content-Language: en-US
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250217013708.1932496-1-visitorckw@gmail.com>
 <61173b04-faea-4dfe-8e82-95a55ee33f3f@ghiti.fr>
 <Z+/km3h1ZmnJjyId@visitorckw-System-Product-Name>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <Z+/km3h1ZmnJjyId@visitorckw-System-Product-Name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeehleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepvdeludfgleffteekgfelheetvdeugffgiedtueetgedtfeefleeileehieekvddunecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemtgeludgrmegtkeehvgemtgduuddtmeekuggvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemtgeludgrmegtkeehvgemtgduuddtmeekuggvvddphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemtgeludgrmegtkeehvgemtgduuddtmeekuggvvdgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepledprhgtphhtthhopehvihhsihhtohhrtghkfiesghhmrghilhdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghom
 hdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepjhhsvghrvhestggtnhhsrdhntghkuhdrvgguuhdrthifpdhrtghpthhtohepvghlvggrnhhorhduheigsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr

Hi Kuan-Wei,

On 04/04/2025 15:54, Kuan-Wei Chiu wrote:
> +Cc Andrew, since this might touch lib/math/gcd.c
>
> On Fri, Mar 28, 2025 at 03:07:36PM +0100, Alexandre Ghiti wrote:
>> Hi Kuan-Wei,
>>
>> First sorry for the late review.
>>
>> On 17/02/2025 02:37, Kuan-Wei Chiu wrote:
>>> When the Zbb extension is not supported, ffs() falls back to a software
>>> implementation instead of leveraging the hardware ctz instruction for
>>> fast computation. In such cases, selecting CPU_NO_EFFICIENT_FFS
>>> optimizes the efficiency of gcd().
>>>
>>> The implementation of gcd() depends on the CPU_NO_EFFICIENT_FFS option.
>>> With hardware support for ffs, the binary GCD algorithm is used.
>>> Without it, the odd-even GCD algorithm is employed for better
>>> performance.
>>>
>>> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
>>> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
>>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>>> ---
>>> Although selecting NO_EFFICIENT_FFS seems reasonable without ctz
>>> instructions, this patch hasn't been tested on real hardware. We'd
>>> greatly appreciate it if someone could help test and provide
>>> performance numbers!
>>>
>>>    arch/riscv/Kconfig | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>> index 7612c52e9b1e..2dd3699ad09b 100644
>>> --- a/arch/riscv/Kconfig
>>> +++ b/arch/riscv/Kconfig
>>> @@ -91,6 +91,7 @@ config RISCV
>>>    	select CLINT_TIMER if RISCV_M_MODE
>>>    	select CLONE_BACKWARDS
>>>    	select COMMON_CLK
>>> +	select CPU_NO_EFFICIENT_FFS if !RISCV_ISA_ZBB
>>>    	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
>>>    	select EDAC_SUPPORT
>>>    	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
>>
>> So your patch is correct. But a kernel built with RISCV_ISA_ZBB does not
>> mean the platform supports zbb and in that case, we'd still use the slow
>> version of gcd().
>>
>> Then I would use static keys instead, can you try to come up with a patch
>> that does that?
>>
> Here's my current thought: I'd like to add a static key named
> efficient_ffs_key in gcd.c, and possibly call
> static_branch_disable(&efficient_ffs_key) somewhere under arch/riscv/
> when RISCV_ISA_ZBB is enabled but the Zbb extension is not detected at
> runtime.
>
> However, I'm new to the RISC-V kernel code and not sure where would be
> the most appropriate place to insert that static_branch_disable() call.
> Suggestions are very welcome!


Sorry for the late answer, I missed your message.

So we put all of those initializations that depend on the discovery of 
extensions at the end of setup_arch() 
(https://elixir.bootlin.com/linux/v6.14.3/source/arch/riscv/kernel/setup.c#L334).

Thanks,

Alex


>
> Below is the diff for context.
>
> Regards,
> Kuan-Wei
>
> diff --git a/lib/math/gcd.c b/lib/math/gcd.c
> index e3b042214d1b..514b8a86b461 100644
> --- a/lib/math/gcd.c
> +++ b/lib/math/gcd.c
> @@ -2,6 +2,7 @@
>   #include <linux/kernel.h>
>   #include <linux/gcd.h>
>   #include <linux/export.h>
> +#include <linux/jump_label.h>
>
>   /*
>    * This implements the binary GCD algorithm. (Often attributed to Stein,
> @@ -11,6 +12,8 @@
>    * has decent hardware division.
>    */
>
> +DEFINE_STATIC_KEY_TRUE(efficient_ffs_key);
> +
>   #if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
>
>   /* If __ffs is available, the even/odd algorithm benchmarks slower. */
> @@ -20,7 +23,7 @@
>    * @a: first value
>    * @b: second value
>    */
> -unsigned long gcd(unsigned long a, unsigned long b)
> +static unsigned long gcd_binary(unsigned long a, unsigned long b)
>   {
>   	unsigned long r = a | b;
>
> @@ -44,7 +47,7 @@ unsigned long gcd(unsigned long a, unsigned long b)
>   	}
>   }
>
> -#else
> +#endif
>
>   /* If normalization is done by loops, the even/odd algorithm is a win. */
>   unsigned long gcd(unsigned long a, unsigned long b)
> @@ -54,6 +57,11 @@ unsigned long gcd(unsigned long a, unsigned long b)
>   	if (!a || !b)
>   		return r;
>
> +#if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
> +	if (static_branch_likely(&efficient_ffs_key))
> +		return binary_gcd(a, b);
> +#endif
> +
>   	/* Isolate lsbit of r */
>   	r &= -r;
>
> @@ -80,6 +88,4 @@ unsigned long gcd(unsigned long a, unsigned long b)
>   	}
>   }
>
> -#endif
> -
>   EXPORT_SYMBOL_GPL(gcd);
