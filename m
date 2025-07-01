Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE00433A5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 00:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751330140; cv=none; b=Cx8+uLBLEvTF0esi+ALTbU6Q8wwem9B+GCW1aJorTKDYLTxZziytcMiGPceuv7BI0AAnId/2/N1R2mK6qnkY2QVzE6yZWfbyGyBqMBnxqDvkZh/37MybPnUmnXW0sgGKUvG/NZJ5MT5Cncn8tLQ+OylM8xt+ZS7AXLZeP+USGtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751330140; c=relaxed/simple;
	bh=ERwlxARXEpt1F/4y2KtHKMEORUezg1jVkonhcyO5qhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYfUa6yZbhGC7DNDbcI00RlDTZNbMbp95xGbjWwU5E3H23R3U4G7sQxxGwvszvzt5m7wJWd/YT5F3j0+98PywosYfAQl130iP7neFZCi4IJZpH9KhGju0HK1SzP36/2CFcQTujcczc7r/iMsznCJIElRIw2ui2tVcko1f9oECNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kl86bUct; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kl86bUct"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-610cbca60cdso1843770eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751330137; x=1751934937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWI4N10Qll6H9gLi0COrUUb+8NPRB7fsuPXUb+Y1frk=;
        b=kl86bUctNkC2B5DcY7ljhYViFB3C9RFg7hQnThUjhkrdNBCF/mYpf/Rkg5nWGsS5cW
         Yma4BckR76iVjSs9z4qLDNRfscbHC1Hm7TDYSpJh9ZOaPnFAibQjR+fBYqi5Y9L05cTo
         6lX2W82fzEoRxR0rO88iFJdOufr61j1rS+gal089wJQjk3+wCUbicvYBdm8+8cC/pRtW
         3v0JPoZYd8t/vASXa7tJshHL5qTKx1LQeS85Ofwdu/z/TPQywSVbV6jf268Wsg2bEW6S
         XSyzOhIgz4lPgy/EgCcN2+VINgX9/eUqO6b8xrCouvRh1nU1zbzx0nS6YiBRsxB8XhWP
         f1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751330137; x=1751934937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWI4N10Qll6H9gLi0COrUUb+8NPRB7fsuPXUb+Y1frk=;
        b=fqOveskkjiEzlX/D8dH8fUcjFoKubI429Lv6SQcc2Wmj4McHC8+nuHWG/Or8IAysqP
         AVJVvVWkipQtlXMhaOUcJo2dKUvjU6lJloyft1txtDV1Gcnwtw9fpYW6psJEYqzyQox/
         ORIqw5UAyDtP0GAPOJw7obXa7U4rHsFoWjnVcPdrA2rcoW7TPYJto87ptObsvxX1uUuf
         wLihnn/iir0xnsy7YiUBCg+iiptslmcc0zsQ92/hu2RTK7vOtqLUke7WGNalEtGeHQB1
         R61UYcpDZwn+5nECoEjJspuwIMLlTkccuyIhBhhooUBOspXn/sp3fb5kJg5zVxkFqjhy
         BQVw==
X-Forwarded-Encrypted: i=1; AJvYcCV4i/Nb8FG++lFdmsJcj/I6/7npp9qfHpO0It4PHE+UrHocVW9lcokktN1NVBieBvQDNjc/YIif0gZg7rU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuOia7vPrYsR+BPN7CiFghRXRav/V05+IaOVA9by6Z10VFDlu8
	zn27VGqp25bNj+GJq+Rhh9aYdKLSw1DCzkGkIJPSJGPtV10yPye47bN+ze4C0dMBgaCNLGimc7X
	Rwfsulvl3+MBNFn3KxBTkiWrda9HlAjw=
X-Gm-Gg: ASbGnct13bQzRKXVRN0dSiotR7BHGz2TJjsE7eKoVjf39UUyqOn+XxR3ZBGM09f7Iqo
	fOD+yGsnwCfuXVln1yHLA22gRHirdZaW6E+DlUT1jdPEoyKuFTJ6QqRo07RhOx3+oP2+GRDWrb/
	cL3XfQEFk072CNIbXI1UGgNIAUtRbRYiqcCmY8UwWy9l4=
X-Google-Smtp-Source: AGHT+IFVdRd51zzo2gagjFpXgTBNdm7rEQILgwm7pFT36wENCbxr5fUARgOqLp4Zs15XgdjE9e6aRvtdJxw6++vpPx8=
X-Received: by 2002:a05:6820:1b0e:b0:611:b1c7:24b with SMTP id
 006d021491bc7-611b8ed608dmr9097448eaf.0.1751330137297; Mon, 30 Jun 2025
 17:35:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629233509.291786-1-marcelomoreira1905@gmail.com> <2025063006-recopy-playmaker-562d@gregkh>
In-Reply-To: <2025063006-recopy-playmaker-562d@gregkh>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Mon, 30 Jun 2025 21:35:25 -0300
X-Gm-Features: Ac12FXz_69Zfj20sM9ZCsC3y4DQamsyQCYCGa35fTV1D9-WfSu36yRgghA9KVwI
Message-ID: <CAPZ3m_gDqVeyY9x838tUHBuEjXZrANLgqiJ=+Cn8DQYeCfSnGg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: replace scnprintf with sysfs_emit_at
 in debugfs show
To: Greg KH <greg@kroah.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 30 de jun. de 2025 =C3=A0s 02:09, Greg KH <greg@kroah.com> escreve=
u:
>
> On Sun, Jun 29, 2025 at 08:35:09PM -0300, Marcelo Moreira wrote:
> > Update the receive_timing_debugfs_show() function to utilize
> > sysfs_emit_at() for formatting output to the debugfs buffer.
> > This change adheres to the recommendation outlined
> > in Documentation/filesystems/sysfs.rst.
> >
> > This modification aligns with current sysfs guidelines.
>
> But this isn't a sysfs file, it's a debugfs file, so why are you calling
> sysfs_emit_at()?
>

You're right, thanks Greg.

> >
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/ite-it6505.c | 46 ++++++++++++++---------------
> >  1 file changed, 22 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/brid=
ge/ite-it6505.c
> > index 1383d1e21afe..98bea08a14e4 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > @@ -3427,37 +3427,35 @@ static ssize_t receive_timing_debugfs_show(stru=
ct file *file, char __user *buf,
> >       struct it6505 *it6505 =3D file->private_data;
> >       struct drm_display_mode *vid;
> >       u8 read_buf[READ_BUFFER_SIZE];
> > -     u8 *str =3D read_buf, *end =3D read_buf + READ_BUFFER_SIZE;
> > -     ssize_t ret, count;
> > +     ssize_t ret;
> > +     ssize_t count =3D 0;
> >
> >       if (!it6505)
> >               return -ENODEV;
> >
> >       it6505_calc_video_info(it6505);
> >       vid =3D &it6505->video_info;
> > -     str +=3D scnprintf(str, end - str, "---video timing---\n");
> > -     str +=3D scnprintf(str, end - str, "PCLK:%d.%03dMHz\n",
> > -                      vid->clock / 1000, vid->clock % 1000);
> > -     str +=3D scnprintf(str, end - str, "HTotal:%d\n", vid->htotal);
> > -     str +=3D scnprintf(str, end - str, "HActive:%d\n", vid->hdisplay)=
;
> > -     str +=3D scnprintf(str, end - str, "HFrontPorch:%d\n",
> > -                      vid->hsync_start - vid->hdisplay);
> > -     str +=3D scnprintf(str, end - str, "HSyncWidth:%d\n",
> > -                      vid->hsync_end - vid->hsync_start);
> > -     str +=3D scnprintf(str, end - str, "HBackPorch:%d\n",
> > -                      vid->htotal - vid->hsync_end);
> > -     str +=3D scnprintf(str, end - str, "VTotal:%d\n", vid->vtotal);
> > -     str +=3D scnprintf(str, end - str, "VActive:%d\n", vid->vdisplay)=
;
> > -     str +=3D scnprintf(str, end - str, "VFrontPorch:%d\n",
> > -                      vid->vsync_start - vid->vdisplay);
> > -     str +=3D scnprintf(str, end - str, "VSyncWidth:%d\n",
> > -                      vid->vsync_end - vid->vsync_start);
> > -     str +=3D scnprintf(str, end - str, "VBackPorch:%d\n",
> > -                      vid->vtotal - vid->vsync_end);
> > -
> > -     count =3D str - read_buf;
> > +     count +=3D sysfs_emit_at(read_buf, count, "---video timing---\n")=
;
> > +     count +=3D sysfs_emit_at(read_buf, count, "PCLK:%d.%03dMHz\n",
> > +                     vid->clock / 1000, vid->clock % 1000);
> > +     count +=3D sysfs_emit_at(read_buf, count, "HTotal:%d\n", vid->hto=
tal);
> > +     count +=3D sysfs_emit_at(read_buf, count, "HActive:%d\n", vid->hd=
isplay);
> > +     count +=3D sysfs_emit_at(read_buf, count, "HFrontPorch:%d\n",
> > +                     vid->hsync_start - vid->hdisplay);
> > +     count +=3D sysfs_emit_at(read_buf, count, "HSyncWidth:%d\n",
> > +                     vid->hsync_end - vid->hsync_start);
> > +     count +=3D sysfs_emit_at(read_buf, count, "HBackPorch:%d\n",
> > +                     vid->htotal - vid->hsync_end);
> > +     count +=3D sysfs_emit_at(read_buf, count, "VTotal:%d\n", vid->vto=
tal);
> > +     count +=3D sysfs_emit_at(read_buf, count, "VActive:%d\n", vid->vd=
isplay);
> > +     count +=3D sysfs_emit_at(read_buf, count, "VFrontPorch:%d\n",
> > +                     vid->vsync_start - vid->vdisplay);
> > +     count +=3D sysfs_emit_at(read_buf, count, "VSyncWidth:%d\n",
> > +                     vid->vsync_end - vid->vsync_start);
> > +     count +=3D sysfs_emit_at(read_buf, count, "VBackPorch:%d\n",
> > +                     vid->vtotal - vid->vsync_end);
> > +
> >       ret =3D simple_read_from_buffer(buf, len, ppos, read_buf, count);
> > -
>
> Shouldn't this all be using seq_print() instead?
>
> Again, don't use sysfs_emit*() functions for non-sysfs files, as you do
> NOT know the size of the buffer here (hint, it's not the same).
>
> And, your patch added trailing whitespace, did you forget to run it
> through checkpatch.pl before sending it?


Thanks again for the clarification, I'll be more attentive for future
submissions.

Specifically for this patch I forgot to run checkpatch, sorry. Sorry
for all the inconvenience.

Thanks Greg!

--=20
Cheers,
Marcelo Moreira
