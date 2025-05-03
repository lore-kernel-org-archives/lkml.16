Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85A81E491B
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 11:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746271069; cv=none; b=bsCAE5G58wcZHV/6Nzq+TA/Hm37GsH7lG7j8fSlRiwDjh7yNCK1y0esYop8qWzHsmwWvO2LEp9dwyUhWY1kNZOe1BMMNOo9CLAj9OrTbrR72dUa5QQAuJzZEszyvQkY8PuIxutUXUrFrWY6w4BPO1i91j5k1avwehVqPwt9ys6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746271069; c=relaxed/simple;
	bh=osPDfcecZqVOsBKtOG/9K12hOUEbQ3zRaBPBK4271XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KWcHbexLgtcBNf2dwLueNTJgB2ESInRvSpBX4RXH0usweW91+GKDuvKjeUKtUjQpGhnveb9Hgj7X8geYC3yM71NnG9eTbOl6SCrODO9VPuajgd5yZPi8wO3ccABZjO5RbkMMhnZFtdnugy0cq+rwQmYTTMvqWKfUstc3oS3T110=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pAG4AY+F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pAG4AY+F"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433ljAa027225
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 11:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wyCrKhEc3d77syMYDxLeKe5vR94keERW1gwgMtjT8+Q=; b=pAG4AY+FuNhNdA6F
	hAXgDOJwRW6pD8F9mWi8SqhV0bW4f0SZA1GnbxWMyjaoUky4PkcaPm1Kmu+1eJ+c
	gRQv2lgFjXWBVH/pQOvbXu3vOp9dZglbOUTx9vDTzWIjbigFSnqeTL14AUVPNbOL
	2s7hU7kNpwPowHiQnRJh2eUqVegJUaCIeS0hkyB6OUiwFLVv3Rswk+O0KJKVskjd
	1IH6qtijqeJfZjVruXBnng5KlMrIWE5OQnG9zqdHJNYOxbGV8/QH3KH6qabkSNSr
	8ng9iSmaLmaBVA7x0PzYzR3enCtHa6j3Xl1CAOzePuNc+JCe0ZVBjEK6TgmFoUHS
	LaQIMw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46daqxghre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 11:17:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeeb7cbd40so2824326d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 04:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746271049; x=1746875849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyCrKhEc3d77syMYDxLeKe5vR94keERW1gwgMtjT8+Q=;
        b=CZ7c2IzaFuOwnyer36mVLy/4ZXqScR1Nt9zW67vLV34z6DbKEWVcsh9hcy1wI/DMUK
         35PudU6VZeHmtcACrM7QCPU5V0w0B/2L8N5r/GP6O81diBlUzh0KbeD7GLVBk6e4UNAL
         Y7KWPKkrPlzK9xcHPYs2w1Y+m2oreN8MgnMc+mu0SyQlLenDUxRieoz2iXyUGT6kWyOu
         I+TjklKgXCxPt5eRd9205klwquiD6bSswWQwhKa2bfMnCL+bGzuX13oU3dALl3XKsIbM
         v4ovSr5gqQ4F1YlqICJX1pEmEZHs8iWmrbFMVAWYyXuYTi4hp4LFKhkZEn1TohyUsHRC
         1pdg==
X-Forwarded-Encrypted: i=1; AJvYcCU+1WDi1y6LtpgiP6aTrVSkber4vESZ6/V6eAXfw0aQZprYMUOoaKWOzsOcuhOYz3rh4BuDBGElhgwFOdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGIILpW3cazk/zhPXGNHanld+TmzetkMwJHhLt1KSMgmyRLDfa
	sERtp1banGesbgUbGQH8k3HhHz/oCJ9ElmhzutyukZtrZZMdncDM0NR9CrCR1iJo+MEnnymv3Up
	4Q4MEhBWH/J/8BC11QTg8fV+mNbp2FUXT20/VV11KRgKqhgm45kYSKXVZKHwPpqg=
X-Gm-Gg: ASbGnct2Yg5mOxPOHB3MZ7obAt2XkcRGYsizVtOlbdRRLKL3MXsb69/jJdFgBDVNwSf
	Cw5BPfp371eoPgI1IztoLJVzc8EAuMQgOiQ8sdBmktuMj8YnMmAAhY6l1KGLwgVRDmSpUv0Dmkk
	jSP0WV+UjzbfNd8+0RQ0ZJPZbRjugc4iC13QfSsGhlEfVi9AZetdVapPTLrOF7MhRG2qJSM3d0O
	v6BKToGZcv0vht94f2JgcLfGc3TN3zLPvBwRFWnWC8xK36CWiMxt1TBJ0qjFIlUGZhY2hCDAHdy
	XxUlPIb1O3oEZq3ldEiRLcgrDZxzXJe/bev7i6QHj4513Nu36kfmvhGKSEasjuV5Ws8=
X-Received: by 2002:a05:622a:2cd:b0:474:efa8:3607 with SMTP id d75a77b69052e-48c30d83db9mr29110271cf.1.1746271049025;
        Sat, 03 May 2025 04:17:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsRcL4YTCQDoV6ZBGi3Z/iVL1bqcsqXiphj3Oul4isaynD9De8sYSJHbL7Ynpk4VynGPsXYQ==
X-Received: by 2002:a05:622a:2cd:b0:474:efa8:3607 with SMTP id d75a77b69052e-48c30d83db9mr29110181cf.1.1746271048650;
        Sat, 03 May 2025 04:17:28 -0700 (PDT)
Received: from [192.168.65.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c024asm178441566b.117.2025.05.03.04.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 04:17:28 -0700 (PDT)
Message-ID: <c55d718f-00fa-442a-b67b-9a678556a2a7@oss.qualcomm.com>
Date: Sat, 3 May 2025 13:17:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        broonie@kernel.or, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
 <20250303124349.3474185-7-quic_vdadhani@quicinc.com>
 <2kmnhxj3je366livo67btpbmjiyeyx4q23of42ng4co6xngemj@kitsdtqepgce>
 <e0916f4b-d2be-46a7-889f-2eebd12b74d0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e0916f4b-d2be-46a7-889f-2eebd12b74d0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AdyKIWImatG35UqGkU4k_UsT_389erzi
X-Proofpoint-ORIG-GUID: AdyKIWImatG35UqGkU4k_UsT_389erzi
X-Authority-Analysis: v=2.4 cv=baZrUPPB c=1 sm=1 tr=0 ts=6815fb5a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=dnXBaztP67eYbQVX14EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDEwMSBTYWx0ZWRfX6qSwCeb3BCcR
 RQNJRBvjHxKbgx9CC9vlcePFEZGrh8p1+JpVyZmPl3B8o3A/PKf+F4lNoLGPU+rcZjtjkUzKtWu
 1vilIBoTRgfrdopCYOjUrKcq208M8EfZUkjkA9T0g8VNgFu2cOZ+zy0AKzLEpE+4OuV14x0iW6X
 X1x2gdz0nSjjAUgcU8J47QJyOtV5gD4S82SaaEtKhpLjsO0ro3p+ab+6sJCmp3+co8IOap1vEX2
 RtJYNKChu11GJo7ePFZo5ggQbMpbajTakSyFSwL/qZYLYYEASKv1xi9GYGqiFXSGNqa6xeH9pOg
 bKolp8VYV8D6YqtIWGOz5pkx93qo5p4dYDHKJV3nOSQuQmzI7sTmaBCvass8MfHYGChog5Gr/UY
 Y50MWAHceMhdHteO/6ShvYvX8W2z42tZK6CJdH+zo8qZCiWvbhIDf/fTs7ZrW0Ix0LbJEXAc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030101

On 5/3/25 1:11 PM, Viken Dadhaniya wrote:
> 
> 
> On 3/6/2025 4:57 AM, Bjorn Andersson wrote:
>> On Mon, Mar 03, 2025 at 06:13:46PM +0530, Viken Dadhaniya wrote:
>>> Load the firmware to QUP SE based on the 'firmware-name' property specified

[...]

>>> +    u32 magic;
>>
>> What endian is that u32? Please be specific.
> 
> I didn't understand your comment. Could you please help me understand what is required here?

External data can be of different endianness than the running OS.
This should either be __le32 or __be32.

Konrad
