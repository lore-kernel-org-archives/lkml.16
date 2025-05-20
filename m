Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3037C288CA5
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771917; cv=none; b=RzyRZifMfMFhquzxSq8XWe9zUueQP3zWY7WqHDlD7I4bMX1PwC6P+pzVMwdKtSE7qIbe/PUt64ChnkuDPpjRUHuCxhUCNCHrml2y99X9QH5DWneRJVRsrAo+pmZCes865zAUEmNNLS6sFtOh7ZtDV48SKz23shOlMbXGQiLRAHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771917; c=relaxed/simple;
	bh=lf5r2wM+gWSyxkofv+4fH4wCygy/kakxH7guIFLmfd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LplYsLqsS0t9uX6699PpV/4Ti49eDHbDHFUb/Xg4AH2KKhmPQvo8dkAXnt5/sLRnkw0uTpEk+2qYaeckLof/qA+Wt7RtAiXMmZZae0+MTG1gN4tOM8zX5f7l5RJzqKwxR0LWTzWKJDbkIn85KnI8HXgGNZ23BhmrlcTIHG37RBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jp7YlTW4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jp7YlTW4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGhx2D029021
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JmLDKTMzuwuVTtW266uV4nw5LyID1iKNvQ6npmle/Ic=; b=jp7YlTW450nG0WeQ
	486jxcu18YFc8o9HTFsecUO7ZLeqgFE2z/uTbIBQdFyePrXRO8CchSNMa3W6uTRz
	Ej5yOfr/1zkR+8m17bXYLkH0icu1FoBmJUwq9eHsy7XlLkLMYVtr+V7XNHH3n8eh
	nGWoQbGSn9VxA4Zx9FFmK6uEiHJoCncCJt6XhUSH167Pft80xdZdHSqceOwft8S+
	Q/EBiU+T/5qE3CBhwBMtdVpEcAmG2JCgmxgGAgxfVY0SvTLAsoTxOy/OS4jkOrNp
	MrGf4M5edF6Vv9t5EtNszLs4HE4Dn+oAJzr/WGxaJ+LFP/UOFExDkM4N2viDZWUD
	OCcD6A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf00hvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:11:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54734292aso171210285a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771914; x=1748376714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JmLDKTMzuwuVTtW266uV4nw5LyID1iKNvQ6npmle/Ic=;
        b=akQ6pcP/GcomDmMOSqE74sZKJGwQzUW706eArv4k23XVm8IpUgNYF1w6fVMwVopJaz
         Uzl13Ltart+bRLdG+u2LDXJ0mkC3MY0wO2/TG2PMPfcYqJ5LOB+88NZE1zozrXJOHwTp
         y29go8uui7qOl0hUhGXm3JeZ+ymdchVZ8i3Wfl0Lp3+j1T1auYgrNUXxyCnRTrgQcLn8
         1bxprlhfa1PHTd+ZNxPEYNRmeH1+9I1DGUEA44jQzkxewy32K/U4msCeHLOF+G54D6ox
         2yWKhD/IP5SYATIZhV6snKCaLivOpRRoX5mAjHj24zSMwPZqM7WCM/Y66rJ0i26Ws5WP
         hgtA==
X-Gm-Message-State: AOJu0Yw5z2KhErFrHXYt5lTmjl+1eIHj0EvfUc8ctoy3mGbszgNHXF+r
	hsxRJz5AabLbHLyQIsLIuq/oCsNVUoEd85xtgVHxRgtfk2FYHfATszOXV+WTX30BZuvgIs5FWHJ
	TDwo9shaiCWHZz7QkX3/MTxpwzEat20NkdnWjVU+OnM0Ww3KeeeHwGIf0ZTsvh70FaAg=
X-Gm-Gg: ASbGncsQNs+DXxy4OsEENeM7Ay7kVSp1wGTJYmjLMMUmutmpeLGckQFbZOL23oo2Qnp
	GnEhzyETt0ivvfa17GXCrphPQeR32m+inFvg2+Jq79WYnc2c5CTnIfcVU9CZX/vZAkh41sjrISl
	gPdv3Xy50XS5EA/gqtKtEbSP2v00Y3/j0AsblU2RQS1tg0xe+qSxjP3InJtjOd+dfqr61WH5Iv5
	LnkBajoCpvDx7Vtr3a4Tjta4QS+SNDDTqV0S8emkmh+4n+6V3odooTWiSOou/y7HNC0elVecljh
	feTIhtTOJWtQW9GvJ91ntY+8g/OMs5tZZRhAXqm+lLknEfpIUmBfR5+brnUxAopD1w==
X-Received: by 2002:a05:620a:6011:b0:7c5:ba85:357e with SMTP id af79cd13be357-7cd4670a6c3mr1189380785a.3.1747771913939;
        Tue, 20 May 2025 13:11:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyzuWFlHh0j0Gw6RSmsJ2bBhmR0N482udldB75GhgJ0zvzi5X83XCYG+N2BLCT3Z7jVlI4Aw==
X-Received: by 2002:a05:620a:6011:b0:7c5:ba85:357e with SMTP id af79cd13be357-7cd4670a6c3mr1189378885a.3.1747771913432;
        Tue, 20 May 2025 13:11:53 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d498d05sm791783566b.149.2025.05.20.13.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 13:11:52 -0700 (PDT)
Message-ID: <121568c3-a6b2-4772-8c28-7453aa0ef3b3@oss.qualcomm.com>
Date: Tue, 20 May 2025 22:11:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8939: Add camss and cci
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xi3nNit__C896z-ydWlfsg11wD_IDoOF
X-Proofpoint-ORIG-GUID: xi3nNit__C896z-ydWlfsg11wD_IDoOF
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682ce20b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=bmytIewYy0Yx7_8Z9RYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MiBTYWx0ZWRfX4XabihK+VGOO
 5Vr4JGjzBYyCT+cjLQnUCKKrx6l7Ug9W1HOhop1H011Sd5PfFFv11+8U4UY+RkGymSbTQQdNZXo
 V9FAb+sje1ZUTOS9EmoU8wj1NTOdQzNPFzH7EwKNhFlB4HNzCol9LqaIO2fdX5ibXUJ/tio6RkL
 r4piw68/jXKkzp/xlaiex/ugJbqqEXzwo5dJSyh+qe9DOPBRAvFz6mBGedL9Vw0NzsW4zf68pzZ
 f7lbP1ZgqUZf7JIyI4hITiAsR7xw5wyslkpeakR1xtFTiRH8D0ahhdxwWmpl/vQSPznqZI1Dlo3
 LtDz+rjFE2WaeTq1td5AKAD3ty42LNt3bZrS0JXKitlUuV7AwIPFKG2tnhTo9+rU0Vh9WsPiYro
 9Psb+3s2lXYpWq1T9OJw/lIXWcd2jxLI+Fwfqr8Fv2gJauBx4ukoHcaZ56emj938ItmhPdUY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=875 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200162

On 5/20/25 8:39 PM, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 615.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---

[...]

> +			interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "csiphy0",
> +					  "csiphy1",
> +					  "csid0",
> +					  "csid1",
> +					  "csid2",

docs don't mention the interrupt of csid0, but this soc is very old so
something might have gotten lost..

[...]

> +		cci: cci@1b0c000 {
> +			compatible = "qcom,msm8916-cci", "qcom,msm8226-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;

please move these two above status

> +			reg = <0x01b0c000 0x1000>;
> +			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_CCI_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_CCI_CLK>,
> +				 <&gcc GCC_CAMSS_AHB_CLK>;

camss_ahb should be unnecessary, maybe ispif_ahb too

Konrad
