Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A80D12CDBE;
	Thu, 26 Jun 2025 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950505; cv=none; b=u8N7aasQ0C08SiP0Gq/IWimEWmnWDL5YXpvkyCC93346M0dML6uuotiwdwHIQ5M6ToaoBcprCwfeftMdEfjbJatBjsbvRH+EznkLzYLPuqErKoRf8UK7LacdwLPZR2d2Jp7EJC57F1nTTd2Lh3+d2NgF7nnAE9EUEcN9yMnyTlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950505; c=relaxed/simple;
	bh=Ha+edyNTGZ8ndXkb5lo/UV54gtYkiA8WRmrab3d+X4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnzjNKsqhE7cKHzCay6K6H0ahFp4I4dCWPkLBVvZM+I7DQ+mas5V2/p1Lf/0lRHZdqTwfVy3YZI6VUgDWddbJczmOFJeadrF2O93mACBqyeUs0/TeRfFp98NjdF3Y144VteBN+vcVFwaAXcqw6GXIq6G8u3hiC9BVCQbwVNepSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkwbPVJ9; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkwbPVJ9"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32ae3e94e57so9827211fa.1;
        Thu, 26 Jun 2025 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750950502; x=1751555302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFuEEDOzNJYie2aS6VWkJQnYh/biJhh/VjmDxkcdYnA=;
        b=OkwbPVJ9qrz1KvliLjvg5rbn1Kmrlb8FUbchfN0dLrMGdbY6kCgRDkvmTdKpwIAPxv
         EDXp+Go8RnvrUf15xT9kOqZCtUGkTUdhCuADZlJr0Q8NmGgU73rGL72lVy2bRFNUbyXM
         /8411Y/Ax28UR/ASExTwyqa7lv/17O4rVLi2KvU41H2CvLmEUihSLTQ51Vb5Dl7+FV0R
         gxQXDdXnlQ+HRMUTipd5lUsW940aF8LgYzl2CgOQjnLpxUSxxK5dxTrCUet9w+z5mZCF
         k239WYllfi7dBleSAaOw9JGfI2xFNgt4b21IEbdyfSBnhEKhd3SVPnjCa0vLzdkjFZfW
         zJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750950502; x=1751555302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFuEEDOzNJYie2aS6VWkJQnYh/biJhh/VjmDxkcdYnA=;
        b=Y/jTJ68AvU69H8B8eY5LEqBw4EPrDYk8O4WrUOWVS8P8Mc3rEhenyZmP60Xp8ZcHjy
         fnaEHDHBX+mLd8kLiNRghs77We3jj20cjpbI5cs3FqrXUG5CsZzYQmenMthqhcyWHexP
         kp1g6OXG6CFlcYzR7O80dniAxCxFdUZC7jdumsSo51U20QVhmn9IJcep3NWu0QOTKn3U
         n+v+pzosfl1tokrYUL3VYuLBX++JuKhmT0/EIyVaIiDi/FIm6V04rog3opCeDlae6Nim
         711fmGlLGSy47BtOm1kRKyXrjfOTtCsiUM1IKzYfBwC+CbbEaO62gyQ3NVnOUNLjSAFT
         pddQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdkrV12lmFC6islqWe1ZEWj21Lbh86luvlf8bP90yPanclxQp5DsVdvhJHRwTpDAR5HJXF2C4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3I4U3GcviMUFE/mWRdWl9MM0jRkEtoEoUe7z3Rqhpg7so0QwP
	AAc0CE5nyvH+Td/JHmtN5mf207DtZMOPxwQCoApfyGeWPbt9hskK4L3LQSMS8HyzY0Kwqu63G5H
	ouZYEGtHWwR1iacaSsolf0eUU2LW8EWE=
X-Gm-Gg: ASbGncs4ovyaZuq7MBvdbQPlGudtAUgCGX6Z0VVbRqgBRVSaVpIM/XIWURHxoKvyI4p
	FraqfvBr509oUs8RpaeH3HRVd2d/NSshI14hwUMziKusReAYIEokq8goJhdOnD0VU2RN5wHyHMb
	GnOSvuGrjkKyCerajpn4cQODxge2hrhQkNEZSJHhvXDWFLpTZtgAW8xiP/w3thKGzkYIKlU6Uo1
	Ev2xw==
X-Google-Smtp-Source: AGHT+IGrpoccZpE7gCl7xfdKVG914W+wx7VH7Dsg1ZCo+rhw6h3VHHsoRSKoF6qysZJ9WGyQege+2T82Jbrty12yIA0=
X-Received: by 2002:a2e:a011:0:b0:32b:59d1:7ef3 with SMTP id
 38308e7fff4ca-32cc65b7b0cmr18432591fa.35.1750950500472; Thu, 26 Jun 2025
 08:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626142243.19071-1-pranav.tyagi03@gmail.com> <2025062607-hardener-splotchy-1e70@gregkh>
In-Reply-To: <2025062607-hardener-splotchy-1e70@gregkh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Thu, 26 Jun 2025 20:38:09 +0530
X-Gm-Features: Ac12FXz90vVDsL3CpnJRMV-o2H8K_6Vief1VnLAmxr4fTIuJkeSDNsKRMhYHXKg
Message-ID: <CAH4c4jJqX6C4+xvHKqC2fmN7HRhKPgD2XcjnwO2MR0xtMyEhRQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: Fix race-condition between the hrtimer and the
 atomic commit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, hamohammed.sa@gmail.com, 
	daniel@ffwll.ch, airlied@linux.ie, mcanal@igalia.com, arthurgrillo@riseup.net, 
	mairacanal@riseup.net, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org, 
	sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 8:27=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Jun 26, 2025 at 07:52:43PM +0530, Pranav Tyagi wrote:
> > From: Ma=C3=ADra Canal <mcanal@igalia.com>
> >
> > [ Upstream commit a0e6a017ab56936c0405fe914a793b241ed25ee0 ]
> >
> > Currently, it is possible for the composer to be set as enabled and the=
n
> > as disabled without a proper call for the vkms_vblank_simulate(). This
> > is problematic, because the driver would skip one CRC output, causing C=
RC
> > tests to fail. Therefore, we need to make sure that, for each time the
> > composer is set as enabled, a composer job is added to the queue.
> >
> > In order to provide this guarantee, add a mutex that will lock before
> > the composer is set as enabled and will unlock only after the composer
> > job is added to the queue. This way, we can have a guarantee that the
> > driver won't skip a CRC entry.
> >
> > This race-condition is affecting the IGT test "writeback-check-output",
> > making the test fail and also, leaking writeback framebuffers, as the
> > writeback job is queued, but it is not signaled. This patch avoids both
> > problems.
> >
> > [v2]:
> >     * Create a new mutex and keep the spinlock across the atomic commit=
 in
> >       order to avoid interrupts that could result in deadlocks.
> >
> > [ Backport to 5.15: context cleanly applied with no semantic changes.
> > Build-tested. ]
>
> Did you forget about 6.1.y?
>
> confused,
>
> greg k-h

Apologies for the oversight.

Regards
Pranav Tyagi
