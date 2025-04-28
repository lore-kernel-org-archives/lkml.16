Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AE01F561C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745875180; cv=none; b=f7CBtuGbrbijgLON2bF7FiXBQIvoHvMJZMh4yWIZhVOO12uRc3lfixYCiUdJtF9CoyrtzxIXixThp91CHb8GYP8MnOoqn7Gu3cRbjFamsQINirqmQEWKWgLIV3hCULrDTAQAmFvpYbhVCNToOaprISv8g1JG46iGd1/X6hK8xYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745875180; c=relaxed/simple;
	bh=bJ/gzAeGT4ZbtCzt+JdrNTwkoS1y+gkxREhjPG/Ab9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ioqCW9pYm8LBXo3MOaqj/0gUemjpEJtf9nyAt93ImGn0iPqHi7QLKau5NTEzMLFFtkDppEX1yMBpp2F4mQW6z4eP/kxFyruMIV9PvnXmXS/8sM0zcqEp5ZrL2qMb56ameYY1hyDF/ijZjMaXJN8FkBZCGOns0qB5XhtKh2MvAiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNTaQp8O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNTaQp8O"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SL35tC027135
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1p0DQQl3Uv/CeewEIX8WmFJDpqWu+zknhFq+jDxcqzs=; b=eNTaQp8OWPZ8bjaJ
	siO4gZnXx47CjAcBmt71c18UjDCk4ZVh/jMyqSEZUJzIvyn/7fefYAXn/pYrF1bl
	p2KMxaJaRMThp2AKhC59qPuHUKcQGa4trnmhLTtIiY/T6e3EOD5T/a1bIHPuplle
	XPySL3CsCCVI21Q0dsmwg8TjaTRk3d2xk+CDoE2Wmci0cdhAR0yNWZtf8sYTQ4CV
	0RiX4tWV2+LjX2zdXzHlspi9TvxrvSPJkeaddZ5dALUxBNAif1H2ySlaJ0MlfiKW
	LSV5Ro3kfMHAOT55MgOnsnVtbBSI234SnKXf1Ns8JdkigwMqJCWzaxtOFUfhwIHS
	h6fGvQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwtccc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:19:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-477608e8e4aso7457251cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875177; x=1746479977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1p0DQQl3Uv/CeewEIX8WmFJDpqWu+zknhFq+jDxcqzs=;
        b=rhNfl8TNVTU21EGCLXJw/QYUA8GpzY2Vbk3WGlaej1K6YAkAZfTR+PRk2kKcfw/Btn
         yUgD0x4mIbMcwQ4A1tBMOqKVQYRWAWlN29A/bpXMxdKL3wjmPnY6vW7oSR6R+okSwKr4
         /iOMBtJi2JOf8bXVwEGY256+O/4CFm+f7ivF3ipZFEVDUCMTCECASwioFkN2cCdQL5Hj
         /DEAxLbIxhbax+k+OtdvX6IHJmgbe8FSjIYElNcaCIAYI9C4wkFonUYFJ7lXdlkNbljJ
         tFMxaAlFXKBrgiwXlpnXlZA7glCrkrh2fbZGGNJOt2DH6rcH084PHoQId+DBtNB/bFgM
         bdFg==
X-Forwarded-Encrypted: i=1; AJvYcCUGxaO2xqADRQS3xGer3VgIv5Wlj/UqmYc4OzPfN0IDGyLaGrVesTL5VZdcsXGR6oOiaoyAlIL5uM8Ev9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmMXhCdjqU+J2V7UHc76ZbZul60tnWK86UWRMWt/AfH6LN+hX9
	iDSx8DC/ueW0kRUaA4LhqGVGu7c2ly0WK/9FV7u/5BRaLuk5OhwwJP/fW762GnzTbRwS1XDBm5V
	12gLg5nFtdBaqlAhL8f/KbFjwG4sPmcMlP6M7hkvcUcZONj6bJGuImQhDX6NIP80=
X-Gm-Gg: ASbGnctB1aif+VVAzHLehGw3iWGU+XLv2kdBTNxtPqrYR9ByEQtxnRsft7LqJvaQ6FY
	ftoOKMrKwGHmn1qWrScIl2dJi6aaMJEO3FvL+u6m4j/kndy2IyR1IlqPG3xYHpFQ80Cy2mltlm7
	HcSkKoj9MT0meu1uei+A3hQILqQp2MJ8WwkSQ7S/UgMfJR5vAPQtpSJlyuigH2tB5QnEPUbfTQw
	TLGNeIxoIoVPpgZjqtF+er3A8StjPffBvYhQiTPr0DotSQy7oVHt9cidBBo3eGQVNS043CzKF9f
	X/oCZ8kdem8Pkwrhf/aH3Qz1mtx07in4VJ2D/nQT5FUqrLK9yeEmBUmQHJloFMJMEQ==
X-Received: by 2002:ac8:5d43:0:b0:47a:e81b:cca6 with SMTP id d75a77b69052e-4801e5ef61bmr86239991cf.10.1745875177215;
        Mon, 28 Apr 2025 14:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHGM4Gsyyf3DoqVCxTr5c/Fx29SX0hifWAwRSJIcxlPqb02dtB8cwcCNR+5BkrZ9k/UWtLcg==
X-Received: by 2002:ac8:5d43:0:b0:47a:e81b:cca6 with SMTP id d75a77b69052e-4801e5ef61bmr86239641cf.10.1745875176771;
        Mon, 28 Apr 2025 14:19:36 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41c431sm693197766b.18.2025.04.28.14.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:19:36 -0700 (PDT)
Message-ID: <41df5398-79f6-484a-8ad3-f3488eb1b71c@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:19:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
 <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
 <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oicjORJw4CY4fxYyA7jLYHygsVEGgEQz
X-Proofpoint-GUID: oicjORJw4CY4fxYyA7jLYHygsVEGgEQz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE3MCBTYWx0ZWRfXye0kNegk9jp2 tVGMfulQBS4dXjdwsKLRouBN8sn82DroDIp46OQgjlb5DV+/FXY4X9PYISVgURCw3ayN/sQsu0O PLKjrBxO3fg02J1/mDa7jmG+7AHob7wKmPDgkVBrRtIyNvVvdSmp8D5/XKDVCtso24RzagRdrBU
 a/3rzgTtlOOfEni2mSa27LoLI7JT/N6dmgbJSjSWVlz5ZwLEKb9HfkDhqmJfLTWNcYtq+9MuU98 Kq6qbTjkdq81uINCM+R1lMjWq00oohhWUtN8heMSM9SO8h0ggzHdQfe2C4jAI0tgnqKSvj7xaL0 jIvdfoYy+RTwpAcVirxduPG91abxTWOurlvJg5rTwjw8wPFVpzqXJ0iYe0txXCJPqXsBj+J2vdR
 /botB27kgt50t67nXmVsWVa+9J/8Uu3rEkYE0eK2K2aihGaRuVUv3iFZfohrvq/thKw4y9ep
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=680ff0e9 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=dalwKpVopYczjXflRRgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=665
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280170

On 4/28/25 12:44 PM, Akhil P Oommen wrote:
> On 4/14/2025 4:31 PM, Konrad Dybcio wrote:
>> On 2/27/25 9:07 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Add gpu and gmu nodes for qcs8300 chipset.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +		gmu: gmu@3d6a000 {
>>> +			compatible = "qcom,adreno-gmu-623.0", "qcom,adreno-gmu";
>>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
>>
>> size = 0x26000 so that it doesn't leak into GPU_CC
> 
> We dump GPUCC regs into snapshot!

Right, that's bad.. the dt heuristics are such that each region
is mapped by a single device that it belongs to, with some rare
exceptions..

Instead, the moderately dirty way would be to expose gpucc as
syscon & pass it to the GPU device, or the clean way would be
to implement an API within the clock framework that would dump
the relevant registers

Konrad
