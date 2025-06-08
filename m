Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F251EEA40
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 13:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749387695; cv=none; b=CzurN4CxoWP908nqVwmVwmlvTufwZQNLHoxQiCmMwz9WtzTeBnGi7VlASZ4CSkLUoa3dZBj13IRlARxVqFSxdK00XtX6o/q7qj9WF2CyiDCZ8z6ZDqEc77E/Ek9mo6FqDaHdu2ceL8MG7QU9HN94KhQM+CyDXZ5CJLl7UDPplfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749387695; c=relaxed/simple;
	bh=YnelUDed6OyhnKLYmE7DXZBfDcpX/W7HBa62Jbjj6O4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0VKitNHZFAUCmWA7v2YldcTNHxCY4+u+n3IhvEYJds8WvIpf2QYtm8+vgxte7lFOj3hUNAgbhUWdjCCI8iDQp/m6fcBozP12gk5d4GDcgVNut1KFPM6R7RJrd5x+PmhlnO15vzMELk5npvHWkm28BQP8aAV4ahzeaBmgJo7vv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hM2APRJy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hM2APRJy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5589gfat001506
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 13:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	83rMQCVF+5IDe8SlFKw1Sm6kmNfLPYOW0teW2Gpgxag=; b=hM2APRJyBxpJMy0Y
	PqJXpzXxSdzlhpS26nv9g3B0UY/AwolF7gfmLl371fX2IZ5cgo0TCLwT5isxuE4Q
	PLhTFZEFnVeszPzZ+Q1s5AXB0DIY9xTM52Kj2XyrQ7xoIhQjLTzAvkTXZ34IV3Ju
	4m3Y3dVg2ShXE7lGl7BMz4SYmL1dd+h4jOI47sJLNl2mxnQaJ9Vw0lXqnYCelt3R
	5cuixI44UclEKNBRlQ19lX7bD85m31xEh/05cO7Bqy4u1xv0YWyk/WspNE68vuI4
	kWqyJktwB3cQLWXg6LnSuOdDTQWsHV9wP8yaJ2IE+SHJ4Fe8ex9QEJYs9SLFQqUc
	5XJHVw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9k05j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 13:01:32 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-87ea5aa15bbso2872493241.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 06:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749387692; x=1749992492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83rMQCVF+5IDe8SlFKw1Sm6kmNfLPYOW0teW2Gpgxag=;
        b=WLlOxk3SqoD7iyQ11rePq4FdkTb1XOX8IhphW6vokDASL5ezQvLYFyRgkz70V0rn+G
         Cm8q7f8Wmit4PsnbWL6IPbPRwr2lXsyB8UQEkl+2pBfUxawhBiiwnjLcUntQDIcbts38
         7+aL2jit5npdCSjpjj+SklwM/ybQGI1Te4U5P1Hwmfi1r3JhqWFJtlHrEGiND5qaqa7l
         m+vRyfXivlY7pinhitl7HxaW05Nhx/0FW8Gf+VbuMVvnv+L3MuXZA5Di/Gwa9xsxlzMI
         yosUYXcPDpIbx0ojCXOGQu2dOSzUXAXoBnU96E36qFHkXLjJZeX81VNSsWKoOZKOgPCB
         0kcA==
X-Forwarded-Encrypted: i=1; AJvYcCXz3hYzVXX0+EG7E09RZn8AR5BXP+DCYlvQ1vX4zWl7rvdTWrEZLP59pSHEO5SFtFLfg4fWRc3TUQsticU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIjE70x8aNobqVE1iVw5v9N9NtBHhXlk5X/9KtqWnzP+OQxCWP
	GssWB8uIwQAJgTM8ugkQT+1Gdm3nMFU3/oxw8WECrZtbumi3OZ7R1A8ASA+ZofSi+CD0D7loAxU
	EF6myIBwmovjM6LkMF+WCCLaB9SkjVJWSIJgKivxj2a8HisI3eoPgJ5ng9IWXJWpPzRU=
X-Gm-Gg: ASbGncv5ZTI9xBTz9ftIQN4HQFknhwSU/jT09PLCKhglWgoG+J6AUV2tAoopf1AFzn+
	gsMF03fZb2PXlZ1aMyEzU2LLPpSx7EDjtdpkiWLJE3dCv+M3HNXvtj7eOOq/3MgsqCsZYTdb5TL
	Hp3cDLMqwviyoPjtP2qqX2CYSaXsPnlyVvRsdomf7wRj2bxZS/36gz0ebY+IED1j9dTcP8k7t7z
	S/4OE+e5I3b+MnbCxNXZYu3+lq5pLNiVQ8Fi01xp6LCompdgQJv7AcZ5Kk57Ec+x8vJONyHe6Po
	xaeTLGfi/6/zRpsAOZ6BW4MSab49y2Xj/pwjiav7UtWcx6A1+6Yk8GBeAX1HWN7kAIEq+XHkv61
	xsntY/kgT4w==
X-Received: by 2002:a05:6102:2429:b0:4e5:8cf0:8881 with SMTP id ada2fe7eead31-4e7841501d9mr2280622137.9.1749387692193;
        Sun, 08 Jun 2025 06:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAG6HcPqe+MgCFYZJUxIPkKKrruQbJNIh+aB/CzHW4ZawMXDG40gTMBIHM+z8HcVgbbJF5/Q==
X-Received: by 2002:a05:6102:2429:b0:4e5:8cf0:8881 with SMTP id ada2fe7eead31-4e7841501d9mr2280546137.9.1749387691820;
        Sun, 08 Jun 2025 06:01:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d00e2sm774355e87.42.2025.06.08.06.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 06:01:30 -0700 (PDT)
Date: Sun, 8 Jun 2025 16:01:29 +0300
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
Subject: Re: [PATCH v11 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <eavjcf6vkks2e674xhcyqpdp4yhztcbw2ofrbze3ksxsrazhyh@nvu6ifpaj3hx>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
 <20250603-v6-15-quad-pipe-upstream-v11-10-c3af7190613d@linaro.org>
 <dsgnmzswhpht4bewf5wld774riqxffojboujxdf4smutuzmuye@ugyhzv6m7mve>
 <CABymUCPqypTPh=Ao9PN44eq2_TXODhHd3EtSDeG+J0DcXQN6Eg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPqypTPh=Ao9PN44eq2_TXODhHd3EtSDeG+J0DcXQN6Eg@mail.gmail.com>
X-Proofpoint-GUID: aDoF6z5mT88ftJ2CGabVrVQBYE4cYAUC
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=684589ad cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=CD96AAi2pJaqMmpRfg0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: aDoF6z5mT88ftJ2CGabVrVQBYE4cYAUC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEwMiBTYWx0ZWRfX67TZ3wFLOfh0
 deaT8zxaOG1Xm+8qXqvs9MtlXx+aRw3s9T9tplcXneBRNtxcSpro+YbWodSC/kOzj3eIMiHu5/4
 AyGwBSe91a+JJWC+EMB7NU5gugtoKYu4wlEkPNDZ20sPYS5zkv60sdBaO5cIAaphZqL4uVajmLD
 nxx9Rk4SwYHPLbCEEYtXLqPjY82mZOXQCgk4Ri083MEwvQe0xTrfYKS0J3pztaHlCd5NZoBuKVx
 eWs/DW5B4rTcZblJoRM0Gp5nDmC2NrJOY6IEAUqUmqcqFDiVu6BQ2ldNG6GJzamfOCODUz7fs1o
 sI+jUW345oe0YycVvF86d9AjKjQ5YrgPUZ9J4fCTzhD9KeA4xw7IfA7ts8xTluaaLT/bMkT/Wm1
 cAImidoOkt0vx/+GyqWADJBX7w1qw96WUjNUcVoUNhSDTFqcsOurdHBedyJOeKh1MBfTtGOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080102

On Tue, Jun 03, 2025 at 10:37:37PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年6月3日周二 18:21写道：
> >
> > On Tue, Jun 03, 2025 at 03:10:09PM +0800, Jun Nie wrote:
> > > Currently, SSPPs are assigned to a maximum of two pipes. However,
> > > quad-pipe usage scenarios require four pipes and involve configuring
> > > two stages. In quad-pipe case, the first two pipes share a set of
> > > mixer configurations and enable multi-rect mode when certain
> > > conditions are met. The same applies to the subsequent two pipes.
> > >
> > > Assign SSPPs to the pipes in each stage using a unified method and
> > > to loop the stages accordingly.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 148 +++++++++++++++++++-----------
> > >  1 file changed, 94 insertions(+), 54 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > index 0bb153a71353ca9eaca138ebbee4cd699414771d..501b6a1bad4a1fee832f15efa7caec136a669da5 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -961,6 +961,33 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
> > >               dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
> > >  }
> > >
> > > +static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
> > > +                                   struct dpu_sw_pipe **single_pipe,
> > > +                                   struct dpu_sw_pipe_cfg **single_pipe_cfg,
> > > +                                   bool config_pipe)
> >
> > Could you please describe, what does this function do? Why is it
> > returning the pipe or configuring a pipe?
> 
> It search all pipes. If there is only one valid pipe, return it via
> pointer and function returns true.
> If the config_pipe flag is set, multirect_index and multirect_mode are
> also initialized. See below.

This doesn't look like a description of a single action. Please don't
try to mix different actions into a single function.

> >
> > > +{
> > > +     int i, valid_pipe = 0;
> > > +     struct dpu_sw_pipe *pipe;
> > > +
> > > +     for (i = 0; i < PIPES_PER_PLANE; i++) {
> > > +             if (drm_rect_width(&pstate->pipe_cfg[i].src_rect) != 0) {
> > > +                     valid_pipe++;
> > > +                     if (valid_pipe > 1)
> > > +                             return false;
> > > +                     *single_pipe = &pstate->pipe[i];
> > > +                     *single_pipe_cfg = &pstate->pipe_cfg[i];
> > > +             } else {
> > > +                     if (!config_pipe)
> > > +                             continue;
> > > +                     pipe = &pstate->pipe[i];
> > > +                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > +                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > +                     pipe->sspp = NULL;
> > > +             }
> > > +     }
> > > +
> > > +     return true;
> > > +}
> > >
> > >  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> > >                                      struct drm_atomic_state *state,

-- 
With best wishes
Dmitry
