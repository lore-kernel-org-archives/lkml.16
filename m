Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D8774059
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 21:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743716422; cv=none; b=nUTFLP7j3Z39r+zZjJ/5K+9PpYqMdqLDln49U5wxLh8CUH5SUOzgaRd3VGqK/FL0C/cP4pHCNZh8v/g8U/pKj19XWQ0q0ICqYJ8dHPUyNB13M6pxnAAJtcb1GEgTzo//gm+MAaMHgOL+BlYjKk1GWIqljsS6kq6fWPGpuik8ftw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743716422; c=relaxed/simple;
	bh=eKNl17HEdpdNlndaw3rR5rU8CCK43HdwlSrH+lYQUzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bOwd8OysZL49W03Dd7rclgho3BsJTsTknaJa6SnJbPlfnjo1t0UimCpHJEfgi6Ura9uDmIC1lU7e6x8ZKMhF5zw9d3BVAeKujWExI1Q9Gd26a7D/q3Jt/fHpu18DvEeW9Bz4dNuZQfydEoU4l/ftOkGd2Q49C1ju8cBevv/Vi6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YeVzuhEM; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YeVzuhEM"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54963160818so1636672e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 14:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743716417; x=1744321217; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ATXF44YxfVoIJR6DNmkTbrXWnHtiuKQTfjSuhxOZRt8=;
        b=YeVzuhEMyrtzx8mWV0//GDvMWYDI5TNtutVkWvhg1Eg7mhJKjPA/XFTQNvIic+5Ole
         YeM4BNnFrxWzKPMk66giCgkLOxKVyNigKj765ND4GPF6MmTCCH9bOCuYBViNY+6+kZqD
         pflTwdA/Bh78HL++a1xYNLTmm8L5MPEdft6Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743716417; x=1744321217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATXF44YxfVoIJR6DNmkTbrXWnHtiuKQTfjSuhxOZRt8=;
        b=oF4UeAPwQSNF2se59wJPC4R2JdidX6jNZKjChK7taBKw2yCKcMVchd40U1v4nAiuLO
         c3uS3baKbhE3b/sTetrPLCLIBLfmUE6DwjVCLSx+Is7UTtMUiYqQ+sH4zZ7HXmI33Pyq
         V9m54wnK3iio5FQHKWQt42wkFocm4UuDMjmmUA8YtCgoNjZhxTwc56pAiYfTnf0JSKoN
         TZBvZAmcSrobpKMzS3L/zMAbyrAXZVfpOCMxosoPTiUL2Of6H45Kl7ECkSbZ8+uT4+eG
         Ys9/ms5xTeXG51wUwKVDVP5FGcW8/caUIHYaoj7Eq9GAXAJhjk8djzMTcjk3vpMXKSD7
         yi0g==
X-Forwarded-Encrypted: i=1; AJvYcCVXmdRGyyNOmKoqo//QM3sRc34JAoI+yh2uvXvUYXypMtaXUE39+ul/Z09eWGUyQ0HHjwRBufHqe+wOQBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBbWah7aN348VtcVkHEM3fXfkZLmlpJZoB97NcJrqnTlTLCrSS
	iis5vf/wwDXpjqu7aYag/ts+w9532h6E6L67CoiCpzEqaN8bTj/HB5g2zah5aeE8w4HwNjsRbvY
	=
X-Gm-Gg: ASbGnctZw0e2ruewQp9MSk700r0HXSvE9EcWH8X1F5+7D4dqBKcIo5wTCH17wvjv/eC
	RmDmRroci+8G37xhg7LWOnzsG3gW65WJYaoJ57aMXXdHteAgoFusyAtq78aiEbFUBXeRigTaVw2
	oWrE38lzp+LzV1EAbdLAnF1dgqp08T18SGe0heVCKb7g1GkoRdhyb8clyv6d7qV4n59lpN9YD5H
	U8445j78zLkRvJM6Vnm4J3FeRIMeA/ZrekeWXv2082XB0DokobWmUrLPJmKyeWACMGt3fqlyHLh
	nxjsGZ77laHVztXNswKJZPZ4wYo3UaBQ0bq8lZVkf+nQ0T732poEqpE4lDK3YvTsZ0b8hNRXzD6
	mQWAXPD4dvRFK6NDZgmHfgg==
X-Google-Smtp-Source: AGHT+IEXSDtpPCDaDmVZ75vn7g7JHSzHEP9I+K4Zw5BoU3L/Z4ytrNub/Vm5nr+Izi9G8I3bKGAN/w==
X-Received: by 2002:a05:6512:1256:b0:54a:f743:3134 with SMTP id 2adb3069b0e04-54c23346710mr62108e87.46.1743716417360;
        Thu, 03 Apr 2025 14:40:17 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab81fsm264148e87.4.2025.04.03.14.40.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 14:40:16 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30613802a59so14052141fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 14:40:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4E93Afi/dyARnK7o1uvVLi4c682IL8Iviadk1vLyg6WFD50nhSgYJtmbP3kKeQVrIruFVEVY4JKp8rpI=@vger.kernel.org
X-Received: by 2002:a05:651c:1464:b0:30b:ee78:79d2 with SMTP id
 38308e7fff4ca-30f0c061b2bmr790441fa.36.1743716415384; Thu, 03 Apr 2025
 14:40:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313-uvc-metadata-v3-0-c467af869c60@chromium.org>
 <20250313-uvc-metadata-v3-3-c467af869c60@chromium.org> <20250314073456.25817a3d@foz.lan>
 <CANiDSCuNzwqhYOORqY+PGUbK8=tqxm6stpzQC3BFYF7pxgRG6w@mail.gmail.com>
 <20250314090919.GE19612@pendragon.ideasonboard.com> <CANiDSCtxNwTrQrx6naDUYJOg3S4Osr7CbN6pbJ53HO_3AdpN3g@mail.gmail.com>
In-Reply-To: <CANiDSCtxNwTrQrx6naDUYJOg3S4Osr7CbN6pbJ53HO_3AdpN3g@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 3 Apr 2025 23:40:02 +0200
X-Gmail-Original-Message-ID: <CANiDSCsM4mj5kE_+4cD59kznqtpg=T=3FY8QcayLHe0pSrmzow@mail.gmail.com>
X-Gm-Features: AQ5f1Jo39HQ82TLqkzooCc1lZMq8A_tPw0wAPr1cs7OvBzBdO_SR1-EBG-MbU2k
Message-ID: <CANiDSCsM4mj5kE_+4cD59kznqtpg=T=3FY8QcayLHe0pSrmzow@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] media: uvcvideo: Introduce V4L2_META_FMT_UVC_CUSTOM
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Fri, 14 Mar 2025 at 11:17, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> On Fri, 14 Mar 2025 at 10:09, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Ricardo,
> >
> > On Fri, Mar 14, 2025 at 09:28:34AM +0100, Ricardo Ribalda wrote:
> > > On Fri, 14 Mar 2025 at 07:35, Mauro Carvalho Chehab wrote:
> > > > Em Thu, 13 Mar 2025 12:06:27 +0000 Ricardo Ribalda escreveu:
> > > >
> > > > > The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
> > > > > V4L2_META_FMT_D4XX. The only difference between the two of them is that
> > > > > V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
> > > > > V4L2_META_FMT_D4XX copies the whole metadata section.
> > > > >
> > > > > Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
> > > > > devices, but it is useful to have the whole metadata section for any
> > > > > device where vendors include other metadata, such as the one described by
> > > > > Microsoft:
> > > > > https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> > > > >
> > > > > This patch introduces a new format V4L2_META_FMT_UVC_CUSTOM, that is
> > > > > identical to V4L2_META_FMT_D4XX but it is available to all the UVC
> > > > > devices.
> > > > >
> > > > > Suggested-by: Hans de Goede <hdegoede@redhat.com>
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > ---
> > > > >  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
> > > > >  .../userspace-api/media/v4l/metafmt-uvc-custom.rst | 31 +++++++++++++++++
> > > > >  MAINTAINERS                                        |  1 +
> > > > >  drivers/media/usb/uvc/uvc_metadata.c               | 40 ++++++++++++++++++----
> > > > >  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
> > > > >  include/uapi/linux/videodev2.h                     |  1 +
> > > > >  6 files changed, 69 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > > > index 86ffb3bc8ade2e0c563dd84441572ecea1a571a6..9fd83f4a3cc8509702a2a9f032fdc04bf6c6d1bc 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > > > @@ -19,6 +19,7 @@ These formats are used for the :ref:`metadata` interface only.
> > > > >      metafmt-pisp-fe
> > > > >      metafmt-rkisp1
> > > > >      metafmt-uvc
> > > > > +    metafmt-uvc-custom
> > > > >      metafmt-vivid
> > > > >      metafmt-vsp1-hgo
> > > > >      metafmt-vsp1-hgt
> > > > > diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc-custom.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc-custom.rst
> > > > > new file mode 100644
> > > > > index 0000000000000000000000000000000000000000..9f150fc2b6f379cc4707ff45041dd014956ae11a
> > > > > --- /dev/null
> > > > > +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc-custom.rst
> > > > > @@ -0,0 +1,31 @@
> > > > > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > > > > +
> > > > > +.. _v4l2-meta-fmt-uvc-custom:
> > > > > +
> > > > > +*********************************
> > > > > +V4L2_META_FMT_UVC_CUSTOM ('UVCC')
> > > > > +*********************************
> > > > > +
> > > > > +UVC Custom Payload Metadata.
> > > > > +
> > > > > +
> > > > > +Description
> > > > > +===========
> > > > > +
> > > > > +V4L2_META_FMT_UVC_CUSTOM buffers follow the metadata buffer layout of
> > > > > +V4L2_META_FMT_UVC with the only difference that it includes all the UVC
> > > > > +metadata, not just the first 2-12 bytes.
> > > > > +
> > > > > +The most common metadata format is the one proposed by Microsoft(R)'s UVC
> > > > > +extension [1_], but other vendors might have different formats.
> > > > > +
> > > > > +Applications might use information from the Hardware Database (hwdb)[2_] to
> > > > > +process the camera's metadata accordingly.
> > > >
> > > > Having something like that at the userspace API shouldn't be handled
> > > > lightly. This sounds to me that passing a blank check for vendors to stream
> > > > whatever they want without any requirements to provide and sort of
> > > > documentation for the usersace to decode it.
> > >
> > > As HdG previously mentioned, all the processing is done in the camera
> > > so the metadata is not going to hide highly secret required for
> > > processing:
> > > https://lore.kernel.org/linux-media/67c1a857-7656-421f-994c-751709b6ae01@redhat.com/
> >
> > Without judging whether or not such an undocumented format should be
> > supported by the driver, a correction is needed here: the issue is not
> > "secrets required for processing", but giving closed-source application
> > an unfair advantage.
>
> We could argue that vendors already have the possibility to pass
> secrets to userspace:
> - A camera could add proprietary information inside the frame, only
> parseable by a closed-source application
> - They can use undocumented UVC controls
> - They can exploit documented controls to do something else that they
> are designed for.
> Given these existing possibilities, I question whether "evil metadata"
>  offers any fundamentally new capabilities that cannot be achieved
> through these established methods.
>
> If we have to talk about unfair advantage, Linux is at an unfair
> advantage right now: there is no way to use the *documented*
> information provided by the metadata. Other OSs can use it.
> The way I see it, with this artificial limitation we are not blocking
> evil vendors but punishing good users.
>
> if it makes you feel more comfortable we can start enabling only
> V4L2_META_FMT_UVC_CUSTOM (or V4L2_META_FMT_MSXU_UVC_1_5 as proposed by
> Mauro) to devices that support MSXU_CONTROL_METADATA, the future
> ChromeOS XU, or quirks. But that artificial limitation will hurt a lot
> of current cameras for no real reason.

I guess this mail has fallen through the cracks....

I have just sent a new revision that limits the new metadata format to
devices that support MSXU_CONTROL_METADATA, so it can bump the
discussion.


>
> >
> > > > Also, it would be hard for userspace to distinguish what metatata
> > > > is contained for a random UVC camera. Please let's not do that.
> > >
> > > Userspace will use hwdb info to properly parse the metadata.
> >
> > I don't have experience with that, so I would like to see the effort
> > being started on hwdb support to see how it will look like before we
> > merge this patch. A few cameras should be added as examples, and a
> > stategy to ensure the hwdb will be properly populated should be
> > proposed.
>
> We can start by mapping the D4XX cameras. D4XX format follows
> Microsoft standard.
>
> Would that work for you?
>
> >
> > > > As the specific issue here is to support an already known extension,
> > > > which is already documented, Just add an specific format for it, e.g.
> > > > you could add something like that at the documentation:
> > >
> > > The problem here is how do we know from the driver if a device
> > > supports V4L2_META_FMT_MSXU_UVC_1_5 or not.
> > >
> > > In Windows it seems that vendors add that information to the device
> > > .inf file. That is equivalent to the hwdb proposal.
> > > In ChromeOS we are trying to push vendors to use an extension saying
> > > if there is metadata or not. But that will take some time to land and
> > > there are thousands of modules out there not ChromeOS compliant.
> > >
> > > >
> > > >         V4L2_META_FMT_MSXU_UVC_1_5
> > > >            Microsoft extensions to USB Video Class 1.5 specification.
> > > >
> > > >            For more details, see: https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
> > > >
> > > > And then add the corresponding format to V4L2 API.
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
