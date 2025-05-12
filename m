Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E84A29710B
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083144; cv=none; b=W5Z9J5/GmGvLdblfeoRyT4VFfSP7AY4wAEQ0LWIjL54l+ACwBe03GE9xLDYNNoW41y1OkDv1Gh1dBQgJk8Nv+Dk9kO3j6DtOjCEulPEXKdND6UKJP+/RuO+0SiJg8uvS1iPdf5AlM9ulTidTTWoFAgwtlWA6v7e+A4qRsy8LwZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083144; c=relaxed/simple;
	bh=2MjjREBk5/1QZlGBGatYGmvIr29UZREIKX2GOALW/ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfF9aInxLMLFR8aXq2pYc+EXI5yjaSY2KvmU6Qzbq7QPo/NvtvFQJOk4LtLJNW9fDu0ybqHByJpkx6fW4SRx6o/xe/8/BNxqYCJJk8APzfKWuU5fp8Xq/38/hfniqFMu2IAuJJZr0DvKC40+baG3xgRSms8I4sckJQno0Nkw2vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gTr1Z6s+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gTr1Z6s+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22e09f57ed4so61844855ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747083142; x=1747687942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6GfG77UG8viHHy3JjsFKWwYJM2sK4hIIVI1IRpSg0M=;
        b=gTr1Z6s+inOdjcKvdu9xANkrVVPrVnXeTGSenHuO1RAq7M5s6OKEDv2YrRyUnL3mX5
         OBj56/VV1nit2QnD/rqzrUn/3tpqiyrBnyZMByeQAVQxJp8S3UH4SOx4U2rOqUx0SFnL
         0T5r0OlxA9Ws683KWQywdorJbFxg1vw2fKGlCzQiVr7kgzOXlQg4pYl4syDVDX5HZJBv
         XL9+nVS1VSanV2TOC8tyHtU9Kcuey15HkwxfuoEGM5x3zlKoMe9NtKKd19XY4vJRs45H
         0+YKFhMCqssm4vmNshKKbZV9J2hQgzGq5FCD11sT+6T6Z8yCyA+GUYypsDXCp5kU+vpJ
         3qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747083142; x=1747687942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6GfG77UG8viHHy3JjsFKWwYJM2sK4hIIVI1IRpSg0M=;
        b=QFVLu91kBG4CY2sPdmwETPjM64Ou0rylHLhiGIDIi2ifKnHkG5YaqpybLlPJ5+D7w+
         dDWG7RNgyoEGRzqTbviRNhWpslf4Ez3Te5yAUrtPi1MVruBqILor6dJEq3cXpi7729lc
         YRPH4ECAToV3VEtHJ6xaDJJopl5X9qqzWgtRX0Iyq+jP+dOEEkl5Oe5SI0IUBZuZUgeE
         CvJzfheLHOvb5Ogpl4HyU8HutZCOBZrDBMH+rBVGSFGHQDSpHe8cFilmuYS86lMy33Oo
         nOqi14GoMMIE7m5bzjqCIlSHr4A7VfuWzuIYZvGq7GZAy197rxZA9TDRiWE4zOKeA2qM
         1ujA==
X-Forwarded-Encrypted: i=1; AJvYcCVqEKUhS/PRo31AQA7+tGcxRVhJ/9bvHUZfbVr9//LR73wAoGWmWYivTT+Pcg7UZaPha0gjjiiIwUmiYyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YywSa9kNebD3S2oRRppmGKExFmBpWG0B/JhZEbyoCGUCoZR5pIa
	EBamzhZFLRnJO4ypPkiIzyaYxvjbl78TmMC4zb5EfYbzfH1qkLcvaapUvZzqeB4yY3nogie3OcG
	QOxXSU1zVLESKMJohBKqhL+XZwNwKKD8ncBSR
X-Gm-Gg: ASbGncsczegsyiwt65g3nTM5uL0Js0J2KfD8bTVlAv915mc4vyWwy7lu/9BrnEomfEa
	u7+fZm+UXo/E+GgTepsyoYgBP1gHjR5qm7MrRt2oXJRpnvBjnvgmMMCc1HE0uHNr57WsPns2DBZ
	VbXtQf3rux/7etlMs1v072nEFk6yeqB16c9Kbhj+8flTDzp2Q9XZF065ntujYIMcCpI4nv80Cd6
	w4=
X-Google-Smtp-Source: AGHT+IGo2KrNVqFb05TdeI8WCkeexr8CftNps0Qtdv4Bfo49NwNSA5PN4nlI0133onAbxaqKWw7drqw42px2KtffUHs=
X-Received: by 2002:a17:902:da8d:b0:215:44fe:163d with SMTP id
 d9443c01a7336-2317cb2dc85mr13244745ad.17.1747083142020; Mon, 12 May 2025
 13:52:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6819bfbb.050a0220.a19a9.0007.GAE@google.com> <CAG48ez2pOt_Zf28CnLbVCzo1uBhWfqUjgh4fzDaQo+qceM6kSQ@mail.gmail.com>
 <CAG48ez1BGFn7jw+FYZJxRyyjnR+rrqx1AtNQoR_Jup3tZ-dADQ@mail.gmail.com>
In-Reply-To: <CAG48ez1BGFn7jw+FYZJxRyyjnR+rrqx1AtNQoR_Jup3tZ-dADQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 12 May 2025 22:51:45 +0200
X-Gm-Features: AX0GCFvfPlropsZjoLvfDKTlcfOKWVq_01p3Kd9Jy3_xPGlE_YqBOORK_txQXlY
Message-ID: <CANpmjNP7Ktjq3gUGKqQKgn1tbNZLj2ALRNvF-ZcERZ42KRD6Aw@mail.gmail.com>
Subject: Re: [syzbot] [mm?] KCSAN: data-race in copy_page_from_iter_atomic / pagecache_isize_extended
To: Jann Horn <jannh@google.com>
Cc: syzkaller <syzkaller@googlegroups.com>, 
	syzbot <syzbot+189d4742d07e937d68ea@syzkaller.appspotmail.com>, 
	akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, hughd@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 12 May 2025 at 20:33, 'Jann Horn' via syzkaller-bugs
<syzkaller-bugs@googlegroups.com> wrote:
>
> On Mon, May 12, 2025 at 7:44=E2=80=AFPM Jann Horn <jannh@google.com> wrot=
e:
> > On Tue, May 6, 2025 at 9:52=E2=80=AFAM syzbot
> > <syzbot+189d4742d07e937d68ea@syzkaller.appspotmail.com> wrote:
> > > HEAD commit:    01f95500a162 Merge tag 'uml-for-linux-6.15-rc6' of gi=
t://g..
> > > git tree:       upstream
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=3D17abbb685=
80000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D615460443=
1d9aaf9
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=3D189d4742d07=
e937d68ea
> > > compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef=
89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
> > [...]
> > > IMPORTANT: if you fix the issue, please add the following tag to the =
commit:
> > > Reported-by: syzbot+189d4742d07e937d68ea@syzkaller.appspotmail.com
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > BUG: KCSAN: data-race in copy_page_from_iter_atomic / pagecache_isize=
_extended
> >
> > I think this is a problem with the KCSAN implementation.
> >
> > This is a race between writing to a userspace-owned page and reading
> > from a userspace-owned page.
> >
> > This kind of pattern should be fairly trivial to trigger: If userspace
> > tells the kernel to read from a GUP'd page or pagecache on one thread,
> > and simultaneously tells the kernel to write to the same page on
> > another thread, we'll get a data race. This is not really a kernel
> > data race; it is more like a userspace race whose memory accesses
> > happen to go through the kernel.
> >
> > So I think the fix would be for KCSAN to ignore anything in such
> > pages. The hard part is, I'm not sure how to tell what kind of page
> > we're dealing with from the kernel, some MM people might know...
>
> Or alternatively, if we really do want data_race() operations around
> any memset() or memcpy() on userspace-controlled pages, I guess we'd
> have to pepper a lot of those around the kernel.
>
> Also, I didn't really think about some of what I wrote here - we
> certainly wouldn't want to ignore unannotated accesses to some struct
> located in pagecache that userspace can concurrently write to.
>
> Maybe it would actually make sense to do the opposite of what I said
> to some extent, special-case userspace-mapped pages such that KCSAN
> _always_ alerts on plain access to them...
>
> > distinguishing normal pagecache/anon pages from other pages might be
> > doable, but I guess it probably gets hard when thinking about
> > driver-allocated pages that were mapped into userspace vs
> > driver-allocated pages that are used internally in the driver...

There have been cases where user space was doing something unsafe, and
KCSAN caught it. While technically it's user space's bug to keep,
KCSAN is still telling us something's wrong here.

In the past we'd just ignore these bugs (never release them from
syzbot), but I think we recently changed the rules for some of these
to be sent to the mailing list. They can safely be ignored if deemed
"user space is doing something stupid".

I do think we want to surface such issues in one-off testing
scenarios. However, in the fuzzing/CI context it's not so helpful, so
we might need a way to suppress them. If there's a way to tell by
looking at the stacktrace, we could teach syzbot to ignore such data
races entirely.
