Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A24144D21
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 03:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738811328; cv=none; b=NpLcJE+Su2HRTbreLSBZ1xeFl2+FsZ0vt963dknDa/CAr/wr68MhVJopImmmaPInXQrwknPyem01tSPVX3KC8yltdKTd2dIjm2IizaGgJo+1mrW8jjmrOCzCXcARrrFEJn5487dbdXcMC4ErLpuoxqlZXwI5IPUUE4EejCGfW/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738811328; c=relaxed/simple;
	bh=JArX3Dk5id3BJMLZVxmy3A6G5kMaoHM7Enl4wTky7vM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rpXZSTHuCOj174w7c8WbI/f+4MS1IKoM+yj4Y1hHZZepilnFEDwecB81aAZ8WU5BkDKVQWUDK9jZacFgxWVig/yI09ZVVmJpIMwgxBz0RoWSn+jPaqPn0jBwKQWOB0gEjnyLD/ngan7Xmhbu0NBMyurXrwkO8ZxyLu9F8LFT6AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PpZeXDBW; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PpZeXDBW"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6f6ca1a8aa6so2713757b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 19:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738811324; x=1739416124; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0IrdqFJIK9pHEJeBBjQmGRdouO7wy9i+RTIEY9ibaQ=;
        b=PpZeXDBWLiVN9pfDWy5qo4/mQi/LuUre9VNWIj0GyKS8hH8zv5nMEEFkLzD9nPbAXa
         DHsiPghRhFD7bL1G83YXlDwmP44Xl9b3gwUpo5CZ4KiNJHSa0OecEmLD2wiVhEZAgJPg
         iOMHHxT4DchnyILeTz0a8s6fROk9HhivvtFkDC59HH/nqKr6MbL2GOAUQ6RmiwuXXZTc
         yAZ+BSW5cFZwUhkUa0xHD7X7R/95CUa7E053l6qu6BKwmVmTeAEJMXh0Pfx4aL0UaWuP
         phcHKSTAQtRWA71T61vX6ysDs8oFglncNWiTcO9FjQGIjLEv4VdZs5sVTrZ1tbxfKhfK
         4Vuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738811324; x=1739416124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0IrdqFJIK9pHEJeBBjQmGRdouO7wy9i+RTIEY9ibaQ=;
        b=KLZGItQq7UvB5lmwQX1rMJxCrD8Dden4W5PosQOmUBwv3YKsmqqXqnN2QxKkGYCTUN
         p733ZlCCoZCi8oszvUCypf0AZE08EbHGgBHVN2N1OEVbev6VCEYN9XacxgpPbnst6Pou
         WZhCHrK7kdNLeMwI6d7FuVwAoCw9yETb/cswEGA5fmFszze3u/pCXzr1EJEusfIkMaQR
         dRZkYXJclAK4gVCUBGAi+fau2DD9sWyZQSJoNdJGeoDTHDzT+Sahvh7qPsmgRoGXqXFM
         lMCVyJPgaHwQ/ENpwgIpJl1AKHBnjitxh8P7cEAqlqRYqkL/DqQkXN589fHZP1KpReyD
         6yJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxEs8mpVVj+wyDQmPWJ9UG+SqyBg7CTh75StMoJIxj2Tpny8k4dXAwe8hNCt7tTYWmrnJPoMgH3bam6Bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLE51JTzyO4rVlpDWN3hgykkhuN5QUcQQkcHzhGjCUrQlJitk3
	188iKVJ3Y6NxsbmuaP9ouUWt02/rdHx/tNzJiRCj6xiZIAnresBoTLTaa5MbwTZhMWRKQVf+5a9
	2D8H8LOEbWQ2MNK27g7TCBn8gQdGIrTpEViJBUQ==
X-Gm-Gg: ASbGncu1v25VvTZPGIE3BTVI8CiOHpYW4P4pwTKsZeg4MkMx+5PCioTGGyeE6Nt8Cfm
	D6J8HM8J8DQa+ipV1c0SLBEHyvD65XAa3ueYVdC6QqqFv4qtp5b0G2bCUMWk+SMsQ1X/p7LA=
X-Google-Smtp-Source: AGHT+IFEPX9hCQ37/v1Pk0bdptcnsa+EQY/WxVASIRCTOf/ifZHDhvU9xxe9pscbkAdV3OuowrmuPIF57zfJMGu9KWQ=
X-Received: by 2002:a05:690c:7407:b0:6f9:82a8:e5dd with SMTP id
 00721157ae682-6f989f817d1mr51911407b3.29.1738811324572; Wed, 05 Feb 2025
 19:08:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-1-5b5b2d4956da@linaro.org>
 <wchzy3tnppv5ql7k2juhynqz7kwjjsod3taykw3znxrzoomqdw@fudbksambvat>
 <mtzfnr53hug7ina7hf3s6ihzkdl7xswz6ibf46dgei73khj4ms@cfrxg32vdrbw> <20250205-strong-azure-koel-f5b1f1@houat>
In-Reply-To: <20250205-strong-azure-koel-f5b1f1@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Feb 2025 05:08:33 +0200
X-Gm-Features: AWEUYZk_XPi6NCy5jyqMsGwvKZsHdQsYK-xH8hzJ8BsWLzkccfb-e2uy9WbcVj8
Message-ID: <CAA8EJpoLcgYkKwyXNJtWi_Ym62rCRqnUPgztFXwdpdHv6k3yjQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] drm/connector: add CEC-related fields
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Feb 2025 at 16:28, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, Jan 28, 2025 at 03:12:41PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Jan 28, 2025 at 11:33:05AM +0100, Maxime Ripard wrote:
> > > On Sun, Jan 26, 2025 at 03:29:06PM +0200, Dmitry Baryshkov wrote:
> > > > As a preparation to adding HDMI CEC helper code, add CEC-related fields
> > > > to the struct drm_connector. Include both cec_adapter and cec_notifier,
> > > > allowing drivers to select which one to use. The unregister callback
> > > > is provided to let drivers unregister CEC-related data in a generic way
> > > > without polluting drm_connector.c with dependencies on the CEC
> > > > functions.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_connector.c | 13 ++++++++++++
> > > >  include/drm/drm_connector.h     | 44 +++++++++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 57 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > > index 1383fa9fff9bcf31488453e209a36c6fe97be2f1..fffb718b09eaaac200e6abc7524bbfe98c4741f4 100644
> > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > @@ -279,6 +279,7 @@ static int drm_connector_init_only(struct drm_device *dev,
> > > >   INIT_LIST_HEAD(&connector->probed_modes);
> > > >   INIT_LIST_HEAD(&connector->modes);
> > > >   mutex_init(&connector->mutex);
> > > > + mutex_init(&connector->cec.mutex);
> > > >   mutex_init(&connector->eld_mutex);
> > > >   mutex_init(&connector->edid_override_mutex);
> > > >   mutex_init(&connector->hdmi.infoframes.lock);
> > > > @@ -698,6 +699,16 @@ static void drm_mode_remove(struct drm_connector *connector,
> > > >   drm_mode_destroy(connector->dev, mode);
> > > >  }
> > > >
> > > > +static void drm_connector_cec_unregister(struct drm_connector *connector)
> > > > +{
> > > > + mutex_lock(&connector->cec.mutex);
> > > > +
> > > > + if (connector->cec.funcs->unregister)
> > > > +         connector->cec.funcs->unregister(connector);
> > > > +
> > > > + mutex_unlock(&connector->cec.mutex);
> > > > +}
> > > > +
> > > >  /**
> > > >   * drm_connector_cleanup - cleans up an initialised connector
> > > >   * @connector: connector to cleanup
> > > > @@ -718,6 +729,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
> > > >
> > > >   platform_device_unregister(connector->hdmi_audio.codec_pdev);
> > > >
> > > > + drm_connector_cec_unregister(connector);
> > > > +
> > >
> > > This should either be in a separate patch, or mentioned in the commit title/log
> >
> > I'll mention it in the commit message.
> >
> > >
> > > >   if (connector->privacy_screen) {
> > > >           drm_privacy_screen_put(connector->privacy_screen);
> > > >           connector->privacy_screen = NULL;
> > > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > > index f13d597370a30dc1b14c630ee00145256052ba56..6da840673b1209c84bbc396643c6033679a7ec74 100644
> > > > --- a/include/drm/drm_connector.h
> > > > +++ b/include/drm/drm_connector.h
> > > > @@ -46,6 +46,7 @@ struct drm_property_blob;
> > > >  struct drm_printer;
> > > >  struct drm_privacy_screen;
> > > >  struct drm_edid;
> > > > +struct cec_adapter;
> > > >  struct edid;
> > > >  struct hdmi_codec_daifmt;
> > > >  struct hdmi_codec_params;
> > > > @@ -1191,6 +1192,19 @@ struct drm_connector_hdmi_audio_funcs {
> > > >                      bool enable, int direction);
> > > >  };
> > > >
> > > > +/**
> > > > + * struct drm_connector_cec_funcs - drm_hdmi_connector control functions
> > > > + */
> > > > +struct drm_connector_cec_funcs {
> > > > + /**
> > > > +  * @adap_unregister: unregister CEC adapter / notifier.
> > > > +  *
> > > > +  * The callback to unregister CEC adapter or notifier, so that the core
> > > > +  * DRM layer doesn't depend on the CEC_CORE.
> > > > +  */
> > > > + void (*unregister)(struct drm_connector *connector);
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
> > > >   */
> > > > @@ -1832,6 +1846,31 @@ struct drm_connector_hdmi {
> > > >   } infoframes;
> > > >  };
> > > >
> > > > +/**
> > > > + * struct drm_connector_cec - DRM Connector CEC-related structure
> > > > + */
> > > > +struct drm_connector_cec {
> > > > + /**
> > > > +  * @mutex: protects all CEC-related fields
> > > > +  */
> > >
> > > All fields? Which fields require to be protected by a specific mutex
> > > here?
> >
> > Yes, all the fields. adapter, notifier and funcs are all protected by
> > the mutex. See the drm_connector_cec_unregister() implementation (and
> > corresponding unregister() callbacks implementations.
>
> That's still surprising to me. Like, what concurrency source / code path
> will need to make sure funcs is updated properly? or the adapter and
> notifier?

I'll have to check, maybe we can lift that and really protect only the
adapter and the notifier. I was using ->funcs != NULL as a way to
check that CEC is registered at all (and thus unsetting it on CEC
unregistration). But maybe that's not that necessary.

>
> Maxime



-- 
With best wishes
Dmitry
