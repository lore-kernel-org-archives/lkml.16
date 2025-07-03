Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455592E3AFF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544880; cv=none; b=LrcwZGCClIpgwFQUHJdjLyLhDSsMA1OYGw889lmBzna5okY7y7IYQS6nPlRH66OH+f68Yia+4oZLShFVsVtXs2kc1LK4RyOhKn/LaqWX+yXksTIhs0EzpMuOS5OXc2P921e83aowG7lMPHji0dvA0O2PPT1HQ3GJgCVJGr0wo3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544880; c=relaxed/simple;
	bh=NxTRFXEOSM97xS6sYUrK3OZV1E+9Shcf60A8QqXUvPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HJ586iDFjOSpVP4lnr86bRBzsPMuWmhwPoI6AZ1KNGs1/kKd/9qj/XhPFOmuDzIikP6zGzvBf5bt2f/CQ1WRev4KEMn5R9sFtCLAwQoLDcLFXxetKQzjMHhRK8XwWZmkxo05jfxJUbIj1Y++lka15DeNeYhbjbTDqEy4RVmSO60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4UhgkLL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4UhgkLL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563AJUdN026279
	for <linux-kernel@vger.kernel.org>; Thu, 3 Jul 2025 12:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h2x3WpVgowQyzY4em9pyKWoaGXSc06FpOT7YW7pB1lw=; b=g4UhgkLLr1VlwHfN
	wVL7Bj3Q5Nn7x1YdMiQ8oMgKdzy6ldIZ6NRpj2gkV+iNalwLwG7i9fdK4T7vngAn
	wACxt2VbL9ruvTNdep6qvs+C0Y2RwbjWgzrQ6AiDC2aWbgIZgsybjlq5ghkSwJ5D
	ncPDMQpGvB4pn4WB59CTmF7PVflGFuFnyRI7ZvwLMOAb40j3D7WkFBl1+G29gKFD
	F+zBuhoCfuiIioBvCay5n1p9XXk0tRBjKx5We1kWHZLsS5E3pZfoGhqackEMXGYB
	qfTtkbeSZ9DUUKJcdqlTzPmpX9a/b4hg+ZFQjUcGMg6cqePIirVa9NYOa0qqHBJh
	KJ4iMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64wg91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 12:14:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d094e04aa4so234018885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 05:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751544877; x=1752149677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2x3WpVgowQyzY4em9pyKWoaGXSc06FpOT7YW7pB1lw=;
        b=f1K+z9wYw3goa/BqOeHMl3Xhfe6uKh36g/8gVrOthE7wzPtX6XZgG4Cfq4khTcqFNv
         rxTVXqOP2cTibs+LcV3z/zE76P6m4h79m99q4hiRbXoprtyeJKB+3m2W0XDWcchvcaAT
         ENnCWKtd/WPaLPRnYfsJhGqEm11ySjm+9Ail/NbbT5m9/6CIJ/8Wzjz4bNYY1VWf0Yda
         D4PsNwRnk+heQxoolW0Xa/XDKhVUkRiHpyNP3+Jtrs9AUP1DriuWs1eTCPYguE20QOsW
         HqbMXreA7sIItidN1hE+RbKdp/DRrxeO8bw6pdheOR8rniAIbbGaRdrdB5R9QOPQ/O8N
         QXrA==
X-Forwarded-Encrypted: i=1; AJvYcCWMbZggvS/LeZqU4o2Kb5czMpqwrP01dMdK9l8Oa9z7lDkAQ3dzUF3NvpyoIqIByYJZA4VTTYjkwcOeLTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgNZnUmF7l3G0WbyOraheH+wUQQalGNRV5eYY+JIwJgoeYsiKU
	/r+LkcLtLnu8dyp/BOYs7P0r9SuOMkjT581QQSjeEhDvtqiXV3ORIBdUdVP0AazjWpmZexpOecV
	kJs2YcrUlOH4WT586yalJqTkCsWVQbMBSq8YXWsJKGcVOHVfAgS0+5f1oOlv8znz35tc=
X-Gm-Gg: ASbGncvG8J7O6KOvr7mL+tYN5qn48qOUqWYJZ+8E6MJXQ5Ye0RUjEJTl0CFyM1ZS3kZ
	4Jv+uWljkMxWERl9P1e/b8MvZwaS9a4U2Qej6Ww6XBXHtO0zF+460IdEBihrIxHVyXU+0kQvDu+
	b75yajAVhUrLl1ptk+9oOJ1743j2y3JIIFceJ3fXQSYCdMyxbzmpXCPNLXckwpfMNl6ovBk+F3E
	ulO1Ju/B6xwXmcNWnuuWPp5QY+KVFRibs/yfghVBh4Ixxrs7SatYpUIG03ipV9qBTG53F4eeQk1
	+fXQWah8bEcSnQrfGgltS3a0B1KXLqX8thPJtexoihtogCZOZA7yvGbJOn6LciDlRvuGI3O0q96
	EZB7XTp/R
X-Received: by 2002:a05:620a:4620:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7d5d3f957abmr99411285a.12.1751544876871;
        Thu, 03 Jul 2025 05:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMv5CgId/QhgXJ5gc0O6c/YrTGP1GxnRv/PEaNbJnkJ4hBNjdFtHUDliUBepNzEy+MEM5IEw==
X-Received: by 2002:a05:620a:4620:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7d5d3f957abmr99409185a.12.1751544876461;
        Thu, 03 Jul 2025 05:14:36 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c013b7sm1244061366b.80.2025.07.03.05.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:14:35 -0700 (PDT)
Message-ID: <9217c52e-f0c0-4e7e-a2c2-bfb580c7cb17@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 14:14:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830
 speakers amplifier
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250625082927.31038-1-quic_pkumpatl@quicinc.com>
 <20250625082927.31038-7-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625082927.31038-7-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6866742d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=ZTnHXLMoH8r4M2ZBRPgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwMSBTYWx0ZWRfX2SjdWXWO7DI1
 OE8quI/AV9q0Zc9D0G2WKWyCmFJQWDrINyPJ41ZkebMWFue2tRmlP1r/KnUE7jG6H/K5OvEY8cR
 4hd2YUXozVgNHtOX9XuKxSze5Jn61rf5pZxh4TYCGsadRdPagQbE4YO6mxuarJqhKp4cVpbTtK0
 NprIQq5saapUpy5GC+rpw4jKXLkHij08iHk5VMpnPwpFASJ3ATPMHiDRiR4boc6KNXzxa/BwAaY
 FLqlHFkFhQU6wkT1x5JiUopSep66hFydyc5Tinb9UWNxffI/XoCAdl6cWeEzAgPwz0+cvlBL0lr
 znQSj+5M7Xm/dw/e6LFBMDKKx5/IfCspYGfxdK7l8VSKJCz/4/0B0Mkb7XpFVU8ioNFtowFzgEe
 GQRpM9kLRcu/nx2p/Ymq6/kFxteIprqdheylvjYo2pxGFXSIlU5k0lZu6qAZhDSMd8X6KGzE
X-Proofpoint-GUID: sKmKbF27N-WPQQ8wNDYuDipUQML2WXMq
X-Proofpoint-ORIG-GUID: sKmKbF27N-WPQQ8wNDYuDipUQML2WXMq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030101



On 25-Jun-25 10:29, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.
> 
> Enable lpass_wsa and lpass_va macros along with pinctrl settings
> for audio.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     |  6 ++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 35 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          |  6 ++++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> index 6d3a9e171066..078936237e20 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> @@ -58,6 +58,12 @@ &lpass_va_macro {
>  	clock-names = "mclk",
>  		      "macro",
>  		      "dcodec";
> +
> +	pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>,
> +		    <&lpass_dmic23_clk>, <&lpass_dmic23_data>;
> +	pinctrl-names = "default";

This can be moved to sc7280.dtsi (and removed from IDP
and chromebook DTs as it's always assigned when VA macro is
enabled - they also make the same changes to the pinmux
properties that you make here) - perhaps in a separate
commit to keep things clear

otherwise, I this looks good as far as I'm concerned

Konrad
