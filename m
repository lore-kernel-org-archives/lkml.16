Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626971B78F3
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 18:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749407508; cv=none; b=iv832VM9sQKR/rAKhNvqZ8BmlDkYQT+bJf7dYWaXkO/Uv/KD83ImuXyhgrnxpk97dSo79bLTKqnlaTi5okqmkd761ubahNJMVGwIcl8beM/jbP0wwKYHoTLHJH9uAN3rHUeNcaJ3h5CC8BTZpWmJgD3tuO41/D7BwYd90XXMa2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749407508; c=relaxed/simple;
	bh=aHb3PARgaHxpA5oCch068AsnUXmKULnZO9yfvxJ4GrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r2BaJC4FDGC7d0qR9nsOZwvOvoLzZQjmuNSao0D+dCJGuzbv1qr5wNmD48v/8HALQ2Im6CAlTpZ2X0hMI3GceWJRp/6tT4hUnjUK0lpib5M8glG0iRIw1xkGJsueKI+Wuzn21Mm9naXrtAZ57DFvZKOAL8MA1rwpLGTjF7S4jYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0gdva+n5; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0gdva+n5"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3dda399db09so33651865ab.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 11:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749407504; x=1750012304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=24zGtCD8x/AJdGEoAWa7TRqA5YBvsNJyFXsZnM2EaR0=;
        b=0gdva+n5XwYq5CnQH2vz54Ckmoc4lKkhBYQQdEOHWQZ1uGitRmgjaW4d9jcJItulye
         +ZfWVBVFpqvQzQjD8brKQ00Nx6amI/0IHzjXRt1+KIPQr4ngmg+UJ1/70LNvJuXhEFO6
         KRl+w75N6VTtR0+g9Pv6ctD5+lUunwqOE2ScdrL4nTPjgqELRUD8XGI2zhU53hEXHeuE
         2LwnE3js8nQ2FIv7P6Eo+i8KdBnuNpfZgyAp6pEIxBlQD3Ezhyb40xRSvzXl2cHFrGsV
         r8SIzTA8cO3rfHvsp1UZpbsT1rd6c2+vUHMkMyOmNYmHDRBvSeLWXAK43FOsL8cCHkYR
         a5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749407504; x=1750012304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=24zGtCD8x/AJdGEoAWa7TRqA5YBvsNJyFXsZnM2EaR0=;
        b=gfW00tEzofjBL0EFNZBjIu+F5r4USNRQ5WKHXZaLqAHIPH42gmxLXcZz0Axzi9v5cG
         DpDU9dIMlIUlP8x3ZkXf4FCIjwlKTLZ+MnZ4ZESBbbponl5pP5Ri46q1ZS+/JsA7P/Em
         v5x/rrzwnAs1SJ1ITiVZNXJj8tYVdkw9gyEERbsNYooD+135ZZH7sWQKgg/eQguCCdbI
         z+KGwH9e1qVYOsdnmuvyLW2fVKdgH2pBdPIBRAbs+wNZX0bTNLAv3BR78kpOVJX3XH8i
         FWNl3eJ+lONBcTgja07H7S0FgrKVFqcBf7gRNFIKv3tC9XWMMpX7dYj7Xo7g0DD6vxx6
         i1vA==
X-Forwarded-Encrypted: i=1; AJvYcCXfZ7QKHPrPcd9fiddYKcApnYShXRTJzdWjaz2mfiwwpVlex3O7WHjxWOstFFxLcOlaGpH5fURb69bqIZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJSEBjOSRE6UWItlJEKpT30EbYsC4Re7bs4N9x3jq91gXhNm15
	n+IMQuSNgePmw43ANxvuHMltV3Lf+BLtMme5TbAQbDLokn8dfCATiMEzNcIGxTcA2TA=
X-Gm-Gg: ASbGncuucM8HHvou2lxqyuqN9DwHcqB8C9R/k82UGpw9wEcj6/py52ZlK1l9C2w96N7
	i1OAeaeqVUgx27yD9XQS8u7h967mA6eK1LnnNU6ojyseEAwnx/0ELz/EizXYkTRyLKNJQt8dN4D
	eBfd8OPg//uSaYwnbMEY1UO9sQXnuQF3CUd4tYknt8w2wIfuosgmnDh17VRBOMxOTx8zy1gvrl0
	TKEVoekYSLVQBxpQ4mYW54QZJjHpmhtrhGr7wlgOIlPDMWmE5Bif0HjF4VBIiRHXncHbAMutfhm
	l/gXEgUL4N6YS1damTNXXow1iRoZ7gIL6Zn9b+9M9KcwLOYfEjoJd8U0i02VnBnfvpsFYVvfyQf
	1pJh19L8zGfnoZ7M6X+6mIBuQOAyHJeDl00v433igXTm/9A==
X-Google-Smtp-Source: AGHT+IHDrPKM/l4kaKj4vhhXLjeN3UOvK1bTadtmquA7qsnpNcRbC6iJmOeILwKvipIIm0BRRT9VyA==
X-Received: by 2002:a05:6e02:b42:b0:3d9:6485:39f0 with SMTP id e9e14a558f8ab-3ddce494789mr102862195ab.9.1749407504321;
        Sun, 08 Jun 2025 11:31:44 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ddcf1559efsm14793165ab.17.2025.06.08.11.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 11:31:43 -0700 (PDT)
Message-ID: <ef696db8-20ca-4710-b642-8d22263d4ffe@riscstar.com>
Date: Sun, 8 Jun 2025 13:31:42 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
To: Haylen Chu <heylenay@4d2.org>, Yixun Lan <dlan@gentoo.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, inochiama@outlook.com,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guodong Xu <guodong@riscstar.com>
References: <20250607202759.4180579-1-elder@riscstar.com>
 <20250608002453-GYA108101@gentoo>
 <52c27139-20aa-4995-b3b5-290df13f1ec9@riscstar.com>
 <aEUVwvKHCu4hr6xs@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aEUVwvKHCu4hr6xs@ketchup>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/25 11:46 PM, Haylen Chu wrote:
> On Sat, Jun 07, 2025 at 09:46:03PM -0500, Alex Elder wrote:

I respond below.  I'm leaving all the context for now.

>> On 6/7/25 7:24 PM, Yixun Lan wrote:
>>> Hi Alex,
>>>
>>> On 15:27 Sat 07 Jun     , Alex Elder wrote:
>>>> The pll1_d8 clock is enabled by the boot loader, and is ultimately a
>>>> parent for numerous clocks.  Guodong Xu was recently testing DMA,
>>>               ~~~~~~~~~this is still vague, numerous isn't equal to critical
>>
>> I will give you a full explanation of what I observed, below.
>>
>>>> adding a reset property, and discovered that the needed reset was
>>>> not yet ready during initial probe.  It dropped its clock reference,
>>>> which dropped parent references, and along the way it dropped the sole
>>>> reference to pll1_d8 (from its prior clk_get()).  Clock pll1_d8 got
>>>> disabled, which resulted in a non-functioning system.
>>>>
>>> So, I'm trying to understand the problem, and would like to evaluate if
>>> the "critical" flag is necessary..
>>>
>>> It occurs to me, the DMA driver should request and enable clock first,
>>> then request and issue a reset, it probably could be solved by proper
>>
>> No, that is not the issue.  The reset is never deasserted.
>>
>>> order? so what's the real problem here? is DMA or reset? dropped the
>>> clock? or does driver fail to request a reset before clock is ready?
>>
>> The problem is with the pll1_d8 clock.  That clock is enabled
>> successfully.  However the reset isn't ready, so the clock
>> gets disabled, and its parent (and other ancestors) also get
>> disabled while recovering from that.
>>
>> I'll give you a high-level summary, then will lay out a ton of
>> detail.
>>
>> In the DMA driver probe function, several initial things happen
>> and then, a clock is requested (enabled):
>>    <&syscon_apmu CLK_DMA>
>> That succeeds.
>>
>> Next, a reset is requested:
>>    <&syscon_apmu RESET_DMA>
>> But that fails, because the reset driver probe function hasn't
>> been called yet.  The request gets -EPROBE_DEFER as its result,
>> and the DMA driver starts unwinding everything so that it can
>> be probed again later.  Dropping the clock reference results
>> in parent clocks dropping references.  And because pll1_div8
>> initially had a reference count of 0 (despite being on),
>> dropping this single reference means it gets disabled.  Then
>> we're stuck.
>>
>>
>> Here is how the DMA clock is supplied (at boot time):
>>
>> pll1 -> pll1_d8 -> pll1_d8_307p2 -> pmua_aclk -> dma_clk
>>
>> pll1 and pll1_d8 are enabled by the boot loader, but at this
>> time the drivers for various hardware that require them aren't
>> "getting" and enabling them (yet).
>>
>> devm_clk_get_optional_enabled() causes clk_prepare_enable()
>> to be called on the target clock (pll1_d8).  That simply calls
>> clk_prepare() and clk_enable().  Let's focus on the latter.
>>      clk_enable(dma_clk)
>>        clk_core_enable_lock()
>>
>> So now the clock enable lock is held.  The target clock's
>> enable_count for pll1_d8 is 0.
>>
>>    clk_core_enable(dma_clk)
>>      clk_core_enable(parent = pmua_aclk)
>>      ...
>>      enable_count++ (on dma_clk)
>>
>> The parent gets enabled (I'm fairly certain pmua_clk's
>> enable_count is also 0).
>>
>>    clk_core_enable(pmua_aclk)
>>      clk_core_enable(parent = pll1_d8_307p2)
>>      ...
>>      enable_count++ (on pmua_clk)
>>
>> And so on.  When the clk_enable(dma_clk) completes, we have
>> these enable counts:
>>    dma_clk:		1
>>    pmua_clk:		1
>>    pll1_d8_307p2:	1
>>    pll1_d8:		1
>>    pll1:			1? (I don't recall)
>>
>> The -EPROBE_DEFER causes the  devm_clk_get_optional_enabled()
>> for dma_clk to get undone.  That means clk_disable_unprepare()
>> gets called on dma_clk.  Let's just focus on clk_disable().
>>
>>    clk_disable(dma_clk)
>>      clk_core_disable_lock(dma_clk)
>>        (takes clk_enable lock)
>>        clk_core_disable()
>>          --enable_count becomes 0 (on dma_clk)
>>          (disables dma_clk)
>>          clk_core_disable(core->parent = pmua_aclk)
>>
>>    clk_core_disable(pmua_aclk)
>>      --enable_count becomes 0 (on pmua_clk)
>>      (disables pmua_clk)
>>      clk_core_dissable(core->parent = pll1_d8_307p2)
>>
>>    clk_core_disable(pll1_d8_307p2)
>>      --enable_count becomes 0 (on pll1_d8_307p2)
>>      (disables pll1_d8_307p2)
>>      clk_core_dissable(core->parent = pll1_d8)
>>
>>    clk_core_disable(pll1_d8\)
>>      --enable_count becomes 0 (on pll1)
>>      (disables pll1_d8)
>>      BOOM
> 
> Yeah, I got the reason that pll1_d8 is disabled, but I don't still
> understand why it matters: pll1_d8 is a simple factor gate, though being
> parent of various peripheral clocks, it's okay to enable it again later
> if some peripherals decide to use it or one of its child, isn't it?

When it gets disabled, the system becomes non-functional.  What that
means is that everything stops, no more output, and even when I
enabled KDB it did not drop into KDB.  *Something* depends on it,
but there is no driver that properly enables the clock (yet).
This means--for now--it seems to be a critical clock.

> I could come up with several scenarios where disabling the clock really
> causes problems,
> 
> 1. Some essential SoC components are actually supplied by pll1_d8 or one
>     of its children, but isn't described in devicetree or the driver,
>     thus disabling pll1_d8 leads to an SoC hang. We should mark the

This is what I believe is happening.  So my fix marks the one clock
as critical in the driver.  I would not want to mark it critical
in DT.

>     precise clock that being essential as critcal, instead of setting
>     pll1_d8 as critical to work around the problem.

I provided the chain of clocks leading to the dma_clk.  Disabling
the dma_clk did not cause harm; disabling pmua_aclk did not cause
harm; disabling pll1_d8_307p2 did not cause harm.  Only when pll1_d8
was disabled did the machine become unusable.

> 2. There're bugs in our clock driver, thus it fails to bring pll1_d8
>     (or maybe also its children) back to a sound state. If so we should
>     fix the driver.

No, I found that pll1_d8 had an enable count of 1 after dma_clk
was enabled.  And then the set of disables that resulted from the
-EPROBE_DEFER discovered its enable count was zero, and therefore
disabled pll1_d8 (after dma_clk, pmua_aclk, and pll1_d8_307p2 were
disabled).  I do not suspect the clock *driver* is at fault.

> Unless you could confirm pll1_d8 (not its child) really supplies some
> essential SoC components, I don't think simply marking pll1_d8 as
> critical is the correct solution.

I did confirm this.  The child gets disabled before the parent in
clk_core_disable().

> And, I don't even know what "non-functioning system" behaves like. Could
> you please provide more information, like soC behaviours or dmesg when
> disabling pll1_d8 causes problems? Thanks.

Maybe you could, as an experiment, pretend <&syscon_apmu CLK_DMA>
is a clock for something and get it during probe, using
devm_clk_get_optional_enabled().  Then just return -EPROBE_DEFER
after that, and I think you'll reproduce the issue.  In fact,
you might hit the issue more quickly if you used CLK_PLL1_D8.

					-Alex

>> I hope this is clear.
>>
>> 					-Alex
> 
> Regards,
> Haylen Chu
> 
>>
>>>> Mark that clock critical so it doesn't get turned off in this case.
>>>> We might be able to turn this flag off someday, but for now it
>>>> resolves the problem Guodong encountered.
>>>>
>>>> Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
>>>> be supplied for a CCU_FACTOR_GATE clock.
>>>>
>>>> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>> Tested-by: Guodong Xu <guodong@riscstar.com>
>>>> ---
>>>>    drivers/clk/spacemit/ccu-k1.c  |  3 ++-
>>>>    drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
>>>>    2 files changed, 15 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>>>> index cdde37a052353..df65009a07bb1 100644
>>>> --- a/drivers/clk/spacemit/ccu-k1.c
>>>> +++ b/drivers/clk/spacemit/ccu-k1.c
>>>> @@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
>>>>    CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
>>>>    CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
>>>>    CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
>>>> -CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
>>>> +CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
>>>> +		CLK_IS_CRITICAL);
>>>>    CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
>>>>    CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
>>>>    CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
>>>> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
>>>> index 51d19f5d6aacb..668c8139339e1 100644
>>>> --- a/drivers/clk/spacemit/ccu_mix.h
>>>> +++ b/drivers/clk/spacemit/ccu_mix.h
>>>> @@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
>>>>    	}									\
>>>>    }
>>>> +#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>>>> +			       _mul, _flags)					\
>>>> +struct ccu_mix _name = {							\
>>>> +	.gate	= CCU_GATE_INIT(_mask_gate),					\
>>>> +	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
>>>> +	.common = {								\
>>>> +		.reg_ctrl	= _reg_ctrl,					\
>>>> +		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
>>>> +	}									\
>>>> +}
>>>> +
>>>>    #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>>>>    			       _mul)						\
>>>> -static struct ccu_mix _name = {							\
>>>> -	.gate	= CCU_GATE_INIT(_mask_gate),					\
>>>> -	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
>>>> -	.common = {								\
>>>> -		.reg_ctrl	= _reg_ctrl,					\
>>>> -		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
>>>> -	}									\
>>>> -}
>>>> +	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>>>> +			       _mul, 0)
>>>>    #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
>>>>    			    _mask_gate, _flags)					\
>>>> -- 
>>>> 2.45.2
>>>>
>>>
>>

