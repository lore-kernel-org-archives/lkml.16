Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001D0154BE2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009545; cv=none; b=UYL4oYcmGbgkSPLr7zUs49oe6qdHPlED+OlykITQwRgBa/sjRPvp6O6kDvMYdp/I118zc57DYyYC+Jtuqk1GaJwelUqBvkEUsqJIQnl0azOAqM9Phbw2xEdz0ogHYyylkZUjAg6pCAG1OJWd6mcgbjvPJzThB3+uv2tAJDhFenE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009545; c=relaxed/simple;
	bh=QYmTOn6Mr4dhC9mWN8gmhtBbHfTTI51Y1NKpL1+fT5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAE84vzhi9oM6Rj8IBe+QOhknQ0gZwWWlqVMLO9ZNk7fAsnw1A1zmgeOSa/GFp6DIlgVp4jPo2Oxie83mqbw5I4PNV0sthQKtZwQaU4TPXhdy/UNmlwgsbKILJ11aRMLmvh+IWjQg/jutQ03U3nRukW+k9h4hqQxGz7u02aUwks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5+fx0Jo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5+fx0Jo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9MDKI004141
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tTiniXOe50bWwoWCn68Sn+g32IeeFnNdfbw7A7ZGjr4=; b=j5+fx0Jo0PfTfwae
	r4fJXEQZm7/q/1U8/tiHRK7oFGTDIbCLsIw4diFG3EPx/nPJw6RosXpIEO1kFDvj
	dNOPul2XKiH2+UXo30R/a0AuwlkV6R/JzWXqT+V3zIBSdyvCd34cMA6QF/EEdBpU
	BJm7a0KRj5Y+wOPgmSMQNcEY6KnDHQOp6SN+0s18tvDmBYDcZi86Yp0FxldsgvoX
	iCt6JXcqZr+I4cWX21ySOxWsN6F6EFD0kSNhkBK8V1HevDPxdu2UvSeBD6TCqkzK
	e/4n7BcReNGPwxYPBUY3oURRuG2++kP0IA7afSu1nW4xwKJtdMazGUGoOnIxh08A
	wfRiOQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u49ssr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:39:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ece15fd50fso19781376d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009541; x=1746614341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tTiniXOe50bWwoWCn68Sn+g32IeeFnNdfbw7A7ZGjr4=;
        b=QIDUS1Jdml+0PeXe/e+g3z+066VOrFSEFg5tc4GL8yMr8QEeYmraD+Cg3HIEj78Vlx
         04M2nXyDhQSzcAFi2tlQJrwn3Sg5WxBrE7fooPcGRIvkOWoQKpH1qfHjJB9svDJo0WAd
         cOnZrTIhTsXfpo8HnICaK//cSNL0LsR1pxcfPDKWeTSqqhmSBQ9QBvufysumS88iH7wj
         qI9saUCCbQdOPv1SpKZ+vqaj1RYlGSFKoFAcBKTwp/5u/a4zkGVaIqGkRFg18rxfXtkk
         Y+gZFcISFnP2Xb5Pvxsq12C51Qp17dfEZMNRHSV0XdaZlV1tVR3Bmo1xfxmYXHF2Rk2r
         W98g==
X-Forwarded-Encrypted: i=1; AJvYcCUxsCXCaEHij2EX/yv9ipmQdVTktSEq/XwymykT04k1KJzTzdgMsiA02iEpZIzCXV7NbuxglPzfeF2MTSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI/gQQmWMICxZwb+HBUL9KkHYQ/ta7B17uLaMiplrxAWO+wpAA
	Hccq4KCs1gbi0ns9QrIqn9nPD8+oRyGfO7JZjf0ok39fgwvM1lGLxyDp6KyB1zYZf/fN/wXq31e
	vXlXlWkh7UF250UZufqltuFrRLjB7LhgEBrwSnVSeB4S5vJDNWU6++gJirkSfRkE=
X-Gm-Gg: ASbGncveJHQAacqSoGDYizQ12+04psOfN0RaPkMuhoey/wKDFuyvNb6BzU2NZbm+Bq9
	EUw9EeFLjOkgHVBX2vLALMUDpVQzJBs9DvBL8TfLQ+Opf+nO21rph6NVLCI/8CdlRzgIFYkZoze
	QDFWlxuKJD2EA0/6sWalLBLzKZAf+hZsISNOhbotxQ8ggcuRaE5XWVJUSTNp2umDqQ2WGRnii1m
	e8Y4l0WViLPPXyOYmXVCeSe323f8LlpCb55OJ7JQ4DIlUOgVH5zs2rpBHNt1IVQ9ewfgnjNXzVv
	yd290pvClmmW6YA08Bg9L506MlDB3nHiIjRQSR8fW83i5ve6qR7D9mhgUszDkmSSx7c=
X-Received: by 2002:a05:6214:3012:b0:6f0:e2d4:226e with SMTP id 6a1803df08f44-6f4fcf8da52mr14601236d6.8.1746009541612;
        Wed, 30 Apr 2025 03:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZlDZ7fgacYzToVTLAIqF1SbHulHpm3F3MMH+wjGvrRzv5uoIFNvo0UB+Ri+k9t28tLdOxCA==
X-Received: by 2002:a05:6214:3012:b0:6f0:e2d4:226e with SMTP id 6a1803df08f44-6f4fcf8da52mr14601096d6.8.1746009541285;
        Wed, 30 Apr 2025 03:39:01 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7035462c2sm8439702a12.58.2025.04.30.03.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 03:39:00 -0700 (PDT)
Message-ID: <f1fcf9fb-3be2-4097-a372-a76bfba6043e@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 12:38:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
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
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <quic_jiezh@quicinc.com>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
 <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
 <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
 <41df5398-79f6-484a-8ad3-f3488eb1b71c@oss.qualcomm.com>
 <hpfqpvkex3dtj6ieosce4phukodnoidh55vxpujyekoehhotqn@l434nae5gzdi>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <hpfqpvkex3dtj6ieosce4phukodnoidh55vxpujyekoehhotqn@l434nae5gzdi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F4fAoA5zfsor7ryRHfr2cOU8bNadeKQR
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=6811fdc6 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Y1ZdfsrSitFJjnkYTe0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3NSBTYWx0ZWRfXwZvFUMcLoQzK eb/kzACYlVXbYDSeIV6xEpC/YdIYnclF4iAufU3uWcIpZ3JmDdKuv45jZvr52L+GcSlwpGzJ/DF gZ/VS8BrEANGU4OqrxKcGfV3EltfzfAFwpliisvEREgiHHeMSMq7lSrTfA/Z7vbsLaPZ32lf2nF
 KMtYmgzIRnku08PcmZm+MfciCMOl/pBJep+n713EpR5dVue/Pdd68SBSAZAFBmEeaN3mz0GCISy 4nlyKk6GPa5Nof667SLvrzYOeNaZoNU/L4HRq6/ELzFYbV3r2oIr1d3sQw3wEpurESpbblRwT2i egzChoJiOSBYhXQ5CKo8GXi03QKCXOTr/fhYL/gvDTBVawje/jZPS5q4nnaTfyEei+mCGjvFj18
 R3Ut60EG/Q6BIOKhJ7qvebzEDruboWyK4LTVl97qaZfO8ZCmFcHASti3vmzfuaem3VaCfyvm
X-Proofpoint-GUID: F4fAoA5zfsor7ryRHfr2cOU8bNadeKQR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=762 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300075

On 4/29/25 2:17 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 28, 2025 at 11:19:32PM +0200, Konrad Dybcio wrote:
>> On 4/28/25 12:44 PM, Akhil P Oommen wrote:
>>> On 4/14/2025 4:31 PM, Konrad Dybcio wrote:
>>>> On 2/27/25 9:07 PM, Akhil P Oommen wrote:
>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>
>>>>> Add gpu and gmu nodes for qcs8300 chipset.
>>>>>
>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +		gmu: gmu@3d6a000 {
>>>>> +			compatible = "qcom,adreno-gmu-623.0", "qcom,adreno-gmu";
>>>>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
>>>>
>>>> size = 0x26000 so that it doesn't leak into GPU_CC
>>>
>>> We dump GPUCC regs into snapshot!
>>
>> Right, that's bad.. the dt heuristics are such that each region
>> is mapped by a single device that it belongs to, with some rare
>> exceptions..
> 
> It has been like this for most (all?) GMU / GPUCC generations.

Eeeeh fine, let's keep it here and fix it the next time (tm)

Konrad
