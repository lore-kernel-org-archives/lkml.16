Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C486327E1D0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388307; cv=none; b=gq09XQkPNJJms719jNXbYnvUql5C9uHbJW+xCn5Y8xDVRSMwrSB2g3DHiz0hYbQNsMdcNZuF+0n1CIUreQuV1X2eUTbSN3isx8gP+LbSusgFwS/our76zvQSjS/w8Z3gUlDvjrATgI8UWX1xgnIDep+ODc047ECAlr0n9ukWd6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388307; c=relaxed/simple;
	bh=bH8UpUP29svtEV9nHFedwW7yl9IehZ+zkvLo0Bhrpac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChmkTfghA1rzOIP8Wk/tjWjXV1seRbMBJUKzz18tWiGPXydTVJgHkNTTKvop8AL7iMkcg0xr5jLNuBMh6dlY+cP0RnNsSaSnm/jAu4Wx4OwbvRP4f+96HMQbGozzwY5D1Xqky54Hc1fgVxFLd1+vRsQa5QTp/iOFVEapIjBP4w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8tVKDJT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8tVKDJT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d6ade159so24746395e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751388304; x=1751993104; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4hKOgFRyrKvN6yRkfPdIZSR+Sh9Aho8zTiYbOui/IAA=;
        b=i8tVKDJTrieQAi+6apLkCiObx6SWy+HECXiugvzOVJW2RBI8T7arL2kmBGfd6P/hLr
         uAXIZkSUItEvO5FeoGYaB2l4t3qfiz06K6CI8wcMyXR3knfo8JtSH5nwK+HscYSk0c39
         /pFRKS0H2zHd1XWjVytL96ra3NT5bjNanlrftW6lJgaxFX8tV3vufj65Yh0BMtUybcLv
         Ux0zOlZGDFreCfupopK8NPYCSpTFfVpVOC0gSFTg54gTqCOM7yl1OszRUFXQs5kaeidO
         tJEqSZZ/eCINhGFYtOYF/PJq+oiHYA4ZZlTLwHoTmajgwbskZXUqI1Vsk9ONbtrMq6xa
         Er2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751388304; x=1751993104;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hKOgFRyrKvN6yRkfPdIZSR+Sh9Aho8zTiYbOui/IAA=;
        b=JIhgOwDxn0xClUVjxlMGfgFNb9OZE1duARp8oCdh+OYQ6N9wABgbAy5lPa17rXKb/n
         5I2jSF2szE8b7ZNNFVBS3CZK8+kMTuRddOKEOGwPFmiXQTO//Xj0BwmwYHv/HaTNXsyg
         e3eIPq1iqSBsjaNEMuqlDzFpehOn9WUESq+lwJu2PdXG/oBp/gfTi2nOCsTtvClb5853
         xYfA4xfsDfWA9YYa2w+MAmH5v7gMs1ACdwm2ByVReuDGNfueS4vdXfvT+/peVwWIpWQn
         O3O9BNCa6jS8sNqHDumiGCLbisbS3O6dtCfAa96wLvRUONtmGimISPAF4mfhdC7OiYhq
         kj9A==
X-Forwarded-Encrypted: i=1; AJvYcCUt3lcS0vk7FJd4VInmgBC8BkHxedy0aCNAkh4POTKAQ0ojH39jZcbgCEkilOY6Kg+1eZ6jxIAaLt9KoA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWBp4t8WWm+f4a3IBOLu3LmiMUMUUdHRHhujmLwYAiqBaKApTq
	bOphIRTSPNDzuPeYBDdDYfhmeg3fjZDqvql18ISUrMk2iNxq1mZw0uXJ
X-Gm-Gg: ASbGnctDQVQsYmWUkG7fcS5yj+fkz7q+fLHxbmpCkrNws8ZmquQiySsbX/SG+cjiYRb
	jUixcf55snuezonVbLbD9EBPuw9+dZ890KTkxQDy29715Rnx9+aCpBvphEfBzLz520/qm81/0w7
	yQWlvnAQ4uK5QS58Y/W/f9faUMT0UHh3IsO425L5okePKFzuxoXJvkN9xGaYXfxvXyf9imjaYxA
	1RX/nXHQEsLXT3QPyv4nGfgMGTFHEx99m4shHdx6wlCFR8qCvJSBnh9QTZpSoGb3xYNZ8hSD38y
	h13NeLy5SskGEcjxE4BANe5iDtpge4oLBVxEDWcS1EDqQAAkJO9ful3RiPM=
X-Google-Smtp-Source: AGHT+IG1z6GBA6ZOBEYtIe0WmFkvvXf7ObumyBaaSDScfclwPT6cObKXoKOx+J5NUqkR/o4xYrlWKQ==
X-Received: by 2002:a05:6000:4615:b0:3a4:eed9:755d with SMTP id ffacd0b85a97d-3a8f577fe74mr14565833f8f.3.1751388303734;
        Tue, 01 Jul 2025 09:45:03 -0700 (PDT)
Received: from fedora ([94.73.34.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ac6ee0d0b9sm8077315f8f.18.2025.07.01.09.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:45:03 -0700 (PDT)
Date: Tue, 1 Jul 2025 18:45:01 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	lumag@kernel.org, cristian.ciocaltea@collabora.com,
	gcarlos@disroot.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/tests: Fix endian warning
Message-ID: <aGQQjTUrG8-p8qAC@fedora>
References: <20250630090054.353246-1-jose.exposito89@gmail.com>
 <6c2e44cc-c01a-4331-b139-152ccdbd0401@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c2e44cc-c01a-4331-b139-152ccdbd0401@mailbox.org>

Hey Michel,

Thanks for looking into this.

On Tue, Jul 01, 2025 at 10:22:13AM +0200, Michel Dänzer wrote:
> On 30.06.25 11:00, José Expósito wrote:
> > When compiling with sparse enabled, this warning is thrown:
> > 
> >   warning: incorrect type in argument 2 (different base types)
> >      expected restricted __le32 const [usertype] *buf
> >      got unsigned int [usertype] *[assigned] buf
> > 
> > Add a cast to fix it.
> > 
> > Fixes: 453114319699 ("drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_xrgb2101010()")
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >  drivers/gpu/drm/tests/drm_format_helper_test.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> > index 7299fa8971ce..86829e1cb7f0 100644
> > --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> > +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> > @@ -1033,7 +1033,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
> >  		NULL : &result->dst_pitch;
> >  
> >  	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
> > -	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
> > +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> >  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> >  
> >  	buf = dst.vaddr; /* restore original value of buf */
> 
> It might be cleaner to use two separate variables instead of using "buf" as both little endian and host byte order. (Same for patch 2)

Yes, however, the same pattern is repeated 10 times in this file.

What do you think about fixing it in a follow up? I don't think it
should block fixing the KUnit tests.

Jose

> 
> -- 
> Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
> https://redhat.com             \               Libre software enthusiast
