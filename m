Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2890B283FF8
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798725; cv=none; b=C7CcZTQCucxJmS9UsiJYffnX9rHC8W+CNcC+DrVXWeZtBAgwH4rp7J79c0IffOqVGZOog5F9g84VysV/gmc4JFkMX/hhlFt4Mpg+5MEty05pKkZvW36zQqqKL9LTrnt8fEXvcVBrO31JORlHzqf+/q/SRykYK4VN53h1vEz+/+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798725; c=relaxed/simple;
	bh=xSi3SQWrLWCR+2uoRJltv4xcKkEVO8oIQbo95yWp1hA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=us15FsznPekFbKZ17T39/wyqNjofNEU2BBOjq+HRffxBWE16/xfNk3BTq+AAkBAlGA+dXoQLUN0BUBSuwI4iF3vtFcunIw7Jts0smz1OgXHxGLPSdYleys5WY+poDfIssyohZryLHAAU8YM/bgegvXbci2vpTI/4hOCe+QZTqNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m4Unt46N; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m4Unt46N"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso19878311fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746798720; x=1747403520; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tVLjzfrQL3LKJR87gCuySpYYpzmYD7FiFUMoW7plIE4=;
        b=m4Unt46NFl7mXf8EoWzrObScJb7A5XVtKKj0mNNPjH/71+0ok1xNuAXqLUNRLP7nx+
         1oz4PXfJjasg9ccfKNClnqc/WLrH1m9eq7e0a3YVPz1cxlnhqmndKgg+lHqKfyComuso
         qpoVMdkZJv6ARNJI0LtDZXkqv87MVjTFyJF/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746798720; x=1747403520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVLjzfrQL3LKJR87gCuySpYYpzmYD7FiFUMoW7plIE4=;
        b=gbG3qwzPLUrRuzv6i3FbTUO/FkNyjSznVX26+IAT6WW09F/wFBU+kM6M5Z22TP/atm
         7KZbo2XNXwWKynzql2gk8xnGBOob6DjOhuTuatORLFJMwqMkfY9keUd1F4udrubXYi3k
         y109tjyIK9+zwwDtQ3O3eE2ytTEZc+qBfwq42zPyQSF45nBkp4x8TqaBdVTtU5RSeDXu
         aT3LPGRAUW9dBYSupOkBqO4YfU2vAEgxf3JZSq4ye4pxurQB+mB+QeJT5TJM4jX8tAb5
         rtp3gqvnxpNUpJ0q+hRHJErmESuPj8zGdqURbHUh0LcXu4LkUY433YGNGdUsnCXX8cdz
         A0ag==
X-Forwarded-Encrypted: i=1; AJvYcCXHpqwHSi23Yvpa5/Hq32vYzg/V7gJprPCe1PcCiY6oRmdEiyqb9SENIH6o7Q/vz/rSfSMk14ylVLLjd1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi+CzzUqesMwwM8avKmebAy/OmVKMOSwzh/v9YQG9CYya08aS1
	1YkA/x2W0ypW3Krqii4rWm3tyTYVTR5kWgcGrKRwNV2WjXFlfcd/nJI+FqI5DgMzmISC879dwdw
	=
X-Gm-Gg: ASbGncsqjo4itcPveoS/p9DukNdXNs2AqymYJWoOEqrA1Asbz9BenH5Uje4G7QMdfkM
	7WGBxcE0M1fd2sL1zPhA9bf8OxzMl2cBZ+im1dcqJvP03pI8wMgiQ+QpOCQB4G9JYl3/FRmxtBn
	K02M3Ep5CLOsfI9Pj+3W/HmVOVV7+hoQmgPr9j9apjwQJV95vtm7kcM7RklIpnpddwK8cbslCNP
	E4uLPENOqcFdIrwt2hfjkNUksC2Czt3HeZm/qkAT3rBDTNHH2gQCA1LND1/xOx7L5jdZjMZBF48
	bAacV94m/631569AIUDgNuVhZk11Z172rM67tRKm6wtjtlsYdoazFF3twp+fK340lH/pRfXZH78
	Rnk5aMqA=
X-Google-Smtp-Source: AGHT+IH//MLRWpf4nzwqkWAo9L6Lm0dosvkKnsocwh1Jv9jevrlB5bePUzyg5tCGa1EGHmq7kwuVzA==
X-Received: by 2002:a2e:bc0e:0:b0:308:ec50:e841 with SMTP id 38308e7fff4ca-326c4627e18mr14303941fa.25.1746798720100;
        Fri, 09 May 2025 06:52:00 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33b7dbesm2739991fa.36.2025.05.09.06.51.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 06:51:59 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-326c8ae08e8so5200991fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:51:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmTrg+hz7C2iQHDN1fK2jluP+tXVdonkjB8DkpyWpMfV3kdVbfq934wYWwQOEVxI4rDBKFgm6MlV32fnc=@vger.kernel.org
X-Received: by 2002:a2e:bc0e:0:b0:308:ec50:e841 with SMTP id
 38308e7fff4ca-326c4627e18mr14303681fa.25.1746798718846; Fri, 09 May 2025
 06:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
 <20250327-uvc-granpower-ng-v6-5-35a2357ff348@chromium.org> <64c00146-e6d2-448d-a416-19d5ae7ae3f6@jjverkuil.nl>
In-Reply-To: <64c00146-e6d2-448d-a416-19d5ae7ae3f6@jjverkuil.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 9 May 2025 15:51:46 +0200
X-Gmail-Original-Message-ID: <CANiDSCvM_V0Pv+cxd31AwcXjG-etJ3imsDYfRb7W2t0NKT67OA@mail.gmail.com>
X-Gm-Features: ATxdqUH8qd_0JqxrGXD24hL8xVd6IQNh0CjzpBXdZtauLNAQq8oQh8buUtDugGI
Message-ID: <CANiDSCvM_V0Pv+cxd31AwcXjG-etJ3imsDYfRb7W2t0NKT67OA@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] media: uvcvideo: Do not turn on the camera for
 some ioctls
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Fri, 9 May 2025 at 15:44, Hans Verkuil <hans@jjverkuil.nl> wrote:
>
> On 27/03/2025 22:05, Ricardo Ribalda wrote:
> > There are some ioctls that do not need to turn on the camera. Do not
> > call uvc_pm_get in those cases.
> >
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 0f1ed0387b2611c8d21e211afe21a35101071d93..668a4e9d772c6d91f045ca75e2744b3a6c69da6b 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -1440,6 +1440,26 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
> >       struct uvc_fh *handle = file->private_data;
> >       int ret;
> >
> > +     /* The following IOCTLs do not need to turn on the camera. */
> > +     switch (cmd) {
> > +     case VIDIOC_CREATE_BUFS:
> > +     case VIDIOC_DQBUF:
> > +     case VIDIOC_ENUM_FMT:
> > +     case VIDIOC_ENUM_FRAMEINTERVALS:
> > +     case VIDIOC_ENUM_FRAMESIZES:
> > +     case VIDIOC_ENUMINPUT:
> > +     case VIDIOC_EXPBUF:
> > +     case VIDIOC_G_FMT:
> > +     case VIDIOC_G_PARM:
> > +     case VIDIOC_G_SELECTION:
> > +     case VIDIOC_QBUF:
> > +     case VIDIOC_QUERYCAP:
> > +     case VIDIOC_REQBUFS:
> > +     case VIDIOC_SUBSCRIBE_EVENT:
> > +     case VIDIOC_UNSUBSCRIBE_EVENT:
>
> Wouldn't it be better to check against the ioctls that DO need to turn on the camera?

I thought it was safer this way. I will look into inverting the logic
in a follow-up patch.

Regards!

>
> That is more future proof IMHO.
>
> If a new ioctl is created, and uvc implements it and that needs to turn on the camera,
> then presumably you will realize that when you add that ioctl in uvc.
>
> If a new ioctl is created and uvc does not need to turn on the camera, then you will
> almost certainly forget to add it to this list.
>
> I'm not blocking this patch, but I think it will be hard to keep this list up to date.
> Inverting the test is probably much easier to handle in the future.
>
> Apologies if this has been discussed before, if so, just point to that discussion so I
> can read through it.
>
> Regards,
>
>         Hans
>
> > +             return video_ioctl2(file, cmd, arg);
> > +     }
> > +
> >       ret = uvc_pm_get(handle->stream->dev);
> >       if (ret)
> >               return ret;
> >
>


-- 
Ricardo Ribalda
