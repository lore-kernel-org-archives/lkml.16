Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21222609D6
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636805; cv=none; b=h2J4hnK+wdk2VMbHMTob89JU88xtci/8T9wfJ3O4PJpBoRKvD2/+ddmZIsIv94SK2bI5FaqcLE0eUy3Z6NGY0kfUjo8aAOAHYbVZMfeZlNmXRHgV6sowShcINPokCC0lllhfRlTdFGqy71m+HQd4hhP1YydmH63w9GXCmbM33Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636805; c=relaxed/simple;
	bh=UbC2ciAwBnXn3leWtQ8ADE+eX3jl61pPiAdh+E1mrx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXi97F2K01qA7ldZ4iRtgCksZalO4nq0tZ+ESbwcirP42/dLP2xtPxnnBL7qxE8LtLSKdXNi+/QQeFWNI5CtAvlN6hnTGN82Fyacf9gj1hwn27Zntpb/JhvD8gL7qqA72KAZstNapjJYfolqV01GuEbD2FxNY7Irf91hHZAi+e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwLaF4YX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwLaF4YX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UJJXkK014821
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Smv5QWNwygSvZBVOmLYL3h4
	69JjSVp7Jf4WZWmUL3Y=; b=jwLaF4YX7rih8RAmco5UlwNGxmCbwx0bmdvHL62H
	safGvXEkAV536kdCF0Y676trAumd4gfdM7ovwvrDNxMgO0VVa4uSd+xJWaYnE3QM
	HfC0w/4qu9hVQpEcgKPcBAeRQrYGcAEFTIe6hly9GdAsVOWIfSkeqrhU0byI1Lmf
	OxbE16Le4w3tOWheuyOJoFR/Z/HSmihxnTq0a6MaT6bj2yOyQ1/dAqA8Ewj2Mjqs
	wWm+0HWkh0/rScJ7+TgmTbSXU1qQYomMNrVITwSA48E73U4RQ5v7TqILvQm20kge
	t88C6MDoh3tQ5HvLlPOxwrrENYRMq3hfZAFnPX8/TNltlg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm4ch9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:26:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e28d0cc0so377448685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748636801; x=1749241601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Smv5QWNwygSvZBVOmLYL3h469JjSVp7Jf4WZWmUL3Y=;
        b=A7gB+PqIShEP/qqFCI1aRU436YbvzfamDYGvhlsUX87T3CyPwvgg6RmXWgo4w8TlOr
         BoH6oJ0miRDU2oYU6S0he+OOHnfZWmhHQuD3E8iHHcYOYWqwoMgvm94BATcf0RgpzPp6
         txt4Y1GafavTTZIVcnmXOlz55A6psEVeL7km47orbdl5jX6w/DVfE3BBbQYhFs7CsJO3
         znyWhOa2po9ZmjMDTrAQbV0G+cE3oJ95sJWvujijlTY2ynnVtt6nhOTBjDoq10/yPmZm
         Awh3yvyZkJdmDVC2rF2xwshL/q81zJ7tnxZtSOLHnq+r1xtrxGz++8rSSYtSEpBCDBPn
         RsPA==
X-Forwarded-Encrypted: i=1; AJvYcCWVctUdQrZs+hkKNKEtw11FICQmbU/19lkoWeFbkMWEgdzCD0rk89EotIzI9IcJb0osQdU56mA4KUBTu4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ2aYbkBxtGeeHb22Fv+OPRfqKoSyzLO3SNbCodjj5kGhqJHnY
	3BvdMq1COqXJG5rN87vqOyY79djb6YuFR2cPYlfcY9SnYrWnrLwCbG2iqlO+n8QpqP4ijJIfEr+
	kLbrmFEYSELG+lpMBAsfQspDssQINxeGgo4QdEnfyZPoiBeJkSp7x6Fo2sMQvj1he/llPZ17ml/
	4=
X-Gm-Gg: ASbGncuMT7gwkbAL3MDg+bAvE/np4vTuHHwQaA470Cpp1LjRqnW7PdJ3uAutBHnjyYN
	1rHChp7EuJir7no9XQ7mvupCNZ2c/MHvgnKi303EecaoYE8FUy6Yq7JZKPRHHv+KBZOb753PTR6
	ClmLwDdXoo9L6aNo6vDOc5Z0ibMDp6f7kHUMM7Tre7Gxi1KjwXw+kcZdkC/GOKtW6/s63+TKi8v
	zfmz5+3dge0bhCY+HHvodLFqwVsb3TW5kYgRCM1Kdrl3/t/zCPalAAr+QJN8nwrIwLPrUUVLc91
	oX3ZxwMWxomPkcYgiFz3EutnWgFEpFkNKFccw9fDZXEBskldzbfy2NqHzY8y16zqGjII27ZQcyP
	/Gj28tt274g==
X-Received: by 2002:a05:620a:2789:b0:7d0:96d9:f8c3 with SMTP id af79cd13be357-7d0a1feb55dmr653460985a.34.1748636801199;
        Fri, 30 May 2025 13:26:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIWZaLbiNV5l4FpFBJv9XiFQqN5ZB1DIRxf8JfhoR2XVZtRVyRKE7qzxT+Kk2KYko6yQKGew==
X-Received: by 2002:a05:620a:2789:b0:7d0:96d9:f8c3 with SMTP id af79cd13be357-7d0a1feb55dmr653458785a.34.1748636800784;
        Fri, 30 May 2025 13:26:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337910f0dsm831084e87.119.2025.05.30.13.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:26:40 -0700 (PDT)
Date: Fri, 30 May 2025 23:26:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v8 1/3] media: venus: pm_helpers: use opp-table for the
 frequency
Message-ID: <pyaoow6swlbazljgvav2vghixmb7swd4nkahqvxnhd6gsde26f@myhtwp72qxz7>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <20250530-add-venus-for-qcs615-v8-1-c0092ac616d0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-add-venus-for-qcs615-v8-1-c0092ac616d0@quicinc.com>
X-Proofpoint-GUID: EiWP66J9WXN8MM9O2uIN02Pv40mxBqHk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE4MiBTYWx0ZWRfXwsOA/J/4oeFx
 d7UUHhB29dtgcS4IXh8EfcnqR+d0Ml6RkOejDQR+QN9SGtb5T7KKjIUSavUhqF3+biji78c/gS2
 w3WNDwvh5gltITfyme/d6KUrolyMU1CB+ue3coADZl/ugNTaJQe2uFirA0j5DORgSlAugcfa83z
 RmBFg5+5guEorWRGAPYiWQGYxrnP431/+GBbitozfJ5s+bfBU+AvMRBZUdLcRDydDI1GsNoHfBq
 eYmmuQLs/lX7DRJjEEDO/VesHt1buMVMo8Omz+5mveDfNo1vKWUapapW9W4QBfTFfTFYPZw0+Cz
 c0QjopiIlSV/nw3749hqjWcr3dSEXU1zRWb7Rj66S2QKrENQVn/26aNRYDBI439x1/5aGxiukbB
 T6R/yHMDkq4xWH708VdC4XeZNUQr+9/7kiGyAz/KGhNXt0/5vHLpGDC/CsMYSz3el5Wcs+nW
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=683a1482 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=4WTgWidf2JFRtI-FBxYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EiWP66J9WXN8MM9O2uIN02Pv40mxBqHk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300182

On Fri, May 30, 2025 at 09:32:13AM +0530, Renjiang Han wrote:
> The frequency value in the opp-table in the device tree and the freq_tbl
> in the driver are the same.
> 
> Therefore, update pm_helpers.c to use the opp-table for frequency values
> for the v4 core.

You are kind of missing the linking between the first two sentences. "The
tables are the same, so use the second one." You need to explain that
some of the platforms (provide examples) use the same core, but
different frequency tables. Using OPP tables allows us to abstract core
description from the frequency data and use fallback compatibles.

> If getting data from the opp table fails, fall back to using the frequency
> table.
> 
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/pm_helpers.c | 53 +++++++++++++++++++-------
>  1 file changed, 39 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 409aa9bd0b5d099c993eedb03177ec5ed918b4a0..434dd66076e8faf7f3feac6c29152789f8d2f81b 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -43,14 +43,20 @@ static int core_clks_enable(struct venus_core *core)
>  	const struct venus_resources *res = core->res;
>  	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
>  	unsigned int freq_tbl_size = core->res->freq_tbl_size;
> +	struct device *dev = core->dev;
> +	struct dev_pm_opp *opp;
>  	unsigned long freq;
>  	unsigned int i;
>  	int ret;
>  
> -	if (!freq_tbl)
> -		return -EINVAL;
> -
> -	freq = freq_tbl[freq_tbl_size - 1].freq;
> +	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
> +	if (IS_ERR(opp)) {
> +		if (!freq_tbl)
> +			return -EINVAL;
> +		freq = freq_tbl[freq_tbl_size - 1].freq;
> +	} else {
> +		dev_pm_opp_put(opp);
> +	}
>  
>  	for (i = 0; i < res->clks_num; i++) {
>  		if (IS_V6(core)) {
> @@ -631,12 +637,15 @@ min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool lo
>  
>  static int decide_core(struct venus_inst *inst)
>  {
> +	const struct freq_tbl *freq_tbl = inst->core->res->freq_tbl;
>  	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
>  	struct venus_core *core = inst->core;
>  	u32 min_coreid, min_load, cur_inst_load;
>  	u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
>  	struct hfi_videocores_usage_type cu;
> -	unsigned long max_freq;
> +	unsigned long max_freq = ULONG_MAX;
> +	struct device *dev = core->dev;
> +	struct dev_pm_opp *opp;
>  	int ret = 0;
>  
>  	if (legacy_binding) {
> @@ -659,7 +668,11 @@ static int decide_core(struct venus_inst *inst)
>  	cur_inst_lp_load *= inst->clk_data.low_power_freq;
>  	/*TODO : divide this inst->load by work_route */
>  
> -	max_freq = core->res->freq_tbl[0].freq;
> +	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> +	if (IS_ERR(opp))
> +		max_freq = freq_tbl[0].freq;
> +	else
> +		dev_pm_opp_put(opp);
>  
>  	min_loaded_core(inst, &min_coreid, &min_load, false);
>  	min_loaded_core(inst, &min_lp_coreid, &min_lp_load, true);
> @@ -1082,7 +1095,9 @@ static int load_scale_v4(struct venus_inst *inst)
>  	unsigned int num_rows = core->res->freq_tbl_size;
>  	struct device *dev = core->dev;
>  	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
> +	unsigned long max_freq = ULONG_MAX;
>  	unsigned long filled_len = 0;
> +	struct dev_pm_opp *opp;
>  	int i, ret = 0;
>  
>  	for (i = 0; i < inst->num_input_bufs; i++)
> @@ -1108,19 +1123,29 @@ static int load_scale_v4(struct venus_inst *inst)
>  
>  	freq = max(freq_core1, freq_core2);
>  
> -	if (freq > table[0].freq) {
> -		dev_dbg(dev, VDBGL "requested clock rate: %lu scaling clock rate : %lu\n",
> -			freq, table[0].freq);
> +	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> +	if (IS_ERR(opp))
> +		max_freq = table[0].freq;
> +	else
> +		dev_pm_opp_put(opp);
>  
> -		freq = table[0].freq;
> +	if (freq > max_freq) {
> +		dev_dbg(dev, VDBGL "requested clock rate: %lu scaling clock rate : %lu\n",
> +			freq, max_freq);
> +		freq = max_freq;
>  		goto set_freq;
>  	}
>  
> -	for (i = num_rows - 1 ; i >= 0; i--) {
> -		if (freq <= table[i].freq) {
> -			freq = table[i].freq;
> -			break;
> +	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
> +	if (IS_ERR(opp)) {
> +		for (i = num_rows - 1 ; i >= 0; i--) {
> +			if (freq <= table[i].freq) {
> +				freq = table[i].freq;
> +				break;
> +			}
>  		}
> +	} else {
> +		dev_pm_opp_put(opp);
>  	}
>  
>  set_freq:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
