Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F7D2036ED
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747986296; cv=none; b=iH3KQu6cxJz6U4deaEuwd4PRbkcNglkKuDjmyDdjnnST+AAjP7vwY0kX6WM/rpV98NRZxwtb/ULKGbrsigos0rp5CqqcBt/ymXCHZK0Bipf1pTqdIvwezirTGwDSiVp+0RFZPU6VZFGId/+j7JNof61/q9vQ1X9aca6JVc3r0V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747986296; c=relaxed/simple;
	bh=iEq39/wjtR3s0C+z3oPs0UaJ/LJdHtfnxUOR4aef97I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9WKVZGIx9k58JQzotmGcgd2GWelYuy1CvFC0Y7o2GS2T0cdbv3eQc2w6GpwrkW/9DnNIKERp2aiJu+OQmQJIR1QrPZ7JFFVuxK2qtKhs8j5Exp7ywG2/AkV7p3IFptbhvRXXFbCLwDr+BeUn4uesShfUJD/mIsqs5kp66m1+2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SN3nKDov; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SN3nKDov"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-549b116321aso10683419e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747986292; x=1748591092; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Iuc9W+ryC1YyeQDNKOCf6Uzg63zQlxEysMeSbkSkY1w=;
        b=SN3nKDovQvHmxNSots8bAALTaP6/sJIcLcYOPZNrwegyCxc5yBPFapnzoUvx1VkOci
         bcrSIYftPohk9hep/B8R+gf28LvB3EPDQdwITFrmnjdZB5a36riiVXtCtMjhOW9hD7oz
         +HE/RIFeP5OqQlSDy6VqGdVQ50uX+XbM58Y5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747986292; x=1748591092;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iuc9W+ryC1YyeQDNKOCf6Uzg63zQlxEysMeSbkSkY1w=;
        b=dEsRSD1NkVhgbUOSWTgGw4FaNtQWmRDNDUIMV/ZcJzqJZvZngg3V2nvIi9wTGM9oYs
         yEArTuty0kWsE2RLZxYHoNwr8clTeORjIqZviyXE0rm+xqWbYRUsOqU5ixfTsBy1ILxn
         qzBzFQy5tN9p/P9Xb0lAkV/F/vwpULC5bn49ySa/19BNxMRIXwKrgBCCfMANauHXsERz
         dhkS3qoPxUE+lajJ0ekf7Ek17ITRKKwM+rcFa+clIJEz1gefyTgeObPn3I3g/xA0+XAN
         ni5Kv1tsxblKCSoGvaP+ucDNgVSdtgmKbnekshynwjsE6LaEw8pMsIHuS1bvuEeSYpI3
         /Erw==
X-Forwarded-Encrypted: i=1; AJvYcCUCZTYFCIxWU+M+WhsS/OTiWY+KInuxMdtwe2BFWRRP7VTXtUN5WgkSoGbACMbdJWpseju6g8fh6JH6zjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAperp9izyeLe31/HNYlapkL02f3joM60sk6kXjyowF1k/ktNG
	2f9RuObVMF/Mmu8KzaLR0OXZEFNK+1mLv/eeoiSQzPqqKAfoXRDhmLcnBtlg0rvXSSNQwDG7rI0
	9w2jT+Q==
X-Gm-Gg: ASbGnctQe3si2rnIgwpJFNg2TQwazzaGTerxMWCqNDn5nYmTYhr3N+PfAlqg1tEq1TH
	iZqTM+1Qnkk5xe6uj/npOyfYPosdPvUBSWk3VQdydhp78du1+DY/2KjLdR8EMbTqTn7c685yexf
	Btp37YVWn7OM9aQB9A9QJB5V6CpK/j94kUpBZPp49FhQRr2+ZK7JDiBeex0LJEkjoGcVVLPtogp
	aftLLQ+d3LhdA5fLcqj5I4wBkZUan3yw18lLi3mSs1vQlClPEOA+e5GSWZhNJv8eFGfo7KWrUon
	F03DDgKjlf87nDSfh+zhgiXeU5R2VYjq2hkcnoDaZX+JCsWILUXP4EUnuBfJB3HI3MNBQ8tLaPk
	Scwygawl5FHpD6MbVng==
X-Google-Smtp-Source: AGHT+IFWdP14NoiuWuXzbxZE2/CBKKI7XWq8ORAViGcHyAf11vJ+d7kdR5WQBpGpipcudPcFPDTFIQ==
X-Received: by 2002:a05:6512:2915:b0:54f:c638:ec64 with SMTP id 2adb3069b0e04-550e99006c8mr7187266e87.41.1747986292361;
        Fri, 23 May 2025 00:44:52 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fcb3sm3730440e87.86.2025.05.23.00.44.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 00:44:51 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso80592951fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:44:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWE+1e1gsntzuipun5nwoz939wF9s8Yy7q120T2M3luJT4uYqUCTnJA/MppOzM5DC0t7JPX/SDt9669j+s=@vger.kernel.org
X-Received: by 2002:a05:651c:31cf:b0:30b:ba06:b6f9 with SMTP id
 38308e7fff4ca-3280978063fmr81120791fa.26.1747986291131; Fri, 23 May 2025
 00:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org>
 <20250522-uvc-fop-v1-1-3bfe7a00f31d@chromium.org> <20250522214002.GY12514@pendragon.ideasonboard.com>
In-Reply-To: <20250522214002.GY12514@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 23 May 2025 09:44:38 +0200
X-Gmail-Original-Message-ID: <CANiDSCvesD5QzVuAAG6ofZ3NT0z9yVkycS3VSnxeGTqK4UP18Q@mail.gmail.com>
X-Gm-Features: AX0GCFvNrvNAQBnuQSv3by2k1BtXIm9DTlqmbPAmI-OeK7Jiu_yB7sYrt-v0HME
Message-ID: <CANiDSCvesD5QzVuAAG6ofZ3NT0z9yVkycS3VSnxeGTqK4UP18Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: uvcvideo: Refactor uvc_queue_streamon
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

Thanks for your review

On Thu, 22 May 2025 at 23:40, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Thu, May 22, 2025 at 05:58:46PM +0000, Ricardo Ribalda wrote:
> > Do uvc_pm_get before we call uvc_queue_streamon. Although the current
> > code is correct, uvc_ioctl_streamon is allways called after uvc_pm_get,
> > this change makes the code more resiliant to future changes.
> >
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Unless you say otherwise I will copy this Review-by to the original
series where this patch belongs to.
https://patchwork.linuxtv.org/project/linux-media/list/?series=15227

Thanks!


>
> > ---
> >  drivers/media/usb/uvc/uvc_v4l2.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 668a4e9d772c6d91f045ca75e2744b3a6c69da6b..862b4e34e5b629cf324479a9bb59ebe8784ccd5d 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -853,15 +853,16 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
> >       if (handle->is_streaming)
> >               return 0;
> >
> > -     ret = uvc_queue_streamon(&stream->queue, type);
> > +     ret = uvc_pm_get(stream->dev);
> >       if (ret)
> >               return ret;
> >
> > -     ret = uvc_pm_get(stream->dev);
> > +     ret = uvc_queue_streamon(&stream->queue, type);
> >       if (ret) {
> > -             uvc_queue_streamoff(&stream->queue, type);
> > +             uvc_pm_put(stream->dev);
> >               return ret;
> >       }
> > +
> >       handle->is_streaming = true;
> >
> >       return 0;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
