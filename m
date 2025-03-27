Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6E04C9F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079856; cv=none; b=L8KgNy5ot8rldhTbS44klWrj1f2SkrgZguaVmY6splYyISk7mhmBgtbSCvML6sZ1iD+eXxR/ZsX+z0t7wxO1ywjKsOdyaMQ5J1pSVTaTupc6RfOpeKRm9f/8G9z8f16fKxjX0TAMCdg6Cj3pPl74QmR+QbfHAR+4EGV+0VMfeME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079856; c=relaxed/simple;
	bh=pL90vHuNE7tQlgEWccvhBuZXMcAMHwOlAjmqBSO/Wrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIeyNRNggcB0jXSvWSQoxtJ4PViCzrGmR6lzOstlbpat4ArKL6qFGoSfOUYhlDAz0oBnENAOjMaadpEbCwOzgkBEj2hCyWmTBqQsknKcIVHiLaAwGRwzfWi0NiF/jZApPAYDT5PSn2lJDlYCoHljm0YmYt7wBhs0NnRM1ky3a2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ka0426I6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ka0426I6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5kOSe004923
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wFKcuz6Nlma8E8XvWGcVNg1T
	96S0pQ02WG0nEF2t18M=; b=ka0426I6OjHvkB4P/Hg8GpsDdUIX5Luv6sE9ZvMs
	zp0P4a8I5J7ZKT/dT2Ij9j2GTNTb4KcnDTuV9r2CWps/3cuyH59adm6qHNMYIfMl
	VXYJY4TI5g+jZAc5t6gZWlXE7KyNwQzr8sSdD4r1FKnW1Zn/Ct4jla8PYP7yx3dh
	MBkPvjwYp45RE9Z8OBRFCj3SKUJyBy/HZMAumy2InJ0W9zyZCLKqHzgkMYQAWnR8
	BEwLVXxZ5uA+855MaGr5Nfig8ZZcPYvMScFa2SYRBnQYerLAufUOiO0ePBkeui1l
	oZFnfPCbuc+RpnP67pdN4NWOUUv0pw2hdlwV0Eol7CumXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xdx7d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:50:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c0b0cf53f3so137516985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 05:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079851; x=1743684651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFKcuz6Nlma8E8XvWGcVNg1T96S0pQ02WG0nEF2t18M=;
        b=XtekpN5ilvIS8l4RMedi5+04gDWapUT8hQE7e1S9bd636RU2UaEZwvYjhlaAypj6rx
         PNIOzSGUuuw8oe4Gda6CAYZn8/WlAEyyaj1EdyoarpjQ0VvWy6zIq49vUyHY0F2SE8F/
         nq7RgBG/Vu9lXB4Aoe0w2KmOKFMFk7TCU98PVnq+atxVwoVTGPtHwDSsKTPi9m5g4WUj
         /nbFyt0Jb8W71qaPOzj3hbzRGwMuMtAA5KOKNjDGOoXyWcxqL4i7Cfu+8uCVrWiD4xXl
         ZfZjnQskaUXpvEIKQiTbJSmZExQI/nRToSX7Q3l2clg3P8uu22Mn9LiDC5D+x0HCc0Uj
         iw6w==
X-Forwarded-Encrypted: i=1; AJvYcCWQwmZyumnx6Yz1RvkA14cxbJvZbzXYcgfAWKiezzse4AhjIrdsMJzisVzS0+CRHMxV1S+tnkmd5PTfzlc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp4PnJRRYxZqX8Bp/1RwQCqU3bAZMVRlj58AFsd2HF+1LmWHu6
	HOCgBbBl/w8rWTlBQPRmCX2SFh02a82DSHeyAMbsYLFzQyCMj4tL3hBHfpCZ2TnNGspEh1VT+vQ
	GwU4RYQllvt2szukOO9pSFXuhAjV4c8o7K7HFcyrXgovnidwS4KIb4DbcwqYu098=
X-Gm-Gg: ASbGncvh2cg0zIsGFfyS6fHt6DULH0Q549diHbNUA9/rVXtfMZYfCcHdedorksScFCg
	2yK87lHEEX8PSh0HzcuA4mAYEH9n324IO+FX6zvSV7kLPAIienivJwvh4Wbn2xvg+RyI2SzhrLz
	VcHn0gfbkrvzyuMOG61jMa3cCEYGRdzUFLWJrzOKmQ9NNDEQ5edMRggxEd3xKyRWvbqiPCra0Q9
	insMecf7bc1TCYEFyK55Pw8h/sZbff2+z10FXBQFYCAn8imBczuCpi0fpJXHeFTX1s5sIryPBZp
	Ujcozh4Wb6d61ejtXBXPJCb2BZTPufwDr2BMbirtSKVNyo+6Y+l+EJFySGECNncNaR6nocwxP9/
	2QAU=
X-Received: by 2002:a05:620a:31a2:b0:7c5:5e9f:eb30 with SMTP id af79cd13be357-7c5ed9fd929mr408254985a.15.1743079851217;
        Thu, 27 Mar 2025 05:50:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXXLDu4fdCXkYeWRX9Tp0iT/8yz6E9Y2S8ohqqcz1NwpLBK9hxcteZgRIHWbOdDNrn8kxLig==
X-Received: by 2002:a05:620a:31a2:b0:7c5:5e9f:eb30 with SMTP id af79cd13be357-7c5ed9fd929mr408251485a.15.1743079850699;
        Thu, 27 Mar 2025 05:50:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64fc784sm2072830e87.116.2025.03.27.05.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:50:49 -0700 (PDT)
Date: Thu, 27 Mar 2025 14:50:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 06/18] clk: qcom: common: Add support to configure clk
 regs in qcom_cc_really_probe
Message-ID: <aidlp3iq6pxym52tp63w35tpcctw4443yihvcwsdszk62xbwfp@esqpmsc4e6qd>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-6-895fafd62627@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-6-895fafd62627@quicinc.com>
X-Proofpoint-ORIG-GUID: e9VrHy2vGaQuX8q68l4Jn2b08d_5zA_1
X-Proofpoint-GUID: e9VrHy2vGaQuX8q68l4Jn2b08d_5zA_1
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e549ad cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=cETneD3F4ukMxXqWcMUA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270089

On Thu, Mar 27, 2025 at 03:22:26PM +0530, Jagadeesh Kona wrote:
> Add support to configure PLLS and clk registers in qcom_cc_really_probe().
> This ensures all required power domains are enabled and kept ON by runtime
> PM code in qcom_cc_really_probe() before configuring the PLLS or clock
> registers.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/common.c | 28 ++++++++++++++++++++++++++++
>  drivers/clk/qcom/common.h | 19 +++++++++++++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 9cbf1c5296dad3ee5477a2f5a445488707663b9d..c4d980c6145834969fada14863360ee81c9aa251 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -14,6 +14,8 @@
>  #include <linux/of.h>
>  
>  #include "common.h"
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
>  #include "clk-rcg.h"
>  #include "clk-regmap.h"
>  #include "reset.h"
> @@ -285,6 +287,29 @@ static int qcom_cc_icc_register(struct device *dev,
>  						     desc->num_icc_hws, icd);
>  }
>  
> +static void qcom_cc_clk_pll_configure(const struct qcom_cc_desc *desc,
> +				      struct regmap *regmap)
> +{
> +	int i;
> +
> +	for (i = 0; i < desc->num_alpha_plls; i++)
> +		qcom_clk_alpha_pll_configure(desc->alpha_plls[i], regmap);
> +}
> +
> +static void qcom_cc_clk_regs_configure(const struct qcom_cc_desc *desc,
> +				       struct regmap *regmap)
> +{
> +	struct qcom_clk_reg_setting *clk_regs = desc->clk_regs;
> +	int i;
> +
> +	for (i = 0; i < desc->num_clk_cbcrs; i++)
> +		qcom_branch_set_clk_en(regmap, desc->clk_cbcrs[i]);
> +
> +	for (i = 0 ; i < desc->num_clk_regs; i++)
> +		regmap_update_bits(regmap, clk_regs[i].offset,
> +				   clk_regs[i].mask, clk_regs[i].val);

I think there are other semantic functions which we don't want to
convert to offset-mask-val tuples. See drivers/clk/qcom/clk-branch.h.
I'd suggest to move setup steps to a driver callback. We can improve it
later on if it is found to make sense, but it won't block this series
from being merged.

> +}
> +
>  int qcom_cc_really_probe(struct device *dev,
>  			 const struct qcom_cc_desc *desc, struct regmap *regmap)
>  {
> @@ -315,6 +340,9 @@ int qcom_cc_really_probe(struct device *dev,
>  			return ret;
>  	}
>  
> +	qcom_cc_clk_pll_configure(desc, regmap);
> +	qcom_cc_clk_regs_configure(desc, regmap);
> +
>  	reset = &cc->reset;
>  	reset->rcdev.of_node = dev->of_node;
>  	reset->rcdev.ops = &qcom_reset_ops;
> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> index 9c10bc8c197cd7dfa25ccd245763ad6acb081523..01b1ae52f2dc580350409d6244578944cce571f0 100644
> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -25,6 +25,19 @@ struct qcom_icc_hws_data {
>  	int clk_id;
>  };
>  
> +/**
> + * struct qcom_clk_reg_setting - Represents miscellaneous clock register settings
> + * @offset: address offset for the clock register
> + * @mask: bit mask indicating the bits to be updated
> + * @val: Encoded value to be set within the specified bit mask
> + *       (e.g., if writing 7 to bits 4-7, mask = 0xF0 and val = 0x70)
> + */
> +struct qcom_clk_reg_setting {
> +	u32 offset;
> +	u32 mask;
> +	u32 val;
> +};
> +
>  struct qcom_cc_desc {
>  	const struct regmap_config *config;
>  	struct clk_regmap **clks;
> @@ -38,6 +51,12 @@ struct qcom_cc_desc {
>  	const struct qcom_icc_hws_data *icc_hws;
>  	size_t num_icc_hws;
>  	unsigned int icc_first_node_id;
> +	u32 *clk_cbcrs;
> +	size_t num_clk_cbcrs;
> +	struct clk_alpha_pll **alpha_plls;
> +	size_t num_alpha_plls;
> +	struct qcom_clk_reg_setting *clk_regs;
> +	size_t num_clk_regs;
>  	bool use_rpm;
>  };
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
