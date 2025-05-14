Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CDB28E5E6
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250623; cv=none; b=FEvIFjR0hSHp/7ND7XFOh0hOZP2Nv4hUdz89+J+DY4G2MHaDC7D+XI4dHFpkloKBYFw7unjamEvxqrhI946ZzsmaIrsKub1OP+c+Nz00JYvpBS4Q51oaQQ0VJEziWLJbmkmpXT3pzK1gKixO1IwmiLI6n8xMZKT8m6RdxWeNNug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250623; c=relaxed/simple;
	bh=e0fdyVmf32qqHONNTfPkAQYkS29kfAvEZa7mArWCVO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMPy15um5sdprP1aKidXHFXEBPGAh6BiTATpTMdLsFwvG1rUqozQJQVtxAGIPngzkoFndVjLllK7rny65cbg8DLmy8hyS2Xwvxes9LAvAmF6TpDaHcr6LDkhFNEWacCn7dYR4+zw3MNqP//LNmJtiJCn8aJZO6soRZ6mHWBZSlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rrg3c3g5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rrg3c3g5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EIV88u015927
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yni3LltaA+0t8FG4nm2JYBtt
	/uZ60urKlv5zgXzidKY=; b=Rrg3c3g5co+tTuf+LdMu2tXpZFIPWU+w+dBOXMLw
	WNs6nYDjR1A8DgZ5YfHK/8Q3AaCwBlUK8axzq6vPToPmEJc7yQIWgViERORCbh6F
	0/aBMhSi02ITQi6F7qJfs0f5iewwlE8V+67c4+mui7Np48RuFiCWxs3FsCY6HpQG
	x2Yengs2V6ehaqoI7b8rYGEOljnExFGNaCnxERl3YiKaLYHsBlNhHh5NNoP/vZmz
	vwITdVi2iT6tK46AD+nEkhZkJfsPiG0vRQthZTlLfQddqY1XlqXPQUhqxdZOE7+1
	Xo9DRmxCRUZlBlKNzgGwQSZGdXnMLLy6IgXZRFMtexxEbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmuxdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:23:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caef20a527so22908885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250619; x=1747855419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yni3LltaA+0t8FG4nm2JYBtt/uZ60urKlv5zgXzidKY=;
        b=DOCcjxKsltWYLi5PbVb/VZoy3YmcyrNnxDy8ZpzTuTS4ymyqb/GDbUgxfMQI6YdToc
         6r3DuscC8U0ql6H8kNwzrP2jD4uc6jPcLysfz+DqYjs5hCm+SkXUFtEDxOvZGZ9quIAS
         sjekBTnLJg/IoZ5GPW4EzAb1TsDJ4PdBef6MwF9y+2nPV1fAFAorcUJlUrtEEadXJWb8
         p8wtL9gOWsZIH782degC6N/uTzDZ2obi40UpwNmeShtli+k2infMq6ZLDUSQMqYOR2ec
         r3mRdv4+Y6+nE1oZ7VaT4yns5hKmr+wO72nWGRswIHeE2SvXKXPRk596RIQbUO+CLk8J
         jcPg==
X-Forwarded-Encrypted: i=1; AJvYcCXH8/jUmfH26JUcSlqRppVag/Vgij6iF8jkCmxZe/jPV1nbVggtNpMiDj51sNhBlsZO2TpTPnuQz15OYDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YykorvenfuY+rS9MahrkCGF2NaUbDEYN+pJJOljcG8Fczxpd4FG
	vlV4uoWEMlGWUcJiI6Wxqc5pScTmRK1sC4skXkCpDbh3qRawA4DCCrLE9ah6zXwaP/0Gf09h5Yh
	zdh3dklyRphJ8N7D+vK2gmup+pS0o5vsY0OBp0AtwllXC0zu7bWYJvPamKqP7v0M=
X-Gm-Gg: ASbGnctSacq1ZJtMKIbqoKqgzeNfLw+aGFxC6HXYK/ljxn1H9Hi03fNPJxEICbh3YAH
	QG/eXLOKmVTYFrUXUwE+zPFIlOyqA4EGtlbAXHGl3o0VIRvREp6Dz4yCoaWFXqZH+bZHdaTIBeV
	uBwPovhPLpy49M8BQxZign2dcRtbRA8Rnla8dtQcXEKNk86zesV5UlA6x/EBhzKhC6JTjBR41x4
	dhJ1Be2O3aB1Wa+rQXTRJ9+YTYenYqE5paKvKLBztF7qPLAxIYQUA2p0K4qYWZWFYIygbP2wqXz
	Yq6F42f8TbbUUBU42anxv2h1dr3aU8EZ+PfhOJvrQHfAxh6/Vy3ZtLrAz5p6OhVkHOonylRzli4
	=
X-Received: by 2002:a05:620a:1a8b:b0:7c5:407e:1ff8 with SMTP id af79cd13be357-7cd287f8fdamr535578785a.2.1747250619591;
        Wed, 14 May 2025 12:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBX2PjHSIJlvnaBpvy/6NraZk7yT3imlz6y9snlTUgoROJLWl1hT5lxeeviHrQmSmcw02csg==
X-Received: by 2002:a05:620a:1a8b:b0:7c5:407e:1ff8 with SMTP id af79cd13be357-7cd287f8fdamr535574285a.2.1747250619083;
        Wed, 14 May 2025 12:23:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33b7b2asm20255511fa.33.2025.05.14.12.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:23:38 -0700 (PDT)
Date: Wed, 14 May 2025 22:23:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
Message-ID: <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hiy0PCYTTcVbVyKWwYp5nHHmV7Hzy9lm
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=6824edbc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jk0O2evD6aPmCTIX_U4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: hiy0PCYTTcVbVyKWwYp5nHHmV7Hzy9lm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NyBTYWx0ZWRfX6UBNb6jl70Qw
 PMDCIL2AHef1BKSDC3UMX370LnL2UiESO7zT6BR0VuDxg1zH+IdWHOTItAwLVRBh9NTDegdZRkI
 5vId2XO+ZFKIrLUWfuzsiA+aQS2KICVtMWsZTSwy9SDn9mVzAJUM4Wq8d5rESlZtqVBQYXolT5Y
 XHAxArqtXfgXOkAVp4ZpmKteuG3G0o+lpSftQM6WYBLa/TrOt6JLbvQ/mZLUyC2JkF6h/ghQxyJ
 zlF5jiBnci16Q9m6PPd4CmXbRI8lpk/bOTElsEIb8szw8ZIvIe/f+WuAEgXXb6d6K59tFwUcFbq
 NXGeH3lMe4OHAxv214m5l4FZRGec4NSv3h7LLinJyDUQ/Nju5bILpQXsT2Ki3RKoqHvKLiI6w9e
 ukfloO8nBE6vUCQN7b2A1+lVg6URELvjaKdn5+O9AqM7iCGIGU92CpUgFDbMBtTT9cbwKooS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140177

On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
> swizzling) is what we want on this platform (and others with a UBWC
> 1.0 encoder).
> 
> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
> bits, as they weren't consumed on this platform).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>  static const struct qcom_ubwc_cfg_data sm6125_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_3_0,
> -	.ubwc_swizzle = 1,
> +	.ubwc_swizzle = 7,
>  	.highest_bank_bit = 14,
>  };

Add a comment and squash into the patch 1.

-- 
With best wishes
Dmitry
