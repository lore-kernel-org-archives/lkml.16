Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F3822A1C5
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746709811; cv=none; b=Chs0OEKsSVSCcIG7G+rwsrGpEhvOg4CilqHs4WC5JPwuFoweuV5Yus6Vlyu7BvkKVi0IoAhyRvOSssLaup+M3ny1PY+Vf8gOF6y0bJveNeqBA3+8iCB7oXMcoknKj3E0F2PE4y5TtHXsA/5l7kVCPa6/JLGyvVtENOFWbowm1HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746709811; c=relaxed/simple;
	bh=NSnmCCrbTjfcVOSvFX0kD9i/VfDeG5tt4nFeEBWNPD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIZ0Mu6j9hz1EcTNiKsqk8DuwQ6TxGwQ6jgaTss8mL5H9T7Bq5lkhXnibvB14u73f1TT+a+s/TCDhIv8pK0rKiP5i6dU/8nrPlFwYClgTafPVNvPiJfflXGYzfTN7TloCNqab85zQikSSueAefblzLBwajMDNd8IZBwdT8z3mZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZbZC116; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZbZC116"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5489cWPh013551
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 13:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w/O4EtEjKK+qxbkmtbfvbyAd
	Ep6/N7mvPIzRsQHghBE=; b=FZbZC116dEhg/lCpeG0WMcIP6bTCI1H1YrNIJ19s
	uFrkXgxtEeo/HjdKpWVycc7EuAyNoyML70FQLGC/kjpRpIIthFxRuASfJmIphsqd
	1PXzzmv24l5s505c6AL5teBZm3xJS5Zmk6XgdOAiHojt6VPskIG8i7E8ZVTjU5VH
	P0AxxDhV4D5b0gdbDDP40FWoJEEVGlwDfxYyDzpPthuKVOIKL4kalgQEgkN8Qaxm
	IUn6tbgybzb2bpl7gfK8vrFbElTSAmAxDbywD/Q1boLS5Vhg3vcNc6u/HRs1S6HQ
	vrLxa5pbwYaNSR/xoHN2427k+iTryH0hsKona/Ts8UiYsw==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gt52rjgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 13:10:08 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3da779063a3so10595295ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 06:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746709808; x=1747314608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/O4EtEjKK+qxbkmtbfvbyAdEp6/N7mvPIzRsQHghBE=;
        b=Yrqsd3ADpgNxrzwkrFVADomAQUbUXhVAtqVwcCTawHgoSt2c1T5AndCT3GLo5QULVR
         rnK3upkubvXexj4QIi4SMX0eozZnmvLayhKz9MPaf4bgSVKAb0+cR4nOteidD/ZWoigC
         dzdSH0hXgmBAb4Uhcl2FlA+dfCdCijETl6QGHtAhZtSggJk6IFNb/e4gIdj075AGjF1Q
         a7rlzc2L0V7XPa32SqvsZhtT9crPtsu88cLRaT8Y0W1xRw550IUpeNAs9bNxKJWaUn5H
         yhxDMVtiV2UeLnx0d4FGLiGVMJuNvZMSLZchMuNk48Vb3H+uxhkoS3YlUOzpcVpdzlO2
         LfgA==
X-Forwarded-Encrypted: i=1; AJvYcCW73liu56nR0eAXA0z0Yk2hdVEOvtrJBG8gn2t8UZ+L1N5S6lNAWCTgQfq7SEvT50Lc8DSkhmnaiEQs0Oc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5QLU1CAuxEjBC0BFQoNcfeQ1GhDVarqFMy7brCnHj1g6dTwa1
	8KKuueuWVhVB0HhpDGJkHn4QwOKtd13Db0A4/tdUmshmwMeLNjidPOL6qd0bduU3HDQKjp/a+cW
	JZGCVRaMElVSa0CyMENp+c3Y1lZT2DdPwu3f33Y6uKk4lxdPgHKiQDqtMQSePML4=
X-Gm-Gg: ASbGncvleC9NTPUVCvO4DxnB0yAU4zYXAyELTCQcNU51fxX1maGicq5UkkP6mFS4+5C
	tqw4pvvMxtj+3Jtk/unKctOw+jpbknUHY6quTv5OswuRd6Ocx/0wnnSIz0hB6JbOz5fBFObnpBM
	oCG+YnEzGSuC87Pm2vwbTRBDhL7Jc9DwOtv2/z7SNrK9+uBzKYMiD0Qk3knQttfSDIcGnbq0wWo
	2Lqc7hw6RTAnunPfMEvm9pkPgN5PT2NrcXFfTMbbrEqU5VnRKoA5DlGy6JeEz6ksGc5OKBsxD/X
	tdB40CG4lBUL85wWqX3mvaHWNaCBpQdVPq1a5PW/wQ2umw3gmYWKofeYmySIOd0B4Blc629hrX0
	=
X-Received: by 2002:a05:6e02:194e:b0:3d9:39ae:b23c with SMTP id e9e14a558f8ab-3da73930025mr87333545ab.20.1746709808043;
        Thu, 08 May 2025 06:10:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB314junkzcSWTlXKpliaMGOOcVxB2b9W3HBxoMLJhqRFuk3kZ19/VfaMA3FAuObQqYvaDaw==
X-Received: by 2002:a05:6e02:194e:b0:3d9:39ae:b23c with SMTP id e9e14a558f8ab-3da73930025mr87333165ab.20.1746709807695;
        Thu, 08 May 2025 06:10:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c2d937b1sm71441fa.55.2025.05.08.06.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:10:05 -0700 (PDT)
Date: Thu, 8 May 2025 16:10:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 10/14] drm/msm/dpu: Use dedicated WB number definition
Message-ID: <b4e6kiaxlsth6ix6gxlfgfzracx6sogv6fnm6yu42rbvrbprp4@ih2cgxtyuwpd>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-10-f7b273a8cc80@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-quad-pipe-upstream-v9-10-f7b273a8cc80@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExMCBTYWx0ZWRfX607vpveN6gAq
 XlX6R6frVZ/+eclKJr9cRut5PcNUTwp9HEK9H/rw/COG9YHWxjy7xVjk09h/FIWNn9ezXFwNZ5s
 Q+q1M+o11+ITC5yfyfbngBHi8SYvAEBXWrYCdRt2iP+f/Y7z8UCKpbDvAC/sZTmCYk3zd+9GRco
 bAQn0ZD+pG7EsaVwRZe/KfOTGTkaefTvz2prOvzd0HNqW2hWwHa8eaeiiPn52mTy5urdSapy1Te
 oGZlqBefBFxAnnwlhKk2CTEg9Z3E1sXCbwSWmen2WPZnYe1nSutiV/1wXlWaS8wAH+y+NK6uEv0
 JrQ1b3twW6l9n6Dx5yVGqbTX8A/1e/DYg3o/Y4Xm5X+w3dy0lttXf7Z20Ovex2f9ayTdAzsEBBl
 +VB88Ve2aqJs0pVEisrOOuj/OlOt3HEhZTNENDR2kU/j5eW9twONbfOBf05JJa0GxHxgloUm
X-Authority-Analysis: v=2.4 cv=LKFmQIW9 c=1 sm=1 tr=0 ts=681cad31 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bMUmxHA0tSjQgQxMAzsA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=Ti5FldxQo0BAkOmdeC3H:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cT0CVUH5LKmYNptCpsZXBy6XrcL4Y38e
X-Proofpoint-GUID: cT0CVUH5LKmYNptCpsZXBy6XrcL4Y38e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=743 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080110

On Tue, May 06, 2025 at 11:47:40PM +0800, Jun Nie wrote:
> Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
> supported at most in one encoder. The case of 4 channels per encoder is
> to be added. To avoid breaking current WB usage case, use dedicated WB
> definition before 4 WB usage case is supported in future.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
