Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199E32BF3E4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750158429; cv=none; b=tNFzffeZBS3sKoQNg71pMEv9rJX/eyBb+DQ6AhlFeIyUaQCF6jLDdxDAm2XIqwv6vZL3JBOuwaF2Tj7taYoQIwiq1pvx2mLYYiiU6XWCnxTWGnhPn6Da79Q6H4Gk7wfnSSTaHRz7M3hDa+31CECMEPOjsVeZn8LAAP9yngIrGNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750158429; c=relaxed/simple;
	bh=ocgJRSJa6BE3JFmsVpvS45RVD35leZze8Krtljlq6B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMlUZPyYnrM7MsTlIpz4tsdnTGXpIFNbAc5LyflkvtM2oDRcqNtOm2tuYl99Pd5Ti4aLersa7yIbSW1MyP2iVxY6QWezJBJ1ZRMqPxzQ0Ubj/TlYU/poDVKwUgcscOGpRvFcZRjCm4xaHnH4bUDhCrqNNeUMu5CuCgP2rojIOSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wpq2gupq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wpq2gupq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H6W5PL020136
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QQBuEvx5JTVQWB/H58QAUF5UuJhkg/HVPeKkcx6NHyM=; b=Wpq2gupqxyqZHJsi
	qic+LGF6gO6KlvVYYPy703qlvF7aiP27T40vWYZygr6r/J4e29wLhJECCN6Hnik3
	MU+GRNFZUHjYszkcK0Z0yP5uFBV/s+komAImVBtpOm/rthVinQH4rGPWWcUX2eTI
	JcstzbsrQ8MZubwZ5cjqI98GVe1oFWdLmnGyfx18N21Zdic1PLjfMQO1sC2ijqXc
	fJCDupEleZNpN4teFha8EKq2hy5YxqyouoQ7plF4H8fonAmLEsbH9HCPbDNB5kyN
	DBGZ5KYciWb4RVb8zM3rXHk1x55N5ZrLPiK7yQut9qxIAPGkzUggwgS1SLxLRNRC
	Cup1VA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5pn74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:07:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2c3e576201so5186196a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750158425; x=1750763225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQBuEvx5JTVQWB/H58QAUF5UuJhkg/HVPeKkcx6NHyM=;
        b=Kt0AMd+Gpg5YTEzsDueuPIJ8GUX1asX8esHLViF56LECHovvXUVDZmcyJUP6yr+NqV
         B3VJ3T65ZWSlu27dvSQJVu5iVWlQkldPIzA41pqBCYrfU4SLnEWU5g2BA3ra/i6MVbY2
         PkCh4TiS+OtnhRaTPkJWekCNjFBOfUBOTUXlmF0BOXsbQ4lwoPsXakuKD7FuqzSt8/fr
         wa227LzllD0HVU0X0T532MOsycNi6OmeiwAvyFEQVs3eOiE2wbX8kRcCQ3/5X0CYw1wW
         quax2vM144tilewhQL7M0IFoDw85nQU2qXRqz7OGFN1x2CUa6/8NB6OU8O/fKjB/zB5+
         FKgA==
X-Forwarded-Encrypted: i=1; AJvYcCVvkSJpVGvxkFa1CjzLDhROax226UIbCqpzKAfFU3KkDNhKpuYb55mar/8hhg15BuM8huuOc3LszA3tdrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDYTyWdSqdYikYbNWCma8Woiq/tlIhZfl8X23tSSKRmYPHD9ho
	fR2Wu/Vc2psZFP/ydyQMjsm31Tw6xJrMhfstrrUjgY7thFWYRhtelQuXNMVR0umkNvT6fYHMvVv
	L8GVcPLq5O340kByEiPnZbgW/B31TXAMqI4ovSzFP5lr7fQER3xoCaH78V6JiM/iBWrY=
X-Gm-Gg: ASbGncvTckWeY3tUmcZYtqi0r5e9gQPPho0KqfATX28w7RLB+f9ZjiPxR6n74ruafPk
	+cu5g57BDYwMBAM3gIwNK4csC+ncoqbpdnbIi8xBSIR+UP0U7z/S1lBFD/+k1MPklh7rZvc5xny
	Vy31BzKtLraamTWWss2Aos5AaL5lMWJ87epelRIaiWHPf+2dX3JLm3Q7RjfKmBfkIdO0xqRkWBS
	Jm/rWa3y6aEF4ogUTxrm/R2mt8DZNMrlryNdsAAIxlBSiPN+2m46hHQu5qUIM4IQzdxzto0PP6r
	8zkcy0SxRo6ULp+HjY9EjVCPin18ZLWq25OVqbGnyeRMUbGMW0kHbcS1y5s=
X-Received: by 2002:a17:902:d552:b0:235:f091:11e5 with SMTP id d9443c01a7336-2366ae01073mr195545505ad.10.1750158425352;
        Tue, 17 Jun 2025 04:07:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMk/25sYGw7/noMCtsDarXs981kExTrASeeTn/1Izn7gqk+MKOiCOPdIyos0682zfgI0LP7Q==
X-Received: by 2002:a17:902:d552:b0:235:f091:11e5 with SMTP id d9443c01a7336-2366ae01073mr195545055ad.10.1750158424942;
        Tue, 17 Jun 2025 04:07:04 -0700 (PDT)
Received: from [10.218.15.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d98sm77290745ad.151.2025.06.17.04.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 04:07:04 -0700 (PDT)
Message-ID: <11827cf0-8985-43e7-8c05-3c554bf1fdbf@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 16:36:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] interconnect: qcom: Add EPSS L3 support on QCS8300
 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mike Tiption <mdtipton@quicinc.com>, Sibi Sankar
 <quic_sibis@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250617090651.55-1-raviteja.laggyshetty@oss.qualcomm.com>
 <20250617090651.55-3-raviteja.laggyshetty@oss.qualcomm.com>
 <43ebe623-8822-4437-92cc-9d24e97295d7@kernel.org>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <43ebe623-8822-4437-92cc-9d24e97295d7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MDjYWHR4tqWO3WWZa3Q5hALNOIWJM-Kf
X-Proofpoint-ORIG-GUID: MDjYWHR4tqWO3WWZa3Q5hALNOIWJM-Kf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4OSBTYWx0ZWRfX9+tOL8QR9GzE
 ARAELXZBmDaYIBdgHK0nBGFA76f1UE9ejc8ulbRZBs1pRGR5PecXUKfBh1QVIIlew01N9MwYb/r
 vi3DAj7OirLOcSGlfl+XyF6T2J7SBmfEBgttk4RKAwPp1+vIm0E39wTURNT+SXYM8+4AwWHtqJ5
 T3EX2xW8MbCEbbJmdZ2tjp5tV90pHciVeWIFDIfCQO0p/FdSWkXKvUZ8GtpOh+n6cyMD99RFJUt
 iT1yFs2YD+JhuDi5nCCu3LM79bjYl4aA7JPkx2AoScdPaLprjxX241f0QNEs6TnVsQKYyfFq/k1
 y/pBc8kBGz+T5cUPjxtdCuRkhLuO/fEgGPEA0/xpA7QIt7n+MHIiR36oJriTYWdmLVdT8z9OSC9
 /co8wjiY1rOlpJTskQmF266dqIHkVmle8zK4k64UQcKZlyN0F83CQnfDayPEV1bxns7gSsyp
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=68514c5a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5YNjd6bEO5n3GnEyyeIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170089


On 6/17/2025 2:56 PM, Krzysztof Kozlowski wrote:
> On 17/06/2025 11:06, Raviteja Laggyshetty wrote:
>> Add Epoch Subsystem (EPSS) L3 interconnect provider support on
>> QCS8300 SoC.
>>
>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> ---
>>  drivers/interconnect/qcom/osm-l3.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
>> index baecbf2533f7..d8f1e0a4617b 100644
>> --- a/drivers/interconnect/qcom/osm-l3.c
>> +++ b/drivers/interconnect/qcom/osm-l3.c
>> @@ -270,6 +270,7 @@ static const struct of_device_id osm_l3_of_match[] = {
>>  	{ .compatible = "qcom,sm8150-osm-l3", .data = &osm_l3 },
>>  	{ .compatible = "qcom,sc8180x-osm-l3", .data = &osm_l3 },
>>  	{ .compatible = "qcom,sm8250-epss-l3", .data = &epss_l3_perf_state },
>> +	{ .compatible = "qcom,qcs8300-epss-l3", .data = &epss_l3_perf_state },
> Heh, the same as some time ago. We discussed this.
>
> No, stop adding more redundant entries. For explanation look at previous
> discussions.

Will remove the compatible "qcom,qcs8300-epss-l3" from driver and retain
it in bindings and devicetree. 

This will allow the driver to probe using generic compatible, without
the need of additional target specific compatible.

>
> Best regards,
> Krzysztof
