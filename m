Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC82F2E9745
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038033; cv=none; b=ef7aOC7/eLBdNiw1ssx7rLi2D4Zf2TnpBfQmiZsYkuVWdANlTyN/HgFGXB0O8/kQEZBgAbA02oENvIovWE5rB1vP6Wd3ZRlzNcFM1Csi5Gpsi1NJlKRBuPyHiF7/WgLVVwtg0se4EOLXoQFLYTmHg4ZlFjtCoDt/a3EVSwoFwso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038033; c=relaxed/simple;
	bh=hcN6A1q0WGNYWRvbQ4ctcnRMau6cAMlQLdGma13AKqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bmOPIdYgn22MJPsE1MLsO4gsqt5jl2Q+aWs0BK7N7IlUFAs6U/P0cHxAaObDNrnDvGS8xda79Xx7u5L3OetjqZGIsPIzCYNcxskHur07Tuq/D3LdbDt7ARfWzKA37mdJqBCYWFmSVrt5Rj9bPY+Rg7TRHcYUjF+Bh3ea+6B9XkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBKd143x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBKd143x"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCXt9h011216
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JZZ4tJ6lcu3L9BEzwOZsQXUridSAuhGxATa6ADiHX78=; b=iBKd143x7nGsvr/U
	az510V+NoAVosDvhr333MuNCoJFZ8A5MttWnq0EtcFeh28Ghplkm5Lq7TlpQUw4v
	fQNvLGkukd5rvfVoL5zgPcfm23z1KyxJtlaHf1ZTaTmASSy3fzeAneCaO2uJTgtq
	ey/HqXhoQY3f8xLEoyuV3A0eFSkhSs1LmcTUWie6hgDn3x5C/D5vwZm2M3ahJl2M
	2A3jYunp4+G7S6ouhPEih6l5IazRpURwL4IZgOU62IQ7uw47Ilw6osXTYrqjVIF6
	Y8Qq547i7HE8EME0YMJvnLt6u/2Wkj5Qxu1ItuQuHi9MUVtYxeP/F5quyL3VX452
	u4sEEw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgq82h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:27:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7cfb7ee97c5so3049785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751038030; x=1751642830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZZ4tJ6lcu3L9BEzwOZsQXUridSAuhGxATa6ADiHX78=;
        b=CJ5Ho9ZnJbFJU6JUWN4t8AjPMnWGmAi00ALLg2mJk0hA3VBaYnFucMaRPfvA6Z+4Na
         9q4gPjwxur8qEkyob3lV6zLxNWSI+n4jTx8arM+LoEW7N/W48TjEfRwewOfA4n+24pXf
         otKCy97/AMLBTX2TNKLuFPdVwxanwItDVwY0PzU80KbOmJlWKadJ6XsPUh1kUyIQYSHg
         61UAlpSzSghywyXoTul513RbZ02w63M0v4IOu6L3cGDaB4RMu0C4AahBaL8jfKa80ngu
         rneLSvgpPVPutAJn0PRUnA8nrv2dqWS7KxhQHWAEucuAWY+vA7vTsuEbwtfaZDEry7CV
         XNVw==
X-Forwarded-Encrypted: i=1; AJvYcCXW3F50W8i3PUsL5G1L4g3/W5329Fmsq/3HsnzS2E4S9Sj9+6UWwRJPinY3/HW7lNrUGEgUBWiRp/JQAlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGfRJHxihRIrqIA+sbLw8zdlJPeuM7CQt+FEcrLlh3EQOZBDHg
	kMHmSG98Bk6xbpNlHWvfRcqCiLLIBAsjjLTaUeSP1GqoE7UGf5BjJCo1Kksk/PlIQwKow6TQkMe
	CIrKfsZNIv5iaRrb8nLlLi6K6qCR7b/rfRMbJlKnaFjIBX5NpZCJHRBKz9gcXJmtmOgo=
X-Gm-Gg: ASbGncsh4qNrAPr7IxHFzTWU4Ee4/ynhxrtrx103TAezHopwSfvFRLew0c+HfEriwes
	0QLoT9/Ynd44ADsqjwHMD4q8z2N4RCotOoNPBJc96JyAelVrsapBPHtOXVSyLTm05UxApn9YhdU
	ByJtQrpJ5bxVB1OFhdPLEosrnWPvv5N3H+FIHci1sxomHjJVLko4drGIVzcq0F1iQludeCx7boH
	TqjSHLnXV25ZGTwSgBvZ9mx7Dwo/YO4udFwcRLQfNgD4S0u3k6INo4v2t8nUlHNPZhmLa676s2B
	M9cVnhIpbVV272Vh+6JGU/lmbFYFNKjHE/dLcDlopvsSMSEQUMNO+jvhuacx92ociwzPNjCUvWc
	V+V0=
X-Received: by 2002:a05:620a:2a0f:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d4438fc152mr232576385a.5.1751038029868;
        Fri, 27 Jun 2025 08:27:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzu9KxtnhJiSF0c+63jY7dHIfp2V6YLdELQCZgcMxDmXNkGrahzyOY+/NuiaXWENcUW8wxqg==
X-Received: by 2002:a05:620a:2a0f:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d4438fc152mr232573785a.5.1751038029320;
        Fri, 27 Jun 2025 08:27:09 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bda4sm140761466b.141.2025.06.27.08.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:27:08 -0700 (PDT)
Message-ID: <7df8a438-364e-431e-8424-209ad7482efc@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:27:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <6e330e8f-5856-ef8e-5fe3-52bd61b59e02@quicinc.com> <aF6PqCY/E6H0Mc2/@trex>
 <2722e70a-1080-c9f3-eb56-4a6e79084bdc@quicinc.com> <aF6z7iaicHyNXg6w@trex>
 <e704535c-0004-6dbd-bc81-b4ebc7747881@quicinc.com>
 <bac1e5e4-ed18-4e26-a883-2a41bf8468a8@oss.qualcomm.com>
 <a934bb78-587b-6aca-2fb1-38605d3b385a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a934bb78-587b-6aca-2fb1-38605d3b385a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IUcJ4t2reW5TzCF9TAy--PjGJUUIWHvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNSBTYWx0ZWRfX8wPq2Nth0BRr
 RJzvUA/pgR/HOwksj0kYMUSTeMmQTZsOfbaWSq1NG4XJ8XBq8X5CX6EliWC5n4hr6K8zbWadNs/
 A415eJlo69qv0TMKeEwCsD9dYUURzYFEHzSxsWvBBuiqkbtjwUXd6x/qBZNpwjtPmn5hYJVcCeC
 4eHFAyStb8bGAcL77/wQNBzKGxsHRXW1RhhMcWJNaeKD2x6SmYlgatIye+npeTaa4uTKdrgLo5O
 NmD7+A2ZflBv0SHPZQEv/a9oFnW2jya+D5gTIszDoJtFYxgfarl4ywIsFB3EOHD9xkwITnsncvU
 yDPHEwhgSiyw7FiCWPWi5r9wtb+r0lXeJkYJ30PyAJ5MlvYiP/b8/pC+Dpx0EgJT8O3SuIwtR+p
 3QYBJ46fHuiJlew4XxPRgpRW+pt/OVJ87L7KPPoX0FnyIhyIKxCh2QnRXFOlylUVG/w7vVKb
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685eb84e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_MKmYBsjHzb_8gZMir8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: IUcJ4t2reW5TzCF9TAy--PjGJUUIWHvD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270125

On 6/27/25 5:23 PM, Vikash Garodia wrote:
> 
> On 6/27/2025 8:50 PM, Konrad Dybcio wrote:
>> On 6/27/25 5:12 PM, Vikash Garodia wrote:
>>>
>>> On 6/27/2025 8:38 PM, Jorge Ramirez wrote:
>>>> On 27/06/25 20:28:29, Vikash Garodia wrote:
>>>>>
>>>>> On 6/27/2025 6:03 PM, Jorge Ramirez wrote:
>>>>>> On 27/06/25 17:40:19, Vikash Garodia wrote:
>>>>>>>
>>>>>>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
>>>>>>>> Add DT entries for the qcm2290 venus encoder/decoder.
>>>>>>>>
>>>>>>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 57 +++++++++++++++++++++++++++
>>>>>>>>  1 file changed, 57 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>>>>> index f49ac1c1f8a3..5326c91a0ff0 100644
>>>>>>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>>>>> @@ -1628,6 +1628,63 @@ adreno_smmu: iommu@59a0000 {
>>>>>>>>  			#iommu-cells = <2>;
>>>>>>>>  		};
>>>>>>>>  
>>>>>>>> +		venus: video-codec@5a00000 {
>>>>>>>> +			compatible = "qcom,qcm2290-venus";
>>>>>>>> +			reg = <0 0x5a00000 0 0xf0000>;
>>>>>>>> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
>>>>>>>> +
>>>>>>>> +			power-domains = <&gcc GCC_VENUS_GDSC>,
>>>>>>>> +					<&gcc GCC_VCODEC0_GDSC>,
>>>>>>>> +					<&rpmpd QCM2290_VDDCX>;
>>>>>>>> +			power-domain-names = "venus",
>>>>>>>> +					     "vcodec0",
>>>>>>>> +					     "cx";
>>>>>>>> +			operating-points-v2 = <&venus_opp_table>;
>>>>>>>> +
>>>>>>>> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
>>>>>>>> +				 <&gcc GCC_VIDEO_AHB_CLK>,
>>>>>>>> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
>>>>>>>> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
>>>>>>>> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
>>>>>>>> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
>>>>>>>> +			clock-names = "core",
>>>>>>>> +				      "iface",
>>>>>>>> +				      "bus",
>>>>>>>> +				      "throttle",
>>>>>>>> +				      "vcodec0_core",
>>>>>>>> +				      "vcodec0_bus";
>>>>>>>> +
>>>>>>>> +			memory-region = <&pil_video_mem>;
>>>>>>>> +			iommus = <&apps_smmu 0x860 0x0>,
>>>>>>>> +				 <&apps_smmu 0x880 0x0>,
>>>>>>>> +				 <&apps_smmu 0x861 0x04>,
>>>>>>>> +				 <&apps_smmu 0x863 0x0>,
>>>>>>>> +				 <&apps_smmu 0x804 0xe0>;
>>>>>>> keep only the non secure ones.
>>>>>>
>>>>>> ok
>>>>>>
>>>>>>>> +
>>>>>>>> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
>>>>>>>> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
>>>>>>>> +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
>>>>>>>> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
>>>>>>>> +			interconnect-names = "video-mem",
>>>>>>>> +					     "cpu-cfg";
>>>>>>>> +
>>>>>>>> +			status = "okay";
>>>>>>>> +
>>>>>>>> +			venus_opp_table: opp-table {
>>>>>>>> +				compatible = "operating-points-v2";
>>>>>>>> +
>>>>>>>> +				opp-133000000 {
>>>>>>>> +					opp-hz = /bits/ 64 <133000000>;
>>>>>>>> +					required-opps = <&rpmpd_opp_low_svs>;
>>>>>>>> +				};
>>>>>>> Fix the corner freq value
>>>>>>
>>>>>> can you add some reference please?
>>>>>>
>>>>>> I took this data from an internal document - not sure why the downstream
>>>>>> driver supports different values or where those were taken from (AFAIK
>>>>>> they are not supported)
>>>>> Most likely you have referred incorrect downstream file. Refer scuba-vidc.dtsi.
>>>>
>>>> I took them from actual documents (which might or might not be obsolete,
>>>> hard to say but they were the latest version and as such, they
>>>> contradict the downstream dtsi).
>>>>
>>>> So I'd rather not use downstream - could you point me to the reference
>>>> you used please - I wonder if the fix is required downstream instead of here?
>>>
>>> You can look for this file gcc-scuba.c and refer gcc_video_venus_clk_src which
>>> is the src for different venus clocks.
>>
>> This is not a good source in general, GCC often has more rates defined
>> than the consumer is supposed to finally run at (because they were deemed
>> power-inefficient or similar, you can pretty much set any rate you want
>> on the clocks fwiw)
> Count wise, i agree. Value-wise, afaik, corners should match OR are you saying
> client scaling request for 133.0 MHz is ok when src is generating 133.33 MHz ?

I *think* we're running a closest-match in there.. but I'd love to
have the clock and consumer drivers agree on the rate exactly
(which in this case would be 133333333 - and the clock plan in
our docs agrees)

Konrad
