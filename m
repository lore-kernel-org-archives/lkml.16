Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C072798F8
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748369730; cv=none; b=LeVbXcdp+1AiqmRw0+mPIenNWckxOZPH8U59VV2IQUyGr7zE6QODl3A0/hHyOJN7h4szQ7vsLVFNd+5bBHxF3Ux7D5+kAXjN6ojmjoHwLmWkiIG8cxQbDKIBRVagj9L4G1vvuWSgiU0ZJ8UiMxZbA/jQlOw53f/YfJi1ozqFvjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748369730; c=relaxed/simple;
	bh=zxQjR+nrUWNNLX+WQ5kgnXyHQ2cMKdlioEaSfwbXPMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+DMZG36n1DKOUp7KXOo/qPBrwRfVp6RKzNvfEd6CsB8v2YGx7fi0FYreHbqEXH/tiShMy2GjIhkPlv9evmNTVq5AN3X3UcWjDa48d7O5iicdMh8+JGFDknNaHMRu1upV4j8vnLi3+o74lr89M5cJuNgGOXXne1m1fdzxgfSN08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p78TEFY2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p78TEFY2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RBBmnq023081
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5FrToTgKpEpyWJyX95g1VDxp
	8dgYn5P0X/JsOpxJh/o=; b=p78TEFY2jsQtyhhi+hAXNn3jFQlqxg6hW44xxEHY
	dJxX8sPwnGrkdkOsaA+hMZ9MlouECNtEyrEPOv0WlVxGQqtrEl0/vHnOQ4SgJrcC
	zI1L7YFNoWb0LHiUKEIx+mON0ZtgsBoy38hpY1PNfBCDQ3SHXXUdGCV5ojzm3+ea
	Ha/lB94wG72keMuPeXa5QLqNFU2d/OaSn2wQLc+Lu+B33WRW8ihtM9SO48XU+F4F
	3Wbk1sPj7W+V2XGDPLUfGiVMtjIF7pdCtQSuz+qOtcVN9NMGPitdKxsH/i4gicm3
	z9MVA7MKHqWKlullz0JluK294yjLp2WSLGnF95krjnHhfA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjqthw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:15:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faa443fb86so31002266d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748369727; x=1748974527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FrToTgKpEpyWJyX95g1VDxp8dgYn5P0X/JsOpxJh/o=;
        b=ERxZ+KR/5ocoOtpS9bowIu1kPBIjkHCtOuPBewHE+GeTP5f/apk/MxyUKYT+75czWU
         0WTVDAWclOBTE5uMEownP7dvYHFKAQvN3BiFotPKKcyCpSwqec2C+hFoS5m/CSGSq4U0
         7xkvfsokyfDSsjaxI5cjReLdwF+7Nf3Ma0LC/hQ6D1BvEhQzVzskbaPWRSqAlMNLC5S0
         Tz/RkszY2pwiHBGxMh+qp++ZMlapg2gf72wxufQq4qOQxP3tIa13Mp/5d9X7wn0GYq2w
         vnmXXg2X2lx6xYpgz1c54D1dec9r5tcaduRW9o118elMYwYNwNm5IB1zOQktf6mabAhJ
         iDcw==
X-Forwarded-Encrypted: i=1; AJvYcCWxfdhpWyluE4s72jGANITXPOymuFmZ3r52hRFW2mMGbml3m4S/z1YKfw9qwa12EJADwD0g8Zo7xjwp4fM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8iiVyQXh9KLkt+XCsl+qzQKUPjLZJk6FU50PMHkQPce3aE913
	6aDjQYUDT9ih/yGgcW7pvyVeCmfpFA09mdA4HnF11h8r1VSDqNohaU5YsWaumQqQrg8/Z/dgq69
	bm9pcBqWVA96So5qRSMOaQdXUQRjOB744jpRGwVmHHmLKu2hdBP0FPJQWrWfC6NQPRFI=
X-Gm-Gg: ASbGncubaIK56uavgSvsrJXx4egcIAQ3z6Q3CX4bX4G0KH7d5N2bUROVOsHlDnQvuPK
	ajtzU4K/dpg6/bDNpATzy0SvPHb1ZEL89wOAQryQ9pI5tSxU1hJrG2t7mdcqr8GQhHCKIxjheQn
	0ETYYzjDGpIyHj+ePE7decWAYWT/1vjHy4dvcheJeKdck77vIEYwHcfl/lwsSuDaRJFW3a1eFdT
	9CorcKdq8ev/nXq8EpXu0oEI/NaaxzwcrIusKjjBE48sS5bPySgyfg7F1rY8GC3qA0MOGnmrfWS
	7wA2uJ3gYFP3VGSzqQk9udcwSg/1fMIh++JoAqoRT3LUWM5mCBRGKOzOdvmYuk5BHE7r4YmEeyo
	=
X-Received: by 2002:a05:6214:401b:b0:6fa:99e5:3282 with SMTP id 6a1803df08f44-6fa9d2b15edmr237865296d6.39.1748369727123;
        Tue, 27 May 2025 11:15:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXA/YzgkL1inn42Tt4wzjgLoOU4auPxjkwT8XZ9UwiD7dtmlkR653zVXKnH6yCJzQBikHEPQ==
X-Received: by 2002:a05:6214:401b:b0:6fa:99e5:3282 with SMTP id 6a1803df08f44-6fa9d2b15edmr237864726d6.39.1748369726743;
        Tue, 27 May 2025 11:15:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5521d86fe3dsm1720727e87.29.2025.05.27.11.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 11:15:25 -0700 (PDT)
Date: Tue, 27 May 2025 21:15:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cheng Jiang <quic_chejiang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_jiaymao@quicinc.com, quic_zijuhu@quicinc.com,
        quic_mohamull@quicinc.com
Subject: Re: [PATCH v1] arm64: dts: qcom: Add Bluetooth support for qcs9075
 IQ-9075-EVK
Message-ID: <ecn6rv7ase2h2q3qjseunu5unftgicynvvrshd23j6ctxzd43p@bge5fhiq3cps>
References: <20250526054228.221095-1-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526054228.221095-1-quic_chejiang@quicinc.com>
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68360140 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=rGHGw5yESEm4sh0OadwA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: iIG7654q2oyGQE7pg7trRLbyLqsEiCCd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE1MSBTYWx0ZWRfX5haUmC14hVMT
 DWKFg5Y9CvIgEiA39MZ/dRQpEw1pNUIhKYaHHlTeZwYoYQJFgtHqXk3v5fsTIuaJCC9a1kMnJI8
 C1QFIxOUaaAUww5O/J6afbGTAyxATs8TV1v8wI2Pie6hiHel8yOLCOem3AUS1tek22e8zspKV9t
 QFEJDfamWPz7o7iPnc1rMkNXsq65Mbz6hdtZNR1tzVprH1GajLeq4lSrHOj7bw9/RYjct3lzccF
 tyzcwrXT8f/SBsSEM6V377xkXwawE4dpURwdCxRjFYPKCq9sVTI8rNFNhGV64YUlPL+uGTHtmxj
 rodAmYt9MjuAmpeK4G57ANHzBFLYTgRXFF4vvD1NhiDRP477ZdwsEpfqD9m2//jrItTdSwClytD
 /Wqjr00IWpQMuQtX1srdwviqntHLMXWUXG2B5Bf70Es8TRoSFRJlwSZuZmJ3ap4MxFmk5oqO
X-Proofpoint-GUID: iIG7654q2oyGQE7pg7trRLbyLqsEiCCd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270151

On Mon, May 26, 2025 at 01:42:28PM +0800, Cheng Jiang wrote:
> Add Bluetooth support for qcs9075 IQ-9075-EVK
> 
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---
>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> @@ -273,6 +300,21 @@ &uart10 {
>  	status = "okay";
>  };
>  
> +&uart17 {
> +	pinctrl-0 = <&qup_uart17_default>;
> +	pinctrl-names = "default";
> +	qcom,load-firmware;
> +	qcom,xfer-mode = <1>;
> +	status = "okay";
> +
> +	/* HS UART Instance */
> +	bluetooth: bluetooth {
> +		compatible = "qcom,wcn6855-bt";

NAK, missing PMU supplies. This wasn't tested against schema. Please
read internal docs on sending kernel patches before sending the next
iteration.

> +		pinctrl-names = "default";
> +		max-speed = <3200000>;
> +	};
> +};
> +
>  &xo_board_clk {
>  	clock-frequency = <38400000>;
>  };
> 
> base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
> prerequisite-patch-id: 853eaf437b81f6fa9bd6d36e6ed5350acaf73017
> prerequisite-patch-id: 6d9fd3e0257f120cff342c287774454aad2be2e8
> prerequisite-patch-id: 736cbcd47d5e7cfcc53fcaa7da920eac757ce487
> prerequisite-patch-id: 4eddce6daeaa125f14380586c759f8cb8997c601
> prerequisite-patch-id: baac180e8715b5cf2922f79346440d92569704f6
> prerequisite-patch-id: 65730290d31f18e66e2ba0dfdeb1844d7442c272
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
