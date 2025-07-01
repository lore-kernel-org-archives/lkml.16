Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03E927E071
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390470; cv=none; b=oXNcRInkAjeG4xJkwsNaZzh0AJCwEOyWaDpfdISId1YVn0gOC/L26glKdqVcuUR6Ub9pxKUXV/IYUTZ+bIewc7jR0s68UGvZ66a0wq9wIiabJRjA1rgL8z4C4O2qKcJwXGGdSGi70tQ0e7uu5fGKMoXi2m9epZR+2l4QLMPesng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390470; c=relaxed/simple;
	bh=dWk/tkZS0CGTgxVWky6tt5aAynVh0z72TYL8nDE53fU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nwEXyPf23AvW7SSrWSLaSok+rF4mRO7cbNQ9T9UMpekKsLXSv1nxZMSrDD4eYaH8ko6JM+bKc4zSHH/w8M7QooR6+yKgmcGpW1IyZ+AFfUtAMedMVRp25YDTdmguuNelVoOhE9XnxwF7z9OE4p+Z4DsmspKVh3Pez3A7Bm8gGPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YBUIkjwI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YBUIkjwI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751390466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MVmGF9RkTyTxvlJMGRELjb+ww1NipZlYERKC83yz/Tg=;
	b=YBUIkjwI/BhfSwvPcSm8+mBQd0Nus55WP/TM55YGwasIaup3GvY2D6JT/kL2mudJI/w4Qi
	oz7L5Ol+WokR4sKKTDeBm8k2hvX8axkA/ruENTM+6jkC+Vrtwo0P86oNe3K6dCa1dYKdKo
	FU62eR6EoTL7dBezxrA7fHiKloaAzBQ=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-jZmIyjQnOFeZ4Kwbj50XnQ-1; Tue, 01 Jul 2025 13:21:05 -0400
X-MC-Unique: jZmIyjQnOFeZ4Kwbj50XnQ-1
X-Mimecast-MFC-AGG-ID: jZmIyjQnOFeZ4Kwbj50XnQ_1751390465
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddbfe1fc8fso142003355ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 10:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751390465; x=1751995265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVmGF9RkTyTxvlJMGRELjb+ww1NipZlYERKC83yz/Tg=;
        b=ASnGaS8Utw6tZqkcR0HI0Cyq3RId9Yis7i5fxTCd+pPzwZvY77slowzPZEkjvpL2V8
         UZE1D2oe3g2vdFlOYUZHS0JCM+Wwizhb/KFsTSRLQ3DGkaLR2uW3uVry9SLRY2XFGHUd
         4UuJ8zgewx0JwrObFeRvZuQUIZkkMubBMPV2MwMBZZWispHJVyf2oNnoO4mpxXRZvfq7
         j9tylSKuxDQv3h/fpnEy9X2mR48fqrLpvPKxf3t4wLBqxYSn4Lb7E7dN02ldN0bqMHH8
         SCDRgkLAS5HcBsLb65x9v37z+gGofMJ3KmvAIITicFErtFpbWJPoXodIULH2K8KH3grQ
         fXiA==
X-Forwarded-Encrypted: i=1; AJvYcCWrswU7jt40u+NGJ2A9j8dXR+k1TVxtXg/DWusVJpwqEQoicnAxPqN8MqX+mCeMqbLs84GV7URAoGaD1Iw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqQr+hOh6oYavB2iwxfSd2JJXXk0fDU82GpQnVY3WM9C2np84U
	nqe0H8v7K+Q29S9JbWnr1tVXbI9pPru0jtBhXvkNZRlWTNbO5zs03wr4ZS9i4cAZ4i5PNEBZWsJ
	JQsDx5XjpltrCiwomsVM9elKz6IkM3dkC9FeWaKS8qL3Ys8Nf3fw5OlXEFK8+4JMN7z/D6lZN77
	vPnbwWIvoNzw/3te7aTqhCPMB5HJmNT86gimR/7t84
X-Gm-Gg: ASbGncsaGDn+rzf6ZH8u4HPIfOnzcS517tPtoR32Cqztvxwgk8flfpUFz0/BHPtbg71
	smuh9wC7AnQnsLzPsll0GUmWZwAKVFvjJba9/sIjjtLtuKIj1qS4mjfu3AvrMHqdHBj1PhXEHdU
	81+tk0mcYXDRYLrB/LI4CJ8nnYTDGY7fNXcQ==
X-Received: by 2002:a05:6e02:1f85:b0:3dd:b5ef:4556 with SMTP id e9e14a558f8ab-3df4acb74d5mr246873965ab.18.1751390464751;
        Tue, 01 Jul 2025 10:21:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVFJ9ApGOqaxtagPMUOlZUSCQhwbmJ+8slVbUHrBHNy/C3A8priniKlr4mG8nwDMeilSbFpeyivXOChXrX6xw=
X-Received: by 2002:a05:6e02:1f85:b0:3dd:b5ef:4556 with SMTP id
 e9e14a558f8ab-3df4acb74d5mr246873575ab.18.1751390464404; Tue, 01 Jul 2025
 10:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701145240.105959-1-desnesn@redhat.com> <CANiDSCs_Pz-wgnYNVA7Zt4RhtgN256i32aCw0mE4XFv3b49ygw@mail.gmail.com>
In-Reply-To: <CANiDSCs_Pz-wgnYNVA7Zt4RhtgN256i32aCw0mE4XFv3b49ygw@mail.gmail.com>
From: Desnes Nunes <desnesn@redhat.com>
Date: Tue, 1 Jul 2025 14:20:53 -0300
X-Gm-Features: Ac12FXw_YKCphN3F3DlNdnjowckBLusvxuY6xIti8AU5zLzE_L5hGQ0WO8m0PDw
Message-ID: <CACaw+ex_T5xS9rw1651TV_z1myXxPGmtpeEB4HWA7S0xU+C9GQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: avoid variable shadowing in uvc_ctrl_cleanup_fh
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ricardo,

On Tue, Jul 1, 2025 at 1:48=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.or=
g> wrote:
>
> Hi Desnes
>
> On Tue, 1 Jul 2025 at 16:59, Desnes Nunes <desnesn@redhat.com> wrote:
> >
> > This avoids a variable loop shadowing occurring between the local loop
> > iterating through the uvc_entity's controls and the global one going
> > through the pending async controls of the file handle
> >
> > Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM counter=
 per IOCTL")
> If you add a fixes you need to add
> Cc: stable@kernel.org

Thanks for letting me know

>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/u=
vc_ctrl.c
> > index 44b6513c5264..91cc874da798 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -3260,7 +3260,6 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >  {
> >         struct uvc_entity *entity;
> > -       int i;
> >
> >         guard(mutex)(&handle->chain->ctrl_mutex);
> >
> > @@ -3278,7 +3277,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >         if (!WARN_ON(handle->pending_async_ctrls))
> >                 return;
> >
> > -       for (i =3D 0; i < handle->pending_async_ctrls; i++)
>
> nitpick: I would have called the variable i, not j.  For me j usually
> means nested loop. But up to you

Noted - I used a different variable name because I wanted to
differentiate the loops.

>
> I am also not against your first version with a different commit message.

Third time's a charm then!

Will send a v2 with the first version having this commit message.

Thanks for the review Ricardo,

--=20
Desnes Nunes

