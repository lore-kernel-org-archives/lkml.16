Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0822219E96D;
	Mon, 16 Jun 2025 13:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079873; cv=none; b=QS6Dm6KxE7GHBsLPUe+UDwn3/lmFo1GpMW99j4P//y/QHt284CEmg+orcewBBx2E/DY4pTN1Ax4mLlaiKizk8eNWNbe1b0ZEQxmtT8GJGMttWrklmshqX8F2A2gMcU6mX8Q2TBBfVUNHZmbV+CK7zAFuvJ8doYC3gJNQu10zFLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079873; c=relaxed/simple;
	bh=KfRC4CA58ZNaePHH5Nts3nHhqBBjximSysKqJjukg0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jaK3jj3ZejIOHBMHExrt4YkjdMtdD+f2hc1RLHqIkcVbibWwD4p/nyh/KEsaacYPVRZ23oqdkcVu4vgpP89RIsj53bIPlqgDBdbO4JzGksk2gMHyik207uMi2yuOKxf7b2NVDnjat9dpQlcu0qmaav85ZZ30L+5il/7uQlB1B4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e7fadc35b5so562418137.3;
        Mon, 16 Jun 2025 06:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079868; x=1750684668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmXeBjS0gcD3gGBhEq1NOdKfwSA0wmxBTbwW/TQKLE8=;
        b=N3Wg+S/5ZVky83mE0uViV/OM3eGnpVqByV4yPbB3wLz4MaHQN1DhRWgQOTFXkAWiOM
         zS/XHS3qGZwsmDgJ1speojQeCb5QA9InwWE/gO8eSRGLNbP+vxFF2gte3Qo87A+GYd1k
         U6fCBbtj12r1Yr9zROISjhTlJKBqqORmqM8VkS8xf7fRKIr+iHNAdaZ24+ot9i4rQ0Jg
         oQQc/o7EEvxQAOhnXs+uP17f4aRHaWEhRMH/CNuPZPt9Ki6bRcuxWB6NeSS37zovSLFc
         gddPamQutdAx9pLMDa1mLngRh+Imd1fVLCZNQPM37MnpNbXYKkYc+gG/xEjM4zrxV2LR
         OkCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQdGVlVhtTkwtqhAcavS3b6kWh7YiDiThJWnXZfFYWDzwY5UoNCJ2ufNdpEjb+YWC3a4T/dAfVtBBA1g2S@vger.kernel.org, AJvYcCWuA6pTIM5bizsAHI1+FvIUC3IEZSlgcY/vyCE/Bp4tbvRKmz/cQYeqoDDnC0xNRHLM5u5L/xAfQJtEfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOEW3V7V5Nac1UgvyzkoldQPqBtdfo349upKszC0kcMW5qJHqH
	7NkgSiTv0DtaWr31KdnvHMq56kKVolc9pToVhFYz3xWhKjmbvFNK8FIfZKf8+5sm
X-Gm-Gg: ASbGncsLcUSka1cg7de301kG1wlM7e/RYn9sypnwbEi9iqXaIuqJ2Ce8vT/K4sb7JX/
	Qqap3Qu13E7+gdKKTZEGZAk/Asg4gw5bM7KBz19TbEeOEbbFyv232S0/mCHsxzW+HIpF/11332O
	jXFP4skOB17e135A0R/9MksFylgAeIdsFRID/fwRa7EE9nFjkJm/fY7PdSkYW49Df1sVTFz8teK
	WWNLbI7CE53SV1waHHKRmk45oy1jz0WGrzKDdJTx6mAH8JSUNcq929Ku1929trxvkhIdFWdLMj8
	yR9mjxUwB5xh59jLfbUpkqmG/L3Fqoyj75bzrfpbaO3g92kSSvibDQGncnR9szi1tfT3x5J90Fq
	kuxQANFt15Q5/KD4ht/dtcQd1
X-Google-Smtp-Source: AGHT+IFNWW1mDVh9gSLk7BF5tny1SYFNuIr/p9U0v44NrkY0332i7YCqhswvdo/lKPXUGlaWYLXxRw==
X-Received: by 2002:a05:6102:390f:b0:4e7:db51:ea5d with SMTP id ada2fe7eead31-4e7f635f59cmr4629145137.6.1750079868289;
        Mon, 16 Jun 2025 06:17:48 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f22ea8d6bsm781108241.11.2025.06.16.06.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:17:47 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e7ade16082so1307990137.1;
        Mon, 16 Jun 2025 06:17:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1BsmHubYo223wRuJAg0LlvpREIGv1ZCeaE1KA62RNJLluFqJjyNGT+Gy/qRZK1lVd5KMtBIVAGkstNDM7@vger.kernel.org, AJvYcCWu5faZCKQiK0YDCWSNreXXoedDG05b9ys3t7/Mp4Ea2DRYbJf4er3btRj5lCxp1vj6xWlUgEhaQqq60w==@vger.kernel.org
X-Received: by 2002:a05:6102:e07:b0:4e7:5f31:7443 with SMTP id
 ada2fe7eead31-4e7f6388321mr5381916137.9.1750079867565; Mon, 16 Jun 2025
 06:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519084055.3787-1-yikai.tsai.wiwynn@gmail.com>
 <20250519084055.3787-2-yikai.tsai.wiwynn@gmail.com> <CAMuHMdVX0risng0cgUp7uOycv2wUNsZ3SgCX8sq=14j6NXjNBw@mail.gmail.com>
 <5f774072-9d85-41d1-acf0-cb95450a16fb@roeck-us.net>
In-Reply-To: <5f774072-9d85-41d1-acf0-cb95450a16fb@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jun 2025 15:17:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjNZTxy8z-vkduk0Depb-6zQYMpV3DTQRBKiDaKaANTQ@mail.gmail.com>
X-Gm-Features: AX0GCFuBdK-Ei84tePbmAmKFDSn28b5_ZMocevzaaQLZkYjgPwmk8KqWPdwi33Y
Message-ID: <CAMuHMdWjNZTxy8z-vkduk0Depb-6zQYMpV3DTQRBKiDaKaANTQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hwmon: (isl28022) Fix current reading calculation
To: Guenter Roeck <linux@roeck-us.net>
Cc: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>, patrick@stwcx.xyz, 
	=?UTF-8?Q?Carsten_Spie=C3=9F?= <mail@carsten-spiess.de>, 
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

On Mon, 16 Jun 2025 at 14:59, Guenter Roeck <linux@roeck-us.net> wrote:
> On 6/10/25 05:27, Geert Uytterhoeven wrote:
> > On Mon, 19 May 2025 at 10:48, Yikai Tsai <yikai.tsai.wiwynn@gmail.com> wrote:
> >> According to the ISL28022 datasheet, bit15 of the current register is
> >> representing -32768. Fix the calculation to properly handle this bit,
> >> ensuring correct measurements for negative values.
> >>
> >> Signed-off-by: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
> >
> >
> >> --- a/drivers/hwmon/isl28022.c
> >> +++ b/drivers/hwmon/isl28022.c
> >> @@ -154,6 +154,7 @@ static int isl28022_read_current(struct device *dev, u32 attr, long *val)
> >>          struct isl28022_data *data = dev_get_drvdata(dev);
> >>          unsigned int regval;
> >>          int err;
> >> +       u16 sign_bit;
> >>
> >>          switch (attr) {
> >>          case hwmon_curr_input:
> >> @@ -161,8 +162,9 @@ static int isl28022_read_current(struct device *dev, u32 attr, long *val)
> >>                                    ISL28022_REG_CURRENT, &regval);
> >>                  if (err < 0)
> >>                          return err;
> >> -               *val = ((long)regval * 1250L * (long)data->gain) /
> >> -                       (long)data->shunt;
> >> +               sign_bit = (regval >> 15) & 0x01;
> >> +               *val = (((long)(((u16)regval) & 0x7FFF) - (sign_bit * 32768)) *
> >> +                       1250L * (long)data->gain) / (long)data->shunt;
> >
> > Isn't this complex operation to convert the 16-bit register value to
> > a two-complement signed number equivalent to a simple cast?
> >
> >      (s16)regval
> >
> > isl28022_read_in() has similar code, but as the sign bit is not always
> > the MSB, it needs two additional shifts:
> >
> >      ((s16)(regval << shift)) >> shift
> >
>
> Yes, I know. This could all be simplified using sign_extend32(), but I really
> wanted to be able to apply it. If someone sends me a register map, maybe I can
> write unit test code and use it to simplify the driver.

Cool, I didn't know we had a helper for that... Thanks ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
