Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83407230BE9;
	Tue, 22 Apr 2025 08:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308944; cv=pass; b=rlFw9duP8j1/MdisTVc7cp+FFKPMXkDFzOwz4VemJpqAPCNEBv5DqxCfd33Nbtec3S1Lk0CTedI6aImhFzk6SQpDBTEIeCoEuSFJaiZN8hVhc58GoyJbKjMEsO+4w0UaFFoovYwOfoo9uqjUInxVaUn7u3H0YcPP25BMAFKopt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308944; c=relaxed/simple;
	bh=6mPBiVFnMBSLEQBiB7ejAYxBvNS+aTxOvfgPKqFlMvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bftU/SiiIKeWpA9Eak4E+QxujlTElBDuPopvyZhZTjaroKZl4FS/4KMizN8ZcHYB1g45xIhdlUmwRMNVc/2MsfJ6Woummr9x4KNZTeEFMNtbSEgyhMhSxCjjkqovVgS+6ZsS7NpTee5q29Ex1clrS6QbDAlyLV5ZqsLowy7yn4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=bAAhwzUC; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="bAAhwzUC"
ARC-Seal: i=1; a=rsa-sha256; t=1745308920; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=COJ29c36q0W9rJlZpPKQj/DM5ommXK3jkmPGEXwZfWocHngu8qwjUGt16P8ir46JVemDIpr1Lbjxmy+eIeM7CIdmlGMEKFXr/KIlix95yaBn1qo6AiODQk8ZuwL6UXoLsYF36ZfB3sWVeRM7Femx1dCyI38vGgR8Y8hPqFwO5Bk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745308920; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6mPBiVFnMBSLEQBiB7ejAYxBvNS+aTxOvfgPKqFlMvQ=; 
	b=csEiTVOLb+B51Eb/koh/GCrHzP4hWM7pU1im/ycZcRHVXg6KjenYQbBN8nbRafd4EXLui04629P4nNO6d0bijFCfbk+AMgszzF8OvUzs/pvcRugZDcSvNfRfV4VkxM5yzGjAUUzzxiVjuugmHreGYt8gMrEgiofSriD3h/E3WRI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745308920;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=6mPBiVFnMBSLEQBiB7ejAYxBvNS+aTxOvfgPKqFlMvQ=;
	b=bAAhwzUCOjU5zWiE+U/WRrrtH+4sX6xxRjF038UmZy24ziE9e12NVYLB5gqqWYWD
	EEQ48uT9lWjVzeJlV4ZA2unaKrkDoVvjostZArHrCO+znqBO8yq3XrcMLhzfbxPeXCL
	7LXUgPBGSCQ5EhvxbC+qUU+3XLvmMZyziE6QEJRo=
Received: by mx.zohomail.com with SMTPS id 1745308911207291.1539466317503;
	Tue, 22 Apr 2025 01:01:51 -0700 (PDT)
Message-ID: <1d8c27be-95f9-4cb8-8d41-9c00faefd360@zohomail.com>
Date: Tue, 22 Apr 2025 16:01:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] clk: canaan: Add clock driver for Canaan K230
To: Chen Wang <unicorn_wang@outlook.com>,
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
 <MA0P287MB2262F6D556E48A73E317553AFEB82@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <MA0P287MB2262F6D556E48A73E317553AFEB82@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Feedback-ID: rr080112274dea12ec6ccc6dd99bc91d060000aefd79844fe964c4984d1679e7173f7d196f2534217bb33510:zu08011227ec8748633bac8b6e036383a9000005aa264c0151e1b4879e61bae576b94698c7d7b38446c7e127:rf0801122cc70354a17cfc9059e30fc54c000038c09917e1da792909550f566c9586f59d82f8bcdf35497d22df2fedddb2:ZohoMail
X-ZohoMailClient: External


On 2025/4/21 18:43, Chen Wang wrote:
> Hi, Xukai, I have some comments below.
>
> In general, my suggestion is that the code can be further optimized,
> especially in terms of readability.
>
>
> On 2025/4/15 22:25, Xukai Wang wrote:
>> This patch provides basic support for the K230 clock, which does not
>> cover all clocks.
>>
>> The clock tree of the K230 SoC consists of OSC24M, PLLs and sysclk.
>>
>> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
>> ---
>>   drivers/clk/Kconfig    |    6 +
>>   drivers/clk/Makefile   |    1 +
>>   drivers/clk/clk-k230.c | 1710
>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 1717 insertions(+)
>>
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index
>> 299bc678ed1b9fcd9110bb8c5937a1bd1ea60e23..1817b8883af9a3d00ac7af2cb88496274b591001
>> 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -464,6 +464,12 @@ config COMMON_CLK_K210
>>       help
>>         Support for the Canaan Kendryte K210 RISC-V SoC clocks.
>>   +config COMMON_CLK_K230
>> +    bool "Clock driver for the Canaan Kendryte K230 SoC"
>> +    depends on ARCH_CANAAN || COMPILE_TEST
>> +        help
>> +          Support for the Canaan Kendryte K230 RISC-V SoC clocks.
>> +
>>   config COMMON_CLK_SP7021
>>       tristate "Clock driver for Sunplus SP7021 SoC"
>>       depends on SOC_SP7021 || COMPILE_TEST
>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>> index
>> fb8878a5d7d93da6bec487460cdf63f1f764a431..5df50b1e14c701ed38397bfb257db26e8dd278b8
>> 100644
>> --- a/drivers/clk/Makefile
>> +++ b/drivers/clk/Makefile
>> @@ -51,6 +51,7 @@ obj-$(CONFIG_MACH_ASPEED_G6)        += clk-ast2600.o
>>   obj-$(CONFIG_ARCH_HIGHBANK)        += clk-highbank.o
>>   obj-$(CONFIG_CLK_HSDK)            += clk-hsdk-pll.o
>>   obj-$(CONFIG_COMMON_CLK_K210)        += clk-k210.o
>> +obj-$(CONFIG_COMMON_CLK_K230)        += clk-k230.o
>>   obj-$(CONFIG_LMK04832)            += clk-lmk04832.o
>>   obj-$(CONFIG_COMMON_CLK_LAN966X)    += clk-lan966x.o
>>   obj-$(CONFIG_COMMON_CLK_LOCHNAGAR)    += clk-lochnagar.o
>> diff --git a/drivers/clk/clk-k230.c b/drivers/clk/clk-k230.c
>> new file mode 100644
>> index
>> 0000000000000000000000000000000000000000..84a4a2a293e5f278d21510d73888aee4ff9351df
>> --- /dev/null
>> +++ b/drivers/clk/clk-k230.c
>> @@ -0,0 +1,1710 @@
> [......]
>> +
>> +struct k230_pll {
>> +    enum k230_pll_id id;
>> +    struct k230_sysclk *ksc;
>> +    void __iomem *div, *bypass, *gate, *lock;
>
> No need define these iomem address, just calculate them and use them
> when use them. The clock reading and writing efficiency requirements
> are not that high, so there is no need to waste memory for this.
>
I see, I'll drop these next version.
>
>> +    struct clk_hw hw;
>> +};
>> +
>> +#define to_k230_pll(_hw)    container_of(_hw, struct k230_pll, hw)
>> +
>> +struct k230_pll_cfg {
>> +    u32 reg;
>> +    const char *name;
>> +    struct k230_pll *pll;
>> +};
>
> Can we combine k230_pll and k230_pll_cfg into one to simplfy the code?
OK, and I think the role of k230_*_cfg is maybe some redundant, and I'm
considering remove them.
>
>> +
>> +struct k230_pll_div {
>> +    struct k230_sysclk *ksc;
>> +    struct clk_hw *hw;
>
> I see k230_clk use "struct clk_hw", but here we use "struct clk_hw*", 
> can we unify these?
The clk_hw in k230_pll_div is a pointer returned by
`clk_hw_register_fixed_factor()`, whereas the clk_hw in the PLL and in
regular clocks is the actual entity that gets populated by
`clk_hw_register()`.
>
> Just use "struct clk_hw" and init it as static global var should be
> enough, see drivers/clk/sophgo/clk-cv1800.c for example.
>
>> +};
>> +
>> +struct k230_pll_div_cfg {
>> +    const char *parent_name, *name;
>> +    int div;
>> +    struct k230_pll_div *pll_div;
>> +};
>> +
>> +enum k230_pll_div_id {
>> +    K230_PLL0_DIV2,
>> +    K230_PLL0_DIV3,
>> +    K230_PLL0_DIV4,
>> +    K230_PLL0_DIV16,
>> +    K230_PLL1_DIV2,
>> +    K230_PLL1_DIV3,
>> +    K230_PLL1_DIV4,
>> +    K230_PLL2_DIV2,
>> +    K230_PLL2_DIV3,
>> +    K230_PLL2_DIV4,
>> +    K230_PLL3_DIV2,
>> +    K230_PLL3_DIV3,
>> +    K230_PLL3_DIV4,
>> +    K230_PLL_DIV_NUM
>> +};
>> +
>> +enum k230_clk_div_type {
>> +    K230_MUL,
>> +    K230_DIV,
>> +    K230_MUL_DIV,
>> +};
> Please document what's meaning of MUL, DIV, and both? They are type
> for what?
OK, I'll add one to explain this.
>> +
>> +struct k230_clk {
>> +    int id;
>> +    struct k230_sysclk *ksc;
>> +    struct clk_hw hw;
>> +};
>> +
>> +#define to_k230_clk(_hw)    container_of(_hw, struct k230_clk, hw)
>> +
>> +struct k230_sysclk {
>> +    struct platform_device *pdev;
>> +    void __iomem           *pll_regs, *regs;
>> +    spinlock_t           pll_lock, clk_lock;
>> +    struct k230_pll           *plls;
>> +    struct k230_clk           *clks;
>> +    struct k230_pll_div    *dclks;
>> +};
>> +
>> +struct k230_clk_rate_cfg {
>> +    /* rate reg */
>> +    u32 rate_reg_off;
>> +    void __iomem *rate_reg;
>> +    /* rate info*/
>> +    u32 rate_write_enable_bit;
>> +    enum k230_clk_div_type method;
>> +    /* rate mul */
>> +    u32 rate_mul_min;
>> +    u32 rate_mul_max;
>> +    u32 rate_mul_shift;
>> +    u32 rate_mul_mask;
>> +    /* rate div */
>> +    u32 rate_div_min;
>> +    u32 rate_div_max;
>> +    u32 rate_div_shift;
>> +    u32 rate_div_mask;
>> +};
>> +
>> +struct k230_clk_rate_cfg_c {
>> +    /* rate_c reg */
>> +    u32 rate_reg_off_c;
>> +    void __iomem *rate_reg_c;
>> +
>> +    /* rate_c info */
>> +    u32 rate_write_enable_bit_c;
>> +
>> +    /* rate mul-changable */
>> +    u32 rate_mul_min_c;
>> +    u32 rate_mul_max_c;
>> +    u32 rate_mul_shift_c;
>> +    u32 rate_mul_mask_c;
>> +};
>> +
>
> What's "k230_clk_rate_cfg_c", and what's the difference against
> "k230_clk_gate_cfg". Please document it and clarify this.
>
> It is recommended to add documentation comments to important structure
> types and their members.
>
> Regarding how to document kernel code, see
> https://docs.kernel.org/doc-guide/kernel-doc.html.
OK, I'll try to clarify it next version.
>
> [......]
>
>
> This structure definition looks a bit complicated, with nested
> structure pointers. Can it be simplified, similar to struct
> k210_clk_cfg in drivers/clk/clk-k210.c?
>
> And can we use composite clk here?
I'm considering using clk_composite here.
>
> [......]
>
>> +static struct k230_clk_cfg k230_cpu0_src = {
>> +    .name = "cpu0_src",
>> +    .read_only = false,
>> +    .flags = 0,
>> +    .num_parent = 1,
>> +    .parent[0] = {
>> +        .type = K230_PLL_DIV,
>> +        .pll_div_cfg = &k230_pll_div_cfgs[K230_PLL0_DIV2],
>> +    },
>> +    .rate_cfg = &k230_cpu0_src_rate,
>> +    .rate_cfg_c = NULL,
>> +    .gate_cfg = &k230_cpu0_src_gate,
>> +    .mux_cfg = NULL,
>> +};
>> +
>> +static struct k230_clk_cfg k230_cpu0_aclk = {
>> +    .name = "cpu0_aclk",
>> +    .read_only = false,
>> +    .flags = 0,
>> +    .num_parent = 1,
>> +    .parent[0] = {
>> +        .type = K230_CLK_COMPOSITE,
>> +        .clk_cfg = &k230_cpu0_src,
>> +    },
>> +    .rate_cfg = &k230_cpu0_aclk_rate,
>> +    .rate_cfg_c = NULL,
>> +    .gate_cfg = NULL,
>> +    .mux_cfg = NULL,
>> +};
>> +
>
> Suggest use Macro to simplify the code here, see
> drivers/clk/sophgo/clk-cv1800.c for example.
I see, I' ll replace these init code with macro instead.
>
> [......]
>
>
