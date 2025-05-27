Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE12821ADB9
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384649; cv=none; b=Y0XZ7G1msP9fe/9f+IEfO9Oj3Wh5DK4sAeIPfGo3ZzUhbB6VYigqHZYg9G29uPiI/a7b8c/6QsTaabysCmYEhgTeR+d0djb0yRvExAV56Zn4VNm0NA1G4568xquc1UOilHfy78ewtZO5IWM09pRTTAFioH6VdYY8gZ144jmKEps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384649; c=relaxed/simple;
	bh=oLsQiSHYDSEXKOI/hWh0KWHkpifEgA9Hba6qMZ6sQdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0loxhdxRLRBz5qDemkGzx+s7Lk1IrLt9KE9xFpW8n3jfBCGK2wbo0rTDGKyFuIXpPowsGwIxlO4zsTizJttVo+X2I1XYUEgyKxuFh5GQuPKvoUc/Uq624hmE2fjNiITn92Fknc4m/eYRlnfW6xwlsktjKrX2FlYa33ceTHTi9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PoezQ6Sv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PoezQ6Sv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RKUw2r022082
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mDtfEhpWbybo9BquJQGmwF8OkBC21Q1FwUr7PssREGs=; b=PoezQ6SvleqAFKe/
	HG7F91sEH4xC2sZz86nDkcEccw9E0W+/oi2ClhYl4f5hYNiY156Mv3fbyBOLHExl
	QbMxqLoRIuI0rDy1p4TpIolHI8dvUBN+uR9mJZRPBuacoJigEE0h6oNHuioGFo4w
	odB5w94OgSgB00Xu1wmNlGjYs38Glogd9cnJif1WOMNr6AYpeje2yQ4kFzOb5PPF
	LkTqY+1atrCuPttahzyF4H+GvncvGM4mh2A9MNe6N+V4StuVou92UABcAMj4N+fh
	mD3Z/DdE2qW2iyGvErwsOcKwT9IVFAVS5ar2HvKOLysidVD/jmQJ+69Jzn/0lFjo
	tuJM5w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcvu9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:24:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faa0435aa8so9710176d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384646; x=1748989446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDtfEhpWbybo9BquJQGmwF8OkBC21Q1FwUr7PssREGs=;
        b=SRSY6T8HqVGyfZcpXuRMWNwFAA4GG6+E58KLeIhsI2cdG8Os+LvhVad2eKSHZQAMYO
         o48zHhKCpTDAYW2XJxXLnUavPCOqqAhsWWw99rFC6r9HuX049jLPK2EgfCs+aRXLZ7qN
         T2EL7Txv7iP5ZFM6ZRExXJShpIFv/QhmKkUuQedIX/b/L3cD6OgomfIeZar8oeaFNrID
         c+a267MMfg0qqUWCMyiXPDvxKFTUy17pSCYMvZgLVMjT9iiWgDrjy3ij27zuZjNOmU1h
         naA1oAO1PNX7O53J/l7zXBWED2D7U8QPm+CiL6L42U+d+kOpLXzWvoqzbBQY7Pi9woUZ
         HaFA==
X-Forwarded-Encrypted: i=1; AJvYcCWhJLyyG6P7mCoimbv4ZxhsLTy8LlWDulNj0nmhTUr19gZ5dicE0clOW6bcmwu/jLJEjNeW1jjLV6LNNqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwynBPFiUUIE67W3ssPFd06utoYb8qdYpSkQa0+RfYQhjKayapS
	BCnuQl57cs5NptKiIFteYRQ8rSgdmEk4POdlpQ9DO64MRcBXPFO75nsm5jgTgk4pgAtXVSwRJW3
	JGOQ61VAZiMdbdB1g+UdNspRqNHHlMXm+h32Mm7dfjeU0W5hQObxo3TfpTrthqGcrJm8=
X-Gm-Gg: ASbGnct0qSdVNbcH6qxDco8YOlS6tXrj3cOxyWjoZpbuftv0qs5PL2EXh33LRGBXHty
	iFC2sq/uFZbplPlqyo2dMv+ST7yUV5An1ZjMrThC2SXQU2UCAFJL0qYrQpQcN1BqDSDbFOMAwvn
	xEE6xBx1xlw+DxLOTMOkl03a3g/1fw5sT5HcDcWQc/RQOmmitrFoPNJMXDXRy/P0UT3nR0nkv7F
	yuux/MF/K1Bw5EAFjjNXlqDrIbIeUBJ1owj9vVcYhk7bVMO9386Qnx7yOtFe5WegF+bAUha7r4J
	BSCOlSS9rw+gHMEJES8X08Ntvn2jIwGh1cMlzloMOv+C2+9ZZpa6YMHIeeUgGT8CQA==
X-Received: by 2002:a05:6214:21a3:b0:6f2:c10b:db11 with SMTP id 6a1803df08f44-6fa9d170021mr102554326d6.6.1748384645764;
        Tue, 27 May 2025 15:24:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMlSQWfVn9UPC7s8D4zNhThUYbhMw2ulqS9fDQYheouJp2WdybF0aq560e5JWTH8TcYt0i7Q==
X-Received: by 2002:a05:6214:21a3:b0:6f2:c10b:db11 with SMTP id 6a1803df08f44-6fa9d170021mr102554186d6.6.1748384645429;
        Tue, 27 May 2025 15:24:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad89f288ee5sm19250366b.172.2025.05.27.15.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 15:24:04 -0700 (PDT)
Message-ID: <447c3b13-8d6d-4bcb-83c1-9456b915a77e@oss.qualcomm.com>
Date: Wed, 28 May 2025 00:24:02 +0200
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
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <styd5gjksbsqt7efylpfn6bgwgyvt6zexxiooihjsnmp25yigp@unq7dor6gso2>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <styd5gjksbsqt7efylpfn6bgwgyvt6zexxiooihjsnmp25yigp@unq7dor6gso2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 85ci0f536o4NIXKyqRW3Jpx3ycEwfgbe
X-Proofpoint-GUID: 85ci0f536o4NIXKyqRW3Jpx3ycEwfgbe
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=68363b86 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=BdTzBBq6q7eIxeKzuLcA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE4OCBTYWx0ZWRfX5U93rmiPigy+
 S8HOFxHbQ/isbgoIQUTyBRcHsJY33SrpU7yJ+sOSLW/TXKmNCkN4MS1UqfiqUmLPoXrFuwXDudv
 9+eQURBqrYE8gk99GfKvZLi1yM1KpfH4IwcAhoqdfi+ncd7EJGNx7lhko0yZzadXXwfehZQAA57
 bFSMqXbzFHxdy/cdMT6wvIkxGRFSFDLnhHb0HOQeUhrfoqwUqDiTJ9vD7INul3c1vRyXi6eUXHU
 B2yZQPBid+LNzJEEVD13ibN6/NaCBPGcq0VIErBivbDDLq0R4EyDnvx/dNsoW0j/HhiGpfaeYOc
 EUHwQnANdxbxXrSRV57VFQGYZy7+Na0qUseJ1yuStnKdS+yu3b9aLFKTtpSjAVnw6iSBDOMKFdR
 vIEFU4R/bgHitggd/QBQV6jVtmr5IpMP9hu2dpyZa14D03gSeudkBiQBqjwaueGDzzkRFhFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_11,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=558 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270188

On 5/27/25 11:10 PM, Dmitry Baryshkov wrote:
> On Tue, May 27, 2025 at 10:40:02PM +0200, Konrad Dybcio wrote:
>> Register a typec mux in order to change the PHY mode on the Type-C
>> mux events depending on the mode and the svid when in Altmode setup.
>>
>> The DisplayPort phy should be left enabled if is still powered on
>> by the DRM DisplayPort controller, so bail out until the DisplayPort
>> PHY is not powered off.
> 
> This series doesn't seem to solve the USB side of a problem. When the
> PHY is being switch to the 4-lane mode, USB controller looses PIPE
> clock, so it needs to be switched to the USB-2 mode.

I didn't find issues with that on X13s.. Not sure if it's related, but
on the SL7, after plugging in a 4ln DP connection, I need to plug in
the USB thumb drive twice for the first time (only in that sequence)

But there's nothing interesting in dmesg and the phy seems to be
programmed with the same values on both the initial and the subsequent
working plug-in

Konrad
