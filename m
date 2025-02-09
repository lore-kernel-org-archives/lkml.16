Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A361DA3D;
	Sun,  9 Feb 2025 08:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739089532; cv=none; b=sH14M3lPyh4NhxRPvuMnz8nuF9zHDYsnm8Z01R+jhYOImfEpAf8jwVcNHRyOpb/I8Fax7LtVCFoYpf1OhsG7RR55fSa072bQiaFB5ygZ8Lmko2pvyFouDzCeOxhMOIlJOZ1gcgnVscqrjKCr53e7bxfc8a3Pf2iUzXH4DhLJoOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739089532; c=relaxed/simple;
	bh=USlt6WBdDTcM2aycYNDVxBnuOmsJewaFSksVTJXgdgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eX8hY3+aO5FcPWTflfdrcmjUVq2UYgPek4qnMf+ghiY39/v9PiZJlt6Q5qDDgZta4y7GqSGwdxJUdgQJmUe/WdGZRYZl+cDtjKPoZ9GPYvMq7ZssTfy4B5CuSumFYIcfgI311rt1eu4wCU/SyDdQYxIfDHup7VwDAVfgrEH6f7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e44f9db46bso14750276d6.1;
        Sun, 09 Feb 2025 00:25:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739089530; x=1739694330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USlt6WBdDTcM2aycYNDVxBnuOmsJewaFSksVTJXgdgY=;
        b=kbNg814vKqPqtCZIrzvGMRYgy4aQrZGeGqYc2/cEATkqJWy4pNUYvlSMtMQ3oOmUDA
         otloUSNH4m9vNnSpXNASjQT4MTDUlTNzWVI3mf6gXMPBGwyltTdhNWsRerC9fmdLVPYL
         RtaCYYOENNGSWrT3phiUo6Zb+36HAIKzU1yjtf1vZVmu5dBN9yDBf0vp4zhoYgraA6GO
         x4qoQ3Tx5i7D0Q5w4kVWSgo6gs4LlkO/dNg+Led7itvl0rUUjcrd19R1XhqLLyQ9mzFB
         bZb6o0UVRJEXdySTQMxQNNx6gyMK+e5zi5f7DdMbXRYZV5kPdhiW0UZvN4k/QGVXz5s6
         zZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr5N3fmDsfP49Oat1lZkOuWNsis0SGo8crSa3CaySZ7jeZvonUmitu9IjBY/m/bbtO/+CafOmPMrzkYBQ=@vger.kernel.org, AJvYcCWpmtqFkfci6Xwfni2VHRuHVot2hpZD4b+1tCb/HckYDeds66wlaT1jpQXTAopSe23Pm0CRk/ZOEDRRCAxzgXA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8fCHs4hWJleP8QjuOsm/ECD9wJS30SAHIV47vVL8l2/AD2gr6
	mywiNgp3eKSxdxaAzXlA6rWD2Z8okJTHCYd3qVv8rXyzLG7CeGV7
X-Gm-Gg: ASbGnctHKKSjXU1iHs3GSo1VZ3llPTG/y2sRVUi3pDb2hGvzVXb3x+X8ZdlYeGJu+Qk
	sMHQD0d1vgSkJG6t0jM+HOFQNEC6V5VldlzjGr8T05QcmxxP3wnoGNz0Dpyzx2ihgVmJs9RiUhQ
	cpijiYZ2KsS8g7KKa3Wkwu+NnqxRsBJ0b7xs1mitXZ62kJ7d/YVAtVbUxgsnQy59V/3QvWiKjt1
	exWxgjgU1VsjTyJSsC5vB4x6wL0f/JGQlTpsgMS2jTYtiMrmaxbo8b+g5dvlJKwFQAHM1IDVbJ3
	eIT4J8QLWfEaHNwOZwufRaZw
X-Google-Smtp-Source: AGHT+IH0bnSrax4ouGaMRHepnNM7v38bNacxAv9jJN97d/yQxAFzqXYs3yHAdQLLdROltMGZT89cgg==
X-Received: by 2002:ad4:5f89:0:b0:6d8:8a7b:66a4 with SMTP id 6a1803df08f44-6e4455e8913mr144676746d6.14.1739089530028;
        Sun, 09 Feb 2025 00:25:30 -0800 (PST)
Received: from skuld-framework.localnet ([32.221.37.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e441251d52sm29565596d6.108.2025.02.09.00.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 00:25:29 -0800 (PST)
From: Neal Gompa <neal@gompa.dev>
To: Hector Martin <marcan@marcan.st>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com,
 aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 David Airlie <airlied@redhat.com>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject:
 Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma coherent
 allocator abstraction.)
Date: Sun, 09 Feb 2025 03:25:26 -0500
Message-ID: <7742420.9J7NaK4W3v@skuld-framework>
In-Reply-To: <20250207-prehistoric-married-dormouse-3e1aa7@lemur>
References:
 <2025013148-reversal-pessimism-1515@gregkh>
 <1bbdf8b7-a70b-4994-865e-7fcb8d53ebef@marcan.st>
 <20250207-prehistoric-married-dormouse-3e1aa7@lemur>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, February 7, 2025 1:16:11=E2=80=AFPM Eastern Standard Time Konsta=
ntin=20
Ryabitsev wrote:
> On Sat, Feb 08, 2025 at 03:02:11AM +0900, Hector Martin wrote:
> > The centralization concern is valid, but there are technical solutions
> > to this, such as forge federation.
>=20
> Unfortunately, forge federation is really only between Forgejo instances =
and
> is still pretty nascent, afaict. The most promising development in
> decentralized forges that I've seen is Radicle, but I'm yet to try it aga=
in
> ever since they got collectively drunk on bitcoin coolaid a few years ago.

Strictly speaking, this isn't true. Forgefed federation was tested very ear=
ly=20
on with Codeberg's Gitea fork (before it was called Forgejo) and Pagure wit=
h=20
its Forgefed extension[1]. The initial design and development was across th=
ree=20
forge systems (Vervis, Forgejo, and Pagure).

Even before that, Pagure has data portability built into its design in a wa=
y=20
no other forge has today: all project metadata is stored as JSON data check=
ed=20
into specialized Git repos. That means it's trivial to mirror and archive=20
projects to have redundant instances or failover instances to support whate=
ver=20
reliability and high availability guarantees you'd like.

And insofar as cross system contributions, Pagure supports making pull=20
requests that pull from arbitrary Git servers (as long as the Pagure instan=
ce=20
can connect to it) with its remote pull request feature. That has been a co=
re=20
feature for nearly the entire time it has existed.

It's not that it wasn't possible, it's just nobody cares. In the 11 years=20
since Pagure was created, literally no other forge has even intimated that=
=20
they want even *some* of the concepts Pagure has. Extensibility and=20
portability are simply not important concepts to anyone anymore.

If it was, maybe more people would have been excited about Pagure, I'd have=
=20
more contributors to that project, and there'd be more deployments out ther=
e=20
showing it off.

It is what it is, I guess. =E2=98=B9=EF=B8=8F

[1]: https://pagure.io/pagure-forgefed

> > Meanwhile, for better or worse, much of Linux infra *is* centralized -
> > for example, the mailing lists themselves, and a lot of the Git hosting.
>=20
> Yes, but it's at least resilient. If someone knocks out vger.kernel.org,
> kernel development will still continue because maintainers are still cc'd
> directly via email, and email is still the only widely adopted federated
> platform that we have, with nothing else coming anywhere close.
>=20

That's really a self-inflicted choice. Adoption is always a catch-22. If yo=
u=20
really wanted federated forge development and have some aspect of=20
decentralized development, you always can even with forges or other tools.=
=20
It's just not something being considered or explored in the Linux kernel=20
community, despite how much some folks dislike the email-based workflow.

> > At the end of the day, I do not believe a theoretical breakdown of Linux
> > infra would be a major long-term setback to Linux kernel development.
>=20
> We know it's the case when kernel.org went off the air for months in 2011.
> :) Let's keep it that way!
>=20
> > But I'm afraid you'll find much if not most of the true opposition to
> > forges is not technical, it is philosophical or preference-based (even
> > though it may be presented as technical opposition, sometimes to
> > intentionally mislead). This is, in fact, quite a mirror of the R4L
> > situation, where technical arguments ("show me you can write a real
> > driver") quickly lead to non-technical arguments when solutions are
> > proposed ("it's cancer").
> >=20
> > I actually considered moving soc/apple development to a forge personally
> > in the near future (obviously not my call to make any more), and I was
> > fully expecting a pile of pushback, "because that's not how we do things
> > here". Who knows, I might have gotten a "fuck you, either you accept
> > email patches or I remove you from MAINTAINTERS" from Linus.
>=20
> It is my goal to be able to give subsystems a way to use forges without it
> impacting how they interact with upstream or handle tree-wide changes. Th=
at
> is, once I'm done moving things from one Benevolent Company to another.
>=20

Honestly, this is probably not possible. If a subsystem moves to a forge=20
workflow, it pretty much means tree-wide changes need to work partially tha=
t=20
way too.


=2D-=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!



