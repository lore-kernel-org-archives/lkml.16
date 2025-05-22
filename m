Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F4E29995D
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747929787; cv=none; b=RZRlgh+bsZpzPDZHDbjsXfu0WddGxYyuRmT6h4JcFBRwBPCUDSEc2SZ+7h9oL5asfPH8LbV1oE5Q31UvIWYb4sVKpUxuOY5MI6SOOztCevMp7sAjOzBN0qNPd6hYe8BHlgMKRO7JkDYGAYIPQkRqX6CdEW147hv0bsPJhJ5PE68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747929787; c=relaxed/simple;
	bh=uKdkwOA9M38UDRBOJ/QrxYmSBCKI1yy/nu08vUqX2oI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCXJQqLmFgdNyMTNFk1ZfcG2/iThEeAGmWaiuWotQLnDZBXhxwHEkJlZ0dsTMgPBwneRulWEiIkHq3LApgN9x1h1Dfy0db1SujqMOcIZvvo3xXv/hQWhw2VUa6clE9kL28SNMBtuLZzomoqCGlZ82tUjF/wPcMsK9XM+BovkHpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIoV1Re9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIoV1Re9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M9aIXU015926
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/vcwc9zHxnC8lxAII31VESCFwSbumzwlKQ3H+NmCM4=; b=ZIoV1Re9InFoPkGn
	unWZkXEHp+cAsdCU/yRNZ4KUbU9IPVBmf+OY55pplR/B24jbzqzsiyGLidaex1JU
	unmr5sdSGUNYlNQuTzLNmRUEu6mHLX0gWoOYyYYyUNGmUC/fGomSTnCTv0tF0QK/
	7MG2IO0mR1pU/d6ex5kkHW4+CHFGFdTRZ9GNdqSGnHZODwUZo/sFU7QITbUw61l6
	bcMacCt6UUUOBKCADoY9qyEe9NPkSzcgDLAxtu2ha+UDkWBpzAeIDddD+d5NS+eU
	2d09f5xpfM+pXAfCWC7IA5y2DyLnjuFIDNLixB1YxcT1QlAEoGL+W9Dc7v9+ToMH
	TQ+BDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb6sn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:03:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5560e0893so101262385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747929783; x=1748534583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/vcwc9zHxnC8lxAII31VESCFwSbumzwlKQ3H+NmCM4=;
        b=D99KtI/V2KgLcN9nBrBRSQwyap1RTZn+rX/q8Bz1UQiL/wpZ1VtKUivqV+m2dHJPNc
         7oTrfwc0b7mznROx+4E6Zrq6/CUc9/wD16eoQ+wwe6otTlR5XRjkM4Ke/IxgFzCvt4w6
         rg2qAuXhiJYkVDalRSDBRGiEUJEWw3ZV66/N/vlJoIBwyPBET3cXc4f4u+4IWc4aI60V
         a9fauSmr7WueyzXuI/A0qq/Z6HgVSQTEQM7IcROTi8LIXGykyS6yFuD5UYbPmoK++dK0
         h6mK3BJbuKIsgeOVHE4EGhmivJRHLmWskB+BGe0JtDtHyHNWAyukdzxUKYmpgLmQG+Cz
         5I7w==
X-Forwarded-Encrypted: i=1; AJvYcCU0aL+Q9vaabL/Q5ApMQAnU2tXGpCrsDIakihe3SYlv4W5bnEGuVSuudv2GQ6b5Z0B/WDby4ITg/GXwwFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZCAi3Atfzaj+Ha2IXn822kUtnkr5aEOa4RJDdcsXOohrfnnOt
	wqPC43GwiYCcgF+wOUCSR6tC6ERKfmnauQTY9bMl69R0gcro9ZKXdpX1fHMw4rAkoiYPVs4EKv2
	llZR0SE8p9shbd13aXb64A3axziL4BIlTZ4NrdCoWYqKMrDkau51ACb+rtdq6PE96PTk=
X-Gm-Gg: ASbGnctrj3WUKaFdTEeJVKvlvSzN83rKLq1OCQxe05Pntpgxx70WOsqifgPW5jonN8v
	DluAuajSNOGGFQv3ogpiszqcEu3mIWWGvNXZCq50Fw4wAE1rXi5eJ2UHtwGpnexJvMXMPl68CSg
	QvvKnvp35g0yEqV2gdsju1pa+5/LnMcmSuTIpQtNhOsrgn2xUn+VJ51zvWdsgyQ629zZrOMSvKR
	1GBvCksS9tK0mHMIt39pJULD2/TUkBjDRrG6Xq8PeNjjVaEipP+zZ+aeeuSsL3zVe+mdl6h8pcY
	IKMXAtImAhKj+cozgPLbkIMQMcSYUX7rL9Zi0PZw5whywru768Qpfps0LN5xiqQHtA==
X-Received: by 2002:a05:620a:2608:b0:7cb:69f:1b8f with SMTP id af79cd13be357-7cd4672d9c0mr1640476785a.1.1747929783560;
        Thu, 22 May 2025 09:03:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF74ucAG9qupScVCcKfwIh6+iKHIXeCAupa1Hr2xyI61Rn4StPKHE/HIp9RIHOkgPlYgCGvLA==
X-Received: by 2002:a05:620a:2608:b0:7cb:69f:1b8f with SMTP id af79cd13be357-7cd4672d9c0mr1640475085a.1.1747929783187;
        Thu, 22 May 2025 09:03:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4d2323sm1104226066b.175.2025.05.22.09.03.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 09:03:02 -0700 (PDT)
Message-ID: <584a9e49-5106-4053-9f42-e1e176618eea@oss.qualcomm.com>
Date: Thu, 22 May 2025 18:02:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        neil.armstrong@linaro.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
 <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
 <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
 <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
 <a26213ec-808f-4edf-bb0d-ab469ee0a884@linaro.org>
 <281ab1b6-498e-4b29-9e15-19b5aae25342@oss.qualcomm.com>
 <63105bce-6b8e-4b99-bca1-3741f27ea25a@linaro.org>
 <892fc1eb-efd3-4fb6-9110-2df3349960a6@oss.qualcomm.com>
 <b989522d-bd41-4d76-91a9-3cf680214003@linaro.org>
 <f5734944-1ed2-4acc-a015-0c638c331bbe@quicinc.com>
 <d73c6151-91bb-4c96-ad2a-972ad392624b@oss.qualcomm.com>
 <1903ee8a-f819-4a4d-baee-90f35e0da290@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1903ee8a-f819-4a4d-baee-90f35e0da290@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qgMUjEisfXns7lZAAwhUlloAInqFVXr2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE2MyBTYWx0ZWRfX71ibuOyZHgqD
 s/KiUOEndPgYQUq739/az1tyluxvXtV0LowgDP+x7krRSl6POpIsryroFx5Z8qIGbzSsauLgRPU
 wO1Kv0Ajda8jOqDBKWhz1guVc0iyDND+Z/MZKJJ17Ut2oB6/dJeURoSvAEekW7UUMPmMsq2unBh
 C1Mj2Vwjs+Cv/vmnrztgDKQuxUQWx5OnLsC0iO7/wxmeDqm8HxCuv86/OwfKTyJ4Lq2ddM0VrIh
 CsKFFuuj0t391tSThgMl12Pioa9vwdRM7IZxCZkywce5gh9wH2nsmHKPc2GNus5LSangTIMeg9l
 E5bKpddi6N0OKLwFkXhwS7IC8dcVnjqTA8nZdmWCZ+v5HdpRsemMU3cbRSsgUqNSxFPRG1z3gLU
 jGWJbkhnW3ROO3l+EQkk272HxKQOnwoAUkaG6ajnZm67XbGE7GnY7LioraTNl2zMJD4xwmpT
X-Proofpoint-GUID: qgMUjEisfXns7lZAAwhUlloAInqFVXr2
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682f4ab8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=nGS3afnEe7IiRhMdywQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=874 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220163

On 5/11/25 11:51 AM, Akhil P Oommen wrote:
> On 5/1/2025 9:23 PM, Konrad Dybcio wrote:
>> On 5/1/25 11:29 AM, Akhil P Oommen wrote:
>>> On 4/30/2025 10:26 PM, neil.armstrong@linaro.org wrote:
>>>> On 30/04/2025 18:39, Konrad Dybcio wrote:
>>>>> On 4/30/25 6:19 PM, neil.armstrong@linaro.org wrote:
>>>>>> On 30/04/2025 17:36, Konrad Dybcio wrote:
>>>>>>> On 4/30/25 4:49 PM, neil.armstrong@linaro.org wrote:
>>>>>>>> On 30/04/2025 15:09, Konrad Dybcio wrote:
>>>>>>>>> On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
>>>>>>>>>> On 30/04/2025 14:35, Konrad Dybcio wrote:
>>>>>>>>>>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>>
>> [...]
>>
>>>> This behaves exactly as I said, so please fix it.
>>
>> Eh, I was so sure I tested things correctly..
>>
>>>
>>> Konrad,
>>>
>>> iirc, we discussed this in one of the earlier revision. There is a
>>> circular dependency between the driver change for SKU support and the dt
>>> change that adds supported_hw bitmask in opp-table. Only scenario it
>>> works is when you add these to the initial patches series of a new GPU.
>>>
>>> It will be very useful if we can break this circular dependency.
>>
>> Right. Let's start with getting that in order
> 
> Another complication with the socinfo is that the value is unique for a
> chipset, not for a GPU. So, it won't work if we keep this data in GPU
> list in the driver.
> 
> Downstream solved this problem by keeping the PCODE/FCODE mappings in
> the devicetree.

Hmm.. that actually does not sound very bad.. it would allow for e.g.
new bins to appear without having to replace the kernel.. great for
backwards/forwards compat

Rob, WDYT?

Konrad
