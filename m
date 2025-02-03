Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F29C2080EE
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592953; cv=none; b=t382CQPsjUslsz6e245W+DGAr7oP56hzFVL454T9kJ1/79CdfOU6zqrwRRHBUE/22cj+XvAAydzUPm5JsKZr8nGUER7RMBThVvv58GbxEGLnVDmjJvgm7ORzmMfbY+iaWvdXR26d4PNJJqklKrB9Jp8ErhP5ArJCYpZGa1C95R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592953; c=relaxed/simple;
	bh=W7TLVKGhRzk72b+VXRrbUL7rlchfPzWhRxSP4pRZTtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfVtJ2Igupet9O6xwE36+2aZIzDvBnCKJqgVSfOcNbDtULqg9+JnBnqja4DMYko7/P+2v973MzO1kZQYtZSXGJFCWT0Ht/F0l2GN3KgjIJC26mVi+exwqb7ReVx0wKQq7JLGZiUnseYN0JheOqMqG11D+XmteEXNC/bzK087vck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t2ffLdq4; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t2ffLdq4"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5439b0dd4bfso3963496e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 06:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738592949; x=1739197749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fe4Q/DRIIrkW1EpeCwCgG29YyiSxj0a6BvsfU0z5Psc=;
        b=t2ffLdq4znFXB0n3jUAnYx8Hex0NxRK0siVZg/pnw8ONFXvENhSYCwEuzmGPUV6Z4t
         VTOkrUpvIqDczvwLEoBXNa0jwMWvigPbBtkbSEA1aVtSBAoFAnseVagRvQQcgLi02qtS
         WepVqymkF9cywoZoebG6ErZP+ZfyalZzBXwkdWaGl03Uig5Hz7Gzt2I9mVbCkfhoxiv9
         nXTUjbhhVa6EPgzJ7Cn6YyHZyydUCjtEv0FKuv2ZnD9+0jXz984yy4jSXgVQ06N7/pz3
         SxDag5GzF9uC3M2sB5d6ZAhV7hW8EgpdfklBu6d+LkwMPy4PnH/e4op6mKLfQeUYjjGb
         ZtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738592949; x=1739197749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fe4Q/DRIIrkW1EpeCwCgG29YyiSxj0a6BvsfU0z5Psc=;
        b=WWIhnZHY5vZ4mjeS+wS6YKlOUD7JWn6UdTmKDeMBl1Idj2zjvQ+FSpemvdTtrkiDvW
         C347y+RHlzQmlZbHmqcJqz6ehUIkRiR6toDNXYV31iqRQ7Vjx8uz7lQfMkfjybic36uw
         WxQ+W5CH+UIz/67DmRSwgZHLW6Br0ACsO6YLH15QAfHvcOFgIpfCRz/YJPDVKRWRTATx
         WnAVZ5+7KrFyb+4zlmyH2htUGBPEJeyNII2fuEaIuSYXS10pbcf6MUHdirXy6nYh61uP
         i852TN0DOW4fkffN4oiyXtSZQ5nMVocVl6vjqsHYNiS/CQXgnqUGhB7bdte2pKJd2tyK
         1Pmw==
X-Forwarded-Encrypted: i=1; AJvYcCXCFvNPZf8IlnSUowoCFOmwlwcvuD4H3foDSRDzbnTSS7BB5UZrF6fOlml0MMhPtlpIHZWOX+k2kyQ/fiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJOJfptaMpBF1KMTIW909oQlQ2ReOkLktgMcC08HrMcp7y/R/R
	nhFExSuY6zv09fL71DIzkuDKNEn+Q/n+OCc9oa9zwNA2Dk0TLmGxeNYyNG9Q/y0=
X-Gm-Gg: ASbGncvJCxk31yAyroGUclPYo/9nkr9immqZDqsEFjpPMF/E3WLQ4uK+Rv+BfL902OK
	GzKhb1wiCItKaqlPOowupyc4X4X6qSdvugbWEzrxKx5Fb5aBhQgEwXTbuhmJjTbEqECx7bmTE9R
	wQ8VnF+Sem/8PqVxrSP/NTKvZbJv06Vihx7ylHZzssLX14ST/oMHeF6N8NfmduVtjFn1n1MiNQY
	YGhdrNXLHqHuZsUhS14a4kFp3Jo9Urd+V7qznOxDCSWUe30/yaBNlmwX8NaicHA1SxW8lk45OGB
	WdQ/Kc6JoCan1QY9esSH8W5P5LO39qUNyfIXA45y+ARYq/9kKFHifU8pmVIvPaaEPc6f7GE=
X-Google-Smtp-Source: AGHT+IExpISW4A9NBYLe/eUHhUm4OiraqJx3D/HFyEVGSsv6FQMJHoejQlBCGWRe4itczr/wgtNZJg==
X-Received: by 2002:a05:6512:1383:b0:542:2a0b:cdd4 with SMTP id 2adb3069b0e04-543e4c3fba5mr6465348e87.47.1738592948844;
        Mon, 03 Feb 2025 06:29:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb0666sm1297993e87.110.2025.02.03.06.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:29:08 -0800 (PST)
Date: Mon, 3 Feb 2025 16:29:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Johan Hovold <johan+linaro@kernel.org>, Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v5 0/4] drm/dp: Rework LTTPR transparent mode handling
 and add support to msm driver
Message-ID: <estdb6w4vmcd43jar5rzivjpo6hhmov52jv6tghjqm3xefd56t@spcodpfftmns>
References: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>

On Mon, Feb 03, 2025 at 12:57:55PM +0200, Abel Vesa wrote:
> Looking at both i915 and nouveau DP drivers, both are setting the first
> LTTPR (if found) in transparent mode first and then in non-transparent
> mode, just like the DP v2.0 specification mentions in section 3.6.6.1.
> 
> Being part of the standard, setting the LTTPR in a specific operation mode
> can be easily moved in the generic framework. So do that by adding a new
> helper.
> 
> Then, the msm DP driver is lacking any kind of support for LTTPR handling,
> so add it by reading the LTTPR caps for figuring out the number of LTTPRs
> found on plug detect and then do exactly what the i915 and nouveau drivers
> do with respect to toggling through operating modes, just like the
> up-mentioned section from DP spec describes.
> 
> At some point, link training per sub-segment will probably be needed, but
> for now, toggling the operating modes seems to be enough at least for the
> X Elite-based platforms that this patchset has been tested on.

As it seems that everybody is more or less happy with the patches,
should we pick the series into drm-misc-next now? Then i915 and msm
drivers can submerge a fresh-after-rc1 (or fresh-with-rc1?) trees into
the trees, reducing a risk of the conflicts during the next development
cycle?

> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v5:
> - Added kernel-doc () suffix and semicolon after "Return" for
>   drm_dp_lttpr_set_transparent_mode, and dropped the extra blank
>   line from kernel-doc of drm_dp_lttpr_init, like Bjorn suggested
> - Picked up Abhinav's R-b tag.
> - Moved the lttpr_caps on stack, as suggested by Bjorn and Abhinav in
>   the msm implementation.
> - Moved the msm_dp_display_lttpr_init call after msm_dp_panel_read_sink_caps,
>   as Abhinav suggested.
> - Link to v4: https://lore.kernel.org/r/20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org
> 
> Changes in v4:
> - Picked up Dmitry's and Johan's R-b tags for the drm generic and drm
>   msm patches.
> - Moved the comment about the roll-back to transparent mode inside the
>   if statement and fixed the typos, like Johan suggested.
> - Added more details in the commit message for the i915 changes. Details
>   about the update that the lttpr_common_caps need w.r.t. rollback to
>   transparent mode in case of failure.
> - Link to v3: https://lore.kernel.org/r/20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org
> 
> Changes in v3:
> - Picked-up T-b tag from Johan for the drm/dp transparent mode set helper
>   patch
> - Re-worked the return value of the drm/dp transparet mode set helper
> - Added some more details about what the values of the lttpr_count arg
>   is expected to be for the drm_dp_lttpr_init(), like Johan suggested.
> - Re-worked the non-transparent mode disable->enable so that the rollback
>   doesn't happen unless enable failed.
> - Picked-up Lyude's R-b tag for the nouveau patch.
> - Dropped extra parantesis at the end of the drm_dp_lttpr_init() call in
>   i915 patch.
> - Picked-up Johan's T-b tag for the drm/msm/dp patch.
> - Added some error handling and an error message in the
>   msm_dp_display_lttpr_init(), while dropping the unnecessary lttpr_count
>   local variable.
> - Link to v2: https://lore.kernel.org/r/20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org
> 
> Changes in v2:
> - Added new wrapper over the set_transparent new helper in order to
>   move the non-transparent disable and the its enable->disable sequence
>   mentioned in the DP standard section 3.6.6.1 entirely in the generic
>   implemetation.
> - Switch all 3 drivers to use the new wrapper.
> - Fixed the return value of the helper to return 0 on success and
>   negative value on error.
> - Added explanation about the transparent/non-transparent modes into the
>   msm dp commit message.
> - Dropped the condition for non-eDP in msm DP driver since it is allowed
>   to try to get the number of LTTPRs even on eDP and it will be always
>   0 anyway.
> - Dropped the RFC prefix
> - Link to v1: https://lore.kernel.org/r/20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org
> 
> ---
> Abel Vesa (4):
>       drm/dp: Add helper to set LTTPRs in transparent mode
>       drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
>       drm/i915/dp: Use the generic helper to control LTTPR transparent mode
>       drm/msm/dp: Add support for LTTPR handling
> 
>  drivers/gpu/drm/display/drm_dp_helper.c            | 61 ++++++++++++++++++++++
>  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 ++-------
>  drivers/gpu/drm/msm/dp/dp_display.c                | 15 ++++++
>  drivers/gpu/drm/nouveau/nouveau_dp.c               | 17 +-----
>  include/drm/display/drm_dp_helper.h                |  2 +
>  5 files changed, 85 insertions(+), 34 deletions(-)
> ---
> base-commit: 00f3246adeeacbda0bd0b303604e46eb59c32e6e
> change-id: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

-- 
With best wishes
Dmitry
