Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CBE21ABA7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745617762; cv=none; b=HmrS9WIQ+qiv+VErr1U7skj6k3GeZtod+kvPGcIeiXhz/Np7LBPXs6zooNTQMkmSVLEvgqBG9kE7ucAtohB0exSK7xM5xlx5IHp8bOmfX/eXL9SXB2tfW36gNhewog9mXJkROGBuSKGXLxm2K+MNYh0MyFmGCyQyjeBv/SPK9Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745617762; c=relaxed/simple;
	bh=jozrC8ALKXE/Sx+4V/NhfP3zJRrKkx5q5cBTgMlYmb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6keAAPPpkgKKC/z8JGwM3GleP+Th61Ank2xBWXMtNJ17IgxRleh/f3boLMGDmYtRbpde6irnLnpMPWi9kR/gPynzz++98UVGHbtQqGEisvpVeClBlkE5gKRA7kXE/M5NfEnL4BJPYhzFqyFz9GpJSqoCdmVLOjEWtaJsN8hpcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R3KCzmNr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R3KCzmNr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtIs007904
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pqttNioS7MEhlEyeR5tyyWNtOjjWlwl8TrfEkoHr4Ds=; b=R3KCzmNrXjv4yB1Z
	NAY+Pru2HGVjfLGDRtTjnQZYCg+hBPXnfDnlT7JhozGnoNvo/siglLBK8wnt+aF/
	0KmPZVYhmVga2eHmC7olyotc9QHU3t/ODGRBFguIk+fePalCNdFnuws2otaalWiX
	qv9R3a5FFaPLGLBLXEGwLNTVjjyjPb76Dv2QhiozWND0xQz9voJaI25vLAwHPKRC
	Huj2IKWwMl2oGjF88APbuBlHS/QJc2joLAnUDeXbPvmGWvUhtL2jA+cUJIjLFewO
	lm2/Zt648e2HZbFbs0T6z+jEW+m70vWOt3zP2fCi07a8BTKYBQU2hsEmIlY3tw6p
	7dPNng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2jeac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:49:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476a4a83106so2167061cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745617757; x=1746222557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pqttNioS7MEhlEyeR5tyyWNtOjjWlwl8TrfEkoHr4Ds=;
        b=gUiWUF4wzxHymBtlOm072vD902g68cYPwP+vQwze6BND21DF6W38naddfmWmuEsp3k
         n61Y94LOZibYFAT36YOR4O15RpYTvBwvkCesDTYnfVYx22evgE6jIkwueO0d/9bsa5ac
         FqlPViQeQHavdpPKR9yYSEWY8C5xRL7dqPlq2JblwIEXxL6kSuTlK+Mhu0xrl97zicLL
         IiUeY+GDewNfgSR3tPS9HpvXv1ufOVBinvaL7b4F/VvN8exhVPvKznpJdrKbHun4WIpA
         ZyT+7AMlnVBi1t4ukEQGiuAQ6tU4K9bVRaLCKObAUXR7AwE5sRXG4oErpgJIBlqroez7
         WYZA==
X-Forwarded-Encrypted: i=1; AJvYcCVLg3XZ+mRhKfuKheDQafgNKvww0cVe7/Ewic2XAk+ZhyAQaFtVqrJ7cK3zCWlel6fEQeu1RO9Cd6PWLwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBFzU15q/AngGSd8UEJWqKzY/4h/jX4jBhSWlsUXvH1kbEc+nE
	1Xs9Ra3GqqoLgBctw22Loj3OMemlEUJcIKxDKgWsEX0zmhSk2wh5xfR3d/8fA9TU5IYeD3/yZmp
	3dGM1lJd+yepKAAeMZ6s258TDsQTbsgF+k7C40xxIuayS1xdYv8l3U35Sg0x1DvM=
X-Gm-Gg: ASbGncs5TBvkLZ7W/fBYRinPQy7+ZroZpLd869MSDLV/iuLlugjFe/8k5EmgOAqz9Z3
	/WHx8y58iCHtkAayy/De8QW9UHDAak80CGZjH9nEe9fxMHnOdz3/E1IBTfbIqm7SpjBwha73MV9
	Gb6zbdJNrpqnWktFtyKxe4a2DI9YTR9SVbm37syuLOCb5MhXhYuq6f4WmIf3dBqUw7driaOuVo8
	S8/4V+KltX9N2bONL47IqoEGcUbQ7MQq8+G/TkhjKrSBzTL8Eu95bjy9ZzdKVQEzjpHYaShHGSX
	N867o/23EgNCukecrmkB7RM2XKS2Bx1fj6kVJO4Jq78/8ueQZJWWcFX8sZUgmxVDqiY=
X-Received: by 2002:ac8:5f8c:0:b0:474:f601:c21e with SMTP id d75a77b69052e-4801c9843damr22042681cf.5.1745617757158;
        Fri, 25 Apr 2025 14:49:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJCIrI78Ob/2klFmqnEr49+IpnLEJ2W1gl5FH3vfPAl6chnS3piYqnr6Wnwi9TWiuuQ4mecg==
X-Received: by 2002:ac8:5f8c:0:b0:474:f601:c21e with SMTP id d75a77b69052e-4801c9843damr22042591cf.5.1745617756834;
        Fri, 25 Apr 2025 14:49:16 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e5963fesm194044266b.81.2025.04.25.14.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 14:49:16 -0700 (PDT)
Message-ID: <3498cfda-a738-449d-9d9f-754bbc8125c2@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 23:49:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650: add iris DT node
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250424-topic-sm8x50-upstream-iris-8650-dt-v2-1-dd9108bf587f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424-topic-sm8x50-upstream-iris-8650-dt-v2-1-dd9108bf587f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fVctxWJ8QL4B_aG24tTRGkT9TAc469xF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE1NiBTYWx0ZWRfXxBIm4HecwlA2 mzAv9SNKekaRI+LglOW4GqvLr8geQly+cOx86wzqWoKlur2YNH1B0W33hZ1xGs4xQfE4SQZAHXG +2lSkY+ok2l4aVOCX9dQrXzI/ORuDBxwVuMCNIGi2h7G8UO4ahbAYaMNpYXVSEtms3REYnEJfEH
 /IoOSOanrZvFh5ZowPv5+9p+U6i6NKsJ8A3eJOS26P+kD3WOtqJxFQN6kSwxmijfE5+UyZpwL4N si6JloI6wwl0SJnSWJxiYJt/2bllN7Ujq/zVsLuSUV5F34yY607W7Cxki7qGAwLmy4lTRGVZc0f xoV1xpJEQBM0gWia7/Blz1YudvV9kQrYO+RWkqhbPJgHOtsA4JcUYZvH5WEVRpbJh/RsXYi7KKq
 THucpfOjWLvZT6QXGVejtA/BocJDb6Hip0dXOSPtHbVHqFMHqukoEIMoiOrBXzenlWI5FOii
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680c035e cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=MuPQQqiwDrxPnYpOdO4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fVctxWJ8QL4B_aG24tTRGkT9TAc469xF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250156

On 4/24/25 6:32 PM, Neil Armstrong wrote:
> Add DT entries for the sm8650 iris decoder.
> 
> Since the firmware is required to be signed, only enable
> on Qualcomm development boards where the firmware is
> available.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - removed useless firmware-name
> - Link to v1: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org
> ---

[...]

> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,sm8650-iris";
> +			reg = <0 0x0aa00000 0 0xf0000>;
> +
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mxc",
> +					     "mmcx";
> +
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			/* FW load region */

I don't think this comment brings value

> +			memory-region = <&video_mem>;
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +				 <&videocc VIDEO_CC_XO_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
> +			reset-names = "bus",
> +				      "xo",
> +				      "core";
> +
> +			iommus = <&apps_smmu 0x1940 0>,
> +				 <&apps_smmu 0x1947 0>;

I think you may also need 0x1942 0x0 (please also make the second value / SMR
mask hex)> +
> +			dma-coherent;
> +
> +			/*
> +			 * IRIS firmware is signed by vendors, only
> +			 * enable in boards where the proper signed firmware
> +			 * is available.
> +			 */

Here's to another angry media article :(

Please keep Iris enabled.. Vikash reassured me this is not an
issue until the user attempts to use the decoder [1], and reading
the code myself I come to the same conclusion (though I haven't given
it a smoke test - please do that yourself, as you seem to have a better
set up with these platforms).

If the userland is sane, it should throw an error and defer to CPU
decoding.

This is >>unlike venus<< which if lacking firmware at probe (i.e. boot)
would prevent .sync_state

[1] https://lore.kernel.org/linux-arm-msm/98a35a51-6351-5ebb-4207-0004e89682eb@quicinc.com/

[...]

> +
> +				opp-480000000 {
> +					opp-hz = /bits/ 64 <480000000>;
> +					required-opps = <&rpmhpd_opp_turbo>,
> +							<&rpmhpd_opp_turbo>;

nom (nom nom nom nom nom)

> +				};
> +
> +				opp-533333334 {
> +					opp-hz = /bits/ 64 <533333334>;
> +					required-opps = <&rpmhpd_opp_turbo_l1>,
> +							<&rpmhpd_opp_turbo_l1>;

turbo

Konrad
