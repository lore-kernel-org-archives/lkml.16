Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E496282E1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081571; cv=none; b=PwVztqrNejl/20anV2QNjQM14gSfugIltG2YJ1NXqWuSjPCVh3R75KWz/Xl8EGAFl6aMbY+U7XwOSTWOPpteC7+kAodxKe0FSx1bw9h6388HzXUnEf8QodaxEAjaP7ZEPebq3Kk9aPPDeXutG/f2oyyEP/JAbC74bdav4im17AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081571; c=relaxed/simple;
	bh=+cDdIOswm/cyDdBII0iuR2QdTuXYbEwDjifjrlArm8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmBAif5T5ehwHq0CiZgFqs2aWkUS/efEtO7RxcwJl8PO8x4SwYUDyL79xxtheTfmnL3XhyrEUCsdJmPm8lSQ1+ntB+8pu1y32878rk4ZzpxUw/Db+u0G3m03bO+9QAB1gVBUP1IYOHhHzz+m9Nya1k4bAeC5HZgwAbPdD2OIOdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l88Xhatj; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l88Xhatj"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so468214f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743081568; x=1743686368; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+cDdIOswm/cyDdBII0iuR2QdTuXYbEwDjifjrlArm8o=;
        b=l88XhatjItdc1Nd11pSCbNKycW48/hq1OgaNpVcsu+ierfQHfLzwwMpS7OvEw3/qYy
         KuiuoILkZF6RP89SPgwYjD/XAiQL0KZVuQl9rLIbqiBpg5IUYrFW+ggxLyj05+aTn14I
         BpvNNmxNoxq02Uw+FcPq7yfI9FdPkE9yAI8RMr302/93m1XODBPcY8g7waCUJE4+KJV3
         u9ZI3hUvpcPnAI6TM7rIabZbnj2n6BtMFuX/x2AYJQ4h66T0XqbnkM4euB3EvI34xjvi
         GmOWYKKpm8OgkZsza27aN2KcnSOfF7xRcGP/NA7XciOTy4aNvNJQj0DMdHuavEJnHUlk
         rlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743081568; x=1743686368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cDdIOswm/cyDdBII0iuR2QdTuXYbEwDjifjrlArm8o=;
        b=Xvzggz09TBeXOmRRW/PV/0lMNiAfpWeipdXaJuB5qT22MEAjdgnMmwBk/lrk3F6O0v
         7QBl9wwieZZ8WFpw6Q1DW0UVl4OB5BifUbSpCuosVtJiV2+XzdUQhxUhCw0j1/xAl+YX
         a5eBLRrSyghOKLgolZiIwT4ccVTKuRecInCZFd7OCg+AAojjn3edhoffIqhEuIYe/ctL
         rfdc3e0eNmLyon4Ofk51YU3q+mjxBVFMMIqVwf1NS9GE+ebqH4FLILkjAOT8nxt3uTcn
         9dgZ31Leh1om5zTsYBN/HMuckbza/Ji4gpg/Hy38yfOOKRZvajnVeVliIjggmqjJNyrh
         UFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjxthivrG4DXTA+yerA2rVstPPl90kLXvGntIfCnl3NfDmBObn+F+6D2ZxniWATBoGlHVfhXdks5eXIa0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya4FkkaatxvMDhfB12W3W2bioHUwiiJHUhpASfEGKoM4Q4QnCQ
	dhCn4EqLsJm1c3+omXAFncykVWyiWu37r7iqGd3gRFUduHAYxihgG8DUFfwm37aVSg4AJj+Dtgo
	HAqf2zfyXjCLAn+c8sWLr+C0I8Bet9o/+ahZDlw==
X-Gm-Gg: ASbGnctLyFWX73RdmpzT4YwwgXmemjLVquemCOYDqLgUMD6j5juXY+MFVRYNweh6Mvx
	zsJzOcrmxkIaN3H0udFBQ+74MfKs7tNT1qLPUky5YRPRgkcGWZk+svTe2tLHgH/CxAK1IWmZEga
	9JntbtpR/52clFiHYAwd8D77XGBFn7GNJpAc5XhKegfXX/mqeU9ThPdnR/kUw=
X-Google-Smtp-Source: AGHT+IHs5VZplywxnxEi47k8pf3rZnEm/7qBpY3Ioc8amqZO6vhJqMiAOdf0vB5bQQTzKsXVOl4SWXK8fz/Hde+Ezy8=
X-Received: by 2002:a5d:6487:0:b0:385:ee40:2d88 with SMTP id
 ffacd0b85a97d-39ad1740bd5mr3141625f8f.3.1743081567876; Thu, 27 Mar 2025
 06:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org> <Z+UGqItLubQ9kwF+@linaro.org>
In-Reply-To: <Z+UGqItLubQ9kwF+@linaro.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 27 Mar 2025 13:19:16 +0000
X-Gm-Features: AQ5f1JqvG9Z_EF7biygLKr6lcDhPMwDOinSPLyFBaGcwOFtc4jXqvP1t5fWsCZ0
Message-ID: <CACr-zFAVDhDvWupMMCe5ttpCU8+NSD0XK1tS=TsstM1znhDHNA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/dp: fallback to maximum when PWM bit count is zero
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Right, the reason this was included in this series is because without
this patch the panel's backlight doesn't actually work. So for me it
was natural to include it. But happy to split it into its own series.

On Thu, 27 Mar 2025 at 08:05, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 25-03-25 19:21:29, Christopher Obbard wrote:
> > Some eDP devices report DP_EDP_PWMGEN_BIT_COUNT as 0, but still provide
> > valid non-zero MIN and MAX values. This patch reworks the logic to
> > fallback to the max value in such cases, ensuring correct backlight PWM
> > configuration even when the bit count value is not explicitly set.
> >
> > This improves compatibility with eDP panels (e.g. Samsung ATNA40YK20
> > used on the Lenovo T14s Gen6 Snapdragon with OLED panel) which reports
> > DP_EDP_PWMGEN_BIT_COUNT as 0 but still provides valid non-zero MIN/MAX
> > values.
> >
>
> Nit-pick: AFAICT, there is no relationship between this patch and the
> rest. So it should've probably not be part of this patchset.
