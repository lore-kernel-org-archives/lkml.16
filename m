Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400D721348
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750964762; cv=none; b=CO/1TkofYgjTmKBJUPAEi5/cBAUkZvx2X66TmjpxOxDQFdyv1HEmwVnE6hlmQQYkHyIA8n4BM7XFohOsfUCC6I/An9NEw8L6LOG0a/hIu74GjKZpT8RbRCsugnLxstWqIIRPLRVd4nPI+jPSLBN9oyQcDpE9A0vAFYUSF7n1J8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750964762; c=relaxed/simple;
	bh=hzWSJSh9ZjdKk+l3TLWOpD9SQ8gWkmCymR4OspvLhfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SorqOle/bDSjH/0TpSlmuxKuOtmO8G0P+QAb3PoYDENl+UdHxIwkltaT4BpFacpER7FuBk3IJoRwLJj5q4Jlub5lSJ6JAmt5niCO3X+fgNeD4ng2A2/T1PRqNUfeB8l9ZfokjhOsGpp8ArnwnHdIGW4b5YO2/LGNa3u62J46rlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P6jtoCF7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P6jtoCF7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJ3FDb026634
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kff1UkLbIixnPa65vM8m196vhjIFkw4/no9zeyyQcKk=; b=P6jtoCF7Mjx1xcQd
	ZE7nTkYUwVgkvWEwqHneYaqxGop6RhO4FNLYPfyy9b1eHxzs2QEzJnLPV5dwX92/
	INMT+LbzNNFCU736ixn80YhmoVNQn/4N0Q3rNPhAeEMObna6UneyFSYGW7i4zjFj
	G1kYHN6vDYp/9YgekBJPQwQXJM+dgcjbX8sv3a94h/B+UObVy1ND6bB0XczBsf8A
	GZoTasrdnbacvtTb0IN4gnkmN3rX5hK/RKEgtqEgOl89FlRfSJFvVg9MvXsEMEN2
	MBAPItYzfEv9vW/G/XTNBwJCtpxFVK1VKM9aI4GU5KxrpVpJNEV0cGpxYZg/e1Lr
	O/klkQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5wj3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:06:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09b74dc4bso27753885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750964759; x=1751569559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kff1UkLbIixnPa65vM8m196vhjIFkw4/no9zeyyQcKk=;
        b=pZx7SGFmSpdwBfv4d1wRV8HIQkf0jXFK5+DQI1verX50wjEoA2+vpVbb7sNsDozz2d
         2KWMjdfDQDDwtlxcja1dkV83c3VQ/FOZXuL/DbLOrKdRBWnXHIGqKUpFbnvt0dNKrukv
         VTrEQHz3N1WEUuSL84XwsNTc/Ri4P+qTyhjBpYexYd/5YLi6zIsaPZzJCEu6038W7SUj
         rxDD+su0F9hGGFhtG26Tzo4mYAgO5Eu52GT/uVU9TQnFJa38o2k8B9Xv6RoWq8OPMQKd
         lqOiIsybqVa31atQH6W+yD753BaTgwMbNj34W81VOMjS9jJEidSyclShuV/2vf2wL6Nn
         mrmw==
X-Forwarded-Encrypted: i=1; AJvYcCXrgWamQENJiB5Uf02d9WcLOosAZJono02CNjziRmgvaqyAZbxyJHy+5pp1+U4PUOiqwrv26XLTiJBPDBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ64wNCMbVwkhO/bdBWBlsN+xe3BLJTweBYS3QgjwSARQ3sjX7
	+OU5e14Z8HGC/F/yRGMe4TiRC2zoMK0T9e1w6pgFE35e7cbSt4qF6EzsEC7KOF7WaqD/oQidZPO
	t3cEIFbs/nL0fgMNK8T1WRR0P3LKdW/IjjOYYJw1p0HOE7DR4woeSr0LEEZzVQl/hLeg=
X-Gm-Gg: ASbGncsJsbYWfO4U9B5fUYyqaZ2qAKlKSrrlmqPMfmR3R7IVVc/rhMq8oHJVBsLrJKV
	FZPOh2Tgkp9nRqhHfT40BlWfoYc0bebXcpvIAFL5YxHsjMoWs5GVoHdHyVlIOHe64UW6eY/BxE7
	tqdCdLgYACtJXSGgxi7i6v38jni+EmawkTn+5qhAPzcZDJvqtwB+TVyHgP/Hq4Yq7rg8JuNofj2
	tYVZ8+tF1GHNBUwzx153F79LqmtjWM1N4NzlHBAndrvuQgpeC3BC6z7iJPL/fIOnoaqZRj3oSs6
	g3bDIqeGB6gs1u2QwPsf5ZVmgeY1YEwXB/scpP++B1NZZQbRuxQWpg5+5WnHANdec4feE76A7bl
	EegQ=
X-Received: by 2002:a05:620a:318c:b0:7c3:e399:328f with SMTP id af79cd13be357-7d44397240fmr34374985a.11.1750964758872;
        Thu, 26 Jun 2025 12:05:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdvfCTQdfFP0SCpdMbBKY095dyxBl7NMLUmqNDaDx9nn2uN6YU/442hwfaXLvkQ2HJfXqedg==
X-Received: by 2002:a05:620a:318c:b0:7c3:e399:328f with SMTP id af79cd13be357-7d44397240fmr34372885a.11.1750964758406;
        Thu, 26 Jun 2025 12:05:58 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d949csm39521766b.81.2025.06.26.12.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 12:05:57 -0700 (PDT)
Message-ID: <d92e7c52-eab5-4759-af3f-16b24254bff6@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 21:05:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/RFT] pinctrl: qcom: make the pinmuxing strict
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250625153711.194208-1-brgl@bgdev.pl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625153711.194208-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GCyqT9QP1lPpM763PsdgqEKd_6MBR_ct
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE2MyBTYWx0ZWRfX/qH4fo1Aba1U
 Gi2opXuijd+zt/Lz1kMr8D7il08ekX3Mdz8pboWdEotbi0wyUTgGt824WGYDfZooc6nn2izJAMP
 qJleJQbxZv6WFNHh2WGISjTCATuY84sk63/6c+FPCxfq0+k4NMvTNZFU7QHDjjtdDnQlO9zfWEH
 aPxOE3pz+zmi1tzotPumrTNGpMlTpCvfeAB1X7HdzYuF83+TrKcyuBGVxTo//0sIcbtCqYKFmFx
 LcJQsTwT1C1vCSiWiuMWP6+PxRxYNYd2/OZcLjoZ9pbBab6Oy+49AXL05QeOxgOJ6hyfLX9NpLm
 Xe/DQCBtvLxwKDvfa+MS5qRfKxQnRUw6ygAiJqSkTDqzJA2ZP9QF6KDIldvD5Za6XSEl/TqkRVj
 iCtZERyUSDuWgHyGpuBqa4kMnR+/ZvFxnmgIekQ9kVLC0lFlgi2TsPI5C5hP32DMyDyPybF8
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685d9a18 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=sOBEMjS50dyNa0exkEgA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GCyqT9QP1lPpM763PsdgqEKd_6MBR_ct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=901 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260163

On 6/25/25 5:37 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The strict flag in struct pinmux_ops disallows the usage of the same pin
> as a GPIO and for another function. Without it, a rouge user-space
> process with enough privileges (or even a buggy driver) can request a
> used pin as GPIO and drive it, potentially confusing devices or even
> crashing the system. Set it globally for all pinctrl-msm users.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

SC8280XP CRD breaks with this.. looks like there's a conflict between
regulator-fixed accessing the pin with gpiod APIs and setting a pinmux:

[    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already requested by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
[    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100000.pinctrl:570)


Konrad
