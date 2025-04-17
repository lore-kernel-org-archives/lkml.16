Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1681F236A77
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888287; cv=none; b=OM+Up3a7wZ1KQl6QRxiAvu8xof1+lkpwIipA1bisRAQHJtA2PC1IncvV6QDek0dg5V3UFWOec7Op0r/m8DYivBpWJgufVzyPNEuAQLXfscC2bZhup+4wGPIdhpr7xCIQqPCp5CYHzOPUh68kzUNYrI4293v6PQap16rmxL+IAlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888287; c=relaxed/simple;
	bh=cQFl5PUzH6hg0oQP041Wr6N3dkwwS+iRu/+8WAAEhHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hN2DNWdD+obuxvZgraKZBLdPWfthQB/WU+8k6H1pMtgDK9MUXqheA+et6TUEHdeoeez8gvvGBr8x80vrlUhApGpTFA6FmcXJSC+y+sgVs6DAjzAEhNP5xyQz6dTZrnp+R2BQBtFFiRpP2vTEtxKJybRGcRGNhElnZYxHVKhdaT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JAvYzxEN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAvYzxEN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5l7BU006999
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQFl5PUzH6hg0oQP041Wr6N3dkwwS+iRu/+8WAAEhHg=; b=JAvYzxEN2qi+MMUi
	ZC1VD7t5J625JEd9CrPq3AAkROFDv7AVAMbvQkO3obP0OSyN5T9Ucmzz5OGPg+4Z
	UXHDA1S+yX2j6xA/0Eu0PNDPmynTwngd0hpDdNMU/y1vuUHOhtdt6w+VoySpxsnl
	XAsxSHSuhnDGRC3s4lXR1skfZ6T0fHlx1QX3K0k6M7Ruw9tyAdVd9OfmpLs103UM
	IzgwJVxmKDOcVGSEZ14f2DbJljZbVF8vgrrHDkResKonzukGlYlzK55OyhK0eH91
	kfd2h57cfjtPI/KieNACUEQGSw/cy+f9j6VrolxIznyDvBMiBqTVs+H0RwTfEbrv
	/UKxcA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1ejna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:11:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f0c76e490cso952736d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744888282; x=1745493082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQFl5PUzH6hg0oQP041Wr6N3dkwwS+iRu/+8WAAEhHg=;
        b=xAI0apiWi2VM7a1FKaghT3+36dWO18AQAzOPJ0K9/ZSoKH3T8Mv5w2kGuyUIEEQrHA
         gcHVUW2I/7V9PYdKu6Ijpuv7y4ETsw5wmdcBuh49s4nPN1alnmIYT1ILavwlmGSbW3qE
         KQ6LSTw+98Ym3rcamkWav686H1fxUyUSGeRgWI/fMvDjs4GaPvFUFfrWeCvNDk+WAyvn
         +mp4EM6j2F/j3nGogiWCgtV4GAXtxIdewVBMrn6I88ljzBkR4f9lJBTV9qnjOj5qSJAv
         FqzC2fB/qe24OZAvs+mmD0EYY255Jfsk3+fYlgG8GNKyhsLxT/4V5/ynMdurngo0vxhM
         AKCw==
X-Forwarded-Encrypted: i=1; AJvYcCWN028ZPmFg5W0/+l6I9UOOno9ltSkRLzjV86sbgJVg1NH+BhLFylIxgzZtnw1nWtAZkfqfysjhsUXtsx8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6J9F1GfSgYKt2mSHpzjhRf+67b2ADNuLDiUnYBVhXRg7zbRPC
	cNJibH3yNPCHw8avPxhXEU+YFOfla62W277glGjPjYc//Gh/JhkbuylKD41Ua6zWm1FVc3VZNJ4
	mXb/zJdDbGh8EV+3hB3829sjbnFdcj3cHGeRf0XIusdWPe0zUREWupnNYCFzHkEc=
X-Gm-Gg: ASbGncs7XZpM/rRFcnbaY4NMCXJYv8VNXYIiYTd/NqiF6YYtM6chf/SraXK2EEhtPeQ
	L965m3S8rlzcHwc/kbmhxJTU2M415aIVRr3i/2vIDyYwU98hOUK/vruXGHH9jhE2BnTySId92ZP
	iIJ/DQCtT9bqOvrXhgsWbDJWpwyialI/gK9y5OGKM64bhlz/pwq8bBteQ79WMHYoVI7M+HwiFRV
	XE+OrNnv1RaxKF/98xG72gBO+/20B7deSQjQJhIWx3EOP9enctitlrOR/dCZ32c1CPJ0n9pz6cg
	fOE1c/44JaiBkJzwlDQhcuVd73Xnx8bRtD8KOl+CH9prCMvNvmstqKSZBC40MlZSbw==
X-Received: by 2002:a05:6214:b11:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f2c10be8bcmr1283256d6.1.1744888282058;
        Thu, 17 Apr 2025 04:11:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5kju+O/dWoPIE9Ybn1kg3pBvJPXA+KWO908qYET4dQsJeQp8XiEZRcojtLSXCqXemg9A1+Q==
X-Received: by 2002:a05:6214:b11:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f2c10be8bcmr1282886d6.1.1744888281656;
        Thu, 17 Apr 2025 04:11:21 -0700 (PDT)
Received: from [192.168.65.58] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd6257bsm278243066b.13.2025.04.17.04.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 04:11:21 -0700 (PDT)
Message-ID: <bfc3247e-16e7-4897-bdbd-dc7d82d45fa3@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 13:11:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Dang Huynh <danct12@riseup.net>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-4-1f132e870a49@mainlining.org>
 <f85195a1-f55e-41ea-967d-b758014cba06@oss.qualcomm.com>
 <93ea35691deaa1ff38d229225e26cf41@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <93ea35691deaa1ff38d229225e26cf41@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=6800e1da cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=bBqXziUQAAAA:8 a=L7gxQ87vPTAOeZ-rjWYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-GUID: Nhv8tN3ren86QRTRAMXBlZ2wmne5w-Gw
X-Proofpoint-ORIG-GUID: Nhv8tN3ren86QRTRAMXBlZ2wmne5w-Gw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=716 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170084

On 4/17/25 8:20 AM, barnabas.czeman@mainlining.org wrote:
> On 2025-04-14 22:55, Konrad Dybcio wrote:
>> On 3/15/25 3:57 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---

[...]

>> 0xff is overly broad, please document the existing known speed bins
> There are no speedbins for 8937 gpu. 8940 have but 8940 is not scope of this series.

So it would make sense to either drop them, or fill in the actual
values here

Konrad
