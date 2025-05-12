Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2174F25487C
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 03:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747022124; cv=none; b=ktqhOaJZmL5TvLRv1R5mUwAvkcDHAjh4I1v0iRap7JdufhY4C/amHf3im+6B4HA7W5BXYDier+ffDYQ/VVuIoDUafMTbrkBZwNgKbN+UB1Dw4CykT7xo6OI+S8JhT2N6H76i3BBTl57vdVTdpbLINh6r7PhSz+iNBm+0TE5RwbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747022124; c=relaxed/simple;
	bh=qY1qfNIBPyLYZ+bGQiDkA/ZqulShllNxYxCaOGvGIvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WxFiyd5EBCvYniROWwuCdfG0nhrd9m8gy77a358xVJ3PmWqDJE1xZyVNCTjkT2H+YYSaCpneCQ92l2A4nAxGnGrnuJQyF0r/kDC80gzZNQPZ2dfhAMRqy1Drd96BJM7oW3RTGWIhc1/wGdPrToNLfkADDuvST1AGZ5kvFkBBTdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BfacZ1Dt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BfacZ1Dt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BNqj49016870
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 03:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8WDKrTckQCWr+LJBAG0kC4a97KNkNLl2PuqVbJ/lBbk=; b=BfacZ1DtiM0cdo3j
	FqvH8yB9NKmDTWbyKEReDIzPLbWHyZ8eF7rlUUyu8Ql1kBkUmkeXaqTvSkUXQgYk
	DMiI1gux/3cQsRNr1tbEPjDJBiepvEKeqAf3i0v+km4Ek+jrNzJM2uDsRwOjZ//g
	f7QP7rhPTDzxoZRyz9k9Z5VEI9IjOkjIWaOCKYV7PkQYzl32jDERUjgqN4fGjX/V
	DiJldvWPaB3JK/ZUWemeial6/CSMfkeb852C1dWNHQEDJTy+an4D4u7M/hVm6qW3
	y5xpF8EfZYXhREfpver3qNgRBI7FxiCmtqxP/tiEyt8G1ZoeS5MY07b3V/R6C6lK
	ugazgw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyjjjx59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 03:55:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22fd4e7ea48so21938445ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 20:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747022120; x=1747626920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8WDKrTckQCWr+LJBAG0kC4a97KNkNLl2PuqVbJ/lBbk=;
        b=KlZEyMFHInI0OzT56CbtVcEgINzcLcZkivlxRd1YhcEgW2RfmBDQhcIcuuCsu3kEVG
         8lHnMZ3e7D8vtH1YnPMW28wJka5gXboyiKf3/T6h3Uq/8hMSigp3FkBg8n6rEzkuC9/C
         G3U+selQSMyzfJ9QnxWCzSV9AdNKi27tYygUTOT+geK1d7XrmPg4dlvYjTbIPK9w8+ID
         euCAmRy6Fxp7QGHj9GJ6hbOz/gAoE9jpFYP3f94gyFxMjyuHrADvh807HoMcBLUUgGgh
         M8f5y7JN+9vVBN/oEIIUqKRauoujX4NHhSVDpS0M7VihyWl3b3qZN4SKn1H96Fy8sMrB
         nshw==
X-Forwarded-Encrypted: i=1; AJvYcCVLKyJJ8Y2K/08fgFheUagoSPOXm3yYZKNrR+cJLrlYfTZUk3wxgtTu2k7IOnyWMkZAls0+0282x/tgXz4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjlk1WrDOiQmdOOsNU5+3aZAgaDmeigmvxUq66jhTcuUu+3Zcf
	RfWMXwTi78x4m6Xi9jMH1aMFwfbRVnz0iBRGDArBKLW/tLebnANqEB9r0NQhF1F5l5Hs2ZxNf4A
	PLSnSdvEdnzE5j9iBoC1OTecnKQ61pxVsmYWvoy7uKNp0ZZkB4m7yyqjjHGXvSc4=
X-Gm-Gg: ASbGncuTSAK+5huFc+Og7gsYchUWQPG3drX8yZiOquUFdKqB/UipOr0l7fNNdVKdCmi
	FRkZlgMMj79QIhvQezldDkWcgAGXGo/a8U2JTyR68bDvAtD3DrG7Io9g6hL+z8Nlndm8Df3X6cb
	k95DdBwEWDHwtYcUAm46pQ6/CHDTrvYg4ZoR+lH5prNlMf6rPI/eg43fztIPW9n8Roo8g7LfK5R
	3Mho8xaQW7uJTZj2RLh2Eu/b/uwFdNDSC09lV4ObzUiFrlIyhqYS/oZL55pltsIALmJFPoXcL8X
	4tDKuLeUWxxmk5lbRXbg+3eutoSrQBWDvFyaZmE=
X-Received: by 2002:a17:902:f68a:b0:22e:4a6c:fef2 with SMTP id d9443c01a7336-22fc91a205amr182962145ad.53.1747022120237;
        Sun, 11 May 2025 20:55:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOM0oX86/HShJVVt80lz+16sIC8o4F2PcAejQwrh8brWAXBr3Muwb5Bc6kA75S8GnIM8Hr3Q==
X-Received: by 2002:a17:902:f68a:b0:22e:4a6c:fef2 with SMTP id d9443c01a7336-22fc91a205amr182961825ad.53.1747022119746;
        Sun, 11 May 2025 20:55:19 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a0976sm53011635ad.227.2025.05.11.20.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 20:55:19 -0700 (PDT)
Message-ID: <effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com>
Date: Mon, 12 May 2025 09:25:13 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        quic_ekangupt@quicinc.com, krzysztof.kozlowski@linaro.org,
        "Bharath Kumar (QUIC)" <quic_bkumar@quicinc.com>,
        "Chenna Kesava Raju (QUIC)" <quic_chennak@quicinc.com>
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
 <10f69da3-6f94-4249-a8f3-459dc48fa5e1@oss.qualcomm.com>
 <D9R4NCKH46WP.14C8F7W4M58ZQ@linaro.org>
 <3c0fea8d-0715-40e6-bed9-e0961bf034e0@oss.qualcomm.com>
 <bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com>
 <pzlsbznxpfsbdsxlzvcbdy7wwba4z5hoya7fyoacwjadtpl7y4@qajecdvs3bho>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <pzlsbznxpfsbdsxlzvcbdy7wwba4z5hoya7fyoacwjadtpl7y4@qajecdvs3bho>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDAzOCBTYWx0ZWRfX/5ZV/JQXwe5W
 0rVuoyEg2q2KqWeGGpZ/3RlZzqFG1GHAN7MylLnY/U6ikljiu5zwmNObMVBrz9DpwZkT0OrF0hC
 c6sHPBLJP+UuANAgjEiH2q5G/4qzFcvSQux3gHRIpw17tB0SgfkBJppMoLNc7mXW66yAI2TeWbO
 /OdFehWEDOB7u6l3WN1MCwum8w93V69WOahkaJEs2CLScjfo7jkRPe3MbX4eB+ubKZhQwdAjWB7
 EOUornaOMfLKYj1rkkIZqknX4GW18OtLo8PRBG3EB2u6tHw8ykS+0L/CCkLsmXOQd6Vv2jeosr1
 8HLYoAbvjHqxSdFzLRgYggzmpJ201vWVxbG0Ndh3pMuPCc84+tSI5BP4T9vr2Cil4xFhYzenGov
 i5BY0hkWjXdfRYjx/7ZFXdJQEf42j+oXUv+XHGe6AOgAd7yWGGzJdw0kHxsv3dqODIBNxqj8
X-Proofpoint-GUID: di6q4RzbTp2--8hcqmDvTsK6pKpHANi3
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=68217129 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=YS6qPdkyQB3lb9F7VO0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: di6q4RzbTp2--8hcqmDvTsK6pKpHANi3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120038



On 5/10/2025 1:19 AM, Dmitry Baryshkov wrote:
> On Fri, May 09, 2025 at 09:12:30AM +0530, Ekansh Gupta wrote:
>>
>> On 5/9/2025 4:27 AM, Konrad Dybcio wrote:
>>> On 5/9/25 12:20 AM, Alexey Klimov wrote:
>>>> On Fri May 2, 2025 at 10:38 AM BST, Konrad Dybcio wrote:
>>>>> On 5/2/25 3:15 AM, Alexey Klimov wrote:
>>>>>> While at this, also add required memory region for fastrpc.
>>>>>>
>>>>>> Tested on sm8750-mtp device with adsprpdcd.
>>>>>>
>>>>>> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
>>>>>>  1 file changed, 70 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>>>> index 149d2ed17641..48ee66125a89 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>>>> @@ -7,6 +7,7 @@
>>>>>>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>>>>>>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>>>>>>  #include <dt-bindings/dma/qcom-gpi.h>
>>>>>> +#include <dt-bindings/firmware/qcom,scm.h>
>>>>>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>>>>>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
>>>>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>>> @@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
>>>>>>  			reg = <0x0 0xff800000 0x0 0x800000>;
>>>>>>  			no-map;
>>>>>>  		};
>>>>>> +
>>>>>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>>>>>> +			compatible = "shared-dma-pool";
>>>>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>>>>>> +			alignment = <0x0 0x400000>;
>>>>>> +			size = <0x0 0xc00000>;
>>>>>> +			reusable;
>>>>>> +		};
>>>>>>  	};
>>>>>>  
>>>>>>  	smp2p-adsp {
>>>>>> @@ -2237,6 +2246,67 @@ q6prmcc: clock-controller {
>>>>>>  						};
>>>>>>  					};
>>>>>>  				};
>>>>>> +
>>>>>> +				fastrpc {
>>>>>> +					compatible = "qcom,fastrpc";
>>>>>> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>>> +					label = "adsp";
>>>>>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
>>>>> IIUC the driver only considers this on the sensor DSP
>>>> Memory region is required for audio protection domain + adsprpdcd as far as I know.
>>> next-20250508
>>>
>>> rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
>>> if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
>>> 	// ...
>>> }
>>>
>>> maybe some driver changes are still pending?
>> Would like to add some more details here:
>>
>> Memory region is required for audio PD for dynamic loading and remote heap memory
>> requirements. Some initial memory(~2MB) is allocated initially when audio daemon
>> is getting attached[1] and this memory is added to audio PD memory pool.
> How is being handled for the audio PD case? Could you please point it
> out in? Currently, as Konrad pointed out, it is only being used for
> Sensors domain (unless I miss some obvious usage handled by the core).

The reserved-memory support was actually first added for audio PD only[1].

The usage of reserved-memory is audio PD:

This memory is used by audio PD for it's dynamic loading and remote heap
requirements as I had mentioned earlier. I'll give more details here:
When audio PD starts, it expects some initial memory for it's dynamic
loading and other allocation requirements. To fulfill this, the audio
daemon allocates[2] some initial memory(~2MB) and moves the ownership to
the audio specific VMIDs that are configured in DT[3]. Audio PD then uses
this memory for it's initial operations. If there is any more memory
needed, audio PD makes a request to allocate memory from HLOS which is
again allocated from the same region[4] and then the ownership is moved
to the configured VMIDs[5].

The sensors domain that you are pointing was an extension of this and as
pointed earlier, it was added to support SDSP use cases on some old platform
where there are no dedicated SDSP context banks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=1ce91d45ba77a4f6bf9209d142d5c89c42cf877a
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1274
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sa8775p.dtsi#n5334
[4] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1884
[5] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1927

//Ekansh

>
>> Additionally, if there is some additional memory requirement from audio PD, the
>> PD can request for more memory using remote heap request[2]
>>
>> The support for SDSP was added sometime back[3] to support SDSP usecases on some old
>> platform as there were no dedicated context banks for SDSP there. On recent platforms,
>> context banks are available wherever SDSP is supported. 
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1273
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1884
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=c3c0363bc72d4d0907a6d446d7424b3f022ce82a
>>
>> //Ekansh
>>
>>> Konrad
>>>

