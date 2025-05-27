Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12C6269CF6
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345817; cv=none; b=uv8h7mFy94dfP1HkhamGC/bqH86Hl+4sQZDqYLuhN5M0VfUDIFVkuktxlndnXqJF5vMl7DJ//jAatMt5t4k1PnC0TcrIaJ1/45a+UBKTTemoslbNOgRUIJONUs3qeOle8tV3fXEomdxafFsVcjZT3XDiSClvjYYTtN4LfGqyUtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345817; c=relaxed/simple;
	bh=fvEjZ/8XvmiIw/x1T49zRGL66s1CZIgvsgbv4p02D5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K87NY8Dc7ppqHuiwexWDIBItf/w2i88xbZFB9SD/G+Yo1yS4HhAgCuG0wcg77efyvimRAKS9vFwKC5oJ1EdE++OILrPln6DBbySE/tGoG8pHCCZXQNId7NJsE+ERRLW+HZ+np7h+DQTam3vKptTfITPwFPWkW9dRUfT7dBdLGCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozuEJlbG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozuEJlbG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R4Jd4S012234
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLM+GWekrBtrawNMm2D4lJztX2o4sPffJMDli9j9kAM=; b=ozuEJlbG24ADssOl
	uWUZZ/KEib2FdpiwXYbHvI6ct2aj2WaVAfNQNrrcuB4F9JvzMbVuRCS+t7fCFJh2
	GZulqrY4WSSBlAnTpGT6aR2vBKuYcv2nR7StyUg7JZYfp3BFeLqzYo4MOECFuI2h
	LY9qEEm233lZYigL3v466Q+XhrM1eFCisGhBH+EjyGYduzBONiQj4BrxIIcMb6AI
	V5VNtQ5ra7K5bxylbN+xoORE/n6sm5VzCWl6NMXIL4wcP7RmBXzqfBJWp4Lbr96v
	PnjqiCQT0wdVod1YvDyjx+T4W9ErvpprGnAHV7rLi5qdQrFPuegfxgKfF3dFbr0U
	gvhgcw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w69193fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:36:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fab2c3c664so787176d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345813; x=1748950613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLM+GWekrBtrawNMm2D4lJztX2o4sPffJMDli9j9kAM=;
        b=TkX4J0gKO2HL/be2fI3yp1lA7VEFTHRigsSa3lO+iGZZjINfDQzOXQk5NlJtyuTr7N
         H4BtLHz1Mama5alKWrIit+zjlGiq7T9AxOnO0gw7NAqDdq5Mt345KYoeCTRv3WYS9fgv
         WYyCveNoGD7x2DqdzbkYtHirVTgSJC9ce2Q+gpAyGcNa6jUJIEhSKhN7iDefgrU+D1/+
         3o9H0S8h9fY7SIqmUbQVgaBb+wqFOQebCr7NL9IzEDw71nDX9gVViIZtPs2mRqW19tF2
         q45rWw/xzwNA79sjjl6+Yas0NqBM/CkCHCD5p1V0ImCk01LZ588gOTSyfNPOzmZVXmhL
         xE1A==
X-Forwarded-Encrypted: i=1; AJvYcCVZbtyZQ6zsr463HR6PZiDtdfkUyxDYYovO0jN8eypAKyu+xpn44ezrcOSo1JEuPI6r26etSmptFteL32U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/UtnbxEiKIu9Ogytj4b4tvhntTdlL4dVjAo4Za/tMcMs6WTSJ
	e6sP+AnyY9nG5AbNXM1TL80bSYZzGQmkueTnmZmttTZLK3qlT6/Ce4KoOqTzl7B3AyIQzouVF6K
	sPD/xMcQWNJYxc6mFphbWrI+hv0mBt7wKQOZQ52lR6eQeG4eYwqu2OZTC+df+21b2ZZ0=
X-Gm-Gg: ASbGncuN+qkiPbRAUe8JbmPSUdDEDsu1lq94ovfymy0ijq7F8DLjaXk0isKTpdqp4hI
	lopVdgi8QgxcMRK111XjZcDXwIHltOmDudlf9OY48D6asSXpJrcH5oPLQc0i4AqPPr0dKFUhomY
	pXxKzhKcUaxWxt7MFqR1V+ukr0FL3+eYRjLk8btnzyD66kAGIHohiBXS9jk/HGZnEgLrsPmTbjo
	jZ7AILBSauAkhwmwsYJPq+/GNE1pCTNyyVzojMrceZ4c0L4AAEfAwCnqaZ53GHubaqLYj3B4Wjw
	Y/oQ+GVyvfGP2Qp3p6ATqMKM1cU0Vr8RQCxSxXhCGUqQUtIH2kLNcDRLC8F48cmJww==
X-Received: by 2002:a05:6214:2586:b0:6f7:d0b9:793b with SMTP id 6a1803df08f44-6fa9d34ba15mr66049836d6.8.1748345813613;
        Tue, 27 May 2025 04:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwP18XRKy8jlsk+tWNpk1oV00GPmvN6UNYhfqRCLVDbAvK7pSH3h1WanmxrHiy5RUbYnfabQ==
X-Received: by 2002:a05:6214:2586:b0:6f7:d0b9:793b with SMTP id 6a1803df08f44-6fa9d34ba15mr66049676d6.8.1748345813242;
        Tue, 27 May 2025 04:36:53 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d439655sm1854813666b.92.2025.05.27.04.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:36:52 -0700 (PDT)
Message-ID: <e7ee4653-194c-417a-9eda-2666e9f5244d@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:36:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: sram: qcom,imem: Allow
 modem-tables
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Alex Elder <elder@riscstar.com>
References: <20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com>
 <20250527-topic-ipa_imem-v2-1-6d1aad91b841@oss.qualcomm.com>
 <97724a4d-fad5-4e98-b415-985e5f19f911@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <97724a4d-fad5-4e98-b415-985e5f19f911@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=6835a3d6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8
 a=zoJKnCTf_W_lU4eZxPEA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: xYlPH0pMKGwJ0-FnzoW_EJbc3A1HvfAZ
X-Proofpoint-ORIG-GUID: xYlPH0pMKGwJ0-FnzoW_EJbc3A1HvfAZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5NCBTYWx0ZWRfX4VphTV2mdHS4
 /I2F2IQGV4AWm4SHZMiRLhNGs4dy0B3AvV7RRHe2na2tlGFgFSxb+ueaVGyEmK6yeVoTYjFP6hC
 e2SUuPkd8ccmwWg9l1ZptczLFRngHAy1dQP0mQtyBmoAv82jvGNYoBPVO6BTMxNyfaweewNsgKz
 s/80XwQnv1F3elkHhldnL9Q+U7dsMXZiIR1RPV2La3e+oaKR0NQDLH1pGOEHG5k8+D1Kwox21y9
 iHGNui5FRMXPxfvri3NU2trpKPIuFzgEG/F6Rbppc8OlZCUKppzdd5njAFKaASXVnuVvJZ3Mys5
 ICur3HGuaG3SxJG+xyGaJtO2h/vpU23xkwHr4e9N21nxHGjYik4dwbZbSg7YorPfG7iO1M7Psr+
 +uj8UnBS+mhPlZ8WrEF/YYrCnsDtbwYp4628NgRLAGREB9B448UZzketTL+mAg9JSV0o/lTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270094

On 5/27/25 1:35 PM, Krzysztof Kozlowski wrote:
> On 27/05/2025 13:26, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The IP Accelerator hardware/firmware owns a sizeable region within the
>> IMEM, ominously named 'modem-tables', presumably having to do with some
>> internal IPA-modem specifics.
>>
>> It's not actually accessed by the OS, although we have to IOMMU-map it
>> with the IPA device, so that presumably the firmware can act upon it.
>>
>> Allow it as a subnode of IMEM.
>>
>> Reviewed-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> index 2711f90d9664b70fcd1e2f7e2dfd3386ed5c1952..7c882819222dc04190db357ac6f9a3a35137cc9e 100644
>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> @@ -51,6 +51,9 @@ properties:
>>      $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
>>  
>>  patternProperties:
>> +  "^modem-tables@[0-9a-f]+$":
>> +    description: Region reserved for the IP Accelerator
> 
> Missing additionalProperties: false, which would point you that this is
> incomplete (or useless because empty).

How do I describe a 'stupid' node that is just a reg?

Konrad
