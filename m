Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8382D21D596;
	Mon, 21 Apr 2025 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745232483; cv=pass; b=EQRlxSRnIUTcgj98QD0WE3aLiMEgA/4ez4CMqhscIGdnHX1F5HvgtMDJLvoWjVwQsjRUwZ0NA3gr6Lyt4pPKPD4Qx4tqoVacq6yjQNH/OaSumK1Dy3Fdt7l356M5jfRHi6+OWjIRTmiKbJQ5VJAmyCAp/toKQh+XflgwgQoxEzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745232483; c=relaxed/simple;
	bh=vsuoKyi9QEiykV19hwDSM3pDdYnlbwWrskMpSRJYinE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s8IxM5SgWvkuuaSV7USo1B9C1VPTAxvfv7ocMRc2qXqka79lkleCpDUiINtYO13jaa+YSv1/sJgTpXYxY8qU8QPZ2fzlcphLHkpU1dkmyFQNohGeiYLAP75dQ+2vl1g16tmgE5pL/otmuG92Gq+55Vz/2IFjNwbqQzjIaR1cTs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=N8kO1Crf; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="N8kO1Crf"
ARC-Seal: i=1; a=rsa-sha256; t=1745232460; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jCkOFp37ThnH/BDKrGBmUx5RFyteONGVIcJILUW/WlnLGc6KAMnT8NNTnaEr68gvcL7nxfTICIABUv64Qeso0w3efP1oU2yiS6EtT4P3+NB6Wkag/2yqoJsxkmr4Y/wvd/ULyhR/Y/RFB5T4LR3MGT1ffFm1FqAVxjDEiQlBcQ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745232460; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vsuoKyi9QEiykV19hwDSM3pDdYnlbwWrskMpSRJYinE=; 
	b=AxYKa6cp4VATQ7YqML5BJD6MeUaT7yMjo4Iamo14DGDtfu+X5w7qyKpwdrdUBjIfCeZPxR4gin+CxzwW/IdUXmJHugz1IwNuaPWaof1CA+B4tqQpgIMc/kxlfqyOV1pdAUDBGJEODPTW7jCxYg1DtGYInAV9XfuAUb6Q0TBuIbs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745232460;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=vsuoKyi9QEiykV19hwDSM3pDdYnlbwWrskMpSRJYinE=;
	b=N8kO1CrfLxW+5wV1KX3b2/4fXRjN4JyBW4OzFd7W3qlZJ9QqW2JbwPBjT+nMQRqN
	DQd5kD0qIhUgxqwmjuZoAFGCDREiqbfxFfP8tMFiR79ZuElQXl+3TRccERbcxRYWSwl
	1MzABJ8Wqm8zAD/0a8/lOzK7oaPoBw1nlpqgX6T4=
Received: by mx.zohomail.com with SMTPS id 1745232452153354.0538673383868;
	Mon, 21 Apr 2025 03:47:32 -0700 (PDT)
Message-ID: <950ec364-53a8-4795-a8d7-788bedb91bd0@zohomail.com>
Date: Mon, 21 Apr 2025 18:47:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PATCH v6 2/3] clk: canaan: Add clock driver for Canaan K230
To: ALOK TIWARI <alok.a.tiwari@oracle.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
 <20250415-b4-k230-clk-v6-2-7fd89f427250@zohomail.com>
 <a7d01c71-c8bb-4dbe-bb08-4d988bd16177@oracle.com>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <a7d01c71-c8bb-4dbe-bb08-4d988bd16177@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Feedback-ID: rr080112270123cbafe1020b4d0199bd60000048d8f988f230ca5e205ba24daff3670103e49eaeacdb598511:zu080112278d3a28bff21bc5de54ebcdcf00006568c54ebccae7c9631a3e16d555ec1d2fb869ac6e40dbec38:rf0801122c5ddc7572d4005a93dadd9fdd0000375f5b1c3b96973fce67a97b04d1d4d85afff31555440779f4f7cd008aa6:ZohoMail
X-ZohoMailClient: External


On 2025/4/21 02:08, ALOK TIWARI wrote:
> Hi Xukai,
>
> Thanks for your patch.
>
> On 15-04-2025 19:55, Xukai Wang wrote:
>> This patch provides basic support for the K230 clock, which does not
>> cover all clocks.
>>
>> The clock tree of the K230 SoC consists of OSC24M, PLLs and sysclk.
>>
>> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
>> ---
> [clip]
>> +
>> +/* PLL control register bits. */
>> +#define K230_PLL_BYPASS_ENABLE                BIT(19)
>> +#define K230_PLL_GATE_ENABLE                BIT(2)
>> +#define K230_PLL_GATE_WRITE_ENABLE            BIT(18)
>> +#define K230_PLL_OD_SHIFT                24
>> +#define K230_PLL_OD_MASK                0xF
>> +#define K230_PLL_R_SHIFT                16
>> +#define K230_PLL_R_MASK                    0x3F
>> +#define K230_PLL_F_SHIFT                0
>> +#define K230_PLL_F_MASK                    0x1FFFF
>> +#define K230_PLL0_OFFSET_BASE                0x00
>> +#define K230_PLL1_OFFSET_BASE                0x10
>> +#define K230_PLL2_OFFSET_BASE                0x20
>> +#define K230_PLL3_OFFSET_BASE                0x30
>> +#define K230_PLL_DIV_REG_OFFSET                0x00
>> +#define K230_PLL_BYPASS_REG_OFFSET            0x04
>> +#define K230_PLL_GATE_REG_OFFSET            0x08
>> +#define K230_PLL_LOCK_REG_OFFSET            0x0C
>> +
>
> use lowercase hex
I see, I'll replace them with lowercase next version.
>> +/* PLL lock register bits.  */
>
> extra ' ' after bits.
OK, I'll drop it.
>
>> +#define K230_PLL_STATUS_MASK                BIT(0)
>> +
>> +/* K230 CLK registers offset */
>> +#define K230_CLK_AUDIO_CLKDIV_OFFSET            0x34
>> +#define K230_CLK_PDM_CLKDIV_OFFSET            0x40
>> +#define K230_CLK_CODEC_ADC_MCLKDIV_OFFSET        0x38
>> +#define K230_CLK_CODEC_DAC_MCLKDIV_OFFSET        0x3c
>> +
> [clip]
>> +static int k230_clk_find_approximate(struct k230_clk *clk,
>> +                     u32 mul_min,
>> +                     u32 mul_max,
>> +                     u32 div_min,
>> +                     u32 div_max,
>> +                     enum k230_clk_div_type method,
>> +                     unsigned long rate,
>> +                     unsigned long parent_rate,
>> +                     u32 *div,
>> +                     u32 *mul)
>> +{
>> +    long abs_min;
>> +    long abs_current;
>> +    long perfect_divide;
>> +    struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
>> +    struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
>> +
>
> hope all is non-zero (mul_min, mul_max , rate , parent_rate)
> avoid division by zero possibility
OK, I'll add a non-zeo check before division operation.
>
>> +    const u32 codec_clk[9] = {
>> +        2048000,
>> +        3072000,
>> +        4096000,
>> +        6144000,
>> +        8192000,
>> +        11289600,
>> +        12288000,
>> +        24576000,
>> +        49152000
>> +    };
>> +
>> +    const u32 codec_div[9][2] = {
>> +        {3125, 16},
>> +        {3125, 24},
>> +        {3125, 32},
>> +        {3125, 48},
>> +        {3125, 64},
>> +        {15625, 441},
>> +        {3125, 96},
>> +        {3125, 192},
>> +        {3125, 384}
>> +    };
>> +
>> +    const u32 pdm_clk[20] = {
>> +        128000,
>> +        192000,
>> +        256000,
>> +        384000,
>> +        512000,
>> +        768000,
>> +        1024000,
>> +        1411200,
>> +        1536000,
>> +        2048000,
>> +        2822400,
>> +        3072000,
>> +        4096000,
>> +        5644800,
>> +        6144000,
>> +        8192000,
>> +        11289600,
>> +        12288000,
>> +        24576000,
>> +        49152000
>> +    };
>> +
>> +    const u32 pdm_div[20][2] = {
>> +        {3125, 1},
>> +        {6250, 3},
>> +        {3125, 2},
>> +        {3125, 3},
>> +        {3125, 4},
>> +        {3125, 6},
>> +        {3125, 8},
>> +        {125000, 441},
>> +        {3125, 12},
>> +        {3125, 16},
>> +        {62500, 441},
>> +        {3125, 24},
>> +        {3125, 32},
>> +        {31250, 441},
>> +        {3125, 48},
>> +        {3125, 64},
>> +        {15625, 441},
>> +        {3125, 96},
>> +        {3125, 192},
>> +        {3125, 384}
>> +    };
>> +
>> +    switch (method) {
>> +    /* only mul can be changeable 1/12,2/12,3/12...*/
>
> need ' ' before */
> Maybe something like this could work here
> /* Only the multiplier is configurable: 1/12, 2/12, 3/12, ... */
> /* Only mul can be changed: 1/12, 2/12, 3/12, ... */
OK, I get it. I'll modify it next version.
>
>> +    case K230_MUL:
>> +        perfect_divide = (long)((parent_rate * 1000) / rate);
>> +        abs_min = abs(perfect_divide -
>> +                 (long)(((long)div_max * 1000) / (long)mul_min));
>> +        *mul = mul_min;
>> +
>> +        for (u32 i = mul_min + 1; i <= mul_max; i++) {
>> +            abs_current = abs(perfect_divide -
>> +                    (long)((long)((long)div_max * 1000) / (long)i));
>> +            if (abs_min > abs_current) {
>> +                abs_min = abs_current;
>> +                *mul = i;
>> +            }
>> +        }
>> +
>> +        *div = div_max;
>> +        break;
>> +    /* only div can be changeable, 1/1,1/2,1/3...*/
>
> need ' ' before */
>
OK.
>> +    case K230_DIV:
>> +        perfect_divide = (long)((parent_rate * 1000) / rate);
>> +        abs_min = abs(perfect_divide -
>> +                 (long)(((long)div_min * 1000) / (long)mul_max));
>> +        *div = div_min;
>> +
>> +        for (u32 i = div_min + 1; i <= div_max; i++) {
>> +            abs_current = abs(perfect_divide -
>> +                     (long)((long)((long)i * 1000) / (long)mul_max));
>> +            if (abs_min > abs_current) {
>> +                abs_min = abs_current;
>> +                *div = i;
>> +            }
>> +        }
>> +
>> +        *mul = mul_max;
>> +        break;
>> +    /* mul and div can be changeable. */
>> +    case K230_MUL_DIV:
>> +        if (rate_cfg->rate_reg_off ==
>> K230_CLK_CODEC_ADC_MCLKDIV_OFFSET ||
>> +            rate_cfg->rate_reg_off ==
>> K230_CLK_CODEC_DAC_MCLKDIV_OFFSET) {
>> +            for (u32 j = 0; j < 9; j++) {
>> +                if (0 == (rate - codec_clk[j])) {
>> +                    *div = codec_div[j][0];
>> +                    *mul = codec_div[j][1];
>> +                }
>> +            }
>> +        } else if (rate_cfg->rate_reg_off ==
>> K230_CLK_AUDIO_CLKDIV_OFFSET ||
>> +               rate_cfg->rate_reg_off == K230_CLK_PDM_CLKDIV_OFFSET) {
>> +            for (u32 j = 0; j < 20; j++) {
>> +                if (0 == (rate - pdm_clk[j])) {
>> +                    *div = pdm_div[j][0];
>> +                    *mul = pdm_div[j][1];
>> +                }
>> +            }
>> +        } else {
>> +            return -EINVAL;
>> +        }
>> +        break;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static long k230_clk_round_rate(struct clk_hw *hw, unsigned long
>> rate, unsigned long *parent_rate)
>> +{
>> +    struct k230_clk *clk = to_k230_clk(hw);
>> +    struct k230_sysclk *ksc = clk->ksc;
>> +    struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
>> +    struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
>> +    u32 div = 0, mul = 0;
>> +
>
> Do we need to check for rate == 0 or parent_rate == 0 here?"
I think so, and I'll add a check in `k230_clk_find_approximate()`.
>
>> +    if (k230_clk_find_approximate(clk,
>> +                      rate_cfg->rate_mul_min, rate_cfg->rate_mul_max,
>> +                      rate_cfg->rate_div_min, rate_cfg->rate_div_max,
>> +                      rate_cfg->method, rate, *parent_rate, &div,
>> &mul)) {
>> +        return 0;
>> +    }
>> +
>> +    return mul_u64_u32_div(*parent_rate, mul, div);
>> +}
>> +
>> +static int k230_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>> +                 unsigned long parent_rate)
>> +{
>> +    struct k230_clk *clk = to_k230_clk(hw);
>> +    struct k230_sysclk *ksc = clk->ksc;
>> +    struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
>> +    struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
>> +    struct k230_clk_rate_cfg_c *rate_cfg_c = cfg->rate_cfg_c;
>> +    u32 div = 0, mul = 0, reg = 0, reg_c;
>> +
>> +    if (rate > parent_rate || rate == 0 || parent_rate == 0) {
>
> what about if (rate > parent_rate || !rate || !parent_rate)
Seems better here. I'll modify it.
>
>> +        dev_err(&ksc->pdev->dev, "rate or parent_rate error\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (cfg->read_only) {
>> +        dev_err(&ksc->pdev->dev, "This clk rate is read only\n");
>> +        return -EPERM;
>> +    }
>> +
>> +    if (k230_clk_find_approximate(clk,
>> +                      rate_cfg->rate_mul_min, rate_cfg->rate_mul_max,
>> +                      rate_cfg->rate_div_min, rate_cfg->rate_div_max,
>> +                      rate_cfg->method, rate, parent_rate, &div,
>> &mul)) {
>> +        return -EINVAL;
>> +    }
>> +
>> +    guard(spinlock)(&ksc->clk_lock);
>> +    if (!rate_cfg_c) {
>> +        reg = readl(rate_cfg->rate_reg);
>> +        reg &= ~((rate_cfg->rate_div_mask) <<
>> (rate_cfg->rate_div_shift));
>> +
>> +        if (rate_cfg->method == K230_DIV) {
>> +            reg &= ~((rate_cfg->rate_mul_mask) <<
>> (rate_cfg->rate_mul_shift));
>> +            reg |= ((div - 1) & rate_cfg->rate_div_mask) <<
>> (rate_cfg->rate_div_shift);
>> +        } else if (rate_cfg->method == K230_MUL) {
>> +            reg |= ((mul - 1) & rate_cfg->rate_div_mask) <<
>> (rate_cfg->rate_div_shift);
>> +        } else {
>> +            reg |= (mul & rate_cfg->rate_mul_mask) <<
>> (rate_cfg->rate_mul_shift);
>> +            reg |= (div & rate_cfg->rate_div_mask) <<
>> (rate_cfg->rate_div_shift);
>> +        }
>> +        reg |= BIT(rate_cfg->rate_write_enable_bit);
>> +    } else {
>> +        reg = readl(rate_cfg->rate_reg);
>> +        reg_c = readl(rate_cfg_c->rate_reg_c);
>> +        reg &= ~((rate_cfg->rate_div_mask) <<
>> (rate_cfg->rate_div_shift));
>> +        reg_c &= ~((rate_cfg_c->rate_mul_mask_c) <<
>> (rate_cfg_c->rate_mul_shift_c));
>> +        reg_c |= BIT(rate_cfg_c->rate_write_enable_bit_c);
>> +
>> +        reg_c |= (mul & rate_cfg_c->rate_mul_mask_c) <<
>> (rate_cfg_c->rate_mul_shift_c);
>> +        reg |= (div & rate_cfg->rate_div_mask) <<
>> (rate_cfg->rate_div_shift);
>> +
>> +        writel(reg_c, rate_cfg_c->rate_reg_c);
>> +    }
>> +    writel(reg, rate_cfg->rate_reg);
>> +
>> +    return 0;
>> +}
>> +
> [clip]
>
>> +static int k230_register_clks(struct platform_device *pdev, struct
>> k230_sysclk *ksc)
>> +{
>> +    struct k230_clk_cfg *cfg;
>> +    struct k230_clk_parent *pclk;
>> +    struct clk_parent_data parent_data[K230_CLK_MAX_PARENT_NUM];
>> +    int ret, i;
>> +
>> +    /*
>> +     *  Single parent clock:
>> +     *  pll0_div2 sons: cpu0_src
>> +     *  pll0_div4 sons: cpu0_pclk
>> +     *  cpu0_src sons: cpu0_aclk, cpu0_plic, cpu0_noc_ddrcp4, pmu_pclk
>> +     *
>> +     *  Mux clock:
>> +     *  hs_ospi_src parents: pll0_div2, pll2_div4
>> +     */
>
> extra ' ' after *
>
> what is sons?
> does not sound good -> child ?
>
Yes, child is more appropriate here. I'll modify the comment next version.

>> +    for (i = 0; i < K230_CLK_NUM; i++) {
>> +        cfg = k230_clk_cfgs[i];
>> +        if (!cfg)
>> +            continue;
>> +
>> +        if (cfg->mux_cfg) {
>> +            ret = k230_clk_mux_get_parent_data(cfg, parent_data);
>> +            if (ret)
>> +                return ret;
>> +
> [clip]
>> +
>> +static const struct of_device_id k230_clk_ids[] = {
>> +    { .compatible = "canaan,k230-clk" },
>> +    { /* Sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, k230_clk_ids);
>> +
>> +static struct platform_driver k230_clk_driver = {
>> +    .driver = {
>> +        .name  = "k230_clock_controller",
>
> extra ' ' after .name
I'll drop it.
>
>> +        .of_match_table = k230_clk_ids,
>> +    },
>> +    .probe = k230_clk_probe,
>> +};
>> +builtin_platform_driver(k230_clk_driver);
>
>
> Thanks,
> Alok
Thanks for your time and patient review! :)
