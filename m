Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E66253F1B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776721; cv=none; b=p6rmvUdhNYUUq675p1treeggO037ls8xot3AxUfsrqn0u74YDLGjycoflwP7tsGJAmAFtkDTPXjSEnHhkfWPN9hLz7eNySVxAXAOD8g99fbe+JBSbi8V52dkkCMBZob99+avjN+KQczGE8QgIERpbo4ZLOqo8gjCrozbGffbQ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776721; c=relaxed/simple;
	bh=HrumOK1lD/TxRKWp4CXD9ZjpAsCHHBFPGhttXykXyuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3oRKTpk+uqB6XvZHJzcCqwEo6xWC4SRW85B6fWlBjiajMYHeW5n3tZhhKEbOOCNDFICZyygg6vo/jlceJmHLz+8FVXOelxm6gFeLypMqWB2zoJcVq3w+EJBhXDg9CwRhRCCC86HpDexdZOrnmjBJdSAMEl0V7oTncy5QPnR5IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZeP1pZjg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZeP1pZjg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGi606007796
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	228HrrCuuX1HRGPycnehYOiQbNMU4YvNE3lwMK2PIuE=; b=ZeP1pZjglGeCXCsC
	pcpScdyBaTyMp40+3IZODWiRD4PAdP6gWw2rRpKWmhL861inMfSQ9r2+OA0zhpc8
	HLWCpY+2DDHpXVeuleMTqFaUMb+7+BjzFZ9fKJpTWZqVYcNaZtAFg7ODRFwsLW0M
	IZuu6MpT8NX/Kk0uJia/22UYZR3VzTbKqCQGNZfXAZUY7KVI25b4w0ZQhFjtu1Nz
	cZD1wFG3Gm4GektXQt2Gy1sT9CPCEDfKxBq7xBBYsg54ZdaraCXnnuu0e2ZhjlMT
	o+K5PFk+1rw0mc5e4z0Ta1XLhcfvobShPVMwux5KuaNSbz09BuUlf9i15lsmjN61
	TPf3jw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6rp5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:31:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8bdefcb39so75030926d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747776718; x=1748381518;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=228HrrCuuX1HRGPycnehYOiQbNMU4YvNE3lwMK2PIuE=;
        b=cVrZJs24+3qN0xd1/DlGZr44T0NrLdO3FmPFmiePvhCOpKIpmr/yk9PyuiMW81VLPq
         KV73dK2D8hMNLm2UGePxeiiJHbxmN6t1RaIt7DSRnzA3iL6S9oZcQpaHOcV3Vwm7Qpz3
         UrypVsMvph2VmSeiHARia/rNqJ3SQ8B+UzuUtgFUln+5wEAMAFw79rgvxFXD480GlqPQ
         c6BHahtBTsOteMMqIhgIvZBfNWIH6h8k1FCb0CCixn7+0c2TcDCEI4xQqEc6MzG8Dv8/
         SlDHbIn/rAS63FBMs25v3AS4NIFz5xP7i3X9Skaq0+4Aak3Dj0spxmEmCtl0cp9w/xfx
         1byA==
X-Forwarded-Encrypted: i=1; AJvYcCWVwJzXgmIUekmUPIn6xw6MOPqvRCn43wkp3ISi+FvPW8JgCznOJWbP2Gwad0Jp/VGLHbfRx8oisJ53kk0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Uu4EMvw37BpJRZExbfytARzMy8lBPkaYUreTRWzB9Fr8vJy1
	7VgfdhBX0OnNjpSsySTDVCKlKh+geBHWFjm61m1dHV9QP5QF8zNU/hMqoLcbudtPL9eV6FB6fhL
	ono9JAztjiflJJQeXus4X1VQo4vqO2E39BRaDfi3fyD4CpyF9dZfot8vBmAvjZLZBcF8=
X-Gm-Gg: ASbGncsW/Vu1A+IukAYeJ1iHfGfP69Pak7k9eF6OykC4QBDnk24N3+IhABjwo4WonMc
	5f2hA81gyNUgwljJ3FKB0PDjoEDRlTMYcmu/hxDSX89EXpX6yj9Jn2V5z/ij0EkhfJh2hwFQ0UL
	xnJ1TLXVS4D4siU51T3ZjKLK7Fdk9ZD1xnf4LGbuvfs0LUQ0yEaYvAy8gwBqFW+BFFE1X+ILRbd
	2jSY+d3vq7m4pPL5NI6W2qNEcXvj6zmHS7PiP2h5YH4M8XC/lPtXyKTCUicV7RyTTXdhhAtfL6Q
	dvpV6f3M9e5i5NLo+vpuveLMVE1IAs4fnBp1QZllzQyqsUt3c9qbHvotj+WLTR7lPs2Jh66ThBo
	=
X-Received: by 2002:a05:6214:20c2:b0:6f8:cbaf:468b with SMTP id 6a1803df08f44-6f8cbaf4afcmr206722956d6.9.1747776717927;
        Tue, 20 May 2025 14:31:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzGFw0ReLy0rYNMlKSRzU7jDAyhoHTDEg4/RZ+gRpFWj1CnjjsVCutbb0+HA7GYlp4CuOmBA==
X-Received: by 2002:a05:6214:20c2:b0:6f8:cbaf:468b with SMTP id 6a1803df08f44-6f8cbaf4afcmr206722386d6.9.1747776717461;
        Tue, 20 May 2025 14:31:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085edc14sm24746141fa.107.2025.05.20.14.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:31:55 -0700 (PDT)
Date: Wed, 21 May 2025 00:31:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taeyoung Kwon <xoduddk12345@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taeyoung Kwon <Taeyoung.Kwon@telit.com>
Subject: Re: [PATCH v1] power: reset: qcom-pon: Rename variables to use
 generic naming
Message-ID: <uwkqsapadx62dvuauuiqx2bmy32sbiebrszyliksbcjhn2jcr3@o6qevejpn4u2>
References: <20250520212740.2729-1-Taeyoung.Kwon@telit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250520212740.2729-1-Taeyoung.Kwon@telit.com>
X-Proofpoint-GUID: o6MSNgnHWGdO7RI9m-5sWTOMvsFEKJNe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3MyBTYWx0ZWRfX5aXJDDBkfmVS
 5P/8qrdBzFBRuvLtgw5dUJZqXM4xUKOWi63PvKx92+1xYTWihi8rNbOJHjnADRzP+WJzFlUB42Y
 g4ZD2nksZGKVx8gcEdddJngVtIP5tB1UUuc4eICfkQAcC3EMhu9uRvHrKZyv8nCpntP/GMmLtzd
 TimLR9BlFvW4rKlHPBLiv+yOD8RZQf7a7LQ8KV0lCEpec8MMsHXs4pNGWzJzSdMTL4Jy5feKsTr
 dz7rittu3VvDWwI2s4bkKZKnj+EbGI9cDjB5o8ti8mpdR3n/YfE/TheQbmatFQT6hxu/6+9qDIu
 ctpZPUoItUIGvrDqYXEXsOG7HgAh+fmSNfnV2YmuHbdi+xJx8KCMdU06mdSs7mBATiRya0OlgUK
 A9RaqMoh7C3ugkd0YVwuolM9cqlJMoyqcoQE1jt25kVjU23WOANReY0HRHhbWDbR6brkc73d
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682cf4ce cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=8xVn4GeRAAAA:8 a=Npgqdn6Q5xmw3uMjWK4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=By6hKCY_mHIbKsINY6vW:22
X-Proofpoint-ORIG-GUID: o6MSNgnHWGdO7RI9m-5sWTOMvsFEKJNe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200173

On Tue, May 20, 2025 at 09:27:20PM +0000, Taeyoung Kwon wrote:
> The qcom-pon driver was originally implemented for the PM8916 PMIC, and
> as a result, several internal variable names still refer to 'pm8916'.
> However, the driver has since been extended to support other PMICs as
> well.
> 
> This patch renames those variables to use more generic and consistent
> names, improving clarity and reducing confusion for non-PM8916 devices.
> 
> Signed-off-by: Taeyoung Kwon <Taeyoung.Kwon@telit.com>
> ---
> From: Taeyoung Kwon <Taeyoung.Kwon@telit.com>

I'm sorry for not being clear enough. This should be the first line of
the commit message text (with an empty line afterwards).

> 
> Changes in v1:
> - Moved explanation under the '---' line
> 
> Since my company email automatically adds a footer signature,
> I’m sending this patch from my personal Gmail account.
> Is this acceptable, or should I resend the patch using
> an email that matches the Signed-off-by line?
> 
>  drivers/power/reset/qcom-pon.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
> index 1344b361a475..7e108982a582 100644
> --- a/drivers/power/reset/qcom-pon.c
> +++ b/drivers/power/reset/qcom-pon.c
> @@ -19,7 +19,7 @@
>  
>  #define NO_REASON_SHIFT			0
>  
> -struct pm8916_pon {
> +struct qcom_pon {
>  	struct device *dev;
>  	struct regmap *regmap;
>  	u32 baseaddr;
> @@ -27,11 +27,11 @@ struct pm8916_pon {
>  	long reason_shift;
>  };
>  
> -static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
> +static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
>  				    unsigned int magic)
>  {
> -	struct pm8916_pon *pon = container_of
> -			(reboot, struct pm8916_pon, reboot_mode);
> +	struct qcom_pon *pon = container_of
> +			(reboot, struct qcom_pon, reboot_mode);
>  	int ret;
>  
>  	ret = regmap_update_bits(pon->regmap,
> @@ -44,9 +44,9 @@ static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
>  	return ret;
>  }
>  
> -static int pm8916_pon_probe(struct platform_device *pdev)
> +static int qcom_pon_probe(struct platform_device *pdev)
>  {
> -	struct pm8916_pon *pon;
> +	struct qcom_pon *pon;
>  	long reason_shift;
>  	int error;
>  
> @@ -72,7 +72,7 @@ static int pm8916_pon_probe(struct platform_device *pdev)
>  	if (reason_shift != NO_REASON_SHIFT) {
>  		pon->reboot_mode.dev = &pdev->dev;
>  		pon->reason_shift = reason_shift;
> -		pon->reboot_mode.write = pm8916_reboot_mode_write;
> +		pon->reboot_mode.write = qcom_pon_reboot_mode_write;
>  		error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
>  		if (error) {
>  			dev_err(&pdev->dev, "can't register reboot mode\n");
> @@ -85,7 +85,7 @@ static int pm8916_pon_probe(struct platform_device *pdev)
>  	return devm_of_platform_populate(&pdev->dev);
>  }
>  
> -static const struct of_device_id pm8916_pon_id_table[] = {
> +static const struct of_device_id qcom_pon_id_table[] = {
>  	{ .compatible = "qcom,pm8916-pon", .data = (void *)GEN1_REASON_SHIFT },
>  	{ .compatible = "qcom,pm8941-pon", .data = (void *)NO_REASON_SHIFT },
>  	{ .compatible = "qcom,pms405-pon", .data = (void *)GEN1_REASON_SHIFT },
> @@ -93,16 +93,16 @@ static const struct of_device_id pm8916_pon_id_table[] = {
>  	{ .compatible = "qcom,pmk8350-pon", .data = (void *)GEN2_REASON_SHIFT },
>  	{ }
>  };
> -MODULE_DEVICE_TABLE(of, pm8916_pon_id_table);
> +MODULE_DEVICE_TABLE(of, qcom_pon_id_table);
>  
> -static struct platform_driver pm8916_pon_driver = {
> -	.probe = pm8916_pon_probe,
> +static struct platform_driver qcom_pon_driver = {
> +	.probe = qcom_pon_probe,
>  	.driver = {
> -		.name = "pm8916-pon",
> -		.of_match_table = pm8916_pon_id_table,
> +		.name = "qcom-pon",
> +		.of_match_table = qcom_pon_id_table,
>  	},
>  };
> -module_platform_driver(pm8916_pon_driver);
> +module_platform_driver(qcom_pon_driver);
>  
> -MODULE_DESCRIPTION("pm8916 Power On driver");
> +MODULE_DESCRIPTION("Qualcomm Power On driver");
>  MODULE_LICENSE("GPL v2");
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
