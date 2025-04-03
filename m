Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A251494C2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743667167; cv=none; b=EluFAIh1zfrFcQDBJSaN0XKpuOXHwhEov/eKm3xaeFLDHWiIeJE4QMEHBY9G4BtC4n68/55bQQfM4HTS4mRDa5jdrSDQoDgimRJvhJonq5o3ReoId5S9SZYvIueS5mYm7PK4TaIvFoFv/sT1KI8X7xVTU2ZC2dMXK3d13e5OyC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743667167; c=relaxed/simple;
	bh=kBIqwYp+0OoHkcTQzAgsD+dEZ+4mg3cDogdBCyvQ+KE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ee6n5k5OCDVTuT0JNWaYBac9QtAyC0HIO7bbUn7OmdtW44s49A1BM3AUK2MsQ37md+39LblS3H8TlaiIEyK+BmWdxGTDovgiWBd34eWYR7uzrua2FHk+16yk8ZqLQrDSk0XKFApYqT40ukwEfT3bwEFcOo3WX2GdLzDX01S3kD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TvuPARe3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TvuPARe3"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54b0d638e86so671588e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743667163; x=1744271963; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pQ3zw43gKxJ1YlZXX9E0k3Czk4zWzQQQoC/QeCSB+uw=;
        b=TvuPARe35b6eYmgIm2Vmu7+o0jfyw1li77qwYXxScuGVkFhgrNulqjSoLyaYWdcdsV
         A5qb0E4mv9Ij9RwXN5UrBdrvGQrmdQydNo4LaOdSzYFgXXUuk6XApzBax8v3/7exbEQA
         E74w3NrJSkpkwNC/TgezMtY7yxSEyJQzc9zio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743667163; x=1744271963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQ3zw43gKxJ1YlZXX9E0k3Czk4zWzQQQoC/QeCSB+uw=;
        b=i27h5hM7TLacVtqRLq6itneoO5AAote+T8FSb1IwKoD96ENpZXADkyWIebbXDlG/1a
         7Vj12b2v0aeAuVhMv8cAK0niQDtAjDGVaCVPPZCp2gjaTQE7ireyuqEmHwIDhWO1cSFO
         1e5x8dA6X7gooT1E737hy15AdsDc5wz9q9FcX+/PsPGa6+9W4yqimhKUpEU9tpQggakr
         BF33qhYCtXD5zo6NtK7RqALUiwKYZuSH7JOkQ8/uzCAMKqiRL9yrQ3hSz3fcnuf+Dfdr
         qxCJdemTLZQvcuOIl618ThhAQ50fXbPAZUTA4wOk26c27CMAEhWLkM2g8FAj0nDZMMf/
         6svg==
X-Forwarded-Encrypted: i=1; AJvYcCXODCyTzgo8zRm2cOjBxwI1f1PEELroFUwDm1o0rrToK9WINEPjhEI8GIJVhNten86muD8EG3lx5T6WV8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3atZ+Zn9UfbG52BLVflzVaXxSuVpWJHDf3fOAlpMt4rYlslWo
	RCfO4Z0rAkmaFET01PYXZpfjrcU3qmffUfUirUspq9dwU3AYvF+gTm44jJgU8l1f8/3MoJCEm4A
	=
X-Gm-Gg: ASbGnctHuVR50qP/gl8yLOOb3+4+3H2vPp6Eld7kP71G70u1wPtCMOt4EShmrSlY3Of
	lH8l8ML4/vq1trF8KP3ltSOfx7z+F9b0kemGjdufWOlGpQu+P9pjvNz1TWt7TCRjQX1GmrqAJLX
	zGZZgD0hK87sk7CTkniSy4NW2JzUktv4vo2Klk4oBzJ5pwlcJRJ4HgBmgHC4ak0E6Mf3sURBIjs
	hwV/kem/PLgeHE4TjdS32/xJi6A6+uwrmpjexI0oQW2SaCHRLn7imAS3IZFIuDS+dLH7XAjyTMH
	6WoIppiGR5J3Asx6YC+YOuNs6mpygLYf80lmY2KACDUl9H8HIYPXf6ZQ1xQbrnAuX83wmD4i6p/
	C35SR7eqo+kY=
X-Google-Smtp-Source: AGHT+IFSNYqOpL+cuGRWXJAiDJnpDbp2FzgC7zSwCnEGtB/cUO0AK5Y6jwsSHFwerMR/rodh8Jrnzg==
X-Received: by 2002:a05:6512:2314:b0:549:8f15:db36 with SMTP id 2adb3069b0e04-54c1d90d95fmr595709e87.51.1743667163251;
        Thu, 03 Apr 2025 00:59:23 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab6b8sm77558e87.42.2025.04.03.00.59.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 00:59:21 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so5429031fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:59:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzp6W3b39JHNrJRsltvTRo7wPfjklaphbG6TNBQ+ZtvCPZdSc04mfZclK6rL8Q1vfDqlsN4n4b4GW08Es=@vger.kernel.org
X-Received: by 2002:a05:651c:1478:b0:30d:e104:a497 with SMTP id
 38308e7fff4ca-30f021ae014mr5251721fa.41.1743667161105; Thu, 03 Apr 2025
 00:59:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310-uvc-eaccess-v6-1-bf4562f7cabd@chromium.org> <332fce27-8a11-4c70-9753-1da968c3e45a@xs4all.nl>
In-Reply-To: <332fce27-8a11-4c70-9753-1da968c3e45a@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 3 Apr 2025 09:59:08 +0200
X-Gmail-Original-Message-ID: <CANiDSCsGH5SM-odxUbGnT0pOKvX+J2tsSqF_7ightF_TqwHJ_g@mail.gmail.com>
X-Gm-Features: AQ5f1Jpx5ERt4Z14SS3nIQREy9ENmA-oiCBv2P2PlFS77sONYcyvizK2h_rSXpY
Message-ID: <CANiDSCsGH5SM-odxUbGnT0pOKvX+J2tsSqF_7ightF_TqwHJ_g@mail.gmail.com>
Subject: Re: [PATCH v6] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 09:01, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 10/03/2025 14:21, Ricardo Ribalda wrote:
> > To implement VIDIOC_QUERYCTRL, we need to know the minimum, maximum,
> > step and flags of the control. For some of the controls, this involves
> > querying the actual hardware.
> >
> > Some non-compliant cameras produce errors when we query them. These
> > error can be triggered every time, sometimes, or when other controls do
> > not have the "right value". Right now, we populate that error to userspace.
> > When an error happens, the v4l2 framework does not copy the v4l2_queryctrl
> > struct to userspace. Also, userspace apps are not ready to handle any
> > other error than -EINVAL.
> >
> > One of the main usecases of VIDIOC_QUERYCTRL is enumerating the controls
> > of a device. This is done using the V4L2_CTRL_FLAG_NEXT_CTRL flag. In
> > that usecase, a non-compliant control will make it almost impossible to
> > enumerate all controls of the device.
> >
> > A control with an invalid max/min/step/flags is better than non being
> > able to enumerate the rest of the controls.
> >
> > This patch:
> > - Retries for an extra attempt to read the control, to avoid spurious
> >   errors. More attempts do not seem to produce better results in the
> >   tested hardware.
> > - Makes VIDIOC_QUERYCTRL return 0 in all the error cases different than
> >   -EINVAL.
> > - Introduces a warning in dmesg so we can have a trace of what has happened
> >   and sets the V4L2_CTRL_FLAG_DISABLED.
> > - Makes sure we keep returning V4L2_CTRL_FLAG_DISABLED for all the next
> >   attempts to query that control (other operations have the same
> >   functionality as now).
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Hi 2*Hans and Laurent!
> >
> > I came around a device that was listing just a couple of controls when
> > it should be listing much more.
> >
> > Some debugging latter I found that the device was returning -EIO when
> > all the focal controls were read.
> >
> > Lots of good arguments in favor/against this patch in the v1. Please
> > check!
> >
> > Without this patch:
> > $ v4l2-ctl --list-ctrls
> >                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
> >          exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
> >      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
> > region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
> >
> > With this patch:
> > $ v4l2-ctl --list-ctrls
> >                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
> >          exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
> >      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
> > error 5 getting ext_ctrl Focus, Absolute
> > error 5 getting ext_ctrl Focus, Automatic Continuous
> >    region_of_interest_rectangle 0x009a1901 (unknown): type=107 value=unsupported payload type flags=has-payload
> > region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
>
> This output still refers to the result from the v1 patch (I think).
> Can you redo this test with this v6 applied? You probably want to update these
> comments anyway.

I do not have access to the broken device right now. But I will fake a
-EIO error.

>
> > --
> > ---
> > Changes in v6:
> > - Keep returning V4L2_CTRL_FLAG_DISABLED in future control queries.
> > - Link to v5: https://lore.kernel.org/r/20250224-uvc-eaccess-v5-1-690d73bcef28@chromium.org
> >
> > Changes in v5:
> > - Explain the retry in the commit message (Thanks Laurent).
> > - Link to v4: https://lore.kernel.org/r/20250111-uvc-eaccess-v4-1-c7759bfd1bd4@chromium.org
> >
> > Changes in v4:
> > - Display control name (Thanks Hans)
> > - Link to v3: https://lore.kernel.org/r/20250107-uvc-eaccess-v3-1-99f3335d5133@chromium.org
> >
> > Changes in v3:
> > - Add a retry mechanism during error.
> > - Set V4L2_CTRL_FLAG_DISABLED flag.
> > - Link to v2: https://lore.kernel.org/r/20241219-uvc-eaccess-v2-1-bf6520c8b86d@chromium.org
> >
> > Changes in v2:
> > - Never return error, even if we are not enumerating the controls
> > - Improve commit message.
> > - Link to v1: https://lore.kernel.org/r/20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 46 +++++++++++++++++++++++++++++++++-------
> >  drivers/media/usb/uvc/uvcvideo.h |  2 ++
> >  2 files changed, 40 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 4e58476d305efddac331417feda8cb064e340a13..4b282ac714220b26581fe468d9ecb1109a28483f 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1280,6 +1280,8 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
> >       return ~0;
> >  }
> >
> > +#define MAX_QUERY_RETRIES 2
>
> As you mentioned in the commit log, trying more times didn't make a difference.
> Add that as a comment here as well, it is good to have that documented in the code.
>
> > +
> >  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >       struct uvc_control *ctrl,
> >       struct uvc_control_mapping *mapping,
> > @@ -1305,19 +1307,44 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >               __uvc_find_control(ctrl->entity, mapping->master_id,
> >                                  &master_map, &master_ctrl, 0);
> >       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> > +             unsigned int retries;
> >               s32 val;
> > -             int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> > -             if (ret < 0)
> > -                     return ret;
> > +             int ret;
> >
> > -             if (val != mapping->master_manual)
> > -                             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > +             for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
> > +                     ret = __uvc_ctrl_get(chain, master_ctrl, master_map,
> > +                                          &val);
> > +                     if (ret >= 0)
> > +                             break;
>
> This retries regardless of the error code. Isn't a retry only needed for -EIO?
> Are there other error codes that need a retry? Or, perhaps easier, are there
> errors codes for which a retry is *not* appropriate? E.g. -EACCESS, -ERANGE.

So far I have only seen -EIO, so i will start with -EIO, if we see
other behaviour we can fix this later.


>
> > +             }
> > +
> > +             if (ret < 0) {
> > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > +                                          "UVC non compliance: Error %d querying master control %x (%s)\n",
> > +                                          ret, master_map->id,
> > +                                          uvc_map_get_name(master_map));
>
> Shouldn't you mark this control as disabled and return here instead of
> continuing?

Do you mean marking as disabled the master control or the actual control?

I think there might be cases where the master control is "disabled",
but the actual control works.
Semantically could be similar to cameras that do not have the
master_control, and we support that usecase today.

I am marking the master_map as disabled.

>
> > +             } else if (val != mapping->master_manual) {
> > +                     v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > +             }
> >       }
> >
> >       if (!ctrl->cached) {
> > -             int ret = uvc_ctrl_populate_cache(chain, ctrl);
> > -             if (ret < 0)
> > -                     return ret;
> > +             unsigned int retries;
> > +             int ret;
> > +
> > +             for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
> > +                     ret = uvc_ctrl_populate_cache(chain, ctrl);
> > +                     if (ret >= 0)
> > +                             break;
>
> Same question about the error code as above.
>
> > +             }
> > +
> > +             if (ret < 0) {
> > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > +                                          "UVC non compliance: permanently disabling control %x (%s), due to error %d\n",
> > +                                          mapping->id,
> > +                                          uvc_map_get_name(mapping), ret);
> > +                     mapping->disabled = true;
> > +             }
> >       }
> >
> >       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
> > @@ -1325,6 +1352,9 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
> >       }
> >
> > +     if (mapping->disabled)
> > +             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_DISABLED;
> > +
> >       switch (mapping->v4l2_type) {
> >       case V4L2_CTRL_TYPE_MENU:
> >               v4l2_ctrl->minimum = ffs(mapping->menu_mask) - 1;
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 5e388f05f3fcaf0e4c503a34745d05837ecb0184..63687d7e97738a50d037b1f456f5215241909c13 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -129,6 +129,8 @@ struct uvc_control_mapping {
> >       s32 master_manual;
> >       u32 slave_ids[2];
> >
> > +     bool disabled;
> > +
> >       const struct uvc_control_mapping *(*filter_mapping)
> >                               (struct uvc_video_chain *chain,
> >                               struct uvc_control *ctrl);
> >
> > ---
> > base-commit: c2b96a6818159fba8a3bcc38262da9e77f9b3ec7
> > change-id: 20241213-uvc-eaccess-755cc061a360
> >
> > Best regards,
>
> Regards,
>
>         Hans


Thanks :)


-- 
Ricardo Ribalda
