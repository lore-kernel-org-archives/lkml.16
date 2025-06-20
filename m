Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7027F283FE1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440430; cv=none; b=iEtDrLdQ4z5TvOlO9hyY/rulHSG2Av/N6KCNIsZebTVb2SfQNVAX8Wgs4Sd4g6SEtCb3fVbtP/Uw0Rwwi6ep2/Lv0EnRlhWGEejEQJLlVejmbxjJ0llU/oSZ8ERoTm4Ugyoxho8tTJedz138i9dcYDF5s6kqZJVcWjPxLkaoVWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440430; c=relaxed/simple;
	bh=afDg9nn91haB9rfUtxnbz99YfZDDgCPP+SbrAya2c8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCjTcfuwgUBHlDXcc9NcQxGY2dBmp1XtBJNJDA3oNtXKq46NbBmQjZgdcDr2+mALG6WVvcKF9NwHkWM2AsoFvDPOrpGY02l8dvffHcby156RBcXQmA+DSOgQWVq7W2ivM6ZOLO9yqJYSfYCiUIohoSeJGBDORnpb++6YnSd+tbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5SQ1nhE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5SQ1nhE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KD8gLY029581
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WHVZwsBe2mPFE2r8rOIceTU1YN7PAHuBHgv7EehUdXs=; b=n5SQ1nhEBTEMloFm
	VecGOa3kVZ/WwP3+oNFMvLCmFalNvpv05iJSsytBi6wSVHHwNF4fuzS3ytdRbhyW
	7vmGCzMgq/51HDaAXUhLWh+uocTC0ETVCOVzHRZ+ELqIOHM2y+KoUiobMtH60SLL
	Y+9jD9mVsC3wjaSDzZbVRz5AhNkpS3BGRIy4BiGhq1RQaiSgFXTF6pxRP5rk5CQu
	TD0XUGaqRUBdOPPHCBhhhFk3x1ufbeovG/P1gj7Uy8N/6kDWJ/b1F8lhnVXSgqZA
	cRbbqUJwDo3VSFIq+swZmUcyUunuOz0rDm1IVHFg0YnZLpa+2xR69ye3jRDdyG3x
	JczjGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9kyuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:27:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d21080c26fso60400985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750440426; x=1751045226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WHVZwsBe2mPFE2r8rOIceTU1YN7PAHuBHgv7EehUdXs=;
        b=O1iuPSyzqou5tEsJb2RGWDFz8yHns/ze9xjlC21jEUHknX2i1zK3//OY+cP+ix19XP
         Mo9WTLTT3q3KeRx9RCuD6jmZA2TxwehpTTXEivxEYhZYBEbT147qxB1EGudQ6UrOo9Xx
         iTubViUmcNIy2avv1Mk8VeB7FcHuaHKvpPSbtn0CZ49zRtcaEpZ4Q2B0D0+/+ev/l3v2
         uvEhFxp/EnYVWNvwtgP23dkuO0QRuJsEshqms76ttunvlfBvOtI9qN6U/cO4Xa1FYUQ6
         jfV5qAbal1aj9MJfBtbN6jT8OgeeszcisaH9jMmYo9cCaWXrp6Ec1SJmYzkKIKtyD89p
         C6jA==
X-Forwarded-Encrypted: i=1; AJvYcCXrN+IK41I7RpRJMYFWTDTWrhiH6tfLojO7rE/FhQLP0Y4lsZzlAknmfcuolULYndOklakIn/FFCaRfSbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCOj5wvpAKEk+KCKESk9+jz7UGrOiMGRvMqPKowSPipw1jUaZf
	V6jTRxzwD+zubQJAkz/HqcpJlY1lTEFvAk+GB8pNx4Y7APpeVTnonVRDjZ+6i+e+cLR9FJXEFx8
	aEZpPbLygozwXRlEL0TeRxH2xg9Box+1g7cUgfEAg2BLrmxGDahwXaf7DZDkc04nkOtk=
X-Gm-Gg: ASbGncv49npJ5HBtNLnHee3zKckD9wdwIh2uejkwsZVpaskff1JSyemBIysHg9g8C0l
	m121V6axP7ZaCEe+gdAq7MJckpZymOQV3HeXQaxCk/fisFT6qv+5nhjedTDx6kIsfP22atqMh9v
	5GMgtI0o2Lhc5BYlOkMnpTes19InWQapdkKMfmu5BHJ8NuhuJd7DSzYVF3J7fwqw3Pw9wp5lPs3
	u2xourFIcVrKSoj68hxpwJkiCOIxJAn8pTX5N30G+NzFvUQ73kTmEfLFrC9+HLSzAZFWeWFr/tu
	L3xneWimbDjLesATd9bY3ce3RsdAv4QLNukJNE4WAoHp81I+Rdd2CrahqKrEeeUTy23PHp4xFDs
	I0v0=
X-Received: by 2002:a05:620a:454d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d3f98e6631mr201592885a.6.1750440426263;
        Fri, 20 Jun 2025 10:27:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoHeoLi6ocQ6ShmQtPpO5w/YjYEMIJLujZ0mwcIBnaXy139EfNwGSJUB+wxzBmDAUpuuwnGQ==
X-Received: by 2002:a05:620a:454d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d3f98e6631mr201591985a.6.1750440425818;
        Fri, 20 Jun 2025 10:27:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18c996aasm1664679a12.39.2025.06.20.10.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 10:27:04 -0700 (PDT)
Message-ID: <2bd17ab5-950c-4260-ae7c-9ba9a6441496@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 19:27:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: media: qcom,sm8550-iris: add non_pixel
 and resv_region properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com>
 <20250620-video_cb-v1-1-9bcac1c8800c@quicinc.com>
 <a35d3928-8ac6-49ab-8689-16ba69afe197@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a35d3928-8ac6-49ab-8689-16ba69afe197@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pkglbr0xPXW5WrylPixbGgznebx6qKUz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyMyBTYWx0ZWRfX/FdlqkABeFPL
 26UYSRc+nIORiqp/uu2ttg7cQ2iGl8Uo4VDbr/XTri12Aqms9pz0ejlh+76Kz8/Szfi9bcSf5iq
 HlHFtuCH4mtHWr3BoxWFC4Gukiwij7z+va20qxQjtWSN13FMirdbw/pSy84YmpWO8/WfXHKZ9Gz
 z88vI3UI/B774+k0v0CaHoCKOq7U+UztIvA4DQSUS/JB7hyE8MzCt+ceR5xfhBRqR8kTaBth1AN
 V412RJthJU5DtOl4+KnZl8ng6xK92jwhj41CzPkKQLKs88mF/40wnm+H/BbasAr9reR7RT6ofYI
 9n9S31zx2POXXNCWfHF3ZonRNTXTpzDtYjKQVRcYCq3udmA+5mKQ24aLe7ISPjJcYSDxnUaIHlh
 ztx8lNQgZInC/JwCQ4RA/dUgowxpm/cgqCPSJk8cn74jJ5m1R3FgYOPF7HvTh0cbhQB0oAvd
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=685599eb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=qbq4ObjMTheV2eX5J3QA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pkglbr0xPXW5WrylPixbGgznebx6qKUz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=939
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200123

On 6/20/25 8:39 AM, Krzysztof Kozlowski wrote:
> On 20/06/2025 08:20, Vikash Garodia wrote:
>> Existing definition limits the IOVA to an addressable range of 4GiB, and
>> even within that range, some of the space is used by IO registers,
>> thereby limiting the available IOVA to even lesser. Video hardware is
>> designed to emit different stream-ID for pixel and non_pixel buffers,
>> thereby introduce a non_pixel sub node to handle non_pixel stream-ID.
>>
>> With this, both iris and non_pixel device can have IOVA range of 0-4GiB
>> individually. Certain video usecases like higher video concurrency needs
>> IOVA higher than 4GiB.
>>
>> Add the "resv_region" property, which defines reserved IOVA regions that
>> are *excluded* from addressable range. Video hardware generates
>> different stream IDs based on the range of IOVA addresses. Thereby IOVA
>> addresses for firmware and data buffers need to be non overlapping. For
>> ex. 0x0-0x25800000 address range is reserved for firmware stream-ID,
>> while non_pixel (bitstream ) stream-ID can be generated by hardware only
>> when bitstream buffers IOVA address is from 0x25800000-0xe0000000.
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>  .../bindings/media/qcom,sm8550-iris.yaml           | 35 ++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> index c79bf2101812d83b99704f38b7348a9f728dff44..a1e83bae3c36f3a4c58b212ef457905e38091b97 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> @@ -65,10 +65,45 @@ properties:
>>        - const: core
>>  
>>    iommus:
>> +    minItems: 1
> 
> As discussed in other patchset, this needs clear explanation, so
> imperfect patch won't be used in future discussions as argument to take
> more of such things.
> 
>>      maxItems: 2
>>  
>>    dma-coherent: true
>>  
>> +  resv_region:
> 
> DTS coding style. Anyway, regions go with memory-region bindings. Use that.

On a tangent, FWIW this is a discussion related to this patchset that
never got much attention:

https://lore.kernel.org/linux-devicetree/9439182e-3338-4d57-aa02-b621bc9498a3@oss.qualcomm.com/

Konrad
