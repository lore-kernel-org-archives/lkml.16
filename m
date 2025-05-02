Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B573620297D
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 22:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226565; cv=none; b=Yyjvdh50+NCB/KfclOi+4eZUFicbKQ9SlhVqDBTBWpcz5+owi4m2ENVimBKPbtCCOcso1iAryANDP8U94+TPQSsbdciQ08c9vU/nGuIJ60TQNqvEwjhv/BinWxFaO+37XUHVVFRYSnKmlFWIJxFIYcJDw1lSQNwUUv5EJlJaDes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226565; c=relaxed/simple;
	bh=8ztnMAKmbdyNsPGlxL7edxZO62BJYChUmRhguiclIuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IaHcbXupeNSJEijH676VhqS6idpyHoRRvMtgA+9sO3NIf4DknoBXfrqgxlxRSoSsv7W/pGO9tQUtk7A7uc6twvyoTLM+D920Rh/arxbce4GX2QXjm/vzELxHq+TQ4Eaj0eNhFoHHiqIzwIUxbpGFj3eteK8IoQJnP58se39/3qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnMuuV/u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnMuuV/u"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAxpP011532
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 22:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1bOVgb8M6+D/Cf10VFmMIFoe
	5eQvQy5G8sTzJf7ev0Q=; b=nnMuuV/ukkrbGhT8RV3E3LdTpcgexym3eyUUA4Pe
	PB6PEsvGuek01R4Ao3fgmRzWOs6Qqog674w4R6NDeigYetsqsRcsr6D/AMZ6DgKq
	MARFHQp8u7UsR4pytkuex7dYtswv8Mz/21ytIjPxmJDhPU64/tiIjCetJcCj0nvJ
	jWyUGe9At2Mfahn5GC3UuhZ40aUi4XsALFgPLQHfCinautOjMg0sTrUeTJW7+blr
	GLXr9n5OrLCk5ufXn5S8HGNIm1dzi52tpkv5c2Rz1yfZH+J+/9f13a9QmpB0G8og
	QJrHCBcngKNHZJKH9SdOHcjRznODVtK7KaS/vV/TBI1Tpw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ub1gaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 22:56:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4767bab171dso28774101cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 15:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746226561; x=1746831361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bOVgb8M6+D/Cf10VFmMIFoe5eQvQy5G8sTzJf7ev0Q=;
        b=ZhvZRPNwbEasU0rlwcI/8iSMCJxIQsAdNTyrlWZKhAdkJBQpDC/VYNsXOnYHEykvW0
         RXxYhbaHWxVlrhYw1ZBf2MhEvbwCryeKCjVk6DCS6lMKaJ9BzxKL4o7O0DmHMmlOW/+j
         +2l1kFBYSoYpxG6wO4e/EuHDxFWGwPYLZDCzNBHOJkzSnCOce44IYSZDvOaKWlUOlzXE
         NIl9/Q/gfY4Q0ub1g1YyefY9gv9PYqB5jOADmmBSRB2EPHQ7Cjc7In4TUZNjZf53wB58
         mA1x6bGFnHcxY0ybu4PvunRMzZrtX+o+WWvYkSNC+VGGYtn73Vy4WjHaYl2iJBu1chGv
         qJdA==
X-Forwarded-Encrypted: i=1; AJvYcCUFa0qvkVO5DYq56SJkj7wzHXurYoZSWgfzoCNbW7ptx3yvERCnPH6KLUhU+Pa91nBWY2v+0Tj+xM3OPGE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys8E4YU8cGtDMtKVwcCr8CRy4oKCKgt/l/lzH6ZZxKFaCSbFZ5
	KFZT2olNhGKpSAYWbxBJtBMUD70vRrYRUwmrrhIK0ioqKGPXrmZU+qk5Pgt/BOu/M1DTLWWmKxR
	uQdi2YTbPU71G/Mub/IZ3oXeVetxF825AQMbg6MTpJBJugPA7qyxkAzx0wodf3cY=
X-Gm-Gg: ASbGncsodBr8My9Tfh2yQ/tUM4UutT2F8rAmPc4fM4FWB8krwt6/4J3dlhds8CGaHzy
	XlZFnllhHqR2hyXqUUw+oq1VOKCeHkHQ+1J+GXDeff9Y9xL6/LiD3aKqj+5OWCfoztCGejbBYKw
	0HG8na/2Pfb9hk7lhakN6/IHA7DjgDN4gsAvBvHf2Eu8RB+FuN/CFCNBUHecLFdy+tg0Ll0b0uQ
	ohVHmlAc+gAFhHQ9eeHTVNDpxiuJDTk188GJtYz0XnH9j/y+KoOYrbatvARUfdLeN7LnKpJlcQm
	ry0srwFTHOEb0+JVSXWgw8NimAsdh+WHHkLF6b9fMmcohihUgBPqtyMc1u35fYwDl2keXNVlZYI
	=
X-Received: by 2002:a05:622a:1924:b0:48a:2122:5047 with SMTP id d75a77b69052e-48c30d80312mr77701881cf.8.1746226561598;
        Fri, 02 May 2025 15:56:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT8z6Lg3ovxc73cJTMCXyVkvLsgnAqZM902lh4jo0RicuOeI5EXmmvrbC9puKXeOOVnqrsqg==
X-Received: by 2002:a05:622a:1924:b0:48a:2122:5047 with SMTP id d75a77b69052e-48c30d80312mr77701501cf.8.1746226561049;
        Fri, 02 May 2025 15:56:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029019c4dsm5052961fa.46.2025.05.02.15.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:56:00 -0700 (PDT)
Date: Sat, 3 May 2025 01:55:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add SLPI
Message-ID: <rjhuxssogtsxitmocxnlt3im44imyvui5ssc6ptshepxvgo2hv@npmexcs7nqpy>
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
 <20250503-topic-8280_slpi-v1-3-9400a35574f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503-topic-8280_slpi-v1-3-9400a35574f7@oss.qualcomm.com>
X-Proofpoint-GUID: 1B9cqb3A-izmLXQSDeiBcsJgnAeoR2WX
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=68154d82 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=G4SMBwoHVf5iV8dplL4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 1B9cqb3A-izmLXQSDeiBcsJgnAeoR2WX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4OCBTYWx0ZWRfX+bWUe0x7tAQY TYaKwbsvx3VPmHHkQEfF2Pr2LIr1CBlYxp135cFAUI31eqhxk/N4Ne97+9j8sjkAeqF/WC93m1Z QIh6zV96lDSr76eyGClZ8nRyhhRSpjVmEeg+827QGjPP2tHCCyI8KOPNcfiLD7BWOPHehNFv+5K
 GRXFFmJiGE1LYyeXmbBTINoLQ/U4bA7ycIgAJvIMS/dNN+cj/YvfydG49ZtDyF4BobwhD4aWmiW fZ2JEFAMbah3o5/cbh2cilitLlS0LFNyX7i+8xxidON9EIUTHEfyEO6YoewfxBvcyptgSAfz+LK Tm4cUFLtGv96zRkNT3FX1O+VB4GvgdJPa62gF3imxCBy51/qhnC7SeTlIyqvm3KjZbcaqgZ1xoZ
 JxZNzaMNMHNHbW4PYGk+4rYzPe0NkebzbqlTjB8VPIora07fL7tkvyYZMYMc4PDWQ6uBnpjm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=499 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020188

On Sat, May 03, 2025 at 12:38:01AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Have your tried enabling it for X13s? Windows drivers provide
qcslpi8280.mbn in the qcsubsys_ext_scss8280.cab cabinet.

> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 72 ++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 3f9195da90ee898c68296f19dc55bcb3ac73fe29..75ec34bfa729946687c4c35aa9550685cac95a10 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -695,6 +695,11 @@ pil_adsp_mem: adsp-region@86c00000 {
>  			no-map;
>  		};
>  
> +		pil_slpi_mem: slpi-region@88c00000 {
> +			reg = <0 0x88c00000 0 0x1500000>;
> +			no-map;
> +		};
> +
>  		pil_nsp0_mem: cdsp0-region@8a100000 {
>  			reg = <0 0x8a100000 0 0x1e00000>;
>  			no-map;
> @@ -783,6 +788,30 @@ smp2p_nsp1_in: slave-kernel {
>  		};
>  	};
>  
> +	smp2p-slpi {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <481>, <430>;
> +		interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
> +					     IPCC_MPROC_SIGNAL_SMP2P
> +					     IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&ipcc IPCC_CLIENT_SLPI
> +				IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <3>;
> +
> +		smp2p_slpi_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_slpi_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
>  	soc: soc@0 {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
> @@ -2454,6 +2483,49 @@ tcsr: syscon@1fc0000 {
>  			reg = <0x0 0x01fc0000 0x0 0x30000>;
>  		};
>  
> +		remoteproc_slpi: remoteproc@2400000 {
> +			compatible = "qcom,sc8280xp-slpi-pas", "qcom,sm8350-slpi-pas";
> +			reg = <0 0x02400000 0 0x10000>;
> +
> +			interrupts-extended = <&pdc 9 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmhpd SC8280XP_LCX>,
> +					<&rpmhpd SC8280XP_LMX>;
> +			power-domain-names = "lcx", "lmx";
> +
> +			memory-region = <&pil_slpi_mem>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			qcom,smem-states = <&smp2p_slpi_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
> +							IPCC_MPROC_SIGNAL_GLINK_QMP
> +							IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_CLIENT_SLPI
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +				label = "slpi";
> +				qcom,remote-pid = <3>;

No fastrpc contexts?

> +			};
> +		};
> +
>  		remoteproc_adsp: remoteproc@3000000 {
>  			compatible = "qcom,sc8280xp-adsp-pas";
>  			reg = <0 0x03000000 0 0x10000>;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
