Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AF62D8781
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749928749; cv=none; b=dEt62yVdgNu9PoArjkWG5gd8VEeUwNF4e16mNFLsuCQuXxdm2L+EVizYBOIdhUrIKZD8I8Gsrq74GqW+pXp3FsoC6BI3h6RI8aR1MDuiaYrlzm65q4NZ08VzWlY5wK6QuDUl3KALLQdeQzw1boDyRDpc9rtunlwXVHMZ2GTQwYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749928749; c=relaxed/simple;
	bh=HCmu8zBCwT1sCU+JWJo7GxThaeF443wRPngh2djh5qM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=juJPhDdVk/qPClY78MNvjq2wcfgnham3cN1+YHmcwVf3DOHgBOdqDYAt+FL1Zx9s45oYgwy7MJHa/Ybsy0Aq7LkT3EFvEelHkBRSv6wwnJ+pBF6GqXNHz8yxJhs5zBJCfc3UWS0e3Dnw4eN9lmgCdf7ESEf4LtNfbilDlc87xT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2LbgRw6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2LbgRw6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EFTwvl014711
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CO7GBylWWl+fwo+IkF7T+4QyCFqae8eZKA5W8pecqIU=; b=K2LbgRw6FWdqBxoS
	EU8VuP6MiSmFQocI6knnZ74nWWFa/gCoLzB0tIJmGSqXlP5Sod6IM59gMXg0TN9R
	3TQG95I5QNlb6lljfLQXw8ha+7//Az2nRsZCoiR0YhXqVf4PLE9Dn0WGZ9bJ7jUV
	ktgCGSQYfAZWBOtpPaTF1oROrX9E7uifXbFo9GkEevObfXvxR3/1RCwvM3DX1qFY
	ul5IhLGdh26cC+PaoD+bUCc5kPjYWTK0SDmclhUlxYwkmIeTbHgFnt5rM2OhqWT7
	eAMpyU9j28JLnNp+HhZ6FeoZ1ZutYMHwNAoTMeNuByaJRnWXiqWvyqhukobqqZ4z
	KXsrHg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h90xdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:19:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a5911ed20cso2129241cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 12:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749928746; x=1750533546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CO7GBylWWl+fwo+IkF7T+4QyCFqae8eZKA5W8pecqIU=;
        b=ptAkJBcgMztUUXEBWmglLLvZW0kh8xLALo0RhYYkQFhIGzIkB+qdezU/ruVAdou/Z1
         aA+c/qEpQ96PtcUQBiaa23an6guLduF1gmLbZEe47Si7bvRISdU9dX2PaT+Im6I80NDQ
         2LLk5b1YfGhhQXzTErJOEIBHL0HOhd0TZIcuq2JFcpqd35aGfAwhH4VWBKwnLuEVo1cH
         R/387lawpyNYFx2jpIf3/hoSr6xAFzIPoMcLyRahFfxJw6ScxxKRhWDTgrkvnxv6Q9BU
         sOs9XnBmobVWP2LifGvaHJphMaOLFm+qvCn9mEIjD0cxQbTMvkn/4KKrQFsMFVgX+h1c
         qolQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp3qQBhp4xN63TRcvGpzu2yOOwqg52COT4lsF6vkirx8HOSmmlcT/b7kzwwBsBIlEggpfOzwRLGxdX608=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1iYXZrq4pSVYmlsDfglyvrfhoKUJRugngkIsPfCVUgqTK5GhN
	xEoPgKjkqyz+mQdIN5hhxTNJcNwuFY8CKbh8aOEnEHPRg2R5RIUptYg4yb0UgozrDepBKS1/N/F
	LCC9ZWlvv9w0n1pTzcATrsnwJUQ0swgtPSFyZc/88QjIdHdu/n9guA7IJPzmLLrcU7NQ=
X-Gm-Gg: ASbGncssx02WwDY4cr6Iwb4WEWYaHDjAhJYyhUHg1fI5wG93uC6C/JmNqHjPVXzFV2u
	y1P89xGNTmoGir5Jqqkz0krDGirS9MJaXnMsezHklH0sofaJjyfYSaJbBD7QUxHngtpRXvAGQIB
	z8e+iRX3fmz2KIJ4V2ep5uJvPNfFz9Z7+H/zxHen/iPvH73Ruu4zoUYLEPC8thG4XMcq/qh3MWU
	TOR24qfxDo5/M/xwAsR8Gif4Kl0qa3vCjteTgqXXoqzUH9b8aKUwMhm995gFjoylIS7rxs7hGLS
	Z7beQBUPYDTiwKjLC1m8DMauiF3PkF1lm/oQxE/cBW4xjkAMaZQA+QiMEq7OgvP2s5nV0h4KOqB
	hZiA=
X-Received: by 2002:ac8:5a07:0:b0:494:b722:141a with SMTP id d75a77b69052e-4a73c610d1fmr21771371cf.13.1749928745789;
        Sat, 14 Jun 2025 12:19:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtvCIElzY5rB8ZQ1ay4v583nOREgAN3HqTp4Uk9iaSzJMhURaskdck+1YjGvG2ZGck1/8UTg==
X-Received: by 2002:ac8:5a07:0:b0:494:b722:141a with SMTP id d75a77b69052e-4a73c610d1fmr21771181cf.13.1749928745313;
        Sat, 14 Jun 2025 12:19:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec897acfasm345456766b.161.2025.06.14.12.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:19:04 -0700 (PDT)
Message-ID: <75fea0f5-88ca-4099-ba48-997e46bf4de5@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:19:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics
 clock controller driver
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-7-b34dc78d6e1b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250612-qcs615-mm-v9-clock-controllers-v9-7-b34dc78d6e1b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qKr1lxzZEmfXl-TTDO-1XlE2nAEelAiL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2MSBTYWx0ZWRfX01DZC8nM6gXw
 lt4Gd6T4AOSNyh3nKO3MHoDEuuw4MCK5ycteBmNm0tbVW/BY9YEZfO0VGCReAq+0XDZTJqueERm
 0yRSLz3xazgXi9SehhKEnoeCT+BtXiDergfh/EUerL8dGJFI6yv/a5VK9n7oDI2iNIHW0ZIMos6
 ruBVvlGN4IoDi2LTxg76yt+0GrKProFy9R3AbmMR5vC4kkUevJHv4S+1+f0cQGPglvlZFQhL7ha
 smkQAVj2gIA8tAl8ZEofVVtmRSzTlLcWyWAN2tEWMhGWIg1SmlpPKYwKv7Y6VI1I8gQd/H1z8iU
 uJlRzbcRYaxR1j5gxsmFE3IaQqEU365zIO/NkeLX/rv9LwNgmoIqEXDU2s8ea++RjdaU1s4+LeE
 e7RL9Z5xGDDgeAson+OkfINUD8PBGIzgrVrOAS14j4SCAsceUQp98eD0U7GFvrSzXyQGOfuW
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=684dcb2a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=3ze65spd1aMdTggYaI4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qKr1lxzZEmfXl-TTDO-1XlE2nAEelAiL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140161

On 6/12/25 11:55 AM, Taniya Das wrote:
> Add support for the graphics clock controller for graphics clients to
> be able to request for the clocks on QCS615 platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

[...]

> +struct clk_hw *gpu_cc_sm6150_hws[] = {

"wink"

[...]

> +static void configure_crc(struct regmap *regmap)
> +{
> +	/* Recommended WAKEUP/SLEEP settings for the gpu_cc_cx_gmu_clk */
> +	regmap_update_bits(regmap, gpu_cc_cx_gmu_clk.clkr.enable_reg, 0xff0, 0xff0);
> +
> +	/*
> +	 * After POR, Clock Ramp Controller(CRC) will be in bypass mode.
> +	 * Software needs to do the following operation to enable the CRC
> +	 * for GFX3D clock and divide the input clock by div by 2.
> +	 */
> +	regmap_update_bits(regmap, 0x1028, 0x00015011, 0x00015011);
> +	regmap_update_bits(regmap, 0x1024, 0x00800000, 0x00800000);

I'm going to assume this is not the same ramp controller as:

drivers/soc/qcom/ramp_controller.c

..or maybe it is one, but we need to set things up on the CC
side

> +}
> +
> +static int gpu_cc_qcs615_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = qcom_cc_map(pdev, &gpu_cc_qcs615_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	clk_alpha_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
> +	clk_alpha_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
> +
> +	/* Keep some clocks always enabled */
> +	qcom_branch_set_clk_en(regmap, 0x1078); /* GPU_CC_AHB_CLK */
> +
> +	configure_crc(regmap);

Likewise, please rebase on Jagadeesh's series, which is now in
linux-next. With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
