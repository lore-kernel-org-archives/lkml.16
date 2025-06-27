Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298602D97B5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032687; cv=none; b=Hg5Ry7GAJ1PxX99+YKY8g13Fg4ZDWEZY4l9BoksOiO+auGa9NH3clbAYf9wXK0wpxLbh2nMZ0AhyLoUdZo/ly7lhjMmujTK81X9MjTGIYPcPTJxLQe2dA5Gc/bt0o3AC2uHepSqJ1nQopOF4jtxm9igk/gmc4kmIR86bM8IfjWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032687; c=relaxed/simple;
	bh=PbW+EBtMztzzi8ICMRD/REkIEiRuhchOsk7eMRuZuBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqSwxRlaE/PZtVtg77QVEswUnfOtimtLCJC4F+p43Xx2fGuGChCHaKk8HSJRJUDKnWK9pcr3SqQzo1pZ8Kijwvxe/+BzWJPvrDnDk/sulpp7tFP0dfYAFzz9TPsvBiDznT5GcAnO6GkTNOtQkyu1xZ2m55I3sQBvhrrbGv8x7Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6mlJ+Z8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6mlJ+Z8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCIoui028698
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8f9O0TugmOaHYNQ6bPlsLyE5Zw/b0P1alMxsrUiNUbk=; b=p6mlJ+Z8/Mn9RTiu
	zP89Q+yg5MlMjJgCTmhPia3MawoftVFvRTBG3Cbu6lTTeW3nSRmHLOfV/eAzBKJS
	l/z4dfdNOCuu/drw2CPhWpTiu6a2LIaBEk/oWRIIDNKRQzisZyR7owTrWqZLaTOl
	sOqnhG62sCoxduAS1OXEi9XA/2qsHiWc8QK4p9TGOaFVlWNYy2XhaRHQLiNsPK+V
	Y8AijlKN+LUb+3446GZImtZAwfpYtiS9n24FPRw7BLkxCL97biOxqR1Cxvj2oqJq
	mLyQWuecK1mxYDaPlrxdsHs6zQwxLgm/QDYEj/c3FCPKKUpi8GbyEDWbSCSrF0ip
	NdNnVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa50b89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:58:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d094e04aa4so53152085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751032684; x=1751637484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8f9O0TugmOaHYNQ6bPlsLyE5Zw/b0P1alMxsrUiNUbk=;
        b=EO78X8BWr67G4Yv7FfQdekZfq0XJBeEHFrYqwJlvnXvGqQX2ebG4rW0fsuQC1ZTtuv
         eqmdFV4n8oVagjdqgfqpbpxrm7/nOEWF1WExQD6aDX5fACmjmfZEGg2gaOcu+k9ohkfO
         FulRynnUZnBONO9eR4pIZ0moHGXHgmw4cqIxRxYeTyp2q9B/pR9/L6kKfzJFBVv7g7in
         bDwmVxQ4IoROOvzVLtsMl8xQzqinpGSOAvYA2OiqlmwB96tiWQx3OR7LwJPIEPzj/Vor
         PDOC/J86t9qvSO0G1V9Hb0Y9qTb8ZMZrLRRyQpu6lfqP0Qh24KOxOlNwj5Ack/nx+/3Z
         N3aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWus1d+mkVY1aUbrxGASXafsarEGOJqQ7V+159mXEe8joOdTQLsx9Rp2vxi4Dm+OAuF3naTHK+VC+g18HI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlandv0UOutD2bceBc/WEypMcdBNSZNv4ArtZJLyyvBvtGnFnn
	WCG29VaUVcalFX1naDLBlvhRbnqkpXMeyrGLeIfS5ckN0XLpGoIShlXuiQN6RlwZQh33tgP6Fjo
	AEdrd02bo1VLupFY/2s2sv2itRK6amgOMigSEEUdWeqSANrGbTWEcnQNuQ65DrUt2yhE=
X-Gm-Gg: ASbGncvBNDVXzF/GqB4Ipci6vefr5VEKLUG0VmiI8Y9MNMFmLMuKlnCDNtWNZ3ulHYO
	RuYnWpow5r7+v0vRxzEv7SrcK8v71opskFeemX+ibmPZxT7raLs0AVnOad2DiY6kLPL9QEMKqXY
	1TqDzQKMj/3HcQLqEHpI/uymp52rV2Ex7M0ON7LwozZvS2FOMvnpJQzIq/F2xj0DbG36qQ3N8fk
	WI3XgFjPu1Yh4lfwiyiQyXBUJj7NAyb4PZ1lGOQJD00rm6wfQcw1Xv1X+sRaJEaxYo6F3w3uWoj
	gs0Os97ZhInuCsRXEEVV6olAh8Ppoz3m78eQo1UK0YaGTieKzuDKyyx652yAcBF4O0HfWCin3rm
	hoIk=
X-Received: by 2002:a05:620a:4606:b0:7cd:14b:554b with SMTP id af79cd13be357-7d4439a5828mr185945985a.10.1751032683916;
        Fri, 27 Jun 2025 06:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsqCNx5b/ikeBt7ufEGaLEu1rBhGNo0bQDVX9XSB7OyW/vrELCoJjxuw9x+u5urdhndBoKUA==
X-Received: by 2002:a05:620a:4606:b0:7cd:14b:554b with SMTP id af79cd13be357-7d4439a5828mr185943185a.10.1751032683377;
        Fri, 27 Jun 2025 06:58:03 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b1fdsm131221366b.14.2025.06.27.06.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 06:58:02 -0700 (PDT)
Message-ID: <99b9e6aa-36b4-456c-ba46-6e1207cc1019@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 15:57:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/4] dt-bindings: mmc: Add dll-hsr-list for HS400 and
 HS200 modes
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ram Prakash Gupta <quic_rampraka@quicinc.com>,
        Sachin Gupta <quic_sachgupt@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_mapa@quicinc.com,
        quic_narepall@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sartgarg@quicinc.com
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
 <20250122094707.24859-2-quic_sachgupt@quicinc.com>
 <72b02fd1-5195-4bb0-b01d-5481b49a5680@kernel.org>
 <379e9199-4a9e-cd38-20cb-0fbd76fa33b3@quicinc.com>
 <abdde4ff-eae2-44c4-8608-89c762790549@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <abdde4ff-eae2-44c4-8608-89c762790549@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685ea36d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=v25VQKkRDONtiw5Uw7IA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: e-jidb_FQkNkim-BPCTn7you47Vyl6ad
X-Proofpoint-ORIG-GUID: e-jidb_FQkNkim-BPCTn7you47Vyl6ad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDExNSBTYWx0ZWRfXy+72IwVR0cDu
 2IFJF8OcSz7hxOXeV4/Kp1J2IO6xQPYdWJQkGPvtLee0FySwKjxA1HsESPcfPHPvUM2x3iQfXrS
 Q0Bc6z1IuLPDgAHeEo6qSojyHovSsgUtAs9D0622Zg+1aFzcdqJsSyQxmzJEt3y+YRKeJo4AWPy
 SKJXhi2su7J6TwVkee90yjjbYXC92cjDB59qoO5hWq8gLdgQhh86UDJujPrRPrtkWWPnRcruRco
 uJcxSIbjR9paoknj0b5SZv6JVTgpXIaUeHkK8Q8qKEv+28MpLy98lYa3x+wM1nBUR3ritVsi/4O
 hFo8yTalCVDCsMVpFnz/7Bakzr89JNEJxymHUDCcg1ONcebON3m5haN57WoHkoiYCAsLQKea/Ek
 +KklN9y6qJb10Fw9gY/G2sMwU/djWHiqL3afWHsMRW3JdOrwUfL+M1O7eqTS28hujszvTwuA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270115

On 6/26/25 7:42 PM, Krzysztof Kozlowski wrote:
> On 26/06/2025 16:16, Ram Prakash Gupta wrote:
>> On 1/22/2025 3:56 PM, Krzysztof Kozlowski wrote:
>>> On 22/01/2025 10:47, Sachin Gupta wrote:
>>>> Document the 'dll-hsr-list' property for MMC device tree bindings.
>>>> The 'dll-hsr-list' property defines the DLL configurations for HS400
>>>> and HS200 modes.
>>>>
>>>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>> index 8b393e26e025..65dc3053df75 100644
>>>> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>> @@ -133,6 +133,11 @@ properties:
>>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>>      description: platform specific settings for DLL_CONFIG reg.
>>>>  
>>>> +  qcom,dll-hsr-list:
>>>> +    maxItems: 10
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> uint32 has only one item. Anyway, there is already DLL there, so don't
>>> duplicate or explain why this is different. Explain also why this is not
>>> deducible from the compatible.
>>
> 
> 
> Timeline still amazes me. I will be grumpy on this thread.
> 
>> I will change it to reflect array from uint32.
>> There is change with artanis DLL hw addition where it need total of 5 entries
>> (dll_config, dll_config_2, dll_config_3, dll_usr_ctl, ddr_config)
>> for each HS400 and HS200 modes, hence the new addition in dt. And these values
>> are not fixed and varies for every SoC, hence this needs to be passed through
>> dt like it was passed earlier for qcom,dll-config & qcom,ddr-config.
> 
> 
> Eh, no. That's not a valid reason. It's still SoC deducible. Don't bring
> your downstream practices here, but remove EVERYTHING from downstream
> and start doing things like upstream is doing.

QC SoCs have between 0 and 4 SDHCI instances, each one potentially requiring
different tuning, let's keep this data in DT

Konrad
