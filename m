Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC9D1A83FB
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093356; cv=none; b=TsFrlhpeGr0mT9TNFi+6wJO8z/XWF3fz/Zdu7C7pHpHTMQA7ybx9IZHCQgFBhghFmc+7QnEq+/pjvkDHyc0x0saqkNMm1aN38Cg0mxUxg8YbWUp5pZqhYCFECna49C2Np+GHX8roQlhEMCts4GAwFvHti+mn+OLUCb5pHgysYtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093356; c=relaxed/simple;
	bh=w6fKN+ar7K8CvoopsWGztq3OYFTh8KIxp+iQRUs10/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XuInc6Vn13vliHkkykWLvb7Cy0ZiB75cYJfw9zaB6ovhyww/tcugCUDOCNFUV4oG48+TdM2X2U6DXdDOIGsnc0hhsFzTchEcr4/uteAqECf9q5GXSnH5L5po3j7XxFWCRoy/D7nIeQoI7ETqRxiqPaWbXl8wLb6Tv9y/muxbnVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86d69774081so589970241.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093352; x=1743698152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibdtL0f3H8DnAPyEw/T+T3QYX14z3U6slG7wOxVtOcQ=;
        b=YWKSy3R3NCRNp3cWX9yz8HsqlZd2Ofw2nezvI7WCn0iImLlQg8a0wHcQtUI/erAoCP
         OdKxZZml9CnHdJWhA4l+zKs9EmPr8XIMiHDjNjaVccGKgAQail1osn4dUz6Qyyi+65/V
         u+Dg0faLDYa3dhmg6jPoWpzO0ghv03vI92D+7mq/CPpFuKsjB1hRQGdv24FBgVZvfbbs
         RxtyFsoDYsWHubzmGVAwMZNxs5GjJZR5nRF/8cyZAIFMwUdr7eMB6zkXBTk2QyJQ9F7f
         3hCE0nuB6/tCUCnucPmpKm4NVVSXCDoAxhJwLPrkA90Fac+hClnjS6PHRQ90knvWjQLl
         eA1g==
X-Forwarded-Encrypted: i=1; AJvYcCUVbcD6SgxfUz2JIpwkTTZmK8rJFfAoWbmCzhM6Hg8GU7b5mxzVH0bOb7F4BXpuH8fGI+ephL31OCI4T/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmMdGZk5kh33qsbmf+5oc+Slqsa8L/MCWXm70bo++sl9ypwz0S
	dLuzl8owO3rUbvJ+vltaLwZOIlpwLh26L27t5SjbAfLUG/SPaKG7MESnBL76HbM=
X-Gm-Gg: ASbGncv4w6G+K4IY07spuNBCENGE6fP7r2Cl0H0tscBeIHc5atvhSMqw+gXDWYlhoyB
	f/KvymwEOBUz5DkKqIOXPHusMZSv4fVXrOiXsmi4+8Hsht0ZtRYivFy/TFXySudVOSAlYd5zwfG
	H6zVmRxJT3fAtLlyyhtxtkjQ6PK712BH43GwTNQgu/WfU5kUvmfOlsuSbW/wfLEfrkdRXsZhCdz
	R+QMsLteADfZHEwyTKlNhjj+n/BlbmgXwqJMrAuf2uAYKUfyAzU8GwnQFmEnG3W/vUVr3SLqELL
	58w9BGyy5mCKfr/VHsGqXDvK6V+o4VOlIizauHzN/DsNwIWEOgtHL4xitxfspi9lTveZj8l2HxB
	2RvXpGr0=
X-Google-Smtp-Source: AGHT+IE0iQAhqo7QIDfW20P0nxcWLW8HpMG0h6PIAInmRslCCodU9/zdPY9AGCozxxtEGrVvDg8JJA==
X-Received: by 2002:a05:6122:c83:b0:520:60c2:3fd with SMTP id 71dfb90a1353d-52600920e5dmr3986964e0c.3.1743093352133;
        Thu, 27 Mar 2025 09:35:52 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5260e7f09dasm29973e0c.19.2025.03.27.09.35.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 09:35:51 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86d69774081so589939241.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6kLHiiEDTSViV3Ggt8aPAxOPpsYNZbswoRDl9eZuumHve3HNmEbX1dHPhiZpJY0LdQh6VGshpOqH9/cI=@vger.kernel.org
X-Received: by 2002:a05:6122:1d48:b0:520:5a87:6708 with SMTP id
 71dfb90a1353d-5260071fe18mr3630874e0c.0.1743093351421; Thu, 27 Mar 2025
 09:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
 <CAMuHMdXM1B1c=62EpcuUdpdpaBRZSJLXb1GBB0egzp7Fyeo5-w@mail.gmail.com>
 <b195971c-52e6-463e-a440-83dde4346e65@ideasonboard.com> <20250327112009.6b4dc430@eldfell>
 <b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com> <20250327175842.130c0386@eldfell>
In-Reply-To: <20250327175842.130c0386@eldfell>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Mar 2025 17:35:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
X-Gm-Features: AQ5f1JpeqSn4PpS1s7kqwyEJE-2D6rFE_STOfuC_nMbBosIVwkbb55ssK1rcc48
Message-ID: <CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Vishal Sagar <vishal.sagar@amd.com>, 
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Pekka,

On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen
<pekka.paalanen@haloniitty.fi> wrote:
> On Thu, 27 Mar 2025 16:21:16 +0200
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> > On 27/03/2025 11:20, Pekka Paalanen wrote:
> > > On Wed, 26 Mar 2025 15:55:18 +0200
> > > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> > >> On 26/03/2025 15:52, Geert Uytterhoeven wrote:
> > >>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen
> > >>> <tomi.valkeinen@ideasonboard.com> wrote:
> > >>>> Add greyscale Y8 format.
> > >>>>
> > >>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > >>>
> > >>> Thanks for your patch!
> > >>>
> > >>>> --- a/include/uapi/drm/drm_fourcc.h
> > >>>> +++ b/include/uapi/drm/drm_fourcc.h
> > >>>> @@ -405,6 +405,9 @@ extern "C" {
> > >>>>    #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> > >>>>    #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> > >>>>
> > >>>> +/* Greyscale formats */
> > >>>> +
> > >>>> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
> > >>>
> > >>> This format differs from e.g. DRM_FORMAT_R8, which encodes
> > >>> the number of bits in the FOURCC format. What do you envision
> > >>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')?
> > >>
> > >> I wanted to use the same fourcc as on V4L2 side. Strictly speaking it's
> > >> not required, but different fourccs for the same formats do confuse.
> > >>
> > >> So, generally speaking, I'd pick an existing fourcc from v4l2 side if
> > >> possible, and if not, invent a new one.
> > >
> > > what's the actual difference between DRM_FORMAT_R8 and DRM_FORMAT_Y8?
> > >
> > > Is the difference that when R8 gets expanded to RGB, it becomes (R, 0,
> > > 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) where c1..c3 are
> > > defined by MatrixCoefficients (H.273 terminology)?
> > >
> > > That would be my intuitive assumption following how YCbCr is handled.
> > > Is it obvious enough, or should there be a comment to that effect?
> >
> > You raise an interesting point. Is it defined how a display driver, that
> > supports R8 as a format, shows R8 on screen? I came into this in the
> > context of grayscale formats, so I thought R8 would be handled as (R, R,
> > R) in RGB. But you say (R, 0, 0), which... also makes sense.
>
> That is a good question too. I based my assumption on OpenGL behavior
> of R8.
>
> Single channel displays do exist I believe, but being single-channel,
> expansion on the other channels is likely meaningless. Hm, but for the
> KMS color pipeline, it would be meaningful, like with a CTM.
> Interesting.
>
> I don't know. Maybe Geert does?

I did some digging, and was a bit surprised that it was you who told
me to use R8 instead of Y8?
https://lore.kernel.org/all/20220202111954.6ee9a10c@eldfell

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
