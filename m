Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9C2264C7
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750982086; cv=none; b=kJO7/vFnfFvajejoUkklDGJd2olglDSUpZANHYdWUt9m5n0DGWh/D45IeYYS0XqJ9yYgfeso2sXXT8XSrL88S2rWciQU1Z8IxkH07yU9m3lXaT1OpXyM5LT/+6jEeQrClRDmf7hLM3B55lVSSwA7Dv5R7yBipzCtDhlwKicGFgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750982086; c=relaxed/simple;
	bh=GC3TC7GMidiRgphKPIXpKkHkR9sTB5CRS+p+N4xN+eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUOm2b3DDiQo/sLQOKuTvQbzonD5iVsfrx5mvd8u5t4Wo2jNrJBzU0BuVcyRMwsVxvA0yGpczsS/JlrA9+qzG2dKnJGI6LHDNjNI8pFI5xK9eTJhTnVUkGQ9eOtBIp1ivraHCtpQSvIcGMWTww5VFxm8M5yZLuVD+yxFAhIGC3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifkrKlJ7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifkrKlJ7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QKHSSS013542
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fbs4KYNHfJ3NP9WQooBIb3Q8R1VU/MYQIjF+jTKXYVU=; b=ifkrKlJ74yLUM0WX
	G9aGxzH9Q2H2nceFb3l3kaJ1Dq9K6LtOqlLp10EOPUUvWC/KXfVIHLs+ouV29Bms
	sMB8PlAt79Km50zaZjCFf08mgZ9vK50uMZxlswPciPYMX5DCODQfkDN6Fvxo5cFv
	sZnmhud0F1cSwRwUZj1jOnucwCB/pC4BvknUudi3ZUrsx5QGZawpgUa5yWFCc7LZ
	DhMFP8EeynXP4WnwJCVVhNmXSqUpNydFkpHZQno7MvqQTOsGIxJ4XyJWHZ6sl6gz
	90QZ83zC3EY7HURzPJOd0g8F/TSAdW9wuYrZpjkjj9r8S2CY8onZ2C7ewRnGSgUm
	8tckAg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgmv4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:54:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0976a24ceso44754785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750982083; x=1751586883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fbs4KYNHfJ3NP9WQooBIb3Q8R1VU/MYQIjF+jTKXYVU=;
        b=Op1g1+eKv7io651qhhnHe2IYiAls7f29DRr5lNCNgXv23B+bl9iX6cS9NGyui2za8U
         PZH31m811nAPym0bFVig7z/A3dRPd3QSz1ODA8P0tN6BFTxbmWYKf7IB/ZWa91H5Am2+
         kN6PiT+olNP0+oYn+0Zmew86/hfJh4fnABxnD447D2OiZxQBfJSu81eQSLmldT2QxvAe
         WN3N5NGPvUWHs+cd/q79umGm01mcX8pCV7miIObuxxtS2KhyzvXDwAYu0z8VgccNjZrF
         UxmA8YLN1Tl7ubhGl4S6OQ++Fq5WkzSXSAgqKHKHBxSUCvqw1KduwLygtF+rYfz6WSzg
         /7/g==
X-Forwarded-Encrypted: i=1; AJvYcCUC0NlzVi6jD7k+PiVKxEO0qDtzofv2lyPEIND2ttAoKeexlGIZdfWvB1y13xw5rcgrUgjatUdTEXA+2ZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvpqFQeP3yIsdXtUSADEHuXoxp+nFTJvalChb233Qv8lUalRiJ
	rqNVwIt7/1lq/5KH4Bi6C6dNjI8tsZCU2ssEEFeK1sJsPRiboRBZc9fvBgRokyvBcIu+98A+jrZ
	yiVhr1S3/gBC9EDLyh8E/e61Ol0owaESSg5MaOqEoTITUCPEKIchjGA84bwN92RmkApQ=
X-Gm-Gg: ASbGnctbRTzh0QhBH/xQPUc5MzC5Ti/PwBXxnihGn2X+Nris140KZdoZP0qgUr0S19O
	Yx3xcNYG0rvs2pt2Pw3fSCq/NxCd0jbjBNgq/rvVUUItRGCo0jwR5m6q/KU/uAolBKdL59nSTVg
	rcxU0YsQyJtNOIBFltu15RFvl+wIdkRqFWMJQrTLMPlWaxswWOn0IbHcbrgsjGVCzmBASBIx5S9
	kSBEjIW2OjhwXB00k7mrwf6mGfz1vDo2Uj/exfSqllzjYvbcj4Gxx9qRWwdoZgrcjXdBbvM2k7I
	aqVv6uSAwpBk+wmb2yEELyFqwey4cdQx1RMfIhVHraWqMH4zR8rCXvfS9ULjSLMmRNujgS4JEtn
	20y4=
X-Received: by 2002:a05:620a:17a0:b0:7d0:986d:963 with SMTP id af79cd13be357-7d4439a5ef4mr80105185a.9.1750982082621;
        Thu, 26 Jun 2025 16:54:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZvQe0I94SfbVb+8u+GjBJSQrO+fR99SDvM1ofMBXxhAK7dEqWNc0BrbxupoF6oexwLClKFQ==
X-Received: by 2002:a05:620a:17a0:b0:7d0:986d:963 with SMTP id af79cd13be357-7d4439a5ef4mr80100785a.9.1750982080321;
        Thu, 26 Jun 2025 16:54:40 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353659efbsm17829066b.46.2025.06.26.16.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 16:54:39 -0700 (PDT)
Message-ID: <95c46d39-5b4a-46dd-aa73-1b3b9bf81019@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 01:54:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] firmware; qcom: scm: enable QSEECOM on SC8280XP
 CRD
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-5-aacca9306cee@oss.qualcomm.com>
 <e5e3e8f1-4328-4929-825a-3d8e836cf072@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e5e3e8f1-4328-4929-825a-3d8e836cf072@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bhZIk3ylmjVOnwUm5QU1AZqoa7k93xP1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwNSBTYWx0ZWRfX+RnidAfvb9vM
 7q4nvRDPpKFPR5Gj64rCuWw1d/olBxOtTFMrVwx84ZRZCfNHDq0fYDmr0jmp0Dmy/RzNtAQNs82
 cnq4xykow0JFIGodeLnhSmSkq+m/KJowDPPnrYMiS8cAvHuIc+FqxrDRW0KmAyO5ckP8/CJbj68
 Tkn0mNtSD+BUh4moLgXmgKskQk6tA7KfYCRQaJIXsk324Qie/GtImX+QQyZqhSM+NJA46pGE09A
 vVsvw7ftCRvSysK37b/ZIpaGFx5jdpfSppTSqkIlEAJOPi1Uvl0beROHmVsKEPmM2NoQuC5B47t
 KYfanzPgszoy8K+Dmkgeojc+ddv5hxOEipBdHBK7iWHAConkgDW+cXfFu+93ziNj4SGBySS80o/
 6vFGkCuUYVkBIR69VbxG2Z84pffIM7iqZ8DNRfnBFx4fnd0+2I67w3ejRauFqYbbVpF8c8E/
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685dddc3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=qZF0ikmejsFuwZQdFt0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: bhZIk3ylmjVOnwUm5QU1AZqoa7k93xP1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260205

On 6/27/25 1:34 AM, Konrad Dybcio wrote:
> On 6/25/25 12:53 AM, Dmitry Baryshkov wrote:
>> As reported by Johan, this platform also doesn't currently support
>> updating of the UEFI variables. In preparation to reworking match list
>> for QSEECOM mark this platform as supporting QSEECOM with R/O UEFI
>> variables.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  drivers/firmware/qcom/qcom_scm.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index dbb77c3f69ddaa931e7faa73911207a83634bda1..27ef2497089e11b5a902d949de2e16b7443a2ca4 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -2005,6 +2005,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>>  	{ .compatible = "microsoft,romulus13", },
>>  	{ .compatible = "microsoft,romulus15", },
>>  	{ .compatible = "qcom,sc8180x-primus" },
>> +	{ .compatible = "qcom,sc8280xp-crd", .data = &qcom_qseecom_ro_uefi, },
> 
> R/W works for me (tm).. the META version may be (inconclusive) 2605

Looked at the wrong SoC META table.. the build date is 05/25/2023

Konrad
