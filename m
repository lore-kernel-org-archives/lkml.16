Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A57125D6;
	Wed, 30 Apr 2025 00:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745971391; cv=none; b=iveb43tyGI7uDKqUE+kQxz2YiEO/2JMJ1QxNrBYiR49u6dWHlXk7+rQs2d4otezGWjgsduvUMQ81CcUsvpypyY+7minImqwZRx+8b71pt0eF7CFGG+JHaIEalmpc5RL8dDEr7RWzVbn0wwaS8xhOMHkLMosjEHinZc3gOQf6hYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745971391; c=relaxed/simple;
	bh=ybvgRCz+dzf/NNkLbeMdq8YvtIuXlTyzJfE/dEmcCS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bHAaexx6qcM4I93mUL1hTULxGDf/RQO7p0/ExQpgOJzjguvbnxmEqObnLd/XuzhJ5iaG6jNUDX4PEugSG6QA0l1pnFrN434glKvkYwt+JeyGdPnpBQRaEFIn+uBEZZZGP1LwkZKlpyQ70j8hU/z2P/JDQ18xJdb+9DO0aI947Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k2KrdS/E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k2KrdS/E"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLauA2003005;
	Wed, 30 Apr 2025 00:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sDUFC07EL5L04iOtCWkVOGktF9HJDl88QjmbdKR3fUw=; b=k2KrdS/EMMLf9t6y
	2KpM7W3cjNAIvVJR2LLC06KbmRh0Clj9cqr/0lP9gO9nGw46gUL1nxhzqaZA+VUj
	1+9+VYLHVAWtBjKvsbNvr1MfYWSMgmmjeG+Tk9nWQ86DAEOspdWr744LvrdZ+nLr
	7rZL8hpGOEUC09dYB2V63YbWncVn10LCvhv1qTPWTRKA88AkPslsRkFeftOMm9uL
	rJ4I6onl5ZB8onfGoqT4AYr5ENThQI0tD12Hoe2k7jX35pZZy3IqypWvKaygoKMv
	rfcJwOl2L/alziGda3GnU4M13CxjwTbHiuGPK5ehtiUJwNVyE96q/9zYnnKbKuGG
	BXQwVQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u888em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 00:02:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53U02wXK005737
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 00:02:58 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 17:02:58 -0700
Message-ID: <eaef144d-3d3e-4c7e-9636-b56a1f61e3b9@quicinc.com>
Date: Tue, 29 Apr 2025 17:02:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] drm/msm/dpu: don't select single flush for active
 CTL blocks
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
 <20250307-dpu-active-ctl-v3-5-5d20655f10ca@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250307-dpu-active-ctl-v3-5-5d20655f10ca@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=681168b3 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=aUBE8IUH5cRvplel0kQA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: giJQVt-oUb7P0Kb65lxEDyjTOQkVRR8e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDE3OCBTYWx0ZWRfX6lLc25Sakqmp P0FiwD6F5wDxbnWeAkZGnzh77FmOpY/XT5DKzZd0Mn1NUBpptEyfn7XkAVWAU7+YAetYSZDKXC/ RZe2DeFzglMYDq3dCRPs4VgYuh30E5PKnsl1JAI2+XUQd0BFx/DellA7seQNFGWurPj2h+dPQv2
 o9Ct1pgbyj6Mie91cOLpM6XrADyg1KyTgJn4hSKZYTpKIfwF4Za3384cgdLkPHqIN4YBkENfwcz YQ8S7l0o0/35y4FYhzQe/ZN4BPF7RpF9V2xyoS2xLhuMrY1v2pUWNycnPblbaFXtJoyvt8ZQzLM kFnNhRfI+ykrYM9v9QbLv4ahY3BtXbo9ls6+dzeDl0daIzKxl5+o8LnKu8iy5VnE/UhALSD9lO6
 URBfN5oEcx5JB/OxbefogjZFiDGPROfRU8or+Gc/D7IMDAdx7zSD7swldroIce+8RZemfNOt
X-Proofpoint-ORIG-GUID: giJQVt-oUb7P0Kb65lxEDyjTOQkVRR8e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290178



On 3/6/2025 10:24 PM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> In case of ACTIVE CTLs, a single CTL is being used for flushing all INTF
> blocks. Don't skip programming the CTL on those targets.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 232055473ba55998b79dd2e8c752c129bbffbff4..8a618841e3ea89acfe4a42d48319a6c54a1b3495 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -374,7 +374,8 @@ static void dpu_encoder_phys_vid_underrun_irq(void *arg)
>   static bool dpu_encoder_phys_vid_needs_single_flush(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> -	return phys_enc->split_role != ENC_ROLE_SOLO;
> +	return !(phys_enc->hw_ctl->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) &&
> +		phys_enc->split_role != ENC_ROLE_SOLO;
>   }
>   
>   static void dpu_encoder_phys_vid_atomic_mode_set(
> 

