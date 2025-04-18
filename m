Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C4B148316;
	Fri, 18 Apr 2025 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744986032; cv=pass; b=Cq6aUb/0M72RVPeIR/d/Oy7zuGSvrEpm2/okit5lcIoUwTf6jP0vj+z2u9tttm9jjQqdMqEBQVXN7k1zEE/nfzuAGhM8fOcRECGQByzCw88YK1AlPzTpO+HVVidRifUR/4hkcw/lPFAu0AvUq9SvKDnBFGns0GKjqVPtUwPpKqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744986032; c=relaxed/simple;
	bh=1V4cYrKt5Rb/SQIRggNYD2Z5Asx3L3cyi1Ax/5szR7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3+9637U8pfQKiJpGwOWYpaPXhgFOezll36KnB8zNyKN4v0VSbf0sxYtsdYgOZtfF7zjYkQLFoqshMQocox2w+zM0+2WmGuWOe1kzBx/j3Mvn6RSsKivJsDNv4yVjDjQCsAygDyux/2apyBXKFQqGr6QSGZjimBoTzkLRWuscpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=AGhv6Xv9; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="AGhv6Xv9"
ARC-Seal: i=1; a=rsa-sha256; t=1744986009; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RtrXWpQpoMrsGyEMRcdbVykyTqFwYL3AGPnE6oGSiDewHzZgtWWIjxb8m1KgomzlyilISs2HH15X696nvGurICVNczPa6O/97pvKkAKHcKZXBvr0fXpQimI9I/79Y+3KWXDGXxPxGwmXSKI8oYi9fRITasPCz56upeWoq1Yo+eA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744986009; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=J9B+xErGQKJgJ0GqczarSJBeszmh3Cmzf0o0QIoMC5c=; 
	b=cMHS14dvawEzQWons6Ph/HMGMR8/GKNDy5Rm3Bi21zW4QuoTHWlvmYMeuDdtNAIGFa/M4e/AkpjWNFUW4M9U+80NVAQCBcKoK/BylyO51etDS5XV62NwRDt5naIB1slxvsKYN02VzEpG1y2qnmOZ35uIJARceFVpyxWUGcsjB58=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744986009;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=J9B+xErGQKJgJ0GqczarSJBeszmh3Cmzf0o0QIoMC5c=;
	b=AGhv6Xv9iFtCipH5FMMwbP6HWrANv5caSURWUEGEv8nqyEe9G/Esxdm2FDnhwqPd
	AmOobZS+h2aCX/C6xwzB7C3j3q234qgcCpF/lnIqQvCz5Oy9g0WKkWo4XMHSve8sjcE
	B8wrb79Z9mxXIPkFpBZRCWIkZtJo11abq+EHhu/M=
Received: by mx.zohomail.com with SMTPS id 1744986002357182.528426557427;
	Fri, 18 Apr 2025 07:20:02 -0700 (PDT)
Message-ID: <baae0cce-979d-4e4d-aacc-73387ed7d8a8@zohomail.com>
Date: Fri, 18 Apr 2025 22:19:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <aAJGCDmqNoSWrwXw@troy-wujie14-pro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: rr08011227d656c8f955eef877984aa3c30000194a8cf4a0238f4acea727dff6676dd24307b9301560b74f2d:zu080112275d9e1c64a09c000aacb0f9bb0000330522e1da41d81750df9c78bd5cc5ffb241289e3acb6fae4b:rf0801122c2a500e82837e5d7e05e4ba23000054558afdc724201e871132d566febc33c48bb9ef3ba3aec389b91cc34077:ZohoMail
X-ZohoMailClient: External


On 2025/4/18 20:31, Troy Mitchell wrote:
> On Tue, Apr 15, 2025 at 10:25:12PM +0800, Xukai Wang wrote:
>> +	switch (rate_cfg->method) {
>> +	/*
>> +	 * K230_MUL: div_mask+1/div_max...
>> +	 * K230_DIV: mul_max/div_mask+1
>> +	 * K230_MUL_DIV: mul_mask/div_mask...
>> +	 */
>> +	case K230_MUL:
>> +		div = rate_cfg->rate_div_max;
>> +		mul = (readl(rate_cfg->rate_reg) >> rate_cfg->rate_div_shift)
>> +			& rate_cfg->rate_div_mask;
>> +		mul++;
>> +		break;
>> +	case K230_DIV:
>> +		mul = rate_cfg->rate_mul_max;
>> +		div = (readl(rate_cfg->rate_reg) >> rate_cfg->rate_div_shift)
>> +			& rate_cfg->rate_div_mask;
>> +		div++;
>> +		break;
>> +	case K230_MUL_DIV:
>> +		if (!rate_cfg_c) {
>> +			mul = (readl(rate_cfg->rate_reg) >> rate_cfg->rate_mul_shift)
>> +				& rate_cfg->rate_mul_mask;
>> +			div = (readl(rate_cfg->rate_reg) >> rate_cfg->rate_div_shift)
>> +				& rate_cfg->rate_div_mask;
>> +		} else {
>> +			mul = (readl(rate_cfg_c->rate_reg_c) >> rate_cfg_c->rate_mul_shift_c)
>> +				& rate_cfg_c->rate_mul_mask_c;
>> +			div = (readl(rate_cfg->rate_reg) >> rate_cfg->rate_div_shift)
>> +				& rate_cfg->rate_div_mask;
>> +		}
>> +		break;
> Should we report an error in other cases?

This is impossible. The compiler will warn if an enum case is missing.[1]

>> +	}
>> +
>> +	return mul_u64_u32_div(parent_rate, mul, div);
>> +}
>> +
>> +static int k230_clk_find_approximate(struct k230_clk *clk,
>> +				     u32 mul_min,
>> +				     u32 mul_max,
>> +				     u32 div_min,
>> +				     u32 div_max,
>> +				     enum k230_clk_div_type method,
>> +				     unsigned long rate,
>> +				     unsigned long parent_rate,
>> +				     u32 *div,
>> +				     u32 *mul)
>> +{
>> +	long abs_min;
>> +	long abs_current;
>> +	long perfect_divide;
>> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
>> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
>> +
>> +	const u32 codec_clk[9] = {
>> +		2048000,
>> +		3072000,
>> +		4096000,
>> +		6144000,
>> +		8192000,
>> +		11289600,
>> +		12288000,
>> +		24576000,
>> +		49152000
>> +	};
>> +
>> +	const u32 codec_div[9][2] = {
>> +		{3125, 16},
>> +		{3125, 24},
>> +		{3125, 32},
>> +		{3125, 48},
>> +		{3125, 64},
>> +		{15625, 441},
>> +		{3125, 96},
>> +		{3125, 192},
>> +		{3125, 384}
>> +	};
>> +
>> +	const u32 pdm_clk[20] = {
>> +		128000,
>> +		192000,
>> +		256000,
>> +		384000,
>> +		512000,
>> +		768000,
>> +		1024000,
>> +		1411200,
>> +		1536000,
>> +		2048000,
>> +		2822400,
>> +		3072000,
>> +		4096000,
>> +		5644800,
>> +		6144000,
>> +		8192000,
>> +		11289600,
>> +		12288000,
>> +		24576000,
>> +		49152000
>> +	};
>> +
>> +	const u32 pdm_div[20][2] = {
>> +		{3125, 1},
>> +		{6250, 3},
>> +		{3125, 2},
>> +		{3125, 3},
>> +		{3125, 4},
>> +		{3125, 6},
>> +		{3125, 8},
>> +		{125000, 441},
>> +		{3125, 12},
>> +		{3125, 16},
>> +		{62500, 441},
>> +		{3125, 24},
>> +		{3125, 32},
>> +		{31250, 441},
>> +		{3125, 48},
>> +		{3125, 64},
>> +		{15625, 441},
>> +		{3125, 96},
>> +		{3125, 192},
>> +		{3125, 384}
>> +	};
>> +
>> +	switch (method) {
>> +	/* only mul can be changeable 1/12,2/12,3/12...*/
>> +	case K230_MUL:
>> +		perfect_divide = (long)((parent_rate * 1000) / rate);
>> +		abs_min = abs(perfect_divide -
>> +			     (long)(((long)div_max * 1000) / (long)mul_min));
>> +		*mul = mul_min;
>> +
>> +		for (u32 i = mul_min + 1; i <= mul_max; i++) {
>> +			abs_current = abs(perfect_divide -
>> +					(long)((long)((long)div_max * 1000) / (long)i));
>> +			if (abs_min > abs_current) {
>> +				abs_min = abs_current;
>> +				*mul = i;
>> +			}
>> +		}
>> +
>> +		*div = div_max;
>> +		break;
>> +	/* only div can be changeable, 1/1,1/2,1/3...*/
>> +	case K230_DIV:
>> +		perfect_divide = (long)((parent_rate * 1000) / rate);
>> +		abs_min = abs(perfect_divide -
>> +			     (long)(((long)div_min * 1000) / (long)mul_max));
>> +		*div = div_min;
>> +
>> +		for (u32 i = div_min + 1; i <= div_max; i++) {
>> +			abs_current = abs(perfect_divide -
>> +					 (long)((long)((long)i * 1000) / (long)mul_max));
>> +			if (abs_min > abs_current) {
>> +				abs_min = abs_current;
>> +				*div = i;
>> +			}
>> +		}
>> +
>> +		*mul = mul_max;
>> +		break;
>> +	/* mul and div can be changeable. */
>> +	case K230_MUL_DIV:
>> +		if (rate_cfg->rate_reg_off == K230_CLK_CODEC_ADC_MCLKDIV_OFFSET ||
>> +		    rate_cfg->rate_reg_off == K230_CLK_CODEC_DAC_MCLKDIV_OFFSET) {
>> +			for (u32 j = 0; j < 9; j++) {
>> +				if (0 == (rate - codec_clk[j])) {
>> +					*div = codec_div[j][0];
>> +					*mul = codec_div[j][1];
>> +				}
>> +			}
>> +		} else if (rate_cfg->rate_reg_off == K230_CLK_AUDIO_CLKDIV_OFFSET ||
>> +			   rate_cfg->rate_reg_off == K230_CLK_PDM_CLKDIV_OFFSET) {
>> +			for (u32 j = 0; j < 20; j++) {
>> +				if (0 == (rate - pdm_clk[j])) {
>>
>> +					*div = pdm_div[j][0];
>> +					*mul = pdm_div[j][1];
>> +				}
>> +			}
>> +		} else {
>> +			return -EINVAL;
>> +		}
>> +		break;
> Should we report an error when other case?

The default case is impossible.
The compiler will warn if an enum case is missing.
And Stephen Boyd suggested to remove the default case[1].
Link: https://lore.kernel.org/all/3fb73691f50e599c361dddaff08d3af5.sboyd@kernel.org/ [1]

