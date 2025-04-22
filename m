Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735A5214238
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316758; cv=none; b=rrzBbUw426Qp72XrZ/zVN7tJTmzceNSUggq+H3W5MvDF9RB0BpCj76jrWtpS6b2GfKpAjuAyhVYUGE9otI6YczrPvgTxjtXLHaraGUm3vEROkhTHBpUtcGu8FxiP2vnr3f9aEodUFD6uEx3xrnZbl4JgDNzK7o4nV6IXOU5Z00o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316758; c=relaxed/simple;
	bh=kerRl69mpojlIzzC/Rjmb8JW3z8eblWySJtOnHuiZcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bpP036+ZBecAT6zuyPgLUa9GsOZafOxPtVRXmmMKm055Epzn3Ks+LIdzG1NmPqOU0CDZyIMeVrTYRvlDL4Sb8jCvAC9aTajeGhTHeqX+oJx/NfHDTtq8C8p2CU4wSTc7/Bw8BNty0dgRj+ySF0wwA63bv142olMZu+lhtloG73E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-528ce9730cfso1347210e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316754; x=1745921554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=773iKDLuE6xq2Xro8wyS6G+hqdfsehF8d9eBVRBQ0BI=;
        b=YcfZ8i4vEgfes5Exrcf3mvan9oarrqbn+yPMYeKSgM0yAu+/4cGIuowlKSrpD3Ee6n
         YktnTvJzQPq/BWYUpJ7Nj3flrhGIpmskQjnhvYTbYbFjvWfyeBy1fd5b3btfbvg66+/U
         HBTT1LVzprU4tSWUW34sjo5hoYTAtyytSSpYjsPlh6WWV0MauNNV1O4dInMqX1gRRczU
         9cWVVO9kkgtpcebHt/Oj2UsSeSfPVK/kLbw0Xy9wY6tW/mjiSQ2Zn1p66KW2Vb4aZSO2
         W41CIWQyzQOKFNLxRVZp8oX+igd1sICy2Q5CSbREpHiI5dFlilQZrTHS/HN0mO7Yg/Wc
         G31Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtlWADrKacOhb06GoxgMo89nMeMHIw/VXjIoqdr+y5dcYUhxbsS8uxO216IrtP/zIcWKK+uisAtonttHE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz32VdcFBejed2+yANm+pDE+K7QZFLPFwYmOg4AZSlgKYKcTANW
	7nnXUEHyx8b3+LQDOd04TZDdWWdy1sg/ZKnNVk/a9Pp/BRs4tsCZoupP2Knb
X-Gm-Gg: ASbGnctH88OKa/HxkUy190ZfODk6Dces4xva6faPbTr0pETsNOQTU/hAPlVykU5++br
	UhRJlj7+7H16ksmWyNQZzRByjEJVvxMuTQ6z/MEXXD8Ko920gVh7iP/aVPPuTxnKfx9VOfMxFJJ
	+YzS8gyWt1W0dRBpRzhMERSu3JjqlFeDIc31sgVoGfo6jv0qAXvYJkII2Yx02v43z3Oa7bDcdQQ
	Eo9MNy8gcXyWG1+Y3y21Vx1NI453os5vEWol4gTPcMGujnOTAfPZDQDac/M7/tBIzGdFdGptigQ
	I2oHe9VnkQ8040zMUXGjkMhM9sLU0maFCKZ4CKh3jcrQ5rhXyfxEyVqib+5Kz7ghgcaL56MfFzF
	WDHI=
X-Google-Smtp-Source: AGHT+IHry6l4SwnjmS9PnQJOozKqaLqYHiBdGQfKzIRFUeb3BHAf4YlrlXJR8p23tU2ego3xn6h+uw==
X-Received: by 2002:a05:6122:1d92:b0:526:1ddd:7603 with SMTP id 71dfb90a1353d-529252365dcmr8570516e0c.0.1745316753534;
        Tue, 22 Apr 2025 03:12:33 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52922dbf176sm1881422e0c.40.2025.04.22.03.12.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 03:12:33 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86fab198f8eso1895522241.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:12:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW77Nu+rZWLt5Xz79z3uc4Hks/ZfOYHiPIOwNwmQlhUc0UVMU3FrQEupsEkadh0N74bQuKPxkOB2lH5V/k=@vger.kernel.org
X-Received: by 2002:a05:6102:5c0b:b0:4c4:fdb9:2ea with SMTP id
 ada2fe7eead31-4cb80101085mr7871767137.7.1745316753101; Tue, 22 Apr 2025
 03:12:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327112009.6b4dc430@eldfell> <b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com>
 <20250327175842.130c0386@eldfell> <CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
 <20250331105446.098f0fbe@eldfell> <20250331082135.GB13690@pendragon.ideasonboard.com>
 <20250331135337.61934003@eldfell> <20250401162732.731ef774@eldfell>
 <73bd6628-374d-417f-a30f-88a4b1d157bb@ideasonboard.com> <20250417111315.62a749e5@eldfell>
 <20250421145039.GA19213@pendragon.ideasonboard.com> <20250422121107.572cb7ad@eldfell>
 <CAMuHMdX+yaw_PYsM_N8Gzrt2hbn_5cRN375jLKpwE13ygTvwHA@mail.gmail.com> <20250422130137.2658c646@eldfell>
In-Reply-To: <20250422130137.2658c646@eldfell>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Apr 2025 12:12:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUcG_K=5RHMaq9vTpQo8dPpLAvXfxP8XuzGnx4Nte7++A@mail.gmail.com>
X-Gm-Features: ATxdqUGZbs6BF5hsjehRUxuOo4erq-QyO5S15EM3odm4sDatdl_MdQHKARAHvpA
Message-ID: <CAMuHMdUcG_K=5RHMaq9vTpQo8dPpLAvXfxP8XuzGnx4Nte7++A@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Vishal Sagar <vishal.sagar@amd.com>, 
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Pekka,

On Tue, 22 Apr 2025 at 12:01, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> On Tue, 22 Apr 2025 11:41:29 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, 22 Apr 2025 at 11:11, Pekka Paalanen
> > <pekka.paalanen@haloniitty.fi> wrote:
> > > On Mon, 21 Apr 2025 17:50:39 +0300
> > > Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > > > On Thu, Apr 17, 2025 at 11:13:15AM +0300, Pekka Paalanen wrote:
> > > > > On Wed, 16 Apr 2025 11:59:43 +0300 Tomi Valkeinen wrote:
> > > > > > On 01/04/2025 16:27, Pekka Paalanen wrote:
> > > > > > > On Mon, 31 Mar 2025 13:53:37 +0300 Pekka Paalanen wrote:
> > > > > > >> On Mon, 31 Mar 2025 11:21:35 +0300 Laurent Pinchart wrote:
> > > > > > >>> On Mon, Mar 31, 2025 at 10:54:46AM +0300, Pekka Paalanen wrote:
> > > > > > >>>> On Thu, 27 Mar 2025 17:35:39 +0100 Geert Uytterhoeven wrote:
> > > > > > >>>>> On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen wrote:
> > > > > > >>>>>> On Thu, 27 Mar 2025 16:21:16 +0200 Tomi Valkeinen wrote:
> > > > > > >>>>>>> On 27/03/2025 11:20, Pekka Paalanen wrote:
> > > > > > >>>>>>>> On Wed, 26 Mar 2025 15:55:18 +0200 Tomi Valkeinen wrote:
> > > > > > >>>>>>>>> On 26/03/2025 15:52, Geert Uytterhoeven wrote:
> > > > > > >>>>>>>>>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen wrote:
> > > > > > >>>>>>>>>>> Add greyscale Y8 format.
> > > > > > >>>>>>>>>>>
> > > > > > >>>>>>>>>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > >>>>>>>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > > > >>>>>>>>>>
> > > > > > >>>>>>>>>> Thanks for your patch!
> > > > > > >>>>>>>>>>
> > > > > > >>>>>>>>>>> --- a/include/uapi/drm/drm_fourcc.h
> > > > > > >>>>>>>>>>> +++ b/include/uapi/drm/drm_fourcc.h
> > > > > > >>>>>>>>>>> @@ -405,6 +405,9 @@ extern "C" {
> > > > > > >>>>>>>>>>>     #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> > > > > > >>>>>>>>>>>     #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> > > > > > >>>>>>>>>>>
> > > > > > >>>>>>>>>>> +/* Greyscale formats */
> > > > > > >>>>>>>>>>> +
> > > > > > >>>>>>>>>>> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
> > > > > > >>>>>>>>>>
> > > > > > >>>>>>>>>> This format differs from e.g. DRM_FORMAT_R8, which encodes
> > > > > > >>>>>>>>>> the number of bits in the FOURCC format. What do you envision
> > > > > > >>>>>>>>>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')?
> > > > > > >>>>>>>>>
> > > > > > >>>>>>>>> I wanted to use the same fourcc as on V4L2 side. Strictly speaking it's
> > > > > > >>>>>>>>> not required, but different fourccs for the same formats do confuse.
> > > > > > >>>>>>>>>
> > > > > > >>>>>>>>> So, generally speaking, I'd pick an existing fourcc from v4l2 side if
> > > > > > >>>>>>>>> possible, and if not, invent a new one.
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> what's the actual difference between DRM_FORMAT_R8 and DRM_FORMAT_Y8?
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> Is the difference that when R8 gets expanded to RGB, it becomes (R, 0,
> > > > > > >>>>>>>> 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) where c1..c3 are
> > > > > > >>>>>>>> defined by MatrixCoefficients (H.273 terminology)?
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> That would be my intuitive assumption following how YCbCr is handled.
> > > > > > >>>>>>>> Is it obvious enough, or should there be a comment to that effect?
> > > > > > >>>>>>>
> > > > > > >>>>>>> You raise an interesting point. Is it defined how a display driver, that
> > > > > > >>>>>>> supports R8 as a format, shows R8 on screen? I came into this in the
> > > > > > >>>>>>> context of grayscale formats, so I thought R8 would be handled as (R, R,
> > > > > > >>>>>>> R) in RGB. But you say (R, 0, 0), which... also makes sense.
> > > > > > >>>>>>
> > > > > > >>>>>> That is a good question too. I based my assumption on OpenGL behavior
> > > > > > >>>>>> of R8.
> > > > > > >>>>>>
> > > > > > >>>>>> Single channel displays do exist I believe, but being single-channel,
> > > > > > >>>>>> expansion on the other channels is likely meaningless. Hm, but for the
> > > > > > >>>>>> KMS color pipeline, it would be meaningful, like with a CTM.
> > > > > > >>>>>> Interesting.
> > > > > > >>>>>>
> > > > > > >>>>>> I don't know. Maybe Geert does?
> > > > > > >>>>>
> > > > > > >>>>> I did some digging, and was a bit surprised that it was you who told
> > > > > > >>>>> me to use R8 instead of Y8?
> > > > > > >>>>> https://lore.kernel.org/all/20220202111954.6ee9a10c@eldfell
> > > > > > >>>>
> > > > > > >>>> Hi Geert,
> > > > > > >>>>
> > > > > > >>>> indeed I did. I never thought of the question of expansion to R,G,B
> > > > > > >>>> before. Maybe that expansion is what spells R8 and Y8 apart?
> > > > > > >>>>
> > > > > > >>>> I do think that expansion needs to be specified, so that the KMS color
> > > > > > >>>> pipeline computations are defined. There is a big difference between
> > > > > > >>>> multiplying these with an arbitrary 3x3 matrix (e.g. CTM):
> > > > > > >>>>
> > > > > > >>>> - (R, 0, 0)
> > > > > > >>>> - (R, R, R)
> > > > > > >>>> - (c1 * Y, c2 * Y, c3 * Y)
> > > > > > >>>
> > > > > > >>> I'd be very surprised by an YUV to RGB conversion matrix where the first
> > > > > > >>> column would contain different values. What we need to take into account
> > > > > > >>> though is quantization (full vs. limited range).
> > > > > > >
> > > > > > > Quantization range is indeed good to note. R8 would be always full
> > > > > > > range, but Y8 would follow COLOR_RANGE property.
> > > > > > >
> > > > > > >> That makes Y8 produce (Y, Y, Y), and we have our answer: R8 should be
> > > > > > >> (R, 0, 0), so we have both variants.
> > > > > > >>
> > > > > > >> Can we specify Y, R, G and B be nominal values in the range 0.0 - 1.0
> > > > > > >> in the KMS color processing?
> > > > > > >
> > > > > > > I think this 0.0 - 1.0 nominal range definition for the abstract KMS
> > > > > > > color processing is necessary.
> > > > > > >
> > > > > > > It also means that limited range Y8 data, when containing values 0-15
> > > > > > > or 240-255, would produce negative and greater than 1.0 values,
> > > > > > > respectively. They might get immediately clamped to 0.0 - 1.0 with the
> > > > > > > first color operation they face, though, but the concept seems
> > > > > > > important and carrying over to the new color pipelines UAPI which might
> > > > > > > choose not to clamp.
> > > > > >
> > > > > > Is the behavior of values outside the limited range something that needs
> > > > > > to be defined? We can't know how each piece of HW behaves with
> > > > > > "undefined" input, so should we not just define the behavior as platform
> > > > > > specific?
> > > > >
> > > > > Hi Tomi,
> > > > >
> > > > > it's not undefined nor illegal input in general. The so-called
> > > > > sub-black and super-white ranges exist for a reason, and they are
> > > > > intended to be used in video processing to avoid clipping in
> > > > > intermediate processing steps when a filter overshoots a bit. There are
> > > > > also practices that depend on them, like PLUGE calibration with
> > > > > traditional signals on a display: https://www.itu.int/rec/R-REC-BT.814
> > > > >
> > > > > I think it would be really good to have defined behaviour if at all
> > > > > possible.
> > > > >
> > > > > > In any case: I can't say I fully understood all the discussions wrt.
> > > > > > color spaces. But my immediate interest is, of course, this series =).
> > > > > > So is there something that you think should be improved here?
> > > > >
> > > > > Right, the range discussion is a tangent and applies to all YUV
> > > > > formats, so it's not a new question.
> > > > >
> > > > > > My understanding is that the Y-only pixel formats behave in a well
> > > > > > defined way (or, as well defined as the YUV formats), and there's
> > > > > > nothing more to add here. Is that right?
> > > > >
> > > > > There are two things:
> > > > >
> > > > > - Y8 follows COLOR_RANGE property, just like all other YUV formats.
> > > > > - Y8 implies that Cb and Cr are both neutral (0.0 in nominal values).
> > > > >
> > > > > I'd like these explicitly written down, so that they become obvious to
> > > > > everyone. I suspect either one might be easy to forget when writing
> > > > > code and taking shortcuts without thinking.
> > > > >
> > > > >
> > > > > Laurent,
> > > > >
> > > > > I did find a case where (Y', neutral, neutral) does *not* seem to expand
> > > > > to RGB=(Y, Y, Y): ICtCp. The conversion from ICtCp to L'M'S' does
> > > > > produce (Y', Y', Y'), but the LMS-to-RGB matrix scrambles it.
> > > > >
> > > > > I didn't dig through BT.2020 constant-luminance Y'C'bcC'rc, but I
> > > > > wouldn't be surprised if it scrambled too.
> > > > >
> > > > > Of course, both of the above are not just one matrix. They require two
> > > > > matrices and the transfer characteristic each to compute. KMS color
> > > > > operations cannot implement those today, but with the colorop pipelines
> > > > > they will if the hardware does it.
> > > > >
> > > > > That's why I think it's important to document the assumption of Cb and
> > > > > Cr when not part of the pixel format, and not write down a specific
> > > > > expansion to RGB like (Y, Y, Y).
> > > >
> > > > Every time I discuss color spaces, the scopes of "RGB" and "YUV" seem to
> > > > expand more and more. This makes me wonder how we define those two
> > > > concepts. Taking the conversion from RGB to ICtCp as an example, would
> > > > you consider LMS and L'M'S' as "RGB" formats, and ICtCp as a "YUV"
> > > > format ?
> > >
> > > sorry for the confusion. In this specific context, my use of RGB and
> > > YUV refers to the channels in DRM pixel formats. It might have been
> > > better if all channels in all pixel formats were "anonymous" and merely
> > > numbered because all formats can be used for any color model, but this
> > > is what we have.
> > >
> > > There is some disambiguation in
> > > https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/pixels_color.md
> > > The doc is some years old, so nowadays I might phrase things
> > > differently, but maybe it's easier to read for those new to things as I
> > > wrote it when I was just learning things.
> > >
> > > I would classify ICtCp in the YUV pixel format category, because the
> > > CtCp plane can be sub-sampled (right?). I would classify LMS and L'M'S'
> > > in the RGB pixel format category because they are not sub-sampled AFAIK
> > > although they also do not actually appear as buffer contents, so the
> > > relation to pixel formats is... theoretical.
> > >
> > > IOW, we have a completely artificial split of DRM pixel formats to RGB
> > > and YUV where the only essential difference is that YUV formats can have
> > > sub-sampled variants and RGB formats do not.
> >
> > RGB can be subsampled, too...
> > https://en.wikipedia.org/wiki/Bayer_filter
>
> That's true. What difference are we left with, then?

RGB contains three monochromatic color channels (which may differ from
Red, Green, and Blue, cfr. truncated RGn and Rn formats).
YUV contains one luminance and two chrominance channels.

> We have DRM pixel formats which imply some color model, but do not
> define the variant of each color model (e.g. the Y'CbCr-to-RGB matrix).
>
> I guess the implied color model then implies which API, e.g. KMS plane
> property, is responsible for defining the variant.

Probably (IANADX --- I Am Not A Drm eXpert ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
