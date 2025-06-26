Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268E62676CD
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927087; cv=none; b=mOYDJGaHrimfxfcAgHg43AOKiQXLyyzBxhwu6gUeDEipehA0VrMK89CG/POeOZQlW6ig05OogX8Yg3sD5CTzPXfNQVQqW4x5NsREYxy4H/ca2WWVGvJDaUJ96lfkjORqzclXZFwpnlmreTBD/7vVduhqAT7WPMFe/wHPgWtIvxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927087; c=relaxed/simple;
	bh=jx/K8tygJjGoas2i+iwGNVNUm3+ZqzRYN3QILlGvNsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0jL0maeLDTHMFFiPSNKrk8K6bDLI5W9ZxHVQClpDyRLCY0lZdCif8EHJt5Z3k6KJ+g+6xqvIvUOJkOSSgc9E4hKl5LpY9UR+APG7NzSNjlz+2s/HFA2sL8mUU4Dd21fkhnfBJGH+tcsix9QT52vdMVweaC9SG9+AXIPe7Lloak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+jVVRcz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+jVVRcz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0DtIU029528
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DN2gLQs/N6h7C/Maw6kExG3LolsSEMumqxKA8yzbDWk=; b=G+jVVRczn7E5t1VS
	BvsKRC8qcTsKEUeaXW0U0e/0JvKx3jEtD8QdM/lT1mgS5sKanN1sFYO/B8xAP+L/
	6zg5gmuwqNWubZ9MTy/Vh4GXo0hO/pZ4KpQL4/cYZ3FrTFTWp6IBSPw9yWoK7Omj
	Voqq71EXzalVwtTxQQDeTN2YJ+XKqizHO2xO2I3tvwUrHRK8vRtz9Cvq1Su2Hq8r
	UPd7ZeuOeUVjvW7WXbbI3OEAiYBW6D2gAPahmXTvW79Ww5PLwAXLFYEeCtIabsR3
	LFQAKph9B4oZFKPYUjgFX3Cb9bPzXXggRyxJ+34bHzGEUYLcatIRTloBj69f+nS4
	W3wm0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4uwqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:38:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09a3b806aso17033285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927084; x=1751531884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DN2gLQs/N6h7C/Maw6kExG3LolsSEMumqxKA8yzbDWk=;
        b=DQ/OdC43TE/mT8Q0ckl3RGSHI4DrWz2bzOdoAkgBFAJnwxFRUfpa7s6Xt6mVQTPGPs
         5Uagg/okkPAX9pzPOAHV9tlcUz6CLPdQgNbUG2mPsQXayshxosB25Fd1LUzPN4Wp5MH1
         eRnQRnzig/xC6Po62ePEmVwHlWxucclcf43eo196dbxlq93Vy/3kLtqApDwUM96eLn1Q
         QvTnOWyhExyOHPvuNxAyCWpCzHxyO68txa8Q8T2QuVBhwgkV8zQoDSCpdH6r4JnBRxaB
         0Sq7BQVX2yxpEJkKvOlZsQHxPB9jxjBD88WoNkODgrCHeQIeEHkNZ/UzazwUVXC/c13p
         wMcw==
X-Forwarded-Encrypted: i=1; AJvYcCUpC/aypC3vYjRhClAXPktIV0kYaSFq1hy+/GOWnZwwnJKct6ndZJOUTpByU+wYqHdC/K5fEA6OVUBc7s4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgan4fQd61ue+AMSBqREGVjM4ArztyqQ5Zr6v9eLsm9SWlV6ik
	qzXraJdTljrxuDrw+gKLGkffuopOn48sEtcMY8MJxa99MXuNT37bqHrQ/FNIj+oa7Vuor34HNKP
	DpzRX9aSRlM7BBktYgDPesL+/LrCAgnh+0xGGOCtBPUJBx8K3Depf+SCqVpoY8jOhkyI=
X-Gm-Gg: ASbGncu3KcBtpfHI3nNP5zj+JxGcD8cniKCLHYQBzTvJYaisoCEXMalaYMAwKAVUBiO
	1XJixGZ6Jd+svoUqqUjKI3magp/KXNvRDuJH1K5aw5xBET9QjG8vo8o7E2+gsoV+MwRqM+Y85Bt
	lm0woJTdOxxUQuUzLZEpeLsPcU4sniAZ6YPhTC3+8bt0Dr0NZ8Z+ISH9+cNg1+ZwSpWCACqV7Ue
	6ZoOjGMFcYAiNodXD0I8s9Y9aR46O8T2g23GHgpbV93SmGdvMBhFrFkSe/QmeiRR16YqJXnbEf8
	NI2x+w4S6/KQfpoRa2rZKYDFGj7NsWllFHLU6Opg7dyQnbEkfiaSln09bue1vC2xqi2o5m4pAll
	D0cE=
X-Received: by 2002:a05:620a:394f:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d4296f07camr348015785a.8.1750927083677;
        Thu, 26 Jun 2025 01:38:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE8XRSLwrca8EjF9FheFZBFZEGiaUI959MuTBNXXt+9+gWR0YgIVeiXbqyruvrR19c3XdKiw==
X-Received: by 2002:a05:620a:394f:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d4296f07camr348014285a.8.1750927083307;
        Thu, 26 Jun 2025 01:38:03 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209ac4sm1177132466b.169.2025.06.26.01.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:38:02 -0700 (PDT)
Message-ID: <39d6a38d-6728-4998-aca2-23138677123b@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 10:38:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add bindings for IQ8 EVK
 board
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
 <20250623130420.3981916-2-umang.chheda@oss.qualcomm.com>
 <aFy7wEmP0EzGUHX+@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aFy7wEmP0EzGUHX+@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685d06ed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=2leXWRGikYLyCpLsO-IA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: TflLMAwUicPygRnVUXDEG2EPuXQtRahd
X-Proofpoint-ORIG-GUID: TflLMAwUicPygRnVUXDEG2EPuXQtRahd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA3MCBTYWx0ZWRfX+XOzFz8cvCFP
 kxFY2ox+QZXPZolx0EAbC5NRx/5SEbzRqJjwWT1+kHzUVxHiH3KbwHBUgNnTdP5Zmqpn0e/wu04
 FL1c+b4779ETOapgVxqwPNOgtPOPHhFDodFlnpwVotWIzSTancbfeYkp00E+WzRzK5VF0mgj5aB
 FQ1dfk3UA/VXmCi2gn2Z7+ekOK1boP7+XXKgEDEO55KOZ2q+feEOWFqKkdJhFnFoPb+XH3MkTFg
 OLmMDKczTpEjQMvIv4SafPgqOxealSqM4LAHoMks8eX8rABP+BF4MTYSmeMPLkOmSwLYhfmFYPC
 iCk67P5DzsQ+ut0oriI+ipEeHChEHoFBdYlG+vQ1jTbEbiaDVCdXPbIglQ0oeEX4tuTg/i0grmV
 6cfmJolo0VNOFYNZ2DFtIFe2xdeCWOxJpSTfvXhxHWNvxohzd55WdICI1hnDPOmRZ9fDR6fq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260070



On 6/26/25 5:17 AM, Bjorn Andersson wrote:
> On Mon, Jun 23, 2025 at 06:34:19PM +0530, Umang Chheda wrote:
>> QCS8275 is another SoC under IQ8 series of SoCs. Unlike QCS8300
>> which has safety features, it doesn't have safety monitoring feature
>> of Safety-Island(SAIL) subsystem, which affects thermal management.
>>
> 
> QCS8300 and QCS8275 are both the "Monaco" SoC, with some differences in
> which nodes are "okay" and "disabled", and as you say here some side
> effects thereof.
> 
> Describing these as "Monaco" and "Monaco with Sail" would lend itself
> for a better structure.
> 
>> qcs8275-iq-8275-evk board is based on QCS8275 SOC.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index b14206d11f8b..19823bc91a3b 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -54,6 +54,7 @@ description: |
>>          msm8998
>>          qcs404
>>          qcs615
>> +        qcs8275
> 
> Please add "monaco" instead.
> 
>>          qcs8300
>>          qcs8550
>>          qcm2290
>> @@ -935,6 +936,12 @@ properties:
>>            - const: qcom,qcs404-evb
>>            - const: qcom,qcs404
>>  
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs8275-iq-8275-evk
> 
> Please use the qcom,monaco- prefix. Is qcom,monaco-evk unique enough?
> We can sync up offline on this.
> 
>> +          - const: qcom,qcs8275
>> +          - const: qcom,qcs8300
> 
> Please replace these two with just qcom,monaco.

We could in theory keep the SKU id as a penultimate entry in the top
level compatible, but I'm not sure it makes sense given what we want
to achieve (just thinking out loud) - exposing soc_id through
qcom_socinfo & sysfs seems to be enough, and if it's not, we can
handle the odd cases separately.

All in all, let's go with Monaco.

Konrad
