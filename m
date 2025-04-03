Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893901F5825
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 18:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743704946; cv=none; b=Yuo1pqfnL1tniZeK/RpfkUuiUmfpHjX69LaLSYaXkEAKXIpM0PiGudlOERjPfrqeP5RRAtDGVqor31zoqbgpNohymCbxGJsgLbIqG0jqJs2l6cGDVFMOGwzSDf30J+mk2bgigg0bsBR/4mUZ6XLGed1aEgxx/3O53rngj/MXSmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743704946; c=relaxed/simple;
	bh=ZqhWvmbms3E941/eXWdBYcYLzBCJcXjsjpYXGdC3AHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAsnmaJbDKhNgX/BXVQ3Z3qFQ4tB2g5BynPaMf0rUiDAtaxpqMEiOkygX07T9OYrTDp2NGYP1kg0IVp4H4akVH1IK+OYQ+Q1e3xVyi+Bsg2lChFBjOIKicRcEopnLg1EQUXXWDqnzqQ5s4jDy30trjCFaJNDvTB5T0veabBP9rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nIh0cbww; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nIh0cbww"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ecfc2cb1aaso12096046d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743704942; x=1744309742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zg2Jb4mjM9lxnbHI+cU1WU+MRHlFBAFnzMfMXnUTkU=;
        b=nIh0cbww6ExWr08HvqB4QQAnH2LDEDRaxRzp1fJGFRf7zyUc1nn/vphpkkIAWmeoek
         tnK0+jXgietyuWRLwJ0mN5ROuPq49Q8QvMECp0f8/Mn6lzV3q4GJ7jHhqK1SRCbrqwP5
         xtD22XdvTlo5WlyEcCJmsHUX3VIHN/nJlrXFhJ//N1ERgcH1+jjpVsn6OU4r8vDYZrmO
         0nfV1lvdWARdh3+EVPHSZIrjDI2NX3RYPcWwfYKbbr5Zowu7mTp2Jf3Jkf3PIzk3Xn5A
         FOwhvNY0vq3wI7261n+jadJsV/s0wB+sxpbP46nxlPGf5QwgpLvSKAe3mGwbnDJNbyXy
         1kqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743704942; x=1744309742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zg2Jb4mjM9lxnbHI+cU1WU+MRHlFBAFnzMfMXnUTkU=;
        b=b5TiuDRJlBEunWaynzZz6SCWVCeWGwOxAXcuc7gr35KAd4a2UvD2jREiGl037EfdDu
         hMbrS2M8Tvu6eLOJzMELDjoGa1VTyPIgCB8+kpJ6/6LnzM/2i8HHlvstuwhDrAHHiR0L
         vJ61uMUMTpYVQiW3N2lG33txmfkcKI0GtOl2CZxYRfUMLvrupbyaicb1k3mKehl67Pvj
         G4btBPfS5slEcwCh8564oyvQVS7xLgBJ0+pSBnFXXivDxgP9gum2h60Ty7Kbw93cY5U+
         r/ZxUiZ/JYEDKXl9VfO7eb/NRluZz0fcZ/2radYLFLElPF4QPq7D2/3Ze5CzHF2QvP8z
         nblw==
X-Forwarded-Encrypted: i=1; AJvYcCWdIvyufg49tlVPBp0i+6CJxYlQGuYd0tgefPXSOL8Q0y3YoY/x2g6dIAijadf1jO/yjGrlb/DQR3eAR6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcNR95jen42/I1rhhCTafO6W2tA7xtmLJ23zOM3VZFPyJ1Z897
	K1MmFeS5XU5nu0IQbdgnU92D9OrutZWZBx2P3gKV5WOPKD2kcP5qx9oOX6csUJVkBlBQO+z8WUo
	fDqCW+mOS/cJ8S/c0v7Vihw0r4KMyorY5Ez4=
X-Gm-Gg: ASbGncuHmt4E4relltLSE5qsTBJ2yDwr+cwntDb0Ga89DYA1IsPZE9XhRfWm5m0k9d6
	FlpwVgHhISNuhDTyeDbu+mjW0LnvpRdYl8i7z0wp4kF0rWoLYxO4K3SAZVTwc5biMCU+fPJ0Vi/
	48+3HvDdtvpv4lmuvWgHqc/x8q1g==
X-Google-Smtp-Source: AGHT+IHsibaa4RBPidnYIYAXhq2+2y4kSK/GuwupDt9JKxbRj5XdTvcv2hG1Fb0FypiFjK2ju0hsk4B5/tpdpR109po=
X-Received: by 2002:a05:6214:246f:b0:6ea:d393:962c with SMTP id
 6a1803df08f44-6f01e794d79mr2777326d6.30.1743704942094; Thu, 03 Apr 2025
 11:29:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com> <20250402011832.2970072-4-yabinc@google.com>
 <CALJ9ZPOvcxswvfbpWkXgJ=WL+HLa33nm0ZzHogYNZ9keXfi1MA@mail.gmail.com>
 <20250402133232.GJ115840@e132581.arm.com> <CAJ9a7Vg4DGzPhnSBh2taTgUTORMY3GUPpJY2bHjkMdFB1=wP=Q@mail.gmail.com>
 <20250402141228.GL115840@e132581.arm.com> <98c1acbc-7e14-4aa1-9c1e-831be9eb4c91@quicinc.com>
In-Reply-To: <98c1acbc-7e14-4aa1-9c1e-831be9eb4c91@quicinc.com>
From: Yabin Cui <yabinc@google.com>
Date: Thu, 3 Apr 2025 11:28:50 -0700
X-Gm-Features: ATxdqUGtjMjAOmTTi5Zmw5NW02fAgATBKw2AhJ4_RGVkvEkMpKCR__WmcLX3QyY
Message-ID: <CALJ9ZPM0wudVk9nVXgTH0kPyzJ0UXbRzVggWwkG3yvyyNoCERQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] coresight: core: Disable helpers for devices that
 fail to enable
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 5:54=E2=80=AFPM Jie Gan <quic_jiegan@quicinc.com> wr=
ote:
>
>
>
> On 4/2/2025 10:12 PM, Leo Yan wrote:
> > On Wed, Apr 02, 2025 at 02:50:22PM +0100, Mike Leach wrote:
> >
> > [...]
> >
> >>>>> @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path=
 *path, enum cs_mode mode,
> >>>>>                  /* Enable all helpers adjacent to the path first *=
/
> >>>>>                  ret =3D coresight_enable_helpers(csdev, mode, path=
);
> >>>>>                  if (ret)
> >>>>> -                       goto err;
> >>>>> +                       goto err_helper;
> >>>>>                  /*
> >>>>>                   * ETF devices are tricky... They can be a link or=
 a sink,
> >>>>>                   * depending on how they are configured.  If an ET=
F has been
> >>>>> @@ -480,14 +480,8 @@ int coresight_enable_path(struct coresight_pat=
h *path, enum cs_mode mode,
> >>>>>                  switch (type) {
> >>>>>                  case CORESIGHT_DEV_TYPE_SINK:
> >>>>>                          ret =3D coresight_enable_sink(csdev, mode,=
 sink_data);
> >>>>> -                       /*
> >>>>> -                        * Sink is the first component turned on. I=
f we
> >>>>> -                        * failed to enable the sink, there are no =
components
> >>>>> -                        * that need disabling. Disabling the path =
here
> >>>>> -                        * would mean we could disrupt an existing =
session.
> >>>>> -                        */
> >>>>>                          if (ret)
> >>>>> -                               goto out;
> >>>>> +                               goto err;
> >>
> >> Going to err here is wrong. The comment above specifically states that
> >> we do _not_ want to disable the path, yet the new code flow disables
> >> helpers.
> >
> > Okay, now I understand here avoids to disable source and links for a
> > sink error.
> >
> >> then falls through to coresight_disable_path_from() - which
> >> the original code avoided and which also disables helpers a second
> >> time.
> >
> > Seems to me, the conclusion for "disables helpers a second time" is
> > incorrect.
> >
> > I checked the coresight_disable_path_from() function, when the current
> > 'nd' is passed to it, it will iterate from the _next_ node after 'nd'.
> >
> >     /* Here 'nd' will be skipped and start from the next node */
> >     list_for_each_entry_continue(nd, &path->path_list, link) {
> >         ...
> >
> >         coresight_disable_helpers(csdev, path);
> >     }
> >
> > This means the _current_ coresight device (here is sink device) will
> > not disable its helpers.  Could you confirm for this?

Yes, without this patch:
If the current coresight device fails to enable, the code calls
coresight_disable_path_from() to disable devices and helpers after this
device. But it doesn't disable helpers for the current device.

With this patch:
1) When the helpers of the current device fails to enable, call
   coresight_disable_path_from() to disable following devices along the
   path.
2) When the current device fails to enable, first disable the helpers for
  the current devices, then call coresight_disable_path_from() to disable
  following devices and helpers.

Regarding the comment about not calling coresight_disable_path_from()
if a sink device fails to enable, I feel that's a case of it not being
necessary,
rather than something that causes logic error. So this patch calls it to av=
oid
duplicating coresight_disable_helpers(). If my understanding is wrong, I am
happy to change to duplicate coresight_disable_helpers() (in three places).

>
> It seems there is an exception that the helper devices connected to the
> sink? The sink device may not the first the device to be enabled in the
> path if the sink device has a helper device.
>
> So I think we should add following logic before return?
>
>                  switch (type) {
>                  case CORESIGHT_DEV_TYPE_SINK:
>                          ret =3D coresight_enable_sink(csdev, mode,
> sink_data);
>                          /*
>                           * Sink is the first component turned on. If we
>                           * failed to enable the sink, there are no
> components
>                           * that need disabling. Disabling the path here
>                           * would mean we could disrupt an existing sessi=
on.
>                           */
>                          if (ret) {
>                                 /* disable the helpers which connected to=
 sink */
>                                 coresight_disable_helpers(csdev, path);
>                                  goto out;
>                         }
>                          break;

This is the change I initially considered. But there are two other cases
(case CORESIGHT_DEV_TYPE_LINK and case default) that may need
to call coresight_disable_helpers() before returning an error.

>
>
> Thanks,
> Jie
>
> >
> > Thanks,
> > Leo
> >
>
