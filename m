Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB91257D
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739245334; cv=none; b=uHHJpYBUfV9I5X72oELC5YMcoeiUG5iyA2CvDj7ZL+OucWJCMH01ea0MuJ3X244oDGNnk4LUfRI3aYcTooujPUq35Ljgk6bnPkhfgMnZfbEiGUq/pVu07v1XrD99yKu+9AS/TuUZaiVFtqoulJQNPwmur6uqOQaI1lK+1Go2PGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739245334; c=relaxed/simple;
	bh=At3K5LoGd5Hsgsobr0KdSR29/r3gJ/ms6gfVxf6rgOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFXuWlAugx0I6z6jDQA/uvl8qO5xiT1Xd/C4mL3R4GfAJXgXjpm5GQAjyCcysqx6W1eOe6Oe4WbIVC8rJAx9W2DyEsijWhA7BHKwvH9V6d5C/EkRns6LeZAu+j5lt3hLZUZfSTK7C0meA1QweFeJu4tq9zML4mHCNVY2IAqAC/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zARZDcN3; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zARZDcN3"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54504bf07cdso3033142e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739245330; x=1739850130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3h3R+b42z3JbozwtWpuKCcLFhvPQJ2gwAjSjK5sbxtE=;
        b=zARZDcN35/qQlGgATBfQ/X137Zy2HvKI/7NaQJ7avDA0OOblyI2HTditdpjk98vREI
         AYmDNZOE1/YwjyAUXx/eiHLq12YKTq/CdueQq9N/dUT93LfMWYuBNx0+5wOq+4xBRMJZ
         rPA/aBohFxDobMOfcNndL4HrtV3OO84XVLQX9tueXFysB72/sfJXsAgfWsJ8Oc6KJR2F
         fnDReafleZO/DsWHf0DvbIkaiUp60irSEirFdKW2pNVfYZKZkCp7gX8ZyFBJwphGC1If
         yBT42JNZLqQZfTMUczybe2tCzXXaVhepARwl1cUV69IvMoJT8zt7dlWpmpxYSADloLhi
         zCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739245330; x=1739850130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3h3R+b42z3JbozwtWpuKCcLFhvPQJ2gwAjSjK5sbxtE=;
        b=ltHUkbnrk8ja62hEj77cCCNoSeFarRjLPRZkqvNxGo4Y5lDcXKp6+K+4uHCpunBxl2
         QMhT+LragmdopU6WaRoqC3x7qMQJ7jCXJWmx3yWpZz5v9zqvem3CMNm/eUwAvIFhlRG6
         zkxsPkGXfZubxWtiHJpBBcRql7X+Oo1hCl6+zrwmO/vPwJj+WJir0uou9KHdJRwrakjR
         ivv7Odqs1BfPT3ybfCinCaolVG8MEi2THw5/YHqWmb7h2V4MA3oyPRFjoLJGwPy3BfI6
         FJwkVFdWmVPN3r/9h7FOaMcyr6WggAFDljFExHdL+fO8GxccrkRSKOIT7mPkqXbCWjcl
         AxeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH+ittxz53OiNp9mFI33FhY2pa5EZWa/70jppqGNOkt35Mvjm9Qy/6EoC+SPlLVuyjbf1bmukOh7di+nw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwteLsLzDUbq/UyePwB1Cs7anjp83oWObZrT9GR1esu7ymBw9Vy
	3o1XChBUTf+U9bAjlAa1c/QgyYqCQKKK0yyKSD3tQB9FwHQbTVwfKQ+av1qUH1Q=
X-Gm-Gg: ASbGncv2M6tQ9ZNNElJt8Mn/KsRcXxEGNDhnJ5pH5ZQbwjQ48oDKfKe9kW1n9Ybu+pi
	65kyQqP4/1OL+/WEOo/wuv6RfacxT9gdgOTYPuSOj5zXwtMndSgW0+ks7a/Pe8yu66Ahlm0Ef6F
	5BiXnMWKrWV5KyYhI0m6cyHpExhtR7F5gPwdIiJLIVCrDHQ7w0Dgg7Zn+O2ci1t43/A3yW63gzw
	S2pSzxmhnQXtxPf6kHvJVMT3LoV+/GyS4/EdwMHGgwcHr7EkyVcFH49/zUcjGzA+VO/2mSPTo0r
	XDEOP0N/BrqDVz9u/yp2Z0dieN5qnAfyiPJ5xSM+bHvorBWTSgCRsQ3SDs9T+verhySH/v4=
X-Google-Smtp-Source: AGHT+IEpuTZOAkvVDyVOUqFsqHiob4PAIXyJxs6eBLCg9MdHYmCorlqmyE3GpuhdGXaaTLkizjdVqQ==
X-Received: by 2002:ac2:5f6a:0:b0:545:95b:a333 with SMTP id 2adb3069b0e04-545095ba432mr2186571e87.16.1739245330219;
        Mon, 10 Feb 2025 19:42:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450608a74fsm804870e87.179.2025.02.10.19.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 19:42:08 -0800 (PST)
Date: Tue, 11 Feb 2025 05:42:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jordan Crouse <jordan@cosmicpenguin.net>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] drm/msm/dsi: Use existing per-interface slice
 count in DSC timing
Message-ID: <guhjhtm54xttaech3jpnsqqzfevadure6clecb5elruxxd6trd@sunww3caiial>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-1-9a60184fdc36@somainline.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-1-9a60184fdc36@somainline.org>

On Sun, Feb 09, 2025 at 10:42:52PM +0100, Marijn Suijten wrote:
> When configuring the timing of DSI hosts (interfaces) in
> dsi_timing_setup() all values written to registers are taking
> bonded-mode into account by dividing the original mode width by 2
> (half the data is sent over each of the two DSI hosts), but the full
> width instead of the interface width is passed as hdisplay parameter to
> dsi_update_dsc_timing().
> 
> Currently only msm_dsc_get_slices_per_intf() is called within
> dsi_update_dsc_timing() with the `hdisplay` argument which clearly
> documents that it wants the width of a single interface (which, again,
> in bonded DSI mode is half the total width of the mode) resulting in all
> subsequent values to be completely off.
> 
> However, as soon as we start to pass the halved hdisplay
> into dsi_update_dsc_timing() we might as well discard
> msm_dsc_get_slices_per_intf() since the value it calculates is already
> available in dsc->slice_count which is per-interface by the current
> design of MSM DPU/DSI implementations and their use of the DRM DSC
> helpers.
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c   |  8 ++++----
>  drivers/gpu/drm/msm/msm_dsc_helper.h | 11 -----------
>  2 files changed, 4 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
