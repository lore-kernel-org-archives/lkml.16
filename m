Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E552520F07B
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747562287; cv=none; b=VQxI5Gv9difehKGL7Yrar+rEln2HIYQdsH4df8vg+hZOLIgqWhZFi/XFUtflp8bz0ZeNP+jajYdVk2owKW25V2PYSBPd9L4YBp0wGH0+ECn/p+WLQ2ByIvhBvdkDEOtLz7RXQXKvhuEV7zkYC3K9luMUpFmriXpggF7MRImJVto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747562287; c=relaxed/simple;
	bh=cmH0hPAfrYKbYSEMqjFczo5+jIGE8EJktyto1sXpkC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkhR/XdPkoFux/ihI/DwFr0uY46wwL7ngQ6Wm1nmvU2cKe3YAAzBM5eR2BBXL45WO2DKD36g6CH41LyscxWuWcpwb4UZVQbweMOND6G0GE3u2liryAGKEH3JNJf5E/qvCPqvnPrRw93/taRRGFUGHZFBHh7DhFhrIgLyAXZofec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2tPW4JL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2tPW4JL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7HnAx001756
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gT+4GMAdIcHZx7zz1ZKYcaAm
	iPe1Cu+OKG7s22TPW8w=; b=i2tPW4JLvJ5hIuvroOV6KoP+4P1hb/Kz/hcuDHwc
	qYMXkEDUeGjeQ4sM4hmp9/jn816r/Cm+ysNRlafQi36HUE7uD5x8KBV9yaQvYlbG
	3paaIYVP4qwfJPwluXrgXu90X32j4gzQM5uOM9ilyt1QHHNpx69oBDScF0V5NiUg
	Q2d4DeX4i9OR01Sh+v7UCZUKAOVwu+qSwfaItOh1KUX+Xe00QjEJjaXlwMKlUjEC
	nBjgNkkCE+Hv90nNYOVHCrFtB9bqbRtqLeTBNeEZaeurY9O02/RZCg2ALxf3KlJq
	uKywxubi/IAqNGD2l637Dd0+v7kNiGDCY8nKrp4lKV8tFA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjp31te9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:58:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8c0a83f9cso33634336d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 02:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747562283; x=1748167083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gT+4GMAdIcHZx7zz1ZKYcaAmiPe1Cu+OKG7s22TPW8w=;
        b=piqu7ERQnwyKtarbZtSqlyn5yBf6CYfsCM/vldRh3TyBV1dt140074xW0TjmqzFojV
         Q+6diXUtYNQA3MFZ6+AENp4w0J7FGAyKkHEO0gnvopX2SKbQv+0en+YxXODOgXpYLhS8
         qA1YkCXqFIcSykvkWnUIX8lk9Y17w67qkHQWR9x6XQkqCD6jdvVb0sA7bQygXnHJQ37f
         P/7Fw76gaZqVUJaP4zGXtI4XBTVcwsxRZjTE49UbJwUFzd6jxUmPAmnhiP43OjkTfowp
         FrpHAobQ9oJAjxJ9FIpV4Hp/eashCyTCOjqbOdTgaJe4BbUaGxOI+rx2utLLXs4pY0OY
         fmLA==
X-Forwarded-Encrypted: i=1; AJvYcCUIhapmGG6+8pQ8gnwC0hcHIuXlX7NJjxCyv7xCQ9ve5bb9B5W75UB1ovlSVEEBpuaiZIztaq5ngLTcpzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFu3CvFSznw9bg/smSY+8UDE/3DhHqteyyXU7zvHlRHfXy+Ogs
	9gZVSi0CDC6VwQqrNICa8JzZORd4sxF26JM2bNoxo+XOYdcOVi1hNOJrAZVeWnIZonQKAaQpYxB
	aYW1vCCACJi6mub+6le10mcao7ZGrXKkJoIWSQLqM0GCPfzipdHndVdPNiyMeMfx7Z7o=
X-Gm-Gg: ASbGnctajSM1E2qfWiTQaVWwwLydS+kLHGeAzukBQiGjcQy4LiXeHgXyLOWkKhZCai4
	AXjVaOIC+xaXXabn4JTYPgY+iFtwn+2g5g/hMzkswNW2EBlZ30J7ER8O77pz/yvEQ4igK7zhLCA
	tKwMQyaeDlk4RHqCtyGkfQRqbjei9SOEsw7Ougr5fBkMeGu00Z8GuMkF0Vtd0bAoAWII9mlCLJM
	AqATuimmKQ1IY9jplmli/fSgNGlZsdTN2tshNuPHWhVIXwKPYJsv9W6fUfrF3/qzJLt4nx4uP7w
	2X9C477isaab1rxewf1b7F55C33OW4cmnFKqZ9IVyTgg57eNduxAT798iIFPVdKGxLLGF/LAsb8
	=
X-Received: by 2002:a05:6214:1244:b0:6e8:fde9:5d07 with SMTP id 6a1803df08f44-6f8b2d43931mr131431396d6.26.1747562283625;
        Sun, 18 May 2025 02:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXOR6vgmS6GPiW625UI3++wlwyBg0bFxpLkN+zyktFFittJClz/BbivAaprb8YwW0sMhFTKw==
X-Received: by 2002:a05:6214:1244:b0:6e8:fde9:5d07 with SMTP id 6a1803df08f44-6f8b2d43931mr131431096d6.26.1747562283284;
        Sun, 18 May 2025 02:58:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf976sm14124621fa.103.2025.05.18.02.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:58:02 -0700 (PDT)
Date: Sun, 18 May 2025 12:58:00 +0300
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
Subject: Re: [PATCH RFT v3 11/14] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
Message-ID: <lkzvk5vqxy3oe4f67tg5hirmqarfcq6xibljhtspvufuebxbna@k36dw3km25qa>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-11-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-11-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B8u50PtM c=1 sm=1 tr=0 ts=6829af2c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=lyADY8evpk1XTh_PsdgA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: ZUOOYqYoWAnNJvC-gSqgMSaUGNpaW3ry
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MyBTYWx0ZWRfX0GhtgWLzdHX0
 0sfZ1ndbGjNS49sogg8Zx0FOrwNgAZksnGPbpFm9A8holpUn+vNPE6rXddKd9I9HQ/VwtFhpUsr
 cAcfBUWOFFiIAE2tHMKCY9VjpjET14ek0OB0hr5q+SDmNk/UZetHzbZW9EYOu7PMMdqrxoTL/Vv
 AOwAH+87nMb1Ju/zcmn0eNxqhRz6VajNi8xnF7uEc23ED72AJEbD+gBuAyk9h4oM86yuFktCJjT
 mkVrIaMWYcxgpvalTfD9U+nIleAM23J1Cb99nnH4wzscbC9Beya9uAeagimjjvn62VxBGqrfUuH
 zKMPI+9eYKa1Un/4qo15rkTB8V76UeasZl3dNfsleI5G1Ui5Zpw1ilCGIoEggw0RqQE+ijbHQYv
 Mxh58ImJTXmMZyI+qpLh93WEfJ4ejSCoki3KWiX56Q/7rIEHs+5SUMLZILgmswbK1hCrkmnQ
X-Proofpoint-GUID: ZUOOYqYoWAnNJvC-gSqgMSaUGNpaW3ry
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=901 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180093

On Sat, May 17, 2025 at 07:32:45PM +0200, Konrad Dybcio wrote:
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
