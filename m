Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC9328B50C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451582; cv=none; b=IWxk2b6FIhTcHXs9M5PbyGKvWFksFyFILFjJ6+e3DLkWHB9rkBfaHReASU8bZnNUFu6Ybs9DR00JuZ0I4+le/a0jSA42MnbDY0wsLGYmFz2HD+UJTREq6x2qm1uN/tuwxJK3/9j9ib/OgXpu0uyg/KfeRoZrr/gSIIExoPnvzQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451582; c=relaxed/simple;
	bh=bbz83AfdKHYzzOPGEeednRwLoLYcbCnR8BtMwWBiaqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEEy+3423wCBTG7P9r/brVu+b0dUosOcnF3+wG+Lks+EyZGuajT93icycCJYccONuuvXK4p3IHS1ro/4BbBIhwciQBHvUuVkrgH+qP9RrUrjDwdLi7qLRb3ekxzRL2MK2mcRypLhp9qQN9ovJg3fZI52GY7MjbWtSoiP6FGKZn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i9A7msKs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9A7msKs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9E0Xj022688
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZ/GIA0WSr9eJOkPJDxd+ZEymhaMmc/jbzotcFP/Tp0=; b=i9A7msKs9T4m7sQ7
	9TD0U0CZGjMVxxWKsjjZmpIQsmp7adNbwlUWZXuzAZKzX5KDDt1EoS4kEuZhEYr/
	IiAeunODH+51QL6PYly/6Y1PXn5EtynYXcqJWvcXzgfPa3TVHq8eFVNcltF/FXdO
	TpitkVRaBXjkrp8FcuuaQDqCYGOmHvdNBX33NKDPpctYR5KWk64UG/6Njg1fmw2Y
	0KzcgDVF2XdtNG4pLKnpDb7TSUfM6QFM1Pr+lpV4iyRepkMNFoVvgIyVImeWqCZL
	rW+Jkzhwvdif3WtjI3WJnY9WIwAlVRtKvESEtEz66/fHq6y5wkL4NPDdc2FHSpak
	am3X3Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79paykv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:59:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a42e9c8577so1568541cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748451557; x=1749056357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ/GIA0WSr9eJOkPJDxd+ZEymhaMmc/jbzotcFP/Tp0=;
        b=EOwLyE2I01LXTq8FMEcQWF6gsHC0hlWxWAUtpUyp2LvEidcjPQBb4h+f692uDfbg7+
         6kDU+gNJaMdzyi3md0MMB+YdnK5iRwZKvgE9W0SrSxi8H/lwSv99gtmcpcK4n2CREWyH
         zxKCqtpKhM/d1GUydQ1GVBlUu7i91NdaUNg6YDxwJixzdnrq1pzarRosBkD/RpgyHnHW
         OApvUoWgE8C0Xw3rd/cr13MDna+s56jkh/EehrJS7SD2tFHAMurq8wzopwTQgCdzb4DE
         iAOEagE3PVDsRWdR3pxt2VuWe47j4E6jdD7ua6I1iPhExnp46LY+PVu2iXZSmJBRa/0U
         O//Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBrQEIleR7r5sdUcp1uSGfS6o5tF121xGMru/m1CBMSpqVxZ5Yfiy9d57j6YR00G/QZY7/SNHLp4MU80E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhMtfAaXM4momjLjvUV4JYjExqj7LHhO9KostUmlUs0xEazsW9
	1XIpixsg19FeCpJ2jEHZLuEy0Jgg2i4pzw3UKLaAMhj8o2BYroI0+Abo8PTVZR5U+hEhwpt2iZ1
	2XZYSgA6CbpNWPXb5OV/wssLeuiVDsnRz1v3soYEvAE+nxfyLBLL7+gm9byc0pNo331w=
X-Gm-Gg: ASbGncujNNjx5YXz+PPtiljYaaE+gyimNOryBPkADYtS2SBIqg8Hdjkx8wVPfjuSXpv
	8h9R9hZidRg//8sQyRzokqyBHQGZJRmJtAuvriReaZcNyHfS8LI82AYPDrR47cSLH9wZiuqDikP
	4qAKnHbjs9frQTubFcUTXcwL6oJz6TptBMK7wGhjy4PpQdlvC+x2ERcnfYZaXM9JSxDlsXJPw8k
	iVLHXJQ/vSXg7hC/Gri+t1d2OPFdIVtqJR41mJhoUpBPoGOpuFFPLOwvgy3bDr71cpod2FnuA2F
	cDWhtWv8d2hSOQkrU0n1L9tyY2G4PJ0FZXhdO/H6pPB3KdjNj75pbnYKUfpY8fuCZQ==
X-Received: by 2002:a05:620a:40cd:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7ceecbf4af7mr968131985a.6.1748451557391;
        Wed, 28 May 2025 09:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAL+YqMQeWpvXAQsu9NOtyQO1XUv8gfuWwheXdpWcfFgbiPN1ZK8NrIvSTpLX2pyw7cfpnQw==
X-Received: by 2002:a05:620a:40cd:b0:7c7:5384:fa53 with SMTP id af79cd13be357-7ceecbf4af7mr968128385a.6.1748451556936;
        Wed, 28 May 2025 09:59:16 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b29351sm136692966b.98.2025.05.28.09.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 09:59:16 -0700 (PDT)
Message-ID: <a669eb4a-8e4d-4bdf-8bf0-7699d9a99e63@oss.qualcomm.com>
Date: Wed, 28 May 2025 18:59:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
 <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
 <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
 <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com>
 <kbmqr7gjkd72hgorbhbwb7ttvmecfbb6pg72st7zwt5ogxju6p@itycxk6vriy5>
 <CAF6AEGsTtEA=So1CDhvg8H5+Z-RJ9OnhgSzDoa+zkWSPO3cvnA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGsTtEA=So1CDhvg8H5+Z-RJ9OnhgSzDoa+zkWSPO3cvnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 13Uq21tOevXnNqbBDDWHdsdfYw7ra59H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0NyBTYWx0ZWRfX9cYVaEOgSJzX
 bnT4lPMy5i+u934L5GpOX29jGw8jz1YscPhA+zMGAoIrhh2Rgby+z8A7ybik/e7tzoiMuGQM0kU
 UF0NoZ1Ir//I87Ym/6VPhmv+MO3ZNtXsEvywAOqNOxA3SMLSFF6Sp95+B1pfN9VupkSPQSYMO+Y
 E4C4R2o94bop4pXDOcAOvqg2TkSEeLLWBaq+bLAmDHEqXTAYrX2p29US/K9T/9THQeHrVp3rMom
 yAk7ATy3VouQy2lMlsFJAcbbB3+a6HGls+E+aJlDkB4xfrKhlQUSYjs7GSAVuip4cvV1oIFQ2Gu
 ZKiGJ0/Qk0jehAEBOhVsI7DIoYLeaME/G8P5+8eJUCUgFmmn7W3hn+sbReKggcsbM4bFOFkvI45
 qG4v94pWNUl3jIjlGSLyX7JXFRwAqj/mBYVSSjK5F40nEYLC9aAIlYSADrro53GujKF0EnSS
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=683740fa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=fSamKcmLYGn2YG_ZD4IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 13Uq21tOevXnNqbBDDWHdsdfYw7ra59H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280147

On 5/28/25 6:50 PM, Rob Clark wrote:
> On Tue, May 27, 2025 at 11:18 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Tue, May 27, 2025 at 12:55:06PM +0200, Konrad Dybcio wrote:
>>> On 5/26/25 5:28 PM, Rob Clark wrote:
>>>> On Mon, May 26, 2025 at 1:36 AM Dmitry Baryshkov
>>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>>
>>>>> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wrote:
>>>>>> On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
>>>>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>>>>
>>>
>>> [...]
>>>
>>>>> Yes, please. Don't set okay status for the GPU until it gets enabled.
>>>>
>>>> Drive-by: Shouldn't the dtb describe the hw and not the state of the
>>>> linux kernel's support for the hw?  Ie. if bad things happen if we
>>>> describe hw which is missing driver support, shouldn't we fix that in
>>>> the driver.
>>>>
>>>> (In the case of the GPU there is the slight wrinkle that we don't have
>>>> a gpu-id yet so there is no compatible in the dtb yet.)
>>>
>>> My two cents are that it's okay to enable it, at least in this case..
>>
>> That would most likely make display unavailable as DPU driver uses GPU
>> as one of the components.
> 
> Hmm, perhaps we should allow the gpu to probe, but just fail to create
> priv->gpu, similarly to how we handle missing firmware?

Yes, let's stop killing the entire combo-stack in all scenarios..

Konrad
