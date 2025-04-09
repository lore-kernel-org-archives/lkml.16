Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E948425EF89
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 16:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744215328; cv=none; b=r3wqRbIqIo9c9HwDTirRQxaKdd5JCdc04fD8YDAeS0CcBAhonUJrK0yxYXOuBBgjjYzCV5DB2Ixmy40+kjPY8M2MrqFGv2KDk4oYS4cK6ofwDN+Byb1A2s9AJgldzZMOjyP/IxnfaY0o1vvMEtH5avqMYK1377qnR6WR/Lcp0gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744215328; c=relaxed/simple;
	bh=TyFraC1wec6W/bwPDsMv6GrrwXMPmnkRX9fJ5GULpHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXouqCuvBLOfDUjH3bP2Bp9/hnjmFSfYz+FoIjoEA4PlRrVsbmw+bJ/sC1/XRnKB4L5Yi6SiPJgME2ukwwGKKT8VMr2WdFeJuyjCYvZ1ou9U8x39aiNbfwyy2gvq9Yg50eO76jNS6t9BAjlfjHRQDkjSgJZvy/nn8V8qIw/zA/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D5blHSoU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D5blHSoU"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ef83a6bfaso61945e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744215325; x=1744820125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AX6HRJebXxgN0j6Kt+vb0A+cLH3asXLmfZIk0ptiB/k=;
        b=D5blHSoUgDDNPDHZKuBcJ/dxBbA8u1LFwrJdOKElpI/Ufz/MIlAPOFwhC03ydg+cWE
         luaQyLvb6tNc6QZhHqIMgTgsP5NW1ab7okDaPD+n0KLV+dfeYr8gzTW+FPHngjcMOqlu
         XhsONxjjPuSocA3FHnyqBhA9Na1e2zRvyMGATLSsvOQHEwfYdWSajs506Pq6MbXpte3c
         52Ao3S2SZo43kwspIFn/uXsIpWfjQwtQ6dWcsxDAEi0L+frEIIXKJlHEPIT7whZcXqfs
         1fB398Ct2jtCR06+yeSNpspCVRVEO6h//nOdObID0wjy6uD3jWRpbsglgepY6gbCw9cx
         RUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744215325; x=1744820125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AX6HRJebXxgN0j6Kt+vb0A+cLH3asXLmfZIk0ptiB/k=;
        b=opKDNsRZMdMB7JlwL9vzdxjcincU+nRTQi2b4YWR0i9d6bXTvoBA7nFDAFrxPZs2BS
         1gcpkMeA7k6tAD3csDSrBVOTqBnR3tdetIdtfokRWGxjivw2vrtencO3lT4H0o9LTwWx
         djpiNFOHGIh4M3sngBEfDFXACRvUW5OjGsIHbJh2yKa9dRXU5FAKshfG1Js1BCRXj4d3
         OBypFnFXvJQ6FQw7sMB5oeBhafRUj20n4U2Tc78xd5hq0TN/juztzNtXCFrBggmYxxSH
         IDGQA4pzxEZJgmb77nPeZyyZwQvr3ac8xe+IFHT4Kq/mZ2eNcXK+17UqzAHvl3wpsVJC
         TY/g==
X-Forwarded-Encrypted: i=1; AJvYcCU6jksww9DYLKNfibrw4GH0HJSFcAwiAYfCz+Y16DdENeoVtC7g4Iefo3gVG2i/rVRBmxXOqQJreLXQwEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0TvNghc75yJQfFQ1vStqx7SlP6D/UyLkcK+8gGZRp7qCbumgv
	Z6itR72vja2GP7ujHJOZV6LyReyhDFiIzEkpqwdqLS3JHH46TTxWqw9bVoB3o9rIkM4xXtgmS1s
	Z19SZAb8/7L2Qi2dwZrJ5XDBqDxEZKseCbMay
X-Gm-Gg: ASbGncu90+9Kc2UZ9Hl/2QPzaw+w/k/Rucz2WzlQnjiCkm34OvC6gb54ee1uXpXn2XO
	TkvSEoSmfIw0ZB0kUxSMI9DsLvV2J4/0qmJR/dH/RAYHB7I9h4CTmwT3OJGzt88kXu9QL7KpnnH
	VDLQU7jFhVNJS3QEooN2xRFfx4DSIuRiLgN1a8bAil9hBq9QVv/po=
X-Google-Smtp-Source: AGHT+IHuJaUWIQe1OmXweCKczBzaRaEMUipoZlJdklMi8NW1UF+QTZEGPg9FYI25TB7qlc8iioco1FW152xdI0Ph8ro=
X-Received: by 2002:a05:600c:2e14:b0:439:9434:1b6c with SMTP id
 5b1f17b1804b1-43f2011a342mr943185e9.3.1744215324999; Wed, 09 Apr 2025
 09:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408230204.2775226-1-tjmercier@google.com> <20250409105326.0686ae7a@gmx.net>
In-Reply-To: <20250409105326.0686ae7a@gmx.net>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 9 Apr 2025 09:15:12 -0700
X-Gm-Features: ATxdqUEIcvbsK-PVEEOqQNthwZ8gnC_gREKEJdiXQtf6fH2mzKbwbr_ISEZorAw
Message-ID: <CABdmKX3eyoWx1Lfbak8ekaMHrTSoiK0WwjQmct1dJbFy=21Yow@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: pid_namespace: Add missing sys/mount.h
To: Peter Seiderer <ps.report@gmx.net>
Cc: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 1:53=E2=80=AFAM Peter Seiderer <ps.report@gmx.net> w=
rote:
>
> Hello T.J.,
>
> On Tue,  8 Apr 2025 23:02:02 +0000, "T.J. Mercier" <tjmercier@google.com>=
 wrote:
>
> > pid_max.c: In function =E2=80=98pid_max_cb=E2=80=99:
> > pid_max.c:42:15: error: implicit declaration of function =E2=80=98mount=
=E2=80=99
> >                                        [-Wimplicit-function-declaration=
]
> >    42 |         ret =3D mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
> >       |               ^~~~~
> > pid_max.c:42:36: error: =E2=80=98MS_PRIVATE=E2=80=99 undeclared (first =
use in this
> >                                   function); did you mean =E2=80=98MAP_=
PRIVATE=E2=80=99?
> >    42 |         ret =3D mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
> >       |                                    ^~~~~~~~~~
> >       |                                    MAP_PRIVATE
> > pid_max.c:42:49: error: =E2=80=98MS_REC=E2=80=99 undeclared (first use =
in this function)
> >    42 |         ret =3D mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
> >       |                                                 ^~~~~~
> > pid_max.c:48:9: error: implicit declaration of function =E2=80=98umount=
2=E2=80=99; did
> >                you mean =E2=80=98SYS_umount2=E2=80=99? [-Wimplicit-func=
tion-declaration]
> >    48 |         umount2("/proc", MNT_DETACH);
> >       |         ^~~~~~~
> >       |         SYS_umount2
> > pid_max.c:48:26: error: =E2=80=98MNT_DETACH=E2=80=99 undeclared (first =
use in this
> >                                                                function=
)
> >    48 |         umount2("/proc", MNT_DETACH);
> >
> > Fixes: 615ab43b838b ("tests/pid_namespace: add pid_max tests")
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > ---
> >  tools/testing/selftests/pid_namespace/pid_max.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tools/testing/selftests/pid_namespace/pid_max.c b/tools/te=
sting/selftests/pid_namespace/pid_max.c
> > index 51c414faabb0..96f274f0582b 100644
> > --- a/tools/testing/selftests/pid_namespace/pid_max.c
> > +++ b/tools/testing/selftests/pid_namespace/pid_max.c
> > @@ -10,6 +10,7 @@
> >  #include <stdlib.h>
> >  #include <string.h>
> >  #include <syscall.h>
> > +#include <sys/mount.h>
> >  #include <sys/wait.h>
> >
> >  #include "../kselftest_harness.h"
>
> Predated patch already available, see
>
>         https://lore.kernel.org/linux-kselftest/20250115105211.390370-3-p=
s.report@gmx.net/
>
> Regards,
> Peter

Thanks Peter, looks like that was never taken into anybody's tree?

You can have my:
Reviewed-by: T.J. Mercier <tjmercier@google.com>
