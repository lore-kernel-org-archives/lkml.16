Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D071465B4;
	Sat, 19 Apr 2025 10:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745059371; cv=pass; b=TWJT1AnzT0D7WwCjGTjRZUEG5/I5lb4aoX1EPyH/KE3R+H47EMe8np76XJo6+l3lRqZRiDzuM32e8s8kCMnJH7wcOmiBWS7PTxWvb83uLbfuxdPhY58UXREKNFuT0h3dQ2aUeNpd+4a8qROEgn01aQtm8XRQtp1ppuYS4vFKUaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745059371; c=relaxed/simple;
	bh=wqVkZ6ycmKk6/vhyBjk2Mzq/Qth/uF+VSBpWgteGoEo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pgCICYDMAKVfmCLtzYJxB6DrCeYJHzIh8kLnBLFOkJ+qRelHtldGrIaZ3FlJzv/cyRUTVO+6Vd1tsbgeu85Is+NDI6lPqsYkzCNahIbpBM3IgiYC4eUU2AuYbwu2+AhU9c0bPtN+Jw4ExwfBdTj/5rYPtSiuNls2WvwgL51G/Dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=KU3NMCtF; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="KU3NMCtF"
ARC-Seal: i=1; a=rsa-sha256; t=1745059349; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h9mrUJYrhVtw6E80ST+ApxGHKEOAvt/PU/P23CxjpsLBid/PIvF3pH0mKlWlAZ0NXmq2qkRPcf2EkPjHcnkIWWTFtup7rKI6ErK0n+FVmZ3/+Hxxto27OOViQklyxE7RQM1yxgz0siLzwNs3ss6DVE4ld/46H5y4u9HPRWZ3hQw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745059349; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZW4Zx1rg58mj53Fyo/IoJowIgF4TvufpVxdMkh9W8ZI=; 
	b=mr4eiO7e7BlbwvzdxbS+3+j82Crd28pUPrDvAN9m2FVWC4oGOdly145tQbHqxXAFnXFJh6ssyaOlUKlH3jv+HVwo2Ph4b2lAyEdl04mbPouHHlYd4QHFIb/qZhY5dWHK+Pkk3XQgaYl8qvxjUcL6ipyIg0primPfVU5qeTB3jtk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745059349;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:From:From:Subject:Subject:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=ZW4Zx1rg58mj53Fyo/IoJowIgF4TvufpVxdMkh9W8ZI=;
	b=KU3NMCtFwXhwcOcUZxM2nOKTR7pVN6td7M0tHAzrjNJkxu/8b5ykxLeIprSi3C7K
	xXAipQWDWg/VS43JolJ/Ne561OIRLGLtDRsN+7JiN67QZadtkFxbvmMb8dr20IQdg2/
	w586MP8/74jLHj4AMM+I5i/a16IZ+vcI93YgItOo=
Received: by mx.zohomail.com with SMTPS id 1745059341926458.9710550639943;
	Sat, 19 Apr 2025 03:42:21 -0700 (PDT)
Message-ID: <6dd81688-6f08-431a-af90-a1df2bc4d80f@zohomail.com>
Date: Sat, 19 Apr 2025 18:42:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Xukai Wang <kingxukai@zohomail.com>
Subject: Re: [PATCH v6 2/3] clk: canaan: Add clock driver for Canaan K230
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
 <20250415-b4-k230-clk-v6-2-7fd89f427250@zohomail.com>
 <aAJGCDmqNoSWrwXw@troy-wujie14-pro>
Content-Language: en-US
In-Reply-To: <aAJGCDmqNoSWrwXw@troy-wujie14-pro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: rr0801122783e34f079b36205d1e49e5f300004b7a3787c294245c229f1e3f79e6134a9573226a7967fb6eb3:zu08011227c4aba18b305b1a1f9d9990550000fbfcf4f5c48ed9ccc257a0733feb2e759701299094fe1f7236:rf0801122cb562e7522647b241f3b510110000ebd95758f7f333b009798f079914a3ccfd85737a05bb2da6fedc9b0b1158:ZohoMail
X-ZohoMailClient: External


On 2025/4/18 20:31, Troy Mitchell wrote:
> On Tue, Apr 15, 2025 at 10:25:12PM +0800, Xukai Wang wrote:
>> This patch provides basic support for the K230 clock, which does not
>> cover all clocks.
>>
>> The clock tree of the K230 SoC consists of OSC24M, PLLs and sysclk.
>>
>> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
>> ---
>>  drivers/clk/Kconfig    |    6 +
>>  drivers/clk/Makefile   |    1 +
>>  drivers/clk/clk-k230.c | 1710 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 1717 insertions(+)
>>
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index 299bc678ed1b9fcd9110bb8c5937a1bd1ea60e23..1817b8883af9a3d00ac7af2cb88496274b591001 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -464,6 +464,12 @@ config COMMON_CLK_K210
>>  	help
>>  	  Support for the Canaan Kendryte K210 RISC-V SoC clocks.
>>  
>> +config COMMON_CLK_K230
>> +	bool "Clock driver for the Canaan Kendryte K230 SoC"
>> +	depends on ARCH_CANAAN || COMPILE_TEST
>> +        help
>> +          Support for the Canaan Kendryte K230 RISC-V SoC clocks.
>> +
>>  config COMMON_CLK_SP7021
>>  	tristate "Clock driver for Sunplus SP7021 SoC"
>>  	depends on SOC_SP7021 || COMPILE_TEST
>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>> index fb8878a5d7d93da6bec487460cdf63f1f764a431..5df50b1e14c701ed38397bfb257db26e8dd278b8 100644
>> --- a/drivers/clk/Makefile
>> +++ b/drivers/clk/Makefile
>> @@ -51,6 +51,7 @@ obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
>>  obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
>>  obj-$(CONFIG_CLK_HSDK)			+= clk-hsdk-pll.o
>>  obj-$(CONFIG_COMMON_CLK_K210)		+= clk-k210.o
>> +obj-$(CONFIG_COMMON_CLK_K230)		+= clk-k230.o
>>  obj-$(CONFIG_LMK04832)			+= clk-lmk04832.o
>>  obj-$(CONFIG_COMMON_CLK_LAN966X)	+= clk-lan966x.o
>>  obj-$(CONFIG_COMMON_CLK_LOCHNAGAR)	+= clk-lochnagar.o
>> diff --git a/drivers/clk/clk-k230.c b/drivers/clk/clk-k230.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..84a4a2a293e5f278d21510d73888aee4ff9351df
>> --- /dev/null
>> +++ b/drivers/clk/clk-k230.c
>> @@ -0,0 +1,1710 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Kendryte Canaan K230 Clock Drivers
>> + *
>> + * Author: Xukai Wang <kingxukai@zohomail.com>
>> + * Author: Troy Mitchell <troymitchell988@gmail.com>
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clkdev.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/spinlock.h>
>> +#include <dt-bindings/clock/canaan,k230-clk.h>
>> +
>> +/* PLL control register bits. */
>> +#define K230_PLL_BYPASS_ENABLE				BIT(19)
>> +#define K230_PLL_GATE_ENABLE				BIT(2)
>> +#define K230_PLL_GATE_WRITE_ENABLE			BIT(18)
>> +#define K230_PLL_OD_SHIFT				24
>> +#define K230_PLL_OD_MASK				0xF
>> +#define K230_PLL_R_SHIFT				16
>> +#define K230_PLL_R_MASK					0x3F
>> +#define K230_PLL_F_SHIFT				0
>> +#define K230_PLL_F_MASK					0x1FFFF
>> +#define K230_PLL0_OFFSET_BASE				0x00
>> +#define K230_PLL1_OFFSET_BASE				0x10
>> +#define K230_PLL2_OFFSET_BASE				0x20
>> +#define K230_PLL3_OFFSET_BASE				0x30
>> +#define K230_PLL_DIV_REG_OFFSET				0x00
>> +#define K230_PLL_BYPASS_REG_OFFSET			0x04
>> +#define K230_PLL_GATE_REG_OFFSET			0x08
>> +#define K230_PLL_LOCK_REG_OFFSET			0x0C
> why we call it `K230_PLL_LOCK_REG_OFFSET`?
> I noticed that the datasheet refers to it as PLL0_STAT,
> with the description PLL0 status.
> Would it be better to keep the original name for consistency?
>
> Only bit 0 is the lock bit, and I'll talk more about that later.

The reason I named the macro K230_PLL_LOCK_REG_OFFSET rather than
PLL0_STAT from the datasheet is because in this particular clock driver,
I only need to use the lock bit (bit 0) and not the other bits of the
register.

In Linux, there isn't a common header for K230 that defines macros for
these specific bits yet, and since this register is only used within the
context of this driver, I decided to name it K230_PLL0_LOCK_REG to be
more specific to the functionality being used here.

This way, the name reflects the exact purpose in this driver, and it
avoids confusion with the other bits that are not relevant for this
particular case.

>> +
>> +/* PLL lock register bits.  */
>> +#define K230_PLL_STATUS_MASK				BIT(0)
> this bit is pll0_lock
> ```
> PLL 0 current lock status.
> 0x0: PLL not in lock state;
> 0x1: PLL in lock state.
> ```
> how about we call it `K230_PLL_LOCK_STATUS_MASK`
Seems more appropriate.
>> +
>> +/* K230 CLK registers offset */
>> +#define K230_CLK_AUDIO_CLKDIV_OFFSET			0x34
>> +#define K230_CLK_PDM_CLKDIV_OFFSET			0x40
>> +#define K230_CLK_CODEC_ADC_MCLKDIV_OFFSET		0x38
>> +#define K230_CLK_CODEC_DAC_MCLKDIV_OFFSET		0x3c
>> +
>> +/* K230 CLK OPS. */
> unuseful comment
OK.
>> +#define K230_CLK_OPS_GATE				\
>> +	.enable		= k230_clk_enable,		\
>> +	.disable	= k230_clk_disable,		\
>> +	.is_enabled	= k230_clk_is_enabled
>> +
>> +#define K230_CLK_OPS_RATE				\
>> +	.set_rate	= k230_clk_set_rate,		\
>> +	.round_rate	= k230_clk_round_rate,		\
>> +	.recalc_rate	= k230_clk_get_rate
>> +
>> +#define K230_CLK_OPS_MUX				\
>> +	.set_parent	= k230_clk_set_parent,		\
>> +	.get_parent	= k230_clk_get_parent,		\
>> +	.determine_rate	= clk_hw_determine_rate_no_reparent
>> +
>> +#define K230_CLK_OPS_ID_NONE				0
>> +#define K230_CLK_OPS_ID_GATE_ONLY			1
>> +#define K230_CLK_OPS_ID_RATE_ONLY			2
>> +#define K230_CLK_OPS_ID_RATE_GATE			3
>> +#define K230_CLK_OPS_ID_MUX_ONLY			4
>> +#define K230_CLK_OPS_ID_MUX_GATE			5
>> +#define K230_CLK_OPS_ID_MUX_RATE			6
>> +#define K230_CLK_OPS_ID_ALL				7
>> +#define K230_CLK_OPS_ID_NUM				8
>> +
>> +/* K230 CLK MACROS */
> unuseful comment
OK.
>> +#define K230_CLK_MAX_PARENT_NUM				6
> ...
>
>> +
>> +struct k230_clk_rate_cfg {
>> +	/* rate reg */
>> +	u32 rate_reg_off;
>> +	void __iomem *rate_reg;
>> +	/* rate info*/
>> +	u32 rate_write_enable_bit;
>> +	enum k230_clk_div_type method;
>> +	/* rate mul */
>> +	u32 rate_mul_min;
>> +	u32 rate_mul_max;
>> +	u32 rate_mul_shift;
>> +	u32 rate_mul_mask;
>> +	/* rate div */
>> +	u32 rate_div_min;
>> +	u32 rate_div_max;
>> +	u32 rate_div_shift;
>> +	u32 rate_div_mask;
>> +};
> unuseful comments in this structure
>
>> +
>> +struct k230_clk_rate_cfg_c {
>> +	/* rate_c reg */
>> +	u32 rate_reg_off_c;
>> +	void __iomem *rate_reg_c;
>> +
>> +	/* rate_c info */
>> +	u32 rate_write_enable_bit_c;
>> +
>> +	/* rate mul-changable */
>> +	u32 rate_mul_min_c;
>> +	u32 rate_mul_max_c;
>> +	u32 rate_mul_shift_c;
>> +	u32 rate_mul_mask_c;
>> +};
> unuseful comments in this structure
>
>> +
>> +struct k230_clk_gate_cfg {
>> +	/* gate reg */
>> +	u32 gate_reg_off;
>> +	void __iomem *gate_reg;
> unuseful comment
>
>> +
>> +	/* gate info*/
>> +	u32 gate_bit_enable;
>> +	bool gate_bit_reverse;
>> +};
>> +
>> +struct k230_clk_mux_cfg {
>> +	/* mux reg */
>> +	u32 mux_reg_off;
> unuseful comment
>
>> +	void __iomem *mux_reg;
>> +
>> +	/* mux info */
>> +	u32 mux_reg_shift;
>> +	u32 mux_reg_mask;
>> +};
>> +
>> +enum k230_clk_parent_type {
>> +	K230_OSC24M,
>> +	K230_PLL,
>> +	K230_PLL_DIV,
>> +	K230_CLK_COMPOSITE,
>> +};
>> +
>> +struct k230_clk_cfg;
>> +
>> +struct k230_clk_parent {
>> +	enum k230_clk_parent_type type;
>> +	union {
>> +		struct k230_pll_cfg	*pll_cfg;
>> +		struct k230_pll_div_cfg	*pll_div_cfg;
>> +		struct k230_clk_cfg	*clk_cfg;
>> +	};
>> +};
>> +
>> +struct k230_clk_cfg {
>> +	/* attr */
>> +	const char *name;
> unuseful comment
>
>> +
>> +	/* 0-read & write; 1-read only */
>> +	bool read_only;
> unuseful comment
>
>> +	int num_parent;
>> +	struct k230_clk_parent parent[K230_CLK_MAX_PARENT_NUM];
>> +	struct k230_clk *clk;
>> +	int flags;
>> +
>> +	/* cfgs */
> unuseful comment
>
>> +	struct k230_clk_rate_cfg	*rate_cfg;
>> +	struct k230_clk_rate_cfg_c	*rate_cfg_c;
>> +	struct k230_clk_gate_cfg	*gate_cfg;
>> +	struct k230_clk_mux_cfg		*mux_cfg;
>> +};
>>
> ...
>
>> +static struct k230_clk_cfg k230_shrm_pdma_axi = {
>> +		.name = "shrm_pdma_axi",
>> +		.read_only = false,
>> +		.flags = 0,
>> +		.num_parent = 1,
>> +		.parent[0] = {
>> +			.type = K230_CLK_COMPOSITE,
>> +			.clk_cfg = &k230_shrm_axi_src,
>> +		},
>> +		.rate_cfg = NULL,
>> +		.rate_cfg_c = NULL,
>> +		.gate_cfg = &k230_shrm_pdma_axi_gate,
>> +		.mux_cfg = NULL,
>> +};
> Consider defining a macro to generate those structures?
Yes, I'll define a macro to generate that next version.
> ...
>
>> +static int k230_pll_prepare(struct clk_hw *hw)
>> +{
>> +	struct k230_pll *pll = to_k230_pll(hw);
>> +	u32 reg;
>> +
>> +	/* wait for PLL lock until it reaches lock status */
>> +	return readl_poll_timeout(pll->lock, reg,
>> +				  (reg & K230_PLL_STATUS_MASK) == K230_PLL_STATUS_MASK,
> (reg & K230_PLL_STATUS_MASK),
OK.
>> +				  400, 0);
>> +}
>> +
>> +static bool k230_pll_hw_is_enabled(struct k230_pll *pll)
>> +{
>> +	return (readl(pll->gate) & K230_PLL_GATE_ENABLE) == K230_PLL_GATE_ENABLE;
> return !!(readl(pll->gate) & K230_PLL_GATE_ENABLE);
OK.
>> +}
>> +
>> +static void k230_pll_enable_hw(void __iomem *regs, struct k230_pll *pll)
>> +{
>> +	u32 reg;
>> +
>> +	if (k230_pll_hw_is_enabled(pll))
>> +		return;
>> +
>> +	/* Set PLL factors */
>> +	reg = readl(pll->gate);
>> +	reg |= (K230_PLL_GATE_ENABLE | K230_PLL_GATE_WRITE_ENABLE);
> reg |= K230_PLL_GATE_ENABLE | K230_PLL_GATE_WRITE_ENABLE;
OK.
>
>> +	writel(reg, pll->gate);
>> +}
>> +
>> +static int k230_pll_enable(struct clk_hw *hw)
>> +{
>> +	struct k230_pll *pll = to_k230_pll(hw);
>> +	struct k230_sysclk *ksc = pll->ksc;
>> +
>> +	guard(spinlock)(&ksc->pll_lock);
>> +	k230_pll_enable_hw(ksc->regs, pll);
>> +
>> +	return 0;
>> +}
>> +
>> +static void k230_pll_disable(struct clk_hw *hw)
>> +{
>> +	struct k230_pll *pll = to_k230_pll(hw);
>> +	struct k230_sysclk *ksc = pll->ksc;
>> +	u32 reg;
>> +
>> +	guard(spinlock)(&ksc->pll_lock);
> blank line here
OK.
>
>> +	reg = readl(pll->gate);
>> +	reg &= ~(K230_PLL_GATE_ENABLE);
>> +	reg |= (K230_PLL_GATE_WRITE_ENABLE);
>> +	writel(reg, pll->gate);
>> +}
>> +
>> +static int k230_pll_is_enabled(struct clk_hw *hw)
> inline here
It's one of the implementation of callback function in clk_ops, which
doesn't need the inline tag.
>> +{
>> +	return k230_pll_hw_is_enabled(to_k230_pll(hw));
>> +}
>> +
>> +static int k230_pll_init(struct clk_hw *hw)
>> +{
>> +	if (k230_pll_is_enabled(hw))
>> +		return clk_prepare_enable(hw->clk);
>> +
>> +	return 0;
>> +}
>> +
> ...
>> +	if (gate_cfg->gate_bit_reverse)
>> +		reg |= BIT(gate_cfg->gate_bit_enable);
>> +	else
>> +		reg &= ~BIT(gate_cfg->gate_bit_enable);
>> +
> drop blank line
OK.
>> +	writel(reg, gate_cfg->gate_reg);
>> +}
>> +
>> +	/* Check gate bit condition based on configuration and then set ret */
>> +	if (gate_cfg->gate_bit_reverse)
>> +		return (BIT(gate_cfg->gate_bit_enable) & reg) ? 1 : 0;
>> +	else
> drop else
OK.
>> +	reg = (mux_cfg->mux_reg_mask & index) << mux_cfg->mux_reg_shift;
>> +	writeb(reg, mux_cfg->mux_reg);
>> +
>> +	return 0;
>> +}
>> +
>> +static u8 k230_clk_get_parent(struct clk_hw *hw)
>> +{
>> +	struct k230_clk *clk = to_k230_clk(hw);
>> +	struct k230_sysclk *ksc = clk->ksc;
>> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
>> +	struct k230_clk_mux_cfg *mux_cfg = cfg->mux_cfg;
>> +	u8 reg;
>> +
>> +	guard(spinlock)(&ksc->clk_lock);
>> +	reg = readb(mux_cfg->mux_reg);
>> +
>> +	return reg;
> return readb(mux_cfg->mux_reg);
OK, it can be merged into one line.
>> +}
>> +
>> +static unsigned long k230_clk_get_rate(struct clk_hw *hw,
>> +				       unsigned long parent_rate)
>> +{
>> +	struct k230_clk *clk = to_k230_clk(hw);
>> +	struct k230_sysclk *ksc = clk->ksc;
>> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
>> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
>> +	struct k230_clk_rate_cfg_c *rate_cfg_c = cfg->rate_cfg_c;
>> +	u32 mul, div;
>> +
>> +	if (!rate_cfg) /* no divider, return parents' clk */
> wrong comment style
Apologies for my fault to ignore this comment here.
>> +		return parent_rate;
>> +
>> +	guard(spinlock)(&ksc->clk_lock);
> blank line here
OK.
>> +	switch (rate_cfg->method) {
>>
>> +	/* mul and div can be changeable. */
>> +	case K230_MUL_DIV:
>> +		if (rate_cfg->rate_reg_off == K230_CLK_CODEC_ADC_MCLKDIV_OFFSET ||
>> +		    rate_cfg->rate_reg_off == K230_CLK_CODEC_DAC_MCLKDIV_OFFSET) {
>> +			for (u32 j = 0; j < 9; j++) {
>> +				if (0 == (rate - codec_clk[j])) {
> if (rate - codec_clk[j] == 0)
>
>> +					*div = codec_div[j][0];
>> +					*mul = codec_div[j][1];
>> +				}
>> +			}
>> +		} else if (rate_cfg->rate_reg_off == K230_CLK_AUDIO_CLKDIV_OFFSET ||
>> +			   rate_cfg->rate_reg_off == K230_CLK_PDM_CLKDIV_OFFSET) {
>> +			for (u32 j = 0; j < 20; j++) {
>> +				if (0 == (rate - pdm_clk[j])) {
> if (rate - pdm_clk[j] == 0)
OK, I'll change the order.
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static long k230_clk_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *parent_rate)
>> +{
>> +	struct k230_clk *clk = to_k230_clk(hw);
>> +	struct k230_sysclk *ksc = clk->ksc;
>> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
>> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
>> +	u32 div = 0, mul = 0;
>> +
>> +	if (k230_clk_find_approximate(clk,
>> +				      rate_cfg->rate_mul_min, rate_cfg->rate_mul_max,
>> +				      rate_cfg->rate_div_min, rate_cfg->rate_div_max,
>> +				      rate_cfg->method, rate, *parent_rate, &div, &mul)) {
>> +		return 0;
>> +	}
> removing the curly braces
OK.
>> +
>> +	return mul_u64_u32_div(*parent_rate, mul, div);
>> +}
>> +
>> +static int k230_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>> +			     unsigned long parent_rate)
>> +{
>> +	struct k230_clk *clk = to_k230_clk(hw);
>> +	struct k230_sysclk *ksc = clk->ksc;
>> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
>> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
>> +	struct k230_clk_rate_cfg_c *rate_cfg_c = cfg->rate_cfg_c;
>> +	u32 div = 0, mul = 0, reg = 0, reg_c;
>> +
>> +	if (rate > parent_rate || rate == 0 || parent_rate == 0) {
>> +		dev_err(&ksc->pdev->dev, "rate or parent_rate error\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (cfg->read_only) {
>> +		dev_err(&ksc->pdev->dev, "This clk rate is read only\n");
>> +		return -EPERM;
>> +	}
>> +
>> +	if (k230_clk_find_approximate(clk,
>> +				      rate_cfg->rate_mul_min, rate_cfg->rate_mul_max,
>> +				      rate_cfg->rate_div_min, rate_cfg->rate_div_max,
>> +				      rate_cfg->method, rate, parent_rate, &div, &mul)) {
>> +		return -EINVAL;
>> +	}
>> +
>> +	guard(spinlock)(&ksc->clk_lock);
> blank line here
>
> put `reg = readl(rate_cfg->rate_reg);` here
Yes, it should be merged into one line.
>> +	if (!rate_cfg_c) {
>> +		reg = readl(rate_cfg->rate_reg);
>> +		reg &= ~((rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift));
>> +
>> +		if (rate_cfg->method == K230_DIV) {
>> +			reg &= ~((rate_cfg->rate_mul_mask) << (rate_cfg->rate_mul_shift));
>> +			reg |= ((div - 1) & rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift);
>> +		} else if (rate_cfg->method == K230_MUL) {
>> +			reg |= ((mul - 1) & rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift);
>> +		} else {
>> +			reg |= (mul & rate_cfg->rate_mul_mask) << (rate_cfg->rate_mul_shift);
>> +			reg |= (div & rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift);
>> +		}
>> +		reg |= BIT(rate_cfg->rate_write_enable_bit);
>> +	} else {
>> +		reg = readl(rate_cfg->rate_reg);
>> +		reg_c = readl(rate_cfg_c->rate_reg_c);
>> +		reg &= ~((rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift));
>> +		reg_c &= ~((rate_cfg_c->rate_mul_mask_c) << (rate_cfg_c->rate_mul_shift_c));
>> +		reg_c |= BIT(rate_cfg_c->rate_write_enable_bit_c);
>> +
>> +		reg_c |= (mul & rate_cfg_c->rate_mul_mask_c) << (rate_cfg_c->rate_mul_shift_c);
>> +		reg |= (div & rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift);
> This is a bit confusing. Please read and operate one at a time.
> It's better to read reg_c as the second one,
> so it can be merged with the write operation to maintain the R/M/W principle.
OK, I'll modify it.
>> +
>> +		writel(reg_c, rate_cfg_c->rate_reg_c);
>> +	}
>> +	writel(reg, rate_cfg->rate_reg);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct clk_ops k230_clk_ops_arr[K230_CLK_OPS_ID_NUM] = {
>> +	[K230_CLK_OPS_ID_NONE] = {
>> +		/* Sentinel */
>> +	},
>> +	[K230_CLK_OPS_ID_GATE_ONLY] = {
>> +		K230_CLK_OPS_GATE,
>> +	},
>> +	[K230_CLK_OPS_ID_RATE_ONLY] = {
>> +		K230_CLK_OPS_RATE,
>> +	},
>> +	[K230_CLK_OPS_ID_RATE_GATE] = {
>> +		K230_CLK_OPS_RATE,
>> +		K230_CLK_OPS_GATE,
>> +	},
>> +	[K230_CLK_OPS_ID_MUX_ONLY] = {
>> +		K230_CLK_OPS_MUX,
>> +	},
>> +	[K230_CLK_OPS_ID_MUX_GATE] = {
>> +		K230_CLK_OPS_MUX,
>> +		K230_CLK_OPS_GATE,
>> +	},
>> +	[K230_CLK_OPS_ID_MUX_RATE] = {
>> +		K230_CLK_OPS_MUX,
>> +		K230_CLK_OPS_RATE,
>> +	},
>> +	[K230_CLK_OPS_ID_ALL] = {
>> +		K230_CLK_OPS_MUX,
>> +		K230_CLK_OPS_RATE,
>> +		K230_CLK_OPS_GATE,
>> +	},
>> +};
>> +
>> +static int k230_register_clk(struct platform_device *pdev,
>> +			     struct k230_sysclk *ksc,
>> +			     int id,
>> +			     const struct clk_parent_data *parent_data,
>> +			     u8 num_parents,
>> +			     unsigned long flags)
>> +{
>> +	struct k230_clk *clk = &ksc->clks[id];
>> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[id];
>> +	struct k230_clk_gate_cfg *gate_cfg = cfg->gate_cfg;
>> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
>> +	struct k230_clk_mux_cfg *mux_cfg = cfg->mux_cfg;
>> +	struct k230_clk_rate_cfg_c *rate_cfg_c = cfg->rate_cfg_c;
>> +	struct clk_init_data init = {};
>> +	int clk_id = 0;
>> +	int ret;
>> +
>> +	if (rate_cfg) {
>> +		rate_cfg->rate_reg = ksc->regs + rate_cfg->rate_reg_off;
>> +		clk_id += K230_CLK_OPS_ID_RATE_ONLY;
>> +	}
>> +
>> +	if (mux_cfg) {
>> +		mux_cfg->mux_reg = ksc->regs + mux_cfg->mux_reg_off;
>> +		clk_id += K230_CLK_OPS_ID_MUX_ONLY;
>> +
>> +		/* mux clock doesn't match the case that num_parents less than 2 */
>> +		if (num_parents < 2)
>> +			return -EINVAL;
>> +	}
>> +
>> +	if (gate_cfg) {
>> +		gate_cfg->gate_reg = ksc->regs + gate_cfg->gate_reg_off;
>> +		clk_id += K230_CLK_OPS_ID_GATE_ONLY;
>> +	}
>> +
>> +	if (rate_cfg_c)
>> +		rate_cfg_c->rate_reg_c = ksc->regs + rate_cfg_c->rate_reg_off_c;
>> +
>> +	init.name = k230_clk_cfgs[id]->name;
>> +	init.flags = flags;
>> +	init.parent_data = parent_data;
>> +	init.num_parents = num_parents;
>> +	init.ops = &k230_clk_ops_arr[clk_id];
>> +
>> +	clk->id = id;
>> +	clk->ksc = ksc;
>> +	clk->hw.init = &init;
>> +
>> +	ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
>> +	if (ret)
>> +		return ret;
>> +
>> +	k230_clk_cfgs[id]->clk = clk;
>> +
>> +	return 0;
>> +}
>> +
>> +static int k230_register_mux_clk(struct platform_device *pdev,
> consider adding inline here?
Yeah, it's appropriate to add a inline here.
>> +	return k230_register_clk(pdev, ksc, id, &parent_data, 1, flags);
>> +}
>> +
>> +static int k230_register_clk_child(struct platform_device *pdev,
>> +				   struct k230_sysclk *ksc,
>> +				   int id,
>> +				   struct clk_hw *parent_hw)
>> +{
>> +	const struct clk_parent_data parent_data = {
>> +		.hw = parent_hw,
>> +	};
> blank line here
>
>           - Troy
>
>> +	return k230_register_clk(pdev, ksc, id, &parent_data, 1, 0);
>> +}
OK.
