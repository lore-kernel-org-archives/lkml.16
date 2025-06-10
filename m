Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC3528B3EF
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553743; cv=none; b=g83XsNJL7pMbURL/wlIA7u+qk+9hpW4RNmUBWqwiLkIy8Zcin4obbYlu9tYLaWYT3mTukhLjjj1ZzG8uHahdkNDIA0xEZiGT0I8AUs0gPuxzD+8jnfYot2YCUJwWEn+kL6LKBu9g6Tj5pB2OP2MtsmaRI+c01API0LrqwQ1mg3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553743; c=relaxed/simple;
	bh=OuxlYYpKRxD7usymkX2lfps+kKcWWYmdxYcWmu919Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyyrY/Jo74WjZVvm/YBjjFPXxfjKcFRM2BFdt5BUTCh5lSHasKIQEZLTdmQm3HfzYbJTZTx9Ge1M62HG7/AwWXtEDP5UfSJLPkO0YeD5VkrBCpf8BNybse2rBdAoQ9AEqxN+j0/pKB5XrEcgaA+LXCawc13C7vHbY6MjOynReYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TTvxENWB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTvxENWB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9U8ob031343
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RRO1LVjJx/5BoAejkQrBHrD0
	HlTmpBzY0jUVoVo8gL4=; b=TTvxENWBt4wSO+/DbmHuJHde6djttEoNq+xx3FA5
	P+QbNGaCN9hZJcQDdYuUXMJohNAZ/M3yKraGfltPGp4Wa1tW5vCL4CtXFTWS86gP
	gG9vr58ZON6PNO55ym34wl2uQrGNQEkTfZ8XTqmHYmUtWX3UHYauflMsR5ItbTDF
	TYeO3p99IozZkHWlC9WUwXRG1o4cw8iFGfWpsDjo/C5ivuLD8K30Th0+y/NPI6yj
	a/gbq0c3TWWwX6qfvqjlzzKZsIlOFH4ggZ5WeOTPqdfR37rjD9bK1YSsSjU03iR+
	GgpKE0PS0tAREJevLQshnrIiReVSboWdF4Lhnwql9nzHuQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekprwmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:09:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e6f5so1341192385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553740; x=1750158540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRO1LVjJx/5BoAejkQrBHrD0HlTmpBzY0jUVoVo8gL4=;
        b=JQ2V1ud59ep9N2dDb/H17Lf2icv1FJyEDuEwOkUvEzUX6XBxOGXHO3TjAunmXNKXYS
         /bbPabliZzVKNBorelZJ/h3domjvLGIlhwYkYptyTZBl4kgnb1gH7/LzN/tp6lyNZQ+2
         HNhIsOHjaI4CHJLlHkMxyYWCaoar8Ivd8wM1huU93zN7tMFT1MSP5nZW0jse0qPBL3qc
         TD80kA/0Lw8h91J82IAXkXTyj/6ZUG1RdSi1FtSt2daY0TFMZDpREC5c7Ju5815T9g8L
         pY42UYbX+EDbaim88cnjzsq40rQc1dLrlKWkq1OUYCJn3jmxHDB0uoLjonCeOpZeNqx/
         nCDg==
X-Forwarded-Encrypted: i=1; AJvYcCVVKMiFyMn0lKYRX80VWrHgjQO7KWAvjBk95MGHlqUkv9Plt/tCTupFMppqyJubNKVL7QFZ10mhSE2Qw1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlwNaNELWUXU+xXizJBPniXeaI4LZF0dfw8vNhH0C34nAa12mb
	sszLwFBHM8v53Ll/WnAbWl8u6yqnQqIqVoaEdr7mX/sTitfRuTtCK4CM/11Ujn2/SPvM/wpXXqH
	WWwXpj0sTS195WhM0toLKJ8Wwvltx1Akt7hjL3fULtRDAOrqOnW8YXiQ/LH66xGWfNu0=
X-Gm-Gg: ASbGncu2d9tUGSjGVoiGJJnINBnNYcrVehVLswv27Y0oy1N6hkVA/SwD4DUcsE+MORe
	hzCWlR2JXQePI8Yzf5NQRTSYH7MxyDnRmvlNd6hb6d80z5Eyy08TuAOFa13a6A4X8CmJFk2idOJ
	QncqzCNBEBQSjgKwvrc405aYk8BvqC/Df2dLU88AEHogDzeEOMwvim20S4pgWz2nKJpNcD/0nd+
	tDinFc1TfQjo57b6evFv1LcyDvt7IGoyFHiK2POYcetq0BEeDtnyze3f4IBtRM9VefJepAD1YSl
	jRn50p+gCn7V31YpDRB87QFMp+MvtYjm5pllZ0a6Ilf/QIF9Z+sL61jEwFk6LYgJ+w/ydER8hid
	h2mNOCEHEu9wougaBsAGxDJDp12H94yUGBfY=
X-Received: by 2002:a05:620a:1a03:b0:7d0:a243:d5c5 with SMTP id af79cd13be357-7d229863013mr2388359985a.5.1749553740403;
        Tue, 10 Jun 2025 04:09:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf2S/Xw7rHK+GuKet0+88mZ8uKvvupXT9KiOLqZgjzbbHszn9+Ms80XTWb/7xwX2+AEhOHdg==
X-Received: by 2002:a05:620a:1a03:b0:7d0:a243:d5c5 with SMTP id af79cd13be357-7d229863013mr2388357385a.5.1749553740038;
        Tue, 10 Jun 2025 04:09:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367733280sm1516525e87.240.2025.06.10.04.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:08:59 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:08:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8450-qrd: Flatten usb
 controller node
Message-ID: <20250610110856.g5lv3p6engqwc6jk@umbar.lan>
References: <20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091805.2997546-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610091805.2997546-3-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6848124d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=07EEn82W8vC_Pu74Ip0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NiBTYWx0ZWRfX4VENRyXXbOYi
 vBSaNUrkDWTQkg6J7EsFevCFTmenyIUDGj62yyy50KVxTnif2GZnGlL6XIsBr7mRscy9pK4Exfj
 VDuqneW8OrcaXuhDUt/c+NN38jG31YOWA7p3xrRqr3jYBAYeGNCwUYe4NAKx7kplZ1kl7It3K/c
 az9gHKyeoIsv3+D0gLe2/NkZoVc5L2nolT8n9s+Cdu1yrmxUC1PoODOkO3QB2sVlztqkvRscNj8
 BCqhgjgSDfTResxnJ0A9/B81+51riNqaZb7PfVKVU8NYjM6WB/yhgh22eTeZQXE1VSYc6fn7UHA
 Y+wODa7Y0sXLLtJ4EYiXc5z6b2lfWd+rlJEF4QWH/9/DUALSQzXDkQXsJ4CEFikgbIsb4nLfmpT
 hSqcMRgoqkOVWl+FtEHyf10BpPcHUPOUzrtPkLTElcbwl4dkNtaorhix0AKU489XkwLneSzj
X-Proofpoint-GUID: JxdQt5esaUBoRRNWXD3RbeCbVvnFVuu5
X-Proofpoint-ORIG-GUID: JxdQt5esaUBoRRNWXD3RbeCbVvnFVuu5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=706 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100086

On Tue, Jun 10, 2025 at 02:48:05PM +0530, Krishna Kurapati wrote:
> Flatten usb controller node and update to using latest bindings
> and flattened driver approach.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 60 +++++++++++++++++++++++--
>  1 file changed, 57 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> index 0580408485eb..bd6cb895b65b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> @@ -500,19 +500,73 @@ &ufs_mem_phy {
>  	vdda-pll-supply = <&vreg_l6b_1p2>;
>  };
>  
> +/delete-node/ &usb_1_dwc3;
> +
>  &usb_1 {
> -	status = "okay";
> -};
> +	compatible = "qcom,sm8450-dwc3", "qcom,snps-dwc3";
> +	reg = <0x0 0x0a600000 0x0 0x10000>;

All these properties should go to the sm8450.dtsi rather than rewriting
them in the board file.

> +
> +	/delete-property/ ranges;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&pdc 14 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> +			      <&pdc 17 IRQ_TYPE_EDGE_BOTH>;
> +	interrupt-names = "dwc_usb3",
> +			  "pwr_event",
> +			  "hs_phy_irq",
> +			  "dp_hs_phy_irq",
> +			  "dm_hs_phy_irq",
> +			  "ss_phy_irq";
> +
> +	iommus = <&apps_smmu 0x0 0x0>;
> +
> +	maximum-speed = "super-speed-plus";
> +
> +	phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
> +	phy-names = "usb2-phy", "usb3-phy";
> +
> +	snps,dis_u2_susphy_quirk;
> +	snps,dis_enblslpm_quirk;
> +	snps,dis-u1-entry-quirk;
> +	snps,dis-u2-entry-quirk;
>  
> -&usb_1_dwc3 {
>  	dr_mode = "otg";
>  	usb-role-switch;
> +	wakeup-source;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			usb_1_dwc3_hs: endpoint {
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			usb_1_dwc3_ss: endpoint {
> +			};
> +		};
> +	};
>  };
>  
>  &usb_1_dwc3_hs {
>  	remote-endpoint = <&pmic_glink_hs_in>;
>  };
>  
> +&usb_1_dwc3_ss {
> +	remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;

This is a part of the SoC routing, so it should go to sm8450.dtsi too.

> +};
> +
>  &usb_1_hsphy {
>  	status = "okay";
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
