Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3784C2505AF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 20:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744143394; cv=none; b=Z1KkmQMfAb6mLlIZ1u5CYQOz9W1FNY5qdJY/3ZT+wDDscCZ+xwgVyQ+lFRzcD8HlU1DveBM0ehD0Ez4RoeyEu/pl5Z9oKJA9MFenVCBZlGtrUongi1UO1VtpFug93zkN98rFgLkDdtYPoeP5xeW3ArGVQaf9aXAGj26EWH5caVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744143394; c=relaxed/simple;
	bh=+Otf9WjrrPKgfg6yGiXwo0l1zq0oKhjye6gLTZS6yvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tk0E4C/az3rL//Sy5eiJKwtwtYsPccRjC4M1RHILc7FuX/SKG9rnicuNjFfY6AqgvCrJwZtVqCGtByAQUA5dT8jtubeXB8nvKEemEjHjY4TwPfFzbZQTmnNgmeoLb02MItu16ivWujGIKHgcNInFpsV7BOTCIyqA3v2zv+ZLHP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bTdQvuDK; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bTdQvuDK"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3031354f134so4591477a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 13:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744143392; x=1744748192; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mehwUiVlz7/z5KHfhV+Q1AQQejmAf7B/NmHE2o7479g=;
        b=bTdQvuDKzEOTNigjdl43O4VVLPxHsZROSIYkYX8YcyxI7yDFoYxoomuluH8SOotlGr
         UARyog2wi1y0/eVfQTQ09vGGrrQgo2ysmQly4rrbZrHUkiNqi2UX+9E1S2YtahotA8Fp
         q+HM+ONx3X8hyTi5MQhCU+KvNEjkEZeZHPmew7uIqfJteN7GKRl1HTB/9eBog0nuTjc0
         OCjUMRF69hplpUI68bCKqPXa0K4qI52lBg8IXAYndUBb0wTrr6M+nd1mcLPcmAbrnhz/
         Ugs+GOn0r0392mVd/AESzaGXmU0yODtNc4fY5OESdKZBGnSV9dFRYmXy8ZTeYM2OhxSd
         MtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744143392; x=1744748192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mehwUiVlz7/z5KHfhV+Q1AQQejmAf7B/NmHE2o7479g=;
        b=T024U96Lufj3cHN6PTVlyIxOEoKf3OTws9rbLtCXi7VpCFLAY8ZL/68b7vHTIPVm5L
         W0oZQKNJ4Et6vWjMx7oBoNtjtYFhu2KZIpSof2cKBDwmLxUIVdrUy9QrSVGMTBtRM4S0
         bMIy71mdSWbfdDL8Zv2Wi1GJt8Wi4e+bNYQSAdhIajqm4kXsHIFyc46htCEbiME9L7s7
         YFTYQH6JK0KaIEzqXy+TyEMtNEo2Pwv/aNePvq3y4llZoH41VjtZiKBPCTQsdKuMW2Q1
         7oSqvyASGqnzjEZO6JcCCvFnDfh/oySALensoLpZY6uZhIL1PLNxow3jaDKjoLf8xko7
         q3YA==
X-Forwarded-Encrypted: i=1; AJvYcCUqsL6ty0pHOFszO7O7HigCErECg/DCa3W2eqX6+FjbpbDb8Mi7JMJuWhvj7SJbOky4zqpQQVMOKT5FSKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpxYPL1oJCb2EKcUsvUjWj3EIW7So10PDVyTFR74ciFFo8gWQ6
	9anwwOvuqkpIOe4nAyY4T2N5Gve8ZdrT0LEK8YPQ1+LQM98Y/0eK60y8B+42068hVCk7CCK4ZBd
	az87xeXeuUiQ0iPpuZ6tVbWFrY5QHXqmDgLfB
X-Gm-Gg: ASbGncuQu3On+iCs/F988bHc6W73HfagbYdVnbSVPGV57boOjlgetvCHIXlCgCkoLiE
	nLj9QGQ1O17b9F9IUB3vmSIB7JPbXulDzHofy5/ktsXPptPJMT0U080Znjz2Db1OMjg8UE2kmuS
	2wOrGdEKlADapxhLiP4z2fsj4hTrDmF2hz73NhMEKHtzXpKCQLC0h9AMgFLyqxYVCak3ajaA==
X-Google-Smtp-Source: AGHT+IGtGWb6eUUkWxY8GmMQBNcnqZvHvFajRSqQv+lShjf9d+63mfLe+tk4nhM5dqhBVZdhJLi8weQ9qbY2tJuGVlA=
X-Received: by 2002:a17:90b:2590:b0:2f2:ab09:c256 with SMTP id
 98e67ed59e1d1-306dbc3aeecmr798843a91.33.1744143392218; Tue, 08 Apr 2025
 13:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z_PfCosPB7GS4DJl@mini-arch> <20250407161308.19286-1-kuniyu@amazon.com>
 <CANp29Y5RjJD3FK8zciRL92f0+tXEaZ=DbzSF3JrnVRGyDmag2A@mail.gmail.com>
 <CACT4Y+acJ-D6TiynzWef4vAwTNhCNAgey=RmfZHEXDJVrPxDCg@mail.gmail.com> <CANn89iK=SrbwSN20nKY5y71huhsabLEdX=OGsdqwMPZOmNW8Gw@mail.gmail.com>
In-Reply-To: <CANn89iK=SrbwSN20nKY5y71huhsabLEdX=OGsdqwMPZOmNW8Gw@mail.gmail.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 8 Apr 2025 22:16:19 +0200
X-Gm-Features: ATxdqUHZ4TqwrSVVIkJror92e58_nqzO6Pz7ZoMxbuIXg9lHE1m-GgA4mZ4g9FM
Message-ID: <CANp29Y5cTga9UrkySy6GiOco+nOHuDnFOWSb5PF-P0i6hU+hnA@mail.gmail.com>
Subject: Re: [syzbot] [net?] WARNING: bad unlock balance in do_setlink
To: Eric Dumazet <edumazet@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, stfomichev@gmail.com, 
	andrew@lunn.ch, davem@davemloft.net, horms@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	sdf@fomichev.me, syzbot+45016fe295243a7882d3@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 1:33=E2=80=AFPM Eric Dumazet <edumazet@google.com> w=
rote:
>
> On Tue, Apr 8, 2025 at 12:44=E2=80=AFPM Dmitry Vyukov <dvyukov@google.com=
> wrote:
> >
> > On Tue, 8 Apr 2025 at 10:11, Aleksandr Nogikh <nogikh@google.com> wrote=
:
> > >
> > > On Mon, Apr 7, 2025 at 6:13=E2=80=AFPM 'Kuniyuki Iwashima' via syzkal=
ler-bugs
> > > <syzkaller-bugs@googlegroups.com> wrote:
> > > >
> > > > From: Stanislav Fomichev <stfomichev@gmail.com>
> > > > Date: Mon, 7 Apr 2025 07:19:54 -0700
> > > > > On 04/07, syzbot wrote:
> > > > > > Hello,
> > > > > >
> > > > > > syzbot has tested the proposed patch but the reproducer is stil=
l triggering an issue:
> > > > > > unregister_netdevice: waiting for DEV to become free
> > > > > >
> > > > > > unregister_netdevice: waiting for batadv0 to become free. Usage=
 count =3D 3
> > > > >
> > > > > So it does fix the lock unbalance issue, but now there is a hang?
> > > >
> > > > I think this is an orthogonal issue.
> > > >
> > > > I saw this in another report as well.
> > > > https://lore.kernel.org/netdev/67f208ea.050a0220.0a13.025b.GAE@goog=
le.com/
> > > >
> > > > syzbot may want to find a better way to filter this kind of noise.
> > > >
> > >
> > > Syzbot treats this message as a problem worthy of reporting since a
> > > long time (Cc'd Dmitry who may remember the context):
> > > https://github.com/google/syzkaller/commit/7a67784ca8bdc3b26cce2f0ec9=
a40d2dd9ec9396
> > >
> > > Since v6.15-rc1, we do observe it happen at least 10x more often than
> > > before, both during fuzzing and while processing #syz test commands:
> > > https://syzkaller.appspot.com/bug?extid=3D881d65229ca4f9ae8c84
> >
> > IIUC this error means a leaked reference count on a device, and the
> > device and everything it references leaked forever + a kernel thread
> > looping forever. This does not look like noise.
> >
> > Eric, should know more. Eric fixed a bunch of these bugs and added a
> > ref count tracker to devices to provide better diagnostics. For some
> > reason I don't see the reftracker output in the console output, but
> > CONFIG_NET_DEV_REFCNT_TRACKER=3Dy is enabled in the config.
>
> I think that Kuniyuki patch was fixing the original syzbot report.
>
> After fixing this trivial bug, another bug showed up,
> and this second bug triggered "syzbot may want to find a better way to
> filter this kind of noise." comment.

FWIW I've just bisected the recent spike in "unregister_netdevice:
waiting for batadv0 to become free" and git bisect pointed to:

00b35530811f2aa3d7ceec2dbada80861c7632a8
Author: Eric Dumazet <edumazet@google.com>
Date:   Thu Feb 6 14:04:22 2025 +0000

    batman-adv: adopt netdev_hold() / netdev_put()

    Add a device tracker to struct batadv_hard_iface to help
    debugging of network device refcount imbalances.


Eric, could you please have a look?

>
>
> -ETOOMANYBUGS.
