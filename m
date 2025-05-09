Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CD521E0BA
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746797508; cv=none; b=h4b+7HPCBJqZA7I8QLDO0KSlkFJInEQpy1rxWhbkUipPNCKT0KuV3KeJKTQfeAOioUOyEAYVX+6HoWOBHKeGDafzL9qYTimwrsdsIeY4vsVAUpPJocB0BKJ83ypGQ3apLCmD/bG3NKNTIP82QpCPLVQ6V7D8X43GwRq+oWEnlfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746797508; c=relaxed/simple;
	bh=QpUpPbG5svYT68qq1x+MaBeqBT1A0NlqpUGMuN3j95I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbFYZqhOcCFeVs4uqgjNFMI8R48UnWe7COoLCDt1zcUNDKxVx+rOqzCL0tCMoUU4/x5kaE1mnkUSDVsaOSXB6iFCYikK+Pqt6ROqD6tVH4bVyaC7VSh15LDbMspAJXFHtApZ7hvPsLxV3ORQa1yYRHTd6SM5N0Ax7D3iEztUAVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aUWlu45A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aUWlu45A"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BDqmG010675
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 13:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H/mFBQYhKgbj0hFzRcljV/UBoTZzDtA2j70YoMKBcnw=; b=aUWlu45AWReBAs8C
	NkJlMLyVy0N3RHeudCpffh6A38sQTXir03AJYx50K4JnnfRLz2vjhg0MchQzZtLo
	HBY1bP44z5PVsMkUwgLNjrc886lTsxS/1O949AVP+gTkMcgGuWM8N1/qU6lwseBA
	zjYW8Old6otzLv9udA7d9Nn+hUZwYSS4T+I9uRr3tVzd2LUOU85LtWlsnJxkY7ua
	/SrYID9eofFuMZBWI+mXf9I6AB1Tawd7OgjYOjCVRED/LEQdvTGSiMLeKxTwNb+h
	i0aWvND4KUBRsV5UjeGsfFtSBZ45RewMlW8X5C0YSKlfjWtJd4TDMbZob2NfpApo
	uzHJaQ==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmmt1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 13:31:46 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3da720e0c93so46621105ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746797488; x=1747402288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H/mFBQYhKgbj0hFzRcljV/UBoTZzDtA2j70YoMKBcnw=;
        b=X9LT7qT6egDKMTKkfbMctr98GTu568T+Z5uuZAqCYf7uZomKDtN06FmBQWQPUz6Eur
         OSuyTM5PYKETExZZP9BawudmVLW/M0sKzPEyILrHJKUB1zM9oA2+E0897Y3dgT5cRvoV
         StaKETcSHryWBbHTV9/P3j0qmBdZRRXmg6YmghVJM9oDA6K9awGbuwS8BOIgMrTwsWz0
         1OpHurkX8rtNJfTAWoPtLODb5XAMzzeakrKpIAigJlpAN5nUQ1T5sNYkNh7uBfO5owVh
         WOUjC1q63iAGXv5Z17dVR94TUvYv46CowPrLC3m+H0+ut0yViooOsbxORebLhk8ketYE
         VLKw==
X-Forwarded-Encrypted: i=1; AJvYcCUtUf59ZBif92M/w7JX9SbGoKT6KJYQNqp/scReF413XwsjFVrNq4+mWpnaVSfYyhaq74BBQdqxTHH+ZRk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx47e3BKfmnerGkhC5wvzwS0RwA3fygLrCDkSBkNoItn72ubpG7
	SygcItXdKK5AkidIwbSFD3EIJ1Q6x4LDUICajZVAzM3WOaFo5uqjQ2veoaTIKPwPshrqeTJ71et
	0ayKakhBY01BalTeFKyI1BTwEXE+3IeDCK8qXnz3yxtQ5VRWcYMF3P4fQlHC22Sw=
X-Gm-Gg: ASbGncshz/6w8uFPPcxCYsPLYs8KHAJpY+Jb7mcO6hdX5CPgOosSxoH6qM0i1xq8AtU
	4IaC4JnU/xGBEMm+w9BljykD0RXDsOv7DD3fl2Lgdoc2hvteY6JugywTqzXAUHgRfueJ+iod7bM
	6DE+8j+EQ1AH4TaH9YwS4qI35h4jEi9k60ate78TjvTdqN/xYrv8IOmtuzktIgWi4Ztj4Is8PkS
	q8aQRfMWGtDbvp8DEaRsRZihEaKl8fTHuRSHiq2W/oxKMRiVvL0tl4A56HpbL/3nkIkQvjmtwsT
	PP7Lb7dLS8EA34PL5ZdCAjCySyhHgSWf6uF2Dg==
X-Received: by 2002:a05:6e02:214b:b0:3d9:2aa3:fe2e with SMTP id e9e14a558f8ab-3da7e1eefa7mr40722085ab.10.1746797488427;
        Fri, 09 May 2025 06:31:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKXDET+rSLEQgjqZr+KTAcq1z75SyEGSZHd2zD6MhrKtJtI7oJokPFT73x1xhjijYU4XXf9g==
X-Received: by 2002:a05:6e02:214b:b0:3d9:2aa3:fe2e with SMTP id e9e14a558f8ab-3da7e1eefa7mr40721625ab.10.1746797488019;
        Fri, 09 May 2025 06:31:28 -0700 (PDT)
Received: from [192.168.68.106] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2fe6sm3347590f8f.58.2025.05.09.06.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 06:31:27 -0700 (PDT)
Message-ID: <90a1ce3e-140b-4076-b34d-9545d1b0c568@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:31:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
To: Alexey Klimov <alexey.klimov@linaro.org>, ekansh.gupta@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        quic_ekangupt@quicinc.com, krzysztof.kozlowski@linaro.org
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
 <bf9291e1-bdad-4b4d-b527-b21963970902@oss.qualcomm.com>
 <D9RNPEB01S78.24ONMK7M7HHSK@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <D9RNPEB01S78.24ONMK7M7HHSK@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681e03c2 cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=kV5Bgjj1i6tpFY9TKI8A:9 a=QEXdDO2ut3YA:10
 a=mHQ74H5e8mo-RpSg_uaF:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lfA-n7lff-w24WbwmoeQhGPDkLzsm9oN
X-Proofpoint-GUID: lfA-n7lff-w24WbwmoeQhGPDkLzsm9oN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEzMiBTYWx0ZWRfX4WR6b5xpw1V+
 6N4XghlyWPnwFlcrepxlBC5V4NJh0/mxYB4b9y/jcd+yykXs6395RwSF1Mc1TsGHTLQOOBzbbkg
 363uILBFte40FltzTPODgKeLpGgz3ZizbDsxxniQRUNf1kOMlAYoRvXO5v08VkoYwhFaMA2JuFr
 7LiECj1iQ2i8R6An/UUsnQBkMjuFQPOWfSXCBDzDiF21woaXUV7QhiVQHxImUnlnTi9iW2OplWR
 H81RQilxyqYLbYMQt3FkKBxpnmt2krYBBy9k8tQUMj4k2fH0MM/EMrSnZay5V31FCKUCpVyHqxm
 UZ1QqiXfoWKkrbI/q9XO6si5M78sKQQDH0I07G2vtw2ZVigSgMVd9vSeGWNdqghiQjr9YzFMrKJ
 e9RaO8O6dVLIXs0bY3PIxPnES8ZB+qIxFJAPJJoId6liPJQ1sEhbGFB3TatfL9CkDzoIA3s/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090132

On 5/9/25 14:16, Alexey Klimov wrote:
> On Fri May 2, 2025 at 11:51 AM BST, Srinivas Kandagatla wrote:
>> On 5/2/25 02:15, Alexey Klimov wrote:
>>> While at this, also add required memory region for fastrpc.
>>>
>>> Tested on sm8750-mtp device with adsprpdcd.
>>>
>>> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
>>>  1 file changed, 70 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> index 149d2ed17641..48ee66125a89 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> @@ -7,6 +7,7 @@
>>>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>>>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>>>  #include <dt-bindings/dma/qcom-gpi.h>
>>> +#include <dt-bindings/firmware/qcom,scm.h>
>>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> @@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
>>>  			reg = <0x0 0xff800000 0x0 0x800000>;
>>>  			no-map;
>>>  		};
>>> +
>>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>>> +			compatible = "shared-dma-pool";
>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>>> +			alignment = <0x0 0x400000>;
>>> +			size = <0x0 0xc00000>;
>>> +			reusable;
>>> +		};
>>>  	};
>>>  
>>>  	smp2p-adsp {
>>> @@ -2237,6 +2246,67 @@ q6prmcc: clock-controller {
>>>  						};
>>>  					};
>>>  				};
>>> +
>>> +				fastrpc {
>>> +					compatible = "qcom,fastrpc";
>>> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
>>> +					label = "adsp";
>>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
>>> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
>>> +						      QCOM_SCM_VMID_ADSP_HEAP>;
>>> +					qcom,non-secure-domain;
>>
>> Any reason why we what to mark adsp as non-secure domain by default?
> 
> No particular reason. That's what we went with on other platforms, so this just follows
> the same. If we need to update this flag to secure then most likely that should be done
> for some other platforms as well.
> The only thing I know that adsprpcd + audio pd works with non-secure flag.
> I can try to re-test with secure flag.
> 
I know that this is loosely enforced in the current state.
We want adsp to be always in secure mode as it will have access to some
of the IP blocks inside the DSP other than just hexagon compute.


> Ekansh, do we have any preference here regarding this?

@Ekansh, we should provide that clarity in dt bindings.

--srini
> 
> Best regards,
> Alexey

