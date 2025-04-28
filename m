Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8CC18DF62
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861882; cv=none; b=dK0d6w6KxUIOpVYWar7E8jVR/zP655RWaxz6MyYQdFPKQK/0zjGp7Igy2I03tFc2e3m57YagiFP/NaQmOONNSSuKYOsIguYnKZ3mgGDUe03oLgldVaUYxnkoBvbr6ul/mWaaekZ+8rNAsH7a4q9W4/MrSC1AWIYuBu2fUDVp3ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861882; c=relaxed/simple;
	bh=Ew+kA3LphKC/N1vEi8EfSsJC6NyDfoTxzxJDRuUttNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0rVu3gZjywruyQVc2xEd3j87flH2rvanOL9Sjjhm2cDkSckSEC6QJiCk9O9K+xEYDX/7cGjhMTPWy8q1x86HBcmCeSzf71HKQn61hSu8+WOveFqCzvnoUzzl8gJ3ZFPZrUFRDFX3COgqOZrlq2yr8xV/KutVtsPN34QwpCAl44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZHblShb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZHblShb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9q1BT001893
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E06lZm8/a8C+GSuWM+FihQN59u7SXIBJ85yum5YDOXE=; b=YZHblShbGYNTrSv7
	6l8YuDnhk4kwHicWcZNLHZFiMjFqQQ71yeNxMBu7tCj2IvntGthvSSl2QWQrhSbA
	flD3zLQLqBJ5zb6dnffUEtqiIMcNiZ1wAmmt9v6RsmXgvF+tvF+mICvSMaz8PYlE
	i9Rm3NO/eXGyu68cbWI5aNXuH2kd5PJKtjjpYmRKxUbdrQqrjPl1g6Z/Fxl9S6SF
	61DreWw84ULgf3sseE6SBDot1IpuxbqJF099bnvgKmBqQj62hl9UUArhdH0SdKKu
	1A51uI9iCm+mwQmddORI7tyqTMw0HRJSwk+MToP12pM3PNNnPVvYgUR99eWBcajN
	VXwkSA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn0uqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:37:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22403329f9eso46072775ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745861879; x=1746466679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E06lZm8/a8C+GSuWM+FihQN59u7SXIBJ85yum5YDOXE=;
        b=MdvQ7rwBtKL4u136eXRfXCUwn9+152rB6EWjdh+AyjQ2zbgaH33VWbGZAv1qRWbKlW
         OhBlCG11RG+KjwTO+h0h1uEV3fhU5xa+zNijn0BAHiwBcLkps9xnqY8Jn78UuX1a4Bok
         +/RPwCBs9RXX8RTcl1Ser866PTuo+Goh8g6GL8KUQ/WVVvTSIecKLk4+wZvacj/BRYkA
         7OF4lhyvw5hWApvmRkWHCvWBqeZkYmDoIpNN8glju5pdBpRk/HYHncP1/jzN4SN7uvBh
         Wc9Y7Nm8YLodC/FZv+U9LkpxHAPgJSFmQYBssUFVkg2pf4BbNCn9S9Va8D1JC7X2OgMJ
         LhGA==
X-Forwarded-Encrypted: i=1; AJvYcCUHv15auqSN/q22jbSuEGVTTbriaRkj/eyoq2HCtnCC+Acoj+IDJh2N8C7HfkLkxIalSYxMeuwtxcSWx8I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6YSBuZUvbbM7KmPw8uA8KVybvQESIqInEWQB7RmhKXvXut9nK
	BO88j6X6jlW4SbzGzpxS+AXaQJqmvDR2p4BeO/rpCpeClBuVGfACJ9GDuj39vuP65y/n9cBvk/X
	9eYHV3sKpef6z2dFI7opTnsEy8hNBNrbCk4udWMQWX+mCZV+Gr0ctsHmM+a3/bUhG0+GxEvw=
X-Gm-Gg: ASbGncs1GqE6TO/GxyB96V73vuzphZkMFImJTNEmlMmeRc0GMFq2gmafT/0dJD2Gdd6
	fNrMCUCXWyi9mRBqfUpq3V1OjgjDVwTBM5Aj/88dNZoYU6c/VrBEdY/llS51Hd5yYsiPkFhPC0Y
	TBoguPSDNgCCOYfQJWJwrmh81pL/VAmQrZzIfBPAmxNf29V7KIBRrTWyPE/40Nzmzn2dMyONHZ4
	EOlteiK06M/mqZj8RdGb8Ky5igLfVn2Nn3c8kAWLa0KuDx15sp+1YAyF078Ygt304nJbz/UV00a
	9Yabq8BBO9+I6h/NsH82uZ1UGSxt/gcW6RydfGG1
X-Received: by 2002:a17:903:1c4:b0:224:1ec0:8a16 with SMTP id d9443c01a7336-22de5fcef8bmr7664565ad.21.1745861878908;
        Mon, 28 Apr 2025 10:37:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQewCtmbo+z3XRi/CjK7rhBqdRvOkkoHW1zLJauNJXjHGgMmJZLsG1arrVNEyzH9XB33aKDA==
X-Received: by 2002:a17:903:1c4:b0:224:1ec0:8a16 with SMTP id d9443c01a7336-22de5fcef8bmr7664265ad.21.1745861878553;
        Mon, 28 Apr 2025 10:37:58 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.26.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe4desm86011245ad.70.2025.04.28.10.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 10:37:58 -0700 (PDT)
Message-ID: <2d85a2c0-8084-4bd3-b5f9-e7dfa8303b65@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:07:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: camcc-sm6350: Add *_wait_val values for
 GDSCs
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
 <20250425-sm6350-gdsc-val-v1-1-1f252d9c5e4e@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-1-1f252d9c5e4e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LSGLrLJ-q_5yP4UOtzR9FXmoZM_VtpzU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0MiBTYWx0ZWRfX+gmFjgYU+2Rf 86v2c2ZeLSexSgm/ZuAxFGqVbGxPFmtuY6/QmNoDWNKcj2feFTKEboMKEonNFpEJW0TnW5+q+vl 96ThTT/XL+RqMwQE6H+P+0P92xkKovDhrcOgqXeYtCG6FJcSAZdXCgTR1lRX0Ngn9+cZj+2YQkS
 XTMDMLorVFOaaSOarQwfZoMRxh8PpiqfAtiRPAEZURKTW7AKU2AXOz1Sbru8PNldYD7s/k6REwc 0a5RN2RAZGcIwvxL4v/AV3ITyTCLjvKNwZ1WcvDYhNf36BbS3OboYxFe18UM3FbanQi2DwYjDyt d6lKcst95SKEKSnAqPP7GTMeBrOJh0mAwWXSyZ+KS9QnuYoPLrBPwBHGcd4QOse1RrQzRh0hLv+
 9/CVLY2hTNR+1Ro5xWKGBtlX45gWivwcZolcHjhAhCzi0D3TdPqB7HcHrD2BTSYpK0t14BpW
X-Proofpoint-GUID: LSGLrLJ-q_5yP4UOtzR9FXmoZM_VtpzU
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680fbcf7 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=Svr01UFivMFfsnZ9dZkWgg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=COk6AnOGAAAA:8 a=fdW-LsI-krylFDxKIpoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Soq9LBFxuPC4vsCAQt-j:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280142



On 4/25/2025 5:42 PM, Luca Weiss wrote:
> Compared to the msm-4.19 driver the mainline GDSC driver always sets the
> bits for en_rest, en_few & clk_dis, and if those values are not set
> per-GDSC in the respective driver then the default value from the GDSC
> driver is used. The downstream driver only conditionally sets
> clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.
> 
> Correct this situation by explicitly setting those values. For all GDSCs
> the reset value of those bits are used.
> 
> Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/camcc-sm6350.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
> index 1871970fb046d7ad6f5b6bfcce9f8ae10b3f2e93..8aac97d29ce3ff0d12e7d09fe65fd51a5cb43c87 100644
> --- a/drivers/clk/qcom/camcc-sm6350.c
> +++ b/drivers/clk/qcom/camcc-sm6350.c
> @@ -1695,6 +1695,9 @@ static struct clk_branch camcc_sys_tmr_clk = {
>  
>  static struct gdsc bps_gdsc = {
>  	.gdscr = 0x6004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "bps_gdsc",
>  	},
> @@ -1704,6 +1707,9 @@ static struct gdsc bps_gdsc = {
>  
>  static struct gdsc ipe_0_gdsc = {
>  	.gdscr = 0x7004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "ipe_0_gdsc",
>  	},
> @@ -1713,6 +1719,9 @@ static struct gdsc ipe_0_gdsc = {
>  
>  static struct gdsc ife_0_gdsc = {
>  	.gdscr = 0x9004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "ife_0_gdsc",
>  	},
> @@ -1721,6 +1730,9 @@ static struct gdsc ife_0_gdsc = {
>  
>  static struct gdsc ife_1_gdsc = {
>  	.gdscr = 0xa004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "ife_1_gdsc",
>  	},
> @@ -1729,6 +1741,9 @@ static struct gdsc ife_1_gdsc = {
>  
>  static struct gdsc ife_2_gdsc = {
>  	.gdscr = 0xb004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "ife_2_gdsc",
>  	},
> @@ -1737,6 +1752,9 @@ static struct gdsc ife_2_gdsc = {
>  
>  static struct gdsc titan_top_gdsc = {
>  	.gdscr = 0x14004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "titan_top_gdsc",
>  	},
> 

Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
