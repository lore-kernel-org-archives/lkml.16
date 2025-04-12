Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21CA1802B
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 00:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744416123; cv=none; b=JZbkW4vukaNQucOcn+UAjk8Is2FDn7uf+eA9iStoA+PqlR4wqMH1ibEzMeEhVXf16IKxiO8xxBT6qUe7RV9JP+yFV87QnHFxxv1OYg8K0AkmAjlGIpnjtEy1d7hQPNhArGezWg/tA3KmaSrdw4axNJGzMIYI/3KdGMKhcb9i2nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744416123; c=relaxed/simple;
	bh=rd1AJdhV7/Ur2BWv3yCleLXzp7+iOroG7wXSw3KkLq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ckAT6CdlZj2zvX4nDT4NejZhRlTO4e4Oe3YkTqvIIw1ZJP9Zut5fpAFiQNzoAQWc2bdWwqPIUkOSEfLHa25betEiCEWcCVfAQr+oYoFx+ahNKaLWoQBcbPAoWhwwIFAg3sxlf/RdhH0AZnmj8AjteXsbTD/P7XvWDW8xg0xlYTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLDgyOxk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLDgyOxk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BG0t4t016413
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 00:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ugy8iP5VEi052uxx31ODrIS2gIFDMfijamYy3hRyAg=; b=KLDgyOxkhpOxNmGs
	UfHW9eGkJFf0YiX6WQO85qJtGGWW665RmT6OO+BkgibZVZ1uZRRTl2JXCkTo43bj
	MxmVqgqWkVMeZuHk5nkLWI4BGKtqVy2I/FDVzAZGLyoZummPUqyC7t+n4Z1IAMue
	s1x/HjG80qynrvxQpV/xk2pYS/xIni/dW15Vl2BvB9Wywkcoa452VQ0ysBY0HJ6y
	lSn3akZYXlKOwUC8xLvJXXJYDOVohC9pgPTxQL+qp3ik90qQ7lPH2BRFzhMstBuy
	B8+7+CZ+wAN9mbGLKL8d3AEwlnnWOtbCAkBjT7BDxL63dtCqcxvl6tG+tYkuO5Oc
	ZR1i0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1uq69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 00:01:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c552802e9fso59912185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744416118; x=1745020918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ugy8iP5VEi052uxx31ODrIS2gIFDMfijamYy3hRyAg=;
        b=HqXsDCZ5MbNZ/baOVKIqpLBcxhVh/4EfeyGwMcFcnO+r3H2h3XE/gQG6hoRMJx73wE
         D4Br0f0pzX857mRc/im+1UFlnqB0jErOyHFAUlrET/n2koH4zfu3y3dctU+L+MTkfdeF
         yN0aennHhS37lA6VZ7AOEcjMojXr+WhW2mcBNA7H4eNvmiMxR7uOAzNAtsFVExYkJjXN
         zh+sTIOMpS61RWaDZXB4/pWHw5EKOh4olyZYoB7hjG0ckMxKkiBztkg0njKwB2V4tyJr
         8ctTZYP0XdvyQPfrOrlQIGGEWoQPUHtt2vJkVyYptyLSTrdReB0uQngbDdUx4RCjqGcS
         YgxA==
X-Forwarded-Encrypted: i=1; AJvYcCXbMhKnFupjXAKVSiBu5q4pZiMurXMQRx32F9n+GUQ0C0HArlQ+5lbgn4IFjgV7OzK0mphwhwc0cvYZCTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSmZqpU6TY2EXbFL6sro0cv4i4yOlIhAgOKkdmzLyTze5nJGy+
	vJb6VjJT8iiUW3fp2fUdSPWjZWDDAIY8bgwtBQQyuSyocLF04U0aV0ZvumzV19RSw5hGwtU/v2+
	gbLpfM3qd9gcI9DwGxvn4hLJ+VXLFCPwvSV40zV2o1k7sucUwDCg23qUoip8jp8c=
X-Gm-Gg: ASbGncsHjFXR4vUuQzbSLvj8IAFNPFxguFf+K0tVEb1IETs5u68e8CYI6oIv3MENpn6
	eQT2nl4KIn7H4kE94H0ZXMI2RwYmpnrQwWb1AUii31ufmXOB5P6z4YxX5k2cSj1coJkwYRowS98
	gk6QqFvNR1DJfq8awNQtZ7l3IvGgiG6BTIEMWKMC95w6V5hR0uq3FtfecQkWa9oJFSxVhGzLf3a
	xjMKPNSUXybPSj8Z/j6hFMtkyFiuIC6fVfM9M60uBG6urVDa3iB+88Umilfj9wXDRcdHsaA6U/1
	hA/vXJ+gXla1UrWO2IfY8IS4e6CN5NxDuWkb7iajyMjmOUbe7DEX/2cyv1HyAYmHhg==
X-Received: by 2002:a05:620a:430c:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7c7af12697emr246262885a.9.1744416118406;
        Fri, 11 Apr 2025 17:01:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ1mMpJHH4b8C8m5swdNvznZRTvMXw/RD0bWNjiHoi2ylhg4o1veW/1BRleH+rNHcCHjE8fA==
X-Received: by 2002:a05:620a:430c:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7c7af12697emr246261185a.9.1744416117874;
        Fri, 11 Apr 2025 17:01:57 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f068968sm1560677a12.35.2025.04.11.17.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 17:01:57 -0700 (PDT)
Message-ID: <dc535643-235d-46e9-b241-7d7b0e75e6ac@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 02:01:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: add the pcie smmu node
To: Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250206-qcs8300-pcie-smmu-v1-1-8eee0e3585bc@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250206-qcs8300-pcie-smmu-v1-1-8eee0e3585bc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iCz5n9jXQ9NFsKq1tJjwOZroiv_qzGPE
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f9ad77 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=COk6AnOGAAAA:8 a=JpUTTvQeKOGwk5RR6f4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iCz5n9jXQ9NFsKq1tJjwOZroiv_qzGPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_09,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=761 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110158

On 2/6/25 2:43 PM, Pratyush Brahma wrote:
> Add the PCIe SMMU node to enable address translations
> for pcie.
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 75 +++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 4a057f7c0d9fae0ebd1b3cf3468746b382bc886b..fe88244771583de9fed7b7e88c69a14872d4ffc8 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -3199,6 +3199,81 @@ apps_smmu: iommu@15000000 {
>  				     <GIC_SPI 895 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		pcie_smmu: iommu@15200000 {
> +			compatible = "qcom,qcs8300-smmu-500", "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x15200000 0x0 0x80000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <2>;
> +			dma-coherent;
> +
> +			interrupts = <GIC_SPI 920 IRQ_TYPE_LEVEL_HIGH>,

This IRQ is not routed

> +				     <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>,

We want 922 here instead and this is the only global interrupt we care about
(set #global-interrupts to 1)

> +				     <GIC_SPI 925 IRQ_TYPE_LEVEL_HIGH>,

This is a PMU irq which is apparently left unsupported on DT systems..

https://lore.kernel.org/all/b51de3ac-5dbe-a1f1-1897-febb52f3cb34@arm.com/

please remove

> +				     <GIC_SPI 926 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 927 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 928 IRQ_TYPE_LEVEL_HIGH>,

+929> +				     <GIC_SPI 950 IRQ_TYPE_LEVEL_HIGH>,

-950> +				     <GIC_SPI 951 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 952 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 953 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 954 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 955 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 956 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 957 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 958 IRQ_TYPE_LEVEL_HIGH>,

+959

> +				     <GIC_SPI 885 IRQ_TYPE_LEVEL_HIGH>,

-885

> +				     <GIC_SPI 886 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 887 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 888 IRQ_TYPE_LEVEL_HIGH>,

+889

> +				     <GIC_SPI 820 IRQ_TYPE_LEVEL_HIGH>,

-820
+821

> +				     <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH>,

-822
+823

> +				     <GIC_SPI 823 IRQ_TYPE_LEVEL_HIGH>,

-823
+824

> +				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>,

-840

> +				     <GIC_SPI 841 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 843 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 847 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 849 IRQ_TYPE_LEVEL_HIGH>,

+850

> +				     <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>,

-802

> +				     <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 807 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 808 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 809 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 814 IRQ_TYPE_LEVEL_HIGH>,

+815

> +				     <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>,

-836

> +				     <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 839 IRQ_TYPE_LEVEL_HIGH>,

+840

> +				     <GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>,

-854

> +				     <GIC_SPI 855 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,

+857

> +				     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,

-790

> +				     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,

+797

> +				     <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,

-79

> +				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>;
> +		};

Konrad
