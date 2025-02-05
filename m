Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CC218CC1C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770439; cv=none; b=aJry3McUKgjR2s10GJxJfEwmMyjc9t3oX65jFLPbHHV72WtPfx/bUhqyGK/3ed0rtArBjLE8d++BNFygqCcJJsylDaRVEqTXo/oh3gtKCg+NonpmUFNFyqJyy1451JjXaLnfRgz33a8wMFtbRgboBsl+RQcj+38mB7KKDJRKLG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770439; c=relaxed/simple;
	bh=3CYfzi05aoLo9sCF/I3e6+01g3Aa2sejsVUQTWKhjxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EpgO5FTtNAW3U75MEZn4tOHlDjPaK6MDVsh5tD5S0mIxS09XjmWY1vUy4AnQaLYibCrTckogL/jdTGlOs6fJ7MhxhWQEZbR+C4avPcpYgqEK0oMZjSoBCu9uXxwFA6LkGnhOGVAQQuN4bJAZf2lrJXnlLYQSFf+aWxuKFeJ6U/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RRpwxXrL; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RRpwxXrL"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso2477868a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738770437; x=1739375237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZsVthZSc94vYS4y9WLEquTZvOrBnTYANAgRJZ385Oo=;
        b=RRpwxXrL6ZJX2pzMJ+3GnNdSRqKIAqeNEk20yUxtJ/3KXS7z/szFJVj+wvwUAlJOoh
         tLmxu7atLkxefJI+1iMBF7seTqMPU0gHGrD3KYU63I6OzziKSeNKddLdd/YB+yxGxgvF
         uj1Ek2wPeW5fGGaCt5Y4bPYTRt5ZQiCQR9MTxVPQ94fkdWiIHB9skzkr6b+1qf6wEIw9
         zYYaniIg+GJi1vDb6Pj2YZFMkbVuyOF5/zL5I11OFV3cMhDwmPUhHyB6TneSO50LS/x3
         B94M+HStxz2q+ofSdavhmLnNV7MWIvFyJjR/lPbRcvCO5Jj2wK3mQn9OxiGYrr+vhUeO
         Frhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738770437; x=1739375237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZsVthZSc94vYS4y9WLEquTZvOrBnTYANAgRJZ385Oo=;
        b=vGHVgKam2BEFJ9aBwaYeMq0wlo++BfkiJbYGqN8UkQZqPNA1X8IpRIPkgXxjtlLec/
         Rf0J0O5k1vgPime5KpfuuSLesMZWH7SEk9UmEq6+Dzp7rVSAd5IAXdBz0GMfhNnNlZg1
         m8/Sn4DledPHA1MpKkk5FQBagxnxW+j+dlcJ0eaDaXWQpHU9wdUKsXpkIpD7kNnO9ZUe
         E8WKkPprwvnVFk2eia0E2wMZH502+KQ2id6i1cWZZareCloyF+6BupzaLGhMqDWhIT/D
         mV3Tt/7N9X2Z7lApJOkZgtLFn2sFsYj3UujWxL4c7d2n7T6rFZHlrrvYHhQtsDVkB0ks
         T0Qg==
X-Forwarded-Encrypted: i=1; AJvYcCV5XuZE6r9nPa71hl9+xxwzCJnMFkS/xm0UgljxxsW6hXual6hF4Yiyq4sJk9VpaROvm2p91TUWdFtlqpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YywfFegC6KsBNitzYHfHeSNoL94cSrwiCa9nd5j2dX0qF7Dzyio
	97Sa+GmtrWRsYe1k9L3vP5WQzMRv+fsY0Ouj55pXI0xqvMFnizfDOFp8mNXyggHhQJM5tYjtLC8
	TqsQGulzCu5dZmUgk4UD+qPMIsx3PhaeI6AMn
X-Gm-Gg: ASbGncuxEiDRr3qURqjvNNWkcX2dqEqK5i4RnAaFcpn0IjclmdsFJ3IWdpc2B3re+M8
	aSLiwWeFmpZdtNH7oLw33H07ki6pidx5CmiMF+JXc2ErEXXWcqSi7MaJhuPF0ajiQegg7hV2lFK
	1JbB35eQtKQX+Npo+SXgXpRwQoBMES
X-Google-Smtp-Source: AGHT+IFud1WP91EW/+hByXq9axCts1iFc8tYz89gaIq8QLiecgIxn3kPl+sWrFJpMXdxM67U5+Tskt0BJWcApjaZZ+s=
X-Received: by 2002:a17:90b:3788:b0:2ee:cb5c:6c with SMTP id
 98e67ed59e1d1-2f9e0800495mr4484892a91.22.1738770437015; Wed, 05 Feb 2025
 07:47:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67a34e60.050a0220.50516.0040.GAE@google.com> <CAG48ez3KKEYRU+-Mkk+tq1Onv3QWg0jP6fEKYjNjRS+ziP5dAQ@mail.gmail.com>
 <13bb4bbf-92e7-4c45-a3a8-a52312015f92@lucifer.local>
In-Reply-To: <13bb4bbf-92e7-4c45-a3a8-a52312015f92@lucifer.local>
From: Marco Elver <elver@google.com>
Date: Wed, 5 Feb 2025 16:46:40 +0100
X-Gm-Features: AWEUYZnVgJu-hBrumROm17LDjgKiR98ttkKwCU-Kk9Sxf4sLEppmU-l_b4cXqAE
Message-ID: <CANpmjNNeXjtatBD6Lrz2-1jiqLkpcuk0Ra-6uJKzz3=y86qVuA@mail.gmail.com>
Subject: Re: [syzbot] [mm?] KCSAN: data-race in mprotect_fixup / try_to_migrate_one
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Jann Horn <jannh@google.com>, 
	syzbot <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com>, 
	Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Feb 2025 at 16:11, 'Lorenzo Stoakes' via syzkaller-bugs
<syzkaller-bugs@googlegroups.com> wrote:
>
> On Wed, Feb 05, 2025 at 04:00:06PM +0100, Jann Horn wrote:
> > On Wed, Feb 5, 2025 at 12:41=E2=80=AFPM syzbot
> > <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com> wrote:
> > > syzbot found the following issue on:
> > >
> > > HEAD commit:    d009de7d5428 Merge tag 'livepatching-for-6.14-rc2' of=
 git:..
> > > git tree:       upstream
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=3D12b678a45=
80000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D9e757e376=
2bd630b
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc2e5712cbb1=
4c95d4847
> > > compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for=
 Debian) 2.40
> > >
> > > Unfortunately, I don't have any reproducer for this issue yet.
> > >
> > > Downloadable assets:
> > > disk image: https://storage.googleapis.com/syzbot-assets/9235000a1b88=
/disk-d009de7d.raw.xz
> > > vmlinux: https://storage.googleapis.com/syzbot-assets/098ef82f8ab3/vm=
linux-d009de7d.xz
> > > kernel image: https://storage.googleapis.com/syzbot-assets/4f51f5eb57=
82/bzImage-d009de7d.xz
> > >
> > > IMPORTANT: if you fix the issue, please add the following tag to the =
commit:
> > > Reported-by: syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > BUG: KCSAN: data-race in mprotect_fixup / try_to_migrate_one
[...]
> I hate that we have these landmines waiting for us. Be good to find a way
> to explicitly annotate this, or at least comment somehow.
>
> But agreed, probably adding a READ_ONCE()/WRITE_ONCE() is appropriate at
> least for the proximate thing.
>
> It's a wonder these things don't trigger more, except you need probably
> very precise timing to do it...

They do trigger, but we don't send all of them to LKML.
When we first introduced KCSAN, the notion of "data race" was still
poorly understood. At the time we decided to pre-review a number of
them (but our time to do so has been going down :-/), or let willing
maintainers deal with them directly. A number of articles followed,
such as:
 - https://lwn.net/Articles/816850/
 - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
tools/memory-model/Documentation/access-marking.txt

And I think much of the community has indeed been "Calibrating your
fear of big bad optimizing compilers"
[https://lwn.net/Articles/799218/]. :-)

If you want to see more reports (you can try to search for ones
relevant to you):
https://syzkaller.appspot.com/upstream?manager=3Dci2-upstream-kcsan-gce
(see "moderation")
