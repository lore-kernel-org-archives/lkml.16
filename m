Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E2121772D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084744; cv=none; b=sUYG+j8XhOOMcGhZrgGnP9f/4+Q8W+NiGQyJ3qVHjCe9N+I1kYbJ4ttewjXTtrK3YbgyKpRdEGM6X1B3UfratOGwakBbMogZEdtr32Wo9mbaXBsttAjxYCZ8oU4rGh6FWViOHse4MT7EtCTJcTzKIofTTGzVOCDJhZWkmMw56qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084744; c=relaxed/simple;
	bh=7CH7Q6O3JSFwKpON5PQPAnAXG0bbHeve2wlnWMw1pNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWA4mVte4hbJ7MQrksrLxiF+ufgs85uDkvWFfSc/dHcOGJ3A+/ZFN+acFe+pCAAJZb8CNYzRcaj33rYxuNk5+cbTqJe1dFym/Q6ThJk7tKEODg6ArEPrQNYzaCG6Paf25R4PFovrI74YxUKnky94SUjRsjc7rA3Xt7QREsewCuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EIW1Xca/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EIW1Xca/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jFLv010905
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N4QswrYUV3RTG9GPyKC8dQvZ
	FQFrSEYy4NaWiQ2/bw8=; b=EIW1Xca/pTuzuoCk+YcwpVSVRwveASpsNoqUl8Rb
	H6Pd/0PEEP1i4o6i9dnCn1eIvsXNiS/pNoTmKOus3t0z6CmemqyrEWQWzRLc3Rsz
	wbX/v7jKmEKaFvyIsu7c+nXYFPrO4DFxHpn98mKS9AGOUB0LIoy6KVu9aqgB5Z5T
	XpgAKNg6AkQtOlevXtt/eUmLBXT+7M+XegzlBDHJ0SjxmQ8IVdMCkVoHhBjG0LRg
	XQQxmNJHIViLMM0LQSM6DsL8go8i2aaVD/k2Y3ljUKjzuNZyqHroJNRflYf6qTNf
	6dGNNkBY4uU2yQyfJ9t+JDP1BhkNE+Tz34KLYg6q8hQMPQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0kqhbwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:12:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c549ea7166so152778385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084741; x=1743689541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4QswrYUV3RTG9GPyKC8dQvZFQFrSEYy4NaWiQ2/bw8=;
        b=N4WZuOBvQz05Ytg0JAb/BKYd0iPWr4ZA/ybFpcIsSOnQg9LlE/+QsvaFkm4O8G6RIq
         gl+d08iD3tqm/VgoZX74TQsP93B3HrNbRXELCVZQL+VXvEeI1d3xXS4vnTjyn4M2VWrY
         4+pBaKj5Kp93NQylbZkNsqlD2V+l5wrotE6kkLbmy9EDFXkFNt07k4qoitfsiHe8r346
         /y2LIXzpNTtTidmyYFg4KioGR9J0wNNxIW29G9OdeIAShvxZ3+QNKUU9RxffgQ6kvzNa
         m5tp6RbAYinjh//HxdyCbf8g+6QkxPrU3g3JTYKsdCiUBVlpZmCCJbxoH2I8wBbaTTWa
         dM3w==
X-Forwarded-Encrypted: i=1; AJvYcCV+uC8CksQjCfwT4qzw6UmYtA0wrf4hzcIlFJIuyPjjbzV8zUxeOmioqWOhlyVqQDyG3mjpycuno35ZBU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzWE3ebqrxkpvT+KmuplQrjpTWm7mKhbp5TGZfGBOHohSPLshz
	ynTttTMoDwRT6TlbHpAaBPYUsK4jkhUECtes06XwBalNN6eYr9S6Kkej8a9VY8cGu9VuKL3EuTB
	lNslHcVHt45Zbreuc/YKE9r9f0RhJQn7G/PIIo7QBmYwR0vjwIYCLa1jmah4EVEQ=
X-Gm-Gg: ASbGnct0EeKtBIDLZ8dNwCF2ISMD4ChaN4rfrNbGvXPMQXeF9u8otSVSRYhTSWavaQu
	g6e97PUlmj8rRW0m2jobHX0eAJip55+N7FCZD2Tw1RY1Gph5OuLF2+ToX1vPN8HkiYBsN1KFqIj
	bOxJGN8hMCxHV03XmRlijs6MzbXpTVJT3UMHfwb7zWoDBeeU4UrkJhcu9bFImS7d3OIoBgokqao
	VSmW605MD31rdUFgsnfW9aOT/mccl0m5lANZdu9Fz4pv0x6wV05CpwKTgYNHBREgA2Ubl4NRyI2
	uNONJlTI89ijSKpTsBYtjALfztb86lwBgT4wJTjxj1I1cooetDL6y2loQhsyT3vdxYV8JwaNSOE
	gSgk=
X-Received: by 2002:a05:620a:4692:b0:7c5:3ae8:4d6 with SMTP id af79cd13be357-7c5eda852cfmr516577985a.51.1743084740836;
        Thu, 27 Mar 2025 07:12:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaDnIyMisDNt/IMzJqGhZ316o8YifRrhjCXW1eC3YaF5GflhzvB1roO/YCVnm6c3SEcUv+YA==
X-Received: by 2002:a05:620a:4692:b0:7c5:3ae8:4d6 with SMTP id af79cd13be357-7c5eda852cfmr516573185a.51.1743084740354;
        Thu, 27 Mar 2025 07:12:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad650839asm2156336e87.190.2025.03.27.07.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:12:19 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:12:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: Re: [PATCH v1 2/8] arm64: dts: qcom: sc7280: Add WSA SoundWire and
 LPASS support
Message-ID: <xwspvzrzzhqqhpt5ix2a6itwizmgc7lcazxba2mteccg5d72tp@wrzcr3wflvlp>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <20250317054151.6095-3-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317054151.6095-3-quic_pkumpatl@quicinc.com>
X-Proofpoint-ORIG-GUID: -YaZ3FnVKIQgz2_E8nhl52ECys6GVCwt
X-Authority-Analysis: v=2.4 cv=FrcF/3rq c=1 sm=1 tr=0 ts=67e55cc6 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=ReR21a_A8SWDzpTlyHwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -YaZ3FnVKIQgz2_E8nhl52ECys6GVCwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=918
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270097

On Mon, Mar 17, 2025 at 11:11:45AM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add WSA macroLPASS Codecs along with SoundWire controller.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 68 ++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 39fbd3c40e47..90b2f6e2b7c0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2602,6 +2602,64 @@ swr1: soundwire@3230000 {
>  			status = "disabled";
>  		};
>  
> +		lpass_wsa_macro: codec@3240000 {
> +			compatible = "qcom,sc7280-lpass-wsa-macro";
> +			reg = <0x0 0x03240000 0x0 0x1000>;
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&lpass_wsa_swr_clk>, <&lpass_wsa_swr_data>;

pinctrl-N
pinctrl-names

> +
> +			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
> +				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
> +				 <&lpass_va_macro>;
> +			clock-names = "mclk", "npl", "fsgen";
> +

-- 
With best wishes
Dmitry
