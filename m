Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886F428C842;
	Mon,  7 Jul 2025 09:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879626; cv=none; b=EzkCc75vpnwf5Cnk3gi4hO6o+4YT2xGDuOluEyfuKlxkxAO0BRcz6NyOVCIATaaGZ+C9Bq4HDsCDetF0OJ5aL/dOyWRXv9xhzJe/rjN4nVoNlHsP8SHvtxhvlWducV7S2DCxyVy1MhwqxzJnloczI2JYfSOYcuV9ptrP6y8XCYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879626; c=relaxed/simple;
	bh=VxWb9ClYaQ0tUSMMHZMFFpTJUoUaGZ89qkS2ityEPSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPfBbSLr9SZHUmPPP/Q7YLdfU2oV54923Wz+TOFfTpH52le4mfFJ0MYbFsAgQeLk6CI30jVVJwNWkJ7yJaeiENbq/fa1Kae+4TYqEGCRDTmF7ht8sE1SMrjD9EqRW06i6qpRjQZQFixdFEJw8TzQ9iFHy1Few3HPGwtGId4eg8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fh/Kk4Ql; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fh/Kk4Ql"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74b54cead6cso1730193b3a.1;
        Mon, 07 Jul 2025 02:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751879624; x=1752484424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7z3PeVsDV4mwssMrWnfKThBOf0JLCmmAuKkia3aAdB4=;
        b=Fh/Kk4QljR/4Sld71tQMQkHWE6HWYGPXzvzwIRBM6yy8kSOyiIeD2AjI7H4REcxUez
         71/8l6MKYUI+pROiS1pj97YqUfcRfPymjCMnRzc4TtI2UeWrQIdFG418fICuiVqfOD5o
         pwzBzFASnJMFnSZLLwFW6SOPENmXLu8vVfHBnaR6jMwqg+Avrk/uvzIDLaRQh+ggUx2t
         uJmGSSOGg1ArLLwEK6tVhaFfHP1z8bHGZypxWHfPkcVqeIg1HwbJ3o6TmRVAL54Klv3n
         NcnPwRCoY/ReamIVWZ3PnkuK/b49xH4P+s9KIg3GqBIohym+RpkCirbxxzYM8VDU0hNC
         Dcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879624; x=1752484424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7z3PeVsDV4mwssMrWnfKThBOf0JLCmmAuKkia3aAdB4=;
        b=tCx7QyOIfv2bcDF69ezswc3V5Dl6GieO9oMFzs0t8Rf8NRR589v3Wdnqo2+xwiOLAZ
         IAnA+H6wcV+qCi/Tl4k3yfET8K5LlpzlXX3CHglEycJTbISw0TVjUB/L2MCJSSbbm1j7
         otDQPvT4yPmGxrlJdTj+8w8GyYPCgb4WgwBqXygP0u8ztm+3DfSyhISIa09s6tBGBcSJ
         mL4ipZwR8n8OikqJqPOLr0c1PyukmXSqOLHCMjm9ff4t0q9VDc4LcEALPNZVReWLEhNL
         PoOx4nVdhW4+YV29jJCANBAEhwUtz8NX8U6DgaCMyZZru6f1heU+IlyiUsMYPD3jLUiF
         c/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUHbQW2Bk4C3ncSQWMCPsq9bjqfgD8TC5Orqr+cHyH7aGMnLzTFUAbbQtnnDFYB/dw4oSjF7TW4MVjLmSlz@vger.kernel.org, AJvYcCVncZdqFQTGJ6fe+XF1Uvi5NkcfwvRXnuyb6m4dHz7DXcPP1Tl9rcxTYEdJxye3kAEn+O6VPPddjUNC@vger.kernel.org, AJvYcCXu5JfTWBCiHRKnR32VI6pXw+iiD/gvVLna9PKQoBV05vaysL0waa2r8OvRW+/albEtAtCq1LO5uik4@vger.kernel.org
X-Gm-Message-State: AOJu0YzxyHoTY//J7spT4poqhD3995IsWvJgV7lU2jz+CeRvE+OTWAtu
	r/6xJ+IajNbpCTx9BwjEfEnDeq8K1CmpwrQawOMiHtfr+r7P6V2a/rgU
X-Gm-Gg: ASbGncv+cRfq1ioyVf5MAY4jtBcQWu3433q/zoywTOTf3v64Jupbe0BYqc8gIG4u71z
	uoBdGYlFWwPs32/JMCAoRduynn46VV/T5M0TBi+V6FxGeSZBUVPsTL/jEvDloLNXPoLa7Rfi3kO
	3XiBDySkAv0TY4Nr2pBR7rK3FmfC3dPKQKWb2vU60ZBPTsmALKEQvEvP+jmoHJaIVYdfGjvAkkp
	ana0Ye47H3jFdkQOR0gLyZz4pt7Tcfoq9y5ptDHe3epo740Eo/ez+wLcE1328hVwPGxf4e5F6v0
	STs3VvFsR0Q8RQTJAE/6D0SWGtgmnLS8iZxfVgDMhK0gv8LQNlKrUlJARvUZWXX5
X-Google-Smtp-Source: AGHT+IFZAddkNO070h7z8OnlxvJ2mKlymD9AbrUQxmLTj1dTZjXmu880boJLXUjHu/eC0e+cp0N0kg==
X-Received: by 2002:a05:6a00:b89:b0:748:1bac:ad5f with SMTP id d2e1a72fcca58-74ce65a909fmr15607998b3a.12.1751879623715;
        Mon, 07 Jul 2025 02:13:43 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.142])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce359d65csm9290142b3a.17.2025.07.07.02.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:13:43 -0700 (PDT)
Message-ID: <0f3aff5b-ff54-48a2-ae95-b344d311c3a1@gmail.com>
Date: Mon, 7 Jul 2025 02:12:51 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] clock: eswin: Add eic7700 clock driver
To: dongxuyang@eswincomputing.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 huangyifeng@eswincomputing.com
References: <20250624103212.287-1-dongxuyang@eswincomputing.com>
 <20250624103314.400-1-dongxuyang@eswincomputing.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20250624103314.400-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xuyang,

I'm an active user of the EIC7700 SoC. I'd like to see these drivers upstreamed,
but surely it needs some significant improvements before somebody yelling at you
again. Right now the code is nowhere near the acceptance level of upstream
developers. Let me name a few issues:

On 6/24/25 03:33, dongxuyang@eswincomputing.com wrote:
> +
> +/*
> + * The hardware decides value 0, 1 and 2 both means 2 divsor, so we add these tables.
> + * When using these tables, the clock framework will use the last member
> + * being 0 as a marker to indicate the end of the table,
> + * So an additional member is required.
> + */
> +static struct clk_div_table u_3_bit_special_div_table[8 + 1];
> +static struct clk_div_table u_4_bit_special_div_table[16 + 1];
> +static struct clk_div_table u_6_bit_special_div_table[64 + 1];
> +static struct clk_div_table u_7_bit_special_div_table[128 + 1];
> +static struct clk_div_table u_8_bit_special_div_table[256 + 1];
> +static struct clk_div_table u_11_bit_special_div_table[2048 + 1];
> +static struct clk_div_table u_16_bit_special_div_table[65536 + 1];

I'm not sure if having such huge array is the right way to do it. For the last
table alone you are adding 0.5MB of data section, which I think it's too much.
There should be a way to do it more elegantly.

> +static int eswin_cpu_clk_init(struct platform_device *pdev)
> +{
> +	struct clk *cpu_clk;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	u32 default_freq;
> +	int ret = 0;
> +	char name[128] = { 0 };
> +
> +	ret = of_property_read_u32(np, "cpu-default-frequency", &default_freq);
> +	if (ret) {
> +		dev_info(dev, "cpu-default-frequency not set\n");
> +		return ret;
> +	}
> +	sprintf(name, "%s", "clk_cpu_ext_src_core_clk_0");
> +
> +	cpu_clk = __clk_lookup(name);
> +	if (!cpu_clk)
> +		return dev_err_probe(dev, -EINVAL, "Failed to lookup CPU clock\n");
> +
> +	ret = clk_set_rate(cpu_clk, default_freq);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set CPU frequency\n");
> +
> +	return 0;
> +}
> ...
> +static bool cpu_no_boost_1_6ghz;
> +static int __init cpu_no_boost_1_6ghz_setup(char *__unused)
> +{
> +	cpu_no_boost_1_6ghz = true;
> +	return 1;
> +}
> +__setup("cpu_no_boost_1_6ghz", cpu_no_boost_1_6ghz_setup);
> +
> +#define to_pll_clk(_hw) container_of(_hw, struct eswin_clk_pll, hw)
> +static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct eswin_clk_pll *clk = to_pll_clk(hw);
> +	u32 frac_val = 0, postdiv1_val, fbdiv_val, refdiv_val;
> +	u32 val;
> +	int ret;
> +	struct clk *clk_cpu_mux = NULL;
> +	struct clk *clk_cpu_lp_pll = NULL;
> +	struct clk *clk_cpu_pll = NULL;
> +	int try_count = 0;
> +	bool lock_flag = false;
> +	char clk_cpu_mux_name[50] = { 0 };
> +	char clk_cpu_lp_pll_name[50] = { 0 };
> +	char clk_cpu_pll_name[50] = { 0 };
> +	enum voltage_level cpu_target_volatge;
> +
> +	ret = eswin_calc_pll(&frac_val, &postdiv1_val, &fbdiv_val, &refdiv_val,
> +			     (u64)rate, clk);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * we must switch the cpu to other clk before we change the cpu pll
> +	 */
> +	if (clk->id == EIC7700_PLL_CPU) {
> +		sprintf(clk_cpu_mux_name, "%s",
> +			"mux_u_cpu_root_3mux1_gfree");
> +		sprintf(clk_cpu_lp_pll_name, "%s",
> +			"clk_clk_u84_core_lp");
> +		sprintf(clk_cpu_pll_name, "%s", "clk_pll_cpu");
> +
> +		clk_cpu_mux = __clk_lookup(clk_cpu_mux_name);
> +		if (!clk_cpu_mux) {
> +			pr_err("%s %d, failed to get %s\n", __func__, __LINE__,
> +			       clk_cpu_mux_name);
> +			return -EINVAL;
> +		}
> +		clk_cpu_lp_pll = __clk_lookup(clk_cpu_lp_pll_name);
> +		if (!clk_cpu_lp_pll) {
> +			pr_err("%s %d, failed to get %s\n", __func__, __LINE__,
> +			       clk_cpu_lp_pll_name);
> +			return -EINVAL;
> +		}
> +		ret = clk_prepare_enable(clk_cpu_lp_pll);
> +		if (ret) {
> +			pr_err("%s %d, failed to enable %s, ret %d\n", __func__,
> +			       __LINE__, clk_cpu_lp_pll_name, ret);
> +			return ret;
> +		}
> +		clk_cpu_pll = __clk_lookup(clk_cpu_pll_name);
> +		if (!clk_cpu_pll) {
> +			pr_err("%s %d, failed to get %s\n", __func__, __LINE__,
> +			       clk_cpu_pll_name);
> +			clk_disable_unprepare(clk_cpu_lp_pll);
> +			return -EINVAL;
> +		}
> +
> +		ret = clk_set_parent(clk_cpu_mux, clk_cpu_lp_pll);
> +		if (ret) {
> +			pr_err("%s %d, failed to switch %s to %s, ret %d\n",
> +			       __func__, __LINE__, clk_cpu_mux_name,
> +			       clk_cpu_lp_pll_name, ret);
> +			clk_disable_unprepare(clk_cpu_lp_pll);
> +			return -EPERM;
> +		}
> +		/*
> +		 * The CPU clock has now switched to the LP_PLL,
> +		 * so we can adjust the CPU's supply voltage
> +		 * If the board cpu voltage does not support boosting to 0.9V,
> +		 * then the frequency cannot exceed 1.6GHz.
> +		 */
> +		switch (rate) {
> +		case CLK_FREQ_1800M:
> +		case CLK_FREQ_1700M:
> +			cpu_target_volatge = VOLTAGE_0_9V;
> +			ret = eswin_clk_set_cpu_volatge(clk->cpu_voltage_gpio,
> +							cpu_target_volatge);
> +			if (ret) {
> +				pr_warn("failed to change cpu volatge to %d mV, not support rate %ld\n",
> +					cpu_target_volatge, rate);
> +				goto switch_back;
> +			} else {
> +				if (clk->cpu_current_volatge !=
> +				    cpu_target_volatge) {
> +					pr_info("cpu volatge change to %d mV, target rate %ld\n",
> +						cpu_target_volatge, rate);
> +					clk->cpu_current_volatge =
> +						cpu_target_volatge;
> +				}
> +			}
> +			break;
> +		case CLK_FREQ_1600M:
> +		case CLK_FREQ_1500M:
> +			cpu_target_volatge = (true == cpu_no_boost_1_6ghz) ?
> +						     VOLTAGE_0_8V :
> +						     VOLTAGE_0_9V;
> +			ret = eswin_clk_set_cpu_volatge(clk->cpu_voltage_gpio,
> +							cpu_target_volatge);
> +			if (ret) {
> +				pr_warn("failed to change cpu volatge to %d mV, not support rate %ld\n",
> +					cpu_target_volatge, rate);
> +				goto switch_back;
> +			} else {
> +				if (clk->cpu_current_volatge !=
> +				    cpu_target_volatge) {
> +					pr_info("cpu volatge change to %d mV, target rate %ld\n",
> +						cpu_target_volatge, rate);
> +					clk->cpu_current_volatge =
> +						cpu_target_volatge;
> +				}
> +			}
> +			break;
> +		default:
> +			ret = eswin_clk_set_cpu_volatge(clk->cpu_voltage_gpio,
> +							VOLTAGE_0_8V);
> +			if (!ret) {
> +				if (clk->cpu_current_volatge != VOLTAGE_0_8V) {
> +					pr_info("cpu volatge change to %d mV, target rate %ld\n",
> +						VOLTAGE_0_8V, rate);
> +					clk->cpu_current_volatge = VOLTAGE_0_8V;
> +				}
> +			}
> +			/*
> +			 * For boards that do not support voltage switching,
> +			 * the voltage is maintained at 0.8V.
> +			 * Therefore, this is also considered successful.
> +			 */
> +			ret = 0;
> +			break;
> +		}
> +	}
> +
> +	/*first disable pll */
> +	val = readl_relaxed(clk->ctrl_reg0);
> +	val &= ~(((1 << clk->pllen_width) - 1) << clk->pllen_shift);
> +	val |= 0 << clk->pllen_shift;
> +	writel_relaxed(val, clk->ctrl_reg0);
> +
> +	val = readl_relaxed(clk->ctrl_reg0);
> +	val &= ~(((1 << clk->fbdiv_width) - 1) << clk->fbdiv_shift);
> +	val &= ~(((1 << clk->refdiv_width) - 1) << clk->refdiv_shift);
> +	val |= refdiv_val << clk->refdiv_shift;
> +	val |= fbdiv_val << clk->fbdiv_shift;
> +	writel_relaxed(val, clk->ctrl_reg0);
> +
> +	val = readl_relaxed(clk->ctrl_reg1);
> +	val &= ~(((1 << clk->frac_width) - 1) << clk->frac_shift);
> +	val |= frac_val << clk->frac_shift;
> +	writel_relaxed(val, clk->ctrl_reg1);
> +
> +	val = readl_relaxed(clk->ctrl_reg2);
> +	val &= ~(((1 << clk->postdiv1_width) - 1) << clk->postdiv1_shift);
> +	val |= postdiv1_val << clk->postdiv1_shift;
> +	writel_relaxed(val, clk->ctrl_reg2);
> +
> +	/*at last, enable pll */
> +	val = readl_relaxed(clk->ctrl_reg0);
> +	val &= ~(((1 << clk->pllen_width) - 1) << clk->pllen_shift);
> +	val |= 1 << clk->pllen_shift;
> +	writel_relaxed(val, clk->ctrl_reg0);
> +
> +	/*
> +	 * usually the pll wil lock in 50us
> +	 */
> +	do {
> +		usleep_range(refdiv_val * 80, refdiv_val * 80 * 2);
> +		val = readl_relaxed(clk->status_reg);
> +		if (val & 1 << clk->lock_shift) {
> +			lock_flag = true;
> +			break;
> +		}
> +	} while (try_count++ < 10);
> +
> +	if (!lock_flag) {
> +		pr_err("%s %d, failed to lock the cpu pll, cpu will work on low power pll\n",
> +		       __func__, __LINE__);
> +		return -EBUSY;
> +	}
> +
> +switch_back:
> +	if (clk->id == EIC7700_PLL_CPU) {
> +		ret = clk_set_parent(clk_cpu_mux, clk_cpu_pll);
> +		if (ret) {
> +			pr_err("%s %d, failed to switch %s to %s, ret %d\n",
> +			       __func__, __LINE__, clk_cpu_mux_name,
> +			       clk_cpu_pll_name, ret);
> +			return -EPERM;
> +		}
> +		clk_disable_unprepare(clk_cpu_lp_pll);
> +	}
> +	return ret;
> +}
> +

This is totally wrong I think. Why does the clock driver have to care about
CPU voltage? This functionality belongs to cpufreq. You can take JH7110 as
reference and see how it's done: https://lore.kernel.org/all/20230606105656.124355-4-mason.huo@starfivetech.com/
Looking at eswin vendor u-boot, it seems you have some SoC that can operate
at 1.6Ghz without bumping the voltage. Why not do it via operating-points-v2,
like the other SoCs? It can then be overridden by board device-tree and u-boot
Also the logic of switching clock before changing PLL should be done using
notifier: https://lore.kernel.org/r/20240826080430.179788-2-xingyu.wu@starfivetech.com
Remove undocumented parameters such as "cpu_no_boost_1_6ghz" and
"cpu-default-frequency".

> +static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct eswin_clk_pll *clk = to_pll_clk(hw);
> +	u64 frac_val, fbdiv_val, refdiv_val;
> +	u32 postdiv1_val;
> +	u32 val;
> +	u64 rate;
> +
> +	val = readl_relaxed(clk->ctrl_reg0);
> +	val = val >> clk->fbdiv_shift;
> +	val &= ((1 << clk->fbdiv_width) - 1);
> +	fbdiv_val = val;
> +
> +	val = readl_relaxed(clk->ctrl_reg0);
> +	val = val >> clk->refdiv_shift;
> +	val &= ((1 << clk->refdiv_width) - 1);
> +	refdiv_val = val;
> +
> +	val = readl_relaxed(clk->ctrl_reg1);
> +	val = val >> clk->frac_shift;
> +	val &= ((1 << clk->frac_width) - 1);
> +	frac_val = val;
> +
> +	val = readl_relaxed(clk->ctrl_reg2);
> +	val = val >> clk->postdiv1_shift;
> +	val &= ((1 << clk->postdiv1_width) - 1);
> +	postdiv1_val = val;
> +
> +	switch (clk->id) {
> +	case EIC7700_APLL_FOUT1:
> +		switch (frac_val) {
> +		case 14092861:
> +			rate = APLL_HIGH_FREQ;
> +			break;
> +		case 10603200:
> +			rate = APLL_LOW_FREQ;
> +			break;
> +		default:
> +			pr_err("%s %d, clk id %d, unknown frac_val %llu\n",
> +			       __func__, __LINE__, clk->id, frac_val);
> +			rate = 0;
> +			break;
> +		}
> +		break;
> +	case EIC7700_PLL_CPU:
> +		switch (fbdiv_val) {
> +		case 300:
> +			rate = CLK_FREQ_1800M;
> +			break;
> +		case 283:
> +			rate = CLK_FREQ_1700M;
> +			break;
> +		case 266:
> +			rate = CLK_FREQ_1600M;
> +			break;
> +		case 250:
> +			rate = CLK_FREQ_1500M;
> +			break;
> +		case 216:
> +			rate = CLK_FREQ_1300M;
> +			break;
> +		case 200:
> +			rate = CLK_FREQ_1200M;
> +			break;
> +		case 166:
> +			rate = CLK_FREQ_1000M;
> +			break;
> +		case 150:
> +			rate = CLK_FREQ_900M;
> +			break;
> +		case 133:
> +			rate = CLK_FREQ_800M;
> +			break;
> +		case 116:
> +			rate = CLK_FREQ_700M;
> +			break;
> +		case 100:
> +			rate = CLK_FREQ_600M;
> +			break;
> +		case 83:
> +			rate = CLK_FREQ_500M;
> +			break;
> +		case 66:
> +			rate = CLK_FREQ_400M;
> +			break;
> +		case 33:
> +			rate = CLK_FREQ_200M;
> +			break;
> +		case 16:
> +			rate = CLK_FREQ_100M;
> +			break;
> +		case 233:
> +			rate = CLK_FREQ_1400M;
> +			break;
> +		default:
> +			pr_err("%s %d, clk id %d, unknown fbdiv_val %llu\n",
> +			       __func__, __LINE__, clk->id, fbdiv_val);
> +			rate = 0;
> +			break;
> +		}
> +		break;
> +	default:
> +		pr_err("%s %d, unknown clk id %d\n", __func__, __LINE__,
> +		       clk->id);
> +		rate = 0;
> +		break;
> +	}
> +	return rate;
> +}

I think the logic is also wrong here. How come that you can derive the clock
frequency by only using frac_val or fbdiv_val? Why can't you properly calculate
the frequency?

> +int eswin_clk_register_fixed_factor(struct device *dev,
> +				    const struct eswin_fixed_factor_clock *clks,
> +				    int nums, struct eswin_clock_data *data)
> +{
> +	struct clk *clk;
> +	int i;
> +
> +	for (i = 0; i < nums; i++) {
> +		char *name = kzalloc(strlen(clks[i].name) + 2 * sizeof(char) +
> +					     sizeof(int),
> +				     GFP_KERNEL);
> +		char *parent_name =
> +			kzalloc(strlen(clks[i].parent_name) + 2 * sizeof(char) +
> +					sizeof(int),
> +				GFP_KERNEL);
> +		sprintf(name, "%s", clks[i].name);
> +		sprintf(parent_name, "%s", clks[i].parent_name);
> +
> +		clk = clk_register_fixed_factor(NULL, name, parent_name,
> +						clks[i].flags, clks[i].mult,
> +						clks[i].div);
> +		if (IS_ERR(clk)) {
> +			kfree(name);
> +			kfree(parent_name);

There're so many `sprintf(buf, "%s", ...)` (among other places). What are you
trying to do here? Why can't the string be used directly, and avoid kzalloc?
Not to mention that the strlen(...) + 2 * sizeof(char) + sizeof(int)
makes no sense to me.

Overall I think you better do some real cleanup and refactor of this patch
before sending it out again. The driver is quite long, and I suggest you should
consider optimizing/condensing the logic. I guess you probably carried over the
same code and hacks you made for the vendor tree (eswincomputing/linux-stable)
There's no way they can be accepted by upstream. Take a look at other clk tree
implementations and spend some real effort fixing the code. Don't let the
reviewers grow impatient by only changing something superficially.

Bo
