Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C9519343B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748430813; cv=none; b=YW2LJEhrghhXXUIrR674cOmo+rZqnsGJL04GImCs+lqf2t9XEmPXKOW3zZhAgXFyLi+XAMg5lgFLpfLAibOWmk+I7mzX3+fUuNgo7MVF1/TDQ6z2a+Yb6Ec3czbuGO0eDRDvKbDVR56efi3WiEVpTFqIPoqkCQedpP2VH21XkJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748430813; c=relaxed/simple;
	bh=kSxeXKRTq2AWY+QK4FBihHz03SpIclgrupOj+3QM8gI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqAguSBM0rEBntQE6BtNqhycfWXl5QMsc7FJgJQLEBL0Vl3NSeifnNne/V8D1aX9xCIuhm55O7lf+3lqGzgBo3LS2l+gZESpabRKFawT5kYTeAGnmPM/Qmxh7XT+1C+fQLyJOfAB9j0eJWv+sgysIbVRbNjY5AHd8fdUDaU+azY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXmpdtcw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXmpdtcw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S896He026404
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vgyuAx7dSshWcQQhWvUbmXixp8HbacWD1UD6odQRfDI=; b=SXmpdtcwbio5lhSK
	rN/v64jtZDFc8B9yTOIX04ce5thjB3uvDghaVCXJFic6wmAcctUmKZSU66L8weja
	cRgkn5jMhPFhuj+WKbIx/Q26n1Wl15ralEzIKH3baDjvZOxBsaNh0soGYkGeOmjz
	OQedSDimJPJ7Q2Np59bTbL3VxXoQTig9ijJFCSq2LC5a53stMbFjA+JNuZ4qBPn5
	8LtrbbCOkzvE0c4CP97NjquG2yabMRQOBpZk/cTBORCF4gNVpjVtMiwmSnvn4BQW
	VozEl3nf97Cp73G4f4fxfxG5/iShGuVIfH06rLzOVJqkueAs2dlmaiZceTbN33vA
	v3oFHg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjt1qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:13:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-49452798bd4so8432621cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748430809; x=1749035609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgyuAx7dSshWcQQhWvUbmXixp8HbacWD1UD6odQRfDI=;
        b=RRVynlkQAcC6NeWCwQzW/5kQLOgG+pooO5rVqSzRw6VHjztAQ8Dr3TwgffVlNij9gv
         oOeGcF6++OAyCWo3C3Rh82oxMgIVsDBR/K0IPyH2aLoUr8ornCIihzSjEuR/Zhliv1WV
         tBeBP1ELa+kLlMn2F/W22/Tz3uvwyfL3dUdtgv3HfriB3xAtPAYUpj5Jydmwy7gAdnWv
         uz21CRHxMpTwXPLAxdcZi7lXxkyxSURItIn1wAc2zUNzUM0bjw0K9rnPSfkrNxaD8Y5t
         4ZUlNE/WH3FU6IjwR1/yDM9xRnfj1xUOm88kUQ7JwMn7OTJ/JPMzXWtGmh4QsWHIuhXE
         Glww==
X-Forwarded-Encrypted: i=1; AJvYcCU0x18qYyvdNjBeESp7NiimwgMWOcPg5BgYDkD6OocYsalTt8BBueFJivuQX/LzIIs1o1uz9V4ypzPT/V4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHjdS4+3bLPldO9vdqVH4lbR34fyMeVFhwJtdLT4EJif78+nd/
	7YsD2QI2WAjNJ0PV4iqmZAdPDbvnJRv28y8fML2HvCNuDZUiynnIwKohNdWaC8McVBwWga5X+Ij
	/lZwu4xtV9iV17OL2wxyqNaHRJcXZOunCmjN3Aj94RMmcUvQBMSchhLCy8n+GuIWNZZs=
X-Gm-Gg: ASbGncuncMQd3bUClG0zdYdhCZDvWlCqKSIjfEcU/fPWjNAI3nZD0fRCRsIu4mJ2B3m
	/PFkUNDPiykmYrQWoDkbf0zxxa/6uxeqA5vHEtRkJ8ccgRRIsUOz/wSxqN4WZqdwTJDCzHH7+Sv
	4HpYu2q9zdwQHHOOibijT13P8H8o3f98p0f7o/07ane8tinj9z5U7aJJFyaRZIfekfBxHmm4SKb
	9qGt+fmMtAUtI+PozZm/xluaPSleLW4SH7i2o23oClm5Biosj0dv0/rlsERkjJOcQoM8RggoY9i
	7Bfg+NtB5qEALAdtcaXlPsFa0iuCThhzwRl9RisapdRJOP0xWjzALYa3bwwzhRlC4g==
X-Received: by 2002:ad4:5c65:0:b0:6fa:b954:2c35 with SMTP id 6a1803df08f44-6fab9542d12mr26075796d6.10.1748430809486;
        Wed, 28 May 2025 04:13:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeKRrREHf2m6YYb/SYCGixIP+aO46rPYYipbA1Vi8xkIBSTUT+o+9WPcrWNSOLCsqtY0Enyg==
X-Received: by 2002:ad4:5c65:0:b0:6fa:b954:2c35 with SMTP id 6a1803df08f44-6fab9542d12mr26075586d6.10.1748430808982;
        Wed, 28 May 2025 04:13:28 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1a1323bsm90175166b.84.2025.05.28.04.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 04:13:28 -0700 (PDT)
Message-ID: <9037fefe-aa40-4884-97ee-b81ff8346944@oss.qualcomm.com>
Date: Wed, 28 May 2025 13:13:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <inpfuxskvmrebxitqtqwzvpnpicibo6zakgk4ujpcrqrpef2vw@nhclj5rg7axr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6836efda cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=PC4tWo4A_DL9_zoQyE8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: cKGTPbQ3b7STIpJfMD3gwXU9Br0vG3kh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5OCBTYWx0ZWRfX/UjLrC1MadcQ
 cHvfm6EZnWM5iJKsryYpmwiOfvmftkcge3KysVbUbm42R+KbgQ3TPuzI9WV0GhD313VbuEMNMQl
 fmCI/5NtpgNGm2h3C2yibrKUc9fDIAsd4FfH6AuKcegKhp8INU4r0wALa8CAhgdYxWAwoX8iF5Q
 s6UvGBTmbEtSDJnUHVI0S5ZXmbjRAoudrnYebFXJYo2jorFYur0HH12D8pUg5xPGhSvp/u+ubIk
 pgUkiwe3ilUx18pv6PChWdT8jA5NDWp5y6i1BPNm2YZocBJG2bkoSn5WotBPTrkM4NF7lEhotaJ
 oYPMOtXBGGtD6X9qFs1KDZ3ZP9O5BtqjN07pCpop+x7Ap0vSKcOsuqBt0oXrF0SUE+Zx9BWy1jP
 U1295UkmcBPAQqnxmNvjMVwDJvHxQkbFgKbgBMXS0W1erm/Eq+tjuPsRU7EvP/0fcve8QMVC
X-Proofpoint-GUID: cKGTPbQ3b7STIpJfMD3gwXU9Br0vG3kh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=590 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280098

On 5/28/25 11:00 AM, Dmitry Baryshkov wrote:
> On Wed, May 28, 2025 at 12:24:02AM +0200, Konrad Dybcio wrote:
>> On 5/27/25 11:10 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 27, 2025 at 10:40:02PM +0200, Konrad Dybcio wrote:
>>>> Register a typec mux in order to change the PHY mode on the Type-C
>>>> mux events depending on the mode and the svid when in Altmode setup.
>>>>
>>>> The DisplayPort phy should be left enabled if is still powered on
>>>> by the DRM DisplayPort controller, so bail out until the DisplayPort
>>>> PHY is not powered off.
>>>
>>> This series doesn't seem to solve the USB side of a problem. When the
>>> PHY is being switch to the 4-lane mode, USB controller looses PIPE
>>> clock, so it needs to be switched to the USB-2 mode.
>>
>> I didn't find issues with that on X13s.. Not sure if it's related, but
>> on the SL7, after plugging in a 4ln DP connection, I need to plug in
>> the USB thumb drive twice for the first time (only in that sequence)
> 
> Might be.
> 
>> But there's nothing interesting in dmesg and the phy seems to be
>> programmed with the same values on both the initial and the subsequent
>> working plug-in
> 
> Please try using a DP dongle with USB 2 passthrough (there are some).
> Or just emulate this by enabling DP PHY / DP chain for plugged in USB3
> devices. Would you be able to see the USB device on a bus?

I only have a dongle with both display and usb that does 2ln dp
(I tested 4ln dp on a type-c display that I don't think has a hub)

USB3 - yes, USB2 - no (but it works after a replug)

Are you talking about essentially doing qcom,select-utmi-as-pipe-clk
at runtime?

Konrad

