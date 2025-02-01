Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CF5182
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 15:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738425072; cv=none; b=F6lh13iNSR/21KowywT+MyM+40KLoLHMbyGf95P8dhuI6+l8yyF98Rrf/pJitHrVkb/TyeCcClToBLcky+yb/ZfXzsQaQLuyHXymsj+NJSCeaizx2qIdTpPfZzmFl9ybRipnaCkoSsNsOZFqmUAD+yn63WcJ6g4b2fIuwqIxHvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738425072; c=relaxed/simple;
	bh=izpBR5rdk9OIlY+KbVGEZN9aAehY4o4RrMiZpBnznDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9SY+XdbV2NfTiIZ3XEPjqQUM4qLIAeUKpDA4gNA3ny8tkUZ+AyIjQDEP+fuXskP7ox9sSp8Ma+Rip3ev7CRzZZX8j2j7TtsM/TBzWiuLndEDq/nvWRkYzYPnQC1ftgYafoWhFwvlV0x7pCm0q0/QEDf0T00Mv24CLaTnrjQHIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IN0H76GW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IN0H76GW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51156bPZ023503
	for <linux-kernel@vger.kernel.org>; Sat, 1 Feb 2025 15:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OcBlQgyAu9SvWDWcEfM8ISbZxbdqrd8/3jOjf+3p23o=; b=IN0H76GWkE3TH4Da
	kcu4xpEad7nufvS5c1waS73FawMvElzOXzBkVGMhaCbfYUvEKV3Ql4z32f5kYIKr
	kIRQC42nmvX4xtfC/+mebHnBglzd5mFq+m7SMUrqYkwoX0aPk9TO5Ebyowqnczv9
	okp+DS5zlcI8PMPKFH/s+O0VQgkS8672xlCyb1PRWyh/Kx4ZEfmre8bRjUTf5mkp
	9lhXwQwwW4haILrHMsOvVPI3m4cpf/47QyiLRJknvglZY3yDrwRyXo6iAS9FZ8V/
	VsOsb63GIVjWdPe+8EUfuYIujQ6EsuJLSF0i3o+0xwKos0JM70nXo4QjaEzTGLtu
	0M2L8A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd5y13p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 15:51:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6fec2de27so82176385a.1
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 07:51:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738425069; x=1739029869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcBlQgyAu9SvWDWcEfM8ISbZxbdqrd8/3jOjf+3p23o=;
        b=bJROlLMekj+Asp7p50IZYnDP1aA9QOp7IDwKb9ZwDsLuuqtmiyPGzaKPWjAaacNFIG
         D1aKy+YrD3wtBq3JFIx4KGZCH9KVXQXfMg5SiRM/yF64Aax0g2R25sYlQd2iAS8Jix1M
         uFtZ9EzqT4bN8/fFWJE+/8v8rUmWddYP6sC6QEg/sUPZoHpj3AQRvZGVt9Aw0QaC+cRZ
         LwVH0/Qs7/VJ8XvBl3y0PTRg8oDPxOhEUwNJK3a+wwgt8LhqSKQgNrM1rnsaph7V8q5F
         aX7GohxdvNa/jnYFyER40V1LS4C8RPxyf4/4+yQ4PIUPJ3PXwzQ0u4zQ6wnjzFDSyOLv
         cx3A==
X-Forwarded-Encrypted: i=1; AJvYcCUQQpsQ5cUhYpTMRtqDMyy0z0GEbkwkENSPHe69MsR6SqvtdiT2yEbpFM02nR8uRIcuiQb2kgZCfVsAKoM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz86/LmfOsGZ/OwUKLXrMDhBqhrbhG26X0OBktY3Yv/eYwpmHa
	zMFu/fqj0CZiz5DniFQIOJy2Rwbe2Ye9ImLLnOD7yNFoiXDaoUkp1p60hk0Y34f5ZAkzyQPqoRw
	t8DI/jOwjTTX/2CdJ6Hf41M39cuaEy2jQe6sq8tj/aJwPhydz/5BN7ZXjuSlT8hk=
X-Gm-Gg: ASbGncupisSev2Mi6XEddxriUHeC/ZDSBH367ymN3OXiXXB2rNqfcBZHkD6MnFmbCNh
	vKE/u+os77Fb6OJiUgMs9kQ3JxWReTmfnfyebTEo6PIUP4KPQIs8OjdfTd/bwSoINPERXG7uVbz
	/T7e+UHZJ55P5Agfjnoe6Qyhwy3423u1y87BPWcy1Uo5eW4eywpul3S9XZiX0HSAKHQ7tanwjeg
	qtzA8qA6l4iTYZX3HkpiNM4brB4p/UZ4i1N+fmyirN/ENvuulLU+g08lDLwXPb3r0GfyuIf7QnN
	JZJ+eYCFdUBsq1cSXQpBQ6nh1HNHYa7X7pcROAwGQg7DNCis8m+R7L6RODo=
X-Received: by 2002:a05:620a:1a0f:b0:7b6:dc4f:8874 with SMTP id af79cd13be357-7bffcd8bd41mr837345785a.12.1738425068904;
        Sat, 01 Feb 2025 07:51:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKUTn/wD9HXk9mDKqkyfNa5s30nU41MOYoBYnoOHdvd8dY+1AgwfFEn7HHoiB36+FhhAUFBQ==
X-Received: by 2002:a05:620a:1a0f:b0:7b6:dc4f:8874 with SMTP id af79cd13be357-7bffcd8bd41mr837343985a.12.1738425068559;
        Sat, 01 Feb 2025 07:51:08 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47f18f3sm452633266b.80.2025.02.01.07.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 07:51:07 -0800 (PST)
Message-ID: <5defdbcb-f134-4332-8b63-50794da6e2cd@oss.qualcomm.com>
Date: Sat, 1 Feb 2025 16:51:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
To: Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prakash Gupta <quic_guptap@quicinc.com>
References: <20241227110024.30203-1-quic_pbrahma@quicinc.com>
 <1c8af731-c551-4d72-84a0-f14d57bec4ec@oss.qualcomm.com>
 <e7abe34c-9df9-425b-933e-cc744a63b80c@quicinc.com>
 <41fd6b59-249d-4f19-9ff8-4ae169a6db05@oss.qualcomm.com>
 <27aa8dc3-34b9-40e7-93bc-e52118b46138@quicinc.com>
 <ba800255-e2b0-4b92-9ff0-f7ed744fec8c@oss.qualcomm.com>
 <d28f5482-81bc-4600-9a60-872dadd22b96@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d28f5482-81bc-4600-9a60-872dadd22b96@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HFDH8bbzzVHeN-tMPhpiGlpNAVMCdyLZ
X-Proofpoint-ORIG-GUID: HFDH8bbzzVHeN-tMPhpiGlpNAVMCdyLZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502010138

On 30.01.2025 6:40 AM, Pratyush Brahma wrote:
> 
> On 1/29/2025 7:56 PM, Konrad Dybcio wrote:
>> On 28.01.2025 11:02 AM, Pratyush Brahma wrote:
>>> On 1/9/2025 8:56 PM, Konrad Dybcio wrote:
>>>> On 8.01.2025 1:10 PM, Pratyush Brahma wrote:
>>>>> On 12/30/2024 6:49 PM, Konrad Dybcio wrote:
>>>>>> On 27.12.2024 12:00 PM, Pratyush Brahma wrote:
>>>>>>> Add the device node for gfx smmu that is required for gpu
>>>>>>> specific address translations.
>>>>>>>
>>>>>>> This patch depends on the patch series [1] posted by Imran Shaik
>>>>>>> adding the clock support for gpu.
>>>>>>>
>>>>>>> [1] https://lore.kernel.org/all/802d32f1-ff7e-4d61-83f1-f804ee1750ed@oss.qualcomm.com/
>>>>>>>
>>>>>>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>>>>>>> ---
>>>>>>>     arch/arm64/boot/dts/qcom/qcs8300.dtsi | 37 +++++++++++++++++++++++++++
>>>>>>>     1 file changed, 37 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>>>>> index 80226992a65d..8eb688e2df0a 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>>>>> @@ -816,6 +816,43 @@
>>>>>>>                 #power-domain-cells = <1>;
>>>>>>>             };
>>>>>>>     +        adreno_smmu: iommu@3da0000 {
>>>>>>> +            compatible = "qcom,qcs8300-smmu-500", "qcom,adreno-smmu",
>>>>>>> +                   "qcom,smmu-500", "arm,mmu-500";
>>>>>>> +            reg = <0x0 0x3da0000 0x0 0x20000>;
>>>>>>> +            #iommu-cells = <2>;
>>>>>>> +            #global-interrupts = <2>;
>>>>>>> +            dma-coherent;
>>>>>>> +
>>>>>>> +            power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>>>>> +            clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>>>>>>> +                 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
>>>>>>> +                 <&gpucc GPU_CC_AHB_CLK>,
>>>>>>> +                 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
>>>>>>> +                 <&gpucc GPU_CC_CX_GMU_CLK>,
>>>>>>> +                 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>>>>>>> +                 <&gpucc GPU_CC_HUB_AON_CLK>;
>>>>>>> +            clock-names = "gcc_gpu_memnoc_gfx_clk",
>>>>>>> +                      "gcc_gpu_snoc_dvm_gfx_clk",
>>>>>>> +                      "gpu_cc_ahb_clk",
>>>>>>> +                      "gpu_cc_hlos1_vote_gpu_smmu_clk",
>>>>>>> +                      "gpu_cc_cx_gmu_clk",
>>>>>>> +                      "gpu_cc_hub_cx_int_clk",
>>>>>>> +                      "gpu_cc_hub_aon_clk";
>>>>>> Most of these entries look totally bogus, please make sure you only
>>>>>> reference the ones actually required
>>>>> These entries are exactly similar to the ones we use in sa8775p as well [1] and the usecases
>>>>> haven't changed between qcs8300 and sa8775p.
>>>>>
>>>>> Can you please let me know which entries you find irrelevant here?
>>>> Well, I'm particularly unsure about CX_GMU and the HUB clocks.
>>>> I >>don't think<< they don't have much to do with the SMMU, but please
>>>> check internally with someone who knows for sure
>>> I checked internally and found that these clocks are required for gpu smmu operations
>>> as we don't use interconnect voting mechanism here as we do downstream. Hence the
>>> list of clocks is same across all targets using gpu smmu as described in [1] previously.
>> I managed to dig up some documents too.. It seems you're right, however the order
>> is supposed to be slightly different:
>>
>> GPU_CC_CX_GMU_CLK
>> GPU_CC_HUB_CX_INT_CLK
>> GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK
>> GCC_GPU_MEMNOC_GFX_CLK
>>
>> Unsure if it *actually* matters given we've added them in a random order on a
>> multitude of platforms and there haven't been any visible adverse effects.
> Thanks for checking this. We haven't really adhered to this order in
> most of our platforms and things have been running fine. So I guess it doesn't matter.
> However, I'll still send out the next patchset in the order you've mentioned. Just so that we
> are in consonance, the final order would look like the following. Please correct me if you'd
> prefer otherwise.
> 
>                 clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>                                <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>                                <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
>                                <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>                                <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
>                                <&gpucc GPU_CC_AHB_CLK>,
>                                <&gpucc GPU_CC_HUB_AON_CLK>;

Looks good, please double-check if it works without clk_ignore_unused

Konrad
