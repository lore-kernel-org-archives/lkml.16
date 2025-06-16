Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DFD18C31
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750033272; cv=none; b=orfZNxFu7R5SoYH141SAwyRVGngJFKMibvyXoIh9iiZot26c0ABlsakck24Y0mRVpzPgC+o/CHs6bgD0ns7SdSk+L5HJL3BpHcmAda19qnNBS/mi2GcefpJmBSnC3Wm9nRSGhGAZxUQtI9qDD73zeLQJfBADCwtOmJKQ8hbg9RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750033272; c=relaxed/simple;
	bh=l+Sko6t7/6/IEYppf3ZaJVyiV6kFwfeL5oNRXSRXULw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UI3mQCoSjThQw7y9rdTFPedwYz3+Ik40JKQ8+96Yn1/ni7yc6PwqrJRvk5pdybaP8/07v5d50aAWoUw2UvFv9xEz4P0Xl1S86qnsWJk1OYBrl2wnQYXJA8Jwlr3wfJAHxpBU/dR8Dq2CY+EXiwq3lECD97biyOpcYwdiC5ilhuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jN+xyIuL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jN+xyIuL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FLvXmJ008071
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yn5zET/nVqjHf3G0UXft39HF
	DTFNHFCZL9S9Mm8zd0A=; b=jN+xyIuLdRWyT1wdAol90tVtJFIBDSKY40YTHl8K
	FpvJKlU4u53urWLAW++pR/t/8LGJDiQeLiJ4GKMwb97cMZJdjaSwuIfsrasys3Eu
	BsOMqDPReNIWvsIk+aw+hiOAR8H37MCPSrVTk95oZcT7/zF58I+CnURC7Hm8xUs8
	/IXJCijjC/qAxLAPRmc+oavSaEHsnCb/Wn762x/0AZKS0KDc7qf69voDLrnlR+6W
	yKxcBZT8Dk/Y8ltBJsjaaLnCmFo2mxQqy6hlX39mxVeDS9Sdk8U6Yc3Go03RyLxN
	8wpofvuw1Mfhj4R+F0ubW/BjOZbuDFCDyX8rQXGsEz9TXQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791ht2jav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:21:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb1c6b5ea7so65112946d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 17:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750033262; x=1750638062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yn5zET/nVqjHf3G0UXft39HFDTFNHFCZL9S9Mm8zd0A=;
        b=H3/Gtb5+1Znn6EcHKnsgbOKi47qJ11iGWQABzkTDCibdfKNEDjFSnt2Lab/sADMnFj
         qFHV9uVPsb9hEielF6q9DmNMUUnr5MY5h339RJnt3ysX+JMFXYxzvKXRrj6xzUKoeEgO
         GIA/HFk8aL6se31up+HwHK5+b5mdzdYzmywFbCNaE4r2XSkVAs5kUx1mslbW4Az9D3hu
         Z9sK4rOdCcH9kEOJVw/Brd5w+5JYDtFZx2PVSbymcVL9yJ+itGGpAYALJNEsYlNth1A+
         d2UMqYOzg22TFfMF6+5F333aO0Rt/aBpUV/Ku+DMltb6o3AtAejBnQ2tP9iXUrQt9v37
         u08Q==
X-Forwarded-Encrypted: i=1; AJvYcCXy9psCq0uqDYpwMnAkcqL/RoXFB8q6zWbtIOD10alSXE1NOr/8r4Vyuor9JUdiBDOmzS2v6/Pc3vkubbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXIQEKo82yinLTVyAOjmVzdq4scpJ60Eo/OpFmi12LwcxAZuJd
	dZn3DjHLGn2ldVpcpmq6WUT8dvacKoC6w6P/Meuii2+QKuX+C2fODZ76/vba3Ovz1IbF3yKq1Bc
	ZF3vFjkShBd38DuUbJYZ0zNOnWqRNS76mXVyA7kZYXMneA6F90iZu/T0nf0/GWYVat7M=
X-Gm-Gg: ASbGncu3YF6MUjViYPcCXXaYrjYXHXNLM2rWkVMzL+U2p11d4tX5kQhoRDU4HSn3hqu
	rkwXdnWV3FFPYmId2w6ubTl9vjy3T1tkZt9VffcYmM/tbNbuk4zNVgSP6BWe7x+7OR6+M37SH12
	U8k7xZSsExLy4+Qy91gc0ScvWfTSFDLE10BGUWyeoLdWEqW+PbfOiq6QnbIXeBBUwAHGinGBJNh
	hS0afK638VR/ezL8sRZP/frds+SRGLPjEt0JQIzEe8nv0QwH1hihR/tO9oz5evk3MjqtUAwVEDG
	RDFnSdTPIIsrvM+lor22lWaemyAxgLQhT8n5zGGqP0NYPDpPUDfKEhi4+qBUx/VK5Ov8H7bZSP9
	HSAfiLB8SUbQ1Q7zp97Y6pvno+lpNo8yyskA=
X-Received: by 2002:a05:6214:2b0e:b0:6fa:f94e:6e69 with SMTP id 6a1803df08f44-6fb47725f2cmr126097626d6.9.1750033261901;
        Sun, 15 Jun 2025 17:21:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBjm2yOoYBnfFuKFuUHTJcSuDR7kiUIrX3sPjUJtJBygXJXa2SZAkdU87ee3Y8xnyvwbhTsQ==
X-Received: by 2002:a05:6214:2b0e:b0:6fa:f94e:6e69 with SMTP id 6a1803df08f44-6fb47725f2cmr126097336d6.9.1750033261489;
        Sun, 15 Jun 2025 17:21:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b4e88a72csm6764361fa.64.2025.06.15.17.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 17:20:59 -0700 (PDT)
Date: Mon, 16 Jun 2025 03:20:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 2/3] soc: qcom: qcom_stats: Add QMP support for
 syncing ddr stats
Message-ID: <2lfuaki4avexx5yphx7zaaw5e72wfro2buyddkjauc2fdc5gvl@ne65atmiotnx>
References: <20250611-ddr_stats_-v5-0-24b16dd67c9c@oss.qualcomm.com>
 <20250611-ddr_stats_-v5-2-24b16dd67c9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-ddr_stats_-v5-2-24b16dd67c9c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAwMCBTYWx0ZWRfXyfCSPxSS+rEj
 JJaibBvF/rKLqCAEB2blRYrSZXT7EKiOWNi+DwKTfjSDG8jauZ7gwMx+skfAsvzSJW8qYEpf8Qn
 yG6qTUf+GNl1POYDFBOQdH3764dtR/aVO91wYCYbAYca9+5h6swE3hoKCtNExw3d3XvINWCane6
 xjUHpq+CoTWUfX5DcCkA+iPGqxcxx945x0v89R+am54nTRwax6VoFyuPgDJcwldx+orqlIheIj8
 TC3Up7VOUewSmwRD7ZNBbSJ7+aZs1xzQ3swOw5HENVHOmwmIVNZk9zcN5llYwx8bsv0W/tteTBD
 shvrakpv/cCBOc+VqNOmi+jvuV7AP93x5c6tO9yHpNhplBM0+Pq9FnqT3DJcNsNQc4Af4+/POkk
 UBfhjVswUW5MtWg24q1NPyZb3XUhAXJ3m2pIcgQ6In0yLalv0Nc3OiGztSkPMqIC71N42rJP
X-Proofpoint-GUID: lcml1UN58xx7y6e2hGo5Hz6mkXNyxTj_
X-Proofpoint-ORIG-GUID: lcml1UN58xx7y6e2hGo5Hz6mkXNyxTj_
X-Authority-Analysis: v=2.4 cv=CtK/cm4D c=1 sm=1 tr=0 ts=684f636e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=zPEmSsMKRztXHp1w78QA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=958 adultscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160000

On Wed, Jun 11, 2025 at 11:33:46AM +0530, Maulik Shah wrote:
> Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
> ddr stats. The duration field of ddr stats will get populated only if QMP
> command is sent.
> 
> Add support to send ddr stats freqsync QMP command.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_stats.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
