Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC570224B0B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618179; cv=none; b=B45UeQfdTYipPrBcqegxp8KHwQkyzV6dXq13H3cwiCSUV/G1CH3aJcghei6h0b/aN0GZ5EFikad17tmEGz8XWfFTJy8W/zZ9xwguk4Fsj6BiuIN4dZJ4/wBW9oKoLPD2eO+VOO8ugNEk3NOtg3Lz8Mk+Rs74YXSaPtTveLPtAsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618179; c=relaxed/simple;
	bh=thtHjD4hP98SncIQnFXA/3E8xNkWqZkjB5OsSovkSkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxQcdqDe/ehhUQdbJeDAm2lPuZR6ffugTvbc/9ba6oAaGVIoIdFo4jaip2H+aoBH4NiElmCsIN35DpN68sHyIav4sA71rSSnDfpe3qyNbkuCe9oGnjEq4ckpMSzWjp2qlpGSgX7bxnamY6aYtZyG4q6f2uhoMyKhPYcxIeohh58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RPgt07gf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RPgt07gf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJvJq024846
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bvqtkiiAnjXCi6DrBZ4bpGwhPBq2CBWyd3yKZ++IwSw=; b=RPgt07gf9WaFXQaq
	/qM48HiVyxYvfghl2MdxBkTDZUgv5KQoD715X9ai+/apeSZKxtwyFiPibSsmVeWS
	a7Y6mEypzxcvlxFd+13gzF2lc1Ab+Wf7FwDwtjE/xzUycHs4mrynMwKNwE53XaFf
	37tZFitv26wKTzPgElr0d6loK1R5FGdjFfZ+LYCHvm2tHX3ADZZv+RbrGmKXDD4b
	7D56dx3aEnsGPEVBDVSbZA4nENFtDguPip/9ffAsP2W5wpu1cc0DPsm7vQt6swK7
	Fk4fSa8wAudDkNfpB//0KMhocORHhQAu2AxJQPoH5HMW2uS7sb28FuSXNwcLNGci
	b5inZw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0t89p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:56:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476786e50d9so5245731cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745618174; x=1746222974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvqtkiiAnjXCi6DrBZ4bpGwhPBq2CBWyd3yKZ++IwSw=;
        b=q1s79IKLhuM+BDjeHGat+11+PuUlvtXt/IEXwn+mCyQyRUHpt5+DyOAERUESWFLydx
         uo01T47pGfqyu8H5fycZxrJf6K9VP8UzzWWmxgH9WpuilJZ4rKOSKmprYV7/dIWS4nmA
         9OZ+GXH2Bs6OOGI5GWI+ndS/Os811LIo4WLMqKvpb3lh0lLSEx6k8F1FtQn1v2YPSzs6
         /++kllOPoIynzz52647ZBx/fb3fJunpk6rOD7mKEm+s1pzYFrZibDqc4P8ZEEzLJPvdw
         HTuS88wx0hV0uZhDJqZh1OgLFYNROahwoHz7N9Ag9ldylFuzjKjN7fLEJoEwOIF6hv2I
         N7hg==
X-Forwarded-Encrypted: i=1; AJvYcCU1eN2k07hhToQ6Im6BOQwkBxE54u4xjDqTWrSNRy8X+frLUcJvUqtaOs/ntzKRWhl3N6/VX+yrp/sb2Xs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/e7DRcAaVNI87DYH5PDFptPfwcsiOKrGidXncGfe3Pmv9EKSq
	LyzNfbSnCf2YRxe1OFrSXJ7e8sd4qs856cFN0m9JwugH7rYytSA2Q5l7IgFvWnOmAmHlmTkrS2l
	XD16SSDqdLvcEFiSz4TYDZbjtKi6/kuJ88dAqivfsnfITpqwjNbJ4Zuf5/OwopOU=
X-Gm-Gg: ASbGnctmiXAlE3uGCKzvGEgB+PqO6AIWp7tBS6azzAzzWdzjFHMKM42e2HGdqOGReBm
	bGEP5qMnYOCWbB5FtfWLHWIm7AoSi2yD3dM1kCKOyxmUCXmDQ5GX/dlcsgYeJwkzNW/RNMc6vme
	hwae9vjZAVUH/UXOBkzf4qPmMeApackgSz8kaMGaIajMKafv5pcX3XV6sx+aj/+hcj7pcrUka77
	slG300VQvc8dVqfNbnPksoWpj63yz7MHJBMnKEhrfRZnyJi7GzBlGEer9XLx+UDL22q+0nUbk58
	R4AjZGqqaRMr+ih9SQvKIm5hRzT6er+xbuCaB63Qm5ZmCbVuCvvIFo2Pnwfyr9GxT1Y=
X-Received: by 2002:ac8:5dca:0:b0:471:ea1a:d9e with SMTP id d75a77b69052e-4801e4ef692mr23919601cf.12.1745618174650;
        Fri, 25 Apr 2025 14:56:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEPH6ZC4mMXPwc+8kPXQipc+SljnFWRTW4WTZQ1kaqXT62AUsCek4O0DPWZW8AkH1lmpId5w==
X-Received: by 2002:ac8:5dca:0:b0:471:ea1a:d9e with SMTP id d75a77b69052e-4801e4ef692mr23919511cf.12.1745618174356;
        Fri, 25 Apr 2025 14:56:14 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed71ff2sm196207266b.144.2025.04.25.14.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 14:56:13 -0700 (PDT)
Message-ID: <b05fd08d-b08b-4398-8d0d-acbb11d66300@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 23:56:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8550: add iris DT node
To: neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
References: <20250424-topic-sm8x50-upstream-iris-8550-dt-v3-1-92f6b692bd52@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424-topic-sm8x50-upstream-iris-8550-dt-v3-1-92f6b692bd52@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mebaCQJJvEacmdZfxXTmiL1C5uSoisNG
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680c04ff cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=wn_BznkOyV8vFZdaYPEA:9 a=pfqro4Q_cSz128hX:21
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mebaCQJJvEacmdZfxXTmiL1C5uSoisNG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE1NyBTYWx0ZWRfXyGlDRB2WpKA4 FELtxO9EU5KKMHBZ8AoCFBoBIrJJLk4ZwQ6x+j3AkY54GKxv4h7ZhyckTSzqTr6otq5sRkhfRx+ bQhYy/UpeyR05kDA517CpS4LCl7irFLqVxVJxmRQjO636qM7e7ssAHKMK5IGJL2qqsxRP5md5MO
 ZKtyICHnKHJgDBt5cBcj0eyGUtofkZE28VuNxn/xNTQUmu1jnKZlktPGZgdDdghHzUxLItGHe7o FdNi+5mV+OuwvRlJ741VAifxOwk408x4mgfAC2mMXPPdzt+RI6LWjaD1i8kk7J/yyMMlOkw28Ut QznALgQFtNfpEq/SX2Wibag+KWN8SdyOJlU9BqMYWzL3NkLzor/Hzg5mpEwN/paqRNAWDEMgoFq
 WaVLGd1I/7lUOd5GpwNKkjPkoR4edmCAsXo50+58+cc+Vu2uG+DDVh+CEr2ezSf6NGTHZSTq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250157

On 4/24/25 6:34 PM, neil.armstrong@linaro.org wrote:
> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> Add DT entries for the sm8550 iris decoder.
> 
> Since the firmware is required to be signed, only enable
> on Qualcomm development boards where the firmware is
> publicly distributed.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,sm8550-iris";
> +
> +			reg = <0 0x0aa00000 0 0xf0000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
 
Please turn this and clock-names intro vertical lists


> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>;
> +			clock-names = "iface", "core", "vcodec0_core";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg", "video-mem";
> +
> +			/* FW load region */

Not very useful

> +			memory-region = <&video_mem>;
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> +			reset-names = "bus";
> +
> +			iommus = <&apps_smmu 0x1940 0x0000>,

One zero does the job

> +				 <&apps_smmu 0x1947 0x0000>;

similarly, 0x1942 0x0 may come in useful too

> +			dma-coherent;
> +
> +			/*
> +			 * IRIS firmware is signed by vendors, only
> +			 * enable in boards where the proper signed firmware
> +			 * is available.
> +			 */

See 8650 patch  comment

> +			status = "disabled";
> +
> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
> +					required-opps = <&rpmhpd_opp_turbo>,
> +							<&rpmhpd_opp_turbo>;

nom (nom nom nom)

> +				};
> +
> +				opp-533333334 {
> +					opp-hz = /bits/ 64 <533333334>;
> +					required-opps = <&rpmhpd_opp_turbo_l1>,
> +							<&rpmhpd_opp_turbo_l1>;

turbo

Konrad
