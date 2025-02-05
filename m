Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102F41519BA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738772755; cv=none; b=i1p+nBuQhaZfC77edwt3IuoSa/AMMvPPIgW+VwdE25kDUOG8GHP+ri+qXgJMKNn18Nt31p7ea6jaES/CclBfqBoYw1fzG2sc/IlVkd9TgqvobH3UjT/zxso1y2FNQUuQAeQIVCSt7IBDbrvJ63th0CKbZFnBM8a15qjHXXtvwcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738772755; c=relaxed/simple;
	bh=HGoFu8EMn/9p/e3e5Qbx+rQ90CmDadTKZhVcaAuqWVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oURpP0igHL2wDT6t2dBvScaY54IeZNRHa5BIifmrWJ1rqnpLcrr9968FT1grxvH2wC6sw2Ms4QCdU6mLBOUE5vp/VDVixFe4qVDf44MA9ZOUu75LVgKBxUXhADe9HlHawM0vk81B8m8z84emeRarakgv4hAmg7VG3KIAw5y4FyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4W5uSckU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4W5uSckU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21c2f1b610dso84845ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738772753; x=1739377553; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g398mAw+koE/7rvCUsGrdTu6hqyc6MVi7/IgF/fwk5M=;
        b=4W5uSckUqzKyxEE372cuRiCTqBWrCPnw/66FxUnQivwrl5OI6+CFDZz/9iGkOh3cw3
         1jAVCo81lGiPioKx3GzViEvKsSErBL8M2RIgaNxDv4bgARwZidgdKS6P2jT2nR+a18dY
         r6dPY8a6dMAl9EAe2ckGz4nR8rudDCqTbTWDOavJrgNf8fXB/p9Mb5y04Wn7n0l7cZxg
         JiCY0VL8zZchvHgHID8J1yTfEvONUYJ5the5+TYp/+8YePNVmtIFx1xoSPZjyQnbuJuY
         5K0Plx1CEjd5tnvCkjy1DaciKsfnorQveb/lz0oxxrIOKS8tayYoWf8jqnHJOaXOQeCN
         a3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738772753; x=1739377553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g398mAw+koE/7rvCUsGrdTu6hqyc6MVi7/IgF/fwk5M=;
        b=YDwQAsunXcxteQwoJFpOPlQtaMLoW/122NVjRm17zBWhvb2VljtGt2mo5/PyJkpy7Z
         rw1Vui1JW8raeSiOe28d/HUf+IBDsQmK+fm5RIDTVv72Bo437Wfksocu5wEqoHZBOsDI
         OkEzDTPpXPCXIZfSgJiWIH4MOSYO3rIs9e+RvMhx4/vcojr1wBGNHON9ye056x1GTbLo
         sQ7N9Jpjitp+/kHdJTiFoGPY0e9m621TONGGACOu02o4DyI4Yxwgc/ly5zA6HNhbrsXe
         ZatZI3kFiYEGz/jnF+f6+Y0bSS0QOTetDAJGajBbQ0oR47S9EqDgaoWCs8U02aPp+R03
         6jhw==
X-Forwarded-Encrypted: i=1; AJvYcCUUCW+yGbCQ19jOl2LOtpPs2CRxZueTMx1LRwM4ImzAKDf0HU61auxELlfceq95l2+QB/LmUsCKxmdEbu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRaR9tPM3q2KT2R1DLtOK7YlvG47e+/0BCdRfuCC5t1Xl5NtHK
	ddHCbP6BBVcbEOWDQY7WVTFhfLehhhMyYcE5YPM7rPMcom1v573SMufy80PjQVhyD0xAqWTcdIG
	7Cr9HpuopBqBMxl2DGgP7MlfSBmAqI5bjB0Ff
X-Gm-Gg: ASbGncuQeJhMqp3ZwW/FONzNXHnJa1yzD/DGRSOpNvijoK4NMUT2/GNw2jTMh6Hk6Ei
	buHwc3G+gw/wwAtaeJR+W200+bulVYsqvTIZgYws5dNPvHfqvsTBDn//pnNEF/EbgViWQ9rU02C
	VXx4dH2c8A4gIB+lhWzpxOLdbD0+EX
X-Google-Smtp-Source: AGHT+IGO+lHifIAmBbiQp609wZPwjqvDK16S2Y6u0ij8ggOirZZDpqz0X3E/XK82rQGtxlAc3yX3pxNNptrvQCQ81iU=
X-Received: by 2002:a17:902:c941:b0:216:1543:196c with SMTP id
 d9443c01a7336-21f17e29df5mr55523525ad.27.1738772753013; Wed, 05 Feb 2025
 08:25:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67a34e60.050a0220.50516.0040.GAE@google.com> <CAG48ez3KKEYRU+-Mkk+tq1Onv3QWg0jP6fEKYjNjRS+ziP5dAQ@mail.gmail.com>
 <13bb4bbf-92e7-4c45-a3a8-a52312015f92@lucifer.local> <CANpmjNNeXjtatBD6Lrz2-1jiqLkpcuk0Ra-6uJKzz3=y86qVuA@mail.gmail.com>
 <097c6249-e86e-42c9-9f43-bb9f8a865ce4@lucifer.local>
In-Reply-To: <097c6249-e86e-42c9-9f43-bb9f8a865ce4@lucifer.local>
From: Marco Elver <elver@google.com>
Date: Wed, 5 Feb 2025 17:25:16 +0100
X-Gm-Features: AWEUYZmG35h_UiR1ojQSynQoXweyk_XDmkOgHg5WfWz_e1HpijYkRgKLrDkrxBg
Message-ID: <CANpmjNPzQBvHrGGLwtCrU8iLUz2tppGie=_ZkuYck2fgN9Qr7Q@mail.gmail.com>
Subject: Re: [syzbot] [mm?] KCSAN: data-race in mprotect_fixup / try_to_migrate_one
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Jann Horn <jannh@google.com>, 
	syzbot <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com>, 
	Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Feb 2025 at 16:51, Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
[...]
> > [...]
> > > I hate that we have these landmines waiting for us. Be good to find a way
> > > to explicitly annotate this, or at least comment somehow.
> > >
> > > But agreed, probably adding a READ_ONCE()/WRITE_ONCE() is appropriate at
> > > least for the proximate thing.
> > >
> > > It's a wonder these things don't trigger more, except you need probably
> > > very precise timing to do it...
> >
> > They do trigger, but we don't send all of them to LKML.
> > When we first introduced KCSAN, the notion of "data race" was still
> > poorly understood. At the time we decided to pre-review a number of
> > them (but our time to do so has been going down :-/), or let willing
> > maintainers deal with them directly. A number of articles followed,
>
> We very much appreciate your efforts :)
>
> We are definitely willing to see these in mm, and as you can see from the
> discussion here, the interaction between the rmap locks and other locks is
> complicated (see also the docs I wrote on them at [0]).

Tangentially, I've been trying to work out how to bring this [1] Clang
feature to the kernel: it's more or less a simple "capability system"
[2] to express "acquire this before doing that / don't hold this thing
here / etc.". Locking rules are an obvious application. It's been on a
number of people's radar over the years, but nothing materialized.
Sparse's locking analysis is much weaker, nor easy (i.e. quick) to
use.

[1] https://clang.llvm.org/docs/ThreadSafetyAnalysis.html
[2] https://www.cs.cornell.edu/talc/papers/capabilities.pdf

The current work-in-progress is here:
https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/log/?h=cap-analysis
It lacks documentation, and proper commit messages, but is otherwise
usable (see example enablements for kfence, kcov, and stackdepot and
lib/test_capability-analysis.c).
An official RFC will follow, but the hard part of writing
documentation is in the works. ;-)

There are also other questions, such as:  can a subset of the analysis
be applied tree-wide (vs. current selective enablement), as it would
help find more bugs faster.
However, the reality of it is that using this system would be opting
into a "dialect of C with capability analysis" with its own set of
restrictions, and I don't know if everyone is willing to pay this
cost.

What I'd be curious about is, if some of the complex rules you mention
above can be expressed so that Clang's "capability analysis" can point
out some bugs. I suspect not everything can be expressed, but even if
we get 50% there, we could catch a huge amount of bugs statically at
compile-time.

I let this cat out the bag, because this thread seems like a good way
to get super-early high-level feedback. :-)
It'll be a while before the first RFC.

Thanks,
-- Marco
