Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4DD4207A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 16:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750522079; cv=none; b=kX3nb5u2GK571z7HBZu2d7XE4SoqQB3UhQj3T/v3lpurYYAbuDMShe8mEmDc9gHS8qNvUvYzN5vQBUCOcbaYw8YLgNuK0J06XoVT5yhr6NLb2gOMNfd09IQLKuIZlK1O3IJBVbfDnwlN5XlC4WAat/LN8k4SO4hRP1hWmFOFvVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750522079; c=relaxed/simple;
	bh=V+tb3LRApxdsSnUdNqwbw8Pm7udHbmvLDcmColGeHj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLEwePHlXtRs0pudDjMtwOdftpTtPkoJb7ojBSUat7rk1c4MCRnqr850L3XEDIx8m4xzXPqydN2mbesj0X9P9zpKc4aXXHjcOgvDtaqo78jSOmJiJWg4RlY4k8xomFH92HQsBCzVeFFqAYEfe4VT9MwKKNLE/ZBuToycflOI70Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1fRO6ll; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1fRO6ll"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a375e72473so1271596f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750522076; x=1751126876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58N/aM/Nl5Kf7+GtBu3cX6Wb6nZLCjzPn9SPGlnULjM=;
        b=K1fRO6llP++4JcC/Ye8HG/9fJ9dCNRop4YLNk+mGydb5CXng9lezQDE5y1pSadvNiX
         +duZrv6wGFdBREddpaDUY7bbibNbm3gXqsDfGLbTMTgY+LUK/fLpDv13DWkryRIW/OsP
         Axj4cHAy/efr9A8tGJ44MFq3N8uUvYqteuii16s1ZV6EXkVgJdaxCyvUFkoO+FaVZbmY
         cg9yGBRNq9SiiIasNw4mT9MUQUJcbLZ/nqkKLslmdWOpodAsW1rkKvMRRwCuIGqjkme9
         kSBAlPCIjxdQ/R+IcKzAdEmkNnjiu0C+LxOnkbBnftDkU/c+7XXzk06oeBQsCG7aX3tq
         WCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750522076; x=1751126876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58N/aM/Nl5Kf7+GtBu3cX6Wb6nZLCjzPn9SPGlnULjM=;
        b=xSxti51/9yaYXQ4W91ZfElKDhEEfkF68X6f9luXUeSQwBVAy6RRNoRo9VcF70n2e4m
         N7WG8mObmPDjFeD4B1c1KLJL59Q5aFW6ciCx6OJmg3MRrPl7CzbXmkuuAeFuq5h4Jkfj
         lqL0Ey7IfhTwiWwOWl7BuopJdWoXRHNGJLcV4T9fP9j909Evgk2BzuQWjIvYkY0BBX2K
         mAhfSobPoJfOSTSZnemx5xjM83hChke0r4r2fSepCB1QApTaJ/3xMEr5RcFyGu3Og1Le
         7GmMBhkzooQ7pq+FPgAeraGPT7ZIkKMWxyogXZQ9xHQHTmBHux2fo88+ayZ3MpZMjmVW
         2zfQ==
X-Gm-Message-State: AOJu0YxmidEVRUQ3dTst13EDDgzXulABz0ERPOn3ZuQwtin+sPBjDltM
	HVTugeP2h7X9TVFEiBrwn4SRTPi8IrSv7JjCkO+UwZkBkJrm3pMw4R8aTZGEgwvo1JXHRvpMeDD
	KiA9A35yuSvLSFncgFTVRd4fnlf9jRnFSKDsh
X-Gm-Gg: ASbGnctPIMZgvV/slXsvmJuEnp+SSusAPRbFzOGiE9giu/nYZAkzHljvtl6JqS0pdYC
	8qnyMR+NHJFit6rD5QUeiKDHAa/Fl70ST6Gk8AnL37HE6ujGTiaxwhagheDOPRZtWaCtqw0zBfE
	2Fo2U8oU/5PU7H1/5B/7Kep8vUiqhnDsp8vV7qOZv+lA==
X-Google-Smtp-Source: AGHT+IFYzlnYxQu6w3TD5Qa4yWW3DCSky086cn2V0poWTYR9sxrDC4jUdxWbvyxqJzRJPRhHQ3qCaayXy8RNiG1XlUA=
X-Received: by 2002:a05:6000:2486:b0:3a3:648e:1b74 with SMTP id
 ffacd0b85a97d-3a6d1193de5mr5018259f8f.6.1750522076069; Sat, 21 Jun 2025
 09:07:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMb39_mAWfeuyDjHR4Ej9fH=PXdH0qUda50R=iqGKVzN1mcHPQ@mail.gmail.com>
 <48ff3e59-db6f-4870-8f0b-3c49dd4d865e@kernel.org> <CAMb39_nRz-9NemdsASTG_34Lm_6a1uw4qLwkqBdn7FnMmN3O7w@mail.gmail.com>
In-Reply-To: <CAMb39_nRz-9NemdsASTG_34Lm_6a1uw4qLwkqBdn7FnMmN3O7w@mail.gmail.com>
From: Walt Holman <waltholman09@gmail.com>
Date: Sat, 21 Jun 2025 11:07:45 -0500
X-Gm-Features: Ac12FXzs81yEO0bGztJwCoBsEbvesg8EIcvUYzo3UZIxcGUTf7Y7EJTGmp9ujsQ
Message-ID: <CAMb39_=0tUsn9u=KB72nT5MUhhdpujsOR1_+yhQTSXbijOM0MQ@mail.gmail.com>
Subject: Re: AMDGPU - Regression: Black screen due to commit 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a
To: Mario Limonciello <superm1@kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, mario.limonciello@amd.com, 
	alexander.deucher@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 11:03=E2=80=AFAM Walt Holman <waltholman09@gmail.co=
m> wrote:
>
> On Sat, Jun 21, 2025 at 10:52=E2=80=AFAM Mario Limonciello <superm1@kerne=
l.org> wrote:
> >
> >
> >
> > On 6/21/25 10:18 AM, Walt Holman wrote:
> > > Hello,
> > >
> > > With the latest drm fixes this week on 6.16-rc2, I am experiencing a
> > > black screen instead of the sddm greeter and the GPU appears to be
> > > locked up. I can ssh into the laptop and reboot it, but that's about
> > > it. I have bisected the commit to commit id:
> > > 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a and upon reverting the
> > > commit, the system works as normal. The hardware is an Asus Rog
> > > Zephyrus G16 with AMD Ryzen AI 9 HX 370 w/ Radeon 890M video. I'm abl=
e
> > > to test patches etc.. if need be.
> >
> > Hi there,
> >
> > By chance do you have an OLED panel?  If so can you please try the patc=
h
> > attached to this bug?
> >
> > https://gitlab.freedesktop.org/drm/amd/-/issues/4338
> >
> > Thanks,
> >
> > >
> > > 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a is the first bad commit
> > > commit 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a (HEAD)
> > > Author: Mario Limonciello <mario.limonciello@amd.com>
> > > Date:   Thu May 29 09:46:32 2025 -0500
> > >
> > >      drm/amd/display: Export full brightness range to userspace
> > >
> > >      [WHY]
> > >      Userspace currently is offered a range from 0-0xFF but the PWM i=
s
> > >      programmed from 0-0xFFFF.  This can be limiting to some software
> > >      that wants to apply greater granularity.
> > >
> > >      [HOW]
> > >      Convert internally to firmware values only when mapping custom
> > >      brightness curves because these are in 0-0xFF range. Advertise f=
ull
> > >      PWM range to userspace.
> > >
> > >      Cc: Mario Limonciello <mario.limonciello@amd.com>
> > >      Cc: Alex Deucher <alexander.deucher@amd.com>
> > >      Reviewed-by: Roman Li <roman.li@amd.com>
> > >      Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > >      Signed-off-by: Alex Hung <alex.hung@amd.com>
> > >      Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> > >      Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > >      (cherry picked from commit 8dbd72cb790058ce52279af38a43c2b302fdd=
3e5)
> > >      Cc: stable@vger.kernel.org
> > >
> > >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 41
> > > +++++++++++++++++++++++++++--------------
> > >   1 file changed, 27 insertions(+), 14 deletions(-)
> > >
> >
>
> Yes, I do have an OLED panel and that patch does make it visible
> again. It is still very dark, but visible.
>
> -Walt

Upon rebooting again, the display was much brighter and is fine. Just
the first boot after that was dark.

-Walt
