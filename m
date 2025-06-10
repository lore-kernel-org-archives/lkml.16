Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4611AAA29
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 19:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749582105; cv=none; b=ICnOqGWikQKHGc5LIK/wiPr36pp/glbIwcPo4FQbIdj4Y0GViOx0ECQniTpEIsSOilrLEz0gIGKedA6Mn+WjUl//+LGKtDuzAPXoRMiHFwNJo5Hj1h2amZVDQgSyECgD9PKuA5T4xPBRdhWTAR6ge37qYcbWWHJVbfnRU9llSXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749582105; c=relaxed/simple;
	bh=8c+wpxAM5xMq6D7L917XQ6g1xzTbtbaX3AqZObMjvDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SBgMspRjIR5LXMshrhpn5n6nC+OjQT1ecjZWcZjROV7tZwSo2ckIeX11L4ME75y1b6FU+EYvhtTZG8yA4ncWluK7IIEfnbh0dxs/QDPoT3pYhEwoEY7+dICqQNljuc0K+MLpVxEEY6w2XGYUF/Bi09j1PbQv8oSlg0zNXvYlqGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S56X+wOR; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S56X+wOR"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-adb5cb6d8f1so935251166b.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749582102; x=1750186902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+FLRaw+fl6/CTX9dlivCq93AwJLg9lvdu4lhUqoM/Q=;
        b=S56X+wORdhofI8HNm7NXhEjmHVOsS/sLdbZfDqF5CGrbVhmgklZpHvyP+5KDDIOLzO
         EDeuoNXp/yaPn8keftM7H9OLdKXIqk7XtXTmEeOpGtrnIt8gf1STF0gqeU+lXs3pGIw6
         em3/TcNCiilHkfkr7K7GoJs1/K5TjUjWUjrEBbNPMbulv7+OrHmRtyp3xbTkFPzOn42P
         q9lJsGZbZxLJ+s47E/yISFqvQwoTCIfPfbqnaW09tjD/DzUk2VGui5Ib/6GrK/zyrgB2
         5bgbzRp+a1KLjO6zlhfP0ehxun4/5lcP3e3bvR8Mxjyokf8kUCCLmj/KlKsze5UeADHO
         h4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749582102; x=1750186902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+FLRaw+fl6/CTX9dlivCq93AwJLg9lvdu4lhUqoM/Q=;
        b=EoXGd7yEzWO5gLQkC3Zk43eGQ+/lScv6FPM+U4FLRZ8epC4ZoGQM7cK+u0TKRdh7pf
         5rzPNOJiPa5QtP8Sq/GbILh+mcP84PSY0phOXtHgpRAPtMGVdIRl6GBSwJH3mb52eC9S
         QW9FEgkX1TIiL7HWZPFY+RTJR1fiq60ulx4Q5xjOJjngCHXrfjXvMZDWq88jnT0z9sA1
         7DiAg+AAkhT8gJstlxzXbH/wimRd81vFSa5R3hcN+i8klh3FX+wbIfoh/G22yP8IcADK
         d/O2QQx1xZhlp/9TPlSfOYDP/DcHMSCUwjJZu6QcA/WMqyXb9rvCjVA7d1Y7bTsjcZ7s
         hNvw==
X-Forwarded-Encrypted: i=1; AJvYcCXGZH2yD9yvurvtHGipVnnHWwNY1YoUOLuhnY/QG7gDYQ85/rPVfc4NpoLTGZJsBYfo4rs/F5418mG9GG4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5EZ/sP7FYaWewhgrOk+WnRCxcFuppnkvXynajgnVZxQ7oRIuE
	gqU0cJHLdXir93hgI7z/jeWeQzRsmxSQ5cJPIY1h8JxcnJkkCyYsn5qhgFIMPckaGz8h4qhptD4
	c4QNFs7I=
X-Gm-Gg: ASbGnct3cxS64RPGWoYmo92IYLXFocLyZGtQsuHGdMsu4v5zvri/dZkmRRljP5Ab7CH
	VDfvPguP7pDu2a4rgLNeMzJrzvJwBYOoZ8DNHFmj5b8o0xFofs/Loq79NucQyBvmAesMt4zvqLT
	207hIKUNC4NZ/zSFTR3J89vlqbpXwCMX0O1SP8u4/zGlXrahkAFlZhLHci7i5FIdwBNvTA9xwKo
	VM6IVxT123edn1ZnbRRV+c7vDcYV9YdGCTCbbNsuvbhhfbEx4sbDdaYHSPpOsddL42gqCx/AzR6
	Lg8aXVxw3YUNvQ3gWA3Y6jN7Oxy4wrbylXASLyO8xbxJngCGKp0l0CexA4xURT5i+58N9lOXYYW
	C5hRtzyJpf3PeVE9XS+9vI5AYmsM=
X-Google-Smtp-Source: AGHT+IFNc7kpkxSxUNoB41V9bMQVh9VZ3QHHHNM8gIkvnnHKA2x0U314EBpqc7dKu9SGTVqzj8zpoA==
X-Received: by 2002:a05:6000:40cb:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a558a9960amr101870f8f.9.1749582088987;
        Tue, 10 Jun 2025 12:01:28 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323ab207sm12894738f8f.29.2025.06.10.12.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 12:01:28 -0700 (PDT)
Message-ID: <76e40130-897e-4547-8d5a-a0054f123fbe@linaro.org>
Date: Tue, 10 Jun 2025 20:01:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: pm_helpers: use opp-table for the frequency
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250610-use_freq_with_opp_table-v1-1-7339d690fd1a@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250610-use_freq_with_opp_table-v1-1-7339d690fd1a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 10:13, Renjiang Han wrote:
> The frequency values in the opp-table of the device tree and the freq_tbl
> in the driver are the same. So the driver can choose either table for freq
> values.

I'd completely drop this sentence as you basically contradict it in the 
next line.

> However, 

Drop

some platforms (such as qcs615 and sc7180) use the same core but
> have different frequency tables. Using the opp-table allows us to separate
> the core description from the frequency data and supports the use of
> fallback compatibles.

This is a bit better.

Basically you can have identical bindings, even identical compats but 
for reasons such as binning of silicon parts you might run at higher or 
lower frequencies so static tables in the driver are not appropriate and 
are better represented in the DT.


> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
> The frequency values in the opp-table of the device tree and the freq_tbl
> in the driver are the same. So the driver can choose either table for freq
> values.
> 
> However, some platforms (such as qcs615 and sc7180) use the same core but
> have different frequency tables. Using the opp-table allows us to separate
> the core description from the frequency data and supports the use of
> fallback compatibles.
> 
> Therefore, it is necessary to update pm_helpers.c to use the frequency
> values from the opp-table for the v4 core.
> 
> Note:
> Earlier discussion was concluded in [1] where it was agreed to rely on
> opp-table for QCS615.
> 
> [1] https://lore.kernel.org/linux-arm-msm/c9b83c8b-68d1-43bc-99d6-d2d2b9e445f4@oss.qualcomm.com/
> ---
>   drivers/media/platform/qcom/venus/pm_helpers.c | 58 +++++++++++++++-----------
>   1 file changed, 34 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 409aa9bd0b5d099c993eedb03177ec5ed918b4a0..8dd5a9b0d060cddfeafd4da477ade0c7aeb6c390 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -41,16 +41,14 @@ static int core_clks_get(struct venus_core *core)
>   static int core_clks_enable(struct venus_core *core)
>   {
>   	const struct venus_resources *res = core->res;
> -	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
> -	unsigned int freq_tbl_size = core->res->freq_tbl_size;
> -	unsigned long freq;
> +	struct device *dev = core->dev;
> +	unsigned long freq = 0;
> +	struct dev_pm_opp *opp;
>   	unsigned int i;
>   	int ret;
>   
> -	if (!freq_tbl)
> -		return -EINVAL;
> -
> -	freq = freq_tbl[freq_tbl_size - 1].freq;
> +	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
> +	dev_pm_opp_put(opp);
>   
>   	for (i = 0; i < res->clks_num; i++) {
>   		if (IS_V6(core)) {
> @@ -636,7 +634,9 @@ static int decide_core(struct venus_inst *inst)
>   	u32 min_coreid, min_load, cur_inst_load;
>   	u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
>   	struct hfi_videocores_usage_type cu;
> -	unsigned long max_freq;
> +	unsigned long max_freq = ULONG_MAX;
> +	struct device *dev = core->dev;
> +	struct dev_pm_opp *opp;
>   	int ret = 0;
>   
>   	if (legacy_binding) {
> @@ -659,7 +659,8 @@ static int decide_core(struct venus_inst *inst)
>   	cur_inst_lp_load *= inst->clk_data.low_power_freq;
>   	/*TODO : divide this inst->load by work_route */
>   
> -	max_freq = core->res->freq_tbl[0].freq;
> +	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> +	dev_pm_opp_put(opp);
>   
>   	min_loaded_core(inst, &min_coreid, &min_load, false);
>   	min_loaded_core(inst, &min_lp_coreid, &min_lp_load, true);
> @@ -949,7 +950,10 @@ static int core_resets_get(struct venus_core *core)
>   static int core_get_v4(struct venus_core *core)
>   {
>   	struct device *dev = core->dev;
> +	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
> +	unsigned int num_rows = core->res->freq_tbl_size;
>   	const struct venus_resources *res = core->res;
> +	unsigned int i;
>   	int ret;
>   
>   	ret = core_clks_get(core);
> @@ -986,9 +990,17 @@ static int core_get_v4(struct venus_core *core)
>   
>   	if (core->res->opp_pmdomain) {
>   		ret = devm_pm_opp_of_add_table(dev);
> -		if (ret && ret != -ENODEV) {
> -			dev_err(dev, "invalid OPP table in device tree\n");
> -			return ret;
> +		if (ret) {
> +			if (ret == -ENODEV) {
> +				for (i = 0; i < num_rows; i++) {
> +					ret = dev_pm_opp_add(dev, freq_tbl[i].freq, 0);
> +					if (ret)
> +						return ret;
> +				}
> +			} else {
> +				dev_err(dev, "invalid OPP table in device tree\n");
> +				return ret;
> +			}
>   		}
>   	}
>   
> @@ -1078,11 +1090,11 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
>   static int load_scale_v4(struct venus_inst *inst)
>   {
>   	struct venus_core *core = inst->core;
> -	const struct freq_tbl *table = core->res->freq_tbl;
> -	unsigned int num_rows = core->res->freq_tbl_size;
>   	struct device *dev = core->dev;
>   	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
> +	unsigned long max_freq = ULONG_MAX;
>   	unsigned long filled_len = 0;
> +	struct dev_pm_opp *opp;
>   	int i, ret = 0;
>   
>   	for (i = 0; i < inst->num_input_bufs; i++)
> @@ -1108,20 +1120,18 @@ static int load_scale_v4(struct venus_inst *inst)
>   
>   	freq = max(freq_core1, freq_core2);
>   
> -	if (freq > table[0].freq) {
> -		dev_dbg(dev, VDBGL "requested clock rate: %lu scaling clock rate : %lu\n",
> -			freq, table[0].freq);
> +	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> +	dev_pm_opp_put(opp);
>   
> -		freq = table[0].freq;
> +	if (freq > max_freq) {
> +		dev_dbg(dev, VDBGL "requested clock rate: %lu scaling clock rate : %lu\n",
> +			freq, max_freq);
> +		freq = max_freq;
>   		goto set_freq;
>   	}
>   
> -	for (i = num_rows - 1 ; i >= 0; i--) {
> -		if (freq <= table[i].freq) {
> -			freq = table[i].freq;
> -			break;
> -		}
> -	}
> +	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
> +	dev_pm_opp_put(opp);
>   
>   set_freq:
>   
> 
> ---
> base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
> change-id: 20250610-use_freq_with_opp_table-b81162cfecba
> 
> Best regards,
Please make your commit log more succinct and precise then add.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
