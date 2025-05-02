Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA6D241667
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746183122; cv=none; b=N/iWmZlcebQE6U/sLu8lJ38c0xsAPD5RIwIm3p1RXkxUZCEP5RMlCTW5P4E9ybx651bGQQDZvp3IcrLOpEWs5qWZdQEyGHf5yr3hG4WFTRKNGXXHWC4EtbeAyFfd5g8c5tNOB9hIE+uYkjrYSoKcRTNhO/kjWGVuZtZK7ZC42o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746183122; c=relaxed/simple;
	bh=LAAsQFiTjrism+q2nG20wPccf5TbyKe889K4SJxTo20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MNodbrKzceIpvv3FXg/5RVzfn+kZ2DeCPDHLq+TlfJ/UYNdzDJsiU808FMJqJjR8VmhV9HGCBIoFR11daMwET0Sx7NSlBmSAD4Ywqq30Gc3Ah/k/P8LSbfX75ismo0AYl8hEYYG6gNhgJhsHl2dUhMdo4I68pSBPtSrTVpY5VbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkQIcRrX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkQIcRrX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421N1Zd001408
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 10:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I88an99AIAvSoT+DIkAkztlH4kdpnjQu8t+ZJSXD3iQ=; b=hkQIcRrX2giDwKH+
	kQ/b4xipP7cIz2jrTvMVDal1Gjp7Y3P1C7nfJoH3YY22cwXEdKEPa/QR40wJ1tr9
	yeuhuTHkzJgg5vXAT5UNJrxLBbPDBpXAmHEOOvvZidVkFctRtpKVpfPYMc4KtyOk
	lljFrPEr14bEgVHufMt7yV1Wt83r380txK37csHDZ8CCmJp6Ce3helWkbmv86zAN
	CQIOrHgbxrYI5/WgUEspiGEAwuEA1gPqGRZJkzO3/qFCjERAAUmEl81Al4oQUbCc
	SsVpb8kImU+QxWdWviC31RyTEfSKzTP6diMWdwLQovTTQ69EvPfXHfDRuUV3PV/c
	A7Hh4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2g2ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 10:51:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e6f5so481353185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746183114; x=1746787914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I88an99AIAvSoT+DIkAkztlH4kdpnjQu8t+ZJSXD3iQ=;
        b=Km+a7qJt1XB18EQnryOAnA/842qpeJpdJEYktqHtxrDdhaxcvTZb0ckXPq5+VH+q5H
         8F/cc9KR1f6GuLYoZzpz3JwKvSByfbEXLcEdLAGAWIrxxyvC+8VDa4bNjKoM8JMruQiA
         3RJOENhGwKCBAF7R7zCZAwxdV8BFRTnNiIb/kNibc0EqkSI4f/gZwDH7eoW4bUeHc5eZ
         S17w/FyKsE+q6fSg8ROgW8Oe+PFVUta6ETmkNECkZcPjDnTdynwVblk4zpux63m/tvru
         5jLJWaCXUklwDCZ/QrDniSBxdD3XJ0vSaMIfsFRn5xAdQtxrMn3Uf8/idhPOkJA49wV4
         pIMA==
X-Forwarded-Encrypted: i=1; AJvYcCXDeLnDXnaGHHGU+g88QtPekc8hhIOmikyHqvtaJH2Kp6Lw0AgwJLEzWSxjEyiWiNTPq/OSHia5Kpn9vtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4lfQMW8bwFkfTMugAMo1riir8pb3pceYk7CLSi9kP8KLq4qoP
	6RTthIhzxf76ELhXVG1XShcj9MJnBni2ReWAQzxijh1qmg3BQh3cs/Iyy1Jai4msVcY/j1M8p/x
	vR+VodmBUDO8OoIEUokZVWl6gbxEeCYHp8VPpHXC/fXT9GLPRdhPOBUfuWfy/aw0=
X-Gm-Gg: ASbGncsnQ0tK0e8mWe3J3IZPgAViRl15CR1tsLRJOn/8BuMouh54rk2aPbp4klaPxLS
	OIHMG800EpJtx7w5BMu+Sh5ZXrdzH2+1DUPfqpdyiRbOcPNPYF8Ou4hAGvikzdffiAEZ+KZf91b
	+/D3onEdnZETEP/UYyDBguBabwoKt6TCOnvKydUjqmXH0jOg06MC/hB5n1iW/GGer8HU006P7JR
	gEERKm9TldlJ6UI+oVqymi2szE1cb0snE+fqmFEP+xK8x0BCcPEtQagy+4FlUOoPqWEyx29IDwa
	v4Nazd9vXnGncwT/rVCLgQrqs8IqCeHgRMU0yg==
X-Received: by 2002:a05:620a:460a:b0:7c9:4bba:1ac0 with SMTP id af79cd13be357-7cad5b22d62mr380124185a.9.1746183114611;
        Fri, 02 May 2025 03:51:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEq4m+dIgBbhLDT8yukudxbcJZtNknJH8dMUbDaanD4ZfImkcyIadgYrN9lw4vhw0dSwsyjA==
X-Received: by 2002:a05:620a:460a:b0:7c9:4bba:1ac0 with SMTP id af79cd13be357-7cad5b22d62mr380121885a.9.1746183114314;
        Fri, 02 May 2025 03:51:54 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-441b8a286cfsm40063885e9.29.2025.05.02.03.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 03:51:53 -0700 (PDT)
Message-ID: <bf9291e1-bdad-4b4d-b527-b21963970902@oss.qualcomm.com>
Date: Fri, 2 May 2025 11:51:52 +0100
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
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250502011539.739937-1-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nUYW0IHelal-4gep4uD7CYJvoxfjgAoQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA4NSBTYWx0ZWRfXxFEk3g1znB9q qDerA/I9kt9eFa1UaE997DVQvvo+V5LuaZA58o6pHJbhPL23eFpbXY3Iv7bMAUljLmmctOxFRWL 3oWdCdCr1MsRbqXtXdx69Zxxt1BYs4p7pNsHNiy1otMZ84OY7QoXxxQIB6nAbTIZc5f4tl9ujHY
 13FYwNHkDEKuSYM9eDY36wygwFU2OkV0ThMZwClImlEGaRxy898XDeKSh7JpjncecQ5sgmzGmsm p9BXKyyp71ZWXv5WbrfHq/VoxNu2+duzNxpEBqMExZk8mHDj1FopAFFatu1kXbH+/OgQ69qN9jK uveShqdY/x4fLiIRijE7b1Oc14cJlzEazILILkNIvHLi6OM88cO5BQGd1WgabPCrRGQUBF9z/Jg
 MjOeVAzUln2CgFOe/+v8egLh+S7C1tdLdTpJSNv2lmkO3ELoGTgdnbM79ihP+T2ZAlMb8+iI
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=6814a3cb cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=gH14mSXmLtDuaprCSZYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: nUYW0IHelal-4gep4uD7CYJvoxfjgAoQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=809 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020085

On 5/2/25 02:15, Alexey Klimov wrote:
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
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +						      QCOM_SCM_VMID_ADSP_HEAP>;
> +					qcom,non-secure-domain;

Any reason why we what to mark adsp as non-secure domain by default?

--srini

> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x1003 0x80>,
> +							 <&apps_smmu 0x1043 0x20>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@4 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <4>;
> +						iommus = <&apps_smmu 0x1004 0x80>,
> +							 <&apps_smmu 0x1044 0x20>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@5 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <5>;
> +						iommus = <&apps_smmu 0x1005 0x80>,
> +							 <&apps_smmu 0x1045 0x20>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@6 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <6>;
> +						iommus = <&apps_smmu 0x1006 0x80>,
> +							 <&apps_smmu 0x1046 0x20>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@7 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <7>;
> +						iommus = <&apps_smmu 0x1007 0x40>,
> +							 <&apps_smmu 0x1067 0x0>,
> +							 <&apps_smmu 0x1087 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@8 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <8>;
> +						iommus = <&apps_smmu 0x1008 0x80>,
> +							 <&apps_smmu 0x1048 0x20>;
> +						dma-coherent;
> +					};
> +				};
>  			};
>  		};
>  

