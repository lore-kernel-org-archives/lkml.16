Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7B118DB01
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 20:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749327555; cv=none; b=IcK/tNucP7ncl1URzT8ZA5/pBJp9SGtrEvCmQCdWphW+SV3XZUHfYFchOuboDfHRqGsoJB3dG0gGT8ytNlxoqDShDtCqDu0r5HcAT0imib2wqXmffwWSSKoJimWAI+IwLf3G9lOWwuvwyj6L2I/IrhEOo02HAQFCdFmIzA//QNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749327555; c=relaxed/simple;
	bh=LqaiD3h73Pusyxp613jVddK06xmzdmcXJ+BxzbrwAAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikYfjaW7log1Gq78jxavvDsRITqFhVWitFSRxfhKxN8NnQL0BhFgCKkEG+OtVuDH4IdzpdiBMT19dvMnWDvb0Nj+Ae4wxCC4qjgEMpRWUz+b8kE5vMvFuhKYiMAP6v0P+EhkR1m/1HjTmcG0MjVzVu71kDTGcMdFBKFR7WlW7vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+ICdV7y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+ICdV7y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557ITCe7010493
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 20:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+LZCE2lVP4Etx3mj3qZLnJKJ
	eAE2MEJSQmr2c9HqiBU=; b=c+ICdV7yh6lsdtbj/364JpFL8Ly3RcVUVErFbsPD
	hfBKc5I5XvX9XctKDmAnL+BIklvI8WJgPojzot91KDYdMhZyYWkqMdvkYbJ1MxW0
	VKSo/p+VUoBhvgW0np7pM1glaGEAKpmU6oMdmKSVWuKV4/EOIfo3qXBZalaByiLr
	jDmVo15YqOZdISVJSii+y4k6HS1EImIvsXNg31akJH91WyrWYp36hQhB04yeyFTE
	HspwzeIEfAJjTvUvN7JMZiL9qIm1FPLL5Twa6u6TBBIzFk4negcEnM+Eq8gR8x4E
	dTrZ86YtU0r+ozKxqtNuV/NZdrG3+pKFViDxsMNyk/So6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474b4j16w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 20:19:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38c5c3130so98773785a.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 13:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749327551; x=1749932351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LZCE2lVP4Etx3mj3qZLnJKJeAE2MEJSQmr2c9HqiBU=;
        b=PTeHALk09CihzsCDtSpmFczsDJCsnkpACrVYuA6HP8jZqUHAU3AEPLLZ2IJGSPF6xX
         wBEgDPXKghxxlybGKu4vfKFBMIC8Xb4icpUz2nkfXGGO0KhhycU/QvbNUo0lTz1Ur6p9
         ZxCjypymjDK1lVj4bFyXwriS6cq4xdGOBmmPjnib21FNiQiOn2+WtXFcIyR4CMUpUKsD
         Y4K6aVUCgSGKhDTbEW1wTGPoAvtNghyauX3Vqv7EjSWOVJbB4tGvZzs1Le295FVcV5wu
         odRExmKpwSo7QXFpl/QZfHJTKhSXs9a3rQ9z6HrheAj5UXqTwrS6zT6apNipLfet0zA7
         wfaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkpG4zjrE3CiIKQ+FXZBOcX44MPp3rw9TjXAdtrkoZ0XHOtr2HFjJ5EFn+0QZnaLf3CUJ4f8dB8b3zwYk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuao/cJCXtlVMAYmj8NOGDmCFlmJAGTPfz89diPobKX0hwMIGw
	oRbFxbSxoeu6Rsef9g8MvDkIEBw+salYHAimf2sLnHVraa80/MS0nMmh85Tozgr53zax+Vtj64r
	RgoaXNXCPq1UOQuBjwjrY5luy5K9wZqUOJ/RIhASUyZyhZ9q24E9rgSc01I6ifTXru+8=
X-Gm-Gg: ASbGncvvP2xSsv0dJ0R39K9/lgdbbaQ+k/01aPYq4rEbgd/7zDuOOQMfiKzNlIiuHnB
	T9BQQ2kEnRQRnxBm1XRdlLFXaUVOzdwrTSmSWH63ubNO30DT+5OEcUdgQCCaeAnaQw4WU1E8m17
	WHONd/ed1YUTF4ch2o1H2A8gmlbv6L5f2mUFtCWG4ugu8Dwdw1JoFfYAENCzNb5jhbFK06Bb7hP
	5b8igYX6IkcyzFWBO1wzpWfvEyozhWD+KQXrs64AVuAo4ZMvMdQEvFZIeFimBuiBgXovpELEQfm
	wyvSXvByeaGbURQ7kSQVYVuDoCq66NwHNZFLeGCLsaqQwkqOq2jEuPNYdszEPMe0oHd3wRjpBW1
	XVWAckowrDA==
X-Received: by 2002:a05:620a:1787:b0:7c5:47c6:b886 with SMTP id af79cd13be357-7d2298ec4bbmr1259267785a.43.1749327551590;
        Sat, 07 Jun 2025 13:19:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+d6uXzqI+QKh9+yYdZeeNWVpfa+xj5aUq7v0Dfdn1I02Yq8fqqA/F3CQ3tC5opeAiWOy/Vw==
X-Received: by 2002:a05:620a:1787:b0:7c5:47c6:b886 with SMTP id af79cd13be357-7d2298ec4bbmr1259265985a.43.1749327551269;
        Sat, 07 Jun 2025 13:19:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b351d0sm5691611fa.41.2025.06.07.13.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:19:10 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:19:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: wctrl@proton.me
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: use macros for interrupts
Message-ID: <v5jlfknzt2zcadnkokfea6amc4gtowg4intmofdtaj2gzajfo3@4ygrclrtselh>
References: <20250606-msm8960-irq-macros-v1-1-03e573ba26d6@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606-msm8960-irq-macros-v1-1-03e573ba26d6@proton.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NyBTYWx0ZWRfXwyZfE8JSI1y3
 25u8KP9uWBQQCx/7AgtjQvoAPWWZop/AGFCzVXElzdi8ydxS2/5h8DHJ6P/0x8XQoJj2ELxAKF8
 SLzvuoc+qnuGcw//RC/lf9EirK5MX0hoizYBPMBrIhZpxXGitTq2KoPc10/MoJJtgAFlK/YPryF
 Q606rtp6l27aQUdt5r2sOJh+N2DDEfQATODTjBnMsKb1mbZMFcn3vtPcZYSh8jUpncaQFN37Po4
 7czPz9JTRIMCKeEpNsT9otKfTBiweDkULn9yUjUOSVthdCVlNkNFndLgXS5aHIk31fNujTEt1ph
 fBd7QYkqB4EjK1+nmAzxfVZ32ePC/yb+hKFIyvYa8J/c2T2QrO+reZOiAqIY3zeQuH/1e8d21Yr
 UCDIRbLqqINrBPPMrRnbnQFYK5mC3X8BvQA84Dgid+7JZmxUASeMa8uj/G3rmLGRgrMfzvE6
X-Proofpoint-GUID: sQ72515mDSS8ax7-YRJA30T9MxOOa2fx
X-Authority-Analysis: v=2.4 cv=Te6WtQQh c=1 sm=1 tr=0 ts=68449ec0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MzN8uu8svZ0T6_zCNRoA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: sQ72515mDSS8ax7-YRJA30T9MxOOa2fx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=557 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070147

On Fri, Jun 06, 2025 at 02:03:51PM +0300, Max Shevchenko via B4 Relay wrote:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Replace the raw values with macros. No changes to the output
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
> Replace the raw values with macros. No changes to the output
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
