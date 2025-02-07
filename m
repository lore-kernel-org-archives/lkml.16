Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E91FBA50
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 01:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738890798; cv=none; b=bA7oTu9qP71KEven6ezeub1CXGiWJdPTq6Ejo1B/oDfJrdmkUoCxKi1vGvA2j/hPvB5xoMDnyxAwgBcPMSSOrbGfC0M58N2F5/qItXTV3z6xEgINuiih+wJUCnGZGiTHVts0MpPCZkUy3OA662pFokAdIymUgAG5SelmzGgn1gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738890798; c=relaxed/simple;
	bh=ucaP57Z4CG/wLty2S2lG0pABPKr1uFpZFwzJgcqJ4yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBm3AQVWtT//AI3GtqmLtGb7HsVfx2hdEqdsPGGayUnkNDOOxAg9GtNhkxJlJfm5uvITqcLHWQQ0e8spspTehQrrkMM5izif9IcJAUcjMatJ+rSkmQblkNbshqk73+a5g9YebBCOaXBxb3J6NeEg86kaJAFhm1WQiJLWuFflvOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EAdwoC4q; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EAdwoC4q"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53f22fd6887so1724814e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 17:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738890793; x=1739495593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mD8MU9ia7DeQdTywSD1JdEVbwh8ZTx//S8otRz+v9E0=;
        b=EAdwoC4qPOtNtDy6LNw9zESrGNzbpAEnoLpThfU3aJCOpbscC9jGoY2aY+s6Clfx/h
         C3mEPXI8yvV7biiDQ0rpx64bKP98YklHr5KFILNQ9i5tr87qfMBD7/TFOxZ6TKuusvly
         KdzM0/4oKI+YiwmdWHvMlaDofInRF9ZPD6KmNL+cUY6+vNjyd4+mjLGqTbTYHAf4Esyp
         3VqQQU8cNKeaequMlZww5YG5rwkv6Kp0BYcU31blZatf+DkpMZevOObgqlqJ3+i+k/S4
         00+zEvCUJLbdua3PFAsYCPxlV0M+VeNhr4SUg58g2JbWXP79yklsv1SDIQfSfbI6lCJo
         QFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738890793; x=1739495593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mD8MU9ia7DeQdTywSD1JdEVbwh8ZTx//S8otRz+v9E0=;
        b=xVPXz+EiSSqwElhaYwcarWqIfGiX2cP3viYbbUQZJwpUHti9m+0VUla8LE+ZOsvBLL
         PE6pdfNmF9zDhnuYfXRuFyU0xc4sJnvhcWOaiO6o5WS/vlBgVpF+fjpFcihi83CZKP1v
         2DodYWToD0bVwKW7h19eqD+rnU6wLpNpVurBy0h+rD5EdSk9ofBpjo0lgK+o2lp1ijVS
         wqxspLq8hnuV00I3YN9yNO0Hg4+9XeW1VIzLBh1iGsusZpGZAy9BohdsmVJjoetQImAy
         mAB4F2+M6QNIvHD5fERilPNUcJphgActrUm6wBg3+HkOsxUXQM5CYGyiOT6dcCn6oQeJ
         zDlw==
X-Forwarded-Encrypted: i=1; AJvYcCWbmQiwLRlZpYCxx6H/t3bwhrxprEPy64dlTKw1Cx34zknlIhOxvcDI5nojb/B0zwSYU8G7FxNuMVLTJz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7kEon/3nwZlOsI5vWj71SeOMeKzlCsX92sDB9875fV9g9VNMY
	08kiOESNCC+5MXNo9SE/tHcaK7611XdpGOMMHPcTrZmglCbBxwWPaeX8x+bzIGc=
X-Gm-Gg: ASbGncv9Z1tLdLJBwO+x5SFXPNWxAxKjEII+VnLDyGMyej2ohM+AW+Q5St0S5ZJLuNS
	8KU4rUdsfr3RRltytPzRBltZ2qV64U/oiVJvhhnRddGTP+mE5fopBYuZ0dheWbZ21qJKCpq8Y7i
	5F8Hm0pVk637p8IL0UTrGJe+x5B21gT/eTHCTksdf1CmcGafb5p99NVBx37UeVyXdM1MJPaRjcQ
	bixbrqsRTbH6P6iCB/aafSux9rkrblhFzFyMLr+alfEjaxaUQQ4k5oG3Ad/9b2930P/qek3VWlE
	ZLkPgrXLrsleoz7kmkqQNVXRNZTuXSI/ab61KG4Zw6dpI9NO6j9eNXBup7sHTjiHJQpFr0s=
X-Google-Smtp-Source: AGHT+IHYSIRsZahPUyPRN1+iXP2PIJf6L3Nw7RCM9yJa976O/YLBqbJ7cTIOY78DUwa2dGHV/JS28Q==
X-Received: by 2002:a05:6512:a8f:b0:544:12df:8726 with SMTP id 2adb3069b0e04-54414ab6a8bmr261997e87.22.1738890793184;
        Thu, 06 Feb 2025 17:13:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105e5bc8sm284054e87.166.2025.02.06.17.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 17:13:11 -0800 (PST)
Date: Fri, 7 Feb 2025 03:13:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 02/14] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <e3lws3vo5x5folczeb2ygscgrnv5jejuaayjzon47ir6kpbhnn@pglvman2jugg>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
 <20250128-concurrent-wb-v5-2-6464ca5360df@quicinc.com>
 <34zk3jbcjlbux7737t2ve3xcwbt2uxsalbqih6os4ykqeklyfa@phy4izanhn3d>
 <16986655-0c51-49ac-8088-6548317be7e6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16986655-0c51-49ac-8088-6548317be7e6@quicinc.com>

On Thu, Feb 06, 2025 at 03:49:53PM -0800, Jessica Zhang wrote:
> 
> 
> On 1/29/2025 2:04 PM, Dmitry Baryshkov wrote:
> > On Tue, Jan 28, 2025 at 07:20:34PM -0800, Jessica Zhang wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > 
> > > All resource allocation is centered around the LMs. Then other blocks
> > > (except DSCs) are allocated basing on the LMs that was selected, and LM
> > > powers up the CRTC rather than the encoder.
> > > 
> > > Moreover if at some point the driver supports encoder cloning,
> > > allocating resources from the encoder will be incorrect, as all clones
> > > will have different encoder IDs, while LMs are to be shared by these
> > > encoders.
> > > 
> > > In addition, move mode_changed() to dpu_crtc as encoder no longer has
> > > access to topology information
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > 
> > > ---
> > > Changes in v5:
> > > - Reordered to prevent breaking CI and upon partial applciation
> > > - Moved mode_changed() from dpu_encoder to dpu_crtc
> > > - Dropped dpu_encoder_needs_dsc_merge() refactor to clean up commit
> > > - In dpu_encoder_update_topology(), grab DSC config using dpu_encoder
> > >    helper as dpu_encoder->dsc hasn't been set yet
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  79 +++++++++++++
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   2 +
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 174 +++++++++-------------------
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  11 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  19 +--
> > >   5 files changed, 144 insertions(+), 141 deletions(-)
> > > 
> > 
> > > -/**
> > > - * dpu_encoder_virt_check_mode_changed: check if full modeset is required
> > > - * @drm_enc:    Pointer to drm encoder structure
> > > - * @crtc_state:	Corresponding CRTC state to be checked
> > > - * @conn_state: Corresponding Connector's state to be checked
> > > - *
> > > - * Check if the changes in the object properties demand full mode set.
> > > - */
> > > -int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> > > -					struct drm_crtc_state *crtc_state,
> > > -					struct drm_connector_state *conn_state)
> > > +bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
> > >   {
> > > +	struct drm_connector *connector;
> > > +	struct drm_connector_state *conn_state;
> > > +	struct drm_framebuffer *fb;
> > >   	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > -	struct msm_display_topology topology;
> > > -
> > > -	DPU_DEBUG_ENC(dpu_enc, "\n");
> > > -
> > > -	/* Using mode instead of adjusted_mode as it wasn't computed yet */
> > > -	topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode, crtc_state, conn_state);
> > > -
> > > -	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> > > -		crtc_state->mode_changed = true;
> > > -	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> > > -		crtc_state->mode_changed = true;
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -static int dpu_encoder_virt_atomic_check(
> > > -		struct drm_encoder *drm_enc,
> > > -		struct drm_crtc_state *crtc_state,
> > > -		struct drm_connector_state *conn_state)
> > > -{
> > > -	struct dpu_encoder_virt *dpu_enc;
> > > -	struct msm_drm_private *priv;
> > > -	struct dpu_kms *dpu_kms;
> > > -	struct drm_display_mode *adj_mode;
> > > -	struct msm_display_topology topology;
> > > -	struct dpu_global_state *global_state;
> > > -	int ret = 0;
> > > -
> > > -	if (!drm_enc || !crtc_state || !conn_state) {
> > > -		DPU_ERROR("invalid arg(s), drm_enc %d, crtc/conn state %d/%d\n",
> > > -				drm_enc != NULL, crtc_state != NULL, conn_state != NULL);
> > > -		return -EINVAL;
> > > -	}
> > > -
> > > -	dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > -	DPU_DEBUG_ENC(dpu_enc, "\n");
> > > -
> > > -	priv = drm_enc->dev->dev_private;
> > > -	dpu_kms = to_dpu_kms(priv->kms);
> > > -	adj_mode = &crtc_state->adjusted_mode;
> > > -	global_state = dpu_kms_get_global_state(crtc_state->state);
> > > -	if (IS_ERR(global_state))
> > > -		return PTR_ERR(global_state);
> > > -	trace_dpu_enc_atomic_check(DRMID(drm_enc));
> > > +	if (!drm_enc || !state)
> > > +		return false;
> > > -	topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
> > > +	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
> > > +	if (!connector)
> > > +		return false;
> > > -	/*
> > > -	 * Release and Allocate resources on every modeset
> > > -	 */
> > > -	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> > > -		dpu_rm_release(global_state, drm_enc);
> > > +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> > > -		if (crtc_state->enable)
> > > -			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> > > -					drm_enc, crtc_state, &topology);
> > > +	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> > > +		fb = conn_state->writeback_job->fb;
> > > +		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb))) {
> > > +			if (!dpu_enc->cur_master->hw_cdm)
> > > +				return true;
> > > +		} else {
> > > +			if (dpu_enc->cur_master->hw_cdm)
> > > +				return true;
> > > +		}
> > 
> > Nit: this is duplicating a part of the dpu_encoder_update_topology(). It
> > would be nice to have a comment here. If there is no need for a new
> > versoion, I can probably write something when applying.
> 
> Sure, I can add a note that we need to duplicate these checks in
> *_needs_modeset() since topology info is not stored in the encoder or crtc

Yes, please. I was thinking about having a helper function, but I don't
think that it makes real sense.


-- 
With best wishes
Dmitry
