Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF3227450
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 00:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738889881; cv=none; b=RZgk3Kv3TN9quQZxNx5+Dy41gCC8IrHlw8VxqSM3DSLyt7PBXHsQBerleJ4UzU5nTvYvo2l+iOEt+g6KGALE6WbK7Rgpu111pUDN5nRxp1iIPtX6cLfsCPcyc5IkZrjdNnebHnARAGZHGF4+OmOFM4pzn8dvj6wYdPHefbibpeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738889881; c=relaxed/simple;
	bh=DyRPOhqc4W2rMI3vNL/F2NkcghrCHGEoKNEPy44TDh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wl/REjCXWLUFWq6Le9MPX0egl2ypMFVR4BU4XgsNmnQn8FiL6m45nCTn3BdcbmeW6KM5tEOCZJ4oiiAF0YC/5S1S4rg3xtTFwqcmn2ORmtmuqgAYC3rcm7yB1VxrF21gHpZnvFtt3hyRApnXaxEZW55GPDkD2FcLC3AoQ4f51m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mTCiW6xh; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mTCiW6xh"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5426fcb3c69so1396686e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 16:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738889877; x=1739494677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ug1cHKYkHOI5SE4G5i310J6mOL4B8HpmJ/dr1AHs9PU=;
        b=mTCiW6xhCcD4HDlI019EajX1wDPzZuiFOLYxUj9PmWSqN2Bp3fuQZibpM6qbQ9m0u0
         k8/KZgCRgriw7m6+c67Xk1DpkpVW51dX2msULfaRbohvBZm+BTDL+skvdUONAxmTdO2V
         pO2kpHF7eYMFHpxnBG+IczW9WgiLbf1ZhoyPf29nVItZHWF6gTxgiwkvGcL9t5GnE0h0
         yUPUUqKSWz9tZJA7ukfJf1KKaawLN+FP02XMOz6nkiD/pbORxLt8LhIjbySfO3c33vOY
         0MnSkZNPGrjLzALMmZKUXEIJiijZ/MtlA8LX7jXVzfemK8vdl29EjvJrfhjBa/3XGPSk
         wUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738889877; x=1739494677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ug1cHKYkHOI5SE4G5i310J6mOL4B8HpmJ/dr1AHs9PU=;
        b=LZnbEtWk2B72zBzLBLyyQflyeVyHLq9nZMV9zaB2CCqTOMTJ6aqy30H850KMrHmBQm
         tL64sGAb+TgS45Y6F7GV14ZUCev2Kb8VRMP85bB5UVACBA/SZ70xm+wl+AB+jcubSXFz
         y/2EosRU1uBjM/14p3TwnWjpcuLUt4hlzU3CBogbK2eKED4Lklekbue1ig73IdAX6vU3
         FJ3n9/RyZPO1vSB92vfV+oumopDTUiDSZ/HROGcIzcsr7ccQ64Ukm/z0DN+XRfI6fopg
         dgRHluL/YC0Kq0XY5XXYGwwDKoG4h9+fVlIfgrvrh6Y1pN+0AkTFk0tjcaD7jPSsnF8Z
         saQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQHffILYMDjeqD7qEtpxY/5rCQGXvs1znVgcvuDSbXI4+xCeLZM3BDeI0e9clbdrIAMgrexHWEXKjkIKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwraPnXTNH4BUkKWojM3SCqVcRCTHVMFw/K4sru+4rrT3eIQ7vb
	bTje+zqvz2K90NOyTaWC7Spm+c0yCjXxXiQjYtdVB5+4/thJxm79oPyjuGkYmpA=
X-Gm-Gg: ASbGnctCgIfIBzfCiJsM5TOS/dedLPS7ird2lafeBn7D4Kg78nrIkXKqLtGGcaAP2x9
	IROUw17EVaGdBDLTLnilbRNXkQCHFv/M+vloc8NoqiO2WQaEamTBtWO4oB5JPorzaTtQDpk7Pd3
	ur5cZQGqOMBbHhFZWmyPblAWF3FpMKMmif5Er2VI5hjrT+SJZJt/wW1PRdwPdmAqg0X0nmz8etO
	y1sordqxZMdJdX/Svumt+f5G9cVQOLgDDlEhgIAmaQqkWy75Cg6eydI1B+bbM+D0L/jfA0yooKh
	MeTBNzhYd3I4GvfmstxEBehffxFfK69fJp4V8biLTp77LAbpWligGQTMrkorh1BkmrfX73w=
X-Google-Smtp-Source: AGHT+IGx2wRNt1b93pnywaXmYh85b7plMQz/H56Gv8K9JriphvzOJ7iTLmi1YOxkbvURlnH6S1mo4g==
X-Received: by 2002:a05:6512:b8a:b0:540:1e7e:ca80 with SMTP id 2adb3069b0e04-54414aa87f8mr253956e87.30.1738889877278;
        Thu, 06 Feb 2025 16:57:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54410555751sm279982e87.85.2025.02.06.16.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 16:57:56 -0800 (PST)
Date: Fri, 7 Feb 2025 02:57:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Stephen Boyd <swboyd@chromium.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: account for widebus and yuv420 during
 mode validation
Message-ID: <yjpb5byscw7tfy2zz676j42uwavnn6rjszn7sag6mqietq3i3a@fdynfqqolvwe>
References: <20250206-dp-widebus-fix-v2-1-cb89a0313286@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-dp-widebus-fix-v2-1-cb89a0313286@quicinc.com>

On Thu, Feb 06, 2025 at 11:46:36AM -0800, Abhinav Kumar wrote:
> Widebus allows the DP controller to operate in 2 pixel per clock mode.
> The mode validation logic validates the mode->clock against the max
> DP pixel clock. However the max DP pixel clock limit assumes widebus
> is already enabled. Adjust the mode validation logic to only compare
> the adjusted pixel clock which accounts for widebus against the max DP
> pixel clock. Also fix the mode validation logic for YUV420 modes as in
> that case as well, only half the pixel clock is needed.
> 
> Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
> Fixes: 6db6e5606576 ("drm/msm/dp: change clock related programming for YUV420 over DP")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Changes in v2:
> - move msm_dp_wide_bus_available() to the next line
> - Link to v1: https://lore.kernel.org/r/20250128-dp-widebus-fix-v1-1-b66d2265596b@quicinc.com
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  5 ++++-
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
