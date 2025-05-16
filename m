Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0311822F397
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747388712; cv=none; b=a1NPPl1ulrgruk4WAYBF9u8mnvkZb6E+12ue+Hhy9VVeAa9uezw1VCxd7P+KzfSl5RS65CbMm2FVcA7gWpTIMyBF/UGAU5fyP+/5UFhgm2b9EA8vpNNFT60hQEhdFAoIHYFhxtPYwWldWBW9yuO1d1+61wYgtWKo1jMMbB4TgWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747388712; c=relaxed/simple;
	bh=HzsJEBiPWk6eDqzxwMfoGQye5xmzJYeJbdlBljOdl/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huqxUb6e8iTBX1LxIWiwCRqgym+0JZanRaHGHx3fqAhO06EjML/3KkV2mUKktuNX0yFxilCK/r3AzFVNjQ11WOXcxaOTqRUJ0mR0+31cpYX7DzrGMYR73Ml6XAxPMKMQiAENz4BYUT2pa9V1qseKiolGx7erudRV6ctcgyIkXfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lfJPf49d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lfJPf49d"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3jXYT024320
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDr4B1qSjg7htBqhVvqZsGzbBvRV/mFJiETbhY1xHpE=; b=lfJPf49d1DxmhEWS
	LZJ7IQPMhbQ16lyV+EJjNmmffXafF32XfqSTf5vvDnXjsnas/GCa3KRv5tFE3kKv
	TmpzvmSaDw9wyQ/VZ/It7wmk6Jup3WK0cE5wDPNmO/dUXsHAMHI6iMamb+1nWE60
	BCI5RyNrcwTsRbBhqSlPeJLvtSjMVKgfcCyJX66ZpUGd83AtIrRtwe/EckTS7ijm
	Hoqam4ndvtYS47qvK+Q4n14rZcrlB+mqUEFxBzHrtuu64veQAAta4u0HsHmEadnv
	0Ikm3/kgTI3AOJDWQ0XMGo/Uwqva3MBw3572du0aBHhGl1iLZLyD7v18R0TK46sx
	WPWQcw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcn1pk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:45:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f546b2eff4so4569346d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747388707; x=1747993507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LDr4B1qSjg7htBqhVvqZsGzbBvRV/mFJiETbhY1xHpE=;
        b=ST6hFinY/rfXXzZInbMF6Z5WvRb6qKpT8HbJYjIWbjsMpy7hcQ79zie9mN3lkQUcex
         8YfxcQLW41PxxCLYwQV6eB6OMwfuhbhFpchrCsBS5pSEz72w52WH/ZUPOjw8QnCgMPKW
         ynfg1QHfG2QS7djr8mEsfRtZYTuMFdLEEFMHwVzP7UuE9eCWeK8ftym13VtOb52tMlRD
         7EKBWVZrGCNVeWVhYOtujrJtI5NZaqkAcM9rxbiFME9aAe8Nd3YfnQ0kza0eEp1qNJRF
         jIOel5uwAm+wgYiZUGZJPIf5JWcD6ZEYGea6ZVhhlmVG5vxPfIIBChNtxdrjC0/tUqCr
         j7ng==
X-Forwarded-Encrypted: i=1; AJvYcCX1ydj+0Ya1e0M2jTfdCPdiwFvXQa4DJyhJ6tRYKOkPhpnDFVv9j8MZKjATdKcFyCp+j7Del4mEHuBUUY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiuMXAdMZqM/6AB93uV+F8YOQ0rB9Lfdk3zDeTacC+uxebqUce
	RqeyYZtokjVZCpO1zLZkSc9rjIakGpJhqiCSaaJHboTXRUmtsmEYejak/1nrAqZ1E5M/9T4VOc4
	OKPjyZ3iLu8xxSUZO/SACOzykSiIBBZaLZYmUolaQ1TvO1krEhu94WCNA9Bj5aYSTA4U=
X-Gm-Gg: ASbGncsyc0pG5f5+oBQCK4W/MZPk3m+zSWjLe5BDLc5KutBhoP48MCDY1RXRjcuWvle
	Pzh4OQUZSD9RwUe7fxwiJgpk6AdShro53ZVf+rhk4jCDMFhCnw76t2joLgehrZChGU5VKwWgUqS
	/usjlU7Ra6Dm96SfcJv0R/XF8t1+3ZQn+yrYP3GrfheP+eScpgXKFi32SFQBbbgu9ZH2l65noKi
	6XzJ8WQwwCVWA4Yq9k4U+S3MuGwZX4yuYogGGpySSdbnQtu/0Ge/WEaqRc36pEwTvk+mAcgfqXD
	xJcY4+2uCvS0ltNgjf6lEUEBPsMHeLo18aheREq95sRWIvUztft6Lh074E0BAt/ZQg==
X-Received: by 2002:a05:6214:1c09:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f8b0835130mr18906356d6.1.1747388707500;
        Fri, 16 May 2025 02:45:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGukMfVX+YRjpGaoj2TadFrM/2CD6zQuISXBA2V8u8zEJ5cpewzlRZSW1tBbMSTsJkqcx5YSA==
X-Received: by 2002:a05:6214:1c09:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f8b0835130mr18906246d6.1.1747388707101;
        Fri, 16 May 2025 02:45:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06eab7sm127556766b.58.2025.05.16.02.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:45:06 -0700 (PDT)
Message-ID: <0097b07c-3a58-4b28-abca-3e6de70ecf25@oss.qualcomm.com>
Date: Fri, 16 May 2025 11:45:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
 <20250516-add_qcs615_remoteproc_support-v3-4-ad12ceeafdd0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250516-add_qcs615_remoteproc_support-v3-4-ad12ceeafdd0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Y4u70EuAQT5dXcZpTs4f_JIqDXHJaRSP
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=68270924 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=O_pLmbuslcfqJQTE_gUA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Y4u70EuAQT5dXcZpTs4f_JIqDXHJaRSP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA5MSBTYWx0ZWRfX/IxrH5EQ7p/P
 Cv0TKV926JVr262P8UDElnwEHCf+jOk3hU6o/2h0paoqdPYANyc8hO1tih246sd5JC0UbmKjvgW
 lroUQE1CcqLPZFkbL3TU/jpAUlK/SzzZuuSTcyJbJYIrRKm9+FBofkDvb0qKr8R6shxyobqUO//
 8PVafA7/VMyOeL8Tec+8bryDAqKYfpoztwuMOwKY5pvG6OdbvGVifVZzGXxhu6pqH3ENABDNqoS
 Njsx6CCqIguqsAqmiJ+LcPDmMWzlYeG2g4DiuP720IZYW/+x59sjbt83pl7Rh2xBf5TXKLX4cdt
 bD6izIuuIJpuFBwdMGpp/QSNvp2OYybH6YipbIG1wT6Mo5mcuCfja98mXS6muvAAqGPhsaKt1LF
 bOX+3xUjfzrfYPRXfo2E3rtLUWVwHfiHydooIlj2v8ab5Y0ea0P2Bl2ZjidmB4Zb626u0e58
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=901 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160091

On 5/16/25 5:27 AM, Lijuan Gao wrote:
> Add a simple-mfd representing IMEM on QCS615 and define the PIL
> relocation info region as its child. The PIL region in IMEM is used to
> communicate load addresses of remoteproc to post mortem debug tools, so
> that these tools can collect ramdumps.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index f922349758d11ec7fda1c43736a4bf290916e67f..dd54cfe7b7a6f03c1aa658ce3014d50478df5931 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3290,6 +3290,20 @@ sram@c3f0000 {
>  			reg = <0x0 0x0c3f0000 0x0 0x400>;
>  		};
>  
> +		sram@146aa000 {

Please also update this unit address

with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

> +			compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
> +			reg = <0x0 0x14680000 0x0 0x2c000>;
> +			ranges = <0 0 0x14680000 0x2c000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			pil-reloc@2a94c {
> +				compatible = "qcom,pil-reloc-info";
> +				reg = <0x2a94c 0xc8>;
> +			};
> +		};
> +
>  		apps_smmu: iommu@15000000 {
>  			compatible = "qcom,qcs615-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>  			reg = <0x0 0x15000000 0x0 0x80000>;
> 
