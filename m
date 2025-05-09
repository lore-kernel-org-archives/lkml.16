Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C7B2397A4
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 03:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746762161; cv=none; b=P6xvb4/rIJIeJCP3vN28hBUqMUaHv85xntfDcSCZcL8Q3jSyEex0fZ10kcwSBL+IETfqJaN++b5iY+FCjQX87VACpIDw3dWwRz6UZ/LAmVDgD0GF82ODDg0AqXPfzmwhhNv5PAx8NaAvRlznKruNmSaeIThYJMrC+lNzIrWrfRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746762161; c=relaxed/simple;
	bh=4m8qZlez83GPsZkIOkUCIprMysHkopc6yETHuW1vvl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+44m4R2xgHhf+5xCps5ym74E9JBOAQwKtkZtpUxCrxjnjEfPpoK5tJVJcuw3TuX0Mbittt3AUkZjpOT0OdOBbC5Gx1zQgHo4qpaAtWEJgN2FpFEbJqu6QbNStg3l32Ckje2GwxkSGZXrL0tiG9fb+3rlAn+9z7BkzK6+U7gl5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RQOwTuuq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RQOwTuuq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493314J002620
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 03:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KAbkKPbMSKprmz0JdskNr435Dx/1qFgzrVdHZZfZKHU=; b=RQOwTuuqzloYVbjt
	wfGxGZFqXSD+qF58ZQu1u4fc8XokbQVB2ibH7qOjXgXUsPOD4XOwoVxP6byWH2ag
	m8YeQLSrt4tfJgLEBZR3Um5rcoWGPF0Nydcr06AoARQAFKNTx/3e0nGkkNhzJ06N
	yQNAKNQFDpMjVf1AKAS33Cm9V159ijIzD0v+S0GTfud+NPdzdQWTqmx73LkzP2l6
	DpQiSo1nfhr/If3PUAnpbqUzoSamFRkooJ2Yw5Gq44Lh3lm0FSFN79pTwgirHhXv
	0+E5ODG5ZtZzk8LVBQXQwdV1dZuFDnMAxoxEN3hqYdK82EZIg7ps/SIJvsz+bGHX
	/RhDDg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5b8g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 03:42:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e6c82716dso12219675ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 20:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746762157; x=1747366957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KAbkKPbMSKprmz0JdskNr435Dx/1qFgzrVdHZZfZKHU=;
        b=ob3h0dE4RABqFUP+6VZ4pM20/GfCvb5FGYZNLj3nfxh2Yph9MdZCWoN8ef4vOlq530
         VJOckLWbYPwY2PcOBHCAa9GwPcg434OMuxwzQufcrD30wnncwYPMzDsZH/lT00AA322W
         WfKgLRFX/LUdYt6+DuZ+VViELP3uHBIdpYH3ERs55SMe8TxEDJv6d2VAH7nvhIgQuP5y
         hAEiqM5b/3fz6xkpdyzAlkaf98nQtPCHGWkm3K2VsQCTVnZ5v+x2DCGxELBZAlaA4bho
         DSLVzViIo8UgTCOIdmWhLLtW7rrFc1Km3NVvI10PqEjM51V7dfLG6Hcmmcrke+ViH62d
         2iAw==
X-Forwarded-Encrypted: i=1; AJvYcCVgXGGtEptdP4UEawjIm1dFcn/gXdDEV4an/XTlrQcf1QgW9HUnrUKqZ0NNkPYPi8mutRHL2sY3/+rv2dQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeGzA07wDXms7U7oCPH/XG4bTEx7jg0fEGJ5B3RuMEuPW3bVmc
	LqCJ7PaYTbKrjPA5L1uxhHiCud9kUy404WyQmUILm55bPorHhroqiXzympf1jb/3QjL/xIcwKrr
	X+YvCOCxazJik0Pw/19V9X5CeCAVLDgpmWHE+C+tIEuyfJaJRC9XLnuVfCn+O1KnMsYx96JU=
X-Gm-Gg: ASbGnctGEUvRGvQovTKDnxOqRCZKExLOuG1RX8jydMvmRG2+fVFRxQX+S7jjETW5sXy
	rurHyzDFrWiRiicy3Jk+ob52UXWEx7b5/sylkG88AZcau+aWXpLFwzoGGijrrm2KomkZsL6APCW
	5Hbg3X0H83se9B5hReoGXeFWIbZ/AOdUlTqYXkfWhGucmiU9QrBqnyBOgFnNVVA7UX3j6Qt+3Pf
	/tVyQV1xDTdmldc6GXmOejd+nYOCsVxltO6sFc/8LLHvqbjfPE/LVDNiKG8IiGoGhD2DFUCRhH9
	FIpUiWiA2mY2LhZekCcNPEastrbwEscEzzDwq/U=
X-Received: by 2002:a17:902:e806:b0:215:58be:334e with SMTP id d9443c01a7336-22fc9340996mr22855525ad.10.1746762156525;
        Thu, 08 May 2025 20:42:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4wxNijB1mS1rnTn8DyUoqjr9BdWXO1obvQx8cdVHGm4h6PLZGFku0M2upjvKv5oas4BRubw==
X-Received: by 2002:a17:902:e806:b0:215:58be:334e with SMTP id d9443c01a7336-22fc9340996mr22855215ad.10.1746762156114;
        Thu, 08 May 2025 20:42:36 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829eb27sm7385365ad.208.2025.05.08.20.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 20:42:35 -0700 (PDT)
Message-ID: <bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com>
Date: Fri, 9 May 2025 09:12:30 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org, quic_ekangupt@quicinc.com,
        krzysztof.kozlowski@linaro.org,
        "Bharath Kumar (QUIC)" <quic_bkumar@quicinc.com>,
        "Chenna Kesava Raju (QUIC)" <quic_chennak@quicinc.com>
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
 <10f69da3-6f94-4249-a8f3-459dc48fa5e1@oss.qualcomm.com>
 <D9R4NCKH46WP.14C8F7W4M58ZQ@linaro.org>
 <3c0fea8d-0715-40e6-bed9-e0961bf034e0@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <3c0fea8d-0715-40e6-bed9-e0961bf034e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681d79ae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=tzvrueLW-kCl9WwHjGUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: AtNgEl_QdKOZEMB9F8Mz-yLi9kswXYKH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDAzMyBTYWx0ZWRfXyDspgJSYP3l1
 YKXF9IZazGQ+PI88fWrSQHUt8UYYQPDt8W/ebrkjfjOCr5MCAzhJpt7pwT5czoZwfCnI55f8JP0
 Dvk6Z0OLJI2B1cJy6BBOuWepFLotiIb5njhqkPaSErhLayxt77aJNMdAJipIrl9V9YfvXTroF+F
 KVjM+mds5vo6HwNDxNqvURfJkzZGa1t2S81+J3lF1b4nh52TqZ2nRuhPNDAUCZVKNi7vJjIJOpR
 uBF9OUcmTlyn4ZtRS4jLpFebDvpxG3zqcKjiFSXO4dOgGYZmYN0L17n8Xx5UJyB6U05A5yPG5mP
 uZg04EoCn+3WB/33iJs195ghiT19MGY8LE/aASi7nsXx6OtRwzWqF42mMNp+LL04vkvAXYhg7rX
 lkgqe6CHHzbHCSg0p6PdJPi971VBf0Zv+wG3Nezryb+jlENo+CLxq+TnAZcbq1AajZVJ61Ja
X-Proofpoint-ORIG-GUID: AtNgEl_QdKOZEMB9F8Mz-yLi9kswXYKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_01,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090033



On 5/9/2025 4:27 AM, Konrad Dybcio wrote:
> On 5/9/25 12:20 AM, Alexey Klimov wrote:
>> On Fri May 2, 2025 at 10:38 AM BST, Konrad Dybcio wrote:
>>> On 5/2/25 3:15 AM, Alexey Klimov wrote:
>>>> While at this, also add required memory region for fastrpc.
>>>>
>>>> Tested on sm8750-mtp device with adsprpdcd.
>>>>
>>>> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
>>>>  1 file changed, 70 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> index 149d2ed17641..48ee66125a89 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> @@ -7,6 +7,7 @@
>>>>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>>>>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>>>>  #include <dt-bindings/dma/qcom-gpi.h>
>>>> +#include <dt-bindings/firmware/qcom,scm.h>
>>>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>>>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
>>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> @@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
>>>>  			reg = <0x0 0xff800000 0x0 0x800000>;
>>>>  			no-map;
>>>>  		};
>>>> +
>>>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>>>> +			compatible = "shared-dma-pool";
>>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>>>> +			alignment = <0x0 0x400000>;
>>>> +			size = <0x0 0xc00000>;
>>>> +			reusable;
>>>> +		};
>>>>  	};
>>>>  
>>>>  	smp2p-adsp {
>>>> @@ -2237,6 +2246,67 @@ q6prmcc: clock-controller {
>>>>  						};
>>>>  					};
>>>>  				};
>>>> +
>>>> +				fastrpc {
>>>> +					compatible = "qcom,fastrpc";
>>>> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>> +					label = "adsp";
>>>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
>>> IIUC the driver only considers this on the sensor DSP
>> Memory region is required for audio protection domain + adsprpdcd as far as I know.
> next-20250508
>
> rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
> if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
> 	// ...
> }
>
> maybe some driver changes are still pending?

Would like to add some more details here:

Memory region is required for audio PD for dynamic loading and remote heap memory
requirements. Some initial memory(~2MB) is allocated initially when audio daemon
is getting attached[1] and this memory is added to audio PD memory pool.

Additionally, if there is some additional memory requirement from audio PD, the
PD can request for more memory using remote heap request[2]

The support for SDSP was added sometime back[3] to support SDSP usecases on some old
platform as there were no dedicated context banks for SDSP there. On recent platforms,
context banks are available wherever SDSP is supported. 

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1273
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1884
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=c3c0363bc72d4d0907a6d446d7424b3f022ce82a

//Ekansh

>
> Konrad
>

