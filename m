Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03467219E8D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745606990; cv=none; b=gn3HdO0+cTh/vLP8+oqSE5TzHJt452K9YpU8g1btMqS+LhHmfc5qiLrsvf9by2S1vW58owkPUq4IAp4Clo3Q42GAV68Hf2sp09tjN0Hdhds12xOX62fQeF3p1Jp3TtLZhiYkPXArhqmYTIkPa+4sJQyGv+zwVUeij/FIHxAM/bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745606990; c=relaxed/simple;
	bh=XpCu0lpFGvPHVRozeGP/n2M1RiPHhHTv8U24FaACpr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHjRrS1devzTrfLXO165ab/wtFq5Vz5Ikjw/01Dz96AGU7DLVyNMiLe0l5tBUJir0W0lZ+W2kobAzVaJ2LxqxpwXRQttcxbKuwTUhr0ZPe6A2DJVA6d59KV9RCTYOFWiS9UXpUrgjR5rP0JJQTFby1HKGXAPIFu3GcQ3inXt7iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIUkiHkq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIUkiHkq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJq1P012801
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4h/tNh2cj21rvwdHEvX/GLqs
	huQYHrsaHCKgAfdUS+A=; b=cIUkiHkqsNI6WlniISpkNElrAlXvOAMuxzC2ZQHK
	pTcwElswdey/y9ABfVcg9mBIyuVJ68vAQx1SW2z7/a6xhJaLWnkhC1M79dVxjyEl
	UtNWLfBbHxDPv6qm3fwKfIal1w5EcHP69eEHxEihm7INVzMCJVf24+4QfFdBiFJt
	1dXmGd3EGB/v2nkw+AS+cwKDp4fm4X0reTBKQKiKHC+XfY6ZZs8/486ery2VzdVS
	omGC0fCh4QELkzMASdXVc77OUckgDV+IqMX6t7NvvcQYcW0a9lYaosYNxYosZy8T
	lr9vQvgiLimY8d+mmlVyjOOUMbdcKgI8I9ZRZWzsK77GYg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1t2qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:49:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c790dc38b4so465036985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745606987; x=1746211787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4h/tNh2cj21rvwdHEvX/GLqshuQYHrsaHCKgAfdUS+A=;
        b=JqEZ0MRgqkdKYuIBsUhQbbWZ8PakTjk74RNerCS5qMqG/c5pwXWP4MmdBFifVSaUDV
         xqK0QHng2Tl39o2dzM2gxJi6SF9riJdglZCZxwJsWfrkggNYaa86wz0VUxM+Wc26Jkwp
         gbsRWiI27o2DTtwqQorpHy/LZ0ZeIiwdUQzbnhd97jj0YVgila//qltO6/4dkGlFAF7o
         DFvusRrXsJIo4KcQf8vXrS1faZq4G37EgmM1/jf7Sn8tCuhsYELem5xfJ8W/jRF42NIi
         vrmjesXN9IeJKDdFlYkGR2DoD6qtIqZlrz6eGVboEG3jvk4JQGB0DRNrzypS5i6IW7L7
         MXJg==
X-Forwarded-Encrypted: i=1; AJvYcCWnL8PCGe/ch6EiKpPwaaHCxF1yYwHIcFo3P1VI7DVtfDfGdt2rQynUt/Q9JwW28FSlY7eiCdjm8Qcu6kA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfMrbj4BHQzpjWsm3xX9mfgdnyd9lpWP6I0EicOUdBp+fSkk//
	gDIE1dPZ3arjC2RXJw0a2DD8sU8KDh26CoKQ0HuD0FBRxxiii9quIxkj6AhHRp75m+YmnD/qg5T
	LwUk6j4nydZXM2ov1ZvRZLYbCSe54MP1WWbC2XggmQIPOztF7TRifSRiGb6OOBGU=
X-Gm-Gg: ASbGnct596YJrTLZ9MV9Q1u+RAmVZ+Agz9k5qqEM86tmt1ArgG9NFLgiJ8XMlEnZaHq
	ZV26M2YoI+UxU9MsE/YTwG9+kMVtA4IfEWNd6gW6TAJ4hZec4cSaaXRqVlaWd+mdou9pCYAEqUm
	/mJ7Dzdo3SBzaOfR1B6uxD+ERu1CiwciLgCagV9xwseRRtRJwsby/fU9nZWyLvMX7XOc8wE9Tv/
	HUBCkc6mIePQm7po+glaawe8Mwa8nluUV4thVO64o9GMcvfGlwEJqM+wM4CMi8MkZf5Abg1Zm7P
	InyDZcz/iPizleK2eheWSTcadeSmWEposHwd0ZK1+3ft0kubFCdujaevnt/yX3oHkLJb4QADFVw
	=
X-Received: by 2002:a05:620a:4546:b0:7c9:142d:3c66 with SMTP id af79cd13be357-7c95843fdb5mr1114348985a.0.1745606987107;
        Fri, 25 Apr 2025 11:49:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb84jAC5pDcE39t+A3nMNSNGoV/RYhRqVe7xaNluLMJTysZD8eF9gUUcxUs80J3xjAUHfURQ==
X-Received: by 2002:a05:620a:4546:b0:7c9:142d:3c66 with SMTP id af79cd13be357-7c95843fdb5mr1114346085a.0.1745606986740;
        Fri, 25 Apr 2025 11:49:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d00195f8sm8436461fa.56.2025.04.25.11.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:49:45 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:49:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sc7180-acer-aspire1: Use q6asm
 defines for reg
Message-ID: <wawy7z4jrvu4t7obcrs4piyscpusaawgj33lqnhu3dth7zp5ue@uz2btydfyi43>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-6-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-6-28308e2ce7d4@fairphone.com>
X-Proofpoint-GUID: JzScGlSfl_ccui7Tcitcmx936vfrT783
X-Proofpoint-ORIG-GUID: JzScGlSfl_ccui7Tcitcmx936vfrT783
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMyBTYWx0ZWRfX/b4ez112bDmP HHw6X6rngotn/tsrDaZcIQUFI9Rz+RRYB2HH51/UPmcwYMXno8wOFQ6IyZK4My8yxQo6iECZ898 YahoO+jeWwif4Z5kahCxmnDI6D6Ysc1/0FuO/lu1GLuv3xpyquNz77uFTeBPngoDcr/BXPD2SaU
 gTm+h6cx1RAADOv5qBzEHA8VV/K7nN7wsSaOu5A0ZhvMKONnKFawH/OvGzOqPzftoSaX8+g7iTo 9CehBCpekH7wn+6pEyD4aMWIfurDanfMqZ/gPyoc855l0ed6IeXduxunu9xS8kOx6B/hpjTe3AZ Rtv4KrQTOAmeaMY5o1u4dWqIuLm0Yin93r7YVUPKPZe0DnhsiOb8fuCJqZkDSnGCiARsDt9G2ON
 iEj+iSlfH8vHESodlSrtdedwMMe9Ua2dfoleG/QM+J0oqcU6hmkvOL3mmPAodKQIYrpbkgly
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680bd94c cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=646 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250133

On Fri, Apr 25, 2025 at 01:53:45PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry
