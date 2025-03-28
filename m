Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61C71CFBC
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743170451; cv=none; b=LJ7NTdreFrrMf3RPkzywRELvZL1tpB+ovnBHGRf2kLK1YcXQf1z2Uhr38ZudMDS5rBVbP3+Rdqz+xLNffbl566HRhR85bKN9n3wCdfySZLhdim6tFOGkIUmH1+yC3HysyjOy2ZaTNYrz2zlQKJPLLtIKmjmBpwkuYehsBa7sz9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743170451; c=relaxed/simple;
	bh=OLIOS2PYEHr/rJqpmUttj5Z88OQCZnEdaYf5aFBGNTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pmx5Hpwf1OwGvRzKXlzHhIMf0TQixFenFriiDcctj+dAaztmV8PqlMzmBqvGx8b9RQHcbCjqeYozmlR8RczQliKcJ0runWqcnPO/2bB2PuhRnVGGEMSZ1dShc8tyi11/0Xb5tNbCWjSyEtvMBvC1wNB+L9PSu3eBbmb0iHk3ob0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=awpxStmi; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="awpxStmi"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85dd470597fso63429939f.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 07:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743170447; x=1743775247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJx1bOmB2nNbcEPdxWIf84i+DZThX0AL/bOjU4MrPs0=;
        b=awpxStmizKgbRdyRV7jsPp98ObGMhDP1cAn0bqalCcW8RmE2uYKqAVOuTQ1+9o//LG
         47Ka1LqEu/zO3NEHqvei4gkYUs6Qxcf2I6vZ/RmOc/kZ+qJpzfmGoEQLjTI+j9kqd3e6
         clDrqfSpH9Hw8cn+B70DA3LHJ8xqvLzWDS2Fv/gYrIGLzxDFifraf2ToVsHAuD8IhqE4
         JyxoXmYzo37wmI6DczZCf4dnwl31JJ+Xb2lcInJcmVaJbC6aO1Wr4N32uoX0cDjn9xcU
         D3s5ypr7zaRkXEpknmu5bIDhnwJZzOlqIVR/cQJhdeZA6flleAX9zmdsOnLCe2snV77o
         b43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743170447; x=1743775247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJx1bOmB2nNbcEPdxWIf84i+DZThX0AL/bOjU4MrPs0=;
        b=PiFJO5SlTXfhBXqkPRUxsPzECk2JnROMv/BZ8wqRh79q0gmKefsENfTyH9D6B01Ilp
         cTxOPzKo4S6sz8qu30EYFcjn2UsFMZcKosaC1IvEC7sjFVxWMGEBmNYZTE9VyxQBrxis
         grGomNQOEVFZz9hvGNWOEi2FUC5EhyEI/ye13VWwi8/OoA2izBjzZuKvBc43Rb7fnOol
         PuCA94CpfWG/WCqkEsarGB/DSSk2FTLcPY9J/rL1jOnz/dSwOXqQtqTTTTa4Z5U3qjfV
         QSELEcHl3+E4ZAl0prYB0FnoZD/DZWmbkC9E9SLhh7AQephDQGF2VK7sgxeqKAL92two
         x7Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWxsbLntS/n2lPW1uQFWADDAcP7elJIPzKBjlSK9uHGp+PtmpYL3bIg1UK6x2e79KXRwlDnw/lDq62hiX8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl/5vy0TTCri78MX3dQALB8aw4N6sPekO/4kbdWsZipRK2AAbf
	DIXAuzeN6N1IjTO3vK/AoYikHWWGw4HrLLD/esNTh5ghZyS2+2bC8fSfnk99rlQ=
X-Gm-Gg: ASbGncvGdqLdiQsNsh4Ty/LX/11CDDp/HwZyX8bucI9LbCG8kkoBLaJZnfWj17h8RGn
	c1FtGQeK4P3sTSxOaVCUwF6d8FFbPos2f60mY6WJKjl4qvLmDPpenSC4EnMzHrY6B/DGM0y7/cM
	u31Vzarp5uCkULCzyWx2Le2fnPt6WI5Ndjz5uOWNom4/ieGemiXck142klRYL61U67E+Rj/WD5E
	F5pin1jkK84Ru1RQafIZ8azkpyrbqi7scHWTUb9+8cc5yik/KmhvCvmVCu6DcNxJ4XcWfaIlNQP
	9XF8MVAhFGClKZ6EvpuCo3ypLp6dCMrYNHtW26zl68XD3/7QRNrm05ywJDB51L8YzjUaD+j0rzz
	SjuKvDUYR
X-Google-Smtp-Source: AGHT+IFQdAqgoKKbmsH57qBJYiu3KoYqm7CampNLz2zNqr5K7E6d3w8hxOdOXDmVU59PbaPDBiANqA==
X-Received: by 2002:a05:6602:6a8a:b0:855:5e3a:e56b with SMTP id ca18e2360f4ac-85e82153abfmr878195739f.12.1743170442631;
        Fri, 28 Mar 2025 07:00:42 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4648715e9sm455980173.96.2025.03.28.07.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 07:00:42 -0700 (PDT)
Message-ID: <188bd370-6e9d-4104-8731-926ce4f3c211@riscstar.com>
Date: Fri, 28 Mar 2025 09:00:40 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] clk: spacemit: Add clock support for Spacemit K1
 SoC
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Guodong Xu <guodong@riscstar.com>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-5-heylenay@4d2.org>
 <d625c473-789c-42f9-918c-8a649d058513@riscstar.com>
 <Z-E-nhNzUx_YFFZZ@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <Z-E-nhNzUx_YFFZZ@ketchup>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/25 6:14 AM, Haylen Chu wrote:
> On Tue, Mar 11, 2025 at 06:19:51PM -0500, Alex Elder wrote:
>> On 3/6/25 11:57 AM, Haylen Chu wrote:
>>> The clock tree of K1 SoC contains three main types of clock hardware
>>> (PLL/DDN/MIX) and has control registers split into several multifunction
>>> devices: APBS (PLLs), MPMU, APBC and APMU.
>>>
>>> All register operations are done through regmap to ensure atomiciy
>>> between concurrent operations of clock driver and reset,
>>> power-domain driver that will be introduced in the future.
>>>
>>> Signed-off-by: Haylen Chu <heylenay@4d2.org>
>>
>> I'm very glad you have the DT issues resolved now.
>>
>> I again have lots of comments on the code, and I think I've
>> identified a few bugs.  Most of my comments, however, are
>> suggesting minor changes for consistency and readability.
>>
>> I'm going to skip over a lot of "ccu-k1.c" because most of what I
>> say applies to the definitions in the header files.

Sorry I didn't respond to this earlier.

>>> ---
>>>    drivers/clk/Kconfig               |    1 +
>>>    drivers/clk/Makefile              |    1 +
>>>    drivers/clk/spacemit/Kconfig      |   20 +
>>>    drivers/clk/spacemit/Makefile     |    5 +
>>>    drivers/clk/spacemit/ccu-k1.c     | 1714 +++++++++++++++++++++++++++++
>>>    drivers/clk/spacemit/ccu_common.h |   47 +
>>>    drivers/clk/spacemit/ccu_ddn.c    |   80 ++
>>>    drivers/clk/spacemit/ccu_ddn.h    |   48 +
>>>    drivers/clk/spacemit/ccu_mix.c    |  284 +++++
>>>    drivers/clk/spacemit/ccu_mix.h    |  246 +++++
>>>    drivers/clk/spacemit/ccu_pll.c    |  146 +++
>>>    drivers/clk/spacemit/ccu_pll.h    |   76 ++
>>>    12 files changed, 2668 insertions(+)
>>>    create mode 100644 drivers/clk/spacemit/Kconfig
>>>    create mode 100644 drivers/clk/spacemit/Makefile
>>>    create mode 100644 drivers/clk/spacemit/ccu-k1.c
>>>    create mode 100644 drivers/clk/spacemit/ccu_common.h
>>>    create mode 100644 drivers/clk/spacemit/ccu_ddn.c
>>>    create mode 100644 drivers/clk/spacemit/ccu_ddn.h
>>>    create mode 100644 drivers/clk/spacemit/ccu_mix.c
>>>    create mode 100644 drivers/clk/spacemit/ccu_mix.h
>>>    create mode 100644 drivers/clk/spacemit/ccu_pll.c
>>>    create mode 100644 drivers/clk/spacemit/ccu_pll.h
>>>
> 
> ...
> 
>>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>>> new file mode 100644
>>> index 000000000000..5974a0a1b5f6
>>> --- /dev/null
>>> +++ b/drivers/clk/spacemit/ccu-k1.c
>>> @@ -0,0 +1,1714 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
>>> + * Copyright (c) 2024 Haylen Chu <heylenay@4d2.org>
>>> + */
>>> +
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/mfd/syscon.h>
>>> +#include <linux/minmax.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +
>>> +#include "ccu_common.h"
>>> +#include "ccu_pll.h"
>>> +#include "ccu_mix.h"
>>> +#include "ccu_ddn.h"
>>> +
>>> +#include <dt-bindings/clock/spacemit,k1-ccu.h>
>>> +
>>> +/*	APBS register offset	*/
>>
>> Use spaces, not tabs above (same as you've done elsewhere).
>>
> 
> Ack. I'll unify all the comments to use TABs as you mentioned below.
> 
>>> +#define APBS_PLL1_SWCR1			0x100
>>> +#define APBS_PLL1_SWCR2			0x104
>>> +#define APBS_PLL1_SWCR3			0x108
>>> +#define APBS_PLL2_SWCR1			0x118
>>> +#define APBS_PLL2_SWCR2			0x11c
>>> +#define APBS_PLL2_SWCR3			0x120
>>> +#define APBS_PLL3_SWCR1			0x124
>>> +#define APBS_PLL3_SWCR2			0x128
>>> +#define APBS_PLL3_SWCR3			0x12c
>>> +
>>> +/* MPMU register offset */
>>> +#define MPMU_POSR			0x10
>>> +#define POSR_PLL1_LOCK			BIT(27)
>>> +#define POSR_PLL2_LOCK			BIT(28)
>>> +#define POSR_PLL3_LOCK			BIT(29)
>>> +
>>> +#define MPMU_WDTPCR			0x200
>>> +#define MPMU_RIPCCR			0x210
>>> +#define MPMU_ACGR			0x1024
>>> +#define MPMU_SUCCR			0x14
>>> +#define MPMU_ISCCR			0x44
>>
>> Somehow the fact that you used just two digits for the above
>> two made me think maybe they were field values rather than
>> offsets.
>>
>> If you used 4 digits for all offsets (with leading 0's) maybe
>> that consistency would reinforce the difference between an
>> offset and other values.
>>
>> Also, please sort the offset definitions in increasing
>> numeric order (within the groups); that too will help
>> readability.
> 
> Thanks, I'll take them.
> 
>>> +#define MPMU_SUCCR_1			0x10b0
>>> +#define MPMU_APBCSCR			0x1050
>>> +
>>> +/* APBC register offset */
>>> +#define APBC_UART1_CLK_RST		0x0
>>> +#define APBC_UART2_CLK_RST		0x4
>>> +#define APBC_GPIO_CLK_RST		0x8
>>
>> . . .
>>
>>> +#define APBC_PWM17_CLK_RST		0xdc
>>> +#define APBC_PWM18_CLK_RST		0xe0
>>> +#define APBC_PWM19_CLK_RST		0xe4
>>> +
>>
>> I realize that these symbols are named based on the
>> underlying hardware register names.  But the above
>> uses "CLK_RST" to indicate a clock/reset control
>> register.  But the definitions below spell "reset"
>> differently:  "CLK_RES".
>> What do you think about using a consistent naming scheme in the code?
> 
> This of course sounds reasonable to me. But I think the following names
> are originated from the datasheet and renaming them may makes it harder
> to search through the datasheet. I'm willing to change them if you think
> it's not a problem.

Sticking to the names found in hardware documentation is
an easy rule to follow.  But sometimes when it's gathered
in code you see where things are inconsistent, which makes
the code less understandable.

The easiest is to just stick with the names you currently
use, which is fine with me.  There should probably be a
compelling reason to use different names, and in this case
the "RST" versus "RES" isn't super important.

Ideally every name you use should match what's in the
hardware documentation.  You could do a quick check for
any such differences.

In short:  what you use is fine; ignore my suggestion.

>>> +/* APMU register offset */
>>> +#define APMU_JPG_CLK_RES_CTRL		0x20
>>> +#define APMU_CSI_CCIC2_CLK_RES_CTRL	0x24
>>> +#define APMU_ISP_CLK_RES_CTRL		0x38
>>> +#define APMU_LCD_CLK_RES_CTRL1		0x44
>>> +#define APMU_LCD_SPI_CLK_RES_CTRL	0x48
>>> +#define APMU_LCD_CLK_RES_CTRL2		0x4c
>>> +#define APMU_CCIC_CLK_RES_CTRL		0x50
>>> +#define APMU_SDH0_CLK_RES_CTRL		0x54
>>> +#define APMU_SDH1_CLK_RES_CTRL		0x58
>>> +#define APMU_USB_CLK_RES_CTRL		0x5c
>>> +#define APMU_QSPI_CLK_RES_CTRL		0x60
>>> +#define APMU_DMA_CLK_RES_CTRL		0x64
>>> +#define APMU_AES_CLK_RES_CTRL		0x68
>>> +#define APMU_VPU_CLK_RES_CTRL		0xa4
>>> +#define APMU_GPU_CLK_RES_CTRL		0xcc
>>> +#define APMU_SDH2_CLK_RES_CTRL		0xe0
>>> +#define APMU_PMUA_MC_CTRL		0xe8
>>> +#define APMU_PMU_CC2_AP			0x100
>>> +#define APMU_PMUA_EM_CLK_RES_CTRL	0x104
>>> +#define APMU_AUDIO_CLK_RES_CTRL		0x14c
>>> +#define APMU_HDMI_CLK_RES_CTRL		0x1b8
>>> +#define APMU_CCI550_CLK_CTRL		0x300
>>> +#define APMU_ACLK_CLK_CTRL		0x388
>>> +#define APMU_CPU_C0_CLK_CTRL		0x38C
>>> +#define APMU_CPU_C1_CLK_CTRL		0x390
>>> +#define APMU_PCIE_CLK_RES_CTRL_0	0x3cc
>>> +#define APMU_PCIE_CLK_RES_CTRL_1	0x3d4
>>> +#define APMU_PCIE_CLK_RES_CTRL_2	0x3dc
>>> +#define APMU_EMAC0_CLK_RES_CTRL		0x3e4
>>> +#define APMU_EMAC1_CLK_RES_CTRL		0x3ec
>>> +
>>> +/*	APBS clocks start	*/
>>> +
>>> +/* Frequency of pll{1,2} should not be updated at runtime */
>>
>> Given the clock tables below only define a single entry,
>> I don't believe it's even possible to update pll{1,2} at
>> runtime.  Maybe the above comment could go away.  If
>> you keep it, I'd say "must not" rather than "should not."
> 
> Okay, I'll improve the comment, which explains why only one entry
> exists.
> 
>>> +static const struct ccu_pll_rate_tbl pll1_rate_tbl[] = {
>>> +	CCU_PLL_RATE(2457600000UL, 0x0050dd64, 0x330ccccd),
>>> +};
>>> +
>>> +static const struct ccu_pll_rate_tbl pll2_rate_tbl[] = {
>>> +	CCU_PLL_RATE(3000000000UL, 0x0050dd66, 0x3fe00000),
>>> +};
>>> +
>>> +static const struct ccu_pll_rate_tbl pll3_rate_tbl[] = {
>>> +	CCU_PLL_RATE(2457600000UL, 0x0050dd64, 0x330ccccd),
>>> +	CCU_PLL_RATE(3000000000UL, 0x0050dd66, 0x3fe00000),
>>> +	CCU_PLL_RATE(3200000000UL, 0x0050dd67, 0x43eaaaab),
>>> +};
>>> +
>>
>> I'm going to restate this later.  But I think you can include
>> "static" in the definition of your CCU_*_DEFINE() macros,
>> because all defined clocks will be static.  I believe they
>> can also get the const qualifier here.
> 
> I'm not sure about the const qualifier, but it's definitely okay to move
> static into the macros. I'll improve it in next version.

Unfortunately I think you're right.  You are including the clk_hw
structure in your initializations, and that can't be const.  You
could change this, but I won't suggest doing that now.  A lot
depends on this code being accepted, and I'd like not to delay
that.

> 
>>> +static CCU_PLL_DEFINE(pll1, pll1_rate_tbl,
>>> +		      APBS_PLL1_SWCR1, APBS_PLL1_SWCR3,
>>> +		      MPMU_POSR, POSR_PLL1_LOCK, CLK_SET_RATE_GATE);
>>> +static CCU_PLL_DEFINE(pll2, pll2_rate_tbl,
>>> +		      APBS_PLL2_SWCR1, APBS_PLL2_SWCR3,
>>> +		      MPMU_POSR, POSR_PLL2_LOCK, CLK_SET_RATE_GATE);
>>> +static CCU_PLL_DEFINE(pll3, pll3_rate_tbl,
>>> +		      APBS_PLL3_SWCR1, APBS_PLL2_SWCR3,
>>> +		      MPMU_POSR, POSR_PLL3_LOCK, CLK_SET_RATE_GATE);
>>> +
>>> +static CCU_GATE_FACTOR_DEFINE(pll1_d2, CCU_PARENT_HW(pll1),
>>> +			      APBS_PLL1_SWCR2,
>>> +			      BIT(1), 2, 1, 0);
>>
>> You seem to try to use multiple lines for these definitions
>> to possibly aid readability.  I think that's a good idea in
>> general.  But it isn't really consistent (I'll point out
>> a few examples below), and so it doesn't always work.  For
>> many (maybe all), the first line is consistent, but the rest
>> seem to vary a bit.
>>
>> These definitions are basically hardware definitions.  So
>> assuming you get them all correct initially, they'll never
>> change (for a given platform, like K1), and readability is
>> less of an issue.
>>
>> This time around I haven't scrutinized these in that much
>> detail.  But I think--once you're confident the definitions
>> are correct--you can simply format all of these clock
>> definitions to fit within 80 columns, and save a bunch of
>> lines in the source file.
> 
> Yes, sounds reasonable to me. I will do the reformatting if there's no
> objection against it.
> 
>>> +static CCU_GATE_FACTOR_DEFINE(pll1_d3, CCU_PARENT_HW(pll1),
>>> +			      APBS_PLL1_SWCR2,
>>> +			      BIT(2), 3, 1, 0);
>>
>> . . .
>>
>>> +static CCU_GATE_FACTOR_DEFINE(pll3_d8, CCU_PARENT_HW(pll3),
>>> +			      APBS_PLL3_SWCR2,
>>> +			      BIT(7), 8, 1, 0);
>>> +
>>
>> Here (below) you define these PLL "factor" clocks all on one line.
>>
>>> +static CCU_FACTOR_DEFINE(pll3_20, CCU_PARENT_HW(pll3_d8), 20, 1);
>>> +static CCU_FACTOR_DEFINE(pll3_40, CCU_PARENT_HW(pll3_d8), 10, 1);
>>> +static CCU_FACTOR_DEFINE(pll3_80, CCU_PARENT_HW(pll3_d8), 5, 1);
>>> +
>>> +/*	APBS clocks end		*/
>>
>> Use spaces rather than tabs, above and below (and throughout).
>> Or...  Use tabs consistently.  Pick one.
>>
>>> +
>>> +/*	MPMU clocks start	*/
>>> +static CCU_GATE_DEFINE(pll1_d8_307p2, CCU_PARENT_HW(pll1_d8),
>>> +		       MPMU_ACGR,
>>> +		       BIT(13), 0);
>>
>> But here you define the "factor" clock on two lines.  I'm sure
>> this is for line length.  I'd say just define them all according
>> to line length--make them fit within 80 columns, but otherwise
>> don't bother with extra lines for readability.
>>
>>> +static CCU_FACTOR_DEFINE(pll1_d32_76p8, CCU_PARENT_HW(pll1_d8_307p2),
>>> +			 4, 1);
>>
>> . . .
>>
>>> +
>>> +static const struct clk_parent_data apb_parents[] = {
>>> +	CCU_PARENT_HW(pll1_d96_25p6),
>>> +	CCU_PARENT_HW(pll1_d48_51p2),
>>> +	CCU_PARENT_HW(pll1_d96_25p6),
>>> +	CCU_PARENT_HW(pll1_d24_102p4),
>>> +};
>>
>> I think you should have a blank line after this definition (and
>> all other similar ones in this file).  In some cases you have
>> no blank line above this sort of definition, and you should.
> 
> These definitions are grouped by types and parents/children: similar
> clocks of the same type, like PWM ones, are kept together; possible
> parents and their children are kept together, too. IMHO it's more
> readable when looking through the clocks, but checkpatch.pl issues some
> suggestions about it as well. Anyway, I'm willing to make the changes.

Go ahead and leave out the blank lines I suggested.  It's
a simple coding style preference, and your grouping makes
sense.

> 
>>> +static CCU_MUX_DEFINE(apb_clk, apb_parents,
>>> +		      MPMU_APBCSCR,
>>> +		      0, 2,
>>> +		      0);
>>> +
>>> +static CCU_GATE_DEFINE(wdt_bus_clk, CCU_PARENT_HW(apb_clk),
>>> +		       MPMU_WDTPCR,
>>> +		       BIT(0),
>>> +		       0);
>>> +
>>> +static CCU_GATE_DEFINE(ripc_clk, CCU_PARENT_HW(apb_clk),
>>> +		       MPMU_RIPCCR,
>>> +		       0x1,
>>> +		       0);
>>> +/*	MPMU clocks end		*/
>>> +
>>> +/*	APBC clocks start	*/
>>> +static const struct clk_parent_data uart_clk_parents[] = {
>>> +	CCU_PARENT_HW(pll1_m3d128_57p6),
>>> +	CCU_PARENT_HW(slow_uart1_14p74),
>>> +	CCU_PARENT_HW(slow_uart2_48),
>>> +};
>>
>> Here you're putting the control register and flags field on
>> separate lines.  I'd say just join them.
> 
> I'll reformat all clocks, only following the 80-columns rule, so similar
> separation shouldn't be in next version.
> 
>>> +static CCU_MUX_GATE_DEFINE(uart0_clk, uart_clk_parents,
>>> +			   APBC_UART1_CLK_RST,
>>> +			   4, 3, BIT(1),
>>> +			   CLK_IS_CRITICAL);
>>
>> . . .
>>
>>> +struct spacemit_ccu_clk {
>>> +	int id;
>>> +	struct clk_hw *hw;
>>> +};
>>> +
>>
>> The following array defines the clocks under what is matched
>> as "spacemit,k1-pll".  I know it's the "apbs" (APB Spare)
>> memory region, but I think it would be better to have the
>> name here match the compatible string.  Add a comment if
>> you want to make sure people understand the "PLL<->APBS"
>> relationship.
> 
> Thanks, will take it.
> 
>>> +static struct spacemit_ccu_clk k1_ccu_apbs_clks[] = {
>>> +	{ CLK_PLL1,		&pll1.common.hw },
>>> +	{ CLK_PLL2,		&pll2.common.hw },
>>> +	{ CLK_PLL3,		&pll3.common.hw },
>>
>> . . .
>>
>>> +static int spacemit_ccu_register(struct device *dev,
>>> +				 struct regmap *regmap, struct regmap *lock_regmap,
>>> +				 const struct spacemit_ccu_clk *clks)
>>> +{
>>> +	const struct spacemit_ccu_clk *clk;
>>> +	int i, ret, max_id = 0;
>>> +
>>> +	for (clk = clks; clk->hw; clk++)
>>> +		max_id = max(max_id, clk->id);
>>> +
>>> +	struct clk_hw_onecell_data *clk_data;
>>
>> The definition of clk_data belongs at the top of the function.
> 
> Oops, I miss it. Will fix the style.
> 
>>> +
>>> +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, max_id + 1), GFP_KERNEL);
>>> +	if (!clk_data)
>>> +		return -ENOMEM;
>>> +
>>> +	for (i = 0; i <= max_id; i++)
>>> +		clk_data->hws[i] = ERR_PTR(-ENOENT);
>>> +
>>> +	for (clk = clks; clk->hw; clk++) {
>>> +		struct ccu_common *common = hw_to_ccu_common(clk->hw);
>>> +		const char *name = clk->hw->init->name;
>>> +
>>> +		common->regmap		= regmap;
>>> +		common->lock_regmap	= lock_regmap;
>>> +
>>> +		ret = devm_clk_hw_register(dev, clk->hw);
>>> +		if (ret) {
>>> +			dev_err(dev, "Cannot register clock %d - %s\n",
>>> +				i, name);
>>> +			return ret;
>>> +		}
>>> +
>>> +		clk_data->hws[clk->id] = clk->hw;
>>> +	}
>>> +
>>> +	clk_data->num = max_id + 1;
>>> +
>>> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>>> +}
>>> +
>>> +static int k1_ccu_probe(struct platform_device *pdev)
>>> +{
>>> +	struct regmap *base_regmap, *lock_regmap = NULL;
>>> +	struct device *dev = &pdev->dev;
>>> +	int ret;
>>> +
>>> +	base_regmap = device_node_to_regmap(dev->of_node);
>>> +	if (IS_ERR(base_regmap))
>>> +		return dev_err_probe(dev, PTR_ERR(base_regmap),
>>> +				     "failed to get regmap\n");
>>> +
>>
>> You should add a comment here explaining why there is a special
>> additional regmap for the PLL clock type (because it requires a
>> lock that's found in that that device node's memory region).
> 
> I guess there's already some explanation in the dt-bindings, but I'm
> willing to add some more :)

Yes, you should explain it in the code.  It doesn't have to be
a complete explanation, but people reading the code aren't
always going to be looking at the bindings.  It's nice to know
why this is different from the others.

> 
> ...
> 
>>> diff --git a/drivers/clk/spacemit/ccu_common.h b/drivers/clk/spacemit/ccu_common.h
>>> new file mode 100644
>>> index 000000000000..494cde96fe3c
>>> --- /dev/null
>>> +++ b/drivers/clk/spacemit/ccu_common.h
>>> @@ -0,0 +1,47 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
>>> + * Copyright (c) 2024 Haylen Chu <heylenay@4d2.org>
>>> + */
>>> +
>>> +#ifndef _CCU_COMMON_H_
>>> +#define _CCU_COMMON_H_
>>> +
>>> +#include <linux/regmap.h>
>>> +
>>
>> I'm not going to suggest it at this point, but it might
>> have worked out more nicely if you defined a top-level CCU
>> structure that contained a union of structs, one for each
>> type of clock (PLL, DDN, mix).
>>
>>> +struct ccu_common {
>>> +	struct regmap *regmap;
>>> +	struct regmap *lock_regmap;
>>
>> The lock_regmap is only used for PLL type clocks, right?
>> So it could be included in the PLL struct within the union
>> below?
> 
> This makes sense to me.

It might make sense but in part my suggestion makes more
sense when taken with the comment I had above (about having
a CCU structure with a union rather than separate per-type
structures).  I think that would be better, but again I
don't want you to have to do all that work if it means
delaying getting your code accepted.

So move it to the union if that works, but for now it's
fine the way it is.

>>> +
>>> +	union {
>>> +		/* For DDN and MIX */
>>> +		struct {
>>> +			u32 reg_ctrl;
>>> +			u32 reg_fc;
>>> +			u32 fc;
>>
>> The fc field is a bit mask, and with a single bit set.
>>
>> Other fields you define use the convention "mask" in the name
>> to indicate it is a bit mask.  So I suggest you name "fc" to
>> be "mask_fc" or "fc_mask" (but in the latter case, I'd rename
>> the registers to be "fc_reg" and "ctrl_reg"--you decide).
> 
> I prefer the former.

Your choice.  My main point was about including "mask" in
the name.

> 
>> Since fc is a (nonzero) mask, you could use a zero fc value
>> to indicate that reg_fc is the same as reg_ctrl.
> 
> I'm not sure about what you mean and what the change could improve: even
> in case that reg_fc is the same as reg_ctrl, we still require a field to
> store the mask for FC bit.
> 
> Knowing reg_ctrl is just reg_fc doesn't help much: we could directly
> assign reg_ctrl to reg_fc in our macros and avoid extra logic in
> ccu_mix.c.

Yes, what you have is fine.

> 
>>> +		};
>>> +
>>> +		/* For PLL */
>>> +		struct {
>>> +			u32 reg_swcr1;
>>> +			u32 reg_swcr2;
>>
>> The reg_swcr2 is no longer used (now that you've dropped it
>> from the ccu_pll_rate_tbl structure).
> 
> Will drop it. I think it was missed during cleanup.
> 
>>> +			u32 reg_swcr3;
>>
>> You define PLL_SWCR3_EN in "ccu_pll.c" to have value BIT(31).
>> that's good.  But you should define its inverse, to define
>> which bits in the reg_swcr3 field are the valid "magic" part.
>> In both cases, I would define them here in this file, where
>> the structure type is defined (not in "ccu_pll.c").
>> #define SPACEMIT_PLL_SWCR3_EN	(u32)BIT(31)
>> #define SPACEMIT_PLL_SWCR3_MASK	~(SPACEMIT_PLL_SWCR3_EN)
>>
>>> +		};
>>> +	};
>>> +
>>> +	struct clk_hw hw;
>>> +};
>>> +
>>> +static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
>>> +{
>>> +	return container_of(hw, struct ccu_common, hw);
>>> +}
>>> +
>>
>> This isn't a huge deal, but I think since your functions here
>> are named ccu_*(), the first argument should be the CCU (or
>> ccu_common) structure.
>>
>>> +#define ccu_read(reg, c, val)	regmap_read((c)->regmap, (c)->reg_##reg, val)
>>
>> I commented before that you're not checking return values for
>> regmap_read() and regmap_write().  You said you don't expect
>> MMIO accesses to ever fail.
>>
>> If we assume that, I'd like to see ccu_read() defined differently,
>> so that it returns a value (rather than taking the assigned-to
>> address as an argument).  To me, it makes it much easier to
>> understand in places it's used, making it more obvious an
>> assignment is getting made.
> 
> Thanks for the suggesion,
> 
>> static inline u32 _ccu_read(struct ccu_common *common, u32 offset)
>> {
>> 	u32 val;
>>
>> 	(void)regmap_read(common->regmap, offset>reg_##reg, &val);
>>
>> 	return val;
>> }
>> #define ccu_read(reg, c)	_ccu_read((c), (c)->reg_##reg)
>>
>> 	val = ccu_read(ctrl, &ddn->common);
>>
> 
> And we may avoid the extra inline function with GNU compound statement,
> just like how read_poll_timeout_atomic() is defined.

Honestly, I'd really just rather see you calling regmap_read()
in your code.  And... check its return value.

But you do what you like.

> 
>>> +#define ccu_update(reg, c, mask, val) \
>>> +	regmap_update_bits((c)->regmap, (c)->reg_##reg, mask, val)7
>>> +#define ccu_poll(reg, c, tmp, cond, sleep, timeout) \
>>> +	regmap_read_poll_timeout_atomic((c)->regmap, (c)->reg_##reg,	\
>>> +					tmp, cond, sleep, timeout)
>>> +
>>> +#endif /* _CCU_COMMON_H_ */
>>> diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
>>> new file mode 100644
>>> index 000000000000..ee187687d0c4
>>> --- /dev/null
>>> +++ b/drivers/clk/spacemit/ccu_ddn.c
>>> @@ -0,0 +1,80 @@
> 
> ...
> 
>>> +static unsigned long clk_ddn_calc_best_rate(struct ccu_ddn *ddn,
>>> +					    unsigned long rate, unsigned long prate,
>>> +					    unsigned long *num, unsigned long *den)
>>> +{
>>> +	rational_best_approximation(rate, prate / 2,
>>> +				    ddn->den_mask, ddn->num_mask,
>>> +				    den, num);
>>
>> Using rational_best_approximation() is excellent.  However I
>> think you have a bug, and I don't think the exact way you're
>> using it is clear (and might be wrong).
>>
>> The bug is that the third and fourth arguments are the maximum
>> numerator and denominator, respectively.  You are passing mask
>> values, which in some sense represent the maximums.  However,
>> your masks are not always in the low-order bits.  Here is one
>> example:
>>
>> static CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6,
>>                        MPMU_SUCCR,
>>                        GENMASK(28, 16), 16, GENMASK(12, 0), 0,
>>                        0);
>>
>> The "_num_mask" argument to this macro is 0x1fff0000, and the
>> "_den_mask" is 0x00000fff.  The latter value (which gets passed
>> as the max_numerator argument to rational_best_approximation())
>> is fine, but the former is not.  So you need to shift both masks
>> right by their corresponding shift value.
> 
> Thanks for finding it! I forget to change the function when redefining
> struct ccu_ddn.
> 
>> Beyond that bug, rational_best_approximation() wants its first
>> two arguments to define the desired rate (as a fraction).
> 
> I don't think it's the way that rational_best_approximation() works.
> The first two arguments define the desired fraction, not the rate.
> 
>> So the desired rate should be the actual desired rate divided by 1
>> (rather than being divided by the half the parent rate).  So
>> this too might be a bug.

OK I took another look at this.  And I looked at the first commit
that used this function to understand how to use it:
   534fca068ec80 imx: serial: use rational library function

You want to know what are the best available numerator and
denominator values to use (which fit into your register fields).
These should be as close as possible to the fraction you're after.

     Fout = Fin * num / denom

Fin is the parent rate (always divided by two in this case),
or "prate / 2".  Fout is the desired rate, or "rate".  You might
get a better result if you express the "/ 2" in the parent rate
as "* 2" in the desired rate.

     num_max = ddn->num_mask >> __ffs(ddn->num_mask);
     den_max = ddn->den_mask >> __ffs(ddn->den_mask);
     rational_best_approximation(rate * 2, prate,
				num_max, den_max, &num, &den)

In other words, your original code was more or less right,
with the numerator and denominator reversed.

> 
>  From the comment in its implementation,
> 
>    * calculate best rational approximation for a given fraction
>    * taking into account restricted register size
> 
> And we have
> 
>              numerator       Fin
>        2 * ------------- = -------
>             denominator      Fout
> 
> divide two on both sides,
> 
>              numerator       Fin / 2
>            ------------- = -----------
>             denominator       Fout
> 
> So we could take rational_best_approximation() to calculate the best
> approximated num and den, where give_numerator = Fin / 2 = prate / 2,
> given_denominator = Fout = rate, best_numerator = numerator = &num and
> best_denominator = denominator = &den. My code swaps den and num when
> passing them to rational_best_approximation(), but this doesn't affect
> the result and I'll fix it in next version.

OK, maybe this was why I was confused?  Probably not.

>> Maybe I'm misinterpreting this, but the bottom line is I'm
>> pretty certain this is not producing the correct numerator
>> and denominator that would produce the closest rate supported
>> by the hardware.

Looks like I was wrong.

>>> +	return prate / 2 * *den / *num;
>>
>> The above matches your explanation of how the output rate
>> is computed based on the "denominator" and "numerator".
>> You could encapsulate simply that in a function, given
>> tnat you used it here and another time below.
>>
>> You might get slightly better precision by deferring the
>> divide-by-2.
> 
> Thanks, will take them.
> 
> ...
> 
>>> diff --git a/drivers/clk/spacemit/ccu_ddn.h b/drivers/clk/spacemit/ccu_ddn.h
>>> new file mode 100644
>>> index 000000000000..3746d084e1e7
>>> --- /dev/null
>>> +++ b/drivers/clk/spacemit/ccu_ddn.h
>>> @@ -0,0 +1,48 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
>>> + * Copyright (c) 2024 Haylen Chu <heylenay@4d2.org>
>>> + */
>>> +
>>> +#ifndef _CCU_DDN_H_
>>> +#define _CCU_DDN_H_
>>> +
>>> +#include <linux/clk-provider.h>
>>> +
>>> +#include "ccu_common.h"
>>> +
>>> +struct ccu_ddn {
>>> +	struct ccu_common common;
>>> +	unsigned int num_mask;
>>> +	unsigned int num_shift;
>>> +	unsigned int den_mask;
>>> +	unsigned int den_shift;
>>> +};
>>> +
>>> +#define CCU_DDN_INIT(_name, _parent, _flags) \
>>> +	CLK_HW_INIT_HW(#_name, &_parent.common.hw, &spacemit_ccu_ddn_ops, _flags)
>>> +
>>
>> In CCU_DDN_DEFINE(), both the numerator and denominator masks
>> consist of a contiguous block of 1 bits, with zero or more 0
>> bits to their left and right.  They are always constant (both
>> times it's used...).
>>
>> For that reason, I'd like you to drop the _num_shift and _den_shift
>> arguments from this macro.  Instead, use __ffs(_num_mask) and
>> __ffs(_den_mask) when assigning the num_shift and den_shift field
>> values.
> 
> Thanks, it's reasonable to me.
> 
> ...
> 
>>> diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
>>> new file mode 100644
>>> index 000000000000..a5c13000e062
>>> --- /dev/null
>>> +++ b/drivers/clk/spacemit/ccu_mix.c
>>> @@ -0,0 +1,284 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Spacemit clock type mix(div/mux/gate/factor)
>>> + *
>>> + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
>>> + * Copyright (c) 2024 Haylen Chu <heylenay@4d2.org>
>>> + */
>>> +
>>> +#include <linux/clk-provider.h>
>>> +
>>> +#include "ccu_mix.h"
>>> +
>>
>> I think the name of this constant should include "FC", and a
>> comment should indicate it is a number of microseconds. "FC"
>> stands for "frequency change"; I think you should have a comment
>> explaining exactly what that means (somewhere).
> 
> This macro was also used for a polling after gate is enabled, but I've
> confirmed with the vendor that it's unnecessary. Seems I forgot to
> rename it.
> 
> I prefer to give it a self-explained name, like MIX_FC_TIMEOUT_US, and
> explain the FC stuff above ccu_mix_trigger_fc() in comments.

Sounds good.

> 
>>> +#define MIX_TIMEOUT	10000
>>> +
>>> +static void ccu_gate_disable(struct clk_hw *hw)
>>> +{
>>> +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
>>> +	struct ccu_common *common = &mix->common;
>>> +
>>> +	ccu_update(ctrl, common, mix->gate.mask, 0);
>>> +}
>>
>> Maybe drop the second local variable and do:
>>
>> 	ccu_update(ctrl, &mix->common, mix->gate.mask, 0);
>>
>> And this can be done several times below.
> 
> Makes sense to me.
> 
>>> +
>>> +static int ccu_gate_enable(struct clk_hw *hw)
>>> +{
>>> +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
>>> +	struct ccu_common *common = &mix->common;
>>> +	struct ccu_gate_config *gate = &mix->gate;
>>> +
>>> +	ccu_update(ctrl, common, gate->mask, gate->mask);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int ccu_gate_is_enabled(struct clk_hw *hw)
>>> +{
>>> +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
>>> +	struct ccu_common *common = &mix->common;
>>> +	u32 tmp;
>>> +
>>> +	ccu_read(ctrl, common, &tmp);
>>> +
>>
>> The next line won't necessarily work.  The gate mask
>> value in a few cases contains more than one set bit
>> (rtc_clk is an exmaple).  Therefore this will return
>> true even if just one of those bits is set.  This is
>> most likely a bug.
>>
>> This needs to be:
>>
>> 	return (tmp & mix->gete.mask) == mix->gate.mask;
> 
> Oops, thanks, I didn't expect the case.
> 
>>> +	return !!(tmp & mix->gate.mask);
>>> +}
>>> +
> 
> ...
> 
>>> +static unsigned long
>>> +ccu_mix_calc_best_rate(struct clk_hw *hw, unsigned long rate,
>>> +		       struct clk_hw **best_parent,
>>> +		       unsigned long *best_parent_rate,
>>> +		       u32 *div_val)
>>> +{
>>> +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
>>> +	unsigned int parent_num = clk_hw_get_num_parents(hw);
>>> +	struct ccu_div_config *div = &mix->div;
>>> +	u32 div_max = 1 << div->width;
>>> +	unsigned long best_rate = 0;
>>> +
>>> +	for (int i = 0; i < parent_num; i++) {
>>> +		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
>>> +		unsigned long parent_rate;
>>> +
>>> +		if (!parent)
>>> +			continue;
>>> +
>>> +		parent_rate = clk_hw_get_rate(parent);
>>> +
>>> +		for (int j = 1; j <= div_max; j++) {
>>> +			unsigned long tmp = DIV_ROUND_UP_ULL(parent_rate, j);
>>
>> I might have asked this before.  Why round up?  Why not
>> round closest?
>>
> 
> Rounding to closest should be correct here, as determine_rate() is
> expected to return the closest rate, thanks for pointing out this.
> 
>>> +
>>> +			if (abs(tmp - rate) < abs(best_rate - rate)) {
>>> +				best_rate = tmp;
>>> +
>>> +				if (div_val)
>>> +					*div_val = j - 1;
>>> +
>>> +				if (best_parent) {
>>> +					*best_parent      = parent;
>>> +					*best_parent_rate = parent_rate;
>>> +				}
>>> +			}
>>> +		}
>>> +	}
>>> +
>>> +	return best_rate;
>>> +}
> 
> ...
> 
>>> +static int ccu_mux_set_parent(struct clk_hw *hw, u8 index)
>>> +{
>>> +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
>>> +	struct ccu_common *common = &mix->common;
>>> +	struct ccu_mux_config *mux = &mix->mux;
>>> +	int ret = 0;
>>> +	u32 mask;
>>> +
>>
>> I'm not sure it will ever happen, but if index is out of range
>> this most likely won't do the right thing.
>>
>> 	if (WARN_ON(index >= 1 << mux->width))
>> 		return -EINVAL;
> 
> I don't think such case is possible, since all indexes passed in
> set_parent() callback are calculated by clk_parent_index, which always
> produces a valid index or error code if we correctly set num_parents.

OK.

> 
>>> +	mask = GENMASK(mux->width + mux->shift - 1, mux->shift);
>>> +
>>> +	ccu_update(ctrl, common, mask, index << mux->shift);
>>> +
>>> +	if (common->reg_fc)
>>> +		ret = ccu_mix_trigger_fc(hw);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>
>> I think your naming for these should follow a pattern, for
>> example:
>>    gate then (factor or div) then mux then fc
> 
> Okay, mux then factor/div then gate then fc sounds better to me, since
> it reflects the order of these hardwares as shown in the clock diagram.

Sounds great.

> 
> I guess this should apply for CCU_*_DEFINE() macros as well, right?

Consistency is pretty much always your friend.

> 
>>> +const struct clk_ops spacemit_ccu_gate_ops = {
>>> +	.disable	= ccu_gate_disable,
>>> +	.enable		= ccu_gate_enable,
>>> +	.is_enabled	= ccu_gate_is_enabled,
>>> +};
>>> +
>>> +const struct clk_ops spacemit_ccu_factor_ops = {
>>> +	.round_rate	= ccu_factor_round_rate,
>>> +	.recalc_rate	= ccu_factor_recalc_rate,
>>> +	.set_rate	= ccu_factor_set_rate,
>>> +};
>>> +
>>> +const struct clk_ops spacemit_ccu_mux_ops = {
>>> +	.determine_rate = ccu_mix_determine_rate,
>>> +	.get_parent	= ccu_mux_get_parent,
>>> +	.set_parent	= ccu_mux_set_parent,
>>> +};
>>> +
>>> +const struct clk_ops spacemit_ccu_div_ops = {
>>> +	.determine_rate = ccu_mix_determine_rate,
>>> +	.recalc_rate	= ccu_div_recalc_rate,
>>> +	.set_rate	= ccu_mix_set_rate,
>>> +};
>>> +
>>> +const struct clk_ops spacemit_ccu_gate_factor_ops = {
>>> +	.disable	= ccu_gate_disable,
>>> +	.enable		= ccu_gate_enable,
>>> +	.is_enabled	= ccu_gate_is_enabled,
>>> +
>>> +	.round_rate	= ccu_factor_round_rate,
>>> +	.recalc_rate	= ccu_factor_recalc_rate,
>>> +	.set_rate	= ccu_factor_set_rate,
>>> +};
>>> +
>>
>> If you follow the pattern I said above, this would be
>> spacemit_ccu_gate_mux_ops().
>>
>> (And so on.)
>>
>>> +const struct clk_ops spacemit_ccu_mux_gate_ops = {
>>> +	.disable	= ccu_gate_disable,
>>> +	.enable		= ccu_gate_enable,
>>> +	.is_enabled	= ccu_gate_is_enabled,
>>> +
>>> +	.determine_rate = ccu_mix_determine_rate,
>>> +	.get_parent	= ccu_mux_get_parent,
>>> +	.set_parent	= ccu_mux_set_parent,
>>> +};
>>> +
>>> +const struct clk_ops spacemit_ccu_div_gate_ops = {
>>> +	.disable	= ccu_gate_disable,
>>> +	.enable		= ccu_gate_enable,
>>> +	.is_enabled	= ccu_gate_is_enabled,
>>> +
>>> +	.determine_rate = ccu_mix_determine_rate,
>>> +	.recalc_rate	= ccu_div_recalc_rate,
>>> +	.set_rate	= ccu_mix_set_rate,
>>> +};
>>> +
>>> +const struct clk_ops spacemit_ccu_div_mux_gate_ops = {
>>> +	.disable	= ccu_gate_disable,
>>> +	.enable		= ccu_gate_enable,
>>> +	.is_enabled	= ccu_gate_is_enabled,
>>> +
>>> +	.get_parent	= ccu_mux_get_parent,
>>> +	.set_parent	= ccu_mux_set_parent,
>>> +
>>> +	.determine_rate = ccu_mix_determine_rate,
>>> +	.recalc_rate	= ccu_div_recalc_rate,
>>> +	.set_rate	= ccu_mix_set_rate,
>>> +};
>>> +
>>> +const struct clk_ops spacemit_ccu_div_mux_ops = {
>>> +	.get_parent	= ccu_mux_get_parent,
>>> +	.set_parent	= ccu_mux_set_parent,
>>> +
>>> +	.determine_rate = ccu_mix_determine_rate,
>>> +	.recalc_rate	= ccu_div_recalc_rate,
>>> +	.set_rate	= ccu_mix_set_rate,
>>> +};
>>> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
>>> new file mode 100644
>>> index 000000000000..a3aa292d073d
>>> --- /dev/null
>>> +++ b/drivers/clk/spacemit/ccu_mix.h
> 
> ...
> 
>> I think you should define these next two with their types.
>>
>>> +#define CCU_PARENT_HW(_parent)		{ .hw = &_parent.common.hw }
>>> +#define CCU_PARENT_NAME(_name)		{ .fw_name = #_name }
>>> +
> 
> It's not necessary since there're enough context for the compiler in all
> use cases. It's okay for me if you consider it's better to introduce
> some extra clearness,

In this case I think it wasn't obvious to me while reading what
the type of the initialized struct was, and I needed to go look
at where it was used to understand.  If the compiler doesn't
complain it's fine, don't change it.

>> #define CCU_PARENT_HW(_parent) \
>> 	(struct clk_parent_data){ .hw = &_parent.common.hw }
>>
>>> +#define CCU_MIX_INITHW(_name, _parent, _ops, _flags)			\
>>> +	(&(struct clk_init_data) {					\
>>
>> I'm pretty sure the left parenthesis above and its matching
>> right parenthesis below are not needed.
> 
> CCU_MIX_INIT_HW is defined just like CLK_HW_INIT_HW(), which includes
> these parenthesis. I think they're for guarding usage of macros and not
> needed for our definition. Will remove them.
> 
>>> +		.flags		= _flags,				\
>>> +		.name		= #_name,				\
>>
>> If the type is defined above, you don't need to cast it here.
> 
> It's not a cast, it's a compound literal[1] introduced in C99, which
> cannot be dropped even if we define the type above.
> 
>> Also the curly braces around _parent look strange to me.  The
>> parent_data field is a pointer, and ideally there should be
>> no need to use a type cast here.
> 
> parent_data is a scalar pointer instead of a compound type, thus we
> cannot define its value by simply putting a pair of braces. We have
> two options here,
> 
> 1. Specify the type in CCU_PARENT_{HW,NAME}, make it a compound literal
>     and taking its address in CCU_MIX_INITHW()
> 
> 	#define CCU_PARENT_HW(_parent) \
> 		(struct clk_parent_data){ .hw = &_parent.common.hw }
> 
> 	/* in CCU_MIX_INITHW() */
> 		.parent_data = &_parent,
> 
> 2. Create an anonymous array by compound literal in CCU_MIX_INITHW() and
>     take its address. Members of the array are compound types, thus it's
>     okay to omit the type in CCU_PARENT_{HW,NAME}.
> 
> Option 2 is our current solution and also what standard ccf macros
> (CLK_HW_INIT_HW and etc.) look like. I cannot decide which is better.

Now I see, you're relying on anonymous objects like the common clock
framework does.  And it sounds like my general view as I was reading
the code was more like option 1.

I think either one is fine, which means what you did is OK as-is.

The layers of macros for initializing these things make it a little
harder to follow.

>>> +		.parent_data	= (const struct clk_parent_data[])	\
>>> +					{ _parent },			\
>>> +		.num_parents	= 1,					\
>>> +		.ops		= &_ops,				\
>>> +	})
>>> +
>>> +#define CCU_MIX_INITHW_PARENTS(_name, _parents, _ops, _flags)		\
>>> +	CLK_HW_INIT_PARENTS_DATA(#_name, _parents, &_ops, _flags)
>>> +
>>
>> Many/most of the other CCU_*_DEFINE() macros use the name
>> _ctrl_reg for the register.  I suggest you use that here
>> (and everywhere, for consistency).
> 
> I will take it.
> 
>>> +#define CCU_GATE_DEFINE(_name, _parent, _reg, _gate_mask, _flags)		\
>>
>> static const struct ccu_mix _name = { \
>>
>>> +struct ccu_mix _name = {							\
>>> +	.gate	= CCU_GATE_INIT(_gate_mask),					\
>>> +	.common	= {								\
>>> +		.reg_ctrl	= _reg,						\
>>
>> Why do you have a tab before the equal sign here?  (But not
>> elsewhere?)  Whatever you decide, be consistent.
> 
> It's just for saving some lines: CCU_MIX_INITHW() seems too long and
> causes early line breaks. Is it acceptable to move the whole assignement
> into CCU_MIX_INITHW() macro? This should look better.

I'm not sure, my point was about using white space consistently.

> 
>>> +		.hw.init = CCU_MIX_INITHW(_name, _parent,			\
>>> +					  spacemit_ccu_gate_ops, _flags),	\
>>> +	}									\
>>> +}
>>> +
>>> +#define CCU_FACTOR_DEFINE(_name, _parent, _div, _mul)				\
>>
>> static const struct ccu_mix _name = { \
> 
> As discussed in ccu-k1.c, I'll take the change.
> 
>>> +struct ccu_mix _name = {							\
>>> +	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
>>> +	.common = {								\
>>> +		.hw.init = CCU_MIX_INITHW(_name, _parent,			\
>>> +					  spacemit_ccu_factor_ops, 0),		\
>>> +	}									\
>>> +}
> 
> ...
> 
>>> +#define CCU_GATE_FACTOR_DEFINE(_name, _parent,					\
>>> +			       _reg,						\
>>> +			       _gate_mask,					\
>>> +			       _div, _mul,					\
>>> +			       _flags)						\
>>
>> static const struct ccu_mix _name = { \
>>
>> I believe the value of _flags is always zero, so that argument
>> could be eliminated (it can be added back in the future if it's
>> ever needed).
> 
> Makes sense to me, I'm willing to take it.
> 
>> There are only two cases where the value of _mul is different
>> from 1.  You could define a slightly different macro for those
>> cases, and for this, remove the multiplier argument.
> 
> I don't think it's worth introducing an extra macro for saving only two
> or three types, we already have a lot of them.

OK.

>>> +struct ccu_mix _name = {							\
>>> +	.gate	= CCU_GATE_INIT(_gate_mask),					\
>>> +	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
>>> +	.common = {								\
>>> +		.reg_ctrl	= _reg,						\
>>> +		.hw.init = CCU_MIX_INITHW(_name, _parent,			\
>>> +					  spacemit_ccu_gate_factor_ops, _flags)	\
>>> +	}									\
>>> +}
>>> +
> 
> ...
> 
>> I think I might have said this elsewhere;  use _fc_mask
>> (or something similar) to define what you call _fc here.
> 
> Yes, in ccu_common.h. I'll take it.
> 
>>> +#define CCU_DIV_SPLIT_FC_MUX_GATE_DEFINE(_name, _parents,			\
>>> +					 _reg_ctrl, _reg_fc,			\
>>> +					 _mshift, _mwidth,			\
>>> +					 _fc,					\
>>> +					 _muxshift, _muxwidth,			\
>>> +					 _gate_mask,				\
>>> +					 _flags)				\
>>
>> static const struct ccu_mix _name = { \
>>
>>> +struct ccu_mix _name = {							\
>>> +	.gate	= CCU_GATE_INIT(_gate_mask),					\
>>> +	.div	= CCU_DIV_INIT(_mshift, _mwidth),				\
>>> +	.mux	= CCU_MUX_INIT(_muxshift, _muxwidth),				\
>>> +	.common = {								\
>>> +		.reg_ctrl	= _reg_ctrl,					\
>>> +		.reg_fc		= _reg_fc,					\
>>> +		.fc		= _fc,						\
>>
>> In all cases, these FC masks have a single bit set; this is
>> something I think is worth mentioning in a comment.
> 
> I think ccu_mix_trigger_fc() seems a good place for it: we could explain
> the FC machanism and the special nature of the fc (fc_mask) field
> together.
> 
>>> +		.hw.init = CCU_MIX_INITHW_PARENTS(_name, _parents,		\
>>> +						  spacemit_ccu_div_mux_gate_ops,\
>>> +						  _flags),			\
>>> +	},									\
>>> +}
>>> +
> 
> ...
> 
>> static const struct ccu_mix _name = { \
>>
>>> +struct ccu_mix _name = {							\
>>> +	.div	= CCU_DIV_INIT(_mshift, _mwidth),				\
>>> +	.mux	= CCU_MUX_INIT(_muxshift, _muxwidth),				\
>>> +	.common = {								\
>>> +		.reg_ctrl	= _reg_ctrl,					\
>>> +		.reg_fc		= _reg_ctrl,					\
>>
>> I suggested elsewhere that you could use a non-zero FC mask
>> to indicate the FC register is the same as the reg_ctrl
>> register.  (Despite my repeated suggestion, what you're
>> doing already is fine...)
> 
> Please refer to my question about the non-zero FC mask in ccu_common.h.

You can ignore my comment.

>>> +		.fc		= _fc,						\
>>> +		.hw.init = CCU_MIX_INITHW_PARENTS(_name, _parents,		\
>>> +						  spacemit_ccu_div_mux_ops,	\
>>> +						  _flags),			\
>>> +	},									\
>>> +}
> 
> ...
> 
>> I think you can define each ops variable on its own line.
> 
> I will take it, which makes the code cleaner.
> 
>>> +extern const struct clk_ops spacemit_ccu_gate_ops, spacemit_ccu_factor_ops;
>>> +extern const struct clk_ops spacemit_ccu_mux_ops, spacemit_ccu_div_ops;
>>> +
>>> +extern const struct clk_ops spacemit_ccu_gate_factor_ops;
>>> +extern const struct clk_ops spacemit_ccu_div_gate_ops;
>>> +extern const struct clk_ops spacemit_ccu_mux_gate_ops;
>>> +extern const struct clk_ops spacemit_ccu_div_mux_ops;
>>> +
>>> +extern const struct clk_ops spacemit_ccu_div_mux_gate_ops;
>>> +#endif /* _CCU_DIV_H_ */
>>> diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
>>> new file mode 100644
>>> index 000000000000..9df2149f6c98
>>> --- /dev/null
>>> +++ b/drivers/clk/spacemit/ccu_pll.c
>>> @@ -0,0 +1,146 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Spacemit clock type pll
>>> + *
>>> + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
>>> + * Copyright (c) 2024 Haylen Chu <heylenay@4d2.org>
>>> + */
>>> +
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/regmap.h>
>>> +
>>> +#include "ccu_common.h"
>>> +#include "ccu_pll.h"
>>> +
>>
>> Name this just PLL_TIMEOUT, or maybe CCU_PLL_TIMEOUT, and
>> indicate in a comment that it is a period in microseconds.
> 
> Same for the FC timeout case, I'd like to append a "_US" suffix to
> indicate its unit.
> 
> ...
> 
>>> +/* frequency unit Mhz, return pll vco freq */
>>> +static unsigned long ccu_pll_get_vco_freq(struct clk_hw *hw)
>>> +{
>>> +	const struct ccu_pll_rate_tbl *pll_rate_table;
>>> +	struct ccu_pll *p = hw_to_ccu_pll(hw);
>>> +	struct ccu_common *common = &p->common;
>>> +	u32 swcr1, swcr3, size;
>>> +	int i;
>>> +
>>> +	ccu_read(swcr1, common, &swcr1);
>>> +	ccu_read(swcr3, common, &swcr3);
>>
>> You are masking off the EN bit, but you should really be
>> using a mask defining which bits are valid instead.  As
>> I said earlier:
>>
>> #define SPACEMIT_PLL_SWCR3_MASK	~(SPACEMIT_PLL_SWCR3_EN)
>>
>>> +	swcr3 &= ~PLL_SWCR3_EN;
>>
>> 	swcr3 &= SPACEMIT_PLL_SWCR3_MASK;
>>> +
>>> +	pll_rate_table = p->pll.rate_tbl;
>>> +	size = p->pll.tbl_size;
>>> +
>>> +	for (i = 0; i < size; i++) {
>>> +		if (pll_rate_table[i].swcr1 == swcr1 &&
>>> +		    pll_rate_table[i].swcr3 == swcr3)
>>> +			return pll_rate_table[i].rate;
>>> +	}
>>> +
>>
>> I have a general question here.  Once you set one of these
>> clock rates, it will always use one of the rates defined
>> in the table.
>>
>> But what about initially?  Could the hardware start in a
>> state that is not defined by this code?  Do you *set* the
>> rate initially?  Should you (at least the first time the
>> clock is prepared/enabled)?
> 
> Thanks, I've also seen your later report. Here we may support
> clk_ops.init and reinitialize the PLL if it's not in a good state.
> 
> Could you please provide a possible reproducing scenario for me to test
> against the PLL problem?

What I can tell you is that I see the warning, perhaps when
I'm using the clock.  I'll try to narrow down a test case but
right now I don't have one.

[    0.145906] WARNING: CPU: 0 PID: 1 at 
drivers/clk/spacemit/ccu_pll.c:51 ccu_pll_recalc_rate+0x76/0x9a

I added code to report the swcr1 and swcr3 values but I don't
have those right now.

> 
>>> +	WARN_ON_ONCE(1);
>>
>> Maybe WARN_ONCE(true, "msg");
>>
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int ccu_pll_enable(struct clk_hw *hw)
>>> +{
>>> +	struct ccu_pll *p = hw_to_ccu_pll(hw);
>>> +	struct ccu_common *common = &p->common;
>>> +	unsigned int tmp;
>>> +	int ret;
>>> +
>>
>> Get rid of ret (see below).
>>
>> Will clk_ops->enable() ever be called when it's already
>> enabled?  (If it won't, this isn't needed.  If it will,
>> this checks the hardware, which is good.)
> 
> CCF holds a refcounter of clock consumers, so we could drop the check.
> 
>>> +	if (ccu_pll_is_enabled(hw))
>>> +		return 0;
>>> +
>>> +	ccu_update(swcr3, common, PLL_SWCR3_EN, PLL_SWCR3_EN);
>>> +
>>> +	/* check lock status */
>>> +	ret = regmap_read_poll_timeout_atomic(common->lock_regmap,
>>> +					      p->pll.reg_lock,
>>> +					      tmp,
>>> +					      tmp & p->pll.lock_enable_bit,
>>> +					      5, PLL_DELAY_TIME);
>>
>> Just:
>>
>> 	return regmap_read_poll_timeout_atomic(...);
>>
>> I note that you call this here, but you hide the call
>> to regmap_read_poll_timeout_atomic() behind the macro
>> ccu_poll().  And ccu_poll() (used for the FC bit) is
>> also only called once.
>>
>> I suggest you get rid of regmap_poll() and just open-code
>> it.
>>
>> (You use ccu_read() and ccu_update() numerous times, so
>> your "saving some characters" is justified.)
> 
> Makes sense to me, will take it.
> 
>>> +
>>> +	return ret;
>>> +}
> 
> ...
> 
>>> +/*
>>> + * PLLs must be gated before changing rate, which is ensured by
>>> + * flag CLK_SET_RATE_GATE.
>>> + */
>>> +static int ccu_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>>> +			    unsigned long parent_rate)
>>> +{
>>> +	struct ccu_pll *p = hw_to_ccu_pll(hw);
>>> +	struct ccu_common *common = &p->common;
>>> +	struct ccu_pll_config *params = &p->pll;
>>> +	const struct ccu_pll_rate_tbl *entry = NULL;
>>> +	int i;
>>> +
>>> +	for (i = 0; i < params->tbl_size; i++) {
>>> +		if (rate == params->rate_tbl[i].rate) {
>>> +			entry = &params->rate_tbl[i];
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	if (WARN_ON_ONCE(!entry))
>>> +		return -EINVAL;
>>> +
>>
>> The next line contains a bug.  The third argument defines
>> a mask of which bits get updated.  Therefore, any zero bits
>> in that mask will *not* get updated in the swcr1 register
>> even if they should be.
>>
>> Example:
>> Old SWCR1:	0x01234567
>> New SWCR1:	0x00112233
>>
>> Updated:	0x01336777
>> Want:		0x00112233
>>
>> You should either define ccu_write() (my preference), or
>> you you should call:
> 
> Or maybe we could just call regmap_write directly here, it's the only
> place we require unprotected writes (PLL registers aren't shared) and
> it's not worth introducing the macro again.

Yes!

> 
>> 	ccu_update(swcr1, common, ~0, entry->swcr1);
>>
>>
>>> +	ccu_update(swcr1, common, entry->swcr1, entry->swcr1);
>>
>> You should use SPACEMIT_PLL_SWCR3_MASK below.  No
>> cast should be needed (define the symbol with one).
>>
>>> +	ccu_update(swcr3, common, (u32)~PLL_SWCR3_EN, entry->swcr3);
>>> +
>>> +	return 0;
>>> +}
> 
> ...
> 
>>> +static long ccu_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>>> +			       unsigned long *prate)
>>> +{
>>> +	struct ccu_pll *p = hw_to_ccu_pll(hw);
>>> +	struct ccu_pll_config *params = &p->pll;
>>> +	unsigned int i;
>>> +
>>
>> I'm pretty sure I mentioned this before.  If you cant find a
>> matching rate, you return the closest rate *less than* what
>> is requested, which might not be as close as the closest
>> rate *greater than* the requested rate.
> 
> I don't see CCF requires round_rate to yield a rate that is greater than
> the request value, but only a closest one. Am i missing something?

Looking at this function again, it seems you might as
well simply do this:

{
	return rate;
}

As it is, you loop through all the rates and exit the loop
if you find an entry whose rate is higher than the one passed
as an argument.

But... that's it.  You return rate, and never change it during
the function.


Aside from that, my point was more about what I *think* you
intended this function to do, which is to find the closest
rate to the one provided.  I was suggesting you were picking
the first entry found less than or equal to the requested
rate, but that wasn't necessarily the closest.

Rather than describe what I mean, I'll provide some code.

     unsigned long best_delta = ULONG_MAX;
     long best_rate = rate;    /* maybe -EERROR? */

     for (i = 0; i < params->tbl_size; i++) {
	unsigned long table_rate = params->rate_tbl[i].rate;
         unsigned long delta = abs_diff(table_rate, rate);

         if (delta < best_delta) {
             best_delta = delta;
             best_rate = table_rate;
         }
	if (table_rate > rate)
             break;         /* if your table is sorted by rate */
     }

     return best_rate;

>> In ccu_mix_calc_best_rate() you actually take this into account
>> (though you use DIV_ROUND_UP_ULL() there too).
>>
>>> +	for (i = 0; i < params->tbl_size; i++) {
>>> +		if (params->rate_tbl[i].rate > rate) {
>>> +			i--;
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	return rate;
>>> +}
> 
> ...
> 
>>> diff --git a/drivers/clk/spacemit/ccu_pll.h b/drivers/clk/spacemit/ccu_pll.h
>>> new file mode 100644
>>> index 000000000000..c6a3a5cce995
>>> --- /dev/null
>>> +++ b/drivers/clk/spacemit/ccu_pll.h
> 
> ...
> 
>>> +struct ccu_pll_config {
>>> +	const struct ccu_pll_rate_tbl *rate_tbl;
>>> +	u32 tbl_size;
>>
>> I dislike "size" as a name for something that is a "count".
>> To me, "size" is a number of bytes.
>>
>> You (and clock code) use "num" elsewhere, but either way,
>> please use something different from "size" here.
> 
> Of course "num" works for me.
> 
> Thank you for the detailed review! I'm pretty busy these days and
> delayed my reply. I'll try to send a v7 this week with all the comments
> resolved.

And thank you for your good responses.

					-Alex

> Best regards,
> Haylen Chu
> 
> [1]: https://en.cppreference.com/w/c/language/compound_literal
> 

