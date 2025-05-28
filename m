Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01A320458A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 18:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455573; cv=none; b=fPhpJIWOtT7cuSR+vXCjxcAhwOIR3krvGEAMKSAbMHdsTMZs+8SJ12vaCoXeTl8SHNfU8ZaUHubS2q6UVbEDsgO7RvI6FXAMbq7rbIuOIp5CKFvl5H400ZSQVb+Pwx43IlcB9VKPW/U6WjNtl+FS7AZm9YoLg38CICzX0SsoIbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455573; c=relaxed/simple;
	bh=VRd1lkT9N5ACH+1BjDwXdFBCq75yta6YVidqEhnw3us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eIWU/4NhhI1XLInYLGaZIDXStoS4UVYBOe2+6FjNQVYqKCd8y34dQodgr0Cj7ziXUUxjHDWVgIev/pCg5aO5knoZb+kQdvzY8c0M/xkOMFI6nR5xWsWXT31FOlk0xV23QTZ7grHuzsTRuIwJau7xYx6MzYm+R2fSl+/L+nyuY2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L5G4AwX9; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L5G4AwX9"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2349282084bso1860455ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748455571; x=1749060371; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V+fgzLhtoA+AV7JPQdrF/lZ8VWpagMNnkYPcAKrhW+k=;
        b=L5G4AwX95c2PoEuPtyhKEiy2TDc7+q6vD69iWF6eZc7Tk5OCpGYmrU4P2RA/DN4Zuk
         kLHXZRUlDd4RrpwXA3cHwdwHzNXDSsMLatXcF2/jCcNn0gKuSXxw2YI56Geo2maQkc+J
         6VAwo3Osx3ZiT971UMGPvrBf06tGxNp3i5r2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455571; x=1749060371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+fgzLhtoA+AV7JPQdrF/lZ8VWpagMNnkYPcAKrhW+k=;
        b=cgj/iwPpLz2R3YVCpkF1iMbY8gQ8MWg0TuRV65uvhH6xgdh9+RzqEyxVTYFCWbMBBD
         1lAvSg2novFyRSX2TKtc/tlahH2Wr7ptu/v6aUGm4W5nCzBI5h4yXgSCWElV5dSxYS67
         eHiXRqNb82/QlTgvnf3s8vOztr9EOBkPPlJS8Jxl1TT1+DOw2Kf2UqHksJlTklicKSZg
         DDRmHAvYBeGupvshz/e30FabUYqbFkFRiMyqqlwEtuPx86+q3hWg9WIhrinhZfF01iov
         ItbpnZKwa/oObI4BObleKTH9GPiqrO/QFaj2za/HZeJPI51B6/fkrnhw+yK62J4j5Ale
         baFg==
X-Forwarded-Encrypted: i=1; AJvYcCXMxlTAH1CQsUbO3RG1oW1GMGDlUeuiwA/QF1ZqOJ81EnGn6r85wcZJuESv+5c9005xcGe0nFhuzC6TZSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfdlObW1q2RLVVkNFsu108jmDoSceaPyUjU1xCdzCWwYcytZ07
	mFqAxCCSyUDomI1oQvsfHeALxXDnzAc8Mj+nQST4xsT1kydxuteOKsEjA0g/Xw+zNpQ55agCPpz
	/TAVR/KXI
X-Gm-Gg: ASbGncvcWERUla4sFAyWujCCTqfqVQdnyNXEEsxSKsKlHo4i8PbvO6ztUP+T0m4+Jee
	ZEH/1c1fpEWLZerZl2gKOKshwPS4JSONKqGr7XVpfhstEUjiA48iozCeYy8963uzdu+X1KSTUWi
	VTt7kTDntTBvK3bS8glgBdbtXa3SHRsv+QX3Hn5/X5mE8T2uEtTzP3kMzkTx5zlKgriUyco9kTT
	h5PLMYL6ASAJCVBl+grDum35QWbVNEwetKcUXvdCzOHYc+/LbQFvKtK3F3Jp0UJ5rqzECcKe1Li
	ZrF+dTPGQbV599Wi5dQVs3gq3i80SJ05FV0rNcdgeX//eCklzTVUnscKIm/k+CDq9+awJKOSyXx
	mNeBYzRQLVxGeLvbI2A==
X-Google-Smtp-Source: AGHT+IE0MbcL7TCwRAJqHBFLnBzuD7OWqOUxL6t6VrEH0kdYZvzZFqAYUKIm3J6LXZPT04e+9H+S+w==
X-Received: by 2002:a17:902:ecc3:b0:234:d7b2:2ab2 with SMTP id d9443c01a7336-234d7b22bb6mr35506185ad.8.1748455570906;
        Wed, 28 May 2025 11:06:10 -0700 (PDT)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com. [209.85.215.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d35ac75fsm14640865ad.167.2025.05.28.11.06.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 11:06:08 -0700 (PDT)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b2c40a7ca6eso149184a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:06:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbmyiYWSXxGmWLNkc35dE8DMPGgqITZE7kUh2JInu9DQTfnYOvivSracBKM/9g+7w9IY4SOabTthE/7Lg=@vger.kernel.org
X-Received: by 2002:a17:90b:1e11:b0:311:fde5:e224 with SMTP id
 98e67ed59e1d1-311fde5e3a7mr2621369a91.6.1748455567945; Wed, 28 May 2025
 11:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
 <20250327-uvc-granpower-ng-v6-5-35a2357ff348@chromium.org>
 <64c00146-e6d2-448d-a416-19d5ae7ae3f6@jjverkuil.nl> <CANiDSCvM_V0Pv+cxd31AwcXjG-etJ3imsDYfRb7W2t0NKT67OA@mail.gmail.com>
In-Reply-To: <CANiDSCvM_V0Pv+cxd31AwcXjG-etJ3imsDYfRb7W2t0NKT67OA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 May 2025 20:05:50 +0200
X-Gmail-Original-Message-ID: <CANiDSCv6vb=o-gizVr33XX2sVfBookaze2S1hkzshUyNNnzTbw@mail.gmail.com>
X-Gm-Features: AX0GCFtPgVMd2juZVahO7Uk3bU64vKS_xa1UhEfT0crKE5AC7K-BWl6NWKkoiUE
Message-ID: <CANiDSCv6vb=o-gizVr33XX2sVfBookaze2S1hkzshUyNNnzTbw@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] media: uvcvideo: Do not turn on the camera for
 some ioctls
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 15:51, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Hans
>
> On Fri, 9 May 2025 at 15:44, Hans Verkuil <hans@jjverkuil.nl> wrote:
> >
> > On 27/03/2025 22:05, Ricardo Ribalda wrote:
> > > There are some ioctls that do not need to turn on the camera. Do not
> > > call uvc_pm_get in those cases.
> > >
> > > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_v4l2.c | 20 ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > > index 0f1ed0387b2611c8d21e211afe21a35101071d93..668a4e9d772c6d91f045ca75e2744b3a6c69da6b 100644
> > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > @@ -1440,6 +1440,26 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
> > >       struct uvc_fh *handle = file->private_data;
> > >       int ret;
> > >
> > > +     /* The following IOCTLs do not need to turn on the camera. */
> > > +     switch (cmd) {
> > > +     case VIDIOC_CREATE_BUFS:
> > > +     case VIDIOC_DQBUF:
> > > +     case VIDIOC_ENUM_FMT:
> > > +     case VIDIOC_ENUM_FRAMEINTERVALS:
> > > +     case VIDIOC_ENUM_FRAMESIZES:
> > > +     case VIDIOC_ENUMINPUT:
> > > +     case VIDIOC_EXPBUF:
> > > +     case VIDIOC_G_FMT:
> > > +     case VIDIOC_G_PARM:
> > > +     case VIDIOC_G_SELECTION:
> > > +     case VIDIOC_QBUF:
> > > +     case VIDIOC_QUERYCAP:
> > > +     case VIDIOC_REQBUFS:
> > > +     case VIDIOC_SUBSCRIBE_EVENT:
> > > +     case VIDIOC_UNSUBSCRIBE_EVENT:
> >
> > Wouldn't it be better to check against the ioctls that DO need to turn on the camera?
>
> I thought it was safer this way. I will look into inverting the logic
> in a follow-up patch.

https://patchwork.linuxtv.org/project/linux-media/list/?series=15601

>
> Regards!
>
> >
> > That is more future proof IMHO.
> >
> > If a new ioctl is created, and uvc implements it and that needs to turn on the camera,
> > then presumably you will realize that when you add that ioctl in uvc.
> >
> > If a new ioctl is created and uvc does not need to turn on the camera, then you will
> > almost certainly forget to add it to this list.
> >
> > I'm not blocking this patch, but I think it will be hard to keep this list up to date.
> > Inverting the test is probably much easier to handle in the future.
> >
> > Apologies if this has been discussed before, if so, just point to that discussion so I
> > can read through it.
> >
> > Regards,
> >
> >         Hans
> >
> > > +             return video_ioctl2(file, cmd, arg);
> > > +     }
> > > +
> > >       ret = uvc_pm_get(handle->stream->dev);
> > >       if (ret)
> > >               return ret;
> > >
> >
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
