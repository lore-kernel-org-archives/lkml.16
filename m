Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798BF26C3A3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361192; cv=none; b=M6PR+4a4Cnr2rwu7SRaQSVnVk14b8brH80aIfgia7bpxg1p8NIauxCDMgcGSRHnXE4mKhPRzod1H780JVHgnlVPeEmvgBPpe1Yto17ONOmmgnPr8oL8gtLFH2FEHxH0XwFatql1nnJgKEkbN5gS2LptvWI4UG6Q+FqMTCBxU6Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361192; c=relaxed/simple;
	bh=BEBCuL+HEVEQiBaCPZ5XvZuKChav6VO2aoDzCzNOkCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbuJvC9CI3F6KEfBT2YaEmkZ/ShZ07jq0btdnfSpc0hv6EFkFUeAB3fy/9P4FtNcvjnSUzr+n2C26Siu0fjR7Fi+C8LvWVLKzTp9DHLkFU4k+OdAZz9wFG0k5niazlbEhsrhlKJQgJHGJgRWn6wOFXM1MXTEcWfZYWhdne+yFr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhutCqVT; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhutCqVT"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32ca160b4bcso53795241fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 02:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751361188; x=1751965988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROgPEw9PJSV4rDIb9YQpEctVvh6PzqhiH26Y+jXtSJo=;
        b=nhutCqVTpg+w4d9xSZsV/63N/bATRCh6OamJ6iGxuFIVvm7aFJVIkiYN5ac1lAcpQe
         uJ7QMp5FwMd33I2TWJzBNfQtlfSlPOrZOe3DxPxlXYg0COswjfdSNPoazNHFobJstPPg
         id6dA2B3q3eXoYzBKGCzkXPs1EaaOgX4e1mfg04bqEv+GDSvH4sBSYLG0vcjx7uYcoFi
         +b6hh8lq//KCpucZn32XgZn+so8klrvzUiRl4EWqbG/KouYcqJ9u7sbVkADB7oConIAf
         hp+ztLb6FYRYMc0IJaHwRu4Ae9gEFbE5mUFmYLsJvb0AcXU7wC2ZIqlw2LMGGsY7POSZ
         dKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361188; x=1751965988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROgPEw9PJSV4rDIb9YQpEctVvh6PzqhiH26Y+jXtSJo=;
        b=Fe5H4SRYQdqUupBWAR6OjYs8IqYjwtbYLvcjZs+U2kLuNU0z7WZ57iyhF3FgGFQM5p
         ux7kMskehrMSZfgpqGZv2QchiiNVtCUaZCNx2ElKKBCAr4xAB7FRXMmysWHO5mKwSIyu
         EIqo+ORAZPympkh75W5tnoaCwKoljS3Lpqik3iFpNKHaMbLXC+L0sYSu0dx4JzzVPr6m
         ps1CzVl9zh1B8eBzoJ0DPppg/1pSyeYbXrGja/T9RQzxtzrgVThfA0rtsVdpetRGEcFb
         4rlR8S+/P9Ev+lu0IbcdppHapgjP5O685ZO08RNc3pZ1THdeCcX8Bx5gzDUSig3yGieo
         NeQA==
X-Forwarded-Encrypted: i=1; AJvYcCUk3+nTMxw+d69wGs5cYwb7rwmI3zmjb5BPgi6g3eLrZOuFt+k+PGZjs4/mwHh31pc7UGjJ0SmRP7OuXao=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCEzrwD6CGEQ/HJWSl79BwJTfX94D2Zn/3IaVzxoKT8YrqLj8F
	zhPi1nxN6k1l0EKIfm4qEnmUuIAMUxk8GRYYpWcDKygQIgznSVkxpByXjX9DiL9YOf4LEl7Mnzn
	x6aq6kyHI7uK+jGWI0bQlC4czKhiQw6s=
X-Gm-Gg: ASbGncutHUo4UEh9a1XLRnZCChNS6/17XJC7SC2AdF+l28VbRvr+Y74Ojzatdx4dTGc
	z4U1PcVjnhdj3VuM7aETPGC+EAjdNa7LMCFMb3vSd7MO5xL7FAl2vxAl0tuVehu7pVAsi5jsqOt
	8TvYzL6tTE2sVCgKVaPRcCYU0qoppYqZIJK29iUbEjbv1XwA1jw6V8pxuRJxqhy3kp70pmQkwtI
	DI8VrAc2J+4llU=
X-Google-Smtp-Source: AGHT+IFaRimBXwf+/UEtRyiC+KK+xadzvj9nmalX2Tk87W6sIlFV3Hdmxz/NSxN6EDVUMGJK6IRPijyU9g+dPjzrzUI=
X-Received: by 2002:a05:651c:2205:b0:32b:7614:5745 with SMTP id
 38308e7fff4ca-32cdc4efdf5mr57485841fa.20.1751361188252; Tue, 01 Jul 2025
 02:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628063121.362685-1-pranav.tyagi03@gmail.com> <2025062945-prologue-plutonium-870f@gregkh>
In-Reply-To: <2025062945-prologue-plutonium-870f@gregkh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Tue, 1 Jul 2025 14:42:57 +0530
X-Gm-Features: Ac12FXwHc8lXS26tySAKuBhdyhXYJyZqD9JrvOV0o15Dkdc9IcQXg0PK4LpxJM4
Message-ID: <CAH4c4j+yh99h3V0Ody5yx8DnC=Ee4J0kbEKL85k366FdTyXSdA@mail.gmail.com>
Subject: Re: [PATCH] greybus: loopback: remove gb_loopback_async_wait_all()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, pure.logic@nexus-software.ie, johan@kernel.org, 
	elder@kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 3:17=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, Jun 28, 2025 at 12:01:21PM +0530, Pranav Tyagi wrote:
> > Remove redundant gb_loopback_async_wait_all() as connection is disabled
> > at the beginning and no further incoming/outgoing requests are possible=
.
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > ---
> >  drivers/staging/greybus/loopback.c | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greyb=
us/loopback.c
> > index 1f19323b0e1a..9d0d4308ad25 100644
> > --- a/drivers/staging/greybus/loopback.c
> > +++ b/drivers/staging/greybus/loopback.c
> > @@ -1110,13 +1110,6 @@ static void gb_loopback_disconnect(struct gb_bun=
dle *bundle)
> >       gb_connection_latency_tag_disable(gb->connection);
> >       debugfs_remove(gb->file);
> >
> > -     /*
> > -      * FIXME: gb_loopback_async_wait_all() is redundant now, as conne=
ction
> > -      * is disabled at the beginning and so we can't have any more
> > -      * incoming/outgoing requests.
> > -      */
> > -     gb_loopback_async_wait_all(gb);
>
> How was this tested?  It might be redundant but I don't think you can
> delete this just yet, otherwise we would have done so a long time ago.
>
> And your changelog just says the same thing as this comment, shouldn't
> you write something different?
>
> thanks,
>
> greg k-h

Hi,

Thanks for the feedback. On checking the context, I found the FIXME to
be trivial and build-test the patch. But, it definitely can not guarantee
runtime correctness. I will also try to write better changelogs for future
patches.

Apologies for the noise.

Regards
Pranav Tyagi
