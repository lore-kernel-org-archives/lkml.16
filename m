Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8D213D52F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 18:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743099563; cv=none; b=dNx87OpZqC1tMRfzOTyDCMzfTNTXIQaYoTpEOp8SRjRQy/xY6ckpqH5LxoEJFWx5lrqKk22h+pHUddsEo2PwgCAWhB2Nc2RqcJJ8aG9/iGi7NSvT8mepnnxDC8fVF0EMSaMR11Ocgr46B3FVUxB+yqOfDQ+SaXns0Z5PTHu/bIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743099563; c=relaxed/simple;
	bh=uk6Jwy1PSnCNlXG4p+4BFNIkElC0dD8/aoE5NT3+7HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iE2BZg3hGtjYITSxiD8qt5OA5OLZEUx0pI+nUZEi2Xi8HBno/j8VJJgk75vDPJmmdm36RCr2YW/XCpgM4ya70CMaZhg2RUTJbCdV8LcHgpAfVDOLsHvtB/wAgeHAD6L3ZO4VurBcrsvUrrLrgmYJcNm+o7WdAGmEcH+dc27Z6fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e+JpnJP2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e+JpnJP2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so9474915e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 11:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743099558; x=1743704358; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P12CtCMdehj+72VU5b5SqlHeK3VS+UZ5QpN9U1p7a2w=;
        b=e+JpnJP2I7Ch3etAunPJL9uuthD8rEXcXQbOjHN1NFajCLfb9gnu99opzZQlqPi8H2
         j56Q9F2PYJtVxdERcC3QVv/3Mzmfowfi4fidJ5dCB+lxQw2rYULVgY2o69jnWSBDBXsQ
         KOVcDuP2YDnruSRO5kzbrVhXIt9F0lP/o7BWK9mraw10ukSxsUbyRkoBuCQua34IiRAp
         ig1gWEHcE+0+ItEgorMZPg7Gye3jbhSjXFIzZ8XX7bEPx5ASSe6qStY+sxuHpn8UxG0a
         8PX2rFme8RnJI7Kq2J16ooWCwtu5XbWdq5eSFe5RtClVFAAqGSeKlfioCrdwg7JZ5Gjp
         glqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743099558; x=1743704358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P12CtCMdehj+72VU5b5SqlHeK3VS+UZ5QpN9U1p7a2w=;
        b=jmia+9cne7VnSPj8fWK3muGhXm+G8xIIT2yqW3ToPxqu7WFw3o4kMeYVfGSb0oWfQT
         Xu6diG3T3yPLgNF65UXvCvso3iPgBGyOcPcbU89hy8MumEb9HXgBAWzx5eUNlK92U9Za
         A2vAdASqakOmXTcXnfhqyb/4KKD81rX05bx7zxVxRRtgLKj+x5lK7xvTGjpE5Ffr7dkM
         qMvB1umx2EJyCv3Aw6NpC8Oi/pemsSQkH3r9Gg4s97P/hoLqkZEslx7vnTpLo+weJiG5
         tYtgRVT2lcW1EcCWmSkWw5xOCy9qGobM1JWlbzZYdd2Lf24PVUlLhkwp5UwSRrQvPBkn
         J5JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWkjcW34CWAq3Mib4HUV/jIp+CGcY9VDxnmiUNwKOw5qBhSywzs/aXFxyEdiLhuDr4N7K2Y2dxgXl6eag=@vger.kernel.org
X-Gm-Message-State: AOJu0YygvBNzHmTfe11z254sEYX7IYVq0NIzYNAfJJ6BDsnuF2fMpyNs
	K8HiAIbcJPf31WMQzFASxex038RXKKnGaIHbM1NICftvbEW05DX2Zq4wgMgWS+GoF8Mthww4N6m
	bXlKL1ceCwzYM4rK2k4Q9sc+yVJCD+SfDl3dYyQ==
X-Gm-Gg: ASbGncsUyYkuo461X/iBCSd6PZ0ccn8zZe5AiZqv/Vtry/uG6AHhD8sx1cICJh0Omy9
	XC2CrCBqZ6fd5ZCX9+8yWi9kUw4qqnCXsw2vNEhAwqhSbkYMrtzO/y83YI+wyaa9bwQfFvEl3ZQ
	XZvzLiz16MSnIKKC65qTPAVZ6UmH6QSRkOfIsBhk6TWTXIRIwuSGT/RvP72f4=
X-Google-Smtp-Source: AGHT+IGx4OlX0tI6n3/lfCygKwYySqUqfocQ+HTgo0hqps8uwtgi4vXx3FWmqZeqeYjAFgREomQ4sonEMP2TUAFbl10=
X-Received: by 2002:a05:600c:1c14:b0:43c:e70d:4504 with SMTP id
 5b1f17b1804b1-43d85063ec9mr46080915e9.19.1743099558412; Thu, 27 Mar 2025
 11:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org>
 <07c48ba0-dcf5-4ece-8beb-f225652c5014@oss.qualcomm.com>
In-Reply-To: <07c48ba0-dcf5-4ece-8beb-f225652c5014@oss.qualcomm.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 27 Mar 2025 18:19:07 +0000
X-Gm-Features: AQ5f1Jqc8u9VrZlkAGV9Tu1r0he8QdXLeQ8mXNLHX86N7Cf6oD6W0KLoAMXaF0k
Message-ID: <CACr-zFBwbniB3H5cnq0higsX6a_G4Be26N-nNL8JAzci8y9_Mw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp: fallback to minimum when PWM bit count is zero
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Thu, 27 Mar 2025 at 17:40, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On 27/03/2025 19:25, Christopher Obbard wrote:
> > According to the eDP specification (e.g., VESA eDP 1.4b, section 3.3.10.2),
> > if DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > the sink is required to use the MIN value as the effective bit count.
> >
> > Some eDP panels report DP_EDP_PWMGEN_BIT_COUNT as 0 while still providing
> > valid non-zero MIN and MAX capability values. This patch updates the logic
> > to use the CAP_MIN value in such cases, ensuring correct scaling of AUX-set
> > backlight brightness values.
> >
> > This improves compatibility with panels like the Samsung ATNA40YK20 used
> > on the Lenovo T14s Gen6 (Snapdragon variant with OLED) which report a
> > bit count of 0 but declares an 11-bit PWM capability range.
> >
> > Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > ---
> > Changes in v2:
> > - Split backlight brightness patch from T14s OLED enablement series.
> > - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> > - Rework commit message to reference eDP spec.
> > - Rebase on drm-misc-next.
> > - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> > ---
> >   drivers/gpu/drm/display/drm_dp_helper.c | 50 ++++++++++++++++++++++-----------
> >   1 file changed, 33 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index dbce1c3f49691fc687fee2404b723c73d533f23d..0b843d5b634f89f144b62b30311834d118b79ba9 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -4083,7 +4083,7 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> >   {
> >       int fxp, fxp_min, fxp_max, fxp_actual, f = 1;
> >       int ret;
> > -     u8 pn, pn_min, pn_max;
> > +     u8 pn, pn_min, pn_max, bl_caps;
> >
> >       if (!bl->aux_set)
> >               return 0;
> > @@ -4094,8 +4094,39 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> >                           aux->name, ret);
> >               return -ENODEV;
> >       }
> > -
> >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > +     if (ret != 1) {
> > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > +                         aux->name, ret);
> > +             return 0;
> > +     }
> > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > +     if (ret != 1) {
> > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > +                         aux->name, ret);
> > +             return 0;
> > +     }
> > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_ADJUSTMENT_CAP, &bl_caps);
> > +     if (ret != 1) {
> > +             bl_caps = 0;
> > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight adjustment cap: %d\n",
> > +                     aux->name, ret);
> > +     }
> > +
> > +     /*
> > +      * Some eDP panels report brightness byte count support, but the byte count
> > +      * reading is 0 (e.g. Samsung ATNA40YK20) so use pn_min instead.
> > +      */
> > +     if (!pn && (bl_caps & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> > +         && pn_min)
> > +             pn = pn_min;
>
> I wonder, what stops you from implementing this part according to the
> standard, rather than adding a hack for 0 value.

I am simply quite dense, I do not know this spec or the DRM code well
at all ;-).
I do appreciate your continued reviews though, however painful it must be.

Before I send v3, can I clarify a proper solution?
I think you are saying that I can remove the section where I read the
capabilities and instead simply have something like (in pseudocode):

/* Determine effective bit count according to eDP spec */
u8 effective_bit_count = pwm_bit_count;
if (pwm_bit_count == 0 || pwm_bit_count < cap_min) {
    effective_bit_count = cap_min;
}

I would like to introduce this new variable to make the code easier to read.

If my understanding is correct, I'll send a v3 later.


> > +
> >       bl->max = (1 << pn) - 1;
> >       if (!driver_pwm_freq_hz)
> >               return 0;
