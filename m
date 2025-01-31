Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F44319D06E
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738328123; cv=none; b=RSrSUmQIb9G2rnSZWNXwZZPHpTAbrsMR+6hoYYxDhjsFodyXQeF6AZ0F8ydLpwBsSYJrKe+iBPwvfMZiFjleB8MxfMRRJpa0xbtwQcNV2OV2TMyRJLRLjcBMMGaRz26Bqh4OCwdp0RhPGHMu0UclMYoqVdEhBccCZKylO7ff3Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738328123; c=relaxed/simple;
	bh=4voU1ARq8K+IDYbZ16Vqqk3bx5a+nqiyeDrprWrgBcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8E5wN8dECA+9+HaE73r29DdYFdHrkRJKsDO+87XCHBaJnlD8Vq8DwOVSy4aPpKVVv3mrYto5kcznL+iY4YjfvBcZIxB2dEEDVxODz1gGpJV8BIysIj1+MtOoyF5tbiA1A9QtDhdOEkz5BW/3QwZhyx4SH7vcaKBNn+CA5UPafw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLVsKmkH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLVsKmkH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VC52Yl008266
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m9XMNZsakzqgTSXYDETlQtlmDuyrsoxJIFMvbaSU3N4=; b=NLVsKmkHYSjWbIqZ
	MQB2yb/RkXJ+u2FIffEgpN/ZExXvwyIemQ+6691RcJyl/9n8kY5T/cCxMRpjKo/Q
	7HhbtpLczLSwt+QntfdBrp2xxFaAqqQ6cQPy+MyGAgECFSZUeso++p+5FCQOuUdP
	WHTQ1/EPEspWuXWmAXmcBkQp8ZQByrmdpWOQcjMFTpNRr1Ur3Qo+LI1SGkR0Py7S
	pa4HvKqDU6kED/UK7og9kcobg0tyYQ2r16xzyGiBIBBpteAwA3RIfKj+3p1ktUuG
	0g6T2VS3Wtq7tHHksDPdVxJR+r7frxUmbAcV6QeyvhB65amBETSosToY1t34qYtP
	SflEAw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gx76r3g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:55:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6f28dc247so42250485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 04:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738328118; x=1738932918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m9XMNZsakzqgTSXYDETlQtlmDuyrsoxJIFMvbaSU3N4=;
        b=YITvwn8P/CjcNwvTaA2HTQEQIc99qqedAi5TXvbBD+UBslw2lHrDfUESy+7kTh/hAB
         HLiJlitSgDGq7Gv7xzkFvPVjKaWfr4TCGBkrOju8qhjgzSVM4+IOV6QxJLtSIAZEod4q
         sFrdHl5SxRmoRg0757mYPXODvEMgzWEJeQB7D3LUdA2mjqLJkX0mp8xPFoUd2G7JskcF
         DWeVSaixIJtScsYf/wMeIKnoqS8daqIat2RtjaHEEOIP0WIGjosjR+hj6Ndlue7sTyhy
         ky+k48d1pBET4+Vo8tUHyCetlCBemFD0LQlwvRELq5YsKZLGroAlDopRdGMXcLTCiQDU
         atzg==
X-Forwarded-Encrypted: i=1; AJvYcCXs2fjFExrh7pXdrIRieI3ai15kpsDT1iUeHC46worL5JH+uFHBSf54yzfjrkhkCxGCQdsebYikSoPM2Ow=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmxNvNQAgb4FbxFNrmb3EuQSrLLsA57OmVrp2eUm9/YYOWLHES
	ejeruTDWq2VEFTnSJSW1Wdd54omadNxE99KEc+61j/fghKTxDrqS4jwb+Lh0qruIFRf22Im7/Ew
	l1SmT1aYvl4AOLlUeOjY1nvjbMsXJRsTRim6hae54X7k4GDUJ1rZrSxbRnd0wIhc=
X-Gm-Gg: ASbGncv6vDxoTvPkwr9n2ccxAr9Z3ymkY9DYE4dIQw5BneHBp34kxjb+qIO/QdzNXFV
	QwNuDbfapKQrQorPrD+S3Z6D2Ttni7bER30wkvK9YSHsyCl3J6GMB6C5fYH/sWV2Fivpo/Osnq5
	ecqzO2rIiUKFk1dHGYJVYHlD9gdvriMe3nr7wuB/1+24i+R7E57oVnpcSZkl4Zz/NespoLsUpfw
	sFf9YLr9Jt3JpifYAV1/7MNiFXd7Fv2avyMYDDAxWIqXQPo40wGR7QIb6TBXjXfvPok4zGK2U8o
	HlGVytxHAYBiGxER5CVxXZuI6lmS08J1qSWUVTVIG2xgZMJvTv8A5VInfOY=
X-Received: by 2002:a05:620a:1a0f:b0:7b6:dc4f:8874 with SMTP id af79cd13be357-7bffcd8bd41mr600533885a.12.1738328117967;
        Fri, 31 Jan 2025 04:55:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMVxyaytYmw+jjx4Ac97ZKB2a0FMxruFitQESJaPsVpyHuARSgtzgS3LBseJLa814PhTou0A==
X-Received: by 2002:a05:620a:1a0f:b0:7b6:dc4f:8874 with SMTP id af79cd13be357-7bffcd8bd41mr600531685a.12.1738328117549;
        Fri, 31 Jan 2025 04:55:17 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c93d9sm2787473a12.68.2025.01.31.04.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 04:55:16 -0800 (PST)
Message-ID: <53a8feea-27a5-473c-8d87-852008b88fc7@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 13:55:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm630: Add missing resets to
 mmc blocks
To: Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20250129212328.1627891-1-alexeymin@postmarketos.org>
 <20250129212328.1627891-3-alexeymin@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250129212328.1627891-3-alexeymin@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RozWLV01R1H-ocNh9N6cC340oIAbnjdZ
X-Proofpoint-ORIG-GUID: RozWLV01R1H-ocNh9N6cC340oIAbnjdZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxlogscore=951 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2501310098

On 29.01.2025 10:23 PM, Alexey Minnekhanov wrote:
> Add resets to eMMC/SD card blocks so linux can properly reset
> them during initialization.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
