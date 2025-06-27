Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10BA2C3257
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027631; cv=none; b=cLE32bywMoRGVj97sjC6J8alJK6wij3tYrlY2HDCHKypKzO2Tlbk5zFR2J6RQj9c3lH0IMLBvN1JXs6Y0S09MbPmMPHVHMzQhdJf9XvCCB2ESbs8QtUuFfkNgRO8lLMXXlXHlmPYwrqP98G9WEWSMfl0caI555J8j0E21Lnbp6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027631; c=relaxed/simple;
	bh=7+B0fupMsVNOVu8V8tGzBY7GBfas+EnrrN008V14AM8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHcw5c/SrNFJGLjwusU7GxT5r+Hw9qCvmYiBwSA4HeqX6KfLcXcJY2CZVvTj9ogZvJhv94e+gB4p2QL3Eyf3Pc+OcPWiYImZ4iGPNBKbCrwiClB/0cGZfNjWrO47owNPc7/8mjqFCNAwwna4oxLGEPw2CKlca7tutaFM/omn+cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FhKdUWbQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FhKdUWbQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCLKLk014507
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eTEkigVB7s/c3lzv/enIwb+8
	61vMMZEHP1ib8VKxubY=; b=FhKdUWbQs0wDrTxBmzOXj6S6VP0KvFZMwrhHfpPF
	Dpj7mDpdrU2upICSoe0D//KYXr9adTPEwMsqVXZeVlyMrYlz2QUlu0yptXMo0F2k
	jnYwYKuOlVbnoxnMq4AIX4O+YqejlbBS/7MrhJWNQBg9SXnNv8zhP+Zsrp58bHUw
	H4xTIdZL6p/3QhS+M87CECCOe7ILf0jaZCph7RYTz3lMNEVWvqfi3ytdFCWyAhhs
	iiomT7YFMPvCDhX9gcgLfHasF9s3iuGN+Dzv2BxBVpU4OcQ0OuN14YtGfRVC+be+
	wSMANiWjYSOW1DLLUQ8VP05FOh1okYUnCjjNCC1FCpwpnA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm25dsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:33:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d099c1779dso275544285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751027628; x=1751632428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTEkigVB7s/c3lzv/enIwb+861vMMZEHP1ib8VKxubY=;
        b=G7xbXIig3UOwfdZbBN8EexIu0gaHfbBHovTilOQC/STFRoE1CEzvImU4eXJNuLfdZP
         Nwr7rvloOZtmGq6TgE8K/43jG/h/Wow2OdVX2WCss6SlvX2RXVajkPEBX/Jujt6DjD84
         NolnFszI3rDjOc4pQDEvjOyl8d3/zCyyGU4LVsaobTknMIaNGRFGA03/QB/fF8VT+Egn
         bo0QbdGYxJNN1Ua0vsndd12qQj8PjD0n9WtClZUE83nG1kVhXRzfmAEwRnlXqgxv77Zb
         Nh+XzFJ4YIrzkZNuwYxkku3OG2EwrJz14jb+7SlZ1cKkjZq2EAp7EcSLJcelK3QtbhiJ
         9H8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVU9sNKWT8wVaPTEx4a77e1qJNkshqigSGUB180J+jdekVU2gVUjiGhDZ+ZL+RcHclmL4AiO/nCuhQScU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJLve641cf5pXX6Meo8J0nIyp/T/tZ7nq1bBBLp5apIXXNeyI7
	DtRTNj+rJrjrK20zEDzxGXbJIyYk4YZaeAZ5AvpFYcVVYAZNmAGjnZYzK6fU4MdECKzxaTJJmxB
	0irDcpJTRqA5DVAvxGTPmT98y8X0S5sAkyvFu0JGYg7pl4QwESpCzP8gB0KGFDlDC9TE=
X-Gm-Gg: ASbGncuXtvYH9JldJksxXrF+QWYim5e1idLb8Yd48E9K8wOEID4VFF+45tZqzNJfA8g
	OvWaV/5GCKGL19wQCbjUA5bYUf3yv2UNFQMAet94lLgTSAQL+F+zy9Qf8XqeeR+lq5gFxFKgyA7
	5ZZzzRXbznT/yLpOzBVKT4Q0g9SGDaJ1r8QTjL1dNp9hB/X4QJPNCU0YdyU1jvVJ+Q7FREQzkEb
	g2HBR5ilj1HUDlXCS955UA+LAH0QNv6vF/I3yQZaylWwLEWjUXXcAJqUdMvY3YIn2B1Ls87fRyN
	Ljt19kCgJ7TfBZ+B6s3gN3KngjnZbaAGdrMF5U7J2m+iHOiqcNzn3fyyGg==
X-Received: by 2002:a05:620a:278c:b0:7ca:ca00:735 with SMTP id af79cd13be357-7d4439a80a6mr450478385a.41.1751027627764;
        Fri, 27 Jun 2025 05:33:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6Cgx2agTOK5/IZXOIF0ZSAwg41hRwabLP1fIcfmij7RmRnTOdnah43vsFXkHU0/3rV84TIA==
X-Received: by 2002:a05:620a:278c:b0:7ca:ca00:735 with SMTP id af79cd13be357-7d4439a80a6mr450473285a.41.1751027627297;
        Fri, 27 Jun 2025 05:33:47 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a306a01sm52217925e9.0.2025.06.27.05.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 05:33:46 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Fri, 27 Jun 2025 14:33:44 +0200
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Message-ID: <aF6PqCY/E6H0Mc2/@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <6e330e8f-5856-ef8e-5fe3-52bd61b59e02@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e330e8f-5856-ef8e-5fe3-52bd61b59e02@quicinc.com>
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685e8fac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=DfKWsWQFUtAST0jsyLYA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: L2m4Ellzs-Mp8i61xIscK2H31rhBDPOK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNCBTYWx0ZWRfX9AvN7Uj1mczx
 fkDiLMkMBcpjNZpygxJ85ycthpFWcbdoh5cn5xfyo+y3cYEpaOKjQsWKMGbSWhFd2QMN2w72cDc
 d68PlhLFpwXnJYqv5xhzeIRFiw540/bvYVt6bXl94C6lLpkUa9AQJRbgF4HfG92k5CyVBJodKt0
 0MS5UHYlBHz/3odTYTW6uV4m7iOAP0RLLrt0K4SXq59LKjupz1diVSVCqS3I9aebnhddOTmfj9B
 2nmOB0iFXwxjqG+4YFNKcqnfcwhl34GbaCMXaBQrnFD/eimAagxhrgXEaK/aZoFKICTcL1Nek2L
 no0cCzzlJdZoTYrKmxM7CNxhp9b6ZPKvjpIgIDjJmJ7Pkczpgz/ALmoeBzQaeZq7Ip6pp1pKDXG
 hcmLcSQp54AZoNVKqz0ETwtlHsbygjDG85cHIJMvHo00F/RDv+DG/R9VbXNKYm+/AB7unOAg
X-Proofpoint-ORIG-GUID: L2m4Ellzs-Mp8i61xIscK2H31rhBDPOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270104

On 27/06/25 17:40:19, Vikash Garodia wrote:
> 
> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> > Add DT entries for the qcm2290 venus encoder/decoder.
> > 
> > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 57 +++++++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > index f49ac1c1f8a3..5326c91a0ff0 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > @@ -1628,6 +1628,63 @@ adreno_smmu: iommu@59a0000 {
> >  			#iommu-cells = <2>;
> >  		};
> >  
> > +		venus: video-codec@5a00000 {
> > +			compatible = "qcom,qcm2290-venus";
> > +			reg = <0 0x5a00000 0 0xf0000>;
> > +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +			power-domains = <&gcc GCC_VENUS_GDSC>,
> > +					<&gcc GCC_VCODEC0_GDSC>,
> > +					<&rpmpd QCM2290_VDDCX>;
> > +			power-domain-names = "venus",
> > +					     "vcodec0",
> > +					     "cx";
> > +			operating-points-v2 = <&venus_opp_table>;
> > +
> > +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> > +				 <&gcc GCC_VIDEO_AHB_CLK>,
> > +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> > +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> > +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> > +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> > +			clock-names = "core",
> > +				      "iface",
> > +				      "bus",
> > +				      "throttle",
> > +				      "vcodec0_core",
> > +				      "vcodec0_bus";
> > +
> > +			memory-region = <&pil_video_mem>;
> > +			iommus = <&apps_smmu 0x860 0x0>,
> > +				 <&apps_smmu 0x880 0x0>,
> > +				 <&apps_smmu 0x861 0x04>,
> > +				 <&apps_smmu 0x863 0x0>,
> > +				 <&apps_smmu 0x804 0xe0>;
> keep only the non secure ones.

ok

> > +
> > +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> > +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> > +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> > +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> > +			interconnect-names = "video-mem",
> > +					     "cpu-cfg";
> > +
> > +			status = "okay";
> > +
> > +			venus_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-133000000 {
> > +					opp-hz = /bits/ 64 <133000000>;
> > +					required-opps = <&rpmpd_opp_low_svs>;
> > +				};
> Fix the corner freq value

can you add some reference please?

I took this data from an internal document - not sure why the downstream
driver supports different values or where those were taken from (AFAIK
they are not supported)


> 
> Regards,
> Vikash
> > +
> > +				opp-240000000 {
> > +					opp-hz = /bits/ 64 <240000000>;
> > +					required-opps = <&rpmpd_opp_svs>;
> > +				};
> > +			};
> > +		};
> > +
> >  		mdss: display-subsystem@5e00000 {
> >  			compatible = "qcom,qcm2290-mdss";
> >  			reg = <0x0 0x05e00000 0x0 0x1000>;
