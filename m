Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC9D1DE3C1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773087; cv=none; b=ka2EUdqr6pQe8JtfVogWnrR8BfOTBLxqN1m+pSPALjbeBnKP4Xc56kVbMx8QP8zH48aOwSgDm600MFlvxQ82AR7FK2e6X/QLXmd+pn9DelRyTuuWYscq1VqPHbaUbAtZLDOcTSOLooEOUyV98ovCSRZCdAa7PQB2AmwI3seFa0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773087; c=relaxed/simple;
	bh=GyarVBp62jqrSOtWoIxdE0AcKQ1SkgUJIsWxfsIjo2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnpL4AmYi+enPD7q5u34M/QP8RlCirm9K6fWaVePKn6QRVp+yj09ypD4o+6JM/e8Iatuhnj5m9Woc0eg52A456+eFY3qMeU9dO411F9q7VxlTHcweP43QUBuf2htb+G1tlQMvi1mcEOUR+bq60Pj3q/yU3M76U2LPeVUrUVujeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kiR8xCYz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kiR8xCYz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4394a823036so18924355e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 06:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743773083; x=1744377883; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oj+YIAdxkk89Hzg4P+YYq0UStPxTqNlDd7I9k5sEoSI=;
        b=kiR8xCYzb//NXFCEdI8kL4JzPnIqDO8RJ2TBETTaMPT7Kb7tqPj196So2C1Ir/1ooH
         tXJnj8kHT/PehECevXH2hwuksUBk+O2BMGKrGbdjYqfjsFNFm9BRD7r5zcLVglP0/MAU
         V6gbCB3BxalDubSsD4CQOmPuDr2QaEseF+7+ASWg4zdlKBKUMazhOKtpjXhxGWEMR3G5
         QWoU8026RcZM4LQjSdtiyftwPWYTJ5xbSaIoLpbIC1YIiVRxQjtqv8mic2TR/f52S9T1
         lmPRVJ5EZrVxr+AlefYO5fLtAl/kHqZL6fQQluSG7dZRmMzcFi3Oew7LrlBuJYhRJ62r
         eZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743773083; x=1744377883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oj+YIAdxkk89Hzg4P+YYq0UStPxTqNlDd7I9k5sEoSI=;
        b=tRTXMrSWvtfL/0qlmFuCPqdo8svQcGBsNYokXsmmAVg/LogiE5E+1cMjuPodSfJ++j
         a3KbWWONaohJgxanZbPTOKC2KyV+o1sld4rcA/NO4Uq6bQGqBjFzcEIz/gutDoYpPpJb
         hII5yi6S0Yc3XxYaczAlF42zXN005nS2zfiDq1HJFAKjTgxF1NNGttqZpwv316Em2LgQ
         T36FIfONbogxBmaplINzhkpnvLy5j307rR8ktXzcOWpnjBKt4fr/VjUZqpgAyX4zzHtd
         +RbTX3/Lg2t7CAFnyqntgCiVCmsHAcqUIbjw8M4l0KRHzp6kKFRoasDJzcwz43cQ0wgd
         rkmg==
X-Forwarded-Encrypted: i=1; AJvYcCVYcbYvmTDUTETvFeSOhtPVfT18Hov7pai3Wf/bqOdJKSP2N0TOQOEhp1Dr9FsR3V4CuwiWHgMb3BN+AyM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg7gp4IiMwfEU19jCzVox9u7ofWxgjcLBZL1GtOF5uubh5/Bpi
	5i0gGPvW7G7at+whNS+Z3lRX1TfgdcOqDjjXUWM6KuPzLTtSbOHc77+rxLlnHhk4d+xnYfj13/1
	V+WYZHzHZLKkA5uSh7h5DAOJGlpNULZ3H+Yz4PA==
X-Gm-Gg: ASbGncuB5pIqmk5tLtBzzm+1lTvZPwwjbm4CkPNBJJeHwAcuvWVJ572gL0etRsMUf71
	B2DOPh47M4xy10NqQ3kCBski+gV1HVNbr4GzegE2Q5U35Comms46hhFtpNgBPuAZI1IWUpTz+RA
	d0f1bRI3yC0QoHagDPm/ca3ECEyLts5q84RCmpRmYC/PH3nSY2Iqm/w88E14s=
X-Google-Smtp-Source: AGHT+IH+MryZk670LI+vb8g6AGQzjTKgC/A+Ysy8cvkGHq9W3yQmNkcMxSeio1SQx6Re2aTqU+InOAD5FiP0RNumBkQ=
X-Received: by 2002:a5d:584c:0:b0:39a:ca59:a61d with SMTP id
 ffacd0b85a97d-39cba93712amr2831530f8f.47.1743773083319; Fri, 04 Apr 2025
 06:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com> <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
 <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
In-Reply-To: <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 4 Apr 2025 14:24:32 +0100
X-Gm-Features: ATxdqUGnTvLH_MOTicwPOTsv0Kyq_s2vv3HxYqY2Tmgfq0NrzRxurscl_9sCHeU
Message-ID: <CACr-zFA77ogDSNEOGd32Rdh3geqkL25T0BKtNdKzUdjrL0+9RA@mail.gmail.com>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX capabilities
To: Johan Hovold <johan@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Johan,

On Fri, 4 Apr 2025 at 09:54, Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
> > On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:
>
> > > > @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > > >       }
> > > >
> > > >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > > +     if (ret < 0) {
> > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > > +                         aux->name, ret);
> > > > +             return -ENODEV;
> > > > +     }
> > > > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > > +     if (ret < 0) {
> > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > > +                         aux->name, ret);
> > > > +             return -ENODEV;
> > > > +     }
> > > > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     /*
> > > > +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> > > > +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > > > +      * the sink must use the MIN value as the effective PWM bit count.
> > > > +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
> > > > +      * correct brightness scaling on compliant eDP panels.
> > > > +      */
> > > > +     pn = clamp(pn, pn_min, pn_max);
> > >
> > > You never make sure that pn_min <= pn_max so you could end up with
> > > pn < pn_min on broken hardware here. Not sure if it's something you need
> > > to worry about at this point.
> >
> > I am honestly not sure. I would hope that devices follow the spec and
> > there is no need to be too paranoid, but then again we do live in the
> > real world where things are... not so simple ;-).
> > I will wait for further feedback from someone who has more experience
> > with eDP panels than I have.
>
> There's always going to be buggy devices and input should always be
> sanitised so I suggest adding that check before calling clamp() (which
> expects min <= max) so that the result here is well-defined.

Makes sense, I will do so in the next revision.


Thanks.

Chris
