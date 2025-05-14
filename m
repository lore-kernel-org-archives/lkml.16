Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4466D29551D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747254810; cv=none; b=kW4/FB9XqZNHdgalyIx1vkezcsqQ3R/sH0UNFXTUW2pG0CA0jjIG0R3rDF9qnhP/ZccTLDqbyP8Z2Y8vj20zgrW1YZJGEzGYis9vV79D6SXW/RG2UHmVo8F8EmFvb0TIp2mD8G26O5zmdV2rrvt331FrGMmpHEI/qIC69rfkD4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747254810; c=relaxed/simple;
	bh=3JJ7O06zzPRxbsW0ejcx9ow1b/P6QnTdyESgBHO3Xes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQSJ2O+4/WElLOlTindn7Fza0QiWvgNb+qrd4fMd/TxabThHwUn4FhEWNWTuq5kT2zjQ/tobNH+aDizK+ZBV77vYKUDq4/a9uXsUw4lp64F0gHp/pPo2PygP0+/5NDJrL0Vkx3ZF/4gb96Hzc6evG6lsl8Pq4rHYzpaofqtxTRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRfCfxKj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KRfCfxKj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJ9AZ6004725
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	haOjUL/2+ahDhniM3KOvCsqIZkIBtousQPG30cDhYgg=; b=KRfCfxKjLypETTfn
	9PsRkmNFb6gePGIfesMsI0hmolJOWNPr0Bd4B5DJGq3LateHOPS7cYKNPP9cjJgB
	htOgzofJ46Eti3/0HdhsysiY2YMxyN9TVjmYozD9aWyIbp1hNIuQPB0Om8DirGOM
	NjB7KhvVP1gNAT8BUWaKv6djl0/nJFo1Pj+AxTOQtg4lPUoPMRGAhFx0KpHJtZ59
	PxMHQdUCboPwRgLu6Z7Wfd5PscD56U8cjtaKlB/hq/XUr6VDcOG+mKYP9Co/6o/Z
	Idnu/f19v2zStpHKNCQU+NDH3vFBsaqNlgC73Cdo8iw/ypSqtlL0iuPMctOFLaei
	W9MKzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnv01w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:33:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c791987cf6so47709385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747254807; x=1747859607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=haOjUL/2+ahDhniM3KOvCsqIZkIBtousQPG30cDhYgg=;
        b=bnjESa9KIznt/zcZis70sM7pl7SbneENYd9i12xKZQ8I028mNImMdTy/+5MonnKzVl
         eLuoF7/Ca28NsGBgIxIlcwMoIvoDrKSWLbmsC3k3Hv95GEsT4KJyZwBx7+fsOHKBTyq1
         5I9wmswQLdXj/lPs340hw8Xf4CsRdnD2uHEtHXJMgqBJU/cV0aEPzu8OcSMN1aXQAjV/
         mQeBHk0Gwg5yEsv/ZUKYJUGSihExxox5CUsdVgIYjW+MRUP5KiinRfjSCJe4cSihxaDM
         9HomIzxfLWy/tnCGoO+YoD/qXvi5Lp6AjnzTwhSsv1eo3s92JSrrxAZN8BRL6hWEPHfY
         hS3g==
X-Forwarded-Encrypted: i=1; AJvYcCXqAR11pJGqUMgmWDcgttaHna0exXG9v/x0XOgiYavbErwP4QQ8MUrY+cavqgNcD+M5k6MGmZSa2aTl0T4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0/RB5/xQj8ZCV7cJt0iY6vdKoEj+2NvRZFFk4+X5ycDEC7/RF
	NJOcAFPvssp5kAzVgwStO06NHcbxarr+46LGl0kbV47uVLqlFBIpcT+qVPbL0RPiubWHcl6NoLW
	dJXtpBwy1LbfxKa567+dL17ywcAGtd+CshrsRpWFiNg9P8HU35X/XN6ssHFVvwgw=
X-Gm-Gg: ASbGncvwp7o/1SOhqkFRNAxjUvXFugSRsDEBwxZXLrcj4l06hOjAU99QgIucTxOhpEV
	tEMFFv1ZOI8IEc+g6HmV3RDffUTVE2tbVxPawyFy0Ruo24EB0Ce9QiyNVKqfPoDT2ycAJwSBLcT
	BYscfLmhVNeU0UsaHwx2ds4JLoEqWxdlaS5+FtKhHt4Pwh9SpPv9xtZ0We0s6aGvJ71/NGQIX6J
	qdc3VZgOot0EAv8DX4WhqYAoR6+T6niAh/Pv+VHt4yowrzXjDrIe4Yne/GRigETlBuTQiNgM38H
	5224eUdxnY9U3zmQr+CyBTn83vb54MzhQCuGwC+vD6LGOpxwhJwUzwgJb9h/6j5mu9GvvyABqd+
	PxjwJtXWZCFMm4UmdxqxUcHjcIhXDtfUItrCs1gqyNYeQs0nocDUB7/N+zPzjM95/
X-Received: by 2002:a05:620a:4507:b0:7c5:3c62:804c with SMTP id af79cd13be357-7cd287e189bmr703171585a.21.1747254807002;
        Wed, 14 May 2025 13:33:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOV4okwXjWWNwSu4MIXwUq+SAGOmRck3i9Le6o13lfAoJLhiKhy7BYP8PQCZVJ5tU8Kv5hww==
X-Received: by 2002:a05:620a:4507:b0:7c5:3c62:804c with SMTP id af79cd13be357-7cd287e189bmr703167085a.21.1747254806624;
        Wed, 14 May 2025 13:33:26 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a1:fdf5:e1fa:2d19:970e:af5b? (2001-14bb-a1-fdf5-e1fa-2d19-970e-af5b.rev.dnainternet.fi. [2001:14bb:a1:fdf5:e1fa:2d19:970e:af5b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c358ae77sm20785521fa.108.2025.05.14.13.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 13:33:25 -0700 (PDT)
Message-ID: <d7417290-a245-422c-ba00-3532661ea02d@oss.qualcomm.com>
Date: Wed, 14 May 2025 23:33:24 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
 <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
 <9a05d545-1bf2-4f66-8838-b6969ba37baa@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <9a05d545-1bf2-4f66-8838-b6969ba37baa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2UJqIvnL6kWmUGhqBs_Qw2uIZqmcp7Mn
X-Proofpoint-ORIG-GUID: 2UJqIvnL6kWmUGhqBs_Qw2uIZqmcp7Mn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE4OSBTYWx0ZWRfX0mmj6v6EDwwP
 9tFEHA3jn/aEQMz5goNGBgZItdZCbEUzar48Sc4ReIIzPV+F5dO6JhJeyWKywH76N6WJTjWiqSJ
 cAy5l8CEtR0GaYOWjyeIRY24WkejAYrEKLMx7CnoJ1cJhVMWBEJomBuyzsEn2DIaNBy5aYI/RAj
 G77TTzO1R3owFT4Xzvz5LFHL1HZC358Qhhh5OqO6amllze0O50CSl9tm9/9QQ2DO0/NiUVko6m1
 7VbVrHfUrgHFtg/5viGZ7wcZxoii9ljvOCbFmeLtyJU/dcW3YC2H+1rJC8hqlR4ewp+e1fCNHgt
 UNDMqoiz+ylsZnNggED9JhBQcYY78Wn2Ym3K9gnXQmFUaLFyit1HDaqSpdutN5N+NiiLBxrpOLK
 gnqxwjHgLq5HzmdMaJ8c36Sixhrnta89HBfqIwX3Rgqs4GyLLVMWWROOdwZGh9sazfF7AczR
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6824fe18 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=NiyHvUd7E2bjcOnzke4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140189

On 14/05/2025 23:05, Konrad Dybcio wrote:
> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
>>> swizzling) is what we want on this platform (and others with a UBWC
>>> 1.0 encoder).
>>>
>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
>>> bits, as they weren't consumed on this platform).
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---
>>>   drivers/soc/qcom/ubwc_config.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
>>> --- a/drivers/soc/qcom/ubwc_config.c
>>> +++ b/drivers/soc/qcom/ubwc_config.c
>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>>>   static const struct qcom_ubwc_cfg_data sm6125_data = {
>>>   	.ubwc_enc_version = UBWC_1_0,
>>>   	.ubwc_dec_version = UBWC_3_0,
>>> -	.ubwc_swizzle = 1,
>>> +	.ubwc_swizzle = 7,
>>>   	.highest_bank_bit = 14,
>>>   };
>>
>> Add a comment and squash into the patch 1.
> 
> I don't think that's a good idea, plus this series should be merged
> together anyway

Well... Granted Rob's comment, I really think the patches should be 
reordered a bit:

- MDSS: offset HBB by 13 (patch 2)
- switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
- get a handle (patch 4)
- resolve / simplify (patches 5-10, not squashed)
- fix sm6125 (patch 13)
- WARN_ON (swizzle != swizzle) or (HBB != HBB)
- switch to common R/O config, keeping WARN_ON for the calculated values 
(with the hope to drop them after testing)

WDYT?


-- 
With best wishes
Dmitry
