Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6431A7AF7
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654669; cv=none; b=nEc92fM9jV9sYBF0gwsibXtM3figdSqfpft8SwZfjDq58cRYHxArFLwCoQg0SMulsqC0uIqXt20cYS0bdwTSJqyMvML1oEnNrQ2NA/eIystCPvk5mePbD130pjYZ4ZjpKNZUzQk0xEF9lxRyArxQikKpF9IiL5tlbiNmQJ3lM24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654669; c=relaxed/simple;
	bh=xIY+8vOXdTA2r3NFwtuqB6f0FhcbF1mjiXLO5Kqlg/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjuMMW8VOAlUKr0+ipf8go2MYkZZn74+A3wIr624Ob9TOY+bS4iuZxIeeVPgFFPFPXNY/2w5F/yuuiF397gSBWaCeeYlK8JXI0WCkAQugtc2S7Ljr0f472LLjJ6quU92enyTiAHgA998HuoQHoeUG/OGS+54qevuk4+IMw0nTM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oAa3HckZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAa3HckZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DFRV027192
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XRHkflpiDITTbNLmPmmf2fFvfeQDPpqdt8UJpTn703A=; b=oAa3HckZ02gycP0B
	Byr9IfZpMhU9dSCUa9WSbADnqkgFESYBvfzroEyhEKPxbUkp+4xlqcymVkIPe9g4
	GwtnAupEP7Fyea331nGAu8o9zV3zH6Ri1UmqSauXGAZKE+KtPcq7oKEcC3UKD1Sk
	EGmVTdKQy9h/0SlbNK6sLXuPoLTq37e69OaSZfWEYKBvytOoJbvU6CMqgximyKEs
	w5K6mhovWagsqY/qHKyhClvFe4ypvGDCLLkZFdWL+YCaB4jdqWM+Oy/EO+gXIIei
	cjxs6b2JbfYEMsnNY2ry+91q+YjFgq0zZEj1+iKakyOIQ0o1iZ2L5C/JyYn2E+M4
	tATx6w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvdb0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:11:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6facbe71504so1835196d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749654666; x=1750259466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XRHkflpiDITTbNLmPmmf2fFvfeQDPpqdt8UJpTn703A=;
        b=k5G8pnJax3Iab2al6UYBve/GS7hgIPJNC4o0g6JtCHIJErc+s7337udBNNHmZ2vCvQ
         YwyIcoyDLlMw0HI18QrzIKFxPDAZ5pplZJvSW9Wmo+n5xshAq17AzDG1AuDMLFCAt15G
         02IISgJuMs7VyGEsOngfCTyGxOLWoDANHD3Y8Q1O+44+ZGUPjatxq+BVcr9t+zo+HF1V
         hFRSr6OhWCowUUb3KeknzRU4DcxkeIF7rD9mWWxFPRFNvLzSdj4Zk9HCs5M6AW9pFk5t
         tZo6KRg+RF2G3u0mBWSXij7nNUSg5f+Tg7nX5aTmqMXEp6tSMJZHqENMEDieBrElQ3AX
         Xacw==
X-Forwarded-Encrypted: i=1; AJvYcCW1aZ0tuFRz739hRljuP9AM2OvN7kvqQ2XTxdvdOEssYLjXOeh/zxAh3p0yEJZMYzqseemrtAADc4vKGTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHnhag9fvbVn6iIg7QvteYr5HeRHAOXMs7d0u40r7c6AbMs1gH
	j6EgxbaQD3wRrnstVLcwXzCjz33m7unUs+Ctx+wxWWnJlbPwoyd3lFNMj4GymSvUEqwA7JITtSs
	RFM7rm+By38+EfU9l3upUQHQPjCzbkDV81bNSmfktXtVs/7YJEssPd65Vu2jo0Scn1HA=
X-Gm-Gg: ASbGncvcOhjD0C6uyXhRPVTpUTnRcSnh+lArKvlVi63Wj507BmAbZnp3bywr0/s/4Zc
	ctKgW0lIyw6XzW6KhIOpcyjd59ZQhbKCkH3PIMf+Kqmaxsk6Eb0fo8kKWrykOKyRqnWkNcTFp/7
	1EhhR9OUSWEo93md33pJiqK9pcowYebZQC+7C8uubQF/xs/tHk5s/f5Qa+I/+WoBpOPnBdVR/gv
	Qairq7IY6CBE1qfqT1XEMqXK6Rm6CdPYj1hKA0vXlOhCtNDCIND+yQm2DIjvD31WAGU5inKUrcR
	V+jGGH49hsHfEHc2TTj/uxbeCQb81M+PdeB3kpMA5JBS6+KuC+Ve38+wGLvubhpp1n9Rv7uLaSh
	5GJ8=
X-Received: by 2002:a05:620a:c44:b0:7d0:9a77:fb0b with SMTP id af79cd13be357-7d3a888175amr184308785a.12.1749654665964;
        Wed, 11 Jun 2025 08:11:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAMLco/lP1MiIm1Dc5YET2BYjUFpCExzSZhN/HK38bVJxSEhowNFeEa+jpy1xWNrJRJx/r7g==
X-Received: by 2002:a05:620a:c44:b0:7d0:9a77:fb0b with SMTP id af79cd13be357-7d3a888175amr184307285a.12.1749654665540;
        Wed, 11 Jun 2025 08:11:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm913363866b.98.2025.06.11.08.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:11:05 -0700 (PDT)
Message-ID: <aa9f23c2-8979-4e31-9f18-9be6ed0a45b8@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 17:11:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-hp-x14: amend order of
 nodes
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250610-hp-x14-v3-0-35d5b50efae0@oldschoolsolutions.biz>
 <20250610-hp-x14-v3-3-35d5b50efae0@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250610-hp-x14-v3-3-35d5b50efae0@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0URlzeNXswo788an0s4N8BOd9ptsadTV
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=68499c8b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=vdNxfUKwvXZ3YRcdAeoA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: 0URlzeNXswo788an0s4N8BOd9ptsadTV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEyNyBTYWx0ZWRfX9HTIYTbp01Ox
 zZ4vF/+NHX96VpxwUQAghYnxTt+qFPCnnDFHPuY0EeIutQ+uFNTIJh1sHJG3F1UO2RWEhW1ntO1
 ahd2D/2MEazCcsD5RzVd6yDYW89U8oNAHu80nXq/IzRv3Ynh0c7hXtKfZjZquwhYTMOpnwVTR9U
 vOTwMEaAtYJdwUYH1+0cRz45m6OPxaWaVtPw4ZLIaJks/lGSgOM2wILUXg6SMH5FEFnlko7RivI
 V5xJGkly+Kgy5xNLp9oj75KMi6gJs9tBngRhRkqa3MrhPK15Uwf78I72p6EFOer2F7c3qyF3HVk
 9YMlOjpHSZQIE2Vl6wn48m94qm/AQ1jm3qTJkNFViPeCCwtuW53ERuzR+OzucSxuA2hVi5QYGp6
 dVvhyDiFuyxdFVzMqnwIcZnosC8TJqjzMFaQy3OR9vVqupRtazmX1Fa5t+qycfVOTM4B2Bax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=814 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110127

On 6/10/25 7:25 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> amend the order of pmk8550_* nodes afte pmc8380_*
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
