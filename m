Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1441D5178
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744270381; cv=none; b=uy/UKxCiBueYXn9jMC+0JD6fbFC3/tvE7HzLCl5kLeSM4dsvQPEcjHa54bRJUKREagEgF6vp2uMWrzogS4tMKqyqfLpjSvD2I5d2OY5VDWZRJ1lSfznehLLAksa2db41iCpwvQwH7RISjCKO6hlGcvLcPTwaQWS3AbdD/sVmWJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744270381; c=relaxed/simple;
	bh=6CjFseeH2DarFToT5eJ7QI5asPuFMviEs7rTvbKUuFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mch0trGLOfwel3bsdAmskJbT20zTjicaIfLxQU9hM1A5ucwoZi/Haz521IKikEQlOCTT6s+wN62RX1U3QQXQ3ds8feaXZQG8w4+1jn9IHD0JdsjEzu1cs/lDJdlGK1oADzrs/YWrmpHVv8F4fh8A+KC+bWOL7c9X+lzgSJW20Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=grbfh5HR; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="grbfh5HR"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so143364e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744270378; x=1744875178; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E+yLHh5FmkVmkTnsYgK3B+fH8RdAQOGeRdPfvltmYXY=;
        b=grbfh5HRDTCiUUKQbZRiYGOSgLXS+NJlf3pngrRDYi46WFBPQ6KWaPmI1nuLuXnkJc
         6aSlEfJ3c2aOotx2kOKnOQTlfedi2p3g7ojRUV60uWLghqYNdTegwa6AU9VG/ZKRZVEI
         tD+08D1RnpqXDsF4obcULUzzDCaWxAAm7qJr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744270378; x=1744875178;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+yLHh5FmkVmkTnsYgK3B+fH8RdAQOGeRdPfvltmYXY=;
        b=eiYlQLYaoqszjBmQtdcldG9b/FaSPQmPqmYsQ1zv68b1OEbve/u9ZZsJVrZ1XLfS0r
         yvhrvGISWcAAnCTA7WoqDbEo/rOz51u7jteO/7Fo2azT7oPI7BfY0Ng9rJgjJKNlnIIK
         kzOqIFjFXvpQLhT/fD9Po5eGLX492eFWxqW9+nXSzHxRe3tSgchsXf+rTLSHvrU1Hd9O
         RBnylA1uNLC2rEjfntnb0S7ikSnx3M8klnV3VyP7nleo/DdRPvXFh8PhWqkyIeqB+wx5
         o1ylCTgr++iU+SV0barY/JW6vrZNGkC4Xj/PiP6PBdaDqc7CDpMbj3Pc4HqbHRV15rwc
         nHbg==
X-Forwarded-Encrypted: i=1; AJvYcCXb1R4LeBbBK4hcmdon/z+i0Um+rpbeqG+nKdlqo05pybruvt8knmvW0WuG9Sr45Qc7p6ZE2hMRdvbltGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEJMs51RMe1970W9ZP4bVbNy/xlZZfN1OXj8kZDKcgTxvWUruB
	46NwjQt5HBFhttqOO0brEk7KtUWvlZahoiiyPU/x7jacYbgsW0iEyaG1uvUxlqSPYM9rjFPpn3o
	YRg==
X-Gm-Gg: ASbGncvBEix+BWTu1ryt9LN3DPM0bsv2hm1VWmpLn38mX5oZZLQLS1Ez42ddm3GuZaP
	jxGM35Rwd8hbmye7NT1M1+4le7VFTsPUa047g1mh5aDd4GPGXPVFjK/iaQwapNhYp2GzaE2HLPT
	zZsEa7M90WEVStOSpXQ/YLgjSq/7F7zCEM2NihHJ8DqHxvPG6HIN0YEgap2Bg1V0j8QniLHDTeX
	qnBv7en/2i5NjKmuGjy0DwIte2UlvhQEtqmcALAoTw2DY+CuKzkC/mzTOY/9+T1YlrT9db3Z3eT
	BW38VbVsTajl0MTV3Mms+NFY2Qvk3BahX8WbgnMnwMsGrQ7RbyJOTxcsBRpE1ZOmIcjyGGlJhDL
	f4+s=
X-Google-Smtp-Source: AGHT+IHm6kCSJBQ0KVZ665H268zM4nnoK7YB4KHRo3KhNcpjgDjK2Br+lVxDZUtwq3dnx51KIA6y/w==
X-Received: by 2002:a05:6512:234e:b0:549:8963:eb05 with SMTP id 2adb3069b0e04-54cb687bca0mr379001e87.37.1744270377719;
        Thu, 10 Apr 2025 00:32:57 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035dfsm65744e87.146.2025.04.10.00.32.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 00:32:55 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-549946c5346so599163e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:32:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUymTpGG6ZX2ZvvxPbOg5/3EMLsYgZ4YCE1DQQ+M65jgFxv8Vdf7eeu69SCx6DkxSMyIlGyeax17rxYc/c=@vger.kernel.org
X-Received: by 2002:a05:6512:3ba6:b0:545:944:aae1 with SMTP id
 2adb3069b0e04-54caf58e5cbmr541322e87.12.1744270375283; Thu, 10 Apr 2025
 00:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224-uvc-data-backup-v2-0-de993ed9823b@chromium.org>
 <20250224-uvc-data-backup-v2-3-de993ed9823b@chromium.org> <c80da442-c35a-4336-9a49-5a6745e4ce6b@redhat.com>
In-Reply-To: <c80da442-c35a-4336-9a49-5a6745e4ce6b@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 10 Apr 2025 09:32:42 +0200
X-Gmail-Original-Message-ID: <CANiDSCsy1TfBCGu4A+pChTE2gzBugCAxZTS_DFNPF83dbTM3QQ@mail.gmail.com>
X-Gm-Features: ATxdqUGjNFk5xKcNAMICFXzYK_FMDHuXKGmeiIWMpujtWvH8WQQw-zaL_0j7pm0
Message-ID: <CANiDSCsy1TfBCGu4A+pChTE2gzBugCAxZTS_DFNPF83dbTM3QQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: uvcvideo: Rollback non processed entities
 on error
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 15:02, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Ricardo,
>
> On 24-Feb-25 11:34, Ricardo Ribalda wrote:
> > If we wail to commit an entity, we need to restore the
>
> s/wail/fail/
>
> I've fixed this up while merging this series and
> I've pushed the entire series to:
> https://gitlab.freedesktop.org/linux-media/users/uvc/ next now.
>
> Note I had to manually fix some conflicts due to the granular power
> saving series being merged first. I'm pretty sure I got things correct
> but a double check would be appreciated.

I reviewed the merge and I could not find any issue.
Thanks :)

>
> Regards,
>
> Hans
>
>
>
>
> > UVC_CTRL_DATA_BACKUP for the other uncommitted entities. Otherwise the
> > control cache and the device would be out of sync.
> >
> > Cc: stable@kernel.org
> > Fixes: b4012002f3a3 ("[media] uvcvideo: Add support for control events")
> > Reported-by: Hans de Goede <hdegoede@redhat.com>
> > Closes: https://lore.kernel.org/linux-media/fe845e04-9fde-46ee-9763-a6f00867929a@redhat.com/
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 32 ++++++++++++++++++++++----------
> >  1 file changed, 22 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 7d074686eef4..89b946151b16 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1864,7 +1864,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >       unsigned int processed_ctrls = 0;
> >       struct uvc_control *ctrl;
> >       unsigned int i;
> > -     int ret;
> > +     int ret = 0;
> >
> >       if (entity == NULL)
> >               return 0;
> > @@ -1893,8 +1893,6 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >                               dev->intfnum, ctrl->info.selector,
> >                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> >                               ctrl->info.size);
> > -             else
> > -                     ret = 0;
> >
> >               if (!ret)
> >                       processed_ctrls++;
> > @@ -1906,10 +1904,14 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >
> >               ctrl->dirty = 0;
> >
> > -             if (ret < 0) {
> > +             if (ret < 0 && !rollback) {
> >                       if (err_ctrl)
> >                               *err_ctrl = ctrl;
> > -                     return ret;
> > +                     /*
> > +                      * If we fail to set a control, we need to rollback
> > +                      * the next ones.
> > +                      */
> > +                     rollback = 1;
> >               }
> >
> >               if (!rollback && handle &&
> > @@ -1917,6 +1919,9 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >                       uvc_ctrl_set_handle(handle, ctrl, handle);
> >       }
> >
> > +     if (ret)
> > +             return ret;
> > +
> >       return processed_ctrls;
> >  }
> >
> > @@ -1947,7 +1952,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> >       struct uvc_video_chain *chain = handle->chain;
> >       struct uvc_control *err_ctrl;
> >       struct uvc_entity *entity;
> > -     int ret = 0;
> > +     int ret_out = 0;
> > +     int ret;
> >
> >       /* Find the control. */
> >       list_for_each_entry(entity, &chain->entities, chain) {
> > @@ -1958,17 +1964,23 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> >                               ctrls->error_idx =
> >                                       uvc_ctrl_find_ctrl_idx(entity, ctrls,
> >                                                              err_ctrl);
> > -                     goto done;
> > +                     /*
> > +                      * When we fail to commit an entity, we need to
> > +                      * restore the UVC_CTRL_DATA_BACKUP for all the
> > +                      * controls in the other entities, otherwise our cache
> > +                      * and the hardware will be out of sync.
> > +                      */
> > +                     rollback = 1;
> > +
> > +                     ret_out = ret;
> >               } else if (ret > 0 && !rollback) {
> >                       uvc_ctrl_send_events(handle, entity,
> >                                            ctrls->controls, ctrls->count);
> >               }
> >       }
> >
> > -     ret = 0;
> > -done:
> >       mutex_unlock(&chain->ctrl_mutex);
> > -     return ret;
> > +     return ret_out;
> >  }
> >
> >  int uvc_ctrl_get(struct uvc_video_chain *chain,
> >
>


-- 
Ricardo Ribalda
