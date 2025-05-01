Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2B61E9B29
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087828; cv=none; b=LwCdkbtRDaDE3Fn7/t1aPlcEaP5JHE0SfGBdJbH7MnSde4uSxmq+hML4OoasCkS87DttVD2wekQwgzPv/cj4Y3ksmC3cBe7gEvZTUu9VXAVEAtFJnzqvwJQSQsJgLqk9QnZqUCrloCOrjNuXlVK6gFL0bD3avLOhMDkSGYmeF4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087828; c=relaxed/simple;
	bh=i5qIUYMGnYjh3O5bD+pGUYppyjmm+gTXmK92O4h2v8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlHjxZnTM9be695DaxjmDTlucuXAwcZ7YD7Yjwnns4f14FUNHya9GfSSXXw9fbu0qwP4PPGc7eFHLWPSj9FuTFKQKvIhTOvDfJzDYkUY4b3jac1UKtiFVShzT4YlzG+qfgJl8rDYsaHlABGa2m8OwDP305WhI4iVctybcRbARP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cuEqgNET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cuEqgNET"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54184f06014943
	for <linux-kernel@vger.kernel.org>; Thu, 1 May 2025 08:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INmzJq98TweHQnpIdriujVmaMT2JtRhMol4dfGshJGU=; b=cuEqgNETSLOwnF+d
	ZFgIEOtfAFYyS4pTUChbA4F39BV2Gm/ODAl0V1wTqhUO8BQTnfzQn+9v8rqdC7Oz
	m6ht/j0Zj3/k9B1CDDciVcxTl8lVl0444rYLdRuRmrDyEglgVqjwJqut/36mtZE7
	V5SvB6sPwD07anEYlLdcDXPlFovNxs1w7gJrTtfDxRHXvQF7xXXXBrOUSBJfaShJ
	Q3FIl6xbxyBcu7gIh9xIHQqn21FSZfdpMcV5nk61SVbJPiQtBHttNIKPphrBUkEC
	m751KYZjnn6uqc5U/7/AzCa7o9ZdEM1jNe5JM4PlmaYY83IHgY8vtel7q28vYtwa
	T2io0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubmtha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 08:23:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5841ae28eso14504985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 01:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746087819; x=1746692619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=INmzJq98TweHQnpIdriujVmaMT2JtRhMol4dfGshJGU=;
        b=w/9CsDOkpwcwq35o2ODEsK6vViE9j5pGqvWNPbpVp7T/B0CAkIsgGRjpFLwLEbuwa1
         xw2fdokK20sCSl/yZ3lx8RRGLx7li4aUXDLhSb8B6Bmba87eX1OLh4knkxUkocEpZ6me
         OlqIuVxuHXWkp87Bd4z0ftU1sCdcf3lu0xLmlcAAqjV4uhDh5ym1t3m3+in/L8k0I/P7
         kdWTrn/De2/RW4gvchtjio1Wnio+K1FD6aM2Us2ajSh0VzCvkHqp6ggxPjZi8Jz3UKcO
         cBHKK8EeSxzYKeK96g/7A1QPNBzu6in4EKezJt1as0+5W7RMNJTjmMxv/DKzHMXJQ0k3
         euDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK0I7WQ+o6zlzoM+/he+KurLaM+EKxgN1xSwHb2Xe3m15J17kCWmycvoErYy0A/aSNDfEsnjTSdqogju0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw05F+i+Oz96JUQQPC+w3dg+J1HGAREFXL2iaYSZ3YaNuBe5rnN
	OLpJpESbaRJ+HqSmKc0/jaLjkV89FSxBr0e5GP3INKDLpY/kY+OlrBLLn8tij9F4VKQdPJgcBCl
	o896UcCQ1s2H3LCMw7vGJBclh9ZkwJipHAEOXioeLk8FI5ERxZL8OD0hGIKrdrbI=
X-Gm-Gg: ASbGncsa4yoFgUsQ+GXsgORKp5uXxVwwq0WGKIPSWaJtBrvYTi6nHvAymtKXyk3IfF6
	zSopOUDw+ps9Etgq9S1kn/PmRg7Ka+2whPInHJeOoi9EKUA+CfpdBSv7e/d11KmvPsweOKBQUgY
	ArPQG8Ma620ljjfoS4ys0e7YKl9iXz0/xSh93aZqFnevN+cXwNuq2NvLDeX2ZD6v+/8t25TP+09
	7hHj0KYNVipzhERPfIsWG/EAjBs/U3WcsFSMlBall/fQ+l3qgNBGzth32kmhqjk+Oj5WR8rnPhN
	kRPXqvdWnNwqsgvCGtayk4Z5PCN/2HAL/xquGwVflZy2jp79oIqFIGMWY+iByrz53gk=
X-Received: by 2002:a05:620a:4308:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7cacc181228mr162399985a.4.1746087819109;
        Thu, 01 May 2025 01:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJbzEzGsqZkwSu1kNt92eSKw+iLzFuEHzTdaaxapBQpXXrMYs7ZN0NxD9KdvXg5kB1l+jX5A==
X-Received: by 2002:a05:620a:4308:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7cacc181228mr162398085a.4.1746087818757;
        Thu, 01 May 2025 01:23:38 -0700 (PDT)
Received: from [192.168.65.219] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55af93sm7624966b.146.2025.05.01.01.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 01:23:38 -0700 (PDT)
Message-ID: <a9f893cf-bb92-4acc-8d9f-5a3180b67d75@oss.qualcomm.com>
Date: Thu, 1 May 2025 10:23:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sm6350: Add q6usbdai node
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
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <20250501-fp4-usb-audio-offload-v2-4-30f4596281cd@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-4-30f4596281cd@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qibkv2EduWDo7au2HZ6BmxBmMuzMXhsi
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=68132f8b cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=s1otzWxbid28AevFAO0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA2MyBTYWx0ZWRfX+VNObtCOsxf6 WxRged7e2ECr9j+BwLU8g1DuTZBgCmSrUWu0A7BXys2WAnE7NjMhH/r8y3UYCJ9SNj7z6CWRrYM tzUmMVMJXwUni80x+6sDsQyrSpZFqzDjDhwAseehuTYqCMVydNDmELUfdWqiTIZELtbdTLUAtsw
 V6pfqQVonDhxyhJzHp/FgJDYT15+sdrHXd0C6K9EE8qqmSQQ0j3twPskqzMdtI7ROTexeGSAtXC CHA965FQyQjY4kNXSK81weZslNZDjkRikyl8rDaWC0zqPLJSDDBVb0zbJokN+Q7wuwhzCNxphRd 562eEFg1gYlUHhy8xW5Rm8sVoWALzo7wJSjlw6tNB2XX7QRS0w7at0xY14Fv/YSMurbpMup0KjT
 QyNVlXyx4ygCJeehNQsl717jM35gxIPz8acAgTPeMsuTnasdZwzNjErtbR3fas2pXm0ABS03
X-Proofpoint-ORIG-GUID: qibkv2EduWDo7au2HZ6BmxBmMuzMXhsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=936
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010063

On 5/1/25 8:48 AM, Luca Weiss wrote:
> Add a node for q6usb which handles USB audio offloading, allowing to
> play audio via a USB-C headset with lower power consumption and enabling
> some other features.
> 
> We also need to set num-hc-interrupters for the dwc3 for the q6usb to be
> able to use its sideband interrupter.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
