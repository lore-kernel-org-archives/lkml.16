Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704F9280007
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747431615; cv=none; b=Q5e3KUT401OGZQp+78otaNZbjHxriOKkVkjpns++2+5B8nZxG4ti4DGZUYNp/7wpENt/olC6cr0ikHReDBwDA18NOKzCahrFbkhGg3GPMJ7k0qfzw9ttbYFuokDwmZfoiaWCUx35ASrTfYLtdWhzkBZMWVGmgEa+5/co6B3rurU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747431615; c=relaxed/simple;
	bh=ULw5JL4jmb3bmAeCxcOGj0CElZI1/AiawMyUUrtPpyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHSPsDrMwkMXfdkIBC+DaeSBsORUGP9Y8g5HluR61u3ihZpm5k6GSAcMNkW6MCISbewUWEzWOhhV8ttiPOxo+FtnroET3bt9jsdxtMU3eWB01VWQ9OXGeB/k2pxkBzb2vBxv8+EOMS5pW7OFm7uQ0ENdBu/qWS3LA4PX3XqbBnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZxCk93D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZxCk93D"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GG1TiD028806
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WLyt+5Z0AOIejFDuTl8oaCpz
	mlN3FLZTqlnnQr41U2I=; b=FZxCk93DJkNcuvKAn8NQGI5E3U1ByqkuzIlIXHwl
	iS8RWtkTnRKnLl24gpFtA246E5VseX+zuE8I757cgPLvv+mBYyn2IXNBe98hKHP/
	d6VJybk+eyFFuYmNh2tPNuO/t4ibS0r6hxAf2MEduKGtJOuqd3gyFruTFnmJVevW
	feci+RPVlYx9FPqICCUEvrElyV/A9TiY1pWYM8abiQLE6piykZhs86Z2YArc/kSb
	0A7ez0t6JH8/3hJIyXskqiKrFpi7fDEsvDUcOzig0n+8+9pgvJOehdb/z0w0RrUr
	EpMezCOrEcuDmmMkfmIfuhWr9Bs4/p/utgw95xTeoo8PdA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p01n288h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:40:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f6f2c41eddso55022206d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747431611; x=1748036411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLyt+5Z0AOIejFDuTl8oaCpzmlN3FLZTqlnnQr41U2I=;
        b=tyDeJb3Xo2Xmv4r3dYv4IEj0oiH9y43kHcWBFiIOrMnk+p3Z+1E8LRslMLh9DBiRtL
         aRvqKVgykLHQWCHajbqBRDY+FecJqbyQe1FM40DcU8DFXb53+kR2rgV+A6rKPuSyri0H
         ppcbbnkKmyYpcDICYcPlYVAJbXOV35pzYF9hYgEcs5HlfBCN5bWmu9EFDWqk74nHKP/X
         JaFWXMm6+JBIIdscRUO+tGGdyQhDHzbGvPMwYiXDhN9oFm+DrDjeZkVDO0soEdzNuUSO
         6y+OQETQhzPBRjLi1mXT98lj+DxcyID+Jg3Vf4HsOylcuVYR50JwNZQTC6snmQrH7fIz
         1WtA==
X-Forwarded-Encrypted: i=1; AJvYcCUCOisxmEW5gXRdzWP6pTJ59EGfe6DkoaXVM64SAyARDLXPf4ZiVdAkqMK9PcShY16XPUE0+P4rrs3feqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHAGpA4WZDz+gBhkuUMLUsBeZsFBteTXlfkmwPVY5WgkmKdosu
	4NJXSK3jZ0uETMuV/5NsD796hLgPeuf7uFHBVxqpPnKX9v64c9HtQKPhBNc9kiSenSHOpCm8Jh4
	vhaaRYd9ktiUoIpjhkKMeST4BRx3j/v35VKG5TMMIhwaUQxOtNAk0m8odwtkgk34s7yA=
X-Gm-Gg: ASbGncswWpY+XAS2uthwdBOPYabrsXH0fSRsrLFgQsSvmbog4MQGgsWsf8TJbQOfGeP
	KnA4qha1SEHIdX4yIPJfc2wgRbpvAwaOudVBgy0okjyABCqLyAnuxOf3ndjbnWg9BFA78Vdxwp3
	3zz9lMCdKb5gk1jzvAupVOw0FXzXmgFDee7ItCCQMAOSV2ydgF82BDLGgXwnKdbvzupvwTxS1N8
	dJA4kA4FlP1zxCsmorZWJ5WVUz3TfQfUQsoIV53EfSTBfZXnwa/C8MOPPzpJQSI9V0dFeIOWOL1
	biV3B+Mu8/RWksljzrmcF7dTrGpjD8nmapsmrh3wuUIZcnI4ambKpCWl5fHoWCYkxZsgG8yEpyw
	=
X-Received: by 2002:a05:6214:2341:b0:6f2:b7cd:7cac with SMTP id 6a1803df08f44-6f8b08aad53mr84737086d6.31.1747431611228;
        Fri, 16 May 2025 14:40:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlSkHU/95FW0SPZKEO3RfhsXaoQpKMCqmBdWYPgcm4PwTrfg++Ymk08ToHgTYtlLPYBsZyPQ==
X-Received: by 2002:a05:6214:2341:b0:6f2:b7cd:7cac with SMTP id 6a1803df08f44-6f8b08aad53mr84736776d6.31.1747431610813;
        Fri, 16 May 2025 14:40:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7038518sm595002e87.210.2025.05.16.14.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 14:40:09 -0700 (PDT)
Date: Sat, 17 May 2025 00:40:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/msm/dpu: Filter writeback modes using writeback
 maxlinewidth
Message-ID: <62vhglzixy2hl7uhl3queml5z3vvvqw6kefhaboip3iql6ep4e@kbl4yihvj65g>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-4-c8ba0d9bb858@oss.qualcomm.com>
 <CALT56yPxcsLhA2eigirjvNiWR5JBFW4jsOAi7QWkgmJgbMnKXw@mail.gmail.com>
 <65cb9653-e315-4b8c-ad21-14cabb7d2ac0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65cb9653-e315-4b8c-ad21-14cabb7d2ac0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M4lNKzws c=1 sm=1 tr=0 ts=6827b0bc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Ey3AjrcxibMDRGd7HuQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIxMiBTYWx0ZWRfX4ak0ZShvRogl
 QhziexWs2aL+dVmoD5r1Amu3tpl8rSI1kpMQeVKrVAYIpwpFgjiFBS+0VMju5RAvgD7eHwYuOS1
 gKaDk9RrJ4mL+p6JGnEbnc0oj36g9kjJ6vcdWSMTZg6Znfe5DSMFozfvXpvwF79Qj7ZH1V1pWx1
 4OVDyQrjKAc8s0oh9RhQ8/+VqvujT5Z16lQzkkMNtDAa+t9HghSt3v5gJP50FcZ5ZodVRvKy+xS
 k7mnebvnbwisF0jMf4Ze8XoFBkjBwpiw5RqW+s0/8a1ozqjdwBe4TbSyhaCZbF7BLj4P+bcS1IS
 cAy+vBaPXtldKCBooe5hEnAOjzYRzQcfzxF5Q1Xqe6VrHrtuIQxjvwX9kSHsvwSUqVFaca3eIrU
 BrdX4jTXmtwmF61Y1zH2jEXEaLXCrQbYsbV563/tzpTEGtRdeqcg7JkWnIBrJGKvl+FIuw/v
X-Proofpoint-ORIG-GUID: 1N5wraQGNcwKhkn769biLX4slCE1YRCH
X-Proofpoint-GUID: 1N5wraQGNcwKhkn769biLX4slCE1YRCH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160212

On Thu, May 15, 2025 at 05:48:09PM -0700, Jessica Zhang wrote:
> 
> 
> On 5/14/2025 5:17 PM, Dmitry Baryshkov wrote:
> > On Thu, 15 May 2025 at 02:52, Jessica Zhang
> > <jessica.zhang@oss.qualcomm.com> wrote:
> > > 
> > > Since the max mixer width is not a strict hardware limit, use the actual
> > 
> > Is it? What is the actual max width that the mixer can support?
> 
> Hi Dmitry,
> 
> By hardware limit, I mean restrictions based on the size of buffers within
> the hardware block itself.
> 
> PINGPONG, DSC encoder, and WB blocks all have buffers, so they do have a max
> supported width based on the size of their hardware buffers. On the other
> hand, LM doesn't so it isn't necessarily restricted by a max width.
> 
> I can clarify this in the commit message and cover letter.

Yes, please. The text above is perfect for the commit message.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> > > hardware limit (the writeback maxlinewidth) to filter modes.
> > > 
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
> > >   1 file changed, 1 insertion(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > index 8ff496082902..0a198896f656 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > @@ -14,14 +14,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
> > >          struct msm_drm_private *priv = dev->dev_private;
> > >          struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> > > 
> > > -       /*
> > > -        * We should ideally be limiting the modes only to the maxlinewidth but
> > > -        * on some chipsets this will allow even 4k modes to be added which will
> > > -        * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
> > > -        * and source split support added lets limit the modes based on max_mixer_width
> > > -        * as 4K modes can then be supported.
> > > -        */
> > > -       return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
> > > +       return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
> > >                          dev->mode_config.max_height);
> > >   }
> > > 
> > > 
> > > --
> > > 2.49.0
> > > 
> 

-- 
With best wishes
Dmitry
