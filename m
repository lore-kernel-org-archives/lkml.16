Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1811928DF28
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451367; cv=none; b=BxKmpbGi6VShY3zSZWuiSxx3s7VU8p+iwH5HTx9bxuHZxeBggcXukX4yhAIBCXfFZ+TTvLDzxYV8K8/Tl+teNclTD2L+LyDTANnOtBTH2rr2/9+y16vwaVDqxxufvzGJIy6qkzHLTK0fqpsLhEyOQgpJlWZw+NIkST/FoNEBm5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451367; c=relaxed/simple;
	bh=moO+Y+q49kZ/jPfGiosuX73Q20yuuPYFiWFGjd/X0Go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BoKUA4v3M0Ji4wbGo7bPeVAg1tdc7rxRL1/VswS1nuAGftWZdpJBSXxpKzTj4fOVANFSMcCe0/EYmZn3uIMH19zABtKcbayKRV8AMmun4NTBHp9kVxQw2Q6WDx2W4nIOcyzy0EVPuNBFKv1Blf34vDWb8nzlYXTQM5eCLTOe+k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtwDE4an; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtwDE4an"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9hl4v009833
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0EkcYL9G1rpVd7TL/MkBWT3qRyPOPRTrOWOR/0GFkgo=; b=HtwDE4an2n2FkjoC
	Op9bUKa1ga1AfztP2XKHJ6EdihsuchjLRTRe26dHSJS2gS2Z0ETwiuJRWDmpxTV0
	wPvFl1rx9MQcFwCakeBy/dMaa/mT2mqiM5HKBFz3Eya3Izfg1afAUm4h9Tse5Hlp
	la4pL6oqGVjNPQU3QmrB7VUqQEBlv4c2DQqR66K/xh+Yy0hYjSyEBwTM0uU7Xpmk
	JHOFdA3t1k5FpHBxLdDNcgQRy+WffM1dGmLBioNkATxnElkbcL5PGzwI3tIpyPUW
	K5+KUJiJPgCScWmuaukwWz8T+4TwFhWeieKBievTWu9Ax4o3wfgk2GyMv5RX9yLn
	5lhS+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x03ms4st-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:56:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54734292aso124160485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748451364; x=1749056164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0EkcYL9G1rpVd7TL/MkBWT3qRyPOPRTrOWOR/0GFkgo=;
        b=TcjAaXeDql0xvctFHFQ7ki/F/0bPMYhRD/07Lyc5IIkKTkAt2F9janPJa0efo9ciwf
         qQec+U6bulGCmDFxRkgFpV6V+G2/ZpUDFAGU/pTwyzl99YQHwq5Xgml7nmOFEhLsjpye
         cdcJRSyvgOrzpCxgQKwAbxDs3Zvt2IssvaaoC7p7w4mkU7+qg8LuqSPfHwjTPBl3Vm12
         4XyW/24crE5JbYFYmKiKJkg+FxqOJZ9fXg5Ol2qjj+8llnC0Nx7R0Gpqun6J8TU1vsme
         dvSRUeS96DwAHG3vcbiZ+4A8jA25dCBhkIAG6akhytWRTktZjD0igNt6S9tptj4FA0aD
         QNsw==
X-Forwarded-Encrypted: i=1; AJvYcCV4VtiGXbgOlkW0d+P01BS9JBx7AnYycvCBQ+9D1noNDaIoZspl7JiMS7bvz1V1v1oVPgJ8Et6raZXkOTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOiFc51/mI1ZyZtE/9yiDRMlTOi8D+rDkEwT/BFYzq2Z4d3agr
	wG5vNCKyxfO46ev2ORpSDGQ0XiZTtY/vQBQMyvcLAbFCGMd/V3xATgyj5vzSQ6XjB+1AkOfRRGm
	gHzIEYovUpxBgEE8LN5iw4sqBApuO7qIoxoBgWv2AF9WhmpVoxNjoc5GL8fE7ieomAXU=
X-Gm-Gg: ASbGncvguKhIC5HPGaC+24Wik6aDHUtv8UqA23yZSIA3FPyh5KBSvvJl9qaH9KA0Hab
	xnLswx956axcvFXsP+v+EYbjKujBAC8J8GZLz7dJMZWtyFM0R6cw0NnxCPvK60SAY8xOX2nyT3I
	H450Z012izGskfPZUxZ1xOK3wdcoPL+UEWCySBkgkHom7GVDg0dTJ7cFdVV4vfqIjb2D+Rs+ezh
	sOoWt/F9Qrp6UX/X9yjZEpyZ4ObLEJwIrBM6uiyHJpdA97m4pAG69o3WwVTnw0UixRA4Mmreq5U
	kzioD9/CfWIahJpTD8i0A8NPgRC/UTNjkdJjSd//+Q8LzdcavUsrzlVyl+RfXl1ydA==
X-Received: by 2002:a05:620a:bce:b0:7c3:e399:328f with SMTP id af79cd13be357-7ceecc09be4mr921069285a.11.1748451363845;
        Wed, 28 May 2025 09:56:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECAr+S1817A/Gvel1AgAah4imkP7ECioo5NX/E9v0PLICsaguf8YD826ewc1MMFQ+GXcT3jA==
X-Received: by 2002:a05:620a:bce:b0:7c3:e399:328f with SMTP id af79cd13be357-7ceecc09be4mr921067585a.11.1748451363392;
        Wed, 28 May 2025 09:56:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b29778sm134027366b.113.2025.05.28.09.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 09:56:02 -0700 (PDT)
Message-ID: <aa17d7d4-b77d-4a0a-88c3-86255dfbc29d@oss.qualcomm.com>
Date: Wed, 28 May 2025 18:56:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <styd5gjksbsqt7efylpfn6bgwgyvt6zexxiooihjsnmp25yigp@unq7dor6gso2>
 <447c3b13-8d6d-4bcb-83c1-9456b915a77e@oss.qualcomm.com>
 <inpfuxskvmrebxitqtqwzvpnpicibo6zakgk4ujpcrqrpef2vw@nhclj5rg7axr>
 <9037fefe-aa40-4884-97ee-b81ff8346944@oss.qualcomm.com>
 <htufwjvfgdtav2gtgrytc356py6xqhrffbwjg42sgo7k4zzxof@z4xaf35qz7kq>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <htufwjvfgdtav2gtgrytc356py6xqhrffbwjg42sgo7k4zzxof@z4xaf35qz7kq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eHRdztEMMpj3WzlCJwCReUgEY5wfql4_
X-Authority-Analysis: v=2.4 cv=FuAF/3rq c=1 sm=1 tr=0 ts=68374024 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=g7IH87eAirqrRPCYX14A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: eHRdztEMMpj3WzlCJwCReUgEY5wfql4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0NiBTYWx0ZWRfX7vnC9mlvyeTO
 8qjaJMljXwAik/zlPZ/6siCTipr5MR+JHPsihnTSjRnkzqiGUKR53pBjnIKOAW5dk/bBV2cBHWL
 N+UeHb6p8y0D5DTD1SRgq3vwZe9HgB7Oi7/KaxskpmWDzhXlpTwo/szBkUDFYydkvxftSDFSAk2
 yI8U3XIei+EYAknTUIgcsYNFlA6zUDtA4g74+H82FsfzA2lUz0jnmpbOqyjlCGwCscMFp/gDlSw
 CX/VIQNPch88MjMKoDuiKNs0uE9HbhOoqMdz0EEzf5yDHIzxex1fOhBwJ2+ajiCT45MIGfbOF0R
 GNo3UYd9kz/6cp1fkGDUzywoZBLlWCrYTAj9p/f2oxQ95yMDNBnDaigw2Sc3tt8ULoqcqxLA6/U
 OYD5KEnfM2bwRGh6AC27B4peZxAWhmLF/vBiQvTuKW8jW5hTWv4hYqqzSdTMouXoTZhSgUyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 mlxlogscore=982 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280146

On 5/28/25 1:22 PM, Dmitry Baryshkov wrote:
> On Wed, May 28, 2025 at 01:13:26PM +0200, Konrad Dybcio wrote:
>> On 5/28/25 11:00 AM, Dmitry Baryshkov wrote:
>>> On Wed, May 28, 2025 at 12:24:02AM +0200, Konrad Dybcio wrote:
>>>> On 5/27/25 11:10 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, May 27, 2025 at 10:40:02PM +0200, Konrad Dybcio wrote:
>>>>>> Register a typec mux in order to change the PHY mode on the Type-C
>>>>>> mux events depending on the mode and the svid when in Altmode setup.
>>>>>>
>>>>>> The DisplayPort phy should be left enabled if is still powered on
>>>>>> by the DRM DisplayPort controller, so bail out until the DisplayPort
>>>>>> PHY is not powered off.
>>>>>
>>>>> This series doesn't seem to solve the USB side of a problem. When the
>>>>> PHY is being switch to the 4-lane mode, USB controller looses PIPE
>>>>> clock, so it needs to be switched to the USB-2 mode.
>>>>
>>>> I didn't find issues with that on X13s.. Not sure if it's related, but
>>>> on the SL7, after plugging in a 4ln DP connection, I need to plug in
>>>> the USB thumb drive twice for the first time (only in that sequence)
>>>
>>> Might be.
>>>
>>>> But there's nothing interesting in dmesg and the phy seems to be
>>>> programmed with the same values on both the initial and the subsequent
>>>> working plug-in
>>>
>>> Please try using a DP dongle with USB 2 passthrough (there are some).
>>> Or just emulate this by enabling DP PHY / DP chain for plugged in USB3
>>> devices. Would you be able to see the USB device on a bus?
>>
>> I only have a dongle with both display and usb that does 2ln dp
>> (I tested 4ln dp on a type-c display that I don't think has a hub)
>>
>> USB3 - yes, USB2 - no (but it works after a replug)
>>
>> Are you talking about essentially doing qcom,select-utmi-as-pipe-clk
>> at runtime?
> 
> I think so.

So after quite some time playing with that, I noticed that the USB2
device was never actually kicked off the bus.. and works totally fine
after connecting the display output (2ln DP)

I was looking at dmesg, checking for discovery/disconnect messages,
but the device was simply never disconnected (which makes sense given
repurposing USB3 TX/RX lanes doesn't affect the D+/D- of USB2)

I also read some docs and learnt that what we call
qcom,select-utmi-as-pipe-clk is suppossed to be a debug feature
and is unnecessary to set on USB2.0-only controllers

The USB controller programming guide though doesn't talk about DP,
but I'd expect that we may need to set that override for 4lnDP+USB2
use cases (which I don't have a dongle for)

Konrad
