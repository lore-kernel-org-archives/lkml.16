Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B182A272E68
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352866; cv=none; b=QFVL30i2Jr7MiCzQBTcgBpHuuvYmaPI8OGg1Xh0EDhRsFLBXHT7UZ8TEjjkh4bZvL8//n0qzsrK8DGAFE0+s9Rpl969QunHHYw3HSk9TX0fxgyR/aOyn3sQuTRntFxzbDJO2kRymM5wBVG8t7YG96y0DWiSREZywVoGkBtNRRck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352866; c=relaxed/simple;
	bh=d/P02J9qQY8iTl3rVzuh5p3XJF7As7wmADUufJt0/BY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbpmY9/hU/4dJRk3ZNZw1VuxA2IPWf7bnHQsw28i7U0jIHOZPeKEEiw5Me1E6KUG1S01duVPGDyBoiBZl0jkOJqdous09+9xmaVvN6yP7zsV4PExY6lfrn/gbn6aE21u9cfcPVEjYaRSXgFeRE5Xgit6OwGAR7Gdb3gRGBppBOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oftfNIZy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oftfNIZy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R4xlxl007169
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zj3vrTg/vim0PVZvflmCqYbXIcZKAQ+i8s0YX2bmBXY=; b=oftfNIZy+HwWfIMr
	iPJf78k5r2/5aEbnrGhi8KoGT3BZ3gDranc8kl0eM4fgGu4OuAb6eZCZ8d7w9eeo
	qUNKsWhRZXYG4ftW0WWLkYO+ButPV6dw0JF5txNAbmGShK241YamnRydwsBZSFYE
	K6rLjXNfWJRV96gr2VFZSd3ZVhrQDIRet/l1oo0ijtV4HF04H4utMnOz5NdNbk2A
	ZO2J5CosmL+ay+/PTPH8aFmWtjPWxjwNIl3etmbTriqpOio/KsJjt9L4msLXwQAu
	v3dXMYGAS7hbZ2nOvfLpBMfFcD7LULOwcvs17Yv0mConBHuAKeq5acKhQGQZFIIg
	Lg4xrA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549f0r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:34:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5530c2e01so36651085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748352862; x=1748957662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj3vrTg/vim0PVZvflmCqYbXIcZKAQ+i8s0YX2bmBXY=;
        b=NUfRQxkyMaKMVQ09JI8TEXx5bcFcr1hXG+KlZS+j0oZ/3isGYG44rMcBm91nR+awqA
         cX13b+P6/UKF6oMzn9WLtqvVtSXQeZSiBYasmUxqHxH1YRkIP0S60SaQghBnx2+0DrET
         4N/rH06NOdsZVu6nVOY15JnkaFnvaHgYHcvhNTRXdLTc97Ra+WGVy5kP8lOPOBVCKJbE
         ybFC2CHpYBE+hR789bApWY2zSt6ruyRw+1Z1hmUoOm6p/oTKMowi2GH80iP5NhTHleeJ
         NkcY5tPZTDW2oOvWLVxrSmXEA02PFsi6fpnz4chMyev10ROIYW1zTMt5GK6vFkNae1mg
         jQkw==
X-Forwarded-Encrypted: i=1; AJvYcCVv6glrH7d511i7XlHE3sMnucS6VCLztbIFY271dm5WkXfd1EkJMGJ7P625p2xum8faauNFfCLn+1HG/k4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1lTwtzhH26rvZLBshgCO1GsoiULSqIyHUt90wD9uaSgwDgMOO
	C/3TfmksgqEKZ1fH/wtdlpYjzTmZm1mPLdI6tF4xvEfL78G4/jWU7q8DT4vajXd8do24nWS1fdQ
	ICAbOGjdMUDvVRtEkf2kwtTzql3MPUQVYsBkg3B6bCAVGl0LuweSxGMgQABXCQxHLC9Q=
X-Gm-Gg: ASbGncvM/Gsyep1Akp+h9IDHi1HaO+zIPRAZ5EyWSzcf/Ycw20TVHKT4vogcBv2PMQM
	7bB2KKgmOSYl69wSAjmOK7f76Hb2K8SiR4pKRI8x1UV8gXJ6EAxIr0bWUPTDJX7aW8R6tRkJ3V+
	s4r+OLDus4eUuyExEOwANsKo3KeB5GzxTDJ7lfbC2m9goWRNze/HDNEp6YhJQ7UqPrAOZezfxL9
	6V92/68SIL46XpGazPG+7XGRVMIFBsduEoveKrev9t8VaTTP5u7jmzFXny8D+Mr8pCTY3L9dFUs
	jxG8shkhwyvKc0cxnDlxLkZvyHWcdeOFA+CUrz5ML+ZPB4PGvOPSSDis4QHCyxZedA==
X-Received: by 2002:a05:620a:bcc:b0:7ca:d396:11af with SMTP id af79cd13be357-7ceecc33efamr674542685a.15.1748352862480;
        Tue, 27 May 2025 06:34:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjlX2yUH3BsOWQUseqYtk4hJzkMKzeOB9JG5Z8E4YKWevQ8VORYoyV+OSVUqExMtXpm87OVg==
X-Received: by 2002:a05:620a:bcc:b0:7ca:d396:11af with SMTP id af79cd13be357-7ceecc33efamr674540585a.15.1748352862039;
        Tue, 27 May 2025 06:34:22 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad888f734f5sm152162266b.84.2025.05.27.06.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:34:21 -0700 (PDT)
Message-ID: <f2732e5a-7ba9-4ed3-8d33-bd2b996f9a1d@oss.qualcomm.com>
Date: Tue, 27 May 2025 15:34:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: ipq5018: Add GE PHY to internal
 mdio bus
To: george.moussalem@outlook.com, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-5-ddab8854e253@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525-ipq5018-ge-phy-v1-5-ddab8854e253@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lOTpKXyvwPD8lHOV41RHG6ZcMOEru_yn
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=6835bf5f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=KVjQAK92ZotTnYaee5gA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDExMCBTYWx0ZWRfX5/XHnTvCc4+u
 gB4vG3hstGdZAb2pmudmdpJAmEJnZI+6iDTa1a3HbikZV5JNePMc0Q3eyH4U6a4Vh2uXPW1mCsZ
 PTFVC0TF8cwcnlV+kGDHGz3cJZ18hxu9w2P5A4hwVnewbxe3Z+6isP7eF/P64S8aRRJ+Df6Ia4v
 i4zgLENz9Zp1crM7bTjyr5LM2JbhBrQEEPrAgGMlNtpJcP1FZKjARQ/1IAzRPfZZaTDw9aENeWs
 CU0Pxeo1kTbo+lekFNcPEs7ixOffMHNxVWjle18a7Lx2cipDN71OzDDxJVHwLahc3bqgbhVrvqA
 kO/OP3Loc6F2d31sSpYKs3mp4zSGgX/6gJry4tP5NdOGNc0DWPn6nVNGywQMtCJGJvKfQXbal0V
 UA1XXLV9uV5bbAmJRdWxV8cFBRT9SfN3uGeWXKmIoLkSw7FK0RxS4J+jyrO5q1/PO6P+oamI
X-Proofpoint-ORIG-GUID: lOTpKXyvwPD8lHOV41RHG6ZcMOEru_yn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270110

On 5/25/25 7:56 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The IPQ5018 SoC contains an internal GE PHY, always at phy address 7.
> As such, let's add the GE PHY node to the SoC dtsi.
> 
> In addition, the GE PHY outputs both the RX and TX clocks to the GCC
> which gate controls them and routes them back to the PHY itself.
> So let's create two DT fixed clocks and register them in the GCC node.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 03ebc3e305b267c98a034c41ce47a39269afce75..ff2de44f9b85993fb2d426f85676f7d54c5cf637 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -16,6 +16,18 @@ / {
>  	#size-cells = <2>;
>  
>  	clocks {
> +		gephy_rx_clk: gephy-rx-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <125000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		gephy_tx_clk: gephy-tx-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <125000000>;
> +			#clock-cells = <0>;
> +		};
> +
>  		sleep_clk: sleep-clk {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
> @@ -192,6 +204,17 @@ mdio0: mdio@88000 {
>  			clock-names = "gcc_mdio_ahb_clk";
>  
>  			status = "disabled";
> +
> +			ge_phy: ethernet-phy@7 {

drop the label unless it needs to be passed somewhere

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
