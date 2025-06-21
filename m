Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F8754758
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 16:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750521806; cv=none; b=VwXZ0HDjNy5Uk6Y01dx/MK/4Qg0y4KqKf7zKW0DyEPPLjrZbPuyHVMYZj+nFoSza81fpP/XNp98Nh7YU1mMpBRRe49OOsu/IByIxtZDl2bJiGBVIJ0xxb7pdot7quzIemirldrv6k84VH9POxSxgwnhh+3IUmW4bMf0HIa7W7XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750521806; c=relaxed/simple;
	bh=Qd3RsaDsicNDuCMUo4WDSKehByJMBlTYhhYTVLDnqr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/tyRJC0Bo+priQgaliSvFSN4+Kq7i+reR+l1pkuEnWk7KIxB9rTfdKWEYynxR+hLDoC6tyagXGW7eIG/QGaGK06XaKXjUE9QJXN421vWkx7wuRb2l8qlWxL3VpLNTuUqBpU+eY7sjE0ellubwxyzYKSG/XFTlo+W71rt/ekuy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyTswd4L; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyTswd4L"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so505306f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750521803; x=1751126603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SlfoEKJZtVfpBuVVpwBoG16huIJjQO1wMu2zvowLe8=;
        b=KyTswd4L8g153C6T1lNaJM65HLX8NM43TD9nQTzkfyxA35Way86mW+TIhJqMzenecA
         3Uimx2QbGHwAMkaZsTV9ZSZEG8mxlwrI0xhgSEEfQL7ZyZ9OeR07CNnSjM6m563qyjDl
         OHrh0JNHsR5OMH6tZim76UF3rbXZzqR4f8jW7vxuOpRboyNQT1eN88+zr33jXQ8J74kh
         VSMv8gzUhgdHmPWJlgdWekQN9dPkxG2l9LB65DsfPvvxWNSoc0nhuCBjye3SDL3LHzuc
         Lmk8eTkB9iMJLOnjcfSheWh+Gz44nVses7620EHuZ1TlK+ChXTWlX+lPPY9AnX3u1/oG
         4EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750521803; x=1751126603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SlfoEKJZtVfpBuVVpwBoG16huIJjQO1wMu2zvowLe8=;
        b=wJ0jO5+lPe0/aISziGskiTDGsnVyFebgk4zTNJIFLmX1xbablKQvIC0mmq46gmmAcO
         VBWOXwC5PhUecIKlf9/iIjHkNI0jTuVLeNzcjFZWYZeIcZpyHB4Z5uXesKUG+3oFL3gQ
         OAbdn3brsnuHphgTXcDmRLehUwogf5o+D+nOVzIpfrJv5O+g4KYpgcwCMMBA+VMxxFTA
         XkkpDGIEi1rilpOzUeVMPmV2ck8Q2vEAYPcSUl3aP+HYNPXQkqRxRaUq7HFaY3B0LCOD
         +7RuYdb2/lJXnTog2WhQV7y+74i3xyYAGhVSG29iWKyE575n7gMNqOjz7rXj2Cb68ZWk
         5S0g==
X-Gm-Message-State: AOJu0YzdXt7oRfg5ME7ysfWzZOdjos8aZWqFtEu+Z+txLC4n6GeBIOXL
	DM/R1f/UFcNVgpPKWhwJA+Ms60CoDPBRVr94goTHqRIdkwOPcpXfUqQogpJ4QmFsiJrr5SpnY8k
	saXFMdIwtvm2QNrBzmPwAIeZdgxA0uPs=
X-Gm-Gg: ASbGncvAlgUff5hGSmkBGhswjHmchVXA48xYhEivMc49nOcsuy+4ug/cqMMefj+QJK5
	9UX0TSP7mgo4FKc1m4kUti28e6IXOkxsPFk3jk83Uc9ghMokQOqkyLR5e6iO69YBp+FPnfzRQgr
	yW/lFei7sxXTxLxhiVBhAQl31yO2jk9uHoM+1P4Goeug==
X-Google-Smtp-Source: AGHT+IEOQfPFXqcnFU4O+uPlYG5L2+yGJGGslOHVlu3Co9wZype7hO7z+RSrXdHFtp6Ch3qBlsI5cMQ2U2eex7NKXZQ=
X-Received: by 2002:a5d:5f4b:0:b0:3a4:c713:7d8 with SMTP id
 ffacd0b85a97d-3a6d12ddc8cmr5995447f8f.16.1750521802756; Sat, 21 Jun 2025
 09:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMb39_mAWfeuyDjHR4Ej9fH=PXdH0qUda50R=iqGKVzN1mcHPQ@mail.gmail.com>
 <48ff3e59-db6f-4870-8f0b-3c49dd4d865e@kernel.org>
In-Reply-To: <48ff3e59-db6f-4870-8f0b-3c49dd4d865e@kernel.org>
From: Walt Holman <waltholman09@gmail.com>
Date: Sat, 21 Jun 2025 11:03:11 -0500
X-Gm-Features: Ac12FXyj9E1KO3Vo5uOA5r2pI1iC7Afr0XUqwdVY6wicwUUpAneSbpAxZQNZPp8
Message-ID: <CAMb39_nRz-9NemdsASTG_34Lm_6a1uw4qLwkqBdn7FnMmN3O7w@mail.gmail.com>
Subject: Re: AMDGPU - Regression: Black screen due to commit 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a
To: Mario Limonciello <superm1@kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, mario.limonciello@amd.com, 
	alexander.deucher@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 10:52=E2=80=AFAM Mario Limonciello <superm1@kernel.=
org> wrote:
>
>
>
> On 6/21/25 10:18 AM, Walt Holman wrote:
> > Hello,
> >
> > With the latest drm fixes this week on 6.16-rc2, I am experiencing a
> > black screen instead of the sddm greeter and the GPU appears to be
> > locked up. I can ssh into the laptop and reboot it, but that's about
> > it. I have bisected the commit to commit id:
> > 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a and upon reverting the
> > commit, the system works as normal. The hardware is an Asus Rog
> > Zephyrus G16 with AMD Ryzen AI 9 HX 370 w/ Radeon 890M video. I'm able
> > to test patches etc.. if need be.
>
> Hi there,
>
> By chance do you have an OLED panel?  If so can you please try the patch
> attached to this bug?
>
> https://gitlab.freedesktop.org/drm/amd/-/issues/4338
>
> Thanks,
>
> >
> > 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a is the first bad commit
> > commit 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a (HEAD)
> > Author: Mario Limonciello <mario.limonciello@amd.com>
> > Date:   Thu May 29 09:46:32 2025 -0500
> >
> >      drm/amd/display: Export full brightness range to userspace
> >
> >      [WHY]
> >      Userspace currently is offered a range from 0-0xFF but the PWM is
> >      programmed from 0-0xFFFF.  This can be limiting to some software
> >      that wants to apply greater granularity.
> >
> >      [HOW]
> >      Convert internally to firmware values only when mapping custom
> >      brightness curves because these are in 0-0xFF range. Advertise ful=
l
> >      PWM range to userspace.
> >
> >      Cc: Mario Limonciello <mario.limonciello@amd.com>
> >      Cc: Alex Deucher <alexander.deucher@amd.com>
> >      Reviewed-by: Roman Li <roman.li@amd.com>
> >      Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >      Signed-off-by: Alex Hung <alex.hung@amd.com>
> >      Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> >      Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >      (cherry picked from commit 8dbd72cb790058ce52279af38a43c2b302fdd3e=
5)
> >      Cc: stable@vger.kernel.org
> >
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 41
> > +++++++++++++++++++++++++++--------------
> >   1 file changed, 27 insertions(+), 14 deletions(-)
> >
>

Yes, I do have an OLED panel and that patch does make it visible
again. It is still very dark, but visible.

-Walt
