Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1126297B68
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024192; cv=none; b=p4qXe+NdUVLap7yVvNKa9JN90vQ7S+hqRV8Mg7EghqUKpD6A1yji+2HJB9RY4JqSDS4Cl0qGycHYQH6qsmzrXAsIojSaS0O7v2atBXDRA/hI+Pq8VZupCL+wqebVhfnZUlqrLJTpsVRCIk0X5Z5pJ1QesJPNCa3atR8DFEG0QA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024192; c=relaxed/simple;
	bh=AoLJkqZsq5uG5046rJ0/zN4bd7EWkUTOqm2DlhMuH94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIJcrLYBprFEEgtqxaV1WeVyIRa8IsAFm4NMHvBR0OB7BfzLqe68YzvwQXomw39S44M/XqzsRHwxucdghllJPhdLojJNSlNuTaBce7yT6C9bpLwP/u4VTnKv6HaIYaPuyrsa6wsqVA6/ss+7zCjurQ2pTfHIo5B2uD6mDgm3Wc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/pjEece; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/pjEece"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NE2QNa002269
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ywgBAXOkOYbHHKdEyT+EsdQ0pIR0wBE1gOJ71wdz5Y=; b=T/pjEecePLaEpPhp
	KZb2TDjsBd9cD+AwOu7Y7XQfZkyER0KHL2p2xT1ZngK5dfA7P5WNWe2YnM1DMJPB
	AsDH7rQWhcIOO0fGPL10BO1X02x1z+AeW8mOqPEe0mM0fa7MV+7CPGRSP3TZ20b1
	DtPtduEcyyPJRO/bUZCeb76yII/gSB2S4z7+haGXmm3srbP9irifBtHMe9R45DYy
	aNjyAboRJ3rSBR3+CtSoDbwwm8EnBsvOY6J5cDEveleWw4wBZi3t8+nkEuw7OqQV
	FeRBcCmEe+d2UzHVXUux0JgMamnZqPFjLUqZ2ZnSrvThI34/FLU1VYIJzKQNcEjI
	NumUOg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf72ptv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:16:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8bf12828eso227566d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748024188; x=1748628988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ywgBAXOkOYbHHKdEyT+EsdQ0pIR0wBE1gOJ71wdz5Y=;
        b=KI4Kp+ME+Yx6BSPHFuujhbguLsn+cm/LWZ0xP+GTNUIdsG3/1uOPf2y3RJ5VvVqgo0
         WMgZAsdJVYcDmoKlI0gUAVE3H+7/2izZ6wLJ00PHxTF8ZhA45iDD9zSvI1gAKXwd1oCI
         j8N8EObdBrfuhinlW3c1ji3zA2lp2dR0/033iZ2a9BQU+swm3CQjwpO0+kBdpu45PM75
         8tje8V6aGCbpMq++1+ICBgph16UDWVaynzmuZIRI0T8vkJ+lnqko7cI1IXSVQ8TNqXEu
         gTseQs44EWlTlaEwxeSwx4d5qEYiFEDSKLaadCABOWdoUKj7BP+Ud9BN9K+2x4fCbdFw
         3PUg==
X-Forwarded-Encrypted: i=1; AJvYcCUJKuakGb0ZBi/kpfVPcMQBm71Fniv4zyTuC+bFeJfXRsM8CDBxFpBmtVFww+igAhwXERuqZeFW5uHNDwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtFQWG4nXsI9CRuGAlIFJ0f5nqaY3A9+j0T21+Zxgs36tg2vRZ
	xxIxT4B881spDJaVHzZHV9uteU8cA9Cg1mOoK0a4jjFaslBXIpXzGvfGuuRoIGrjEPjIqqjG5HJ
	8xdjrv8l9+lmCDJaHWsu0FBTpQOsI5LvRTjhfoVqddt49+Wg5i9T6fiOKOTsZfhmlbII=
X-Gm-Gg: ASbGncsOgZ6R57MOu9sHppboPKrHzNw+laT5Fr2253avhURRyAnk17tUDr+BIDGBEx9
	HvNEUn/mgOcW8ueIX+J7+SNsmbnSfHkUgySNC/eeHzKaC6cuoeFz9Kn7dX6tK8aGwQvSq3WDO9Z
	d4kHxW1PpJOexWCIo6OJ5ouAgasIb5JCnrGcHEo/y7GhVA/51bN2gIZzfbLauxxD51Dxwe8ZCai
	30tZzwJkaNjXqJwXJ9hMBvPl2QbIUZCXVeCzyqOi/ONoz+LTVzr5x5XUKxxGk2d4W77MtrhcaZs
	3lJzpftk/VouY2fLk0BbFA6pcFIODI6d2RO7lKxL4393iMeSfl7zF1f7xd1pcYk02g==
X-Received: by 2002:a05:6214:20c1:b0:6f8:c23c:526b with SMTP id 6a1803df08f44-6fa9ce42c34mr3062816d6.0.1748024188633;
        Fri, 23 May 2025 11:16:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsNA2DnPdEjRLVO+yqAXpSZSax7H9Q3S9aSImMU03Zgx6k5+e97rYhPOTC4edA5uBZBYNrAA==
X-Received: by 2002:a05:6214:20c1:b0:6f8:c23c:526b with SMTP id 6a1803df08f44-6fa9ce42c34mr3062636d6.0.1748024188206;
        Fri, 23 May 2025 11:16:28 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4381d5sm1290113766b.99.2025.05.23.11.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 11:16:27 -0700 (PDT)
Message-ID: <d0b2f237-b4a6-4ce0-95ea-4bf5f3be10e0@oss.qualcomm.com>
Date: Fri, 23 May 2025 20:16:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] net: ipa: Grab IMEM slice base/size from DTS
To: Simon Horman <horms@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
        Marijn Suijten
 <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
 <20250523-topic-ipa_imem-v1-3-b5d536291c7f@oss.qualcomm.com>
 <20250523131744.GU365796@horms.kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250523131744.GU365796@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0lte8MccErsO5YWSP9L2X9AQ7hiX6YsE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NiBTYWx0ZWRfX5gT+9HRDVerf
 kZggLSf0nWIcic2CNNj+dGTGIkdd4lz4olLKB7pZG3emdARwjRzbvWM5DZ6y5IM2oh4PSTMptDC
 JG3XGdcb/iD/MiVS21ED2p9PQwwSOzbxFXLaW6ZaECVtjWN5choG2soCQZTiUEh8Uytcs7zPprm
 odG493BHVO1ZwuTFLyhIGE/6GNidyTe0m2XqmWuI5Lq0OMlHyqXwocjl8GoSyLaxxaOr40ayiB+
 /GLHcC3dAMCwG6zXDi0B7VHIUseIhnZndxYTEvd9KH2WWnVCSe6Lt/BMTnuBQgViprKuxkUU2Pj
 KyqkaXK79roHIkG6nIHNtmglYvCwWw22vJ1qTyt2DjcbVhcrHnpz6jKOZy5BCpz6XwBwAX5VyKF
 YAqBJCFdw6k360MOGKi2rPGA862+BuWRqdakM59XYl9MDyP2dW63p3+gFgZ8xFQaCOYrhbc/
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=6830bb7d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=SHaX676KDxSdYVKYG_wA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 0lte8MccErsO5YWSP9L2X9AQ7hiX6YsE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230166

On 5/23/25 3:17 PM, Simon Horman wrote:
> On Fri, May 23, 2025 at 01:08:34AM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> This is a detail that differ per chip, and not per IPA version (and
>> there are cases of the same IPA versions being implemented across very
>> very very different SoCs).
>>
>> This region isn't actually used by the driver, but we most definitely
>> want to iommu-map it, so that IPA can poke at the data within.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It looks like these patches are for net-next. For future reference,
> it's best to note that in the subject.
> 
>   Subject: [PATCH net-next 3/3 v2] ...
> 
>> ---

ah, the networking guys and their customs ;)

[...]

>>  	ret = ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size);
> 
> I think you also need to update this line to use the local
> variables imem_addr and imem_size.

I paid great attention to validate that the data I got was good and printed
the value inside the first if branch.. but failed to change it here. Thanks
for catching it!

Konrad
