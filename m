Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666ED255F4F;
	Mon, 12 May 2025 06:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747032875; cv=none; b=TaDkbL1fXPjPa/EqpqTfHRp0WrmHkVSdKY1QsvjP9em1KXoGEEzIUN+4pjBr0vYomue4fUDe/u7NCq/yA2SfsvYLZ/zSo6zFSEfygEvuHkgTGz88+t/ioz36hXr9KYPE1cy8iANo+ZLGCnw/x7SEKaCxpCM5YpoSwhvIvfl6+1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747032875; c=relaxed/simple;
	bh=CjCK+P/4K0u22ZSfctP+qqRA7d/Qr40HRVR4jEdKpLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a218ltfC1/ZJIZHylZ8+31Y84Vy9Ozyh9D46I3hTC2z/wNE2gHxg9fsjb4BAZQXUTcxFCCgs9Dz08E7f99dq/69zQk+8ArDak3eVK4c0hWPCEnBgsnDTGKS12J97/0EAtX8NswZJo/XqdUXZh+notfVjlngmWUJr6a9IJAce2dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDGXfV6B; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDGXfV6B"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3da73e9cf17so41960035ab.2;
        Sun, 11 May 2025 23:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747032872; x=1747637672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjCK+P/4K0u22ZSfctP+qqRA7d/Qr40HRVR4jEdKpLA=;
        b=GDGXfV6Bz6ZQ1ScOpUqpJWQyjnq57nb4qPntjgala4n5K42CN/7MMeRttHPEbNNwK1
         RiKeUBFEQZUcc4r1Uzx2CQbZdVf6Iz4LKM3IFDxJu5wUGEwPxoEZediR2EVV7ZcF0pZu
         rzw1ERxxqbSAIJ7M1vZB9j2otpSgL1Y4bXWkGJKwBKWECtEX2UAp4CJ6z+xsS3iNzQhH
         mqNnkPp6MAfrZe2oIBAFeuw0BYmYpKy/OxX8ydogggmcqSxZuBWxwWwVsh8nY2yavBYM
         yOd1GWqCkDOG6YnQiwwgENYNdHpcRjPARfPQTOZ9+SczzM5dJImVysCyeh1y58HlUBdK
         KVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747032872; x=1747637672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjCK+P/4K0u22ZSfctP+qqRA7d/Qr40HRVR4jEdKpLA=;
        b=f0uBSZw4wPPkIDvt/PB6grq7fd63VbzZ4Gg+JJa5qr5Z52BG/6SVIveml5IpA+/4gX
         voS6Maj3ovSvHMniATJkzFVdaizNqa7fouIgwi2fdAQQAMrr/KCdVhuEJUDe8So8Ww5h
         A29o5Vr3pkmf6hEzvQcOXumkkqcL5aq1p36+QrpCQ9FlTRgtqm+D+IGjuoDcjU3l72+w
         Mz/3NIUUJ7KxhOuu1soyiw8KnCNq0OoslaUmiRse+VKKmipD0ij6NWEX23lYZ9aTCeTY
         x97DimYKKavQR9zPiCSjCDeA3J9mXCglKJN6ZxxZVHz3G985lRSK3NXe+/CpS4TxScsr
         qG1w==
X-Forwarded-Encrypted: i=1; AJvYcCV2XrDy1ZpKc/EH9ur35eihPDA5TMRuikIa6s+RQF9wH2+s0xBewcb9y3ZxeFegTda/zszEVuRlfeA=@vger.kernel.org, AJvYcCWN11497cx7Tbm/mZCcE8+ZO+8aCLzm0duZshddWw7hFFBT77Bm+FeSfAEe4VmVnxnO8MaJDsFUqlhwKVp5@vger.kernel.org
X-Gm-Message-State: AOJu0YynN4V+J+U25JeKUGLpmgQls+78K+YCYZwfAAW9bJzeyiEQEksk
	bgRWmXpeNaWHf2YnDwYN20BqPiAYxSP1H4pnWRvB7zqjWzWApYfK7+WOKr3Wta37+m3SnHI7/CM
	EXb4Z04BzdXts+puFk5Ec6CGXjz9k0gB/
X-Gm-Gg: ASbGncu94f8Ibd9RJSqx7/ncB8NDisizhOGCF6vpyMkWr88rcGCcKdKX5aieYiGlKPA
	2TcqcEOLZu1vnWc0LV+JfOOGlb+Kmq+FZ5FjsMnteYMQFtcDvBaqkk2bNpW+gx6OhmjJH51sIhi
	yu9F2jOHhpyQuRrcojaXmrhpVRei0Xdw2xNfI8hFvmiw==
X-Google-Smtp-Source: AGHT+IHA5UkN6ttXUOz5l0Mxxg1kTXifa0uj7ajNGFFKegiX63CpoQzdqo6+H3KiFOCkN6tZffa10uyGN9o9dcZ6ORs=
X-Received: by 2002:a05:6e02:2611:b0:3d5:8923:faa5 with SMTP id
 e9e14a558f8ab-3da7e1e7c60mr128897425ab.10.1747032872323; Sun, 11 May 2025
 23:54:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
 <aCGR4EOcWRK6Rgfv@smile.fi.intel.com>
In-Reply-To: <aCGR4EOcWRK6Rgfv@smile.fi.intel.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 12 May 2025 14:53:56 +0800
X-Gm-Features: AX0GCFvI8uwdt7CAYwwfB-jWNgBEnYFB4l9G08fu0KtnLZlJaJzrnXZt_8pJ0hU
Message-ID: <CAL+tcoDYOwmt+MqUouc=7DCpMyR3HfOhycgruX_n3+eKJxqv9Q@mail.gmail.com>
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net, linux-doc@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux@treblig.org, viro@zeniv.linux.org.uk, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 2:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, May 12, 2025 at 09:12:56AM +0800, Jason Xing wrote:
> > Hi All,
> >
> > I noticed this patch "relay: Remove unused relay_late_setup_files"
> > appears in the mm branch already[1], which I totally missed. Sorry for
> > joining the party late.
> >
> > I have a different opinion on this. For me, I'm very cautious about
> > what those so-called legacy interfaces are and how they can work in
> > different cases and what the use case might be... There are still a
> > small number of out-of-tree users like me heavily relying on relayfs
> > mechanism. So my humble opinion is that if you want to remove
> > so-called dead code, probably clearly state why it cannot be used
> > anymore in the future.
> >
> > Dr. David, I appreciate your patch, but please do not simply do the
> > random cleanup work __here__. If you take a deep look at the relayfs,
> > you may find there are other interfaces/functions no one uses in the
> > kernel tree.
> >
> > I'm now checking this kind of patch in relayfs one by one to avoid
> > such a thing happening. I'm trying to maintain it as much as possible
> > since we internally use it in the networking area to output useful
> > information in the hot paths, a little bit like blktrace. BTW, relayfs
> > is really a wonderful one that helps kernel modules communicate with
> > userspace very efficiently. I'm trying to revive it if I can.
>
> Jason, with all of the respect, if you are interested in keeping things g=
oing
> on, please add yourself to the MAINTAINERS. It will makes the users of th=
e
> legacy code, Andrew and others, who are doing maintainer's/reviewer's job=
,
> and you happy.

I didn't subscribe to LKML because they're too many emails everyday.
Because of this, I missed most of changes in relayfs.

Sure, I'm happy to do so, but I'm not sure how/what the detailed
process is here. I would like to ask the core maintainers/developers
in advance.

Any thoughts on this? Andrew, Jens.

>
> Also note, we usually do not care about the out-of-tree users. The main Q=
 here
> why are they out-of-tree for so long time?

It's due to the history problem. Back then, developers were trying to
develop various file systems to add more debuginfo. As you may notice,
blktrace is the one which manifests the answer.

>
> > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit=
/?h=3Dmm-everything&id=3D46aa76118ee365c25911806e34d28fc2aa5ef997
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
