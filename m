Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE6D23E226
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675054; cv=none; b=f3lQ4cOZlISTXgv/MFBJPPGnsfKaQ/pCGfCkzwv75iqg+7qsbcTlpFdJhKwGZceDNjok8iJhzCIAdbC3cQt0AxjMw9Co5F/Yb4MmMaAJNBAHqniYRNv0GElskE4XpW7PqWqfeIz0qO5NUoEtuINPNWExdKJ5X/FY9nrtlt6XeAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675054; c=relaxed/simple;
	bh=VRkcVAvlmM7U9ceHOVRpjmmW5OytTG/ymeGHFUzaEaM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXvUMczO2z22+Nr678/mrLP4hYb00f54Uuc4KSMXIzo05/V2kpg6IblL6BwlIDViq1z5XBaQnOjRjzNoVk+21r7u460VCP0/qc1d4ULA6qq2awsLKE8tT9xJ1BqXA89sIKdAl1OSxqO1+N2Il6o6VBx1FoRxsrmcphxRaPwW6rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMvKP3R2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMvKP3R2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N935OB015379
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=leITEvhNbIA3HBfs0Llyq+Bt
	xtCRt8LPOfjElItrCN4=; b=YMvKP3R2f+6G1lkCMCdp4RoRoM2C0Hl+pIYP0Hcz
	WUMgC6EwRXGwAzBbjc60q3iPUmmGzlBB91E/BkWmIqT+CXcIDeSB6w0qbPd7bnXn
	6rXxacK2w0pOBso6n9g9utdcHQlARVbGicCEkAjyKrvbc7UGBGrZEO9/+p4bcrQ1
	TpFQPxvixp6FiFodXESzwoXbXZ/D5D2+fa6FZ/UQDSX2F6j/L3gkRdfFvE1v1R3V
	ZVIh2DgLge9JlmDMELX9RSVPZa+uxf7Vzj4zL0ciUJzjIMr2hFDwscmwltU3EBfi
	nIR/p+tDUVPicBQuaU9EZ4j0FLICowY9tAGhzKQy6bRUWw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3xu0987-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:37:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7cf6c53390eso317479285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675051; x=1751279851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leITEvhNbIA3HBfs0Llyq+BtxtCRt8LPOfjElItrCN4=;
        b=UcoBl2uzem95+f8MVIUCvWf5dZkvVxMq+KxjJOPPYOMgbUAGiflhmpdfx/gIRnq4bW
         bF4gduIQlDJDzWOlFbJBnRD/lEMvmj08p/FIa5sucS/yPA+7HemJENSNd/iHYn5kNZ48
         g888M4us80+FKhKm9PBnxQTESeoKohIDFwtdLUJ/u/To4mz7wAhHoeTWalf33AVzhN9g
         0Rk8S927iyzIeMVHj4FWyehlVC1VWdqOxjQgCyZgRValMyq+Pj5wqiVF4gtFUccQAJW+
         w/kJ7OhqygrU8q7u3WvedGRfcPywHvISH0L8JpSL+yrtsYsS/VlAG0WW1Tw02sHNWCNt
         kmFg==
X-Forwarded-Encrypted: i=1; AJvYcCWGwjl4V7QxFAG2uTqAMWN8iqaLbpZfkdkg1TXtmra3FVe881w1nOA2knDaTwPf+Ea7x4i+vVDV+i481To=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/MeKdTsbPEhsclD/KvcKWd+lACw/sx/JDCq8VReCcRBj4CVPd
	FQAXdu1h7VieU4riZTLetdzaUT2Zc07fOilShxV6aqElU0MQpZ2ZIdlCMMHd9DqNXTbg/X7FIiy
	YBIjwenpmePbK1Qlc607VVKCZEF8PihjFF0IHxctWxGKNyfmTeDZwXYnlMRPAddWqB4I=
X-Gm-Gg: ASbGncuoTDTscYAvYydh0HpwInKut/13QIWqu9+6lJ3z8TAH8Rv+iYtZrHeSI285jRU
	OaAHTaUA1TTULVEGxXoznumDnHuo/01dWK9HHwGnG/8uwQOJt+ZNR+jjfC0f6qtN2PyWXprVJdQ
	BeS313LDBF5LJadqxA+CWpmFG2A5/6lCQD1osgxvMNeuPWA6qyDJjHecC4aoUqbB60nnGTu8GJR
	FdlFcvhaPF8t/Gv6lzBVoFfrYs6W5rckcp/CoC/fz7ppjVD6Nkjgjms8wixN9eJcqVjOD10M5Rn
	dGO4mPjXP//FxB+zzkic5yV7uh0w2tFDnSyK4p4JMc68V0trwxfhbNbKLA==
X-Received: by 2002:a05:620a:2a06:b0:7d2:18a1:cd5 with SMTP id af79cd13be357-7d3f991d083mr1522387485a.29.1750675050619;
        Mon, 23 Jun 2025 03:37:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMAT0xj77s12T2hK9ZEAB6ex/fQeYnsFhmNXg4Ho8aEgDSqSfcCHzHooRpdLzLj3ZtSj8vew==
X-Received: by 2002:a05:620a:2a06:b0:7d2:18a1:cd5 with SMTP id af79cd13be357-7d3f991d083mr1522385485a.29.1750675050139;
        Mon, 23 Jun 2025 03:37:30 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eada7adsm141603765e9.35.2025.06.23.03.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:37:29 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 23 Jun 2025 12:37:28 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] media: venus: Add QCM2290 support with AR50_LITE
 core
Message-ID: <aFkuaHqkn4I9hNPz@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
 <8c8bccd6-9a46-4ebf-aeaf-01f52570c0be@kernel.org>
 <aFkLVOkYZMHqEMrh@trex>
 <8122072a-eaa1-45d2-85c0-35e5cf5fe9f4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8122072a-eaa1-45d2-85c0-35e5cf5fe9f4@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MyBTYWx0ZWRfX4qKJb21vU9ZA
 2Ovv+NGGVamTHGD2aaC7+h6qFkV4ywx9LBZt0wKkF70ewesUIsCyHu8aGXpzqJC1ztvpCD7VS0k
 B43oBHoqkO5Ad6AYZixRT1ukCiB7aY3id9aeeZijYUuQmgHaWB3zvpDwUcVG6O84TeW/oCA003p
 1IkXPKSqEst9VW7afuWbGbK03HmdSw8GwYPNFbFr+Kn+D8iwossBsbhSmsVXxKFVRxZWV/U/Jt4
 o+tMmvHDmb/7D1uivGxWOgtMfd6WcRygxSpepXRrkXfZ4esSwiYP2TzNegPquTkfrJJjBjC7ik9
 G72pWWuRHHMrJU8c8prsf47seT3qAY7R8JA3Dc5JNfWg606lVMybltxMFn1NjN1Jwy7lz+3asRT
 jeA/xu63/sdP5xGZgM1ceqdtvoll2YPpFIUDFeBXrRt71CTUI/3GkUK8HCKvIYxkdh9ZxyzX
X-Authority-Analysis: v=2.4 cv=SvuQ6OO0 c=1 sm=1 tr=0 ts=68592e6b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=Q-gSnpzN10fIn__zEeYA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: 6Rw9FGi_zDFZBCHbQ8RFNErD4ZcCWz-y
X-Proofpoint-GUID: 6Rw9FGi_zDFZBCHbQ8RFNErD4ZcCWz-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=926 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230063

On 23/06/25 10:39:25, Krzysztof Kozlowski wrote:
> On 23/06/2025 10:07, Jorge Ramirez wrote:
> > On 23/06/25 09:55:25, Krzysztof Kozlowski wrote:
> >> On 23/06/2025 09:49, Jorge Ramirez-Ortiz wrote:
> >>> Changes since v2:
> >>> - Removed IS_HFI/IS_VPU macros
> >>> - checkpatch.pl --strict fixes:
> >>>   - convert macro to static inline to avoid argument reuse side effect
> >>>
> >> Do not attach (thread) your patchsets to some other threads (unrelated
> >> or older versions). This buries them deep in the mailbox and might
> >> interfere with applying entire sets.
> > 
> > ah interesting, I was reading somewhere that sets should be threaded.
> > sure will stop doing that (found it super annoying as well)
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L831
>

thanks will respin the patchset to version 4 without waiting then; if
this happened to you it will have happened to others. sorry about it.


> Best regards,
> Krzysztof
