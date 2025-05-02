Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A047225775
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180595; cv=none; b=atoNFsNaWEf7Wgr3i08OG5q7UwJ/BjFTPAYyOWAAG2iwrCPEfBS+yDRY/DEE/YofeIq+u/+RuSeBy7Tf86x88qa6HUvRZxIaUJ2V9Nih69Pt69ZQlWvWtr3mScvJKa4fnjQOz7Szx7m3eWLvvOUZyBKNsp0np9gK48O63UIjXOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180595; c=relaxed/simple;
	bh=qlMVNMkQHxK+iWBIahZTo088WtpDWSN9kcDQ7wvfYsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQgACDUDsSyN4UeOy04nCPjfNA27QH/Nk4o+SBxUuCo/dyJNoEVG38qJAlt6nKAAqKjFeNiJxCaiBZzMbNX+F51MBn2ke95KCUl1oku90j5tO66qzdrUHsy+N4mwVODdW128T7MP6K5gZLkMDifZnUdE1rLSgZjFJq6TVm7xtVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5QNqvAp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5QNqvAp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421NCOe015176
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 10:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eGb1DlUbL3NjKY/kTW9b+ae2
	nxS0xZx64n5ndmQSd6c=; b=A5QNqvAp5jkwLT+0EyVxkW5mulaAL90Je2+xwzeM
	qyBWdXFm0tbRwy54j3HeK1MpiN1rita+E4lQKTJIt7Iu49/UToqQxANcpBRy7K/K
	I3P1L23ExvE1bH/vDER3dlrchk16s0vq/EU3ThgSHe8KSnR+3UUloULe1V8+SCP2
	iesFZIeyB7x/OhRWuhkjLuUPXguVqWzveeu6f0fVzDsgS1/WZLdJzmXWnNiSJ9JD
	pIgpkyg6LGKOk5CdrvfXWsmCLRHg64M/rgsO00jJLikmiZ3rTWHw1tBdXLDpS8AD
	Xfq/3SNCExOlmrkl6RD19f6H9eX8r2NEDhcXe1iQeMPVhw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uayv46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 10:09:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-478f78ff9beso60458971cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180591; x=1746785391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGb1DlUbL3NjKY/kTW9b+ae2nxS0xZx64n5ndmQSd6c=;
        b=ds7FHykU/tDLmtRX/JFJx0ZciUJjL0g63A+kbcE4UVBCrB9T1bJOe43Avp6vcDa+9W
         MXqosRxPS06emjF4RxzCJFYWlIt9zak+j6zKzC3FmapRFSOvghK/iEIADr856aZr8RNj
         jSZhhRfgNj/oRmXLSEcfwltWiTL98GQm737441vTUj1RQ1RAVi1pshqXFojtqfDUdqPH
         33z6v/iU7r0F4rSBlLFH05/3gkcn2Y3aBysI2bmjjDVKRJu3E+si3OMk4LGSofYg3BzF
         2K6Cqthyo72/im6oAbS8S1F+7REkJs3M59nBr733GZ3zx2X5Kz8TbMkWKsy/CQ1G+Hzl
         Kn2g==
X-Forwarded-Encrypted: i=1; AJvYcCVj5+akddKi3RebQiyQdOMHTaECXkLV1Bwr1rFmpxLC+NoAwRjH0/lO8p288YgfPPziSN070j42SelAqEg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2eOmJjWb3cSouWO0lR81JUxu+OrVxF6SLOEXhxhWjqcnbAlpQ
	4Wf5s/3svLnEInXVb+foWzmDwbkXDRQ2oB/TfgXEF5IOIwgxVi9OYIrPwymtkC7EJHv5kRZ56YW
	6te9WrdzieJpNAHYq+2b979mZXE7pK19OO3gr6kKhDsVQYcfqAjYiP2sGvtuKxts=
X-Gm-Gg: ASbGncs7BJP2uua8vos2yZuj50YJ1URBoLD/f7oyOStPFfI1JJerKuBOd0LWKB1GIq9
	1p0WezmHViwzoz9nerEJOAORwiUZmbSGWQ8MFkk2tCvFEZK9UHW9p4Hb9T9vKirBoZgRh5rIUpb
	/VKrFWbBWQQNixiiKCFdVep20S1pHmtNLt4P+5/ej61lWK2ZgSIUpHU9ZdrggZTTBZfoPTHOIEt
	GandWzFDulMEiDzo4NJKpb9aPdCr3ACDhmZGRQBi3tWIDdMRt3mII+6qWdRzlx2BZIiG242JBC0
	6MvImWwUcG9VzbQHcZKGqe27acJjwT1JA1OYKmIzsplNJzoFAiMOZY8Y8+B+SSMFfSBH22DNWvA
	=
X-Received: by 2002:a05:622a:908:b0:476:7f5c:e303 with SMTP id d75a77b69052e-48c31c1393amr33914641cf.26.1746180591591;
        Fri, 02 May 2025 03:09:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI+T+sdPnhpQgFYsQMx/i1P/XK7HsEdfcoW/C3AL1UBNlcOIoAgvN7TUEI2OJ5tLKMoKv/uQ==
X-Received: by 2002:a05:622a:908:b0:476:7f5c:e303 with SMTP id d75a77b69052e-48c31c1393amr33914241cf.26.1746180591064;
        Fri, 02 May 2025 03:09:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f680dsm309413e87.220.2025.05.02.03.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:09:49 -0700 (PDT)
Date: Fri, 2 May 2025 13:09:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] drm/msm: make it possible to disable KMS-related
 code.
Message-ID: <lyzp62vwvina435pdskwalcgjmejkbs6u6ozx3nn3epvyjyqo4@2o4w7uxrklp6>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
 <20250413-msm-gpu-split-v1-3-1132f4b616c7@oss.qualcomm.com>
 <71594689-06f7-41cb-ba6c-65459388fd1d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71594689-06f7-41cb-ba6c-65459388fd1d@quicinc.com>
X-Proofpoint-GUID: 1VDBb2fYPIlwFYjyaHPXuAPYXK6QNS5O
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=681499f0 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=CDNnaGQRe6Xf55pPQM8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 1VDBb2fYPIlwFYjyaHPXuAPYXK6QNS5O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA3OSBTYWx0ZWRfX3twsedDbGPlu dbK+2LmDWOPI6prVxYbFlNrnk7K4jPcwHhJFO1v6smxk4bvdSkIyM+xTugXQyk050DzCVuNzQqA h+kowZZXGVXRYOTOw4tIQDRu0XSvS6wydlzqI8yks7iVGPUiOI1frg19XmZg7kH60ZGre31crLF
 iLniEjsbqO7Ux/6mrnP+sMqJxYvmMLFTkHgjrVzqCxYCxj1G8yY2kQjVt2y0kTp679VQNqunGHk G9KxqqQ6WgDZYkt7XA3deJ90HsbaTidhDBCgQf3fHrItaJl/8yoFML52muh4jXxB44s2+iGCM1J B/Uz+7sBmU5jJ4lR+dg70oDw/4J7olDOWSYdajJqJpXwr7IH4s/uPLMsO7YFvS43WLgH8sSo+Ew
 eDEoRZehO+uEvIRSTTMT3XiptaNlzNsETZb3i9PoHc5Qg8zy0maxF9ZRynWaZeRRcZyULCwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=772 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020079

On Wed, Apr 30, 2025 at 01:09:31PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/13/2025 9:32 AM, Dmitry Baryshkov wrote:
> > If the Adreno device is used in a headless mode, there is no need to
> > build all KMS components. Build corresponding parts conditionally, only
> > selecting them if modeset support is actually required.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/Kconfig       | 14 ++++++
> >   drivers/gpu/drm/msm/Makefile      | 16 +++----
> >   drivers/gpu/drm/msm/dp/dp_debug.c |  4 ++
> >   drivers/gpu/drm/msm/msm_debugfs.c | 92 ++++++++++++++++++++++-----------------
> >   drivers/gpu/drm/msm/msm_drv.h     |  7 ++-
> >   drivers/gpu/drm/msm/msm_kms.h     | 23 ++++++++++
> >   6 files changed, 108 insertions(+), 48 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index a65077855201746c37ee742364b61116565f3794..5f4d3f050c1fde71c405a1ebf516f4f5a396cfc4 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -88,6 +88,7 @@ struct msm_drm_private {
> >   	/* subordinate devices, if present: */
> >   	struct platform_device *gpu_pdev;
> > +#ifdef CONFIG_DRM_MSM_KMS
> >   	/* possibly this should be in the kms component, but it is
> >   	 * shared by both mdp4 and mdp5..
> >   	 */
> 
> As the comment says, I am also thinking that this should be part of msm_kms
> struct, to avoid ifdefs. I didnt follow the second half of the comment that
> this is shared by both mdp4/mdp5. Why does that prevent it from being in the
> kms component?

Indeed, there are no such limitations nowadays.


-- 
With best wishes
Dmitry
