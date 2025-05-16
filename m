Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBD022DFF3
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747432103; cv=none; b=uAxozi3UcLVlBVHjz11ZHwhKTsF0h+0PpUEjU3ZgwNAEEtzTkAW1H+44vZJBgkMVSiE5JifLhjEcf8e1XRCT3i16pFT4PZ11ROK4qc4hIKil+4MvhSIcVlD4MC2bcC5hNEF633qfu9N2gW2x0iLSFPGY9qVF79sjM38o7kRRar0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747432103; c=relaxed/simple;
	bh=Didp6KrFIhV1S/h6o9Ujxwv09t3ChwJ1oYFKdnaTwZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfxrX9tfEimo4i/fbSseyFEMb9Kf86vlVrCtp6DJxqNaAijBZd/YBXO8Fvq/jy7fQg/1nK/nnWp46qjLgY3CRaQcvYjJSK3bpVKrkoPXRv17UnkqIvghtCZVOJXoDolXNJe/0wJ01WHy8maNRYR4MR1JtWd6u+npiHalP2LbEHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jhcd1Mgo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jhcd1Mgo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GG5L7L028708
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qbltmRM7JlrmyGCBxvVyTbdV
	Ddga8Hd+DhpsvKXmjA0=; b=Jhcd1MgoHumhHtK9GCdBmVgx3RF/S0f7YchRDPqK
	P4UxFbbmIj1ZsYbNrl3YQue4BTy5Zwa+vmnRpEGJW9YADQVznGSh+LWOP57gKFZE
	PO10/VtiBZ9eibJ+MHNGwmn7YESnyfhz+vbfHh5JGOaY/0mCg53A+On3WiPbxGF8
	lhQa5ZRPGCaOKHCzYnSC57RY1Za6b73vniFO47QHjzN5+5ZqFCRbuvBW9u3DvMBG
	bjSFSExONikZWqEaWXxju+bBGe8x9Y3GXYFmA5UZmfC2SNuEbXCz3dyhKq5+zvoA
	GxPBVDThrXwjAouRXwL65R+jAa3E0C3YBhiDiHUTXhFFyA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p01n28px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:48:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8c461eea3so2808246d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747432100; x=1748036900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbltmRM7JlrmyGCBxvVyTbdVDdga8Hd+DhpsvKXmjA0=;
        b=CAYe8tW7SleX0V5XgjYGeNKIoRUfpA55tdtQ8U6FPRMlDERQyj0X6PRmAMecZb6erj
         EjGZcSrN7mIALEXokSL1X7mefSvtwZsL0LcKmrf/qKeemsqxUTkkjMFVCXhCsKxLrLQt
         oaIF2qOTXs906BHB6vrccGpvLC4POVdissRpiPcvIdvI0Tar2DFmwn+L+xKXHyymLwPR
         FIXG+s9G9M3zFATzpegTzrJaEfjreAUSIPgXulq0roxyd+6kjdUoMg5eBDXgFm+ppxw6
         YCr23u02beZfpYAVDDY7h237y8nT3y8O4iSHt9hgEqDVuLNPkwpyrrxy7xOTh0Pocq3S
         Qavw==
X-Forwarded-Encrypted: i=1; AJvYcCWZkKElk+MAQ4mtLEXOcy0ko3eiuLW+29bnlDGnRE5xYPqdizcMO4l1uhuC+EEvR46CTKH8EuTlD3k8gVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwraSu5wSLSwAB41eBUnmCFIZ83J3Go9tfNRuiTCdTjqfp28Oe5
	BHq3aMHGLpRYLjWsqIRO7e+bMSO6f2FlQSS/H5MC2HVgBOrWe1l/mOjH1PQq5ModdIxPdUDQcNu
	AIlKxwKbdZONrG+NuPIJnCsEdwn/QxWJncyc7jwwK4c3dtKsGOykr8gj6P+X5cF5OVrQ=
X-Gm-Gg: ASbGncs+p1nJAg8bCqIJWH32UAxPrTx2zuO8DqGCLuuMqF6qHslhiEo1Ohuz1WG/VW4
	jQet37odLDy7wkuaGNhhveHSgPwaSNP1Z3eFHNNd7QMBSTwqC8tkQhzGws55FHdZ8ZTduxoIffV
	ICSCH55tYfxelq2k83fJOBJ2TveqIKPaFNlTVi7+gQKA7eaadMeOLoTQdF3fjoAOpgHs1sWNeq3
	Hu3xN7QM7TP5nNvRYc5VznQdVT30Ky4PJCWiaB7VlGOqFrAdGXjqXIuVXkKeT6e3SeGSugOJGSD
	FPvOJu+AMTm8/YMod+q2Z9tmM7E9wMoE9TR/BwnhUjru+0EPWJue+IgPq/q3vRcvW5oW72zB3Xo
	=
X-Received: by 2002:ad4:5aa3:0:b0:6e8:f3af:ed59 with SMTP id 6a1803df08f44-6f8b0881b41mr81864606d6.22.1747432099692;
        Fri, 16 May 2025 14:48:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAhaI3E9/IjY0nDQWubM4B54dueY0af/V9BHfJW4rhaZu/IU/g3HCb9iJtPMbh6FEdJl7WzQ==
X-Received: by 2002:ad4:5aa3:0:b0:6e8:f3af:ed59 with SMTP id 6a1803df08f44-6f8b0881b41mr81864296d6.22.1747432099355;
        Fri, 16 May 2025 14:48:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703e7a6sm606380e87.218.2025.05.16.14.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 14:48:18 -0700 (PDT)
Date: Sat, 17 May 2025 00:48:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc7280: Add dma-coherent
 property for fastrpc nodes
Message-ID: <isvo4c2taozzlovqwqvgfu2v2tbvntkaw4bdpzmiuir64avojl@3utwffmzmhq4>
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-4-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516110029.1637270-4-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=M4lNKzws c=1 sm=1 tr=0 ts=6827b2a4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=X77NXM8zCmOlsI4LSM8A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIxMyBTYWx0ZWRfX+2e7i0VU5qKP
 3lTgxT+qQx0IB70MI+0cXTwN6891oalevDJiLkibqS6hfTeId4WKceOostB+JvWuVksKwguRqi4
 nwrQqT+wQpoRJPIH+HV1jzDIDaX3IWecaRYnEr77wuhHvagghmqYzKdWBCDvemwGg4UfTzIclM5
 UAFgqXb4cxQptaNJd0leBcFxZlgFRM01jFRiAMr7Bjqqb+87MNVqM6Pfmic57lBB/VlJzcmMta0
 FfdCFIE9yNP1Dbn6+v0F+SaqD/BK11g+xoN8GkS/plkYmh9/ovAtuLBCLqUcU4bB2l0qXbKlS1W
 ynWl6izUJIo3j/ddYjVabglwWS3PtH9n3ddMWydHlsi1S+HoIdimnaKyBGXqH0R1Pudp7bA9RNw
 F853uMR4hH7TfU7zT76zoI7zM9AH+WOChywxB4RD20j3KqSeWHdiYVWDR5FTYZWNaq9jhlmC
X-Proofpoint-ORIG-GUID: wd2q8rFd2MzgNAY8HnHwWGDAmKeKTGco
X-Proofpoint-GUID: wd2q8rFd2MzgNAY8HnHwWGDAmKeKTGco
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=835
 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160213

On Fri, May 16, 2025 at 04:30:29PM +0530, Ling Xu wrote:
> Add dma-cherent property to fastrpc context bank nodes to ensure that
> the DMA operations for these nodes are coherent.

Does it apply to all firmware versions?

> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

-- 
With best wishes
Dmitry
