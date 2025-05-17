Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA6E20C005
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 16:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747501171; cv=none; b=bdoR6TrFx8F65e7o5Jj1dvMGc9HwXFlmdGCwWBNA1TRRh2ueQsEIgiXEUP9O9yv8X5FscM2e4+AfUDh4dUKYoQZwVS2g5R+hfzG5qri8craAnSOZReDrNUb7kn7uaiwhuDB8gVv0SJ98OVVpU0TIvsqOMSgTALTGETD1trL6bJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747501171; c=relaxed/simple;
	bh=Y+98pIFoWWHfZVf0d45cDKgsJGJTFlxxmrg3hMKxyZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OK5Tv/z7KIN31tRx8I8ZcAeE26aKUbATU9/NMVailuigPQI/v5eqcB+eXb8x/iJnEwho/Qpv4evKbUvxn2x+zaTmUzqFdLLNuEVKL97UgLC4iDdFA6j1YdnkBrQiNW0JtZOHeCWnbGpcUX6HAKVlrmBCI9LliYppfmMNHYHf9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lfJR1aAV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lfJR1aAV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HCGCif015101
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 16:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VduflDMyjCo/QhGhOWqCOg92D4iNKsmXtMKiBxwuk+4=; b=lfJR1aAV1p1ip7Cb
	3TV0zaa2OkhlifkTqk1SlY1KOpl9KwREiBO88OfXhy/cmjdabuEzbV1+BDcVGK0e
	VrlRdE//2rnj2G9f917h5EKGNJ4jhNHNqXhDV1vbRDnweeCLHXEueCxzi9OIzZbb
	x4QLPVbY+JAasWAbfydKetxNzHdjZGGuroEnDj8aZ6kRIn9bWjD/B6w9OxD7tN2i
	JTJ8sd7J6jUKPJYLmekIPemQy8WkKNJBfzmb9ayHIhMOqw8p+fZnV50tM9iSP7cr
	lW99ED/1odFosIx9KJDfA7qgg/XpTKNW3e/S8r/8bqIbKTeEUXPLCQN63IECA1+B
	JilCIg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pk7g0uhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 16:59:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f0c76e490cso8335326d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 09:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747501162; x=1748105962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VduflDMyjCo/QhGhOWqCOg92D4iNKsmXtMKiBxwuk+4=;
        b=gbaH5OGDGOE5vLKZGJOks1GHWJur5BxLFfnamYkrhcWb+IL9h44knl7Lop+4eugV4c
         XLGMq2gcQJy2n2yoMZ8+UldA+nS2HARIKn42q9NkFXxEEsA+aW5PrCCFnD5qu6MYq9R9
         KLwSCSebviEehsQJ42QgLQ3GUcQBYOFEVLZVGumC26sy54RqnWzb9bSZKPJly07kDBjB
         pmfHbKiGL4JUCqGYP9hFYLhRlKD6TYbYZyIrmfAZsKikV+dNqGXqIPIB4awYkaobYXm4
         BoTgRJ4a1SLgtrNqcFK+OPlKlkvdBDgZhBJNcP9Q0G/E2LiqSuw16Jo1JcPb+jlzOwYq
         sTBA==
X-Forwarded-Encrypted: i=1; AJvYcCW0lmGy2hi5saE9JffuCylAQGIIedBTiz7Guh6c7bQ4o2lkcLEKNWIuSvhQST+vQPp2wH9/AkB8wI/gd7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwthMjgufYJViEQTfOWfcvNamuHtyC98NGvKutyMOwJfE2TntHw
	Lflcr4lD7KqynMDU+xmIsoHis4+tWYiA6BClcxhEjMlbriVSV8hqi7rG8cCu5+CsxqffPA1kMcR
	GDfgl6U6OCF/58KQvSHC6SDlzNIVH5la6n/jXbOdxp7z0bsZmlkLBmW2tRg4FeEczp1c=
X-Gm-Gg: ASbGncuPvzwb+UZPFcXVhX9mWBIf0hXrxcXf01WPjrs+lApUUCTVBJLLx18xRf/RG/C
	pmvZq0mdOIPjNgx5H4GLDhxqq9nYAypGQEzk2UuwaDXlp58tHXi54NRKZrAhK+RV6hkHUjbtucs
	shpZDzO8LUqeThVmsf8lr1AYMreP42LepeZCutH8bMpFmbzWnFGGnhNr8/fLQNKiMvdY2a+/jvI
	j10BvTK03046rX7nUQvWBPnmconNGVjyRdnQ4AVAgcMY2de1VV20/e1Ey65HOaY1zHM8oakFiN8
	TWDwSDz6U82vaizbCjjXOKKJH5GX9QcN80jypUTG2Xn2WXPtPQdrcksaLKaAyGsD+Q==
X-Received: by 2002:ac8:5359:0:b0:494:b641:486d with SMTP id d75a77b69052e-494b6414bc9mr24099701cf.12.1747501161654;
        Sat, 17 May 2025 09:59:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcjyJ4llDUii39E2slq+4BGvQ/rSC1M/Cdxte2Ejxnl9qc2kSJxoEbQNaWLKhx22SyiFqVfg==
X-Received: by 2002:ac8:5359:0:b0:494:b641:486d with SMTP id d75a77b69052e-494b6414bc9mr24099611cf.12.1747501161253;
        Sat, 17 May 2025 09:59:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm321997666b.69.2025.05.17.09.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 09:59:20 -0700 (PDT)
Message-ID: <73a689a1-e8a3-4417-b0e6-374ec9b091d5@oss.qualcomm.com>
Date: Sat, 17 May 2025 18:59:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
 <20250516-add_qcs615_remoteproc_support-v3-5-ad12ceeafdd0@quicinc.com>
 <thtk5vv2hpbnoapmt6j7nlgrcyedjzjbi3ntlyb3ll7atks46n@bp4isaoert67>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <thtk5vv2hpbnoapmt6j7nlgrcyedjzjbi3ntlyb3ll7atks46n@bp4isaoert67>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A2ctXJ9loR6JVdmSnyCS2Fh2ARlLu7P8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDE2NyBTYWx0ZWRfX15vWG7AnyjQG
 FrdFjMkcFuCxbAz8zuJr+sJ6aOAEwl0d+DCgRAsO3EhnqAzEY4uYBMdYN6ghS+ZDKMT5Sj3ibpb
 hrU9djgwztai1XVrGJSYgEztaIzFz6Ah/8AkZezWrMDSBJ9sGTU4rMSqNwrrLTC6spr/CwJwzCM
 29LxtgzIJIuMiRYuzAi5hy1LqivBPzn7bscIoy0+GDa/B9uSOKKw0M3GD21osis8Q1amWV415A2
 vlbYbXgGgFp4slrUMHCgswFGqfGF8WxMryp497D5DuKdRRAnow2xTIHDVwZxfWsKBG0cteW4bPD
 WlDJwH3lh01QyzUVNgIbLMKM9rRYBdZHnEYY9Zq4Ng3RiP3cWZy+jMxZBRedasrJztB6TZ811D8
 0ZLXUjVXulpaG3Bj0sf8y7+Bef3guElzDvMMucGB5WJ3kLAXw5d9AMZlfkQ3HfzIqqWOSGrP
X-Authority-Analysis: v=2.4 cv=CKkqXQrD c=1 sm=1 tr=0 ts=6828c06b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=ikgdCv_TlNYNit3QsnwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: A2ctXJ9loR6JVdmSnyCS2Fh2ARlLu7P8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_08,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=753 suspectscore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170167

On 5/17/25 12:11 AM, Dmitry Baryshkov wrote:
> On Fri, May 16, 2025 at 11:27:06AM +0800, Lijuan Gao wrote:
>> Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
>> remoteproc functionality.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 86 insertions(+)
> 
> Is the MPSS not present on the QCS615? It was a part of the SM6150
> design.

Hmm.. good point..

It's surely not there on QC*S*

it is there on SM6150 though, quite obviously

downstream ref:

https://github.com/ianmacd/gts6lwifi/blob/master/arch/arm64/boot/dts/qcom/sm6150.dtsi

Konrad
