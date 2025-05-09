Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A8B1482F5
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794211; cv=none; b=oYQ4tJyy5xgYEJWBDCbp08PlubPhliG8IbFv+hgkNRZRtUCbAS6sQMywjULEZj5XxXPLDY35meNWXBGK1qcIVxeHAXp71RlmBZED9zt0JBBjmYI+ilGPIRfOUMDExAKXtAYG6JpCOLA/kTeke1TDaixmj9m/Gdu1Fj9E2tXnd3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794211; c=relaxed/simple;
	bh=z5Y98Dx2UEyRxwSsfaZlWmpmk6jTclzxuC7MxxU33FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYciinNdsAfn45Fbsoxj8awKoEgDwK8EWM7nSBjPA9TRgIj/TDqzOlk2vTMwW3rZHMlFSMe1sUCQAzPUQazmXDqr/DVnn8Wzh5vwIN5F7Ps9BkNJtQDy6GpXAeD/N9Vbni0WFHotzAOhpu1HWDHPVjWNGCD5GMj30WdS3QmXSW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OekZo0N0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OekZo0N0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BwbHw002550
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 12:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nj3eTuWQfQQ9acGARQe0moB1OSB4sNdWAMULwa+W20o=; b=OekZo0N0lSQx2oHV
	8DoRNN12uLa1TXCMhuzv4XDkf67zS3dqE8tOuGbnGaaWxZI4B0rIoijr28ZkP+Ot
	4CnkSgwh4EuXKJmY+jpWhrOHszRvJCKwUYGzn0GP8IqfEnVxjd2Xzsz/JkawW8AQ
	9rdYXD1RaRU8oDuSVkrfqYtYX+KYzTTRCsUKw0d8kC7EZsURtxeClGOp5h2vduuv
	PT6Pjdn1FWFlkjCzAf4rJIAnj5uXDw9rhLGCfPq6RWRdf3y3f4EjbTCzFtnkRTd4
	lG9Nf0g3go90LYKcr/6uZHTTGshDsr8Ce47ySHa3zCvBqD5WdjDjGKyK8QgfAEqQ
	9SYf7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5cmbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:36:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c552802e9fso50616185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794208; x=1747399008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nj3eTuWQfQQ9acGARQe0moB1OSB4sNdWAMULwa+W20o=;
        b=LDEhUAxC4HL9xfhvxUWeuOCVmDINQKXCO5pv+55G7uYRyKy90mZDDw7zmEnI7o0U4U
         cqExajJ8orWW2fT4+Mr7TbCsQksWkgZbeTmX54EFtopB/NugM6yrh1XZnZDbF3B8Tgb6
         yOrvfbHlLBL/oJ5TX+SI961A0YDSr9fO4i+lzD2ebA85qW8oOgIiFUGxVl9tZMIY0t9+
         31F6Z8ud31LjWK8NIsatSewV9uJIgmF+oSSjEgK5aFMLX76tdzfm6p5MluGrtnjD/ksG
         K9nczPAYjNaYrd3NXoYikswc21VtlFwC6NOJzFznV3Q9s/BwdO6hBWkHrOyU79VVhPmn
         /G0g==
X-Forwarded-Encrypted: i=1; AJvYcCXCh9haXn1EaAmysBmk3OF3h/ENlsyuJplzTyAQN4D8KhWCC3B8DtiVYBGFofUeQCliJjBDEwkN6BSS9C4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycilwyz+0I7c/m9VgKywsnC+naHtZpm0UYLTvtDoFzYqS2Y1l/
	6qAuyO0kh2Wb9wSRCfk9KOBuRDVLSjAQESq+prv8oy6VSqaI9qu/bF/czj5vKUt+XCeQmlU1TvX
	62tXtOdM0p+qUdgIUAhkqdjjHFFHF34x+/WgEN7Ajk3KUth5Niv7cLpM0d1xsa+c=
X-Gm-Gg: ASbGnctOHcFHAkvJExyJ72OaQXASn4x3hVnjtQJOLBuLJCmnPftAwOGSx195BMk+jgU
	fZAHoIe8922t1xsxY1uKnkIHqoKetGtEotbhux2dGfq1dKJN6+tvVC9i8/osMf3KXrH6fnICw73
	uAJIvAj7/YOmvxuw948Pvtaf/EiOToodSLH6UIX2HivHH+Px6hy9bAOK11MlTPsfCwem9ODj7EM
	V9mbtNTxddq055v/NF8YxsjXobz2TRcVqXBm/gw7aC2SGwQlgSPaGhpUBqQLcKoe/egQKBb5RUr
	FUOHnTOiMwA0fUB+BbGWdC6KaT16p9GbLWxuHmBnEL/Ws4uDGn9hSFixGOEx70n+7qA=
X-Received: by 2002:a05:620a:f07:b0:7c5:79e8:412a with SMTP id af79cd13be357-7cd010f40femr186040385a.2.1746794207724;
        Fri, 09 May 2025 05:36:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQhiMLUJ0ERqiuafBgH55DApa66wpoH4lt5Gorw5mA7CwOWIVCyFKphnkpkg2Nv6S/CahJtw==
X-Received: by 2002:a05:620a:f07:b0:7c5:79e8:412a with SMTP id af79cd13be357-7cd010f40femr186037985a.2.1746794207301;
        Fri, 09 May 2025 05:36:47 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c83d9sm145517466b.28.2025.05.09.05.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:36:46 -0700 (PDT)
Message-ID: <407a75cc-7a8f-4a45-adfc-fdc1b72185e3@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:36:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 06/14] drm/msm/a6xx: Simplify uavflagprd_inv detection
To: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-6-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7G8QEoadxOGOi22QCePR5C7X81wRZ2yzLGCaA8Um63ibA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7G8QEoadxOGOi22QCePR5C7X81wRZ2yzLGCaA8Um63ibA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681df6e0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UaTn3js9I2XXQmNgdkcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cK150tKAlMADOq3hOIE06h2qIC2Sx-Ai
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMyBTYWx0ZWRfX9uMWH8FUnE+v
 CAZhqy7HzE3Ce8d+ZlSp40xJh3w5ZQBQTjuMusoqHZwQVm9wvfwyyg6WK3XPiMRoX45AoTOX5nB
 h0pNWQp4lM41TJDEf3LmJ425DBdZcuAmNaNjldpB8YbR2cfNOl2SNsVzTRMdawLKbrIdIknC4se
 8PZ0PcwnVKhlYKdhViJHv+sdgC7FuEqFRg9tfUEztjowfwmqq8QMghJS/9Hs8H0LbWabqXi4EBg
 2OIm2HunaN/Pr58PMT2mcmi8YMjIPIDX7Zkm/71sweakXv1VkKLQI2AjJLcp9q2J0QKoyn2/JLg
 Bw007h6yS3xB0yfv6bEZpOZ0ucy7H9Ecgm/8U0qdw6F1i2gLFkYpiQ1hLknpzSIE2q7SC2LpIn2
 k4kW6iKrZ9+VdblmVQl0F7NA3WcCjZYYZhRcrYpgpFp4lahiNT6qtQBvMBk0qVir6FymTLsq
X-Proofpoint-ORIG-GUID: cK150tKAlMADOq3hOIE06h2qIC2Sx-Ai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=870 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090123

On 5/8/25 9:05 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Instead of setting it on a gpu-per-gpu basis, converge it to the
>> intended "is A650 family or A7xx".
> 
> Can we also set this based on the UBWC version?

Unfortunately that doesn't give us a 100% match

Konrad
