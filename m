Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4554360
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744848685; cv=none; b=B5MAtbAYMbHPPcCSgSidNwjH6w3O6CitZwcJj4O7eyXJQp3cgpPn9WcMBIzIwyPKagbIx73ls9xEB4x3Tft6Wc+ys1ttvspMg21v5UwMlFDRTB93PSF3f5jSgsgxd+91sL8CWAQ1w6mZpZMdOWf+Ttmgq9iRUigCHm5GadyC41o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744848685; c=relaxed/simple;
	bh=w1BDSlGQSuTccuHPUciANQC7+kFvBKHpDf/vnt1wHnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Va5XK6xitzNLrfxIXKc4EA/pe4hgSthQyA6m/3AtmZwYboa+cQKx58ek/r9qGN5Zq0dDY5Q/E9H4BXzG73K7j+NO4e/eBqtYRdLhUnmjajfu7RH63U514dKGeVEruv1xP0kfOVRWULvkAo6QI6TnTbcRQ4g9G8sljHXQEa6XLC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fz9cqEfv; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fz9cqEfv"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4774611d40bso123981cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744848682; x=1745453482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1BDSlGQSuTccuHPUciANQC7+kFvBKHpDf/vnt1wHnE=;
        b=fz9cqEfvjmEHdFn5pnRGIhXE5SUD8bcMKHD+995rgVpHpTp7ciUjFndFvvbfK0P0E6
         H3fSEA2PKOy94DB/of4rpQZ2Na7UwmktaGPzcZarYFnDB2meFfqdAcSrE2ukCQdKqE1H
         2Dfbo7k90N9C6BuUfOHJdeXEV+h5yb+iJErPq+qUdTruGNrrTAVlRkzPc2aWz60yMXSo
         NcaY3q8v0QNvmGaM581J/Sl1/LLm67oe8XCt1lU4J0Hbq+ELeGJLu3bzdayfCFB8/g/u
         8JRqpe53Q+eHPGwcUQ2b/FgBmWk4k2gVFlgnAGTaEKc73sC1SWghheCEKDEBXeo8H7Pu
         gAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744848682; x=1745453482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1BDSlGQSuTccuHPUciANQC7+kFvBKHpDf/vnt1wHnE=;
        b=oCsYjh5S8nmJ92xjAXllucyiX6ZCMbFCLsI6YcxUTQTp5V6G/5SSU0FQKvKs1JOcTo
         6/Mp5iwVq2/CRBpq5UrCthHLCiGYETu6Op7/r2YetcZOObYzyB29qRm8EeD6lYHDIWos
         VuEeu6vIdXDtOQFVNjjRqPM1Uh4knkZDZuH0wjR0bGYHztemBEcNA9Cw/unlooWLqt+c
         9hYhcRD9BbW8VHIjEcq19ju/+gTteFBaIe0+BikGOUy2oqqW+1GMSTrdBe+sL8UKOJOB
         EmzpNW6hEudP2JJ1S+GDG+9i1KHXOicEtqSS2gtY1r1vII1TsgwLSlO9fP8SLLGinBqg
         9sCg==
X-Forwarded-Encrypted: i=1; AJvYcCUnTNrsKfKsdXtre7ty7bFSReV0mWqKD4v6F3ntI6aumGYrrAKYor0OZIivF4P4IkKhZllppuoiZ+Pkc+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMwVahcpPYVNcMrzFta54FlxdfQEH9Iv9cqOv1si3VHbKyETtn
	5mI1ko1AK9DkAoyADcz58341r5fMzFJcldgh63AnzY9Y96kdYh4l0k7XAiFt8LKs65+SpCwai+1
	B0drImxwd1LnfQ2/C0DRwwchTb5VExjLMy3rH
X-Gm-Gg: ASbGncvv57w29xt+J30owlDgWNMYTGcNWAop4oDD2ULKcIoEako3B3xjsT50K2PCVnD
	18Lg6V9cmeC4qAY1eHbTixJcrNrj3UTlvkWAhJrI5p38GYxgL0SM43PDNw8Q28+EAZlOK+MW33p
	MOXF2yY6Gkqpg9Xj/avgzH
X-Google-Smtp-Source: AGHT+IHSICZJaJDQa5wUIbxX/a79r/JHtgBdixHts/IERewVZ1fKnH9pWrijJQ7J8EbRQCA9x4SKKaHAoQsx+a5+75w=
X-Received: by 2002:ac8:7fd0:0:b0:471:9480:a14b with SMTP id
 d75a77b69052e-47ade60c5aemr1802501cf.12.1744848682352; Wed, 16 Apr 2025
 17:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416180653.3438158-1-usamaarif642@gmail.com>
 <CAJuCfpEKrX+1_SJ5fOyT6JLDSNcDxjcfBMj9_siVZt-rX5WQ=w@mail.gmail.com> <72pac6pkjebt6xo7engiuuu7r3zr7fu6fh6bj77f22m7gslxgr@3gjawofplas2>
In-Reply-To: <72pac6pkjebt6xo7engiuuu7r3zr7fu6fh6bj77f22m7gslxgr@3gjawofplas2>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 16 Apr 2025 17:11:11 -0700
X-Gm-Features: ATxdqUHWXeU1hb0SN-sebVEyHfUhDtTAxpoeCPHWnHtrz8sk-skFNWe3liRyneU
Message-ID: <CAJuCfpHcUfXb8RaGCExLc5U2HK3xcA0CjY1diM=S6DDqNFFykg@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: introduce Kconfig option for default
 compressed profiling
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Usama Arif <usamaarif642@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-mm@kvack.org, hannes@cmpxchg.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 2:41=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> On Wed, Apr 16, 2025 at 02:08:31PM -0700, Suren Baghdasaryan wrote:
> > On Wed, Apr 16, 2025 at 11:06=E2=80=AFAM Usama Arif <usamaarif642@gmail=
.com> wrote:
> > >
> > > With this Kconfig option enabled, the kernel stores allocation tag re=
ferences
> > > in the page flags by default.
> > >
> > > There are 2 reasons to introduce this:
> > > - As mentioned in [1], compressed tags dont have system memory overhe=
ad
> > > and much lower performance overhead. It would be preferrable to have =
this as
> > > the default option, and to be able to switch it at compile time. Anot=
her
> > > option is to just declare the static key as true by default?
> > > - As compressed option is the best one, it doesn't make sense to have=
 to
> > > change both defconfig and command line options to enable memory
> > > allocation profiling. Changing commandline across a large number of s=
ervices
> > > can result in signifcant work, which shouldn't be needed if the kerne=
l
> > > defconfig needs to be changed anyways.
> >
> > The reason tag compression is not the default option is because it
> > works only if there are enough free bits in the page flags to store a
> > tag index. If you configure it to use page flags and your build does
> > not have enough free bits, the profiling will be disabled (see
> > alloc_tag_sec_init()).
>
> Is it possible to fail the build in that case i.e. check the page flags
> availability at build time?

The difficulty is finding out the number of allocation tags in the
kernel before it gets built. Maybe there is a way to add an additional
post-build stage to run that check. But even then making this option
default and causing build failures does not seem like a good idea to
me but maybe I'm being too cautious?
