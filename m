Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AD21F417E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746436032; cv=none; b=d/IlEWXXSeCmdlSaeoj0MSsx7j2a7k2VzyCFIzohv3UtZLt8uMQ2mWXlwoEn1HL5E2UZ9b5bQTFzn+ROfRjCOJS2AJmJcnIWy91eh6a34dofipg4RHka2UklFuVtARe+F/j8dMmA5TndHWVR8yMv48JbvrWzFSg3kbZdm+A5y4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746436032; c=relaxed/simple;
	bh=DKSAlySHx3h3D9zpUBcxrMd3u1LhzK+bGMkaFdM8fys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7FPhCWu/jiiijyAqvDi3BGSJtFYDqxFHh38J5E98Ao/sVMqVV2N8DV/AjD3gPpCQwXSQW37mqCSPCFyLzVEYp+LOy7B9dG7LMpf31FO5hmjtdl86tnvl54FjQeRqSysj849rMcdxQHl2s8TFQiusZyDYDb5Be83WminsiUTXuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B11R3BxE; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B11R3BxE"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30beedb99c9so36185061fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 02:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746436029; x=1747040829; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/GsrYYGdHiHagWAJNMJ4+WIR65DiPU+EFWzyGSzQD9k=;
        b=B11R3BxE2WX3AAs+NcgXlX+9i16oKvJ1xoZpvvY0OsZ+AlrgJtnKWJY8GBvTFkr135
         LnxVTg2VKN5/J0EmPSu/9ySeADHie0TEyrlFAuQ2+tYBKrMTQ+DWiWqwwtVqAgIe2rg9
         WrT2J8gGp3MAOSSNbu4zIBaHKgNLNMGH0l1T8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746436029; x=1747040829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/GsrYYGdHiHagWAJNMJ4+WIR65DiPU+EFWzyGSzQD9k=;
        b=rFsHaF4D/g152UEY/dNHOb48J3y2VKOsJg99hDg1nLAQG48BJVEA7yU1YyvMBeKG7z
         ejMu5N32b4NakTdJvlDUw4b8/BApNGK+W1fyYHQFJTycYIgPIR5ab/4zxPATGnq8WC6t
         4y3Pxf+lwaMfNnM6Of00idY5blhtYHOp7Fhg+yXX2aTbj8FmMuosOX2IYz2j/u3SmWQE
         AyavQ1uQ2VXP8DXjsDyj/8TksMmBZtXJGr2bcU8k7CxlNVNghKr1oFt9E8IQyK3kcKnN
         Gd8V3q9LHSYWMEcbuLCAbt9I9+ShcV/uGDxoWtcplFbooHrmnUs5rbSRwQYeDseH0Rcd
         26Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWFEZ9FULLQsNNv7e/znXLEYJoZW+UEdg41P/QMzcaKwsCV/qaVvUDqrivFpD8e0Ksc5K552ro0K/wVnwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YywVgLN2nPw2zXrtv0RwxbAt/Dn0Cwl7aFFWh9H/LBq/P3oCEry
	bOSRLDFe4FPAdMN4GuTkiM9J+LD1EvRNsad3ZpZ3ah3dQvzQwZ9sFVI+xqrB+IcSPVNCHSEH9dI
	=
X-Gm-Gg: ASbGncsxijTVQzqVXLIr28WHcugBJH9fQ73a65z3TvFAtssrf6teRkbbQPLqya15JD9
	kClAaO56fV+TwZA60IpgmIELZyMcOPiAM4CCUgQ4Kbu7cMG9IfCBvUxbLndPs3dCmMzaCVSjzr/
	UL5MGUR7+IMqPtcHPh+VNx+uhjwDYCQsYqQue5fLnDrT+WM46mjXjHsav/hl91ZerKfO8fPvLEA
	9rPk1kFF9TRxCabj+AG7gegMZqPVwYllXco1lHc/OzK5BG4Qm7V6lMD5lIxH1x1rTRclannzvCr
	MwV7QluP5uIZ5PyrypBiTY40MtawyqwS8pBmWHDTx61AFfh6IaW+xIH5fVJSWvCiT2igDtt2WUN
	TmD0=
X-Google-Smtp-Source: AGHT+IHb8IC0fWmAj0jyoOiZ9L+pk8e8Jet2fWO2Hjvt+c/6KPsI9RnR7tkAjzbFoOV9Ze2LKBzSQQ==
X-Received: by 2002:a05:651c:a0b:b0:30a:448a:467 with SMTP id 38308e7fff4ca-321db695309mr25097131fa.21.1746436028731;
        Mon, 05 May 2025 02:07:08 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202901716dsm15666771fa.26.2025.05.05.02.07.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 02:07:07 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54acc0cd458so4856556e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 02:07:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUakhpctNAEzPc66X3nDfk3VyD67yh7jLPZP8ur9fQUk/mERvGb6MFaaqywWkV4C3cdNLL4eE3pQA1lOHY=@vger.kernel.org
X-Received: by 2002:a05:6512:3c87:b0:545:2300:9256 with SMTP id
 2adb3069b0e04-54eb2428303mr1840599e87.12.1746436027276; Mon, 05 May 2025
 02:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
In-Reply-To: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 5 May 2025 11:06:54 +0200
X-Gmail-Original-Message-ID: <CANiDSCtNTMb7kDqrRbpMjDiL+vJh97Tm=2s44J46QS8uH+m0bA@mail.gmail.com>
X-Gm-Features: ATxdqUGQfyylk6QXkXx8f0-VFS2_hwlKvplMAloc_0UYeLmco1yG4YZuTcaOv88
Message-ID: <CANiDSCtNTMb7kDqrRbpMjDiL+vJh97Tm=2s44J46QS8uH+m0bA@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
 + other meta fixes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mauro, Hi Laurent, Hi Hans

Do you have any comments about this version?

Thanks!

On Fri, 4 Apr 2025 at 08:37, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> This series introduces a new metadata format for UVC cameras and adds a
> couple of improvements to the UVC metadata handling.
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v5:
> - Fix codestyle and kerneldoc warnings reported by media-ci
> - Link to v4: https://lore.kernel.org/r/20250403-uvc-meta-v4-0-877aa6475975@chromium.org
>
> Changes in v4:
> - Rename format to V4L2_META_FMT_UVC_MSXU_1_5 (Thanks Mauro)
> - Flag the new format with a quirk.
> - Autodetect MSXU devices.
> - Link to v3: https://lore.kernel.org/linux-media/20250313-uvc-metadata-v3-0-c467af869c60@chromium.org/
>
> Changes in v3:
> - Fix doc syntax errors.
> - Link to v2: https://lore.kernel.org/r/20250306-uvc-metadata-v2-0-7e939857cad5@chromium.org
>
> Changes in v2:
> - Add metadata invalid fix
> - Move doc note to a separate patch
> - Introuce V4L2_META_FMT_UVC_CUSTOM (thanks HdG!).
> - Link to v1: https://lore.kernel.org/r/20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org
>
> ---
> Ricardo Ribalda (4):
>       media: uvcvideo: Do not mark valid metadata as invalid
>       media: Documentation: Add note about UVCH length field
>       media: uvcvideo: Introduce V4L2_META_FMT_UVC_MSXU_1_5
>       media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
>
>  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
>  .../media/v4l/metafmt-uvc-msxu-1-5.rst             | 23 +++++
>  .../userspace-api/media/v4l/metafmt-uvc.rst        |  4 +-
>  MAINTAINERS                                        |  1 +
>  drivers/media/usb/uvc/uvc_metadata.c               | 97 ++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_video.c                  | 12 +--
>  drivers/media/usb/uvc/uvcvideo.h                   |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
>  include/linux/usb/uvc.h                            |  3 +
>  include/uapi/linux/videodev2.h                     |  1 +
>  10 files changed, 131 insertions(+), 13 deletions(-)
> ---
> base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
> change-id: 20250403-uvc-meta-e556773d12ae
>
> Best regards,
> --
> Ricardo Ribalda <ribalda@chromium.org>
>


-- 
Ricardo Ribalda
