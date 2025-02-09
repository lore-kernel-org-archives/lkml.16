Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4496C1E4928
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 23:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739142832; cv=none; b=OanCgW/1KZUtsdOZTGOR19mwT3ILNROmKDCzoSdtwhdzKznkiaZDuR9iF2WUaFeKPGJNaV4oIIjE204VnlNzkYLcr2rMfCb0WoaDJ2bzCElLikdokcnJW7BeQjmj54I/qUw3rVGiq8/+NI/2NzIteHJZf+HxZvyPTcAk6qR2tEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739142832; c=relaxed/simple;
	bh=AI3CKIS5whLgIN6LJr7n1hpFAqsbhbjEggjy77O9BwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8hc+qHPbjvDOsA51AFgj2T/mJDpBHwtZQCs75IhMrv8WJ9GdsZH9jpCIV/2crcA8V15FG+pnvrdWVrCP4DUdpdT6g88CDC9NBQdY1tQXhd3PnsbS3AKM3PcgOgzyEClf9XGS4dIZHrZGVrHJaXzXECFNsyhr75Nqzr+lQDxCVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WbSNG8BC; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbSNG8BC"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54504bf07cdso1599561e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 15:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739142827; x=1739747627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MoxKvhqaqOUsSE3IycBsIlrhzz+TLrVA2orrTjTeuoQ=;
        b=WbSNG8BCLz7gRZrXLk83qg4DSHTnx9913SmDZLrGxCfnlqAM1EWprQRpklAaohWEPs
         lhbwsISe5NSinZQ7U+C2qLX2X6xOowUEYiVEQ9yKQ5y1uAFPE1ZYEjmA4xkjSQHP27hU
         bxdZfzHN3RjfvBqx3qg2ph5uXK391DymtrXwhA0kmVucH5tEUSGXVAXlcKJz2FnsJ/it
         4MzVgY5IuZFxpbuertPjA3G6aCD0OufVUtyOn/eDk0b/Gh6nB7kDniOpdyh9SU5+QBxy
         22GyqiiLHiKMlsfTef3rAj3Q0kiB/rXBtegteyIyqsU0GCPnhTjjAyV1nwV+z17fS5nB
         subQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739142827; x=1739747627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoxKvhqaqOUsSE3IycBsIlrhzz+TLrVA2orrTjTeuoQ=;
        b=BNrjFoytSt6OtZNbYaddhFEhLK31NSptmmBCu764Bdaf+dwZ+xGT5gp/jZM1/ZJrZP
         dD2DZ6a2iidiaw4nU0IyHTca5OQXwNMFW4MtEPWpZb3evX/c8bDB2Q8J8nweqMowIweq
         /LCQJGo/gzBsPAWNkWA6BzM6jJ9aX855m+fOlRaIDVEzdTmhrYebja7bj9Rke7WomAEe
         d41RirCr+u0zEXA1BBSBRitFvqaJwBI9STPxqI5goDG/CyBVXTjVA6pDXJ7yeBZ2YInm
         83MDgvYqznWQ97KCMibaZk3nkaaCKwWIen7mmuNVgQuLDZ1D2yFnVZmb/V7wiBQgC6cA
         GJ0w==
X-Forwarded-Encrypted: i=1; AJvYcCX4Z2YTTvsiAv9Ds4fULnYSmOu36N2CMnGjso/jLxHHAlXUXcqBuV96SBe7VPUSMFiHaoEp4b98pQ7nVTk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5WjEfOIcuwft02nMRFZDY24TMZdM5BAcZ4QIDy13g2Mzi3/FM
	7I39AujdtEd6KbSr+wqZlBa+F4FH3FGmSJp5E80IyT6+RxL6VcWJR1Zgjg/i3lI=
X-Gm-Gg: ASbGnctzCJ97rNUJOiL9AvGK0eyGdqahBCqvEVPjfsXNarHi5Nys/zdYQS2UHiCL5FH
	C+/CMekPrNiOD4mnD17UT4i0bSG0oblrClNhakrnwlsKKbFQLMsWpN5+wuwuR2yID8Vxyd0PHHR
	9QZmim5G1zxM7Nwg6VP3+kTpgiAfpGt5+ZPDks746kpSRTCpCavGBZcnKHkHQCwILJu+LfUFJ33
	q9aGqCU5ZgIa+Lr9bn0Rv+qnqL1Ah5qGKHe4+dN1J58c5XgmWNIqbJidPBokxaPgCjK0NbrnyVs
	TwY+kyOsVopoZVxK8cJ5hCLXMr5/1kogq4ZfiR5hdQQqsxlDvFgI4aKWB3/IygCtKAEyL70=
X-Google-Smtp-Source: AGHT+IG6pHxWcPGhnjwnxMZahzJXmycpngbz65UUqKb/X5omPdkl2r/lGWWjV9vy7q55qIJ9j0uJ6A==
X-Received: by 2002:ac2:5f66:0:b0:545:b9a:b4b4 with SMTP id 2adb3069b0e04-5450b9ab564mr600700e87.52.1739142827370;
        Sun, 09 Feb 2025 15:13:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450e3e4e72sm25386e87.199.2025.02.09.15.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:13:46 -0800 (PST)
Date: Mon, 10 Feb 2025 01:13:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jordan Crouse <jordan@cosmicpenguin.net>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: Remove arbitrary limit of 1
 interface in DSC topology
Message-ID: <agibhaftgy26tvlxgvhqmiortwaycblsxs42bebj3n54trozj7@46bqaqlrfn6n>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-3-9a60184fdc36@somainline.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-3-9a60184fdc36@somainline.org>

On Sun, Feb 09, 2025 at 10:42:54PM +0100, Marijn Suijten wrote:
> When DSC is enabled the number of interfaces is forced to be 1, and
> documented that it is a "power-optimal" layout to use two DSC encoders
> together with two Layer Mixers.  However, the same layout (two DSC
> hard-slice encoders with two LMs) is also used when the display is
> fed with data over two instead of one interface (common on 4k@120Hz
> smartphone panels with Dual-DSI).  Solve this by simply removing the
> num_intf = 1 assignment as the count is already calculated by computing
> the number of physical encoders within the virtual encoder.
> 
> Fixes: 7e9cc175b159 ("drm/msm/disp/dpu1: Add support for DSC in topology")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
