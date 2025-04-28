Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1424B20B7FD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745876608; cv=none; b=YGQ+r+LOiXxb4jjF1rqDIcQFw4azDL/bqlqJ3oiNkH5ozixacrUVihgodSTx0cANzhc67LBcY/3NoVHpZpXRDLfC5xguoWcZXlim2HlLNYHWwnRHZsKlyxtFLSCUmt5T5VZrK/GgpLPzfIgrLx/cWpAfzJVunUWbFj5ApzKQ/1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745876608; c=relaxed/simple;
	bh=YTnMjhzE/BjUN0TK1uZwvOxxyGpbZ9aQZQnvvzTr+X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5nO+vzwvvPAYr6u1OGL4s/n5dO22A3Aszo2D05FJeLpkW2jw0Xn2jvStQZXvQLvb+/I2wYuH96BqexZV+lmugJE8+/CfBjGLUE8RfA/pnqCTPt0HTNREXUzKzyc30sJ1fym2eI54UcFsYH6bMS848UgRTd2srER/S8PU0uTlv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtCtNG1/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtCtNG1/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SLLC2e020027
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mlNHPkDq8VtO2sN9kbS8a7K+7GptveuqapgS2ZKB1jw=; b=LtCtNG1/HwSWHBdS
	4mMMkVl+BOOdBiSvGrOBFUydhM6ktS3gC36g6q0ALV84mzpJmnXWrwAbeuuU7LCI
	kZMXysl/YuY2AVKAf5wzFM4Qva3EPIr6/Lh7ey60Yrkk86mqi9lo/EaKuJo6W+E3
	b+BM4tVFCIoU1wP/Etq41dwTrcnVsZAOosefbWpWDzOCWOfI4mLCarc6l3W+qPwc
	dFIhZ23d8e1mATwots197gql9CQ6vVN+Tz1LBcmmo+8JD2VuoJDSH+MfaK7K+dqG
	9DRTtRaf8CtI6UuN8Ph2VuanXJ+m4r9cvsnqSXrO4dGQOBisIAu3XcNVTjs4CJfL
	9EocaA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9agcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:43:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4767b8e990fso4814931cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745876599; x=1746481399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlNHPkDq8VtO2sN9kbS8a7K+7GptveuqapgS2ZKB1jw=;
        b=sBhNERaT7auTeHY07oIcAhA/D8PffQbYlWh83bjHmzy2nfh/aRPH+BqEaFd28021Tt
         qWo9NP/baDElo+FthgEQXw/Z7ud6XMuepohoK6tgJW9sX3fAJXZ0zhDqBTFTe5T0ZxL6
         4gJFwMKy18gvcU0YlMj5aB3LZnS/YJYQQr04f4TSA1LUF6/b020uotuBjsd7GkwHWB3A
         M44tp8oO7h0Mb5185/zMsvteGQ0dYHnCxM2ss4ebUZFMDS21lfU9yVWgkOo1yjESk4DF
         vHkV1a7afbIO8BDvAr79oaBJ6+REuDshLbLbC/XYjt53MpetWf9ajphYmksaJN0HT1IZ
         XITQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYqVII8tPBIlzPqO494q1cVOwSMZuigHrqk+vVgI73FTHb0IIB5VRMFEploNC0Kl/y2PIVnFGfgxNS2Pc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVBBW9OWKMMNudu6DXs6HZti8NM58UrjXlZvY5OzT1Ba+weGo7
	pMRCW/8A3eR9uVsBMO0h5xzfC4vAKWBfL80AtNfVULhtBU3/0WGRKX/skiXB6ueXHqCCDOW+Og4
	l3NtqsEjFrrDccwQeGE3J1qQOFkIcGvIOr6sAYSNXZmie3Cytq3HMGuGQyvJnCUA=
X-Gm-Gg: ASbGnctkvOKWLWPv7kgMwKCdibr9fEZ+oBNFZSpnv4GDJqmYCf1yUZN80RN7KdSzBXm
	aWf0H2buAubavqqI3zbCPOkrjR0jNr3H4lBYMcJiqfBRUZZC2V5ZRpsoR98+FWcM5obtiuOr3aQ
	qv88EwVAYrbBIqjpAs4cjYtf066MGZFUVpwRxOr414ChaYUzyWSjhTWQOzw63rncSI3vgsPGhun
	0uYqOZRK6RcVRlGXUceZTDXX1D2b35tymoMALJKUjxBBSvXzhrUnPSfYmzLCiapM6VR3WzFadMo
	/fBnnILcNMbpburagg0u+8B/voRttELYtq3BMIreVVPEigjxZDTmkgxrlIkF+sjW4g==
X-Received: by 2002:ac8:5f12:0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4801cf53297mr89377111cf.7.1745876599663;
        Mon, 28 Apr 2025 14:43:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB14JfdvwUEuts397Yzw1zfG/EZZ6u2NY8Lwvpyqt/0PuxJTkGDBKBH4rJkTKOaxHlOXgrcQ==
X-Received: by 2002:ac8:5f12:0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4801cf53297mr89376901cf.7.1745876599300;
        Mon, 28 Apr 2025 14:43:19 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edae042sm677449966b.169.2025.04.28.14.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:43:18 -0700 (PDT)
Message-ID: <8e152cf1-24a5-4883-8c5a-887d3c4bd888@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:43:15 +0200
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
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=680ff678 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=u-BiFtGUy6h0pWOPBk4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: gvqi8eTB-kX5tsxa3iArqAFo7XuqLzBB
X-Proofpoint-GUID: gvqi8eTB-kX5tsxa3iArqAFo7XuqLzBB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE3NCBTYWx0ZWRfX2RkptOJY3wgp y+/rpHU3wnRTLkZXtBqNJ0wD8Q8Ps0m5nYOxPkGddwrm7FAOI4fIAAd5kjsXKcryQ5Chq1LcPaU bdq0XoXh5GgesslEsINQsFnJDJJUNZGEYn48Zy9NswQWX5PKRwGGqDBg/c/dbSqVYgPjRIbsZUQ
 CryLGEFSjpwOlDEpOvRRzCQSUtP+yb9rLi6Exeh5rRcYmRto9x3MlOZGAKqM4GZCIxQjpVm+9Hz nHnJfBXuPI/EAzt6mUU8VldGZELc7ztbtSMfL54/lbg6+y1nZnZf8cmCB0FNbxZ5fSyFcEuX1LW TBwTqaWGrk1oLH1OdeE4JZLbcXl1hZWlI94rzRTSjjTfvNc1R3tZ0V/B5ex81R2RAAvB3TkqVr6
 p207SQSf1QPVsqKmvvoJGEX0dh1HFJkAY9vnntL53wyDv/aTlXmKtw1cZEACRCXWcHErfd+O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=984 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280174

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
> 
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---

[...]

>>>  &usb_1_dwc3 {
>>>  	maximum-speed = "super-speed";
>>>  	dr_mode = "otg";
>>> +	num-hc-interrupters = /bits/ 16 <3>;
>> Where does this number come from?
> 
> I'm honestly not 100% sure. As far as I understand it, with
> 'qcom,usb-audio-intr-idx = /bits/ 16 <2>;' in the qcom,q6usb node (which
> I've checked against downstream) we declare which "XHCI interrupter
> number to use". Without the num-hc-interrupters property we get an error
> that not enough interrupters are available (I assume only 1 is then), so
> this value practically needs to be higher than the <2> from earlier.
> 
> Why it's this value and not a higher value e.g. 4 I'm not really sure.
> Downstream code looks somewhat different and "max_interrupters" in
> drivers/usb/ doesn't come from a dt property. I'd need to check more in
> details what this code does - or maybe Wesley can help.

I got word that it's simply hw specific - please move it over to the
soc dt with the value of 3

Konrad
