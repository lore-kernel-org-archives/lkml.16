Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E060323906A
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746813779; cv=none; b=O4c8F6BiP58Y9mQF4RFfybARXUwv3NIrHdRiqbOHc8gob5aIyiLBM92NDm80i0ksWcd5PSoJMaWBrcDKZlsrY2Lb4QKAJdOkp4dSR/6H57JoJzW+4HgUXImH7bZXhcNPMWiT9WckJsKIXsZU0aGoTFYRxNxUT/tEochenQvegek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746813779; c=relaxed/simple;
	bh=ZIcyS27rQ44wA2rhUwsJcyfukwsta/XXKcwIdNEYnhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=htMQ0x2f+8SiL1OdEqV8WTGINUjHSn0Ey1H4CzOYTbGjbgvKfA+7Dg9TI4qrMjiDT8EcGFm2RQdsgqAXKKVMkW5S6ssjUF1P/KdiEpah5Y4fUcNDbWoUVh8GVKk5DvSDjkh1AdhYDBqAg+cHOe1RzpDODiQQddvL7RdQ7P9qjmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mDasjPpM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mDasjPpM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549C63No016175
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 18:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2kTzsEzvc2vSlVV9w7qrpMW0vs7WPrV2tLOCqgo7oM=; b=mDasjPpMC8LUxtnz
	ne7Nc2ZjrGXV2nFeykgiUwnX8vz429Bx/65i5+ScsnW8gWeZhNroBbMHgzy8LqtP
	rwk+esEWBO95ae119kg1xEM8g664kQkiZYLoON1UCa4MkFMS/5+FZQ8BtvVlvV77
	fnFEfkaifXjQlNmeaDNWSscbbRRzcEyOQmbGAf6cw7c7mPuyLkzNu52t+JHcWfz5
	PRMA+iqtA3EI2QAHEldfNf5dygimjjiq30whgMxTVNa2XwhRQRYgCB9o+Zqj/A2Q
	h0WkOCeS9hrNNDnS1vMh/cORsbzCTM1gdD6llQ1b6f2oySyu4xci9NUip3seFSQL
	V1ESyw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8wd89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 18:02:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22c35bafdbdso37244475ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 11:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746813769; x=1747418569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E2kTzsEzvc2vSlVV9w7qrpMW0vs7WPrV2tLOCqgo7oM=;
        b=qRUycxbtRhytV+XS7f0ZDShhWdrWOGoLr48+i3/9FGPsuKdubCWF2WpdXPZG7MR7Ia
         r/2SGgvX+IeE6g5e4orLHXshuIL0knl3hW9OQmvBZQxmzILx7pVWTq/UzsUDXeeQAwlY
         Q+zkT/9VmY3HkUKjZAvcHHq1oQNZ/doLqx9S4p8UuvAJbLo/OhNDwW0EI7IK7LJLIbb/
         TCvIZpgDD9EPGoJYGtlqx6bN+nROGnKf35uLFK49zsjaKtI4rV40AfmE/vAU1zKIRROl
         SeuEXl4zyauMSQL1jrWsg1MBlu+Ux01yDDsc6Cpdi/ZVAZJqlDhc9OFo+CLKd4cHJ2js
         rkSw==
X-Forwarded-Encrypted: i=1; AJvYcCVy405vd7Q/jnvvC0RHvjnsbalLWXBbacK3C7J8qqy4gRBUvxJ8yhMYwK4d+wooHRJJrUDsQp+m7YQ2TxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDCQLJYpYLqKb9z/Qr8HK9dyPIV6yrTWqAKHw77JZB++Bi3SxS
	5RBDKDcZAXdKN0qo3eQ4JO/uVL0uNa0F/w4t8MjTZeBJJ4FLlRcHT6Xsy5ZLCwW/2GF23CRMZkM
	ZqvP1dw84j3aSdyPh704xd4kxov/91j0ailoeaOQxno67yYg9fLZ4Vv8mE3aiTV4=
X-Gm-Gg: ASbGncsowgo9OjtHBfGW/lF7SG552thdDTCvs6WtNHC6DBZ3Q71qkYfcVFHxBsw5D9s
	H/rSOJBrtn/UKXdOwbEZLyRNGjsRsmf0uIjwjYElL61RlWpKdoCdGIXtQlrtKx79NwCSKOKXIOB
	qogZkM7AGCbosDhkhrpcXXdzQ2pGnBgiIzPgQpAR9R720oW1w9T6JlCeWcKSzeJ/WKm18rzO7PB
	ecBwclD7WsLspVNfUl2bKciX5R1oo2kILlyYnaGyiNwlNrbPCSYv6lCVPM033tR/hyzbYgDE5wj
	PjhUd2wtov8FTHxdq3e4XrDoFqIsBjzeJI6mrQ==
X-Received: by 2002:a17:903:46cf:b0:224:2717:7993 with SMTP id d9443c01a7336-22fc91c19a3mr53596585ad.45.1746813769412;
        Fri, 09 May 2025 11:02:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMxsQC/modTBtbEYUAjzYgXPOhyKCnAxgn3ELoCoHFHkwbP5OWPkbs7K6ALzvvJuxOAazQPg==
X-Received: by 2002:a17:903:46cf:b0:224:2717:7993 with SMTP id d9443c01a7336-22fc91c19a3mr53596045ad.45.1746813768988;
        Fri, 09 May 2025 11:02:48 -0700 (PDT)
Received: from [192.168.1.8] ([136.185.65.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc828b1bdsm20287155ad.169.2025.05.09.11.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 11:02:48 -0700 (PDT)
Message-ID: <125b4e86-8a72-4338-91cf-08f7e988b167@oss.qualcomm.com>
Date: Fri, 9 May 2025 23:32:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        quic_ekangupt@quicinc.com, krzysztof.kozlowski@linaro.org
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
 <bf9291e1-bdad-4b4d-b527-b21963970902@oss.qualcomm.com>
 <D9RNPEB01S78.24ONMK7M7HHSK@linaro.org>
 <90a1ce3e-140b-4076-b34d-9545d1b0c568@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <90a1ce3e-140b-4076-b34d-9545d1b0c568@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Nfao6Y-ejFleTm1I7t6ydSXnesKoCega
X-Proofpoint-ORIG-GUID: Nfao6Y-ejFleTm1I7t6ydSXnesKoCega
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE4MCBTYWx0ZWRfX9hzdsZrk7bTe
 BdarSa8zgSnkyWjtQvP1jgxdyPrjmCDef0krIhghU8rhtabMG92Fsmuo9mZ8i2mQWXGRVI8K+eu
 84bZIjyIR0/awBXKlmF0o3QlYnkahnxkwqZWbSqa4kL9dG2wezgwaUOYJYG/tgSf2wr85DnEra/
 R6DRspPUV+GT0haQ1gnkscIjCUFwGGGFwNDrH5DzYoGtZLOslXZ+bkriPcCuHAb9xN2umS6/lsj
 ou8PRMfOcJ7DI5hBGNufCh1MZb3VoTPmfa49FQxDNq6W7AkSuiwo6eey+AWF/MPlmqwGLKQWpM9
 vq331skdgXqVGZ2qzF8h6w2Q5Nl64eRbDDQyS7Jbdox6RfiFLFlOIfrBh691tIAeYEXIUzd1FAm
 ADrsoupmmMgCMfZbsmNLrvHUUSqtE0b3hXukVpoqX86GecreRwr1vSfSHIq4HYHddxmAPl7q
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681e434a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=20agjGjj1uVRDl60VMvrOw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=o_OlpikLB100usM1RrUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090180



On 5/9/2025 7:01 PM, Srinivas Kandagatla wrote:
> On 5/9/25 14:16, Alexey Klimov wrote:
>> On Fri May 2, 2025 at 11:51 AM BST, Srinivas Kandagatla wrote:
>>> On 5/2/25 02:15, Alexey Klimov wrote:
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
>>>> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
>>>> +						      QCOM_SCM_VMID_ADSP_HEAP>;
>>>> +					qcom,non-secure-domain;
>>> Any reason why we what to mark adsp as non-secure domain by default?
>> No particular reason. That's what we went with on other platforms, so this just follows
>> the same. If we need to update this flag to secure then most likely that should be done
>> for some other platforms as well.
>> The only thing I know that adsprpcd + audio pd works with non-secure flag.
>> I can try to re-test with secure flag.
>>
> I know that this is loosely enforced in the current state.
> We want adsp to be always in secure mode as it will have access to some
> of the IP blocks inside the DSP other than just hexagon compute.
>
>
>> Ekansh, do we have any preference here regarding this?
> @Ekansh, we should provide that clarity in dt bindings.

qcom,non-secure-domain should actually represent the DSPs supporting
unsigned PD(low privileged) and secure only supports Signed PD(privileged).
I had added some details here[1] also.

I agree with Srini's point about providing clarity in dt bindings for this
property. I'll send some changes for this.

[1] https://lore.kernel.org/all/412fe24e-ce70-4733-ace5-d3fbe43476c4@oss.qualcomm.com/

//Ekansh

>
> --srini
>> Best regards,
>> Alexey

