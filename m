Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD6A244685
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065618; cv=none; b=fT11qhopOafgRvKjhA8XvFUcfCRELmsqUsepbJb50ipq8tCo+vTvf2iEjLML0aQSPP7W/sj+g+BqXYDXhzog7Pmi9jM3B9KZyu7ZZBfjXr7wDj6X5u0ew0NI5sLh5d4ilqZy7JbzetB9KZLSReZwJzkB4Jw1OFXY/5c3Vbu3LUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065618; c=relaxed/simple;
	bh=7CYZ9riknA472ksZ+IraasbprFF2j0liMKhXc25tang=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRGjEip5fo+/PiWbMPiQ8wT6W1sC4xs1xIKi6/lMd4iOUg7yk6o6sptWM7s6l6z1xB9t8miL0dOBp5SlZDUAYcM7P/LudTAj/xoeHwsB5CxG14pAweCGjc3cyift4cIRUsSyfNrGiPOwBvjJd4ZYxiBUbu21qhcsOfS/CHnc/c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmw8PO4p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mmw8PO4p"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C9MxEM022312
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jVsnjHIPMc4UjE20nXbN/0Gh
	CASBV1MVcwaZVTJw9co=; b=mmw8PO4p8phC89FVBOUEwZAILQonYdmf3Xkj18Av
	t1EDSmy0cFmU8nax+fKaZ+Eetc1u6jIUyX6meRs2FFmrh4pvW2ngLmzjnTecrpTB
	QmK15c8SxFqo6sBWs+9AKFA/mp4K6hIzBA3geQmhs/3hQGz7+xakQnhJcgFcDp+u
	GpCtgqGhnSEQDUDfBzFOZ9weIF5GldxVn7O1sgXrvl4kgIjSXCqDM51Zlz7hqFeY
	aqYBsyF13n/eWpCkItMm4PGmfWvWdDkwv+iNQzAuvpuvW1aEnVyUiiT/xnJGLGT+
	3F2NrdGFaF4gVFgOw4H1+KXUoHyfgzsiaDuNE+tmzEOM0g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hy15vvb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:00:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5b9333642so539792685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747065614; x=1747670414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVsnjHIPMc4UjE20nXbN/0GhCASBV1MVcwaZVTJw9co=;
        b=XcdfOH2I9bti6sAH9F+me2eSFO6onJ16JJdWtaFHozrwB3iA2FxWq2h45a4dBNTFv5
         b+aQj3GewbiF3UQc0pxBpBAHxaS2O1IndAG+xEikrqY8s7usaur5laOV/r65MDQVngnJ
         E3kpPn0cOOlANZ1SqhsZ0+hu+uadpkPnCeYel0tFYpKS7u0aSu5mWpYQ4yqQRVqLh+mu
         Q85n5PgDnt6Vai6qWbb02usI+M6JYwGHIkSyKAEFGao2hE5Ag0Z0BzCceOjXTkriFdtB
         q/F/cA55v7xHmGMh5m2Vh8Awyg1KpOzBQE9CUCWxZJEqWmHbexqFwNRxBsTFljGKuY2V
         HBFg==
X-Forwarded-Encrypted: i=1; AJvYcCXgryzzaHDRJSVfasEKVyHMmRynVSKq1BOxzgX4ovcQPO6TLQ3S50cqny8vP3kc6C71JwRUwQAGbnpz/pM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx63qLkn4S/FuTWzfbKAda4sHk0AOERS4zydQXlslPrmp3MsByy
	V6LW9H8xbAw7GSeYP9dNn0hHGbYX5x8bKCBEo9Ree76KUjemaGov4u2selBoZSTOmR6tj4NtUSO
	Do2RHGN4k/GzGy0BQICSrd5m18c29qAX6ZVsDv2DShv0m+Y/98co0wzR72Gw3kTQ=
X-Gm-Gg: ASbGncvjLABboKrvCinqkFlVmgsrqtqJumPqJx28TcC+bJcVfq/WORpQc8CaKBlZCt+
	JbQXDnJvdvibAYjBvdHRTvM/FCp16lICR/3q8t11rEYCTqmOtYlGRIOn5jtkbLEe6+5CEQiWNgB
	0e8OtWSm9tuAwZfN9JWxBz+ooIEkDlCMBnrHV3qdpFYvB0VpcheL/UOk7+RvQp5nqr7tQ5izM75
	EeUtf2uabsZjVUmH8u70KzDqhjHeTjYo1XEWYVxujpnG1Q5yZzrAfTahQomlZcEYZqa07Dn6eaC
	yf3sqz7mYGyUIOTkXCxCxk2f2KbtLiD46r0HAzcNal52WHZDTSGg5vRLcwPPh5OllJcAsQ7T8Us
	=
X-Received: by 2002:a05:620a:254c:b0:7ca:df2c:e112 with SMTP id af79cd13be357-7cd0113e3fcmr1865053185a.45.1747065612168;
        Mon, 12 May 2025 09:00:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcgCdyq3zyS28tN3F2p/Ex+KYAVnsB2ZDiCcC9Z5PrA9qpZZZLy2A7EDKvjbQNL/WjcEU2bg==
X-Received: by 2002:a05:620a:254c:b0:7ca:df2c:e112 with SMTP id af79cd13be357-7cd0113e3fcmr1865000085a.45.1747065608247;
        Mon, 12 May 2025 09:00:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c3502dc8sm12723831fa.79.2025.05.12.09.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:00:07 -0700 (PDT)
Date: Mon, 12 May 2025 19:00:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Nitin Rawat <quic_nitirawa@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org, krzk+dt@kernel.org,
        robh@kernel.org, mani@kernel.org, conor+dt@kernel.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        beanhuo@micron.com, peter.wang@mediatek.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 1/3] scsi: ufs: dt-bindings: Document UFS Disable LPM
 property
Message-ID: <34kz7pj7bjbmpfyrlwf2u4vikrbbmga5mxv2i7x3zga57qysg7@oou3m2rbazdb>
References: <20250506163705.31518-1-quic_nitirawa@quicinc.com>
 <20250506163705.31518-2-quic_nitirawa@quicinc.com>
 <667e43a7-a33c-491b-83ca-fe06a2a5d9c3@kernel.org>
 <9974cf1d-6929-4c7f-8472-fd19c7a40b12@quicinc.com>
 <8ebe4439-eab8-456a-ac91-b53956eab633@quicinc.com>
 <852e3d10-5bf8-4b2e-9447-fe15c1aaf3ba@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <852e3d10-5bf8-4b2e-9447-fe15c1aaf3ba@quicinc.com>
X-Proofpoint-GUID: MIPeNUSGgvrlReZxPJ4JzQ-pqrazkTp-
X-Proofpoint-ORIG-GUID: MIPeNUSGgvrlReZxPJ4JzQ-pqrazkTp-
X-Authority-Analysis: v=2.4 cv=P9U6hjAu c=1 sm=1 tr=0 ts=68221b0f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=L0YddVROYn7RqkBwd_kA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE2NSBTYWx0ZWRfX9Ysx67MGg7zf
 S9pfhexQ6yu6qDrMSDSucbaXlpOa8sqrIE+NfPv4rrom+sVywXOVgK95xVzY7JiRexdO48FPxq2
 gKCejQNm5XM3XVwYwW6NZQgr0GE52Bw1tesYQ6ACEDXAcege53vdQpdO8k9+D6M4MIGEbtZmjDk
 Cyq9OEy+i8vCoH+CJz26uDCXNJA80LYqwXxKwGQGTdhrrSFwJDLlQ5CGpFKAxl4seIlYQPSWxJz
 tJCjYgrzWTE2XZG1m/RB7eyMbB69yKLKz9BzI4YkB3ckmTsoNlIdimZuQUyc5pBFmi7qKrTJoW3
 gGTYYlKt0Ezgn6ArawdT1HeZCFjSjeWQD9FEpuAEc94bYG63myo2EKNFNNEavm5Qzlu0LQIZcE8
 pPRdgzo/UfqdU2mKtIencJeJgMeuQopip+SG80x31+uEKqdkSKj1UteYI7zIMGDg4x83CD4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120165

On Mon, May 12, 2025 at 01:11:08PM +0530, Pavan Kondeti wrote:
> On Mon, May 12, 2025 at 09:45:49AM +0530, Nitin Rawat wrote:
> > 
> > 
> > On 5/7/2025 8:34 PM, Nitin Rawat wrote:
> > > 
> > > 
> > > On 5/6/2025 11:46 PM, Krzysztof Kozlowski wrote:
> > > > On 06/05/2025 18:37, Nitin Rawat wrote:
> > > > > Disable UFS low power mode on emulation FPGA platforms or other
> > > > > platforms
> > > > 
> > > > Why wouldn't you like to test LPM also on FPGA designs? I do not see
> > > > here correlation.
> > > 
> > > Hi Krzysztof,
> > > 
> > > Since the FPGA platform doesn't support UFS Low Power Modes (such as the
> > > AutoHibern8 feature specified in the UFS specification), I have included
> > > this information in the hardware description (i.e dts).
> > 
> > 
> > Hi Krzysztof,
> > 
> > Could you please share your thoughts on my above comment? If you still see
> > concerns, I may need to consider other options like modparam.
> > 
> 
> I understand why you are inclining towards the module param here. Before
> we take that route,
> 
> Is it possible to use a different compatible (for ex: qcom,sm8650-emu-ufshc) for UFS controller
> on the emulation platform and apply the quirk in the driver based on the device_get_match_data()
> based detection?

Emulation platforms are generally not visible and not supported by the
upstream Linux kernel. During the bringup stage you can apply any kind
of quirks, but I don't think that FPGA or emulation are of concern to
the upstream kernel.

-- 
With best wishes
Dmitry
