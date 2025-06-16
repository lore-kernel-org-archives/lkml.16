Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41B8292B2D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078653; cv=none; b=QcWhXYCY3+jR6wso9ZKvGy1vkZsMYTOK8pa/o13eN5xCbZV19dCzmPzHCvNmqZOkWizB9wCvd2prS1s53BfmetPQ1RWW/0/OgSrgEk6kd9ko0q5FFNGbxnwokJwiRFdNVWzf/wWNcE+PEl9h7ZSNPHLujpkvDyNxDVmawpXUN24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078653; c=relaxed/simple;
	bh=+7ZvudxHU1Lit+zQphHI1ArwnPJbfdXOQbD3tJTkJx8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tnvvl1JSNl6qSBozN6U4vfSRNW5HMzIM4LDNMbQza0N4o4UxVE1mIxXsbv4Cqmo55dNdSc1YHi+CirqWdggRJe52IX/yoqHUMRt1ep6FlY46egIdAmgcO8z/GMAZhLPYqymDvq0CAikJu5ClEVBhRAuo3dCLbcDCoL0YaKN/TQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcqeOPWc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcqeOPWc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8fFSe022895
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z64Ls8klGzhod1haDtExsW6H
	yVPHV51JzdXZy1TafjE=; b=WcqeOPWcceP32j0mgY/yv5a28y/XMM+SThZ+QBmk
	+l/787gLGvRQOP9ZKwLG0amzlIaa4BV5rBrfePyoFOFJHdjDB2LQZqGEX098R8EI
	JGk1556vWLDOwhlC/Y8yKSqHNXWThT5Onr055PMzaBfIW6H9IKjAcDdnhL+StnFh
	wZn19+880KTMg5TpVnUYTwH51NteuNSskWHDsG8InTWQcyaKPJ6SiReXX4lcPIMQ
	QLyWy9jCyQNdkYRQee3KgUttamaH61uc3uUWGnG7GNX9f4i58uAoeqMXT2L7OYvf
	auiUH2Z9drrkCE+Pugv+mTmMUB1uWgPuc07RpaX+Io6RAA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hcvhmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:57:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3901ff832so966842585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078650; x=1750683450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z64Ls8klGzhod1haDtExsW6HyVPHV51JzdXZy1TafjE=;
        b=kVhcby2pPIkhlhrIq3VpZvNJC27hJaLASJ9J1Ds490l+6Y7m/va5yvH1VNhIoOhP+1
         mYHhaTFMATsNa3x47ucDN1bqIU32CvuPwKj2UW+H4C2Beq9eB8eO6KKWPiMTZzd9b0IB
         hZkbNoPwPxxRG/eyPziCl3FINmdrI7Hr75th1bc5gQAcYUpdJv+rfxIww5xm9/2vnBK5
         hB7b80ooLANfCSmZPhYw0EyiZ37/BnTInZgHAkCE+eZcD6GgLw5npT7flfaMkOTFtqbX
         mfI0npyBWV42kRdRt3X2c3IgJjWS5tdccQZnjCMroLIeqy+2zRTHpH6/bYFG9QOBzzYy
         qD6w==
X-Forwarded-Encrypted: i=1; AJvYcCW+blP3lr9SGtBpovzxbW+GC1GN32ZVtoUqasj83w/Awv8f5b/Z/7fokJXHZYLc47j8/pvwjGj8xO6AfnY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5sct27qzS8m8lAM5TDW4hHdf7nICbiTOvdJhtdHGVNaUo8EuR
	XCCe3u2cIDKhcnpAPy7MBoiULTq3hKguof6imHGQvk9OlOuZ0CxDGvq4tdBxd8U7B9Y0UoC1O27
	prVtlljMoJdwCyQ13I8kHbxYMMXRJSn44rLW72/YPOiydjZYZ0l4v3s4Y+8/0SSJg++k=
X-Gm-Gg: ASbGncu8RhfOki2+FZIdB7ral50nsjfMKRFU8IU9yuzylSqWUErfV2yQY05htmuyTgl
	h7K2pE5TsA/8x9PMHmZgkLxQo79Vp1ddRMjCQwhnHtzeh+a6DrmdEEc2fYGNKanAMWIvEJxKo2s
	Q8ro3dMUSrpvCE8rK6RO8Gn/OqGFuWEfIZjzuw/nPckHjfIpp9u9UkpnDyVp0fvsmYy626Yoi0R
	KxX3n1GzWThiY4W1WVaDIjvn253QFqGUBV8ZNDaZQP2ZgJQ+Xg8k5hoSPAkit+3GLmDyIDspjPR
	GgQOA4buvpqD9TmBCbU5kN6KtbYl0yZwiI/JecWdYII8K7sThWlk4ZcvmA==
X-Received: by 2002:a05:620a:1a8b:b0:7cd:ca60:7bdc with SMTP id af79cd13be357-7d3c6cfe10bmr1657082185a.48.1750078649660;
        Mon, 16 Jun 2025 05:57:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgXpyrNuCMRpJdFdvIc90NA0VcDu34jwTkut8k7XZoDWbnfYZHiho67s0sox/Pmk/OdelNRw==
X-Received: by 2002:a05:620a:1a8b:b0:7cd:ca60:7bdc with SMTP id af79cd13be357-7d3c6cfe10bmr1657077785a.48.1750078649195;
        Mon, 16 Jun 2025 05:57:29 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54e71sm10879843f8f.1.2025.06.16.05.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 05:57:28 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 16 Jun 2025 14:57:27 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arch: arm64: dts: qcom: qcm2290: Add venus video node
Message-ID: <aFAUt8eXbrNJyv+Y@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-3-jorge.ramirez@oss.qualcomm.com>
 <9e901aba-5e4b-40d8-810c-a7322637752f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e901aba-5e4b-40d8-810c-a7322637752f@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA4MSBTYWx0ZWRfXy3p1MuuhUDM/
 G+bBRjX5V1i0lTXc4F51SgKclWFi/J/KLQbPGYlcefhqUnJmPRzwZpfi90L7P/jrmPFcMQ8MKfC
 XrXMtWmDBNJDyPtBThup5jIfQiZWfnz5HTy5oeWrm6KmDrcVyeJALFU8mxE1lgzwsZIWFld5o+n
 na6nmBsT2v9hIVQoN2nLKMssd4jNj0mHuxTovdKeOtUeDrraUxixUoO2Gsq5w3/WDWN8QYdFWXj
 D4+SaxuML1cQKzOtG2R/DyZa2WQD/cWRCkC02PA+K0WA05KQr/Cbn7atIMH29gXO6upPNgI560s
 uFkuOp/nZp3NeKLA+5IfmmwGrmKRIH1OnERsoJSGolPIdmMOuWHe93zBDNqMQjdtuyLxbfnGL1G
 uSBkwGg+3QCIV0BRQgSe3BDyV0Vl6vZgNuXwP7EWBZidWmxcuo1ZX2Ee8nCZ6mt5H/Q7Jzvn
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=685014bb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Llyb1ICWO3Llu68erG4A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 29PRLspz2eFJyX1RtdaH1uq1UYzmVk3U
X-Proofpoint-GUID: 29PRLspz2eFJyX1RtdaH1uq1UYzmVk3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160081

On 16/06/25 10:22:06, Krzysztof Kozlowski wrote:
> On 13/06/2025 16:03, Jorge Ramirez-Ortiz wrote:
> > Add DT entries for the qcm2290 venus encoder/decoder.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 53 +++++++++++++++++++++++++++
> 
> DTS cannot be a dependency for driver. Order your patches correctly (see
> dts coding style, soc maintainer rules or internal guidelines).
> 
> >  1 file changed, 53 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > index f49ac1c1f8a3..af2c1f66fe07 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > @@ -1628,6 +1628,59 @@ adreno_smmu: iommu@59a0000 {
> >  			#iommu-cells = <2>;
> >  		};
> >  
> > +		venus: video-codec@5a00000 {
> > +			compatible = "qcom,qcm2290-venus";
> > +			reg = <0 0x5a00000 0 0xff000>;
> > +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +			power-domains = <&gcc GCC_VENUS_GDSC>,
> > +					<&gcc GCC_VCODEC0_GDSC>,
> > +					<&rpmpd QCM2290_VDDCX>;
> > +			power-domain-names = "venus", "vcodec0", "cx";
> > +			operating-points-v2 = <&venus_opp_table>;
> > +
> > +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> > +				 <&gcc GCC_VIDEO_AHB_CLK>,
> > +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> > +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> > +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> > +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> > +			clock-names = "core", "iface", "bus", "throttle",
> > +				      "vcodec0_core", "vcodec0_bus";
> > +
> > +			memory-region = <&pil_video_mem>;
> > +			iommus = <&apps_smmu 0x860 0x0>,
> > +				 <&apps_smmu 0x880 0x0>,
> > +				 <&apps_smmu 0x861 0x04>,
> > +				 <&apps_smmu 0x863 0x0>,
> > +				 <&apps_smmu 0x804 0xE0>;
> > +
> > +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
> > +					<&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
> > +			interconnect-names = "video-mem", "cpu-cfg";
> > +
> > +			venus_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +				opp-133000000 {
> > +					opp-hz = /bits/ 64 <133000000>;
> > +					required-opps = <&rpmpd_opp_low_svs>;
> > +				};
> > +
> > +				opp-240000000 {
> > +					opp-hz = /bits/ 64 <240000000>;
> > +					required-opps = <&rpmpd_opp_svs>;
> > +				};
> > +			};
> > +
> > +			video-decoder {
> > +				compatible = "venus-decoder";
> 
> Don't add deprecated properties.

right - Bryan mentioned. my bad.

> 
> Best regards,
> Krzysztof
