Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D348420318
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 01:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738201411; cv=none; b=PWd6jPTWIQBLZ3ThMeYdFeHoocgp8SFc0B9j9qOmAAyCQHaCyFr7EXrI8Vj5HNsSdaTo/6URitaN5A3Bwo0VrDbaiYKuxLYy1qGsjnBSQ6yK75pM297X0rYSHJygnveR5v1EynGTudawDegrAN4a76fRDGRi7egeVzeGO59yTMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738201411; c=relaxed/simple;
	bh=NgYLCbpjcconoofr30077ok8R8hpV6JqPmIvLcsWVe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKGmsu30TWjQPAlGFXmr09lMJLCNJg7omGk3Zv5RwWUh3mRmBnIhH29NPMBOik+o+FXVBYTR1sRLr8ZG+A43cqXwzQcQQD9k7rG9JHJzASUWiTPYrg6nOAbAK+pZt0MAgAVW6U6AJsMJcXtaSXeZKA5jPPk1YmAonffdU8c/heQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d7ghoGNb; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d7ghoGNb"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a6bso2289421fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 17:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738201408; x=1738806208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gnzIb+9wXFz5+lazKFHTW6EVZCQW0TtbqaQtm0YVUI8=;
        b=d7ghoGNbPscZDOoHeO8CR8b10YcBPUW+cU9HrAlYjYN1UXQPHva4kYw4+mB3kHRHhJ
         siiEBiiyQtCQBjo7CewrkB+BFo6p7wXJrZbZ9Tg0TXjknlb3f0VvH24+7ZZED4UmkC2G
         JIV0u6MRxcFfvAcvQSo80CkOMXTqeFVfaEHoUZwkcHdxJnnn1kIW4CyMbgRjhIznV1uI
         fRCcPjRof31V48qDDWBpuz2gbbVRAQ2kHVDM48RFXW5CnhOEaIwKjGTO3lCcTPBylgGD
         NPd185OzREK7JywMKglhAX6Rxf1V6Y6YXzu+zJP6HHjERE8REfzP4wVLSL75K/7UYZWN
         ifKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738201408; x=1738806208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnzIb+9wXFz5+lazKFHTW6EVZCQW0TtbqaQtm0YVUI8=;
        b=bgvk+uAu546sAfcLvNAGIFq/JnREcs29KwqdgaNHdgNLXbpdB717Fgu7wBrPWnYzp7
         pxh4lbQHt+Y+aXKmgE3yHcHemuEnP+Fg/agLhoPj5LEEJ8i+uapnob2uSVMdi3bv9zgU
         oxLcjVw3mt0PA+Pemb5+WH3dqFV2AC2NmmWc3NafK7rA4RiT5uTUO+hjoMt6xyyxaHpy
         lwpvtp40GdbuutT1UtKpWyIWu00IadirAXKHR1CCbs6n7WFH6JpuJxPXtqPD9Jczufv9
         zkonzP1kpwawizjfMiE9paNWvNsstKhlXx1E4od/mo+/qKI1fLeKEh9xR+IZ07zvZ5ke
         I16Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGRghmGLsOPO9wEeKjmK8r9h1UtIO1fNWCOLEN0fOCPozcxEjQlHExmhbGQJ2GT3vvK+F4kBn1XzcUYOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG+XA2moSkS6/RNze/Awr4yj1j9VzrrFaIoSE+6YMtmKQwh/fJ
	yaS/JCYd0DWBdH9KP+N2UE1mdcv+Wq2ahCBfFaNLaqqWZ0TpTZQ70v304c/dfHE=
X-Gm-Gg: ASbGnctZgc2Hx+BgM1Ly0n7Q2W1aqK66maEr5uJN/g04JWwxKwbtr9vU/G0ieL+MH0n
	ZdV5hoifpVUQ4BHluqA8ZeQG8eHC5aike/LXeXvXryYf2hngZJp42BLI6N8yv/Bp+cuXa7X4irz
	C5dChnRnUzUOzKz6kmih+uEKbHqAJMi7AbwGFP2u3GxhDQwWc6u7E1YJrMxBajKJhltHKBDiAK1
	w6Fyi6kKoO0x+cW3M/Z6qnu7unGqfYHoNXV2ZpdnBmtX1xYmCmxfshopppCiZEhwp2Q+t2tX/Ph
	iCzl9tkJSiWxhTiqA7U0DytntCDHlbo4YRlIaHNQNIT+z1HrEWoY7Hb9dE5hOPdV0zTtHkE=
X-Google-Smtp-Source: AGHT+IFQ4ROSqBoLumU6cps0fxCphR6LyRS4J9t+UuOgpON6XgpcsFKDCCwkSmmwVIIpI0Ne/byzGA==
X-Received: by 2002:a05:651c:2126:b0:302:1b18:2bfe with SMTP id 38308e7fff4ca-3079694dfbdmr24041561fa.25.1738201407782;
        Wed, 29 Jan 2025 17:43:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a33f7cbcsm521981fa.87.2025.01.29.17.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 17:43:26 -0800 (PST)
Date: Thu, 30 Jan 2025 03:43:24 +0200
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
Subject: Re: [PATCH v5 03/14] drm/msm/dpu: switch RM to use crtc_id rather
 than enc_id for allocation
Message-ID: <jr7zbj5w7iq4apg3gofuvcwf4r2swzqjk7sshwcdjll4mn6ctt@l2n3qfpujg3q>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
 <20250128-concurrent-wb-v5-3-6464ca5360df@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-concurrent-wb-v5-3-6464ca5360df@quicinc.com>

On Tue, Jan 28, 2025 at 07:20:35PM -0800, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Up to now the driver has been using encoder to allocate hardware
> resources. Switch it to use CRTC id in preparation for the next step.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v5:
> - Reordered to prevent breaking CI and upon partial application
> 
> Changes in v4 (due to rebase):
> - moved *_get_assigned_resources() changes for DSPP and LM from
>   encoder *_virt_atomic_mode_set() to *_assign_crtc_resources()
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  20 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  10 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 189 ++++++++++++++--------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   7 +-
>  5 files changed, 113 insertions(+), 125 deletions(-)

This patch seems to make kms_color@ctm-max and
kms_writeback@writeback-check-output fail on sc7180-trogdor-kingoftown
(limozeen didn't start job execution for this commit at this moment).

- https://gitlab.freedesktop.org/drm/msm/-/jobs/70213449
- https://gitlab.freedesktop.org/drm/msm/-/jobs/70213446

I've restarted the jobs, but it would be nice to understand the cause.

-- 
With best wishes
Dmitry
