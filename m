Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D47E2E3385
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074280; cv=none; b=kZ8SZhO+GRKsPb3fB0CgFZmjIdYQvrY3VJTCBOgQW1d8rYdOzgmqdJVm8tssRgHHRhqsuC6q6gucwgE7oPigsauI45LQ1S33zz8y8ZVKnHzqIhnj4xDRXWebZ8blm1fvl7NFeFX5HFeIhS8gAXZCUgUaPLR+jQGlaDUbLwd1aAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074280; c=relaxed/simple;
	bh=6OFo5pBMYnYh2m/fkEpOWd415EFJQ4PzegzdB78/qh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KaLiWeeeGK49eMU6MUHGLTF+udbQzd/x9xhtGdmkYKeGdglAL1kEjjinmCMwe632DVAUgT7gQsXTdtntchIl/FUWCpmj+DPP1dIQ4i5cjWYchQk/Uphg5p8tZchVBjGow+ay/8oVGdI9h/91SpujjfrtTI6XLMZgN0qzBmpX16U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WvW97kI7; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WvW97kI7"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-551ed563740so4760351e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750074275; x=1750679075; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JC57BNOILQO91SpxcwM/H8uetMBSbdJpDUePGneKOZM=;
        b=WvW97kI7MGz08Rj1VhMCOZXdEpVYtnTclE8suo1tn2OFf/uHasAyMkUDSfDVwIopMg
         1x+xquc9+WR5RvaVgc6bXWN7Bu8jP/pCfZ4UHGQcJ5t3l93phdoYcAbouP/K4iIqjGlQ
         gzgpsE2XWk6q1PWe+1E7RpVOHnjh68umB+z+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074275; x=1750679075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JC57BNOILQO91SpxcwM/H8uetMBSbdJpDUePGneKOZM=;
        b=ke7DcM9D2ahtsPm8QMemH7nf+BzdYL2g8W9XyUy8rg8l1C1MQoHSla5DQvPL7WRRRU
         ln4c64kGoFrlrsCmdwoSqkBSeVhcSoqNCecUAKgcbuR8iucO1zsS8CcsGWLAXYUBaxAB
         M8wRq7sC2iOWiezy8WdBci/xiW2MzZoTjm+LmpAVsjo+/nOGghl8X/Ewb1vVGlInZ58e
         taHXWMYJBBJP+zpwxeR1B4d+umoglB+jOM4dLRrOpQAFUVksgvxHghfQ+WrrlnJhUUmu
         Njhoujd3PHOy6/KMrvnh0WObSeUkq/c7El0x0s3hapsqg5i4ImnOmCQQ8rd644EKsnTM
         R/tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFSFYIrtlk9E9m2vwx6VsUJmuX5gBaweY+x0SbdVM0Q19wa8zXtuhWKaSn2eYrf00PXyRqMiGsWks2l2o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyigwg8ANyhyyisU0dCmo6M/kSnwRC8K7WnFUl+1tBXTUprZ9h4
	f4elUE2BQNB4CBg3frncUhWxiF0DSvnNL+OFz6aKPoCtiH/fzTNXY5crKAHMbcX+jOIlpoUqefD
	1tuw=
X-Gm-Gg: ASbGncvx8QusPexkIwdMqQweDWOwSU3QM5wuS8TLmTbsFbsxCTjiTV0kQnUvJqQVDvr
	QunXZMi06IBvISrFGxecHJGa/fAZrpoBFqaAyrqg5XtueX95Rnl7N2gqu3vq/Li9fYFUVqXYxOu
	sS8cApR0RW6X4VfOKViLIh+WlRM0xSiB/C7vasm72ZzXJIl0ONQatRZlCxlylXNtFKzxrJB1pAb
	WpAL3K7sd2CJiZ0KLSFonXrJVkBlTIBUkXLxM5jddyleEp7CK/4SMyOvmFfsgk/Jw9pwXlYwUNX
	9JXzFNMqnynNr4RVgiT0muCAmbpu8PBBSal2ZbNnO4G3WcjyuWqxBzFwYutfJ2f/PIT4Co+oxkq
	/q8DeaYVFRO9lr0h2wRB1Duex
X-Google-Smtp-Source: AGHT+IGCof0JhTSAdYQdce/56DD5XNEy3w8ZdPYZO5KoCPgiM4ne2uskAkivXEycTWMpUnBipiG3OA==
X-Received: by 2002:a05:6512:39cc:b0:553:2868:6357 with SMTP id 2adb3069b0e04-553b6f4307emr2202780e87.50.1750074275103;
        Mon, 16 Jun 2025 04:44:35 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff5dsm1504181e87.31.2025.06.16.04.44.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:44:34 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-551ed563740so4760321e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:44:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWAjGyTnhVNbi2SC+j3TcQ9u/+wFQUU3AOoev3wbj1RhbpAHqhy2U1IyN1QT1kucZwVluYhQWstp0Aw9Eg=@vger.kernel.org
X-Received: by 2002:a05:6512:3d8d:b0:553:26a7:70e0 with SMTP id
 2adb3069b0e04-553b6f31f40mr2247748e87.43.1750074274315; Mon, 16 Jun 2025
 04:44:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
 <20250111-fix-cocci-v6-2-1aa7842006cc@chromium.org> <41cba134-4c8c-bb6d-c68b-a7de8da0689c@quicinc.com>
In-Reply-To: <41cba134-4c8c-bb6d-c68b-a7de8da0689c@quicinc.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 13:44:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCsVN0gXd=0GLALYvoBZ=cBY8daAJBmL=NJ5UteikZLpNg@mail.gmail.com>
X-Gm-Features: AX0GCFuBOjMnH3G2kUW3qtOUSx12VY80ZFNRDQ0cje6-a_VtuYVOFZQBnrrxyFE
Message-ID: <CANiDSCsVN0gXd=0GLALYvoBZ=cBY8daAJBmL=NJ5UteikZLpNg@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] media: venus: vdec: Clamp parm smaller than 1fps
 and bigger than 240.
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vikash

On Mon, 16 Jun 2025 at 13:04, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>
>
> On 1/11/2025 3:25 PM, Ricardo Ribalda wrote:
> > The driver uses "whole" fps in all its calculations (e.g. in
> > load_per_instance()). Those calculation expect an fps bigger than 1, and
> > not big enough to overflow.
> >
> > Clamp the value if the user provides a parm that will result in an invalid
> > fps.
> >
> > Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> > Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
> > Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/platform/qcom/venus/core.h | 2 ++
> >  drivers/media/platform/qcom/venus/vdec.c | 5 ++---
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> > index 44f1c3bc4186..afae2b9fdaf7 100644
> > --- a/drivers/media/platform/qcom/venus/core.h
> > +++ b/drivers/media/platform/qcom/venus/core.h
> > @@ -28,6 +28,8 @@
> >  #define VIDC_RESETS_NUM_MAX          2
> >  #define VIDC_MAX_HIER_CODING_LAYER 6
> >
> > +#define VENUS_MAX_FPS                        240
> > +
> >  extern int venus_fw_debug;
> >
> >  struct freq_tbl {
> > diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> > index 98c22b9f9372..c1d5f94e16b4 100644
> > --- a/drivers/media/platform/qcom/venus/vdec.c
> > +++ b/drivers/media/platform/qcom/venus/vdec.c
> > @@ -481,11 +481,10 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
> >       us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
> >       do_div(us_per_frame, timeperframe->denominator);
> >
> > -     if (!us_per_frame)
> > -             return -EINVAL;
> > -
> > +     us_per_frame = max(USEC_PER_SEC, us_per_frame);
> This logic changes the actual fps from client. Consider a regular encode usecase
> from client setting an fps as 30. The "max(USEC_PER_SEC, us_per_frame)" would
> override it to USEC_PER_SEC and then the subsequent logic would eventually make
> fps to 1.
> Please make it conditional to handle the 0 fps case, i guess that the objective
> in above code, something like below
> if (!us_per_frame)
>   us_per_frame = USEC_PER_SEC;

You are correct. Thanks for catching it!

I think I prefer:
us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);

Regards



>
> Regards,
> Vikash
> >       fps = (u64)USEC_PER_SEC;
> >       do_div(fps, us_per_frame);
> > +     fps = min(VENUS_MAX_FPS, fps);
> >
> >       inst->fps = fps;
> >       inst->timeperframe = *timeperframe;
> >



--
Ricardo Ribalda
