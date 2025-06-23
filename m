Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5173127816A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692821; cv=none; b=mma9WbAXhmJT9uU4kWYeqz7Np8oMrrNx7hXHkdnbXGz/NMUrnMGYtueI85EeUAePUTZNcaIf6Zh0it2Z31D+SwrnjF9aF+hzhXBi8a+N+OqHNKaIxITJlyuHFKYtv7vK0d/ZFybUzewtc61cQ253+ODNPTn1140PacRzL5dO2CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692821; c=relaxed/simple;
	bh=Cs4TW3G3cAT+ctqnTd2L1pJS6wYi331CkCRlXiauZaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eWYJhWMj3TgmEHcFI4mU6nyI1/SSHyKDErIjjSofYm7mITkdR6OJXmQvqcHIL08MvrdXK85JWuQM4sd+jbyja9LzUvRaqyKQGHkJwakWZb9SOAmMkU+nw/+wNYXtjKC2uJs0yNjWKv3p+g/8WamaS4RrDfuInoNs0rzxg1Hilz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEj462My; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEj462My"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b26fabda6d9so807256a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750692819; x=1751297619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHe+LGqfBJmGCRbTD2/3y+0WOmtHelhe1lvAXSQQkuY=;
        b=ZEj462MypQIoYGPtF8IDTuD67Lnn2kOlIjfDQBcFOQbe8rLXJr5Rbz4X6e6qQZunVm
         lZSoYp6H81wL/Smp/MSNFVY+9yJa7s67o8iz8kx51WnEFNG4kPjFtwOmQj/8yL5JpLi8
         42Uo1v4nuMFB69ubHCCK6W63bYq4w8DlZOW8jquVv1fMOqZN16CP7ucKoCSApBiBVDYt
         6P9GQ8GL11FN537KiNZXizYl/7fpNXjgeriZkJfBu0vBnNZurW4LjO/LbVNEJIF7UqoB
         LGMsoCMvazooL7QtYVy7KVKhH1Ryn6on77OouWKykJVQYtT+UFA8yjpfCCnLlElqUYk2
         H5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692819; x=1751297619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHe+LGqfBJmGCRbTD2/3y+0WOmtHelhe1lvAXSQQkuY=;
        b=p5u2wfjMBi1SUTN/rib+DNVu4yCJ9h2rk6HHdUfzmvy8i1Le3f3HsPVmzDeT7rkaIy
         vsoCBOQwdo6WBnZcz6DgKNTSB+Ga8yNW/UzSoaOEe9jYvW7Oxpw4Lhd66lYVs8SlQq21
         I0CYwqOXDDhXDf9Ns7/gKur3c/mZ9VdGhPQ8QB7XgR92yw/Oqx5otyx1gqy1q5oIfiUv
         Bl+H3sE8UGtUjNnghou1eKoUkaxNqa15Dkblhs9OBvWXSDv7nuVPd4vKcqfxYvTQN93K
         RBbTBVbwmD6V1f8cPMkuzGT0iP+XKeKQ0wttAQqv19sOUT7+Y3+CQpiTPUboDbd6hNOx
         3DPw==
X-Forwarded-Encrypted: i=1; AJvYcCUBoAmG7YJBPBpC422WETvaFVuSw4yhvHcOa86e9jYmXaykaU3ulLCRGr3eyj5A55u3qZFEGi86Hf4fgRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDhC4eJ5xmCxMLnKCSYR6RuPBSt7hok9trtmnf7pCh7HnN/6xc
	5Sq/PATDDQqJjZeJFJ/f257CjoOUAe5qF8VDswNMMib+FnFzgjltxPJiqMH2RBCgwHE1QIGz7ag
	yE26kUVQg9iat2Ayl+6uq2KupdEwmLyk=
X-Gm-Gg: ASbGnctBWoZC48uLsoBb7SJwRLRcL1159OApOYTo/C8NDwB/A9SI/iAiiO03KzJ8iKh
	MDY8RKzgM+IO6i3tNSWORNVDUi/VaEcdA9MdJqTtwtxS+6+MhPLiAW4lRtZL5DmQ/qV3C2ZGXqH
	ouOdwHGlvEr2SZdX+ihnLYVoy4kQIpz55ihZg9cZwpFkjr
X-Google-Smtp-Source: AGHT+IFy0hIPZQpb0KxFYps+8s4d6wkHkBYpK00Mn64GDE10ibBhlQWhIkFHec5/EC3NK0BdahywMOMIcsBKZBpxlQ0=
X-Received: by 2002:a17:902:e542:b0:234:ba37:87a3 with SMTP id
 d9443c01a7336-237d97217edmr82924635ad.3.1750692819391; Mon, 23 Jun 2025
 08:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619125507.54384-1-kode54@gmail.com> <DARA1U86AS72.QOIEVZWCFPYC@kode54.net>
 <DATUOZZD8316.2INSL3KL5RA80@kode54.net> <DATV4CAOHVGV.1UJ803EX21II6@gmail.com>
 <DATYCMWH1X28.NE3M8KJ3SPV9@kode54.net>
In-Reply-To: <DATYCMWH1X28.NE3M8KJ3SPV9@kode54.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Jun 2025 11:33:27 -0400
X-Gm-Features: AX0GCFvJMwuOZFcfYlSDPJgah_-90nqioNXt5ljbjpEChyXLvCYPb2q60UyxujM
Message-ID: <CADnq5_OjUp+YpXSdvWrYN+6ofFfyES9Jvwkswf3JmTTMGL=MVQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/amdgpu: Enable async flip for cursor planes
To: Christopher Snowhill <chris@kode54.net>, "Wentland, Harry" <Harry.Wentland@amd.com>, 
	"Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>
Cc: Christopher Snowhill <kode54@gmail.com>, amd-gfx@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Harry, Leo

On Mon, Jun 23, 2025 at 9:38=E2=80=AFAM Christopher Snowhill <chris@kode54.=
net> wrote:
>
> On Mon Jun 23, 2025 at 4:06 AM PDT, Christopher Snowhill wrote:
> > On Mon Jun 23, 2025 at 3:46 AM PDT, Christopher Snowhill wrote:
> >> On Fri Jun 20, 2025 at 3:10 AM PDT, Christopher Snowhill wrote:
> >>> Here's another alternative change, which may be more thorough. It doe=
s
> >>> seem to fix the issue, at least. The issue does indeed appear to be
> >>> no-op plane changes sent to the cursor plane.
> >>>
> >>> If anyone wants to propose style changes, and suggest a proper commit
> >>> message, if this is indeed a welcome fix for the problem, please let =
me
> >>> know.
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_=
atomic_uapi.c
> >>> index c2726af6698e..b741939698e8 100644
> >>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> >>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> >>> @@ -1087,17 +1087,22 @@ int drm_atomic_set_property(struct drm_atomic=
_state *state,
> >>>                     }
> >>>
> >>>                     /* ask the driver if this non-primary plane is su=
pported */
> >>> -                   if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY) {
> >>> -                           ret =3D -EINVAL;
> >>> +                   else if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY)=
 {
> >>> +                           ret =3D drm_atomic_plane_get_property(pla=
ne, plane_state,
> >>> +                                                               prop,=
 &old_val);
> >>> +
> >>> +                           if (ret || old_val !=3D prop_value) {
> >>> +                                   ret =3D -EINVAL;
> >>>
> >>> -                           if (plane_funcs && plane_funcs->atomic_as=
ync_check)
> >>> -                                   ret =3D plane_funcs->atomic_async=
_check(plane, state, true);
> >>> +                                   if (plane_funcs && plane_funcs->a=
tomic_async_check)
> >>> +                                           ret =3D plane_funcs->atom=
ic_async_check(plane, state, true);
> >>>
> >>> -                           if (ret) {
> >>> -                                   drm_dbg_atomic(prop->dev,
> >>> -                                                  "[PLANE:%d:%s] doe=
s not support async flips\n",
> >>> -                                                  obj->id, plane->na=
me);
> >>> -                                   break;
> >>> +                                   if (ret) {
> >>> +                                           drm_dbg_atomic(prop->dev,
> >>> +                                                          "[PLANE:%d=
:%s] does not support async flips\n",
> >>> +                                                          obj->id, p=
lane->name);
> >>> +                                           break;
> >>> +                                   }
> >>>                             }
> >>>                     }
> >>>             }
> >>
> >> Upon further testing and reflection, I have come to the conclusion tha=
t
> >> this is indeed best handled by a kernel fix, rather than breaking user
> >> space.
> >>
> >> I attempted to work around this in wlroots, adjusting 0.18, 0.19, and
> >> 0.20 git with similar patches. First I attempted to stash all the
> >> written properties for the atomic code, storing an initial value of al=
l
> >> 0xFE so it was always likely to write the first time, and only setting=
 a
> >> property if it changed from the last commit.
> >>
> >> This resulted in whole commits breaking for one or both framebuffers
> >> until I ctrl-alt-fx switched to a tty and back again, and this would
> >> work again temporarily.
> >>
> >> So I went back to the drawing board and only withheld seemingly
> >> duplicate plane properties. This "worked", until I attempted to play a
> >> game, and then it started glitching spectacularly, and not updating at
> >> all if the game was doing direct scanout and vrr.
> >>
> >> Clearly this is wrong.
> >>
> >> The wlroots library queues up properties for each commit. On every
> >> commit where the cursor is disabled, it queues up both fb_id=3D0 and
> >> crtc_id=3D0. Every commit. Is this wrong? Should it only be queueing u=
p
> >> the disablement properties once? It also queues up the full plane and
> >> hotspot properties when enabled, even if the cursor doesn't change
> >> position or appearance.
> >
> > Probably should have CC'd the drm misc maintainers when I started pokin=
g
> > drm misc instead of amdgpu. Pity there isn't a list for that...
>
> I am a dumbass, I didn't notice get_maintainer.pl. Added more people,
> and the correct list. Not sure if I should remove amd-gfx, since this
> affects them, somewhat...
>
> However, the intention of this thread was to seek commentary on the
> situation as it is.
