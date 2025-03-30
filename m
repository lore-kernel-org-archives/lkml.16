Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F901D54E3
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743357958; cv=none; b=e2DxE+PWxvBIiIuoQ1Kh2bPS03rZG3tawTAD5p3oOdWxBtBik8Vx+AUfmolXV1a4H254F+mn+j2glmY2oKtfGJHlG4jN3U/m7gijKQuDJUaIysExiUBDwnqcg2nQiqIFT60jdpw7lybeoO4V5IDdhj5WD/Vq9lVnPQ5vUOTsRis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743357958; c=relaxed/simple;
	bh=hBWP/0soWHbq3zbQYt3u1v10HqYji3ePqIHWx3i+RwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYhff2VlYqcTGNyldo22SxVUCGBQshsUFz0eUV4NkGeFvhMvflG7cXjCzoVHWkj62zFJlqdur5kWXoyPzaMmFvAO/4/ZLUdgM+nKvpBXwMQJpEksBCxKlr2/QefF7aiu4xQp4RLAsV3e5eftjoPl1n4Ubx4bV7UpjTHDIMPKuRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UuGtsN7K; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UuGtsN7K"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso23785245e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743357954; x=1743962754; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hnfsVQoN7BVQq/UCAqhsRfIkUla9FknIwhk198jk+nA=;
        b=UuGtsN7KdQHj2N6SmthPaWLXq/gB6M/L+fr/wek0DzgVOS2wyWr+EpT9t0Viiy1b++
         EVsFcWNccymGc/QUCj13XDTL778JUewl7aUrrB1euekYmr6X7dTmbDqIjvmYoiTmej6m
         pDPfZUvLtuYzFU54SbTDlAxfART2NZ/2eigHYB/keQqhB8jUd7TgAtMsDLgNXKEuncuh
         79m76oqcFH8QJjzkdAU7JzQuGpQ9KnxivaqZsNELDCp1TSdc07mz0uxEAhuoNBx+/YLR
         qGWEN3w0cSFYslP6E/ddCY5z9c21UVsfCuAu5PkqULKUHjeamaIPJ+uNGTtTSmOcEm8Z
         nMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743357954; x=1743962754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnfsVQoN7BVQq/UCAqhsRfIkUla9FknIwhk198jk+nA=;
        b=Sux7RSAdNe8TeI9rIKaeo5pHXQpM+QZRtZwsfI9KLoElVeXelFRGyGASYNfp78Wsgs
         rtajYkb2lxVeJzk4EsX2l8eaC9hxSsSdodSUEcCcFWBiC358g3UiVnQkN4AFjU9xddaw
         H9dSO7QTr6K26SoE4M3/KXrNuRxn19weZ5DFAqABnD7ExdAybuI14aSovra7FWJh5omm
         MCYLU3t0Ex7/13KUyzKgd+wegzORq2QXaSH/mxBGmYB8ibrejobkm2kzXafd7Vdk+iyP
         Dc4nX0hf2qAZGOk+vyhz7KFANGx7cFyoHf22lcnwYg7DzJEJW/zcNoqBddhQa0XfAp0l
         gI5g==
X-Forwarded-Encrypted: i=1; AJvYcCWs1DXDkIm2F6u+WTNcBv1yqHHovwrqAM0icLXToNaH56suwy6nHH2TmgnjWr8+WCQsgXYBGkfyYqWsN/c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5K6la6dBtA/NXd4HTaMuRMVmh2Y2Gh2xHrn5nyEN9dG0slCXe
	eSYOrFDtN8OgyHX0xkslYP1/hvoqjyJu11iGN7oX6GuVQWUuwvj5HIWXzDyqNnsTsnGoP7zdKAs
	h4rCiAmS1H8sspJ5BeIjX29SZeZRCwiuAdpy7lg==
X-Gm-Gg: ASbGncvdR0CYfin73N1vbhh4jnQAmF3XSoEAEhXeelIO9EsC1LxEpO4GdNPWRM5Ur5W
	MXXzA4bP6QUlVzb9dCAyW83a9ksXy+VDVqPwsnwXgNpm3JIyRNxnvRxhv8oE0yi6mg7mW0aLL2V
	xBpn+7UcPuDq0y/E11fpGW0SPvATr/BBumm5NJ3IVO9JWdM8u9tw+tPpYTzgsI/hrLhFV82Q==
X-Google-Smtp-Source: AGHT+IHoos9QzanPsGiYgW04xbM8tHV8yEstV7nbyP17tfhgl5Tu6pOmCopyigYoqs8pQfUizNRz5NEJZ+MuExnPEyA=
X-Received: by 2002:a05:600c:3493:b0:43b:c6a7:ac60 with SMTP id
 5b1f17b1804b1-43db62b72e4mr57523125e9.10.1743357954536; Sun, 30 Mar 2025
 11:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v5-1-25083d9732fc@linaro.org>
 <f2odvmbhsfmkrkzada2a7qdjavomt2cjji7mbwibzlhxiz35ai@2qxnfb44eb2r>
In-Reply-To: <f2odvmbhsfmkrkzada2a7qdjavomt2cjji7mbwibzlhxiz35ai@2qxnfb44eb2r>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 30 Mar 2025 19:05:43 +0100
X-Gm-Features: AQ5f1JrPaoChzlVOaAUOxwhyfNR6iarewZ64iTBqQ4hyLv-fzJCFGnyzphgmD5s
Message-ID: <CACr-zFDUMzb+jKcBc1SfpsOiQsAJJ0jsPdS-vcA=OXy-K3pfQQ@mail.gmail.com>
Subject: Re: [PATCH v5] drm/dp: clamp PWM bit count to advertised MIN and MAX capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Sun, 30 Mar 2025 at 18:56, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Mar 30, 2025 at 06:49:40PM +0100, Christopher Obbard wrote:
> > According to the eDP specification (VESA Embedded DisplayPort Standard
> > v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> > less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> > the MIN value as the effective PWM bit count.
> >
> > This commit updates the logic to clamp the reported
> > DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> > DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. As part of this change,
> > the behavior is modified such that reading _CAP_MIN and _CAP_MAX
> > registers is now required to succeed. Before reading these registers
> > was optional.
>
> Describe why, not what. Something like 'is now required to succeed,
> otherwise bl->max value can end up being not set, although
> drm_edp_backlight_probe_max() returned success'.
>
> LGTM otherwise.

Amazing. We got there eventually!
I updated the commit message around this change to be:

    As part of this change, the behavior is modified such that reading both
    _CAP_MIN and _CAP_MAX registers is now required to succeed, otherwise
    bl->max value could end up being not set although
    drm_edp_backlight_probe_max() returned success.


I will wait for more feedback for few days before sending the next version.


Cheers!

Chris
