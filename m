Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF001F561C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745875260; cv=none; b=c3u5i+aaBPU8PcqHWvZC6T8Khgc6ma9WsJhFgxBtHrNh6I7ObFqMu5GN/e0McELIJu0AMhlZQk0uauVGX2lQHnbE2+AbMuDQM4fnZofK6HXbUQmhsH41TTCdBdDNb3SDURJLTDChODbVNdgxQSlsanOOBDvzoDRX4cw89AQYVaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745875260; c=relaxed/simple;
	bh=Tkk5MGAPaZWvRMF34kA/9GkFmW5b1voNin/0nEzEVEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnLENCpszj4CJTpRgssACKc6I2Z8cT3GXTqYd7SBaVjXc6MUYKhOnO3QKrsdAWGIax4u+e+ZG7KpAfKxTEzsLyH7H3rMJIHg74Rkn4VTk5lWHniy+ytyorWG7Bgg3OuNJokaYKz4jdK8y/eVQRwT3GCrS1+SbJfOX3Hg1XiFaLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHc9ND22; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHc9ND22"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SHY9VU021850
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vxVMtQIbYi7Qcd0bfFfAWSXGBUlXHwXMWO1ADOAGDTY=; b=AHc9ND22HnKrKGMl
	/7NZMmfx3/dqU2A5YAWuHnSxJrhfJtfR/3SMcPrVSYlV+4fGmF+/cQEh2taf20jS
	OcXT/IJvkG5lXjXkOAI3+jngrs6PnnrBNSkTkkiXymqdB4ixVdztWg3gUiNlDFR3
	EC7sDuKwm0vTF10ulFE3j2dr0Its86wzrtb8fw7UpuU5TEi+Mn+rJyKxRvuxrC5M
	GgbHVq936qLfUHT+Eax9D4edpnzfUNApdfhut6t0Vno0G4aUt+zgb8FqYkwo/Xxf
	kCzdzxc4CG2cag6slLlX1ufMHUJxU1iRs6dfykwLNA6QvInSRrJTwP6VcLUlVWe4
	BN1pIg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hsc8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:20:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4767b8e990fso4780571cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875257; x=1746480057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vxVMtQIbYi7Qcd0bfFfAWSXGBUlXHwXMWO1ADOAGDTY=;
        b=agIvDoAA/8IgL5LzXnKDW2vKLKSgV5P5gg9e0EI30Q24gO1Un55LMsPa6a21r72zho
         /JXSCpQEluEmhRIdH8fWXWBZwJxJiK5VzVbFJvq2yHtDyn468a+fDrBNidF0aSt4LDdC
         7MZ58lpdeJaYhxX+MQIXMRxeRqKasxDS1dqWPbTfMSYNJhQxiDgzLLfZAzYUzMThMkeq
         5FjHrgEgsYJki7fx6PCbjtvXxlsaCK0nnxpEc9e0bOVxp2RgevwwJARwNC1PQ9bU+gua
         oTuIwS/JxGeHl/HRaO+wA6r0HIfXD93tjys9A9RmY3GwTasNQrJHLP2ke0fzlP/khwuj
         NL+w==
X-Forwarded-Encrypted: i=1; AJvYcCUHiuk7W8u5r6fmek+1ZsMtnX7R9OzIxop7UfN51UyyMQxTCnFw+k2mqnJDck3Ds4d6F54vtSNj45iON6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQVEkADKCodk4F1AQfDjVDn6vVvQeOqKMOZyXzQZcaM9JFCOVE
	FzJkIYcp6equGS8vU+mY8vUZzaucaEv8p8HvcX/Cm6jLEwPM5ruxX1aUANBt28jbCdowOg7OV3p
	J7n5+199gKQEJ1VJT1cH9R7yy2ZV5XbhQ4x6W1Yi1ze8b5nVTFRFoJ2sMmiEPMBE=
X-Gm-Gg: ASbGnctu5DOVd7cX5yuYGjLdsljFH4yFBynKXRDVvxJ06p4hLweARPkbW0QGG7gRBbt
	Tnl/9ALTv6UscCGWay9IAh9dJwlVNBKdWLHfDs7kxc7tcT/nZ7zzQrgdQuhCzdhXjK7cuPmGhZs
	LdH7vxaK51UQ82AfeH1vTNs3UvCsijXeHyhEzjd0Xm3znQjtvFKe267vxg8ZzzPq+/fzCoFxn0s
	iH0L4rufsUz1Z4JARPkjBlCxjv/afgYR02g/GzK9naWU3pCQsAPgx5tdavHJGI56yDtJFCznglo
	vc5H2oRq0TxcJv4PO14puOrLyafNESGnM2HQfnPuDUOyzwWh9tHhzFemlSyLfb6J0w==
X-Received: by 2002:ac8:5e46:0:b0:476:addb:c452 with SMTP id d75a77b69052e-4801c98384emr67635781cf.6.1745875256933;
        Mon, 28 Apr 2025 14:20:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwFlUGiKJqtoSSSMgEbasdl1dq9bofa/6X3soNz43ekcNfED3Fjt1UCrbZacjbXAHMx8UTaQ==
X-Received: by 2002:ac8:5e46:0:b0:476:addb:c452 with SMTP id d75a77b69052e-4801c98384emr67635671cf.6.1745875256586;
        Mon, 28 Apr 2025 14:20:56 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7035462c2sm6323065a12.58.2025.04.28.14.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:20:56 -0700 (PDT)
Message-ID: <c2b490b5-9e8d-4da0-84c2-8c68d78920ca@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:20:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
 <5c4ed073-45fe-4938-b25b-8979d96b456d@oss.qualcomm.com>
 <D9I3OWQF8T3Y.1Q5U9E2RI5YZX@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <D9I3OWQF8T3Y.1Q5U9E2RI5YZX@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZX7yMcr6SfDl-7gBsSj6ld8lwZcaVDPb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE3MSBTYWx0ZWRfX7gvrFZ7GYa+n qCOjJX9Qc+LNtNrL6aUASDD63Y/LxiJvgGhCqh/c3oAR6GHCMwqarbbObiRaOtP7orn55DZfLqR xDzzd02/nBrqoIRLKeIImgUIVhyonEEN18tLG8aXgbs5asVmKHVc1+lRF/zpHMUPsK1IRzgfO3J
 kE6Pt2z9sKeZPMiq/ivorzDEScn6SfPwMVdW83IbuTF5TzGmi8oeW9iiNb0GxL41c62QGnzKg6n T92aEoXlbnqI/CP/Q2XKpOCgxH0v8ZXrVWLAADv57tCJKHqwR5HO88LraBmkOf9a2yl2nOQ+JRj NyQbPiIbKnf/XNQA7g2AWbP0vE+qSly6uwXga+1FmxRdBEqZkzbpOOE5ivWse1RexjwOozLsJXC
 +oaLcvuag2eksPC6M14IVqkjQlk55gFaYEIeeLgK0kcJJpNehyLuErdpV6CYs2I//yw3JhTu
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680ff13a cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=ZSjAytOJdz4hxISQkR8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ZX7yMcr6SfDl-7gBsSj6ld8lwZcaVDPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280171

On 4/28/25 9:41 AM, Luca Weiss wrote:
> On Fri Apr 25, 2025 at 11:06 PM CEST, Konrad Dybcio wrote:
>> On 4/25/25 12:44 PM, Luca Weiss wrote:
>>> Enable USB audio offloading which allows to play audio via a USB-C
>>> headset with lower power consumption and enabling some other features.
>>>
>>> This can be used like the following:
>>>
>>>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>>>   $ aplay --device=plughw:0,0 test.wav
>>>
>>> Compared to regular playback to the USB sound card no interrupts should
>>> appear on the xhci-hcd interrupts during playback, instead the ADSP will
>>> be handling the playback.
>>
>> "should" isn't very optimistic - I assume this works for you? > 
> 
> Yes it does!
> 
> With 'should' I meant to describe the expected behavior from using this
> since most people are probably not familiar with how this works.

ah, ok!

Konrad
