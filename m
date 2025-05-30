Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B57F55E69
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748617147; cv=none; b=HCnMqlxCd/YV6DzHbk/5M6+2Fm//PS1gbqEr1MtH8IeiWLZBmGNBwdd+hsdqr0Z04sl0t8tIO4rYSs9tnpXlSIiFfcz0Fb29Lv8zbal2B6uL5l7Cbb0utqAiLdoLN68pAh7GQVMaadLPnh4h59X9Vm+EEt9CxJZQExm+t8RHRx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748617147; c=relaxed/simple;
	bh=PRnBjKq3Vs55NWdoCQ0z/ak6ycROnhYhMqCmI83qiUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pG1+KR+UwkqyyqMhg/QG6Inn/uWmQ/7ZGD5AtlyohHQHY/VKlJ5lOzMR5C43R6SV3O2KovdlLKJajz4/Enfc+nf1MEhapZJYnp0kM+aNAfnCOMegsrO9gulQCz4yrrQRY92CxqF+W0nWc50p1MIvV9DRjTT4icTntzZW17z1i1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bF3818Ku; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bF3818Ku"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70e6bddc30aso21376117b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748617144; x=1749221944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F40ejr5VtTWUVu2ZmI0k1V/v4j0cLgLE4WaZnAIPVrw=;
        b=bF3818KuoN05LiOm1Fvq+LHKvVpOCeOqoRVevndaS6sAVcbgIbWfb0lgnQEBRqDoi+
         t7pj3dtcWXdyQJ0Zhn7qk8gg/xLFv01GsyO9t9y9aK2jx29JGq7P64YKz3QN5pczlMox
         I3DcV4UC6k4vqdVlTnulZaToNmhWfLHH0VqkZJhBQbirAuhTqa1nkuuQte2LtDfrlagU
         gFO0HGxzlVR2pJQdq0qI1GvmJQSVIzqQ06u54ucBdiWQhqtn/JipOPJg1tjXHZ/TPbto
         Fcqp2t0F2hnxUlgxjvdUUDNvB5PG+cybQEeSR4Vfq+3rKwGxBkAtnI8y0VqQ/8virX6r
         HB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748617144; x=1749221944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F40ejr5VtTWUVu2ZmI0k1V/v4j0cLgLE4WaZnAIPVrw=;
        b=jRFupolnXi5gTcU9llkpnKCZRbz+62wnJlXimpt3X8NhIc8Ki2RPX6LVuSxRPj7VRd
         ddV/fP3Q3+lm/xOtar3/vGyfCnMTuQDgdzpnzsFIMtmRy0xaRISBhfZI+bZ+3yWp7s3u
         mIfVpo3WYIbLZAwtYVq7f5+cZW1mHc2lYJAgVXHGFqe4wQysDVBIkhoxWxhHTVdzgUXR
         wRaUcZgPbFMWEEXp80Gy2SWvVmOQ3hxY/XcadLzwm+go0yTT6EqI4SnEs/wUpyG8+qYj
         lswyxZgYNA5BK1y7JWqr+PTrpa82s1knw9niAGaONAmizu5Jx2t9faI6kpBxPg7rBM/I
         I2ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0gOv2JCm3CG9pbzknJbcGRbvr7+vqdOCB9TTnYXhCZk0geKjRtYZMcO4rM08AKt1VLW/vyHUf4a0x70Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFmv2hWWhIgZfsMiiUb7sdkjfbcyqvDi7mhRMkeax5rEwr2QWh
	2+ChOtJEZ7yyhO71ffPl2El0nHEUwvsRXYePMr/j+w6vR+0tgG6NqV29NHcBB29QHcZEuFiZcWT
	E97gv2flO1yMVIl6Q06yfNs5vLlYnquFRFxJFasY9rQ==
X-Gm-Gg: ASbGncvDzrzTcJ5sf8PgxBgAH6gwusCn+r5n2wEIap7+dhWwyDF1uZBbua9MqnUY58Z
	ry5p0mn0R18iyA16wJotzQFsoqP1WJd68X9pk3IyDhfQFINxvV8yAEz72f0qnzORSa3TvdNoNwY
	KhOnwTgdW/KtiEYNpeQzqUVBGb3W49BaLm1ZSsHjtStZAJ4JXaxQteIguOTtjQbE0mrgQKKkxZ2
	++BLA==
X-Google-Smtp-Source: AGHT+IGgNAVjj4IxjNpEQj0RCxPeO78NwasppbZVwvKX/SoxUnWbNk0DiJf246mwv4t676hAuZm20jwM2OLFfiitHIc=
X-Received: by 2002:a05:690c:dd6:b0:70d:ecdd:9bd3 with SMTP id
 00721157ae682-70f97effb18mr60432017b3.27.1748617144185; Fri, 30 May 2025
 07:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
 <20250526-v6-15-quad-pipe-upstream-v10-10-5fed4f8897c4@linaro.org> <45hk22fdghaqnilukvqayjcbnf3btntknqrwf5ivx346vrgag3@aebzt76tkjzw>
In-Reply-To: <45hk22fdghaqnilukvqayjcbnf3btntknqrwf5ivx346vrgag3@aebzt76tkjzw>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 30 May 2025 22:58:51 +0800
X-Gm-Features: AX0GCFslvbFYpcTCVRsoPzq1BK9-uq6X4fVoG8uX4cmCA6kcXjeno6A7befYAHg
Message-ID: <CABymUCNuYDjmytbb+HLg1KF5eOyQVNczcq_wqFdo51cr0Y6BdQ@mail.gmail.com>
Subject: Re: [PATCH v10 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
5=E6=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 02:22=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, May 26, 2025 at 05:28:28PM +0800, Jun Nie wrote:
> > Currently, SSPPs are assigned to a maximum of two pipes. However,
> > quad-pipe usage scenarios require four pipes and involve configuring
> > two stages. In quad-pipe case, the first two pipes share a set of
> > mixer configurations and enable multi-rect mode when certain
> > conditions are met. The same applies to the subsequent two pipes.
> >
> > Assign SSPPs to the pipes in each stage using a unified method and
> > to loop the stages accordingly.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 126 ++++++++++++++++++----=
--------
> >  3 files changed, 88 insertions(+), 51 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 85f585206218f4578e18b00452762dbada060e9c..47ab43dfec76acc058fb275=
d1928603e8e8e7fc6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1562,6 +1562,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool =
en)
> >       return 0;
> >  }
> >
> > +/**
> > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> > + * @state: Pointer to drm crtc state object
> > + */
> > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> > +{
> > +     struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(state);
> > +
> > +     return cstate->num_mixers;
> > +}
> > +
> >  #ifdef CONFIG_DEBUG_FS
> >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> >  {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.h
> > index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd1246a989=
5c4c8714ca6589b10 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_ge=
t_client_type(
> >
> >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> >
> > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> > +
> >  #endif /* _DPU_CRTC_H_ */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 0bb153a71353ca9eaca138ebbee4cd699414771d..f721dc504bbbe3a49986239=
adee113bfb6790f70 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -961,6 +961,33 @@ static int dpu_plane_is_multirect_parallel_capable=
(struct dpu_hw_sspp *sspp,
> >               dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidt=
h);
> >  }
> >
> > +static bool dpu_plane_check_single_pipe(struct dpu_plane_state *pstate=
,
> > +                                     struct dpu_sw_pipe **single_pipe,
> > +                                     struct dpu_sw_pipe_cfg **single_p=
ipe_cfg,
> > +                                     bool config_pipe)
> > +{
> > +     int i, valid_pipe =3D 0;
> > +     struct dpu_sw_pipe *pipe;
> > +
> > +     for (i =3D 0; i < PIPES_PER_PLANE; i++) {
> > +             if (drm_rect_width(&pstate->pipe_cfg[i].src_rect) !=3D 0)=
 {
> > +                     valid_pipe++;
> > +                     if (valid_pipe > 1)
> > +                             return false;
> > +                     *single_pipe =3D &pstate->pipe[i];
> > +                     *single_pipe_cfg =3D &pstate->pipe_cfg[i];
> > +             } else {
> > +                     if (!config_pipe)
> > +                             continue;
> > +                     pipe =3D &pstate->pipe[i];
> > +                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > +                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +                     pipe->sspp =3D NULL;
>
> If this function is 'check', then why does it change something in the
> pipe configuration?

I see modification is made in other check functions, like
dpu_plane_atomic_check_nosspp(). So
the name is referenced. Do you think dpu_plane_get_single_pipe() is OK here=
?
>
> > +             }
> > +     }
> > +
> > +     return true;
> > +}
> >
> >  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> >                                      struct drm_atomic_state *state,
> > @@ -1028,15 +1055,15 @@ static int dpu_plane_try_multirect_shared(struc=
t dpu_plane_state *pstate,
> >                                         const struct msm_format *fmt,
> >                                         uint32_t max_linewidth)
> >  {
> > -     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> > -     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> > -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     struct dpu_sw_pipe *prev_pipe =3D &prev_adjacent_pstate->pipe[0];
> > -     struct dpu_sw_pipe_cfg *prev_pipe_cfg =3D &prev_adjacent_pstate->=
pipe_cfg[0];
> > +     struct dpu_sw_pipe *pipe, *prev_pipe;
> > +     struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
> >       const struct msm_format *prev_fmt =3D msm_framebuffer_format(prev=
_adjacent_pstate->base.fb);
> >       u16 max_tile_height =3D 1;
> >
> > -     if (prev_adjacent_pstate->pipe[1].sspp !=3D NULL ||
> > +     if (!dpu_plane_check_single_pipe(pstate, &pipe, &pipe_cfg, true))
> > +             return false;
> > +
> > +     if (!dpu_plane_check_single_pipe(prev_adjacent_pstate, &prev_pipe=
, &prev_pipe_cfg, false) ||
> >           prev_pipe->multirect_mode !=3D DPU_SSPP_MULTIRECT_NONE)
> >               return false;
> >
> > @@ -1050,11 +1077,6 @@ static int dpu_plane_try_multirect_shared(struct=
 dpu_plane_state *pstate,
> >       if (MSM_FORMAT_IS_UBWC(prev_fmt))
> >               max_tile_height =3D max(max_tile_height, prev_fmt->tile_h=
eight);
> >
> > -     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > -
> > -     r_pipe->sspp =3D NULL;
> > -
> >       if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &=
&
> >           dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_li=
newidth) &&
> >           (pipe_cfg->dst_rect.x1 >=3D prev_pipe_cfg->dst_rect.x2 ||
> > @@ -1194,12 +1216,11 @@ static int dpu_plane_virtual_assign_resources(s=
truct drm_crtc *crtc,
> >       struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> >       struct dpu_rm_sspp_requirements reqs;
> >       struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> > -     struct dpu_sw_pipe *pipe;
> > -     struct dpu_sw_pipe *r_pipe;
> > -     struct dpu_sw_pipe_cfg *pipe_cfg;
> > -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > +     struct dpu_sw_pipe *pipe, *r_pipe;
> > +     struct dpu_sw_pipe_cfg *pipe_cfg, *r_pipe_cfg;
> > +     struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> >       const struct msm_format *fmt;
> > -     int i;
> > +     int i, num_lm, stage_id, num_stages;
> >
> >       if (plane_state->crtc)
> >               crtc_state =3D drm_atomic_get_new_crtc_state(state,
> > @@ -1209,11 +1230,6 @@ static int dpu_plane_virtual_assign_resources(st=
ruct drm_crtc *crtc,
> >       prev_adjacent_pstate =3D prev_adjacent_plane_state ?
> >               to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
> >
> > -     pipe =3D &pstate->pipe[0];
> > -     r_pipe =3D &pstate->pipe[1];
> > -     pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > -
> >       for (i =3D 0; i < PIPES_PER_PLANE; i++)
> >               pstate->pipe[i].sspp =3D NULL;
> >
> > @@ -1227,44 +1243,52 @@ static int dpu_plane_virtual_assign_resources(s=
truct drm_crtc *crtc,
> >
> >       reqs.rot90 =3D drm_rotation_90_or_270(plane_state->rotation);
> >
> > -     if (drm_rect_width(&r_pipe_cfg->src_rect) =3D=3D 0) {
> > -             if (!prev_adjacent_pstate ||
> > -                 !dpu_plane_try_multirect_shared(pstate, prev_adjacent=
_pstate, fmt,
> > -                                                 dpu_kms->catalog->cap=
s->max_linewidth)) {
> > -                     pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, =
global_state, crtc, &reqs);
> > -                     if (!pipe->sspp)
> > -                             return -ENODEV;
> > +     if (prev_adjacent_pstate &&
> > +         dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, =
fmt,
> > +                                         dpu_kms->catalog->caps->max_l=
inewidth)) {
> > +             goto assigned;
> > +     }
> >
> > -                     r_pipe->sspp =3D NULL;
> > +     num_lm =3D dpu_crtc_get_num_lm(crtc_state);
> > +     num_stages =3D (num_lm + 1) / 2;
> > +     for (stage_id =3D 0; stage_id < num_stages; stage_id++) {
>
> Can't we just loop through all possible stages? Same result, but makes
> the logic somewhat easier.

Yeah, that's doable. Will revise it in next version.
>
> > +             for (i =3D stage_id * PIPES_PER_STAGE; i < (stage_id + 1)=
 * PIPES_PER_STAGE; i++) {
>
> I still really don't like this idea (and especially the part with
> (i % PIPES_PER_STAGE =3D=3D 0) condition). Extract current code which dea=
ls
> with two planes and a single stage. Call it for each stage. That's it.

Will do.
>
> > +                     pipe =3D &pstate->pipe[i];
> > +                     pipe_cfg =3D &pstate->pipe_cfg[i];
> >
> > -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +                     if (drm_rect_width(&pipe_cfg->src_rect) =3D=3D 0)
> > +                             break;
> >
> > -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NON=
E;
> > -             }
> > -     } else {
> > -             pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, global_s=
tate, crtc, &reqs);
> > -             if (!pipe->sspp)
> > -                     return -ENODEV;
> > -
> > -             if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_p=
ipe, r_pipe_cfg,
> > -                                                   pipe->sspp,
> > -                                                   msm_framebuffer_for=
mat(plane_state->fb),
> > -                                                   dpu_kms->catalog->c=
aps->max_linewidth)) {
> > -                     /* multirect is not possible, use two SSPP blocks=
 */
> > -                     r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm=
, global_state, crtc, &reqs);
> > -                     if (!r_pipe->sspp)
> > +                     pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, =
global_state, crtc, &reqs);
> > +                     if (!pipe->sspp)
> >                               return -ENODEV;
> >
> > -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > -
> > -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NON=
E;
> > +                     r_pipe =3D &pstate->pipe[i + 1];
> > +                     r_pipe_cfg =3D &pstate->pipe_cfg[i + 1];
> > +
> > +                     /*
> > +                      * If current pipe is the first pipe in pipe pair=
, check
> > +                      * multi-rect opportunity for the 2nd pipe in the=
 pair.
> > +                      * SSPP multi-rect mode cross mixer pairs is not =
supported.
> > +                      */
> > +                     if ((i % PIPES_PER_STAGE =3D=3D 0) &&
> > +                         drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0 =
&&
> > +                         dpu_plane_try_multirect_parallel(pipe, pipe_c=
fg, r_pipe, r_pipe_cfg,
> > +                                                           pipe->sspp,
> > +                                                           msm_framebu=
ffer_format(plane_state->fb),
> > +                                                           dpu_kms->ca=
talog->caps->max_linewidth)) {
> > +                             i++;
> > +                     } else {
> > +                             /* multirect is not possible, use two SSP=
P blocks */
> > +                             pipe->multirect_index =3D DPU_SSPP_RECT_S=
OLO;
> > +                             pipe->multirect_mode =3D DPU_SSPP_MULTIRE=
CT_NONE;
> > +                             DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d=
 for pipe %d.\n",
> > +                                             pipe->sspp->idx - SSPP_NO=
NE, i);
> > +                     }
> >               }
> >       }
> >
> > +assigned:
> >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> >  }
> >
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
