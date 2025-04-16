Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D9E233152
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836003; cv=none; b=hCs0Y1CGh2/4wCBerKDdeFqIeviUVh+4VwPN7TdGUYhy8Zl+9oImv6xg1a3E/K2ChyeVk9ir/MQwx5tvqdovCL6hfizQdbockPwEErSNx8bM/zwpKD2//QuzADwxRm8TdSCrU5oGk87JwC857sLc9J4rBNlLdUkt8cQLsyRvKK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836003; c=relaxed/simple;
	bh=kDu+tIWiiv3RG9q2EWbYK6uCMzCFUTTLqRKVLC0mQKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hH+Wi9kprOn9T/7FVcVt4Qy6KldNoeZ59Q9+4CoECLYxwUxoI/uO3WHldKHXs/DKbLhBV7VX/wMys2a24FHcU2jkggMzDKgWgGgxqQqvO+9UIVxQv0e4wzVRKse9yvzwiadNOC4JNxG6X1MOFir/6WlukEOSliQSmQztcGca7kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpwLEau3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpwLEau3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mFi1007029
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDu+tIWiiv3RG9q2EWbYK6uCMzCFUTTLqRKVLC0mQKo=; b=DpwLEau3Y+2DkDDL
	ps32G63sJlVwJ+6ZIG1FsHA4/Lf9gvmuju9s2ftVVke9aTTJgbxdMGcEqNlRdyrm
	JuCidCMnz+IxQbVu0b8ol00Bcg+vXY4HBmC5rpBoUtSJmd9eRETmMJsfPug5UTRl
	DDo5pzRE4mVhbHhfuJLtL5SWfzgi/T0Zy9GLlVSBS9EgFZm1iaceMOTwlY37RjGc
	RtsBJNsOLdFaF9xhCGMP7a2hv+OtYDB67xR8aSejmYLhnom4kyKRbTsk/OIDy9yx
	1vuYV8eyNzjmAEW/d+CeDkWn+8DlUF3z+jEZsliRiy69HgGzz2F1ndr6wfqXv5Uk
	ZDudgw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjmpn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:40:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5530c2e01so476385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744835999; x=1745440799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kDu+tIWiiv3RG9q2EWbYK6uCMzCFUTTLqRKVLC0mQKo=;
        b=AaHmYerqXop+8zokHZaweIQrcDen3KJ27QOBJPngimOhr7HMZj1ZluPj8KFvu6Osh7
         0kbfGCOYaxEndp/kcygYwMjXjvxxns7zyOSBhFJ/6NTD9UUVV9lHNF4c5ev/0bHQUDuZ
         oJkGOwH+CXqsZ+IEPrXmUEHpQTzvhEavzGuPbnGq06bnIneSy1Igpvr1kYwnY/NPtiBs
         9Oj+mrlOUC4BS3ZtQPSWWzRwfqeqn96K5gAn4Ef2Y+7haJ1oNhvKCYZZ9/2SXlf1i3Q4
         Y/kvBXgvZqg/kQnoN6c4ZttRXdo8pRoRZKNZ8ItPGxut9/W4Wvi3+4i3F5HB31D76awJ
         I4DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS3bkY04QV/dpGf8ANZqlIqV12pXUQA5wVy5oq5tkMD/GbTlSIROVzQ3Fv2dPZRBBJAfF/wI4adUUnLWc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4riQcSAMePAJeB11dTyjKFkamsIP2XY8dwFamP35/lLnT9ZYG
	Vmm+RkQeeD5lEyQGN572GjDWKmXaNiOLOdJJOALYm8G0EC6nmqQXVsSy4R21MgRSitjJjU/Yvcr
	0XYKJYEJaIVYzQy9EG2yIJTAvSEDjekJnTY53JJg2xW2L/ThK62dKlsvtPJBMn1E=
X-Gm-Gg: ASbGncsTsASU8Hr93sxxdRujGmXNmeHYe/k6KHWP626+xq02e9o3GnGSfKHr3fx/25w
	6RQZVFCaJHfoFrA/+DxyZ5l/ot86Nw7M1AYiJXMpOtzKiBwHg3CTfX8jcUlRYEjZbL+aqwMYh4H
	AtYuteo8OzyOw1pJi7DyRfMOemJ8pnODVVZA3X+nZjW+7yHwqBD234KPeRmtlzUiHhV2K2tKtB5
	nPBYFR+QJYSUIRWpKPdv19mf8EPXqFzxDlRpF73gxCoEAZCOBkTM4oesLYWTo/F5hINkoJ2l0+m
	zu3RBc/0HfAkGPCjXMy2DpFuzV+knjNNzntq6acZkrBMXrd/bVaVBApCvi0lhLkDW8U=
X-Received: by 2002:a05:620a:288d:b0:7c3:dd6d:54e4 with SMTP id af79cd13be357-7c91d0602ebmr62127385a.10.1744835999386;
        Wed, 16 Apr 2025 13:39:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzgDHx0UMfpo23gp5XKth2J0840BeS/rB+zsXeevtnGVzubmJ5n0ka+mRD1Wk7yKLA+/G4gQ==
X-Received: by 2002:a05:620a:288d:b0:7c3:dd6d:54e4 with SMTP id af79cd13be357-7c91d0602ebmr62122985a.10.1744835998836;
        Wed, 16 Apr 2025 13:39:58 -0700 (PDT)
Received: from [192.168.65.126] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd618ebsm186163466b.16.2025.04.16.13.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 13:39:58 -0700 (PDT)
Message-ID: <b9fd463b-5a34-4c3b-a6e8-7432e1a0f2c6@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 22:39:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
 <ddf29d5743e25f311cd86711f39f7ad0@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ddf29d5743e25f311cd86711f39f7ad0@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2crNTgKlylQCP672zVcB4Wo46NOuNSSN
X-Proofpoint-ORIG-GUID: 2crNTgKlylQCP672zVcB4Wo46NOuNSSN
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=680015a0 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=bBqXziUQAAAA:8 a=KIKYxIlc2-mGyxiTgOQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_08,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=852 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160168

On 4/16/25 10:33 PM, barnabas.czeman@mainlining.org wrote:
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

>>> +    thermal_zones: thermal-zones {
>>> +        aoss-thermal {
>>> +            polling-delay-passive = <250>;
>>
>> There are no passive trip points> +
> Should i remove polling-delay-passive?

yes, please do

>>> +            thermal-sensors = <&tsens 0>;
>>> +
>>> +            trips {
>>> +                aoss_alert0: trip-point0 {
>>> +                    temperature = <85000>;
>>> +                    hysteresis = <2000>;
>>> +                    type = "hot";
>>> +                };
>>
>> Please convert these to 'critical' instead
>>
>> [...]
>>
>>> +        cpuss1-thermal {
>>> +            polling-delay-passive = <250>;
>>
>> You can drop polling-delay-passive under CPU tzones, as threshold
>> crossing is interrupt-driven
> Should I remove polling-delay-passive then?

yeah

Konrad
