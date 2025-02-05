Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC711862A
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 02:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738723710; cv=none; b=DpuMSoBdpemLBsF6295c6m7wN73nOku3mr6nvJ4GXfdhZ/ShzFu3TdUfCAjzb5JOuUfw3R0kjk3fnDnuU+uR7brYZGprRYVDNhoNkjDz+khoDqcM4eIDG/yUDVu4zbU/SWAmLdILumnhANAyFbX+k1nglc7LVgT/hIXRPbANgSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738723710; c=relaxed/simple;
	bh=aYgKDjNlX9q6f8ZmsWkeB4BouMEqZMt0P/CFNY0+KmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3q/CVussUAVl2A7i/M3eDAv/NifNBTDZ1C8qwLkx5g2NO+VL9rehzq/UZ2Z5RuEeB6DD9ucRopjDxWdwW/NZPTbykhuecbBwiVFBh3oFN2EAWrI7PnCFP6pyIyvOFu9a+jCZLHhPtfTWlKKkOmbKDzBMzAejtLmL2v/V3FW05o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aDIA6Q1h; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aDIA6Q1h"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-307c13298eeso4294341fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 18:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738723706; x=1739328506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KORfQaUKPciCl0b2CXyUX6rgFXA9enZCrhKR40wbesU=;
        b=aDIA6Q1hpo0GghlzEWi5U/ipa4T81Aj8INlz76Ku2/lQv2FcNCH6qC9islwYH91+6N
         5BMvutFUgwrHmdIr3vIAhkzZudnH8m7ywHCn7fwluHaDOAFBYlUl3pf8LQxsKCYP6SKr
         nNaa9WXfkysRX+3lGQPzqATi85zAMzl7LGZshOvoxeumsiBaFQrduchROwe45DQfyQpE
         6/Jk2GdX0YNZ+i0g5XIPhF9q9BMpH3z2ARRhvBAgY6I1M6oncghXzuLVkDHM7uL6IqN5
         s+mqj3Hwnu5L5buk0hIWQuWoyQ48+j+P4VZ2xxF+WQAU3GvwNVO6c1ViMuAheWBV9/xk
         5rMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738723706; x=1739328506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KORfQaUKPciCl0b2CXyUX6rgFXA9enZCrhKR40wbesU=;
        b=w20zSTd3nD/B4JGrLmynC7AwPVe/NXpajaH1QhPZzkfiTKvjMvinYnWRqcZH001QQu
         Mtosju2Now3xlZr3CUFiRA3BvmSyBD3L2aLGFFtpMfiq6dFPv10br9pE0rklKd1YdQaK
         nglHwVcjkYHoNdJOy0HN0dYlJh1cKV4s7zJhRAXSM9ZzrUQTY+me3udZgmQ8qIy0Q0kf
         9T0r/HCmeUP97crZvijNUBm5zOr/OtZVMbl5TXtr5A9vnipMDViC2DPVxVYBnDIdA17L
         3i3nx+uDWxRaecQFX+paUTVqlPHkMrGaKJEPoJ0tq+Uq8i/ZbcrG1Ig1iXTZDeqNo5Ij
         A7zA==
X-Forwarded-Encrypted: i=1; AJvYcCWSGjw26bI1XXAjEtQJRkFXGDFNXKVd01Dh7uqJPazw0HpBetE8dUAOJlz8BqtiJ8so3sNf+3TyjVXe6DE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq4hLn7yJIeYY0fGpNg6LRsGstjxadx+yLWiH7dVsCvh15hN3H
	P/WhnJ4qgpMhzBNmEM1jKotlVgZ3okUrFbg9pv2M4GkqjwqPvWD4V0BRBmkTNoc=
X-Gm-Gg: ASbGncvZ3LxG2d/QEbaUm4aWWeEHYpaTeP/C82CGdkChLTXYdFRzuPlyeeMrUMZDYmX
	0Pkgn7wFeElDi6pU/UWiQPyC+ApWeSR67Q2nJISyr8hjePJENyhw1GhOmU+8NKj8EZNrUFexjG4
	NQCEmZUpJ6Ieplt7OeeIOtnw2P+cqyZbF5R9M1hHTfcjaIj8zsWJqm9yqsS29TE9Es4t4YS8R6q
	fRG7qMJ/CO1248Pr0N6cfMET0JBEiVz1zLbYU9M9SD0DkMVbiDMBvhM4EkQPPJ/ueCMiUVZ19Qx
	L+ny1kcHAlT3PC+XcD+slmYyZwCMCRZQEnx7ITJNnppDbi171Y9Ig+I07Zxxn5GTcbJHHqg=
X-Google-Smtp-Source: AGHT+IH3/CvFzgTmuPgQIn8DGNcSY6VUA2bSSz/5MVHPj8kIo9Cj7Fku3ScseiRzS700dvIRYZlcxg==
X-Received: by 2002:a2e:8098:0:b0:300:31dc:8a4a with SMTP id 38308e7fff4ca-307c695989fmr18686511fa.18.1738723706339;
        Tue, 04 Feb 2025 18:48:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a309faddsm19302181fa.61.2025.02.04.18.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 18:48:25 -0800 (PST)
Date: Wed, 5 Feb 2025 04:48:23 +0200
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
Subject: Re: [PATCH v5 07/14] drm/msm/dpu: Reserve resources for CWB
Message-ID: <f4jlvjkwrw37v4dkelvispo2nnl7hkkxczjb3rk47sjpss6bnc@nsdk7qo3c7lg>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
 <20250128-concurrent-wb-v5-7-6464ca5360df@quicinc.com>
 <2cc6pp6okhanqv5ndzm32aomgbhidgmvukc4lptrapgpl4utp4@gornklf5hhzp>
 <a69b7265-7a11-4dcb-b642-8a589770af6e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a69b7265-7a11-4dcb-b642-8a589770af6e@quicinc.com>

On Tue, Feb 04, 2025 at 01:29:23PM -0800, Jessica Zhang wrote:
> 
> 
> On 1/29/2025 2:11 PM, Dmitry Baryshkov wrote:
> > On Tue, Jan 28, 2025 at 07:20:39PM -0800, Jessica Zhang wrote:
> > > Add support for RM to reserve dedicated CWB PINGPONGs and CWB muxes
> > > 
> > > For concurrent writeback, even-indexed CWB muxes must be assigned to
> > > even-indexed LMs and odd-indexed CWB muxes for odd-indexed LMs. The same
> > > even/odd rule applies for dedicated CWB PINGPONGs.
> > > 
> > > Track the CWB muxes in the global state and add a CWB-specific helper to
> > > reserve the correct CWB muxes and dedicated PINGPONGs following the
> > > even/odd rule.
> > > 
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > 
> > > ---
> > > Changes in v5:
> > > - Allocate CWB muxes first then allocate PINGPONG block based on CWB mux
> > >    index
> > > - Corrected comment doc on odd/even rule
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 34 ++++++++++--
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 82 +++++++++++++++++++++++++++++
> > >   4 files changed, 115 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 99db194f5d095e83ac72f2830814e649a25918ef..17bd9762f56a392e8e9e8d7c897dcb6e06bccbb3 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -2,7 +2,7 @@
> > >   /*
> > >    * Copyright (C) 2013 Red Hat
> > >    * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
> > > - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > > + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > >    *
> > >    * Author: Rob Clark <robdclark@gmail.com>
> > >    */
> > > @@ -28,6 +28,7 @@
> > >   #include "dpu_hw_dsc.h"
> > >   #include "dpu_hw_merge3d.h"
> > >   #include "dpu_hw_cdm.h"
> > > +#include "dpu_hw_cwb.h"
> > >   #include "dpu_formats.h"
> > >   #include "dpu_encoder_phys.h"
> > >   #include "dpu_crtc.h"
> > > @@ -133,6 +134,9 @@ enum dpu_enc_rc_states {
> > >    * @cur_slave:		As above but for the slave encoder.
> > >    * @hw_pp:		Handle to the pingpong blocks used for the display. No.
> > >    *			pingpong blocks can be different than num_phys_encs.
> > > + * @hw_cwb:		Handle to the CWB muxes used for concurrent writeback
> > > + *			display. Number of CWB muxes can be different than
> > > + *			num_phys_encs.
> > >    * @hw_dsc:		Handle to the DSC blocks used for the display.
> > >    * @dsc_mask:		Bitmask of used DSC blocks.
> > >    * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
> > > @@ -177,6 +181,7 @@ struct dpu_encoder_virt {
> > >   	struct dpu_encoder_phys *cur_master;
> > >   	struct dpu_encoder_phys *cur_slave;
> > >   	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> > > +	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
> > >   	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> > >   	unsigned int dsc_mask;
> > > @@ -1137,7 +1142,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > >   	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> > >   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > >   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> > > +	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
> > >   	int num_ctl, num_pp, num_dsc;
> > > +	int num_cwb = 0;
> > > +	bool is_cwb_encoder;
> > >   	unsigned int dsc_mask = 0;
> > >   	int i;
> > > @@ -1151,6 +1159,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > >   	priv = drm_enc->dev->dev_private;
> > >   	dpu_kms = to_dpu_kms(priv->kms);
> > > +	is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
> > > +			dpu_enc->disp_info.intf_type == INTF_WB;
> > >   	global_state = dpu_kms_get_existing_global_state(dpu_kms);
> > >   	if (IS_ERR_OR_NULL(global_state)) {
> > > @@ -1161,9 +1171,25 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > >   	trace_dpu_enc_mode_set(DRMID(drm_enc));
> > >   	/* Query resource that have been reserved in atomic check step. */
> > > -	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > -		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> > > -		ARRAY_SIZE(hw_pp));
> > > +	if (is_cwb_encoder) {
> > > +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > +						       drm_enc->crtc,
> > > +						       DPU_HW_BLK_DCWB_PINGPONG,
> > > +						       hw_pp, ARRAY_SIZE(hw_pp));
> > > +		num_cwb = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > +						       drm_enc->crtc,
> > > +						       DPU_HW_BLK_CWB,
> > > +						       hw_cwb, ARRAY_SIZE(hw_cwb));
> > > +	} else {
> > > +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > +						       drm_enc->crtc,
> > > +						       DPU_HW_BLK_PINGPONG, hw_pp,
> > > +						       ARRAY_SIZE(hw_pp));
> > > +	}
> > > +
> > > +	for (i = 0; i < num_cwb; i++)
> > > +		dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
> > > +
> > >   	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > >   		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > index ba7bb05efe9b8cac01a908e53121117e130f91ec..8d820cd1b5545d247515763039b341184e814e32 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > @@ -77,12 +77,14 @@ enum dpu_hw_blk_type {
> > >   	DPU_HW_BLK_LM,
> > >   	DPU_HW_BLK_CTL,
> > >   	DPU_HW_BLK_PINGPONG,
> > > +	DPU_HW_BLK_DCWB_PINGPONG,
> > >   	DPU_HW_BLK_INTF,
> > >   	DPU_HW_BLK_WB,
> > >   	DPU_HW_BLK_DSPP,
> > >   	DPU_HW_BLK_MERGE_3D,
> > >   	DPU_HW_BLK_DSC,
> > >   	DPU_HW_BLK_CDM,
> > > +	DPU_HW_BLK_CWB,
> > >   	DPU_HW_BLK_MAX,
> > >   };
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > index 54ef6cfa2485a8a3886bd26b7ec3692d037dc35e..a57ec2ec106083e8f93578e4307e8b13ae549c08 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > @@ -132,6 +132,7 @@ struct dpu_global_state {
> > >   	uint32_t cdm_to_crtc_id;
> > >   	uint32_t sspp_to_crtc_id[SSPP_MAX - SSPP_NONE];
> > > +	uint32_t cwb_to_crtc_id[CWB_MAX - CWB_0];
> > >   };
> > >   struct dpu_global_state
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > index dca3107d1e8265a864ac62d6b845d6cb966965ed..2d5cf97a75913d51b2568ce85ec0c79a4a34deb4 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > @@ -233,6 +233,54 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
> > >   	return -EINVAL;
> > >   }
> > > +static int _dpu_rm_reserve_cwb_mux_and_pingpongs(struct dpu_rm *rm,
> > > +						 struct dpu_global_state *global_state,
> > > +						 uint32_t crtc_id,
> > > +						 struct msm_display_topology *topology)
> > > +{
> > > +	int num_cwb_mux = topology->num_lm, cwb_mux_count = 0;
> > > +	int cwb_pp_start_idx = PINGPONG_CWB_0 - PINGPONG_0;
> > > +	int cwb_pp_idx[MAX_BLOCKS];
> > > +	int cwb_mux_idx[MAX_BLOCKS];
> > > +
> > > +	/*
> > > +	 * Reserve additional dedicated CWB PINGPONG blocks and muxes for each
> > > +	 * mixer
> > > +	 *
> > > +	 * TODO: add support reserving resources for platforms with no
> > > +	 *       PINGPONG_CWB
> > > +	 */
> > > +	for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
> > > +	     cwb_mux_count < num_cwb_mux; i++) {
> > > +		for (int j = 0; j < ARRAY_SIZE(rm->cwb_blks); j++) {
> > > +			/*
> > > +			 * Odd LMs must be assigned to odd CWB muxes and even
> > > +			 * LMs with even CWB muxes
> > > +			 */
> > > +			if (reserved_by_other(global_state->cwb_to_crtc_id, j, crtc_id) ||
> > > +			    i % 2 != j % 2)
> > 
> > Should't it be a loop over allocated LMs with the check that
> > lm[i]->idx % 2 != j % 2 ?
> > Otherwise you are looping over some random LMs and trying to match CWB
> > indices against them.
> 
> Hi Dmitry,
> 
> The RM array idx are based of the hw block ids [1] so there isn't much
> difference using i and lm[i]->id.

Ack. Please add a comment (as I think there will be another revision).

> 
> Thanks,
> 
> Jessica Zhang
> 
> [1] https://elixir.bootlin.com/linux/v6.13.1/source/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c#L74
> 

-- 
With best wishes
Dmitry
