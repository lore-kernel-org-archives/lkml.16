Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33F43232
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747564368; cv=none; b=fHE6oenwXoSrBk3kvHLcGmBWtaKPy7ZOK1Oezl/BvnAv+DtMp3w72czseE3OghmfXkF29mViqdOrRAfsqtQrHc/cbDWCu79i22+vkw/Ns5HkgOBZsUTgJTL/IFyB8hgn0WBrHdTzxBEs8iEdM/iIKJoSScxvBaOcO6Gl3gECTcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747564368; c=relaxed/simple;
	bh=rSNr1F8OgyIGJLC0wtphqTviRCaYM5uKzSUj+k5gOJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=naUBG6A20fPWDJWFK1tUUDQcqlVQS3vHXiCWNQfJDno+SuGdi3a/fipFNq3n8HSgaSssOTcP7BYgBUcuW4CUHEQrXbMYX0oBD/qBAgr/D2NzyaW8bH3o73E1GUaC3rpYAeq+QKtTC3/bVKoyHpddc45YkiVyKRXSg+KuAQ1QrB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cagupj3D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cagupj3D"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IADCis005543
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2KMB4Lkwm4bquu4Frj3qRe08ajtmQ9XJffkypZKuOtk=; b=Cagupj3DupOaDdl6
	hZIHTICpCYogEUpG17UOi7aniNW9zbtJ8S0B/WFJKxGBujRSALz40kNN67ic6Imb
	dafeHScYr+SEcsBPMejJ+zgPXIXnlKRnwP1STx1djW7IIlJl7IUw+5oPB5J/bzb6
	ZsvFkYLDfF11iRCuGNAwkf2wf6NBJ9lxxqTSdZhOOJdY8l8CvkgLLANKhK6W2dGo
	CBdBJXZXsW2N91bQjdZKPJVyXiVNPkeEoU6tt7mW6t+0fd+o6DWDupPeWvuEGfJk
	d2hsn9F1ZpxgTeHBorfPP9RWlPbm8oZMuh9vlFsKtdPsjwjKMXu+mfITrA2PHg8Y
	xYoukQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9ssun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:32:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f50edda19eso54329566d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 03:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747564363; x=1748169163;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KMB4Lkwm4bquu4Frj3qRe08ajtmQ9XJffkypZKuOtk=;
        b=qBEaORJbd3SDzaaxuwdJEqjh6v6crmYXniOSYKhveRmiGgg3mGNkbmdyvwyrZIx4Qy
         P9RblGEqmnSgnL53rQXwV9ltQlDm0u53HRYWjqTUV572TtMbnU0c7YJcIJ0fYF5eMuWt
         tZdr01NEmI10H66yESBMe9RqvN3Zf6nWilJbIKTAFPXRO2uPR2X4xdcPhOJ/makPv520
         52SO2rblZEk03DLpdHGOEGjQmXzZpCfun+MnytaWx2pviX4uzW2SIz0IP6oXZ/tHyzdi
         0JNjhi6YMVKWQ4BSaFn62MmNx+aFSERqBjiuldsWOdClebJxwmvWAyuBFsCxwblbdqMZ
         T82w==
X-Forwarded-Encrypted: i=1; AJvYcCVA0VIaF+1MBHIBcGuXiajlX3F0qFzDPo/8tG61+hu3EK5zngbBT/fDrv7zjTmbeAiZeYvy8dErCdanBHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUyjxvyikbPzvtrE2bmYkPr/56GoFrCKiWUqgmUuuUyXgbgCDS
	nmtOCYMOiaC+G2Djl4PfdjlzDEy+AYxL9iEebTzQ2xN6s2k2BBPspP+OhRbdxGfyJoqXgI5T6Hn
	MmOKKE3m6WlwJqY6gEuZt7U8nFf1opi1uxXcI+pnA9b1tSMhhZmlAbLCwE1oBT4uydtc=
X-Gm-Gg: ASbGncsqPnw8s/mpzFHZqaBOcDVlj8aJCnUaGNa8yE5wzUTsZTywxoDbMchIxVCe8Mo
	Eyx9xxe2w71WrD/sDrfdOQL3GutrNCV0tcUWtmtWPt2hjQaA3GEQIpiXQ79uybOSEkTdqn8ksvQ
	gKl0zNRmdR/RgfJakFwvKoHA2X/zsDA0mw0t3QMbZzmFPEb+EbEJWwAXyOlTgXG6xXZjbK2tZoq
	bfKsHJozIZvu7WSif9yCjWaMBuInFQDxELVt7cVBGu0uBQPd3j0U3ngvrrw/wklSawbgvAdflVP
	dp/I6QqYHO/+jsb0ov5eJ3FpcZ4fNdgBpvwWFWgzGHEQlQ53pGJ9lbnuqKt9vuft7K1+ggTdlZI
	=
X-Received: by 2002:a05:6214:14ec:b0:6f8:c23c:5257 with SMTP id 6a1803df08f44-6f8c23c82b2mr69977846d6.11.1747564363363;
        Sun, 18 May 2025 03:32:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPoFsBUaDrnwOXnuPwNlAF6cFAuLO04cfaVzqOcUVBeyq/FhbV/KeXlfPcZ1p20TjPJxmqKw==
X-Received: by 2002:a05:6214:14ec:b0:6f8:c23c:5257 with SMTP id 6a1803df08f44-6f8c23c82b2mr69977686d6.11.1747564363030;
        Sun, 18 May 2025 03:32:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f161bcsm1392553e87.7.2025.05.18.03.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:32:42 -0700 (PDT)
Date: Sun, 18 May 2025 13:32:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/11] drm/msm: make it possible to disable GPU support
Message-ID: <b7zkrdxmigz3bmgphedzoosgesxs3y24wgi4l52zf6r6djo7vo@aupsak7d6ma2>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
 <20250503-msm-gpu-split-v2-11-1292cba0f5ad@oss.qualcomm.com>
 <CAF6AEGt8uB-KWLDora9SN3K_VntSYZ4HNay4XLd+KqQzcQNfcg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGt8uB-KWLDora9SN3K_VntSYZ4HNay4XLd+KqQzcQNfcg@mail.gmail.com>
X-Proofpoint-GUID: HwgXKxJOcHk-QDizWFPWMSrUwwP6gaJA
X-Proofpoint-ORIG-GUID: HwgXKxJOcHk-QDizWFPWMSrUwwP6gaJA
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=6829b74c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hVAVfT_TPH0Tf30rILYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5OSBTYWx0ZWRfX4vRla9bYlglq
 eqyk8KeOVu7rW7+bxmeeN7IH87IeYppaKvDHAIv3VhohBMdsEWzJ/QoVI7R36AQeviSy3BdVB8+
 73RAkajWjAPW6JUWHIKfVcxU1PO+ZpSHVwffsllhuox8zp51zj90UDDdNvoV+AguyHE5xtQjJAw
 ctLiyRljFLkkIebZ+qQT+LxZ+IECl6X1OVN+2blSGg6RwTDDWX5fqHvoGS5dIjCFg1pwbfanTg1
 DTVbMPsiZsVaVILTGeHMZ+qqW3mf+ApkTymSThlgrjmVubJ74/PdqhFbnyiFaMDjRmUIvpqjSYv
 UwwOGVshiH1QBktm4Bpfw5ycEJlIpztpfYTYQCGPdhS7pKA6t3tp/AwhRKdjQufmIG48zUO3Zwf
 c0XB4vpLEWbKiHxSYRRctWQlLi9cPFKdM1rJvsa58RKFCP25rsK2kRvkR1DC/+bLqLXKJV6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180099

On Wed, May 07, 2025 at 09:45:26AM -0700, Rob Clark wrote:
> On Sat, May 3, 2025 at 12:17 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > Some of the platforms don't have onboard GPU or don't provide support
> > for the GPU in the drm/msm driver. Make it possible to disable the GPU
> > part of the driver and build the KMS-only part.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Kconfig           |  20 +++--
> >  drivers/gpu/drm/msm/Makefile          |  14 ++--
> >  drivers/gpu/drm/msm/msm_debugfs.c     | 135 ++++++++++++++++++----------------
> >  drivers/gpu/drm/msm/msm_drv.c         |  37 ++++++++--
> >  drivers/gpu/drm/msm/msm_drv.h         |   3 +
> >  drivers/gpu/drm/msm/msm_gpu.h         |  71 +++++++++++++++---
> >  drivers/gpu/drm/msm/msm_submitqueue.c |  12 +--
> >  7 files changed, 191 insertions(+), 101 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index f6360931ae55a2923264f0e6cc33c6af0d50c706..5605d2bc93a8ad9cb33afcb8ca9da44c68250620 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -15,29 +15,37 @@ config DRM_MSM
> >         select IOMMU_IO_PGTABLE
> >         select QCOM_MDT_LOADER if ARCH_QCOM
> >         select REGULATOR
> > -       select DRM_EXEC
> > -       select DRM_SCHED
> >         select SHMEM
> >         select TMPFS
> >         select QCOM_SCM
> >         select WANT_DEV_COREDUMP
> >         select SND_SOC_HDMI_CODEC if SND_SOC
> > -       select SYNC_FILE
> 
> fwiw, atomic depends on SYNC_FILE... otoh it is selected at the
> toplevel by CONFIG_DRM

Within drm/msm it is only used by GEM_SUBMIT code, so I still think this
is correct.

-- 
With best wishes
Dmitry
