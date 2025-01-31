Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA19322B
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738315868; cv=none; b=YrcKZQyCSddkxjzdaGRM0ErT3bxOFXp/wjcK/q2GcMuuCtFIj7MnvZNGxrPrVCtbj6fZUgYsO1ImWdRRXX5pv6Q1thrsgbycKzOr7To2f+5llt7rtsFtN0Do3Ny125LJtv17uCRTORa8oIKKBhFAd//O77FdsrZyhnh+eqNZOuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738315868; c=relaxed/simple;
	bh=+BPCj0EvreF9HzCQSLakcz/xSVgAiiPSEwml+vItrlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1rC3GW2uz4xHzIRweMEu5FvSDxVHMjAeU6Yi/ySJ1fBgRhLaTUdEGXlKBfwo3UmtWingFiojiVnUKjPUkMF7UjcY2e9D1C1iHzQkHd1pBFAn7idlAzQFPih/p0OWKtM0R6DmBN8Vzxxz09nauwe8PPDA8TbBtzsMXebqxhB10k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOkk2PxT; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOkk2PxT"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso1354861f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738315865; x=1738920665; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1kxhzuUeglb9nFORXt7iPwS4YLKVU/NOi7k6DS6FShc=;
        b=XOkk2PxTBTy0L/401+CqD6ZOKXlpWzIKF9fwNIGhxdByr4m62aHd7O0zaLFayc9aIJ
         QyEk8vW1dLUKnUIDkmhSCp+bcyEdiOtUSqJNaFhcEbW6n6BBEpZ+NTaclkEMzT3DB5KO
         JC1D/TFuy7LyFHPL7IdDFIeaQWP1KNeABU2LJVcydg+Z4+pZS2qlXmj6fHJlvjuba1r6
         Dn+stsgCPccunJpPUGEA8joNC/UW05U46D6y2B+K6ocWRmIeW4nQoTas+tYhC3vTIMmZ
         3hhiJ4Ds5jUFA6uEgLtvvCy0Xuos6bjjBoRu3p6bDRnkmNqQ44L7VkWSfGv6iXrHSRxr
         Zy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738315865; x=1738920665;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1kxhzuUeglb9nFORXt7iPwS4YLKVU/NOi7k6DS6FShc=;
        b=w93jSTLocXVC7MwPzN4mhytQDCBtdXXkNKuaZb8bvlFqP7Q8MNuuaV48C7n7Db0hyx
         f7OGfmSb0DP95gQiDJ5xLBLbiUmQfxX9KSf+RF2owpjsAQuAVIddeWHpClmVxhih+axY
         2owZcDDVTkjBcCTRC31z1HsgpQgY56kNPl7jXBgFzwcZbThWnaNofPAjsHM1sHUTfPgC
         YJFsvci+1Fu955fmz8g1WX1KKAjeF8n2sl5312kiTzETWNdX11nKPY5IzLoHhQQZ6Uw+
         iYPg4DRgX7jvI8AJbAm9zjjVC2mTe35+SxMaJ4c8Mch6dDNh3/um7YFctQVp3ZNdMBFN
         punw==
X-Forwarded-Encrypted: i=1; AJvYcCUqnrJGvCmed5VjLMRiY0ChFeVtuXubjv5xpdLOSkLu9UkbN+5ig7SpaaGwVSF5ORuYJEZf8xHveqcj/E0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFGeJ+P8JhHxl4LlLk9jgh67Dk2HasXLuNp66efQ+z3jWaqyRQ
	25cgsQXrd+EoC6wYZEaLK+2cr4Ovs048CnTfKFGQLGXgdRx9W4le
X-Gm-Gg: ASbGncsbMHCrVaoRquls966icBRA4B1Ad2bYm72m9/4nbyeZH/q4YwKPg35eRci306a
	phEhxZS9qbpT7U3s1OvubK9O7fM/F7W/AkuzXIIM7SLHFri2vUMDWP4dhTKsNNaNU8DZ4k3W50R
	0uqhLCKh7gJWW6tWt1cJUjLD/auILo8cslA97ZkPoGuATm4PSLUgWVkpHJmTml6TGEFxA/iVJSj
	TjNsDWbHwyA/AGNrJ07s8BUpLvI6MK68VLmsDuXjDyV8i0u+E+whcDijFtdW7Ni9olUruW2X7Xy
	cTkmMbaCKyxmPA==
X-Google-Smtp-Source: AGHT+IHs4EJTjlgvHff8M6ItcijQQShzwQxvg3UpEeMc06NagqBZCDdIDmq3gNcF/MGKtJx8mML5Bw==
X-Received: by 2002:adf:e6cf:0:b0:38b:f04c:25e6 with SMTP id ffacd0b85a97d-38c519447bdmr7328486f8f.14.1738315864499;
        Fri, 31 Jan 2025 01:31:04 -0800 (PST)
Received: from fedora ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc26d6fsm83654125e9.14.2025.01.31.01.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 01:31:03 -0800 (PST)
Date: Fri, 31 Jan 2025 10:31:02 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] drm/vkms: Allow to configure device
Message-ID: <Z5yYVov9_z6CDU46@fedora>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <Z5uDGr445jEfdt5L@louis-chauvet-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5uDGr445jEfdt5L@louis-chauvet-laptop>

On Thu, Jan 30, 2025 at 02:48:10PM +0100, Louis Chauvet wrote:
> On 29/01/25 - 12:00, José Expósito wrote:
> > Hi everyone,
> > 
> > In preparation for ConfigFS support, a flexible way to configure VKMS device(s)
> > is required.
> > This series adds the required APIs to create a configuration, the code changes
> > required to apply it and KUnit test validating the changes.
> 
> Hi José,

Hi Louis,

Thanks a lot for the quick review!

> Thanks a lot!
> 
> This series is amazing and better than mine on many points. I have few 
> comments:
> - a "strange" naming pair: add/destroy (I expect add/remove or 
>   create/destroy like other function in DRM)

I used "add" because the function creates and adds a display pipeline
items and "destroy" because the opposite function removes it and frees
its memory, so I wanted to emphasize that the action was destructive.

However, I don't have a strong preference about the naming. If you
prefer another pair of verbs, I'll be happy to change the function
names.

> - usage of "complex" list accessors, can't we just create iterators?

Yes, on the first iteration, I used the underlying structure: list
iterators for planes/CRTCs/encoders/connectors and xa_for_each for
the possible_* items.

However, I found 2 main issues that made me rewrite this code:

The first one is that, if in the future, we change the internal data
type, we'll have to change all the code using it. On this way, like
I did with all the other vkms_config_*_get_*() functions, the data is
encapsulated.

The second one is vkms_config_get_connectors(). Unlike the other
functions, this one filters by connector enabled status. If we let the
caller do the filtering, we'll duplicate that logic.

Because of these two reasons, I decided to add a getter for lists.

> - should we use pr_err in vkms_config_valid?

I think it is great to show to the user a reason why their device couldn't
be enabled in dmesg... But I'm not sure if there is a better way to do it.

> > Louis Chauvet and I are working on ConfigFS support. In this series I tried to
> > merge his changes [1] with mine [2].
> > I kept his Signed-off-by to reflect that, even if I show up as the author of
> > some/most of the patches, this was a joint effort.
> 
> To avoid confusion, you should add the Co-developped-by tag, so it will be 
> clear that we worked together on this.

Good point, I'll change it.

> > I'm still polishing the ConfigFS code [3] and its IGT tests [4] (connector
> > hot-add/remove bugs) but the IGT tests also exercise this series and can be used
> > for additional test coverage.
> 
> I will take a look at those series. For the connector hot-add/remove, do 
> you have any example of usage in the kernel? I did not found anything in 
> the documentation explaining they are hot-addable.

I pushed a couple of WIP commits to the kernel and IGT so you can see/test
the crashes and hopefully share some ideas.

About the documentation: I didn't find much information other than a few
mentions to hot-add/remove. However, in one of my rebases, two new functions, 
drm_connector_dynamic_init() and drm_connector_dynamic_register(), were added:
https://patchwork.freedesktop.org/patch/628418/

I'm still trying to make them work, but I think they are what we need.

Part of the crashes happen on the cleanup of drm_client_setup(). Adding a
connector adds modes in the DRM client, but removing the connector doesn't
remove them and, on cleanup, I get a NULL pointer.

I'm a bit stuck, so help or tips are very welcome :)

> Thanks again for this series,
> Louis Chauvet

I'll look with more time into your comments in the other patches next week.

Thanks,
Jose

> > Best wishes,
> > José Expósito
> > 
> > [1] https://patchwork.kernel.org/project/dri-devel/cover/20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com/
> > [2] https://patchwork.kernel.org/project/dri-devel/cover/20240813105134.17439-1-jose.exposito89@gmail.com/
> > [3] https://github.com/JoseExposito/linux/commits/patch-vkms-configfs/
> > [4] https://gitlab.freedesktop.org/jexposit/igt-gpu-tools/-/commits/vkms-configfs
> > 
> > José Expósito (12):
> >   drm/vkms: Extract vkms_connector header
> >   drm/vkms: Add KUnit test scaffolding
> >   drm/vkms: Extract vkms_config header
> >   drm/vkms: Move default_config creation to its own function
> >   drm/vkms: Set device name from vkms_config
> >   drm/vkms: Allow to configure multiple planes
> >   drm/vkms: Allow to configure multiple CRTCs
> >   drm/vkms: Allow to attach planes and CRTCs
> >   drm/vkms: Allow to configure multiple encoders
> >   drm/vkms: Allow to attach encoders and CRTCs
> >   drm/vkms: Allow to configure multiple connectors
> >   drm/vkms: Allow to attach connectors and encoders
> > 
> > Louis Chauvet (1):
> >   drm/vkms: Add a validation function for VKMS configuration
> > 
> >  drivers/gpu/drm/vkms/Kconfig                  |  15 +
> >  drivers/gpu/drm/vkms/Makefile                 |   5 +-
> >  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
> >  drivers/gpu/drm/vkms/tests/Makefile           |   3 +
> >  drivers/gpu/drm/vkms/tests/vkms_config_test.c | 782 +++++++++++++++++
> >  drivers/gpu/drm/vkms/vkms_config.c            | 784 ++++++++++++++++++
> >  drivers/gpu/drm/vkms/vkms_config.h            | 479 +++++++++++
> >  drivers/gpu/drm/vkms/vkms_connector.c         |  61 ++
> >  drivers/gpu/drm/vkms/vkms_connector.h         |  26 +
> >  drivers/gpu/drm/vkms/vkms_drv.c               |  45 +-
> >  drivers/gpu/drm/vkms/vkms_drv.h               |  17 +-
> >  drivers/gpu/drm/vkms/vkms_output.c            | 255 ++++--
> >  12 files changed, 2337 insertions(+), 139 deletions(-)
> >  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
> >  create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
> >  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_config_test.c
> >  create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
> >  create mode 100644 drivers/gpu/drm/vkms/vkms_config.h
> >  create mode 100644 drivers/gpu/drm/vkms/vkms_connector.c
> >  create mode 100644 drivers/gpu/drm/vkms/vkms_connector.h
> > 
> > -- 
> > 2.48.1
> > 
