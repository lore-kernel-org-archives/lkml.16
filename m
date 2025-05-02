Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D5822E3FD
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746178714; cv=none; b=QE7J1PkB8IFzzUlM9dBccXNMVGUkpdk3C9s5j3iXHy+lJ3JRWVmALRQ5KrwpTM1K9DX/VftUn4NmZituAZNydCOgTCnm+qxWVDmKJx2MEDG65nZIsHuJLpJbAA6bbhHebyocyaqYbA8dV6WTg+Y1zq2LVgcBRHGkb3bUpd/oF2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746178714; c=relaxed/simple;
	bh=NLLvyIIHNwAtuEV0aozIKj+fc9Qr8j0sIrTyMsGIABQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ouEdCpEmZANhy+D6tXPzRYtYdqImXmAKrPHuzUCaoqTaCAX/RzQBSbGRaUFKjlbhDEAsSqBKzSh5750tk9R6GuT8rDkAMF4xESyAgoOd9JFSYUMxPxx18+o9I5ynoaQyth5VXxkvrovUsM8I3xjo0aycP2UiHMFI9n0kEAs5Nec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uc7bBJNO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uc7bBJNO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421N2rh010250
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 09:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b4WiodssTyTUeYCWBBLu8Exg0/NivSkSrrcMmrg5JIs=; b=Uc7bBJNOUyIWqKJZ
	rIgngeVBkRqeHblOE9MEJXJlTP9CrLg9Bqkzd1O7aO8O9C+RZLYRzHN11w8zs72c
	69p9e3EqSgRmRjbcoda8L+pgpJX5xHUr6DaaYW0kdlXq0+Mn8fhk9I8c4Tt0q1N0
	Xbn9jCBaOgz+XEq5qvnaPggK39c6AjJS3SxByxGyHx8kdXPXBpv/sLJxVP+rXvcn
	GpMJHRrEks7wjB6VRXUgPidUE+LXbFYRrDexTcZAr3WKICR9QwcYLw8f1ntYDryL
	DUHdUGfc0ggnu4fBRBKgLVMWkjNgem2qH1O7Po7whg8G/+xZFgn1TEXYzcnPVbAd
	i6bbVg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u9yqk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 09:38:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476786e50d9so5449641cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 02:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746178704; x=1746783504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4WiodssTyTUeYCWBBLu8Exg0/NivSkSrrcMmrg5JIs=;
        b=b54Tu3sjnI5lobvDA8pTuLLr3MgzyiGs2hv2mh7x+tk08sYmlYdbx9bOQUDqFfvBU/
         XIW5KHTO/qKI6CxEM/nusbdO48a76+LS+kUBysECY+fVOzjYYcmejwbaZrgekb1WEZzd
         bI5gRt4Vgs2Tl8ObHwx8vQRWxIVqBzW2W5lrF7O+iz7GpCibGyQJ8dgN/LCuCLwpHuYL
         ePVHfLVLVCvUd+pa5eJ0ovh6ixzRJotTkPLvvQeVkRZcMGsc4auAknIkNE/RjDDabUMA
         SAJ9bVIjUKEzPKFgKDOPA8o9q7ILE2Lz6uB3Au9cQPhDUea57a8P9rzt0a+lghRRmLr3
         jC8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoxRRtvaWeY7D+LymXmHxrrL1gJ41vlelG5IglBAWmtoyOaMvJ8+QnVXYWvpwW0SytRVz9eje+rn2GRl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlgfYmjFdaijZ5Phk2d/pzezYvsfdTMgIMhHHP4n4gDFNdQw8f
	9uD6QEfBKGaSDl+ZxN6tntOUzu9jxz2psCd7Uh/IGN0zqh2cFE3Y0PbL90nRVLL3XdSpm6VkQjH
	n8mEk7d/DjtGBJtILlXApTL4G3PJ4UbWE9nvLM6qCx552AKTVDn538kxgwr8VKOQ=
X-Gm-Gg: ASbGncs1w85hZ4qXCo4EmdgGc4OjziTIaDnXY8FXU4iBcP/viA9OFAOG+izejrsbNSh
	5Grq13VUgItseZnm2b4vFNC1QoT9tbFzSr/GyQP9uztHAI+kiIu2U1kSYSAqZ7YM5LNrjhfrXeJ
	c9S/Yjzk4SlHrp4V1iOwR0G1SeMSCkogVrolKgPZd8UTgr9cgPmkDTrdUbfUlOSKumE1zcKuKO0
	ECrX5zfX75XhbhB23MpUndcJk1IbF06EmrxpkmFyBnLvW/0vbvq8c33FVrXctMJ/DGZuaXSattO
	Jutese0wmzNV+9gdeuYoPmsU+DPAYa3ptsAlpQVm2B7zYy/kZjLOfkMd90F4t1FZg5U=
X-Received: by 2002:a05:622a:107:b0:475:1c59:1748 with SMTP id d75a77b69052e-48c32ac7ee4mr9761991cf.11.1746178704307;
        Fri, 02 May 2025 02:38:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGplNT6UL2AH5Q6cD4nnSucsQ4tbT2oyVU6ywNClcUBdOxGbjYILgTlk7z1kZTgo/jqQ6unpg==
X-Received: by 2002:a05:622a:107:b0:475:1c59:1748 with SMTP id d75a77b69052e-48c32ac7ee4mr9761891cf.11.1746178703973;
        Fri, 02 May 2025 02:38:23 -0700 (PDT)
Received: from [192.168.65.113] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c01b2sm22103166b.109.2025.05.02.02.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 02:38:23 -0700 (PDT)
Message-ID: <10f69da3-6f94-4249-a8f3-459dc48fa5e1@oss.qualcomm.com>
Date: Fri, 2 May 2025 11:38:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
To: Alexey Klimov <alexey.klimov@linaro.org>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org, quic_ekangupt@quicinc.com,
        krzysztof.kozlowski@linaro.org
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250502011539.739937-1-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eVLS0cB13W5lRYuDKZ6yW6QwUiJ-00XH
X-Proofpoint-ORIG-GUID: eVLS0cB13W5lRYuDKZ6yW6QwUiJ-00XH
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=68149291 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=i5LmXQDNGShexaeZTkYA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA3NSBTYWx0ZWRfXw9p36eUY6tUa P9mQIKRtINZrszrwvGMYAUvD7IV7kLyDckw4KbhUFiR6mj/NoVHeywcuTFoRt4u23t1x5GUaVOf pqKbRsPAbsHZB61AfXi6uuH/E2TqPbF4Q4LcRHLcSb9IlVk3UkfL3LXpnckmnnZNTeo8kayoVkC
 ATIh3EuOYf7/Zd4hu8LuCHPxKkRzriboxhCwCgnm4G0Vku+F879tEWv0a6r9rbDXnN0j8BUSRlh KLoDM8iO0kuvs+SGn+W8X/lVhBE0J8XL+MhWrZ/nsV+LGR5nMYtvv/mErEFqcZ7O7C3pdN7d6pN /JyhJNnMlufqR67kT0F5ZixzvNANCeMKz/NH9Cy/Wd9C8k7941Wm2Lk3tWRQL3Y5oTzaFkQQ03O
 yfAISPHw8gqhF6HNcE7aHvcE89fh82LbhALwgfbzWMmZytELnfzOS7H//K+4qx6H4es+2584
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020075

On 5/2/25 3:15 AM, Alexey Klimov wrote:
> While at this, also add required memory region for fastrpc.
> 
> Tested on sm8750-mtp device with adsprpdcd.
> 
> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 149d2ed17641..48ee66125a89 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
>  			reg = <0x0 0xff800000 0x0 0x800000>;
>  			no-map;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> +			alignment = <0x0 0x400000>;
> +			size = <0x0 0xc00000>;
> +			reusable;
> +		};
>  	};
>  
>  	smp2p-adsp {
> @@ -2237,6 +2246,67 @@ q6prmcc: clock-controller {
>  						};
>  					};
>  				};
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";
> +					memory-region = <&adsp_rpc_remote_heap_mem>;

IIUC the driver only considers this on the sensor DSP

Konrad
