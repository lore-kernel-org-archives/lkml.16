Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D94021B9DB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495634; cv=none; b=vF61rdBA47PqYF7i3BCE8An6CvbpgqZlImbnZVo0++zjYKJ3ZxXXFohTa1+HQGP4gR4m7SPVff+dcUulBLfYekXrIghpwBcVSi8lXSFVikT0UTuB0FhiawtjjMuipCxTaXx8/DmRYHdaa4GNdlqvTsdJCSmQUZ5tRHxLquhEqm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495634; c=relaxed/simple;
	bh=fKYrShfy4eijBV7nECTRWv3J853kJl0gn/F00vK+lMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSFKU7u3HELQA8S6gx2LyDG5TKLxEDaQ2b+K3NszZbqWcC6+8So1mVQBdYxypFXae95i0tNrHcuc43sbvo04Pvug8MjtCHdlIZ2qgajpUidjzBGbXxAptW+5jS4Sxr/2TuNhnp6IF27Z+POQ56mdGXXfpSw+MrQRhoufRyhGprU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrfFrXe+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrfFrXe+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562I5MSr021088
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 22:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9m75rRNh/55YNUo8oud19uqS
	Nh7ztNCNjf7HEJhz4Jw=; b=DrfFrXe+I0mvhum2HRzezn+EXJKPyXEcy+lFpiXD
	yOW6Cz33OviCyc9FH6nvXpgJomdo/eHdhOG8aJTRmhOs1ghywi8LT3qVJZ1pxOD3
	GyhruPTn6GEwW0yJPm8ALH1doE311dSlPuVVheig2nl/QFP/k3H5UtbRBlkFzk0R
	64iMHYOn5V68PVk5s7LpCywTIpe72+rDeaQuJwMGen2pcr4W34h3ccIptIGUDJoP
	z93TGYaaZMIRmax/U0SdcL8yN9FvAE53uNRVqNPy01th9lcZOlKG+K/+ZSrD0CUk
	2AYUnGEcREoX4z71rFOJ3ex5ZlmLHJFGznZITV1RC0/zXQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn4vkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 22:33:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d15c975968so158035385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 15:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751495630; x=1752100430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9m75rRNh/55YNUo8oud19uqSNh7ztNCNjf7HEJhz4Jw=;
        b=hbqOZR/9ZziOQmQn+jPMSgn31jStolTSsMfEkCDZ3HJk0ZvgOpS2hh+Z+hCr39mDrV
         OG45EGYLnqjrz3JDqH7T8JvcGtnZO3fUlTm7BF3bxS2njlQNL2quaQAzDkVbgtWoKo/Q
         kJk+dzoq6sHg97vHquHfAb8U0rgQiRjNJLcJKCZ7v1f7KYG3w28Rv6MqgyvrxToKwUkj
         +QpxEkd/szDIcBI97Er6WJCJgSgO9vrvmDltBlNsyg9qRUF6o6/Osygv2hKU1FUOciEI
         L/t5p2zPpBoOm/hhfQZCCBRuLTYUD1YubU6oosNaiGvXK12bsLTtRhrEOv50hCY8UCHF
         6xUA==
X-Forwarded-Encrypted: i=1; AJvYcCVoq3feOSJEFOPA5eJjWNBvK3aD647oj9GV0ZuUNMwuLoor3SMzQvsn/Puywr9GYU31Gsdfs6e5G8MpAcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL/fqwpPcNQQNJF9Bwi4s+XWD6i9O/nWM7aAkl9351NUGwi+WE
	K4BQMTzndsyN5GDV50S+qdYheYaFbnYPJBQhu68PoCT8xGzYULzZengGloC8zK0gGYQp0nsL+CK
	RvSALV40BAwBAnnbMkabcfJ3Yv3NOCDl47cmtMLvANXbGt1zTPab7ZLRooGYToC04RZY=
X-Gm-Gg: ASbGncualHOdd0Gbi6uddEfgVIvEzbON2rw6gyo8hjucsxyD4Lx9SM4pAxzOIMT+B3G
	LyVPa4ZsBKsR5cOzcemw7GZLewU4yNjqW8hUTsTKEZLdIEVtV+XjVGXFlaqp5hnLaofvqdtSUad
	WO3BI6hGyXQ9sr3FeNJ9tb3DOSO07GMl2+4mTFbH03a76bRxN7O6Yh+cAw6zAS6LTo2C64h5ouH
	Vru795vXHw8NBF055xmr6IeuYUcK9IhgkKtZwVKVBuahYY/ANgzgdPl/tfEHf8JpK3o4SzaPdl5
	xWApuPuG8QGzgxqgchvLJ9LZRhx97AgqKQprOF4cvbY3+wX8taOrLULCYDBgGQuF2hjbfOiT+Zr
	M6C9A5KN73uyzhtDC2xv80eAWsEXfdbedVPA=
X-Received: by 2002:a05:620a:394a:b0:7d4:5a4a:ceb1 with SMTP id af79cd13be357-7d5c4798da0mr884198085a.47.1751495630587;
        Wed, 02 Jul 2025 15:33:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqHg8DuS5Rl+xyDTUq7jRwAVjwOfUy86K5mPVVKk/oqcQL3wgwaOndDK7teOB2+3l4vN8JRw==
X-Received: by 2002:a05:620a:394a:b0:7d4:5a4a:ceb1 with SMTP id af79cd13be357-7d5c4798da0mr884194685a.47.1751495630175;
        Wed, 02 Jul 2025 15:33:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f00aa6sm18743291fa.99.2025.07.02.15.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:33:49 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:33:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Milos pinctrl driver
Message-ID: <xtcfzqhwmxgyui7fyn5bsms52nnlflalhlkvkinhdc2sxdu4l3@logrn3cjupez>
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
 <20250702-sm7635-pinctrl-v2-2-c138624b9924@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-sm7635-pinctrl-v2-2-c138624b9924@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4NyBTYWx0ZWRfXx8eTDQ7oKLcK
 m6rZjzP7cQvLbfkOQFRDzjQprU5iI+E+/dQNW326Ija1tQ9coFl2HWqAKZyEqNogzGNV/l3Jgy0
 wzIgyODyXC+loHKRZnRXP3KQ6d1peanR2voahP4LQlq/GLRNCcxov5Ra4nAW7VflyYW8FLu/R/s
 cOwigA5Q1V9loG3PhMg/RsKpzc0Xd1LWdExXMNsVBdNVct81gb6WkR/WnrZ8ZktwJYmjeq7u4cJ
 sT+F63yGz0af4qtu1/2LQvptfnkYdDakW0mKobsi/RXjIjpsucRfj9eSH2kZMBl1L77cf31biGy
 do7XrOgxM5zLueOBtqjKdt3DMkaGN8Fv6oDznxtbFPWs7xRcii5mzO3Wan1EINhY5Yhs74C0w+g
 JFLb+XBtxr3oRiBtRqMhY+D1T2aV7yGyEFCvc8kgaRaGssvMevZp1mBPfiYM8wGiEJwJM11t
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6865b3cf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=JBPsfPNCSnIN1veHQUAA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: GPvUwEll1TZH949TVVOdM7QBb3mpUujf
X-Proofpoint-GUID: GPvUwEll1TZH949TVVOdM7QBb3mpUujf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=988 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020187

On Wed, Jul 02, 2025 at 05:56:17PM +0200, Luca Weiss wrote:
> Add pinctrl driver for TLMM block found in the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm     |    8 +
>  drivers/pinctrl/qcom/Makefile        |    1 +
>  drivers/pinctrl/qcom/pinctrl-milos.c | 1340 ++++++++++++++++++++++++++++++++++
>  3 files changed, 1349 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
