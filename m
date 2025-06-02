Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4271E17A31F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 08:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748853540; cv=none; b=SekhdhqFC3G9agO4U0N2YOuFyTKDdw/dNtvF4fcpD7DmNlFj47W2UKdWaNiKWxu7oFUFrTvUOSCn/8s0RGvN1GsVpqWBtQIvgdPb5uGGz8s/G9BZJ4U9hyvgjRHCJbqYaBeODbCRbl9qfxEjDJU+oFuZZ0A4Di3NYM3o46+tBY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748853540; c=relaxed/simple;
	bh=M4dMnLIz1HIUssVepnpQnYX6YjNDveUp4I6hVplMyQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBhQqbkMu1bxhphl3VDEJgZ+51Rdbsr8nW0+hpbYFFG510qkWcwG9KQiIteam5rmmPHR5MVBtF0FIMYCuFKY0VzU6fxi1nzSPWn9npU8jk3/kNVo7Ue1uDPxQAYhf142RLXKJe3EzgiPp32VAMpCi0CVn2eCl9uJqbWYWOGIF8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ef0z6fqr; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ef0z6fqr"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5532e0ad84aso5047237e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 01:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748853535; x=1749458335; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3D1MqOk55yyF+QvJZLd9AC11tpsnZTeUoMSqzJses+Q=;
        b=Ef0z6fqr+hQl3/IcWA+QVqn30lRHmYDDQQBC67VDehV6EK6xfmkd3zekRNx3tH3lHw
         ilevfb9yVZKoBf0TRiS3dmMx0qCC9c8ndgzjB7bFmrg5XyelX3tcfV3jNksM1Larz6H+
         8RXRzCSFZLVOOFkQVTGDiFjlhS68/v+nw1L/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748853535; x=1749458335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3D1MqOk55yyF+QvJZLd9AC11tpsnZTeUoMSqzJses+Q=;
        b=o/Q3t1YYZfqp/UH4WgHa7IhIzVqH/CTNLqhvKdYWFrRu27SZtKDEOwPHxeAA/C+5iS
         lUlqhge5WHs+2143QQnVsW0gDjA7VZWJn/hkG2T5OLNubYofPhvPJrMdH9fW5v1FgT8+
         DtbxMs9KSXlL8jP1mMI+jMUdrfaBwsdsQmhbJvY6KqqzMoYqCKAAC6aTbZ9N+lOIL7Um
         kdGZF0L/DzCSa38ITK+G7TI58SA8e2rGCb5ytFvz+804oLiM8q5/Vpf9q7lWSE9v5OKs
         Fh1kfWdEUbx6cQjMtRsP0+iqisqy4nNF8hw9jDJLWadBiN63X+WSjCA4xBsUi7jKzosN
         mKEg==
X-Forwarded-Encrypted: i=1; AJvYcCWtaOK6zc6oJU/puekYPrlIa3KxM7dhCCyDwWpQngguiqQaCxnCLKHxLTI4pjdlieLcFgaWZar8Zx/9xGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOmV0V7AncFlrMyuLoKIScRYCu6ymoOvTRwcLCnzD2/7nDM9A3
	QXaNcuBArardcJY+a46jirbO6uJeFISUHnXBQ0f1mf34fKJFhY7FdJIj9TUaXl525NndjoSH8OP
	oWhTLrA==
X-Gm-Gg: ASbGncvK2Ikk+RPJ5jRLBOHHh3bpmEm9DNHCduStdWcqvBG652MP2zU9Hw7bm3BEvHg
	Czjb249Rdmo9w9d7gzy4IMCl1a5nXiCZ/qLfAqdOp1/YS0yY3PI7PKcGp7wwq1rvTSLyxM8cW0e
	kDiCqCjLaqQ9UzAUPCLuPL+RIGnLNceZibwDxDJGq6sd+4kah9jtnLa2V4U1daxol+EUX2b7aoo
	as7qR84xQaiTvdSarvDQX5xLK0+yXKaab8brMqqDZUWhdz8xyJLvF9qwU7XQNYY1e+NS34TJY7K
	DXzpBWL6Tu7Fnicf1vTObL0rtzBn90SoSkAaJ7+Easb6cOeomKqDW23s2F0/HCXItbdITP2T7Wn
	RpAgDNz5Qa770kw==
X-Google-Smtp-Source: AGHT+IEL+zH2EvMNOHitajQYC9SNu0XOyOXE4V9J4DdMHrWj5yA6J/9gizGRAhuu/tOcr9SoosATJA==
X-Received: by 2002:a05:6512:39c3:b0:553:3770:c907 with SMTP id 2adb3069b0e04-55342f51a5amr1874016e87.10.1748853535169;
        Mon, 02 Jun 2025 01:38:55 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d48bsm1512048e87.22.2025.06.02.01.38.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 01:38:54 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55324062ea8so5477014e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 01:38:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHdzfcu1Pbr1aZWlUF4JFxe3Q9oGpYPskDrY46i9qkYX2jV7fokfZoLzpUjq+Xs1MEUbCah056JmCym2A=@vger.kernel.org
X-Received: by 2002:a05:6512:244e:b0:553:2668:6f47 with SMTP id
 2adb3069b0e04-55342f931b5mr1417841e87.31.1748853533656; Mon, 02 Jun 2025
 01:38:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org>
 <20250522-uvc-fop-v1-3-3bfe7a00f31d@chromium.org> <adb22c62-94c8-4ab5-8aea-cc204affba3c@xs4all.nl>
In-Reply-To: <adb22c62-94c8-4ab5-8aea-cc204affba3c@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Jun 2025 10:38:40 +0200
X-Gmail-Original-Message-ID: <CANiDSCubHc+WMgdQqyyqoDLixeN=ubGm4_ejeRj7M_vA=FA_DQ@mail.gmail.com>
X-Gm-Features: AX0GCFuQ3qLhCsXgJka-N2u6ssEczrawiqsO3Mr8fCMkM9jgnlKUIPt_YufzZJk
Message-ID: <CANiDSCubHc+WMgdQqyyqoDLixeN=ubGm4_ejeRj7M_vA=FA_DQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: uvcvideo: Remove stream->is_streaming field
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 2 Jun 2025 at 09:57, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 22/05/2025 19:58, Ricardo Ribalda wrote:
> > The is_streaming field is used by modular PM to know if the device is
> > currently streaming or not.
> >
> > With the transition to vb2 and fop helpers, we can use vb2 functions for
> > the same functionality.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c | 12 +++++-------
> >  drivers/media/usb/uvc/uvcvideo.h |  1 -
> >  2 files changed, 5 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 7a5ecbefa32c0a6b74c85d7f77a25b433598471e..51419f443f2c43dfd17a9782352bd2cde1094732 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -617,7 +617,8 @@ static int uvc_v4l2_release(struct file *file)
> >
> >       uvc_ctrl_cleanup_fh(handle);
> >
> > -     if (handle->is_streaming)
> > +     if (stream->queue.queue.owner == file->private_data &&
>
> Use vb2_queue_is_busy(&stream->queue) instead of directly accessing the owner field.
> But see below, since this can be dropped altogether.
>
> > +         uvc_queue_streaming(&stream->queue))
> >               uvc_pm_put(stream->dev);
>
> I think patch 1/3 can be improved, which likely makes this patch obsolete.

If it is ok with you, I'd rather not touch 1/3. It has landed already
in the uvc tree.

I am reimplemeing 3/3 using  vb2's start_streaming stop_streaming.

BTW, I see that vb2 keeps track of the streaming state, so most of the
code is gone :)


>
> The uvc_pm_get/put should be placed in the start/stop_streaming callbacks. That's
> where you need them, and it avoids all these is_streaming tests. And it allows you to
> use the vb2_ioctl_streamon/off helpers in patch 2, since the streamon/off functions
> no longer mess with the uvc_pm_get/put functions.
>
> Regards,
>
>         Hans
>
> >
> >       /* Release the file handle. */
> > @@ -684,7 +685,7 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
> >       struct uvc_streaming *stream = handle->stream;
> >       int ret;
> >
> > -     if (handle->is_streaming)
> > +     if (uvc_queue_streaming(&stream->queue))
> >               return 0;
> >
> >       ret = uvc_pm_get(stream->dev);
> > @@ -697,8 +698,6 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
> >               return ret;
> >       }
> >
> > -     handle->is_streaming = true;
> > -
> >       return 0;
> >  }
> >
> > @@ -707,16 +706,15 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
> >  {
> >       struct uvc_fh *handle = fh;
> >       struct uvc_streaming *stream = handle->stream;
> > +     bool was_streaming = uvc_queue_streaming(&stream->queue);
> >       int ret;
> >
> >       ret = vb2_ioctl_streamoff(file, fh, type);
> >       if (ret)
> >               return ret;
> >
> > -     if (handle->is_streaming) {
> > -             handle->is_streaming = false;
> > +     if (was_streaming)
> >               uvc_pm_put(stream->dev);
> > -     }
> >
> >       return 0;
> >  }
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 3ddbf065a2cbae40ee48cb06f84ca8f0052990c4..f895f690f7cdc1af942d5f3a5f10e9dd1c956a35 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -626,7 +626,6 @@ struct uvc_fh {
> >       struct uvc_video_chain *chain;
> >       struct uvc_streaming *stream;
> >       unsigned int pending_async_ctrls;
> > -     bool is_streaming;
> >  };
> >
> >  /* ------------------------------------------------------------------------
> >
>


-- 
Ricardo Ribalda
