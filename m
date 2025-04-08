Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A3B25334C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 19:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744141053; cv=none; b=IvDDQ2uFj08MKZ8/PuKuRJVnSY4Ovx3H+0fp0YWELEWv7h0scQXRxHKfKrIArVwzJCGopMezI3eid8DicXOyVMWZqRsyPMrbhgOuo51QUV9J6nT33mPi4RhkKTWBhBz5ab/byDtX5SI3GBKl65fpIt6oUr1NQuuZXlPqZcJD1Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744141053; c=relaxed/simple;
	bh=3UEGQybMIzCIb/fK6BHx3wjM28c2EMUIg2D2eyuMdKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRZfIrZhC6l8HD0C0i0SorkdQYJGa0cVlS11+NLmQQsyzfyl1Vqc3QwtcdDf/FZPiCBQHmGNPfWuV1YTySTFLx/OBGthKH+Aeb+SU8LVaO4EvPzdiU10KyO9VJYmK+EhmqdNCtzdOvV6vWBG9zfb+b8N1KLMLVvMpcbnwi90z1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bS2T6yhQ; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bS2T6yhQ"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-86135ae2a29so277473239f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744141050; x=1744745850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MmV03+3+73PF3Wnm576GGuQSs6MRwFfeF314mocZSr4=;
        b=bS2T6yhQM5V9SH8BeCcYK3+4+ZtkG5UgiVTVCY5xZERNtOBUUlWeGob/jeHqDafBS3
         PfJpr0WWL8dCRchcr3e1bpWuJeDA0hv+LxIE5t1jtAV3DNPN8edQKK5WK8xl3J7ClQng
         OhC3yjvXmIdAh8wKjryNvD92Oj1JllrHUqJL3ZwUl4q+lZd+poo5l+/IewTO3aKYrBGe
         t1J4sUnOTJTAE/ffbaLAhBizuc9nQLp2QBFJ/QaX25IXUv78eThOidgAmHb7yQbiAqkd
         rtd97U6uD0vKFoxNVX/zQvnK2Q9F46OhocABchqAsmFaC2JC8aTPMzNsA3544/bRbF1V
         RRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141050; x=1744745850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MmV03+3+73PF3Wnm576GGuQSs6MRwFfeF314mocZSr4=;
        b=JDwyY/qRvBxMc5bvibzrDmHRv9ztoc5741hSYb1xCSXQKpVx9kkcMH9H9cJg/DkkEF
         XaPTprw2QwHCVQ2w+xApP1nqjkVigV46P4/o+fOu57virCMUv5GvDAgkod4VLqradUCE
         ZLAdqidDm4QYX30zgnkegnaDM4BKoCin7880V252pepoxQGbGl5escZqh++XdCoBXmcm
         1P+LK2lIs0rFm9YSE3dSWk6Xtsf/45HU5ZQbcuZf6ovYGMfFsUoCsQTjNxyQxVx9xCi2
         bDTzhP77qU+VyCtFFv0lhK0yMha3TQvBgmX34kJVvObcYKdSUgfEmoZh8//aywx4WTNu
         uxZA==
X-Forwarded-Encrypted: i=1; AJvYcCULRkK1Vsros3F4+9Ps2h+mCPIVVR40plbeI6e1XS3KcFZGBLfej3aVS2mgvY3EMCFC9SBMUvalXnNOIbU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8IYYWdzM30MciImiuLJktCIhYbW2OXeNZNiNodTe5ZmDNH8Fh
	CaTg5/LAHAuR+YccQaMe2CxDvFQshwDypGzYK4offBCW46yZhTS1AxOY2ysgB34=
X-Gm-Gg: ASbGncvoglwD2QhPrJq4rbYynSVYXlDGRlqSWyh3fAkpIs7x2ErMfUbPZLQGjqowtXA
	1+vkX7h7b8DHi7MBvmRkSMXy/CTrql3qQqH5SZUNFdvdPBYwPQ6V8j6gfqs4F7A0Owm/Ae/j0ik
	RYOT4uduNGJohdgUxzen8OrRvgyY9v39+Z8iZbq9HCBIjRX2VfWYHDYxmOPjzUswPcWt4Unx98z
	jCyTb/aIe8KUItAnusu84Z/ciZ4Ekq81nJNKIMq8UBR8vl14gPqgxyPuM1+61pt4CjVFNeVjYrt
	rAdBQ438HYZ7QbQCsoFz4f2+Z4Np+kYeaPAndBVzO2YN4QMY2THEG6Zdt+T/cZ1OyYY79WUaMhf
	d0B1UcOrF
X-Google-Smtp-Source: AGHT+IH0TSMJF+g/Z6xVX1/aYkm6TagQPlKzWAceXhcuRviJQOI+i72GhBsaY2XFvoCOzOyuaI7f0A==
X-Received: by 2002:a05:6602:4008:b0:85d:115b:bb3f with SMTP id ca18e2360f4ac-86161198b56mr61824839f.6.1744141050583;
        Tue, 08 Apr 2025 12:37:30 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f44e3aa0sm653506173.126.2025.04.08.12.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:37:30 -0700 (PDT)
Message-ID: <89385654-11bc-4cf0-b94e-15bf841ac215@riscstar.com>
Date: Tue, 8 Apr 2025 14:37:29 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] clk: spacemit: k1: Add TWSI8 bus and function
 clocks
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-5-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250401172434.6774-5-heylenay@4d2.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 12:24 PM, Haylen Chu wrote:
> The control register for TWSI8 clocks, APBC_TWSI8_CLK_RST, contains mux
> selection bits, reset assertion bit and enable bits for function and bus
> clocks. It has a quirk that reading always results in zero.
> 
> As a workaround, let's hardcode the mux value as zero to select
> pll1_d78_31p5 as parent and treat twsi8_clk as a gate, whose enable mask
> is combined from the real bus and function clocks to avoid the
> write-only register being shared between two clk_hws, in which case
> updates of one clk_hw zero the other's bits.
> 
> With a 1:1 factor serving as placeholder for the bus clock, the I2C-8
> controller could be brought up, which is essential for boards attaching
> power-management chips to it.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>

Now that I understand why, I'm glad you put this into a separate
patch.  However I think you should make a note in the code to
indicate there's something different about this one clock.
People can then go back (with "git blame") to see the explanation
above.

Please consider adding such a comment in your next version.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/clk/spacemit/ccu-k1.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index cd95c4f9c127..5804c2f85407 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -397,6 +397,8 @@ CCU_MUX_GATE_DEFINE(twsi6_clk, twsi_parents, APBC_TWSI6_CLK_RST, 4, 3, BIT(1),
>   		    0);
>   CCU_MUX_GATE_DEFINE(twsi7_clk, twsi_parents, APBC_TWSI7_CLK_RST, 4, 3, BIT(1),
>   		    0);
> +CCU_GATE_DEFINE(twsi8_clk, CCU_PARENT_HW(pll1_d78_31p5), APBC_TWSI8_CLK_RST,
> +		BIT(1) | BIT(0), 0);
>   
>   static const struct clk_parent_data timer_parents[] = {
>   	CCU_PARENT_HW(pll1_d192_12p8),
> @@ -528,6 +530,7 @@ CCU_GATE_DEFINE(twsi6_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI6_CLK_RST,
>   		BIT(0), 0);
>   CCU_GATE_DEFINE(twsi7_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI7_CLK_RST,
>   		BIT(0), 0);
> +CCU_FACTOR_DEFINE(twsi8_bus_clk, CCU_PARENT_HW(apb_clk), 1, 1);
>   
>   CCU_GATE_DEFINE(timers1_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TIMERS1_CLK_RST,
>   		BIT(0), 0);
> @@ -1059,6 +1062,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>   	[CLK_TWSI5]		= &twsi5_clk.common.hw,
>   	[CLK_TWSI6]		= &twsi6_clk.common.hw,
>   	[CLK_TWSI7]		= &twsi7_clk.common.hw,
> +	[CLK_TWSI8]		= &twsi8_clk.common.hw,
>   	[CLK_TIMERS1]		= &timers1_clk.common.hw,
>   	[CLK_TIMERS2]		= &timers2_clk.common.hw,
>   	[CLK_AIB]		= &aib_clk.common.hw,
> @@ -1110,6 +1114,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>   	[CLK_TWSI5_BUS]		= &twsi5_bus_clk.common.hw,
>   	[CLK_TWSI6_BUS]		= &twsi6_bus_clk.common.hw,
>   	[CLK_TWSI7_BUS]		= &twsi7_bus_clk.common.hw,
> +	[CLK_TWSI8_BUS]		= &twsi8_bus_clk.common.hw,
>   	[CLK_TIMERS1_BUS]	= &timers1_bus_clk.common.hw,
>   	[CLK_TIMERS2_BUS]	= &timers2_bus_clk.common.hw,
>   	[CLK_AIB_BUS]		= &aib_bus_clk.common.hw,

