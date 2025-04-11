Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ED71EA7FF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349153; cv=none; b=lR+FgbPZW05Tk0l6bIILINakJNyXtMuHVAos1isDCQjHRoDF/sA9xjcDpRXgv92gcYFzl+9tmTHHKAtmOvsMu73BY4DSsKj3E7YlIjE8PAmOJ4eblwvOETx6j3d37TiQCvLrv7YeumkZjsQJ1A3g+z0bCrV/sLOlMZT9MbBBN1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349153; c=relaxed/simple;
	bh=ioSOXlyQXFl579hTqs7zPHpSy7ZBOmYC5HjQcqXr4FI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUUuJ1ZwzWzJ4fdWt9azNnJCOnHa2sq+Jno3xdBoDbs1HSKjgqm4Ti1d5Oq7Twb5fcVVF8WNjxzLtWwN+7zUhBZltQU8VhHS1Sj2iLoUG4B1TXl+P7t+tm8fJ0xIY9yVkhhbEIoStxFxbTvYUVPoHh6859dnc2BFcmhm2VJ/oiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jWrUhyP+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jWrUhyP+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B52Tnd019642
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H1U84z5FFrxTwGwNaEGAGiPAnjhUD3wh8jtog27DmO4=; b=jWrUhyP+8txoofAd
	rErH6WOIUtJqu2XPS3a8rpj6FVzUeApvDhYbCCKR0OX9L9QEHploNeG4EjAbjoIj
	odkX2ndCpYzaRmoD0xW2UOBYmWWAyw0nABSufaTlkqcgJZsW3xFhjIzg1HtNelIj
	GojAjcoLNxrI2IDbJn343SgCE/Dnjl7uwXdMw8kssOLM1lbi7P0mkJgR4mMYGX3m
	bUgSayNQMcBsb3GaUZy9Iz0qQbe7kQ46RqLRu2Rz1mRBHGptEcWLxa/ylwZzUcVz
	ThfV39EkbPh2sY3OV6wOS4h8jvvETMHIEijooAzn+UDw4M2J0l6fCbuazK7nhyo5
	4xA4CA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrsdsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:25:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2262051205aso11022785ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349144; x=1744953944;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H1U84z5FFrxTwGwNaEGAGiPAnjhUD3wh8jtog27DmO4=;
        b=iuCAulj+EJIbqD6gZyC7AuFl/zlqS8N8m1aLKtCuuooqbnRwvYFZ2YHMe8iKaZYg2z
         V0KaGvw39YVtTVUM7U9t+d3vWy1RnGO8AeERoTAHbQwrcj7dIoZBvRQctNpOdV/1TJn5
         R/A58dp+jN4nfJ0MJY7O8xdyK+uT7xiMS+fyfcqI45JjSOi+o2FvOKNXBwBP3xV+4keU
         lp5AqBlA3eK00Wm2seDFNt+dIMReg3BTKHVuDvJpC1+8PQVGHNJt43snaZlW3K50B+o8
         qAMYDIGWk9uIq0lmvqVZ8RHDqtI3hpEJW+lmuaI9Qfsig/+4hB1Wj5lm0xdpUBl2ymI3
         0h6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWH6LW/Z4eB/ubO/x96375wu8GfpeSBFTXxsfOY/NjpFujCOvpsyADzfKsvWN6YUD5paU0bK8tbC+Be0Ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR5ExsRFX75LiC0hrmwu/kchu+Jnf92wcfPzPR3mMO0kuGv4pv
	oEITlfbyzDsHIROsLww9Tggn6mjmAyZVl48nGFrJC5auRAhl4lrPcNYk1nM/SeVFfRUMcJFPD2p
	JD16Uw0+tmAafUB07G+VyNOcixqe50/zMDoR8XbEhj9RnF2qSKQj4JWX3u0L0RXo=
X-Gm-Gg: ASbGncspCHeXIwDfKFlFHvm55DhuxvVyQ8kaKR7V14BJ53nFyw8yk/UtgbFJZ9NwpUo
	qCCUoFQwf5jkE3T8ckZuC2AtfnHUzUpNTqLIBRtc45kIQ34nrj0iGB+LfqvVF+7FVHGoKz7oLRh
	GMCF9ddfGMS7c0Gylc+w040XllrYY4FucLrUs3DVsWJGKLBseU2nIUuUWqg8sKTKlcaVZmoOVoa
	fVKZHtREho2bDKtv6FlwsmfFhpVdPi34uluxDtVPMsE3+gV6FZuxB5NemivPnFFvuhgIkpFnRVg
	q0R/4imgS5tO8+5IlSy1PMCMH6xm4bEsi7U6w1iOFrELh0skUiQR
X-Received: by 2002:a17:903:228e:b0:216:393b:23d4 with SMTP id d9443c01a7336-22bea495810mr22859905ad.11.1744349143722;
        Thu, 10 Apr 2025 22:25:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq9hJcgN6Gn0Is3/IGIlN6OeMVKZo1lhl6PNnOXgM4n0Dw6h6honDiiUSiXrOcA9EERqaa0A==
X-Received: by 2002:a17:903:228e:b0:216:393b:23d4 with SMTP id d9443c01a7336-22bea495810mr22859565ad.11.1744349143258;
        Thu, 10 Apr 2025 22:25:43 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b628aesm40576625ad.8.2025.04.10.22.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 22:25:42 -0700 (PDT)
Message-ID: <eb69d69f-9b62-4eed-85d5-8adb1fb5ac8e@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 10:55:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/6] dt-bindings: watchdog: Add Qualcomm restart
 reason binding
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
 <20250408-wdt_reset_reason-v1-3-e6ec30c2c926@oss.qualcomm.com>
 <2dabc542-33b8-4878-a586-f9aac7e035bc@kernel.org>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <2dabc542-33b8-4878-a586-f9aac7e035bc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I9PWbAlXpOi94273fKS_Ifm89rO2gofW
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f8a7de cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q6Z-E9ZhQsGCyXXHa6QA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: I9PWbAlXpOi94273fKS_Ifm89rO2gofW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110038


On 4/9/2025 12:30 PM, Krzysztof Kozlowski wrote:
> On 08/04/2025 10:49, Kathiravan Thirumoorthy wrote:
>> Add a devicetree binding for the Qualcomm IPQ SOCs restart reason
>> information region found in the IMEM, allowing the system to identify
>> the cause of a restart.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   .../bindings/watchdog/qcom,restart-reason.yaml     | 46 ++++++++++++++++++++++
>>   1 file changed, 46 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom,restart-reason.yaml b/Documentation/devicetree/bindings/watchdog/qcom,restart-reason.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..babbaa70b114f9691018ed6cb10bfa78e18fad64
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/watchdog/qcom,restart-reason.yaml
>> @@ -0,0 +1,46 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/watchdog/qcom,restart-reason.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm IPQ SoC restart reason location
>> +
>> +maintainers:
>> +  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> +
>> +description:
>> +  The Qualcomm IPQ SoC restart reason memory region, in IMEM, is used to
>> +  identify the cause of the system restart. This will be helpful to identify
>> +  the cause when the RAM dump collection is disabled.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,restart-reason-info
> No generic compatibles.
>
> OTOH, I don't see much of a value of this being a separate node.

I leveraged this based on the qcom,pil-info.yaml [1]. I guess, I see the 
point. I will drop all these. Just define IMEM node and in the watchdog 
driver, I will get the regmap of the syscon / IMEM node and do 
regmap_read at the desired offset. Please let me know if this approach 
is fine.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml 


