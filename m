Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285F229D0D;
	Fri, 16 May 2025 13:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401812; cv=none; b=ucxCNCx17Wp2sbVVs37FRFdz6Ox7uqJWmjYMTzzOJi1tsSwz2aHfGX14eDGLJk5VzquhubENcdpcHhdkEiN1IZBgaFlMfYWvV1GYhuKk3eMoSIElyTK0thVxgpO9TEliT8rkna+WzqF8w2HuFjYLbvejBqYIyWkceUF1I4cy2Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401812; c=relaxed/simple;
	bh=1WGiAyi1VggTs5EVy+F+lMhO7W2LFZXYjPZjOFDcxtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0l9DxcLf7SPe3bHHuwf3ZY20R3WHvp1DT780/2o7lxzzDxsaE5Ydlyb5T/Vvh3kaXjxoRBsP0efTkoPebFbQUobLdvIxtyiNBy2Iz4V4OXdNq5F7/FHWOxxhL8bFG30DDuTg4QC5IVyvTMUov3HQ9GaEjJrZKjKBE/TxPUfIcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o6DQGbyU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o6DQGbyU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC883C4CEE4;
	Fri, 16 May 2025 13:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747401811;
	bh=1WGiAyi1VggTs5EVy+F+lMhO7W2LFZXYjPZjOFDcxtU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o6DQGbyUwYPrSflbMh3XV3p5exWnilAbwB8JJU2OjAuysT2tqRggYvwMQRkwooFl1
	 iXA6QFaUOmbR1b5cpGf3pw7+G3AQCzIwasegzJ2a2bTm6ov8poIO1mOkVF/mGkPAWR
	 f0jmJjsD01DyUF0bhQyvzOonWjZiJDlFZwH10c/yRNnf9fl9QEs4RjMu15ICTCxeUO
	 3QcE7NMlX0qReYBoHf8hUOg3R8wU/b2SNZhbOEH3e3FL/eqZJUprXKhQi3DkfdiWti
	 XQG8Eh3BhMCbHpc1Jzbp9lw88p29K5GqX06k5XSKyGYtnuWzOoSQv98+uye/vgzxYF
	 /taoSeZDCSzZQ==
Message-ID: <87874bd2-2fcb-42b3-9e92-cccaa4eaa148@kernel.org>
Date: Fri, 16 May 2025 15:23:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clock: eswin: Add eic7700 clock driver
To: dongxuyang@eswincomputing.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 huangyifeng@eswincomputing.com
References: <20250514002233.187-1-dongxuyang@eswincomputing.com>
 <20250514002626.348-1-dongxuyang@eswincomputing.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20250514002626.348-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/05/2025 02:26, dongxuyang@eswincomputing.com wrote:
>> +static int eswin_cpu_clk_init(struct platform_device *pdev)
> +{
> +	struct clk *cpu_clk;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	u32 default_freq;
> +	int ret = 0;
> +	int numa_id;
> +	char name[128] = { 0 };
> +
> +	ret = of_property_read_u32(np, "cpu-default-frequency", &default_freq);

NAK, undocumented ABI.

You already got such comments. All your patches repeat the same mistakes.

> +	if (ret) {
> +		dev_info(dev, "cpu-default-frequency not set\n");
> +		return ret;
> +	}
> +	numa_id = dev_to_node(dev->parent);
> +	if (numa_id < 0)
> +		sprintf(name, "%s", "clk_cpu_ext_src_core_clk_0");
> +	else
> +		sprintf(name, "d%d_%s", numa_id, "clk_cpu_ext_src_core_clk_0");
> +
> +	cpu_clk = __clk_lookup(name);
> +	if (!cpu_clk) {
> +		dev_err(dev, "Failed to lookup CPU clock\n");
> +		return -EINVAL;
> +	}
> +	ret = clk_set_rate(cpu_clk, default_freq);
> +	if (ret) {
> +		dev_err(dev, "Failed to set CPU frequency: %d\n", ret);
> +		return ret;
> +	}
> +	dev_info(dev, "CPU frequency set to %u Hz\n", default_freq);

Drop, this is supposed to be silent.

> +	return 0;
> +}
> +
> +static int eswin_clk_probe(struct platform_device *pdev)
> +{
> +	struct eswin_clock_data *clk_data;
> +
> +	clk_data = eswin_clk_init(pdev, EIC7700_NR_CLKS);
> +	if (!clk_data)
> +		return -EAGAIN;
> +
> +	special_div_table_init(u_3_bit_special_div_table,
> +			       ARRAY_SIZE(u_3_bit_special_div_table));
> +	special_div_table_init(u_4_bit_special_div_table,
> +			       ARRAY_SIZE(u_4_bit_special_div_table));
> +	special_div_table_init(u_6_bit_special_div_table,
> +			       ARRAY_SIZE(u_6_bit_special_div_table));
> +	special_div_table_init(u_7_bit_special_div_table,
> +			       ARRAY_SIZE(u_7_bit_special_div_table));
> +	special_div_table_init(u_8_bit_special_div_table,
> +			       ARRAY_SIZE(u_8_bit_special_div_table));
> +	special_div_table_init(u_11_bit_special_div_table,
> +			       ARRAY_SIZE(u_11_bit_special_div_table));
> +	special_div_table_init(u_16_bit_special_div_table,
> +			       ARRAY_SIZE(u_16_bit_special_div_table));
> +
> +	eswin_clk_register_fixed_rate(eic7700_fixed_rate_clks,
> +				      ARRAY_SIZE(eic7700_fixed_rate_clks),
> +				      clk_data);
> +	eswin_clk_register_pll(eic7700_pll_clks, ARRAY_SIZE(eic7700_pll_clks),
> +			       clk_data, &pdev->dev);
> +
> +	eswin_clk_register_fixed_factor(eic7700_fixed_factor_clks,
> +					ARRAY_SIZE(eic7700_fixed_factor_clks),
> +					clk_data);
> +	eswin_clk_register_mux(eic7700_mux_clks, ARRAY_SIZE(eic7700_mux_clks),
> +			       clk_data);
> +	eswin_clk_register_clk(eic7700_clks_early_0,
> +			       ARRAY_SIZE(eic7700_clks_early_0), clk_data);
> +	eswin_clk_register_divider(eic7700_div_clks,
> +				   ARRAY_SIZE(eic7700_div_clks), clk_data);
> +	eswin_clk_register_clk(eic7700_clks_early_1,
> +			       ARRAY_SIZE(eic7700_clks_early_1), clk_data);
> +	eswin_clk_register_gate(eic7700_gate_clks,
> +				ARRAY_SIZE(eic7700_gate_clks), clk_data);
> +	eswin_clk_register_clk(eic7700_clks, ARRAY_SIZE(eic7700_clks),
> +			       clk_data);
> +
> +	eswin_cpu_clk_init(pdev);
> +
> +	return 0;



...

> +int eswin_clk_register_clk(const struct eswin_clock *clks, int nums,
> +			   struct eswin_clock_data *data)
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
> +		if (data->numa_id < 0) {
> +			sprintf(name, "%s", clks[i].name);
> +			sprintf(parent_name, "%s", clks[i].parent_name);
> +		} else {
> +			sprintf(name, "d%d_%s", data->numa_id, clks[i].name);
> +			sprintf(parent_name, "d%d_%s", data->numa_id,
> +				clks[i].parent_name);
> +		}
> +		clk = eswin_register_clk(data, NULL, name, parent_name,
> +					 clks[i].flags, &data->lock);
> +		if (IS_ERR(clk)) {
> +			pr_err("%s: failed to register clock %s\n", __func__,

Same comments apply as for all other patches.

> +			       clks[i].name);
> +			kfree(name);
> +			kfree(parent_name);
> +			goto err;
> +		}
> +
> +		if (clks[i].alias)
> +			clk_register_clkdev(clk, clks[i].alias, NULL);
> +
> +		data->clk_data.clks[clks[i].id] = clk;
> +		kfree(name);
> +		kfree(parent_name);
> +	}
> +	return 0;
> +err:
> +	while (i--)
> +		clk_unregister_gate(data->clk_data.clks[clks[i].id]);
> +
> +	return PTR_ERR(clk);
> +}
> +EXPORT_SYMBOL_GPL(eswin_clk_register_clk);

That's not a module.

> diff --git a/drivers/clk/eswin/clk.h b/drivers/clk/eswin/clk.h
> new file mode 100644
> index 000000000000..1c0d0b771229
> --- /dev/null
> +++ b/drivers/clk/eswin/clk.h
> @@ -0,0 +1,209 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
Best regards,
Krzysztof
