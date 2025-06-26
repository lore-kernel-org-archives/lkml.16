Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4854A524F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938582; cv=none; b=nBqh7P/NpqKiM2fzYdPvKhYpjxap8B5bWuvcR/lMARiVXyyvRBawJgMa8gjXGBOG5NaIpqAGw3seUANDcoKkkhB3QHxuWSYSpBahVL5XfAium81K1IJIiJfOaSOWzL87a76z0dgeE+7ycR+yEsq5eq0Pwz952o3U9kGMnO1s6lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938582; c=relaxed/simple;
	bh=9Ulf7o72U8DcrYow+1z4SBJCw3hIkvgPS6ofzKA4wPs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgjkpXhHN+d9RSWTgPmWOeyDmBCXUqwL54m/1KFZfRpRa1NpGBm5yGMhPpkzgMU0s0P4r8Z5NjJXf9dKqjw3rXqmFpuS+2x6FQ+vjZGkRFiJ8k3TVLSMzkiodyHiA5v4+Klsx+W6aswYE938B4X2j4aQurDudsLyIjw89o1dQgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSZj1CDr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSZj1CDr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9UxN3000444
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GBwtiHKIyvgYyIKMG2QKXSaH
	zLS1UsXkLrpjRQkC6aU=; b=HSZj1CDrgaiRKXmxTbBm88pkg3ZX4/CYj5DlrNPO
	RjpSDGXrPIrIvxw3z86xR0cLOpZaU1Dak7mEy/CxUnxGrEzOEW+M4Pdncgd7VTjk
	ULF+66puebVsltx5Errzugvcim+J211SuoTGGGXWvoGQ3tq3PEHK84afxJFj4scE
	bXdunVWZnZYktx80HQxI8v/Ue1ZyceGPp4OO1DfTycjMjMZb3OK1F2JtQY4QJE3e
	loZsUiCXaKV+Gfp+PMPBV7QVdk8IBRSAFpspimllajI8o0dtfaLrxt9Yo+0gvgqN
	H6F7fugrdS3RwVHqMtbb5TlmCMGFNT7UDa2Yjh9gKNtTvw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq3d0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:49:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d399070cecso143833785a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750938579; x=1751543379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBwtiHKIyvgYyIKMG2QKXSaHzLS1UsXkLrpjRQkC6aU=;
        b=pxFyxjYy6eutPmDyzn8q1bzZh+AtAememQP4qwIHb9Oover8uef7lbgcUVq/unU+tu
         VnjYWRPIlY3cyynVFFIVzJYSoqsvUtxqn1SWFTwUfm70qmHLLjiu7+bCFfqwrVM+DtBH
         HWDRzByZqy3uPa/Nv7q6IBt7adKBK+L65iHy8VJ+NXTFZD+EC1eozzlhwHeqhcxkhttP
         NdHuLIWhT1aR4ug0yfnRaGR7ndWo0CCNFttsMlvKDk/ZLLWmO7LiLnPO1sHNzxrSMfal
         ICrc9JCH/4P0kTnZ3Vm0AdY9W/SSn9IGwG5S6Ybv1qnzbnD3RhdKFjBmq5GtlaF3438B
         v4Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWvgRG/3SejHoA1FTaCg30qUEJ14nSfjytwuNn4q35Oqqgjfu8y11c3UfPPbVrZcbewdowgO6Uis2wcGc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUQR3a2oebmayCAt+LvHCT14IyI6sUs2oOVia/CMIfO+inCf5b
	NS3+4Enw48Wn4GddBTAdNErIfBtucwOqwsGtTfShbBXGD1wKHkMhg9Ngn7EX3wrliiNyMhO1aDO
	mmf2awWYJM/rAmd9fpTq9lCLPnm1/qLD4YsTWBgrSEopouHHvzz/VRQhG2F3GcB32UsM=
X-Gm-Gg: ASbGncv7Tc4G7MpUboBl83SwQQFkP+cjD7e611KaPE7AMkoesUP+uhTaeaRTKB//5Y4
	Cx8EEnpUV+nrYeOsthuQql99/gKblgJW4JdFIrbAXyPFBXDWcZnNwlC13puoeXaxNxfDi5VdCU/
	knnd08/Qk8RH6WmAJ0ylcAo+3AQgJGc7D9VaomGxqGBlTKEOJJM5vSL68p48/BCa0Dc8UrhZPot
	Qh/6YwRJoUHnSHTdC0HEsefbnPzaR+jblCCvaJ7mvhE4zjvxLV9worWU+GhTqpCA7luBsFjK/M6
	eq+K1e1H3D5kQqhfeJRIEZeW9SSubT62CHMSiq4hnqISmgumpEbUjbkQ4A==
X-Received: by 2002:a05:620a:4087:b0:7d3:8e3d:da92 with SMTP id af79cd13be357-7d42976b8ffmr880326585a.50.1750938579246;
        Thu, 26 Jun 2025 04:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEZLJex3QT9MiFpQxhLoKdZ4j1Cu8HP2gRnN7PwYTuwEzqabvzfKKTsfgs0N8lf/Fd99BcDg==
X-Received: by 2002:a05:620a:4087:b0:7d3:8e3d:da92 with SMTP id af79cd13be357-7d42976b8ffmr880323485a.50.1750938578872;
        Thu, 26 Jun 2025 04:49:38 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c523sm47428985e9.6.2025.06.26.04.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:49:38 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 26 Jun 2025 13:49:36 +0200
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Message-ID: <aF0z0NiuL+Cg38kC@trex>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
 <20250623105107.3461661-6-jorge.ramirez@oss.qualcomm.com>
 <8997eb52-788b-4264-a302-0fd10008e4e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8997eb52-788b-4264-a302-0fd10008e4e6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685d33d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Llyb1ICWO3Llu68erG4A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5OSBTYWx0ZWRfX7dgTgVDSEQFF
 bSr7B2Boe4TdDSNeILeAfZ0ZRoyJvpHQMMXcqItrZK/nMIYwmzQYmRv7oN1ORh2Rr8F3KW9Y94f
 i+/8ZjgtFImUeSFuEI8OBz1RoMtgVeLVlHB10bQYu1PE/69/QMR+ESlrk8Sg3ZwDat8Za3DjBTT
 vgpUnR6KSYQhk9yguDoB+zUX8Vtn03S0/DWwhTOEZg6S44KmZvlYCrHTwVVh5vuJqZH1g2uLPGK
 DJuJGVcUrUGi1euB1tgqKbytikGHEArhcsbGc9AT/Mk8QoRbXhQMTf6y740b5UCeyYXR219NK/y
 X7dsgH16ubVFwNpTNin4KqNLkuCli/lIKYxbpuk9D5iAPAw4BTAfkrE3gs4HZdFF1lfgKSWsQFy
 jxdodtjXQORXB8NNKg6Htp2/h/BORIPD67AtjO9Y5jIq0E7uYvK5GSwL2nXH7CQQJnnrcsOQ
X-Proofpoint-ORIG-GUID: bBHOG7jw-g66EpZabC-dYuNAfb9LEZ3Z
X-Proofpoint-GUID: bBHOG7jw-g66EpZabC-dYuNAfb9LEZ3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260099

On 23/06/25 13:16:30, Konrad Dybcio wrote:
> On 6/23/25 12:51 PM, Jorge Ramirez-Ortiz wrote:
> > Add DT entries for the qcm2290 venus encoder/decoder.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		venus: video-codec@5a00000 {
> > +			compatible = "qcom,qcm2290-venus";
> > +			reg = <0 0x5a00000 0 0xff000>;
> 
> the size seems to be 0xf0000 instead

you are right

> 
> > +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +			power-domains = <&gcc GCC_VENUS_GDSC>,
> > +					<&gcc GCC_VCODEC0_GDSC>,
> > +					<&rpmpd QCM2290_VDDCX>;
> > +			power-domain-names = "venus", "vcodec0", "cx";
> 
> one per line, please, also below

ok

> 
> > +			operating-points-v2 = <&venus_opp_table>;
> > +
> > +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> > +				 <&gcc GCC_VIDEO_AHB_CLK>,
> 
> On other platforms, this clock is consumed by videocc
> 
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
> 
> lowercase hex is preferred

yep

> 
> > +
> > +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
> 
> for this path: RPM_ALWAYS_TAG> +					<&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
> 
> for this one: RPM_ACTIVE_TAG
>

ok

> > +			interconnect-names = "video-mem", "cpu-cfg";
> > +
> > +			venus_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +				opp-133000000 {
> 
> please add a newline before the subnode

ok

> 
> Konrad
