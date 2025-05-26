Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C961F9F70
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 14:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268261; cv=none; b=ioN6OXQ4wZKSxlCDxVCwM6FYwunQBkxZmR9ThEKpCLKpQGH9oZ3W0/jIPnre7DQs+49t+Qz+dP9ng9BCEZNsnrED/Nzg0Z42w7L0SOMPK/UovG8akYQJ1R6Fs2S9MhUIv27L8iv43pv/o2ZDTPHBVubjerAYCZHMUJhePitnU9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268261; c=relaxed/simple;
	bh=ph8IzBD5aYSKzdcePSSh//PMBD+pbdghPU0Swt3H/Zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NabGjo/R8mLfUjl8eZlxwCA6CATst7IRdBBKTnh9tuccCZwLmr2DmN43ngvFV9LM3KVLGy4aJx9PJmpPFaCgVHGEBMAqc6DTb9p/XUogdZmrU0VPcLh0ElEvkyeJvx3nDu7mlko43TXDsvI++KWaL5AIZPTU1yZzIcdAl2YV2j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GUPFIERq; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GUPFIERq"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553233211d3so1280259e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748268257; x=1748873057; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q1BjnRhRn4veSe+cpc/v/4Q+Md2q5st6ZbxmQhpMa2c=;
        b=GUPFIERqLhXLs+okbqDlb2SOXmr/53DWthFwVAzdsBqMObLY+1KXjdrv8GJJG8qgOc
         oIkHp3dtk8z7rHvIRxQk0NPhxxYzHB6AH2SdQ7ZqY69zI4rMvRVEaNNShfjC9xfBaRTZ
         aE9vt4C/9jIiqkCk5c7jCkxjfVU8SJebavCM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748268257; x=1748873057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1BjnRhRn4veSe+cpc/v/4Q+Md2q5st6ZbxmQhpMa2c=;
        b=RXY81FLeYeXvFaKbQ4E+pVAfCFpPoN/PpDPk8t/P1EvdiS8mmmHYMGiHVZO3TFJkGC
         DniXLHrKM67SwxiHA0c13VfEEzkhx26k881iE73KX8c/wCUoPOSTTXuacsooupE1h+B3
         7Rlhgc0y562/5PZfj8qXciHrJchL7spaGmisceqAzvRe1UH9geQgFvv2Ilmw9Ewkbhp5
         Mof5DtLR2CgzqBcZtk3Q/YVSf///9ZQ6NAsKeIJHH4ocpOfKFbAArBZ7K4Q7+3pSnI6R
         Ym7hSlHRvZKAZTqqsGgKGIWUZ6a5gAaSVKU7HJ2g7UC2B/vC6ntHDxg2RfPVY/5v0FZL
         3xFA==
X-Forwarded-Encrypted: i=1; AJvYcCX2zN3a7S1c8aVpIbGHrS/2CCOqegBMT0OR5V6dTrbc9vxeHdu4xGKwKjY3aHacdiBPx58JfdiZObFD3zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHEPd7VJWUd+sqHEqy14nRKiU+8ruSPHyY0GOKOz284UlYbECF
	pFR3HbUP8u2HXEXej4WHe5bXBhkJEY3NBAnBOhAmDekRlAFyB08P/a3NL3gVPWTM/tOBsAGrdfm
	JV0k=
X-Gm-Gg: ASbGncvbBMV5Ovv7lbJ4LK+J+ckjI/egICeKJgiMJbsX+CXbJM493R0zzOJ5AeiFqsy
	HldnWFMeaAHXmGImU0YWzwLln3bGb//4+VVhISlFAr9mjV9nYYk3ztKrdf8Rrp/llQUPk/E9lvf
	7HnWHOPvxrn446P767ZRj2SGoFnSy4QNtNcLBAkOeN19Qurcdh0SynWDHzzlBDg6l0lai/MISJF
	l1/L1ha2yc1l59b5FrSQ091ZPfTY1MQiZQHdTUJGVx02zC/wxYJZkWUwxGs8v02DUeubnif98Q8
	O/QjcokhSs0kTjM2SAU50kcanTZHKDgOsiIR3TKeTCBBh/Suwb4hy28emFMgCqsCSFXh751gmYR
	W1UBWoLZPi85X9xyOklQQNuD3
X-Google-Smtp-Source: AGHT+IEK2kRv6oBDNGjiYqc05uf9S1lwTiczdPWQx1CvBB8lZB3PwL0xasTieI1twsXOsKaQgsg6CQ==
X-Received: by 2002:a2e:9a15:0:b0:32a:6994:59f0 with SMTP id 38308e7fff4ca-32a69945decmr2415381fa.14.1748268257263;
        Mon, 26 May 2025 07:04:17 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a6884fe72sm1149941fa.29.2025.05.26.07.04.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 07:04:16 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553233211d3so1280210e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:04:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUq3sYBZX+K61M8a+J9etZqyKNG40a6w0wC5TcyZzlZOqaP2RtVBWN0Sz5I0nwHMhW/9OceLLfNokmrFC0=@vger.kernel.org
X-Received: by 2002:a05:6512:b87:b0:545:60b:f38c with SMTP id
 2adb3069b0e04-5521cba4319mr2738618e87.41.1748268255880; Mon, 26 May 2025
 07:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
 <20250404-uvc-meta-v5-2-f79974fc2d20@chromium.org> <20250526134946.GN17743@pendragon.ideasonboard.com>
In-Reply-To: <20250526134946.GN17743@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 26 May 2025 16:04:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCvPG_3qc4Emhat=NdRZXsmNDD0pwh182bXDFK2TgYN_ug@mail.gmail.com>
X-Gm-Features: AX0GCFvLus6wSHUCxD3q_9w63GGCFq7D3IfeAgh7ku37JSUzb68p0H7rgIVZxVI
Message-ID: <CANiDSCvPG_3qc4Emhat=NdRZXsmNDD0pwh182bXDFK2TgYN_ug@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] media: Documentation: Add note about UVCH length field
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 26 May 2025 at 15:49, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Fri, Apr 04, 2025 at 06:37:35AM +0000, Ricardo Ribalda wrote:
> > The documentation currently describes the UVC length field as the "length
> > of the rest of the block", which can be misleading. The driver limits the
> > data copied to a maximum of 12 bytes.
> >
> > This change adds a clarifying sentence to the documentation to make this
> > restriction explicit.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > index 784346d14bbdbf28348262084d5b0646d30bd1da..42599875331c0066cf529153caccb731148023b9 100644
> > --- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > @@ -44,7 +44,9 @@ Each individual block contains the following fields:
> >          them
> >      * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
> >      * - __u8 length;
> > -      - length of the rest of the block, including this field
> > +      - length of the rest of the block, including this field. Please note that
> > +        regardless of the this value, for V4L2_META_FMT_UVC the kernel will
>
> "the this value" looks like a typo.

Thanks! Will fix in v2

>
> > +        never copy more than 2-12 bytes.
>
> Are you saying here that length can be larger than 12, but only up to 12
> bytes will be copied (when both SCR and PTS are present) ? If that's the
> case, it would be better to fix the driver to clamp the length value to
> the number of bytes actually present in the buffer.

As the documentation says, this is an exact copy of the UVC payload header.

Assuming SCR and PTS, for devices that have metadata length will be
the real length provided by the hardware. but buf[] will only contain
12 bytes.

Replacing the value of length with the actual value will be a uAPI
breakage. I do not think that is a very good idea to change it,
considering that this number is used by parsers.

>
> >      * - __u8 flags;
> >        - Flags, indicating presence of other standard UVC fields
> >      * - __u8 buf[];
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
