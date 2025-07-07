Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6C1218E99
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879380; cv=none; b=juePV/grcOrSHsx4Rpg4U0hvLNr/0PEuqopXhpD0GrHqWC2YqQS/d7nNuqwkiUfYj4K0+L7i5kfSBrEBH3WpmolP/h5SOkOUPq8zRD4F5z3bXTYYdkMvbiau/rx00PDosz0Xd7uJYSvCkL+DpmXBvmBlJtkpZ0AtzQ5vFKG690Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879380; c=relaxed/simple;
	bh=peFKZhFwedKK68dIFIi4REQ/qFa/6M/SrX4nzwboeGs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBY6SfR1GHo4xWhmnMSNCZNiSrhKx5cxUH2gyK6rSYQQNh8oHvIZfCSB9hTQoVxaWeYilrKp+U3/zlEt3K0yItuniP6inxjR6r5wQb6Py5HkhbxeXdgL1bvxqi8+O/7eg2WYzVptJ9uIx3eKsVCiYMz1qWkEPD3UfTEq563eBH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjulOvaN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjulOvaN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56792cQ8023578
	for <linux-kernel@vger.kernel.org>; Mon, 7 Jul 2025 09:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VeHPkLQlAJtFoDvPLLCaGfKY
	61RilrGEq+YmYIpz8WQ=; b=KjulOvaNTNDb76cComAJ5M8Hwz+y49/Vt/Y+5bGE
	uW9kg+NHEzRYFUhg2cBUpwCMjzrN9nLcMQnxVuvki9fgncllv3TNufZsxOoL1V0M
	GivYPOK8qQ3L41JPSVj+9BEQJd9kvA+LtodIVkbo5MX938g40+HTJ15QPwic8ONJ
	nJcAlERhsIReY8sYI3XFQAh2IEL6ANPkMRJjZ65bfUP2wT5/0q3+W2JkO4hbPXNH
	WWPHF4aeirQ2H6EFO3dFohpte6nolFy2QeGbktq7sHAA0M/TOxI4XsYb2BVpzczH
	C7j0icpUUdAOV3bzfNpyXq1ByAALs8EjXjClIJQ8yh3R2Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrkbmj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 09:09:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d40d2308a4so395515885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879376; x=1752484176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeHPkLQlAJtFoDvPLLCaGfKY61RilrGEq+YmYIpz8WQ=;
        b=LmqCbkWcjfvDNug+NcXjqlmQngb+SSPyahZJ8ZOensDjhOACPZtsHAMdi2W3YG6g+g
         8URWdw3ts33Pys0TE41PzydhN90gRViXp1/iqQwWETLJQP8l+snhLR3fg1/nThyJrAd/
         j6CEz2QN82n/cD/G57eMxNxeroAaWorMFHEchuoOanJVkRczA1uGjckBs2H3hwPU4Abx
         c8gT+8R86/n6XlF1GgcxVkEDlOt5nloxtDr6G6OeRjvybxMdS3b7vfwKM6GaBTJatoyo
         BKZF3a7KtNTRTy7UB932aI4r1Sq/nIV5GmcNKESIJri3B6V3W23T32NapaEFbkUTzXpF
         HwDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+V71ZBnXQXLcHryeziMf3GsfCOUriJVJwHlO2HlmZnHtDlDDFCAph5D/GBaalIuE0DgVa5Qxwm1Kie1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBtiT38971CoMKs0rq3ghTu1Of9mYKffKEAG+NYvv3MlMxaHXl
	f+kPLLwJpAdLRwTmO6YhBiAvGX2PWouktsuOW6Fj4q0lQKe0QnbgBsHDiTcJ/qQF5STjhbr+0f1
	frco/cbsA43oQhpJ4v0KQp8XzVw5W+9l3v7aQ2t07I31PM6Y/mcnFneHzVb+o/0vLx2M=
X-Gm-Gg: ASbGncvJbVT2i696N94UM3Ea25A2Bi14iaxXeVsjC9c52Q1zC1dNnD5D6/aIHv/111L
	JkqQQvTC9n8lpmyH/Yzd533wzSKpdddU4dOlAME+39tt5a37gs+8yuIEe2fzh0r+wQdyme6dycH
	nGQXIY85dT/DgZuXrvIrFRPYP60K0qU1LIdFLBXt7a5JRZONvAJjcHagOYmclVPCw8I51IQcBnI
	V9Hkqm5l+EhApAQC7ZRKf5fkfLNM9SA8igAvUbnzmPvGWVw30ILd8r0dZQlGwj5enZF5fCSbOAe
	DtUeayemo904yy564UdTai0MzIpkde6eg662JiQacZNSx3c95VgOiIk=
X-Received: by 2002:a05:620a:199f:b0:7c7:a602:66ee with SMTP id af79cd13be357-7d5ef0fe66dmr992952085a.10.1751879375870;
        Mon, 07 Jul 2025 02:09:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkFAscEaQYMChKaP818khtKeWZorHRhJFez5DUN7e7xcaSYzI61t7Vo/NC+j8GjNSpIQbQbA==
X-Received: by 2002:a05:620a:199f:b0:7c7:a602:66ee with SMTP id af79cd13be357-7d5ef0fe66dmr992948085a.10.1751879375228;
        Mon, 07 Jul 2025 02:09:35 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225a755sm9625686f8f.78.2025.07.07.02.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:09:34 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:09:33 +0200
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aGuOzdCu5UmKDF94@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-5-jorge.ramirez@oss.qualcomm.com>
 <ded874b1-715d-a7a7-fd0d-3b98fd5fd029@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ded874b1-715d-a7a7-fd0d-3b98fd5fd029@quicinc.com>
X-Proofpoint-ORIG-GUID: svBclrWoWFxGoa7fHlTdgH5QuG04NRnV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MiBTYWx0ZWRfX7SMrWpvh8YSE
 250FMTnJxZIWeHuaxZ4Nqjv1TXV7sSuAVNXSqhpPJbdKN2UUWeEuGXqnH9Wy5VjSvmD1gkhYH73
 nJnyRjJ4tLKE8uDMqeNc9RtBgY2gQmKaBWBGEkGEG4t0ICXay141FloArJkXpG5uMwzTwPL9aPK
 B7lp9oVK4JwEGgt2jgUWwVEo4LxpNz7tF11vtU8IG9wEvFjadZ7vY1pV6S4ytCtiUXeJWrwN1q2
 69EksuvhN0l6eC9Ae5eu25uKP9cQPgSngzWTaFcCnapeGvIHSfcTuje2iiXZWSKeVm5Q+U4hmTf
 ckoPudESekKHbrOX4Q1h0x0h1SemKhSOjxQvgkAGAKW3v24qb3kHDBh24G9xbStuQA6mP9MnrMD
 ylvaqsGDY07p0dLO/USiFLaKHmJLUnIBnGtG3e1M14y5S9QBj/mcafv+O72ZhdM9x7EVALAv
X-Proofpoint-GUID: svBclrWoWFxGoa7fHlTdgH5QuG04NRnV
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686b8ed1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=JosbUmaTz5S-ISoLy78A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070052

On 27/06/25 18:46:10, Dikshita Agarwal wrote:
> 
> 
> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> > Add a qcm2290 compatible binding to the venus core.
> > 
> > Video encoding support is not exposed until the relevant hardware
> > capabilities are enabled.
> > 
> > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > index 736ef53d988d..f1f211ca1ce2 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -1062,6 +1062,44 @@ static const struct venus_resources sc7280_res = {
> >  	.enc_nodename = "video-encoder",
> >  };
> >  
> > +static const struct freq_tbl qcm2290_freq_table[] = {
> > +	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
> > +	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
> > +};
> > +
> fix this corner.

ok, will wait for Vikash to confirm the other ones.

> > +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> > +	{ 244800, 2128000, 0, 2128000, 0}, /* 1920x1088 @ 30 */
> > +};
> > +
> what is the reference for this?
> > +static const struct venus_resources qcm2290_res = {
> > +	.freq_tbl = qcm2290_freq_table,
> > +	.freq_tbl_size = ARRAY_SIZE(qcm2290_freq_table),
> > +	.bw_tbl_dec = qcm2290_bw_table_dec,
> > +	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
> > +	.clks = { "core", "iface", "bus", "throttle" },
> > +	.clks_num = 4,
> > +	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> > +	.vcodec_clks_num = 2,
> > +	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
> > +	.vcodec_pmdomains_num = 2,
> > +	.opp_pmdomain = (const char *[]) { "cx" },
> > +	.vcodec_num = 1,
> > +	.hfi_version = HFI_VERSION_6XX_LITE,
> s/HFI_VERSION_6XX_LITE/HFI_VERSION_4XX_LITE

um right, going to rewrite this whole bit and get rid of
6XX_LITE/4XX_LITE (will post 4XX with a lite option instead, which is
closer to the intended abstraction - even though the 6XX/4XX
abstractions are kind of dubious...)

> 
> Thanks,
> Dikshita
> > +	.vpu_version = VPU_VERSION_AR50_LITE,
> > +	.max_load = 352800,
> > +	.num_vpp_pipes = 1,
> > +	.vmem_id = VIDC_RESOURCE_NONE,
> > +	.vmem_size = 0,
> > +	.vmem_addr = 0,
> > +	.cp_start = 0,
> > +	.cp_size = 0x70800000,
> > +	.cp_nonpixel_start = 0x1000000,
> > +	.cp_nonpixel_size = 0x24800000,
> > +	.dma_mask = 0xe0000000 - 1,
> > +	.fwname = "qcom/venus-6.0/venus.mbn",
> > +	.dec_nodename = "video-decoder",
> > +};
> > +
> >  static const struct of_device_id venus_dt_match[] = {
> >  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
> >  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> > @@ -1072,6 +1110,7 @@ static const struct of_device_id venus_dt_match[] = {
> >  	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
> >  	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
> >  	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
> > +	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, venus_dt_match);
