Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3680165F13
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621086; cv=none; b=o9f02rdyf7MIvqIsY0LV1O77UpJTztQrcfkHvQF1nvhi7tTb19Wy/EORAbYlpZt52r729wy5xGyawN0pZb2SEE9mgUnmHdnBH/dVgIGczJWXcZaOjSA+03rL+QhRHkvRd1i4dndUV+Jv8FKqsFh3q8NNYOeXlrdEM5fGEuvjZP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621086; c=relaxed/simple;
	bh=p4I5Yy0eL6W6skcC8tL3IsqNvH6yif/uEXmC4BdnJ/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbIM5TMFjOjLqd1eFauxkEJKjmskuYnQhUpI8LmgHTHX+7Yw2ilgBvp+6jJcUJWXLAhvVShUS9WPKZo7uB8AxEWjoUMJrv1lj72yzVD8KAUOA6/UMHeE13BKIRaMoEue+dyBU1/n2nhB2yegE8o64nHP/CvTlwuWLJ7ce9AYLUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mh3hQef+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mh3hQef+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAam2H031513
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=95B9xrY7ndP9mcAFKeGu86Ro
	7n0TFK6C/DstmSepAoM=; b=mh3hQef+PhSUjNlSRxktnxtHsGx/83q3POb6z85K
	ejOXiWL5cJktiWlQd1uNspbi/n7CllroniQR8xLGvClIoY1Cw3Ku9mURNTeoclhC
	Hw2lh93ttF4E/7rBUHx3V+8Pj1e3GP7N5JcQ5WG0WbrxiaphSDPpOtFg7svfZlqM
	KsFJfPXPI8jFFY6f8tCDRoYZhMdAeOtH4HvPw0Ef5b9Ejge28POzc9KUVQYCBIF5
	GhidEPHqnyRng5gvjHfmwtNdu5iKWgzLEes+Np5oLz3QrVkRwZP7ON/vU1dnpwyZ
	6GqE/jDt2KIaY8Y7NeQqodR0oS5wxn1HsznsPuHJTjGGJg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vk1qm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:04:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3122368d82bso2673698a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621083; x=1749225883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95B9xrY7ndP9mcAFKeGu86Ro7n0TFK6C/DstmSepAoM=;
        b=nhhEL7Y33aNwchZUgGguAJ495TwGE3C1w0j1e01lPyR3QFDarqbMqYPdoM7xbdAoAg
         QBAad6QA99hyFgfML3KS6DTxnYT+ArKxfpFisR5UjmN4oukFlzBlKFkIk2RHNc0JuxxC
         u3eX4GiW8egf2lM3lZQ2/M1lBZWJvbaJ5U4PQ1svNSrLHE31i5cF7K+u/c+pFMvyqfoN
         t0SZuKe6GZZvxv1Er2lwSLgnZ7+qphKEZy8Q6YGTjjSKrh3q3vR8layfhe+cPnyNt85w
         wqVbzrJurAy5c+vwEjlwsdnEbJa2mUd6T2hyJHYw2p1a6h8qSYQRn+6rh1jPAHDfX0yr
         KFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYBaSfP7KmH+dMiv/hYn8Iug3De1XgPmPMk6tJUqqosR89Q/2FNyjrE7nfO75ZytxRD0ytZXFAwgFin3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXIciy4ajS+yPzeecL/CHcFWnp8uwDfOtgnSGKKas71snTW69r
	NXCCdyx/R8XgV47aMTUVWpZOF5JP7F6mditG2Kp06jgwKHdOnx4GUpOQzAqYE80Im+1r9vjKT1L
	1kQROKN1igqaQiNWYPnw+DFhgHk0flIkZi0/Aa6tT8upUpHpsUPDfLjjCCKCmPQl5TAo5Fjek5d
	PBMgTVQI6iMaQBq0tMx+SMYzDDIL0LKyW+ne7g34wkoA==
X-Gm-Gg: ASbGncuuSPC7hAwsx1m1dOFkc8HcTKLnS92vaQa5/6yol1Zzm1EkqG6W+QISvUaY3Oy
	ks7oVFZ/+loxVYWoRbJrBgo2rh4RgC52H3qs9sc3UV9nTaIgK1zibUtSNmX3vEY1hDD2LRMVBEd
	GuwUFqCf6BQJSydDMzO2wc3qQ/u4foI2hbTQ27
X-Received: by 2002:a17:90b:530d:b0:311:f2bd:dc25 with SMTP id 98e67ed59e1d1-31250405591mr4958667a91.16.1748621082890;
        Fri, 30 May 2025 09:04:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUyQsmoqBqgkDzuHgtUnqynFvBr6hCZ5aP8BN5BFbOargbHC51lr746Dzv/Q5J2fr/12YGnYe3WQfgAPBprno=
X-Received: by 2002:a17:90b:530d:b0:311:f2bd:dc25 with SMTP id
 98e67ed59e1d1-31250405591mr4958595a91.16.1748621082514; Fri, 30 May 2025
 09:04:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com> <20250529-hpd_display_off-v1-2-ce33bac2987c@oss.qualcomm.com>
In-Reply-To: <20250529-hpd_display_off-v1-2-ce33bac2987c@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 30 May 2025 19:04:30 +0300
X-Gm-Features: AX0GCFsBOsnzMy284cQgoFHDp9y_vKzexdGPlGw5XjTR61ThqE8swER7yx57D6k
Message-ID: <CAO9ioeUPJm1MbqAVJfcQSTAmvY3-TmvtZ+=Js1mZ53JFYHoUhw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm/dp: Return early from atomic_enable() if ST_DISCONNECT_PENDING
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6839d71b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=WDWld9wBFKh9IeGoHG4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RFdnB1peYbolhC784-ezSCheQS5S1s1f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0MiBTYWx0ZWRfX1DxcD2xx0EgM
 MoJHI5KL6XbqK1ia5mRQfQ7RN55f+m0gD44004jPnElnlflnYOuwABi+F5knAC3omJ05ViR0Y3C
 fXMYBiPfwFI46GZlE5pr0kHieHuOJPdegJsSrpKXCquu2clB0GC+YXOQz7ZNlGnzZzLP+PSsgV+
 gHFm8h/7Nv3weSW+DgNpqChAKS+ht8M0Tqo5X3yFBFjueBJMm3MKKPmUMzcw9DapNyMTNwVV73B
 L48YZz7Z45bfXmOukwvv/f6gJBbKsm/iuWx8PHeE6GVd79d7jtstxdI9uWlLnrnBoWKxGTUxzhB
 9ZOHXLfw6i/+9jjSnGrJiMjme4LgifY5OArftL1b6VJAuWDoP8PSzgMGduGqr/w5I0NwNRhBvJR
 rqIxiCH7yUGlE4CcLh/YLEeXuVXkraT/rCP1eY+CsNPO+rLwRzWB30q9UW70OHTt7tt4RCuB
X-Proofpoint-GUID: RFdnB1peYbolhC784-ezSCheQS5S1s1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300142

On Fri, 30 May 2025 at 02:15, Jessica Zhang
<jessica.zhang@oss.qualcomm.com> wrote:
>
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> The checks in msm_dp_bridge_atomic_enable() for making sure that we are in
> ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.
>
> DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
> msm_dp's atomic_check callback returns a failure if state is not
> ST_MAINLINK_READY.

What if the state changes between atomic_check() and atomic_enable()?
There are no locks, cable unplugging is async, so it's perfectly
possible.

>
> For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
> there is an atomic_enable() without a prior atomic_disable() which once
> again should not really happen.
>
> Since it's still possible for the state machine to transition to
> ST_DISCONNECT_PENDING between atomic_check() and atomic_commit(), change
> this check to return early if hpd_state is ST_DISCONNECT_PENDING.

Can we really, please, drop the state machine? I had other plans for
the next week, but maybe I should just do it, so that by the end of
6.17 cycle we can have a merged, stable and working solution? This
topic has been lingering for months without any actual change.

>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1d7cda62d5fb..f2820f06f5dc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1512,7 +1512,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>         }
>
>         hpd_state = msm_dp_display->hpd_state;
> -       if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY) {
> +       if (hpd_state == ST_DISCONNECT_PENDING) {



>                 mutex_unlock(&msm_dp_display->event_mutex);
>                 return;
>         }
>
> --
> 2.49.0
>


-- 
With best wishes
Dmitry
