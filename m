Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE39A27A108
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857311; cv=none; b=WxBo+XyOjnI/JXNUxVRP4/rDLM3N/YhZXH4ZyisMzdtSx4C2kB50dVDth3Sxxu6uu+5Q56iS38V38ru712Osp4zQzdMOjGxoSRFmIZwx0Dy8a2WJERMqplLQ4g3st4/IttNFjLygetwWWC5VkyYnZ4B3xrK8/DHd7Vs34IBOGns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857311; c=relaxed/simple;
	bh=FAk+/hIlJrLqvDt63zVfUl7GDqkiGBuO0+vRufRCo78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbSZ6azJ2CJmUWuqwUWYMNJ8unSXnUfCxxk7KzVZXx5XuRCjkv0+Ft9R23RfDJTW13mf4Jj9XSK/+GooWSX3HbImT3MDRJEA5SqO8qJoLBxjn9p5ew0xwcayGkKPHTt1DyVaGOnYYBes9PO/jJJKZtbaGM59LPQnR1gW/TKPMss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drqJPcga; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drqJPcga"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACs8C002373
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zhk8zfFYK4MnpIXkJbMSmC3IFiPYjxX4pByTlAx/9gI=; b=drqJPcgaOkfRvzbc
	q3Z7ZGrv42FsrIzKBCTn1tF1XqfIhOtPdqFUnT35mIocHjCauHomlDpn69PU8tms
	eMGFSGoHDWDEf7A7V9hsq2LJ1v9/f67WnY8aHWql4Wie9NRtr4TwPR+dQ/x/50cg
	V8cLTRb7tFFJDVtKheVEkiGbZtYIa4AZOdsmpLPbABaelNOdxO1M80xif8/rOEPp
	8TapgnnX4LSdm2nLdH4btN2gBtt+OqAW7sZL2mCE+MH+UefTJkw0duv5+sxxyM0n
	zDcXpX1zt9MbQvcpl2CEWH8gTCq38GZLna7oibbcFfVT1EaQhqvohxzSHI++tgRb
	qecozg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9hqdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:21:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e900f6dcadso107365066d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857307; x=1746462107;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhk8zfFYK4MnpIXkJbMSmC3IFiPYjxX4pByTlAx/9gI=;
        b=b9o2FhlpHDXKEgN9kIvK/cOuVVrdJTxQjPoTaLB9/rU596+/EwaeyGI7XqynAp94gy
         HXF2us4nEGXNrIgH0lgfYYs+EwRk215UBW9SUod7cdnLSVhgvHLU/LH0VuNWfwGqrMkp
         cRD9Ay69JbBc8iVdn+c2cJINyBUdyOu0Ka8J16kZQD8hWOVikS5V9Ijjd9MmKk6XDxNh
         lUWthpmbmTtVc9gHl4fjlxP0yp//57vScdlqjNhcaQN7dBPkzQq/CHYqYCzistHN7YTD
         1Y9kHubSMYjRnERQkB/pkkycxPbYPoISfB5jkHhm+PfykPFkN51XV7KDPLz5dabsNz/1
         54jA==
X-Forwarded-Encrypted: i=1; AJvYcCXSGcJikM7W6Jz22cKG2MJ6Uxil/tLfCi8AiYHxdC96rErqbEr4Kp2ws9OM/XbJyEfTpofoIYYiW1UMR/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfzIFptNUUT8xMLrkjpk5pNIUFrrcvJTqUkTSdbBtaJddzAf08
	OBRs5jrkh4EgaofbmBBX9PeupXAAxHgIjJH3Lvldh/CXU/C55m3RQuPOqlxjsx3ypHchyHMITrf
	bffsUlJOXjm4KnARu1p7IY4mKlO3VIVO5s6l1C6S0p+nqXuOSzaQRc7REq2ze89s=
X-Gm-Gg: ASbGnctS5BneTc5MChZp/xyz4ItjYz6pFGMmLvlkKyCP6NUn1yRrdbr3ycceB8cqAFd
	OGsz9HCp5y8sXYLysbJ34ZlO+oeWnkpoDLLs5T3IKWLpGDRjhhavG8AJDepYE3IDKK5c0z26Xsq
	gEmnG+527vzQMzhq2oit7vU98qf8p1326kbe3J0D1IClmbrF7zkDuQ8lTWwRuhBwS5HKri052zK
	o9kGD4JDnSraq/pmfRyAZ/sdwHGCd0qDijRdgz62HKdgSbOP4QgSYeL79eGIBpJqhD+XEfY3W/4
	KaecHpl9dXxOp7L6O9TR1ik9h9PU7j8jc4WOdDuwW0I1RqGu2Lojrba28NsS95Z42SWkH21+olA
	=
X-Received: by 2002:a05:6214:19c4:b0:6e8:ee68:b4a1 with SMTP id 6a1803df08f44-6f4f058f110mr8388566d6.8.1745857307499;
        Mon, 28 Apr 2025 09:21:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIYoaNvRKG8//OnEjJanG3jFa3ZUwfVxoxZBR/HajeaP9e2qMwZlbuXIpdWarKogjDWjKqsg==
X-Received: by 2002:a05:6214:19c4:b0:6e8:ee68:b4a1 with SMTP id 6a1803df08f44-6f4f058f110mr8387916d6.8.1745857307149;
        Mon, 28 Apr 2025 09:21:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e8fd2d823sm1057195e87.194.2025.04.28.09.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:21:46 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:21:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8998-lenovo-miix-630: add Venus
 node
Message-ID: <vxwbzzds4lkixt2zsvjwnmfk22u3mmvp3cqk36aak2thomyagu@znr6b7gcue6w>
References: <20250425-miix-630-venus-v2-1-cdfca385a0c8@oss.qualcomm.com>
 <CAOCk7NrcpwAnUKcVsc5D03Aazt=qWLZB034xa2FH2PF9LuL6ZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOCk7NrcpwAnUKcVsc5D03Aazt=qWLZB034xa2FH2PF9LuL6ZA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=680fab1c cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uAVbjTU27lTVuhHKzXQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: dUgjau0VcVqPb9rNEYrkDdGrHnZZC45T
X-Proofpoint-ORIG-GUID: dUgjau0VcVqPb9rNEYrkDdGrHnZZC45T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzNCBTYWx0ZWRfX8xfRvWNNqAlZ NkMGQj+hIdoc96CmeteRuNH0uOuyLC75DFp4bGWkxtIitZb+g3H6R6msSCBgHRi/vQsViQRP6Jx Lb8Bqpiks9aAn6XWRir0A8ukK4lU+AOH5lZO8WkJdzT19h5lsF4246zQSM8YiMDoBKO9F5+0h2z
 Xy/zZbN1CqurbC3SwF/fpTqSeLHpkZpNB5zSJe6VRqAq4iPnj78zGVeyiedMZHjiGnKwQ9PjUQQ zIqeVHM8o5IY93HBxcKdpAPVvZQVh1yp08sVe4Hzz7hEtx+M+bw9CCaHJuYuDI6DM+h9+FJtop/ Bz+MQqJzP+43GJy6+lh/nMoUgYeDG+b6Fj2UuCXmu5+bS6v5tdSyIQtgPAPh28ZyXzsnOvUKAES
 cK0klARF7FSRSr6LvxgUoKdFG8m3kYYd5yKMwEhUFCR2bLJCkLAwE5Y6SMfD1lbFvYRuclEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280134

On Mon, Apr 28, 2025 at 09:40:52AM -0600, Jeffrey Hugo wrote:
> On Fri, Apr 25, 2025 at 12:28 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > Enable Venus on Lenovo Miix 630 and specify corresponding firmware file.
> 
> I'm curious, how did this get validated?  I didn't think there was
> enough infrastructure enabled on this platform to check that the
> lights were even on on in Venus.

I must admit, I basically checked that the firmware starts up. Marc
Gonzalez worked on enablement of Venus on MSM8998 (on the freebox), so I
didn't perform a thorough check.

> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Rebasde on top of linux-next
> > - Link to v1: https://lore.kernel.org/r/20250408-miix-630-venus-v1-1-771c330ee279@oss.qualcomm.com
> > ---
> >  arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >

-- 
With best wishes
Dmitry
