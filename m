Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3CB1898F2;
	Fri, 31 Jan 2025 16:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738342423; cv=none; b=sZI4WAeo4NE2xHh00NuSrjCEs8DIGPgoM8knFDE1NNkGj3/e8KU6KRC6lCH15Ud7aCxTJhZrdQmoNypNWV1GrJCgO280rHosKrlpBdF92qkKvqbqaRHJ1WZHlfZQmaiwNV7EPz5dVcaJ28rVi16mm8hivUpEd6MuWaUVbLb0vVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738342423; c=relaxed/simple;
	bh=GfPTCIyEX3fVDi9I9BIqRlm84MEenHyEpADd5wVZavc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsysAsC6TFRP+4Mlw/DHum0XrEkBjP/bPJPw6RdCX5QlFFn4avhADM1tRhrCh4PRT/Cr8V8hm8H47VIz4SJ6JAFEZSke0ZV6FNI2IxK/9+nBTbtB8WichhPdPoa9QvKyCB6DKnSFe8T3/LeZASfUK4L5uZ5/GQENzjewLVUUkiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYEPy8N+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYEPy8N+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43634b570c1so16670805e9.0;
        Fri, 31 Jan 2025 08:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738342418; x=1738947218; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YXuudxqXFyd2ufToANT9YRFIa9qwUxwKQHhEaI7Gs+g=;
        b=IYEPy8N+46oQMDWiJ/AH70iAdhPJ0LmE2CtH/lqx5jAxzG6jgfcdQ3PiD4s0yX1sO7
         JrS7MDyodDnxUYUsShxQq0w07A/Cq5vIP5EY9tVb5+LgMJ1CD69Lik5N7zvqauWYVWNu
         cXx4qtF9nUU2p8Hyjon3FkVNfKnR8bErAmdpHpV2lOlyqvcHWJ3CRSlGHTfI7UJt48fG
         NecK+a/mTvQ4VQSaS02/xtPmZHpFli5O5ZRwfoqsREd+93OCwyfIzBdquh4DIlq/204M
         QsSLbZJ3BX4caYN4BMiMYeWv1V9BSNqZTq7NFaKob7fNqk++aXXCOFCvqiDmdx5kJ7ni
         8A5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738342418; x=1738947218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YXuudxqXFyd2ufToANT9YRFIa9qwUxwKQHhEaI7Gs+g=;
        b=heFIUBnTqJpk1t4pN0GlOTfDHApk/ULg4ZfTJtBNoQJlfQE0AtqZkYjuImm8/FCT79
         ELDwf4RiQ7iH6RgEFY/+KlBe6eSYIg3HtyWww7jsHqn7jkr9PMiS6onmrP7KUcQg4Qei
         +co378WvREWj2Gc0JkmTQDrLbXkCBRQqDcliF+POP9HtNeS0mPJ9bToEksbJGemzqnA6
         4eGOYDkVqNMkbh6EScAork/YWJOwElz21dtRjD+5StEmTeIlAO5GlPPX23BlWMJZXeKw
         IQCVbkw33lc9M0HR7GEBb0q3hhyLe9dSM0SnFR6530yx/ky0WSw2bsHUX9j6Kbw9IOqv
         pXJA==
X-Forwarded-Encrypted: i=1; AJvYcCW+uiQl9DgvcFAnk2h2VTclkX02eBZUsyZDG+z+bVtvPUxlh/KUcnh58Biqwnu1bpacZmSN6aizY7S8mtPY@vger.kernel.org, AJvYcCXvmDPHJfFYU5pFbvTx9zFQ2K07yEsqMPdTwm/gsdgJf1r6hYayt9bSe8L80WYWBcPseGO2Xhce6C4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye/T1Kz7mLqbvtG7yGfGrI7wZ5zyOex0PkkeK4pT1n/Zc3Na0C
	WbTFdn5F1KOwxQpdr9xV6m5/HZxozZARBJ9hHmgj1dAlDBYU4teg
X-Gm-Gg: ASbGncuriI9kUw/U1RRGgrtN4t/OGdKxkI+Q1xNSLuOBiPVIPLV7r1Poo+BqdDKfgfJ
	OqKWcWQE/lf1CkY37es4nTG2VEcOqIOABedtaxjYby3yTxNIxjG7wTtr1lZLE6HcaflYzYZNztu
	h2sBOiveT8XV9SGV85U7ZjGuQ4vAEORgwdnEjsh8pWMqgUySykjfFTXxB3vtI74dlTE/Z1ssNef
	P/A6YMPFbvwm8Mn+nRWA0NfQL1oegKyzRwelcm9Js3TwwURHbfIWwisQwvXVBckkEMbgtOa2/ER
	1tSsv7GjkQinLQ==
X-Google-Smtp-Source: AGHT+IEDMPcLKLxTsK429xwikfWJydkdpUp8S6fPh9gbuoI7xNoBf2p2vOuUzRbf4VSVoFtOdv6iqA==
X-Received: by 2002:a5d:59a6:0:b0:38b:f3f4:57ae with SMTP id ffacd0b85a97d-38c51949b97mr11501948f8f.10.1738342418101;
        Fri, 31 Jan 2025 08:53:38 -0800 (PST)
Received: from fedora ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b61f1sm5205377f8f.68.2025.01.31.08.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:53:37 -0800 (PST)
Date: Fri, 31 Jan 2025 17:53:35 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: airlied@gmail.com, arthurgrillo@riseup.net, corbet@lwn.net,
	dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
	jeremie.dautheribes@bootlin.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	mairacanal@riseup.net, marcheu@google.com, melissa.srw@gmail.com,
	miquel.raynal@bootlin.com, mripard@kernel.org,
	nicolejadeyee@google.com, pekka.paalanen@haloniitty.fi,
	rdunlap@infradead.org, rodrigosiqueiramelo@gmail.com,
	seanpaul@google.com, simona.vetter@ffwll.ch, simona@ffwll.ch,
	thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: Re: [PATCH v16 3/7] drm/vkms: Drop YUV formats TODO
Message-ID: <Z50AD91RnzK2lWSd@fedora>
References: <20250121-yuv-v16-3-a61f95a99432@bootlin.com>
 <20250131084045.2874-1-jose.exposito89@gmail.com>
 <Z5zJ1h91AINbQRVF@louis-chauvet-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5zJ1h91AINbQRVF@louis-chauvet-laptop>

On Fri, Jan 31, 2025 at 02:02:14PM +0100, Louis Chauvet wrote:
> On 31/01/25 - 09:40, José Expósito wrote:
> > Hi Louis,
> > 
> > Thanks a lot for the patches.
> > 
> > I'm not well versed in YUV color formats, so I did my best reading the kernel
> > documentation before reviewing this series... But I'll most likely ask some
> > basic/dump questions.
> > 
> > > From: Arthur Grillo <arthurgrillo@riseup.net>
> > > 
> > > VKMS has support for YUV formats now. Remove the task from the TODO
> > > list.
> > > 
> > > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > >  Documentation/gpu/vkms.rst | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> > > index ba04ac7c2167a9d484c54c69a09a2fb8f2d9c0aa..13b866c3617cd44043406252d3caa912c931772f 100644
> > > --- a/Documentation/gpu/vkms.rst
> > > +++ b/Documentation/gpu/vkms.rst
> > > @@ -122,8 +122,7 @@ There's lots of plane features we could add support for:
> > >  
> > >  - Scaling.
> > >  
> > > -- Additional buffer formats, especially YUV formats for video like NV12.
> > > -  Low/high bpp RGB formats would also be interesting.
> > > +- Additional buffer formats. Low/high bpp RGB formats would be interesting.
> > 
> > I see that you implemented support for 6 DRM_FORMAT_NV* formats, but
> > DRM_FORMAT_NV15, DRM_FORMAT_NV20 and DRM_FORMAT_NV30 are not implemented.
> > 
> > The same applies to DRM_FORMAT_Y210 or DRM_FORMAT_YUV410 among others.
> > 
> > Could it be useful to implement all of them in the future? If so, should we add
> > it to the ToDo list?
> 
> I don't think we need "all of them" (there are ≈100 + all the modifiers), 
> but definitly all the commonly used ones (I have some of the "common" one 
> ready here [1], I just wait for the YUV series to be accepted to avoid 
> conflicts).

Good to know, thanks for the clarification. I think we are good with this
to-do item as it is. There's plenty of work that can be done :)

Jose

> > It might be a great task to get started in kernel development, as there are
> > already similar examples and tests.
> 
> I don't think we need to specify which format are missing, the point 
> "Additionnal buffer formats. [...]" seems sufficient. If you think this is 
> relevant, I can add "Easy task" so beginners will find it easier?
>  
> [1]:https://lore.kernel.org/all/20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com/
> 
> > >  
> > >  - Async updates (currently only possible on cursor plane using the legacy
> > >    cursor api).
> > > 
