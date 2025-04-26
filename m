Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C304E18FDD2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 09:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745661262; cv=none; b=PXN5ZWYIcj2rP/3JriFVgX6TnylpaYFLP3+xmx7IhMVBYa67EkzwQ7B4qoB4PH8ORqAbxQsWZMqZ+ukeb5wo5rJDmdlfdga3U/Fm6XGtW5Gb7ilOXOfz4icRXVS0515+WLUVIg7kPgUleoRCykeFmad8JbEwhBicKjIqa4TpX24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745661262; c=relaxed/simple;
	bh=E5IobAi/dA7bePCWkMdHzHuLjZ8cTyeul54B2zGVTwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IxoGNfwogfYnxmAT7p72+mW3nlhqbhHVFNMSL7bNU3dkoVnzDmpCyrFn3Dtr43DeHNwSESyR5T5itfL4vAVYakK59dMixjUzZs0sj7Shd/lnS03nunS+O9rdiQuRnvprEExVU3nqIXA659fUFkSw+ORUFJq1LUDmkPu9Y8suoBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqJ1iq1W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqJ1iq1W"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q0h6A5023621
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 09:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KTVIpIKJMgx7PL6j/16nNJybn4tGFA1d8wmMtkAAWGA=; b=XqJ1iq1WKxa+Yht5
	IwibmeM9cQ90mvdWksMdv6QKoE679f9w65ahFHJiNdrHJH1TpeVyg2Kl2hKmd6f4
	i5RDdkoueXCLulfY9pQnmIGt/0jzKsB5i9DK20jCu6v+GTk4iJ3lJuViFEuuxSNh
	IeD/bNQxSP8du4Yn5Ld05EOjqoLPQaD/W6Vnch2q/Qe8ZW2oHMNX6MUI9Em2Ik8a
	5WiS5Ik8AERwcgfw7c4A4ncPRBqqbzXjHwqvRTxcG5+/eawraU5VxzOTpW352f6v
	/LgDWYW1Gq+H6+i26b3lfQSXqFqWUVNpEWq08+0A3lpgj1CQXdxcHdYkoMK7xMv7
	pfQ0eQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6j91s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 09:54:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476a4a83106so3225681cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745661257; x=1746266057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTVIpIKJMgx7PL6j/16nNJybn4tGFA1d8wmMtkAAWGA=;
        b=VQEWD96EYVTLP7bK814VyHwq7bffPW93XO4gvnXnOJ+Z24PFkNfqgKmdh/DcNJvBC4
         DtjUakWaRJ8WIrWtrebuz1IkDzaeGQ/9r67jOBIEwd6ME4QxeYbZcMVmlpGIzRmGlYjh
         2wPu0SUZ1QLAvlTdKd3h0v9b3lukRGQ7uBJ86dDKj/QzimHiXK+FJnFOk4Nhgy2pz9tC
         gvu+gHBKuHX0iyYrZ/8xSVmSQ0iD7ei+SAtUo/uXn8tThbzEfzwOknJKtIHpuh+SWXIS
         IJgoxO0jI5BYPPnq4scgXKlwPRwtEe3h+3PBmIAWyh/8zfHkQqrU18OOXGkGGs60xaHD
         EPLg==
X-Forwarded-Encrypted: i=1; AJvYcCVI3j2DmdNSQ/YE6H0fUc2apwjUMlL7LXNUNrmQo54TkufL/Rh+XnH0ptLHSaDycOP9hq5BhVt3CxQszLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6cv3vG/848u2G9DrOwJ1pZivEui7a/N4rfz9aMqLFKULerVsJ
	Mh10uB5W9Aubm2Q3vcmL1GUkbIN3W7UG5pbYZLiH1YuI3xMKYZKszw7C7U4ItqDNQfzeaMtcENP
	thmtaR0IKbUfIHtU/Y66IQojIEl3QxzWfHqnM2H+VeFJwUC/mrwGGSt0e517fQsc=
X-Gm-Gg: ASbGncuOVwXfv/CegLppTIRXiWfX8ZvHB5wSRyjzB4tlsFYL/92DNzejjMlhKF1IWsb
	DZjBDBlzNdCE9OJOYErkVkQ5y1dIQ+NTSz8RWx3cWnhaS/IcnkTMw/Ro9F827C7CYTeZsxrtfWT
	Sn+uwmiTUMOAen0UKz8EBu/f2iv0EbWvp/YCCcP95XgR2mE6sZRs166Oxd5RvZwS/BzGku1h4Wt
	CXRylLHXrc7XmwzmbdsTH+vVVd87uO62XtrmmNKTh8wVVrBATOpfdGzZjk6QZSV9HiR5iTPn0Ot
	gkya6bGxHgIL23o82hddpDaEGk6z/UMBH4M16i34wXsF9YD0OOrJ5wunJyWf/fxjMOo=
X-Received: by 2002:ac8:5f12:0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4801cf53297mr34927001cf.7.1745661257706;
        Sat, 26 Apr 2025 02:54:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZNvX/ilxEAdVDSLaCIbroQr1WR3nh5RCJRq54/cavOxBSuNVxeIwqJJRqmEBtDmqNHuf1Hg==
X-Received: by 2002:ac8:5f12:0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4801cf53297mr34926821cf.7.1745661257308;
        Sat, 26 Apr 2025 02:54:17 -0700 (PDT)
Received: from [192.168.65.154] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e595abfsm264941066b.86.2025.04.26.02.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 02:54:16 -0700 (PDT)
Message-ID: <3510a805-66db-4796-8deb-e798a6d0ce37@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 11:54:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-5-a94fe8799f14@quicinc.com>
 <654e4b69-dac2-4e05-bbe7-61a3396da52d@oss.qualcomm.com>
 <774c2476-937b-4d3a-b0dc-d66f12d9f60e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <774c2476-937b-4d3a-b0dc-d66f12d9f60e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA2NSBTYWx0ZWRfX1L2IJjM1orcb caGl9q+SCUk3YimHBTDl6qRZDu3dwTmT9oMx9ieXU7I68w8LfPEnDizs92lLdfDSyFREqkEenFd 0UqZd0C8bmJl4zlKVmlWZ2OPPbvvN2267Ce/BqnHtayjggb6SU2CUbhPmdLrFpzDy9urBFGv2Nq
 f6iroZpCHnDfY3O/Tf+Ncm9sG2hJL/Bair7YjdRk3kG/k/KHSpvwoRbjs46ZjJ05OA3atacsAL+ y6O3eXXmQzpmwLO9l0kuZtCArGYd/PWO+pYb5vDVJ1j8BZEmHe7iC6pzXp5e8jMs6HqvDCt0132 mFJgEEGQoo12VxKiS8tlysoGTavGf5VXBWDPAlzOaiha4uz+eSnapKM+CfGAzSoo/NaJEqs3+Eb
 Lj7e884HzoN9giUaBaXPzFhqjBRcp7M9+kHdsLk7vXsYB869fgEb5xTHoEm1/pfoRNKOU8Av
X-Proofpoint-GUID: VjtjPanxyYntM31dsUafuKF3FhzXLxWA
X-Proofpoint-ORIG-GUID: VjtjPanxyYntM31dsUafuKF3FhzXLxWA
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=680cad4a cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=YhQMvyRDPdZ9LwTnx6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=733 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260065

On 4/24/25 9:56 AM, Lijuan Gao wrote:
> 
> 
> 在 4/23/2025 5:34 PM, Konrad Dybcio 写道:
>> On 4/23/25 11:17 AM, Lijuan Gao wrote:
>>> Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
>>> remoteproc functionality.
>>>
>>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>>> ---

[...]

>>> +        remoteproc_adsp: remoteproc-adsp@62400000 {
>>> +            compatible = "qcom,qcs615-adsp-pas", "qcom,sm8150-adsp-pas";
>>> +            reg = <0x0 0x62400000 0x0 0x100>;
>>
>> The size is 0x100000 (1 MiB)
> 
> Sorry, my mistake. I checked the latest datasheet, and the size should be 0x4040. I will update the register size for both ADSP and CDSP

Yes you're right

Konrad
