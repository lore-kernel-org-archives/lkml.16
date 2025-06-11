Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC2D1E9B28
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 20:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749674785; cv=none; b=m0UVkT5+Zwa2bBc2TVv0HPwP6+wtlVCYqKBMUGvPmeiuS6GJqOOeRLh3DxMqMipY+0SViePC6U2i3l73KJQO/iZI/mvDi/OC4gIhAfGT9tM65ACLaabmTL1dGPFM9O6PoEJcd8mmhwxO68apgYcrNTOYxgSLLUfdaPmYXPuT2EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749674785; c=relaxed/simple;
	bh=9A3+er+GXhBSMFhfbzGJIo+ZQBu0Z0kkcuzWaD0rZks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKi3VOLkHaMeG4q5gSrG5K6vJb/K40+OM4EyHDdZ3ELkpWIF11G5P1/aekvCK63BQwI3fkPBKBeNGCsOaGOttLlHT4da//w0LnfcvlAwTCt9gw23tMfwA80KqvW2xH8WVHIRhgtK6zzk/F6RI8/fU56+bYUARzvGweVaAPizXnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kiM0Dzzd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kiM0Dzzd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BG2iSI026169
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 20:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ruZUfDwyhiuSGUGocg3TdcOGOm06EvVKWSoIrX94OH8=; b=kiM0DzzdHWbeLeNF
	nYUy1s/nSgjws2kmqtIqqhlZW4vGbNXKRpipCW/+VNUAQWFGI0rETlf+NHyvBHf7
	coagwyVh+o/tdH9mtGQVcMxJHbq8QzrKcZ+FPeD9a0lXQWayVwsD2hoRI7FsWx4j
	/xruIzdm7PU2RJPdgF+JDDUQhq0aj4JJ9qTp4ljKU6apl01LtWlzuBd0v1DY7Ubd
	9tLPWGf5C5M+MXVDUPfuTTnzcafdYtxgG/uX1G2sTnvHlK++LUInv2A3AmzHITSI
	3yfe1uk5qmXkUM2ZPx423syex3RXTgqIg4N7JtF6LepntGY6+eEKPDjgnT/D0lhj
	8e5LAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4778cwhj9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 20:46:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a43be59f17so469571cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749674782; x=1750279582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ruZUfDwyhiuSGUGocg3TdcOGOm06EvVKWSoIrX94OH8=;
        b=wXxe4bijBzYoKCBebY/oUViX+WlRqw7Fhiysaa1h2Fz6D3yWW2Flz/lSp16jJbvwMq
         GNNXqGzamNXXmDdSM4T8o0yU2+hhPZAH3TCwN+6Gcne9fP6mgLIM/QuGMc2Omb8JXc2Y
         i4/Pc7OvLoYzSMI1uc1UqY5RrXbv51R4ZbB0cnMQjh5rdfGrLf0H7Q5ETwyC9c1KhJvo
         a0gyuO3Ay63TtPDXbF0pt5/8FLIo18Soxq3T5dSd6RoJtBWErON8kUFvp1fuzZRgIw9u
         jXmY+W4ffI1jIxagN5wN7mQ59IVDGnNGkKgDAV0Wrhs+QGvoHelyhHEcZ1Ej0f4mFg37
         NUNA==
X-Forwarded-Encrypted: i=1; AJvYcCVcxEdtQaW43rJHVbGP21mFF2E2k288VLfRT4f5X8j4jduvZOj4ZlEjIura6fGQZROOUEMk8EJPBvPJsOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEqLbW+uyeWXUpc+v5hs4ZVGN7ENokpurI2RnbIWrZqHCtONTF
	6EJK21u/9VNSCxjo8a1YKN08JkixMt0N5okpvWSWpcjwa5+Wmzi+gSqaNuXQ8UF1fmoiAlt8v/p
	DIAT9GzpOnfDYAIek1XOYmb7vjRp3l/8PxY1re1omZE5Qwv72xfuiV/uqdlEI+0bnul0=
X-Gm-Gg: ASbGncvQjmuXOZT+rKyuhUdR6oVxkgBM7eSv+daUp0dXWOOsKjJdxKp6girpSajOimR
	lznLdtKSaIz3rnkpEGi2QiHVZ5aKLIAOpYynuaeRbI08jhW8g+cPqq7q/j8js5g+hkbKHgMIH43
	V/h8pAA+j8FJdipJnSkaY+ZQUWlx1rAlhhZOwZG28OAJlRaQYbskBPbevNzqvex8XX8AZT8UY6y
	PpgK1OrOeb2W9e5LagS/7IHPKVceQKb4T3mYT/ef/I5HnvAA0J6Gcf3/39JsMa/EERuhk0CIMah
	pKnSXK7THFRSpb14WVmn93fXoxqnjWS5h8fFmUdrTpqsdJwHH1CIlwsyZhk6e0RtzRfvVg+l4ei
	hn6Q=
X-Received: by 2002:ac8:59c3:0:b0:472:2122:5a37 with SMTP id d75a77b69052e-4a713bb9720mr29567891cf.4.1749674781646;
        Wed, 11 Jun 2025 13:46:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpE4l19NcotusXs/JGD/9lWjuCflw6wXer4thghs0100gWvTxtRJ8z3FjtMA0ym6aUubTWjw==
X-Received: by 2002:ac8:59c3:0:b0:472:2122:5a37 with SMTP id d75a77b69052e-4a713bb9720mr29567661cf.4.1749674781258;
        Wed, 11 Jun 2025 13:46:21 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6086b1e5694sm109164a12.50.2025.06.11.13.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 13:46:19 -0700 (PDT)
Message-ID: <4b3cd0a9-ef63-4adc-b2c2-52fde30fed83@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 22:46:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add missing OPP tables for Venus on qcom/arm64
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
 <aD1cUF56-IX_tSpp@linaro.org>
 <a47842eb-6d65-4928-8226-461ee36b480b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a47842eb-6d65-4928-8226-461ee36b480b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AaixH2XG c=1 sm=1 tr=0 ts=6849eb1e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=XJfM86Q9xTMduWHL3o8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CxDUsbjUtBWmtN4wGRCzj__iqDDv8Hl1
X-Proofpoint-GUID: CxDUsbjUtBWmtN4wGRCzj__iqDDv8Hl1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDE3NSBTYWx0ZWRfX7gOLHEviOJFN
 PBrYmSLe9U7UkGI28TZ2BYg852YN7c+AR0a3Z12c7ICy2dZLwZ9U5kdxioC1+TBRs2Sl/3YigTt
 grurrRAS0rsWeRBZ+88aBJTZp313Z3YB+A7TQ5WYrga00B2Bj2PGlznlLNaiRmCcQqILVm8nnfd
 kAyA4J23LG4uZSssH2CgnLHxmHhoEFT2HLDG/ofUlEkE96TpiUKom0kbocd2+s7Zn3gN2JUd+aM
 lNAdTokuT+Psf/DconAffxQAVdG7JAXlW2gjO8YY/hXQzCseW8CoWoJSp3ZWIchJ9KAayDHXzTw
 0CSMgtvCUQTfxyU//pb2gokXRJBJC0MejwUd9AC/nggZJU/uYiLvRKWwVIw4dkK9JnLYbVQsd76
 zbCPOrqGwSR5ldYOMLbAEbjcftPVWhyT84r1NTxNrUDrrY4/H6s9NQrhm+67l4cXV3cHar+/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_09,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 mlxlogscore=965 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110175

On 6/11/25 10:43 PM, Konrad Dybcio wrote:
> On 6/2/25 10:09 AM, Stephan Gerhold wrote:
>> On Sat, May 31, 2025 at 02:27:18PM +0200, Konrad Dybcio wrote:
>>> Sparked by <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
>>>
>>> No external dependencies
>>>
>>
>> Are you sure?
>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---
>>> Konrad Dybcio (5):
>>>       arm64: dts: qcom: msm8916: Add Venus OPP table
>>>       arm64: dts: qcom: msm8996: Add Venus OPP table
>>>       arm64: dts: qcom: msm8998: Add Venus OPP table
>>>       arm64: dts: qcom: sdm630: Add Venus OPP table
>>
>> None of these platforms has a power domain that supports performance
>> states specified in the venus node of the DT, and the venus GDSC does
>> not have any parent either. I think you will need to update the venus
>> bindings and add
>>
>> 	.opp_pmdomain = (const char *[]) { "cx" /*???*/ },
>>
>> for all these in the venus driver (plus backwards compat if not already
>> there). And then add that power domain additionally in the DT.
> 
> Making use of these tables would certainly be welcome.. This patchset
> was aimed at pushing them to fdt, so that we can debate dropping the
> hardcoded values in the driver in the future.

I don't think we can just plug them in to the driver right now, as
it would also happen to break backwards compat (since
devm_pm_domain_attach_list() seems to not be particularly happy about
missing resources) - though arguments can be made both ways: "it
could have never *really* worked" vs "don't poke at the old driver for
old hardware too much, as it's gonna break"

Konrad
