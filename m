Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9B2288C96
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 19:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746731525; cv=none; b=qFUBaxbB9uI//W504PQd0Fsw9LJugVb6Sxdb3Onp6HBGZgcMFC3R3bT/e4RNK2IWBBZJtdPHNBZPBcFh3K3ifdWwQTuKYoYpcOQqIwyvlpTJOkCivPFoWLpc4K+2VkUEz9Wxxqr+eP6K5It9GwoigZp8lS94dOhf0d2wWdoFjr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746731525; c=relaxed/simple;
	bh=qqRrtdYUgug1eFixnznCslgapjEb177D7k0ml8Ie52E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXR8vDbl3tU4WVIeJ3hNdnRRnY32VNjbD6iiQu16mO5rGY6DoZwgiqfM1JB4rIwGEhUBUCLWPEBfjy2hP3kaT8Prdg8ndQ0fAR63X+nCvXSmiNVTKRm2LodV/GZ7ke9/IqeKfBmSQ6K9Seln1W1zFXFZh2lhRNfu37YpsOi75bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=AItAtbzw; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="AItAtbzw"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e78e13d7fa7so1356512276.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 12:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1746731521; x=1747336321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTf3AI95bM3SluiF+bL7cREfN/HXYnAFwT21a0zqJvw=;
        b=AItAtbzwCKusPkqAty9lBugLQ8xbdeQLOZZJOSIdLiaOwYRP60e2AO1+SseTuR+SLY
         QMozD0K1oXMVMAcoGJNnpsVCvxWjWldHSGIWoM0A0IUsgFjmM+/T3++B7L+0x6+b1W06
         PV47lVkw1e7pE9oOJQtPgWtRmwMhiSSrCdGjARaOHYqAOeTHWIMQ3x7uHaZqxPrwoCrx
         vY6nZg9UPSCEJF7ineYcl+U/4utXINtAOtQYgIj660OmX9XfhLYr0cWUDu1NyjyiXAHX
         q9Ume7fbopYlwEdbdzVSWYDX9L+obhkgiM3IUHUBYbnwLCDT1d/+VBC7fMm/OR/1PCGL
         Zmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746731521; x=1747336321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTf3AI95bM3SluiF+bL7cREfN/HXYnAFwT21a0zqJvw=;
        b=llw9IqyB5J7MQHAf+YE6AbHeoR/LgqQaHqXFKR6pTc5y/1u55BfBkHR4GBPjWOIdvc
         PLOufeqQzY+ublllGD0teBfLIirYuyG6S3uONUQhIR/xBWgtukG7jnyKGwvnNgCd5o3t
         3lys/Id9vzo6oq+39PW20tB3F4vZdUJmbepJTNvNENYjWYwtmKc+xtybh2QYopusZPYR
         lzf8+QyYrMe64C889Bc1zjUArwO4TEfp74XdnnW503nT7+XrrRG7R11pAL1v+LGFlE+b
         daJz+q/vKZ+H1rMwLnKr8H4KDjSKSoLoiX9TbIm1Wb7zquC11MvmsmwRNPBe70g13wW7
         tCnA==
X-Gm-Message-State: AOJu0YyzXlTgY/WuYw+qyTU1c+QZMpJqEVqM2DRVh4tyM+bmSabPtGT2
	DUVbKoul0xzFWgvDpMkWjXhW/2rnZo5foq10IpyVXDYS3flVaBvRRoapVdSbETOVBfS/oSuKrYg
	Fm9GfAA==
X-Gm-Gg: ASbGnctTf5cs0J5XhZlO0V4rjI/e3VDfYIje7TTDXrtrVZW+y6QZ7dkYtJ4RvhbO1jc
	5hEn6CuQ9yiX7LVEbx0TUsWtxhDDvILl5lvueGfwd3t9prU7fxq63NdqH+ZvHvtUkF0Bv41GIEO
	1bznNojFgGk0twqh1ZT0C7gYFNlhRvmfQjxsg/uC0EZxOuySLTsiOTund5hj2fPOao6WJToh08j
	IlWzUObg9NBvyAUzOvcW2ldnWSrGKPtS5V1qFfyiFF7kU6gVcYE+ZfhTtamx9F4FUGmcUUW1/kx
	Jf3xgjY2uc4Xmq5lStngzQdlzYSr951tUIThdrXqRaMPiKBhHRYd8ZzvAkRpzJ4hu/r6PGi4QhG
	jUmfF6EVz
X-Google-Smtp-Source: AGHT+IFvbeDHF3j6vWDK2n0/teAX3/OD3OdYZqfwlq1mLCK7KzIXaFdUgchwQNCLO2uCJml3VGKsjQ==
X-Received: by 2002:a05:6902:1008:b0:e78:fa77:9302 with SMTP id 3f1490d57ef6-e78fdd4dbadmr859368276.37.1746731521712;
        Thu, 08 May 2025 12:12:01 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e78fd4a14f3sm106402276.21.2025.05.08.12.12.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 12:12:01 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e740a09eae0so1302016276.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 12:12:01 -0700 (PDT)
X-Received: by 2002:a05:6902:210e:b0:e73:2039:10b5 with SMTP id
 3f1490d57ef6-e78fdbe1809mr948464276.5.1746731520724; Thu, 08 May 2025
 12:12:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
 <20250508145624.4154317-1-tomeu@tomeuvizoso.net> <a18f214ab0487a1c562f9e2f7f66ab1345925177.camel@pengutronix.de>
In-Reply-To: <a18f214ab0487a1c562f9e2f7f66ab1345925177.camel@pengutronix.de>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 8 May 2025 21:11:48 +0200
X-Gmail-Original-Message-ID: <CAAObsKDwVB7w0mK3qkJJ-x3sOVxbcM5pbjxJk-106baaiwM=dg@mail.gmail.com>
X-Gm-Features: ATxdqUHU3XaLDR8S2zaGYwUwcL8lv1VNDzcEDTTYilVdMESYY9EBz9Cry6NW0ic
Message-ID: <CAAObsKDwVB7w0mK3qkJJ-x3sOVxbcM5pbjxJk-106baaiwM=dg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/etnaviv: Fix flush sequence logic
To: Lucas Stach <l.stach@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>, 
	Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
	=?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 7:08=E2=80=AFPM Lucas Stach <l.stach@pengutronix.de>=
 wrote:
>
> Am Donnerstag, dem 08.05.2025 um 16:56 +0200 schrieb Tomeu Vizoso:
> > We should be comparing the last submitted sequence number with that of
> > the address space we may be switching to.
> >
> This isn't the relevant change here though: if we switch the address
> space, the comparison is moot, as we do a full flush on AS switch
> anyway. The relevant change is that with the old code we would record
> the flush sequence of the AS we switch away from as the current flush
> sequence, so we might miss a necessary flush on the next submission if
> that one doesn't require a AS switch, but would only flush based on
> sequence mismatch.

Ah, you are right.

> Mind if I rewrite the commit message along those lines while applying?

Sure, no problem.

Thanks,

Tomeu

> Regards,
> Lucas
>
> > Fixes: 27b67278e007 ("drm/etnaviv: rework MMU handling")
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm=
/etnaviv/etnaviv_buffer.c
> > index b13a17276d07..88385dc3b30d 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> > @@ -347,7 +347,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, =
u32 exec_state,
> >       u32 link_target, link_dwords;
> >       bool switch_context =3D gpu->exec_state !=3D exec_state;
> >       bool switch_mmu_context =3D gpu->mmu_context !=3D mmu_context;
> > -     unsigned int new_flush_seq =3D READ_ONCE(gpu->mmu_context->flush_=
seq);
> > +     unsigned int new_flush_seq =3D READ_ONCE(mmu_context->flush_seq);
> >       bool need_flush =3D switch_mmu_context || gpu->flush_seq !=3D new=
_flush_seq;
> >       bool has_blt =3D !!(gpu->identity.minor_features5 &
> >                         chipMinorFeatures5_BLT_ENGINE);
>
