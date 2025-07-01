Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445F927E079
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388106; cv=none; b=Urbg3hfJ8Xo3lAlQv4dVcb2nYOfYoMAsSKkifl28TJw3AMUeDc9aiJBe1hDxBB9ROgJa3Bx6+hiHu5bJwvoOUnbfeIN+UXQUmO8WL/JL/QlQl7gzh6gpewKKgJV0FFU2t93OxTm5yHr/hUZw3G2GPXYcf/eJCwqJi6LGxNaoZ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388106; c=relaxed/simple;
	bh=IWPGg61zB1oth4kd/0y/wwEehBXGlVgrzvdrkzTEs5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWOA/h3ZdBcTKmEpbO09oAnuqjNOk28tkwaRA0sBxA8WQQgtklJBOQImG+o8xFsui+bVKqUYeQRx73sfLQMJsCL2+5IXBBjcqztSwJDjq501gGm+zRQmzicDuWkzLz7yWOhXZ6tRdt1odWZLUIhZmhT0pXz4e3spP7RhQutl19k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=MIFcsZyi; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="MIFcsZyi"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-555024588b1so4075338e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1751388102; x=1751992902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWPGg61zB1oth4kd/0y/wwEehBXGlVgrzvdrkzTEs5A=;
        b=MIFcsZyiAJebptflBYP0VN2SOUilf8saxuKU4To8S160uqUYfQNF0S3O4Bj10naZHP
         eS3MGX5sJEJ7xLveyJ1GxDpLQu3q0qZ3S1He1kouTwXAdh8drBB/C8xRKY68C8o+Gx9X
         E5BiynJ5iuB3gdfeygT7oK+1/2GTz/OyOS0/KuwXI71EIhASm9LbVpxmRe4YjVE2Ur4x
         DzlE4blBaVOFckGhyuDQfX2/WShn9Rzi3NXqUgEFQxQIDEi4XhlivCKCzj/red5J1w8P
         RDg8LmoMZMfozgkEE4CPE3BN4Oo3Mp3bdpIFxsXtJhOOoa+GitLhso6fDpdILQhYoVR0
         qDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751388102; x=1751992902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWPGg61zB1oth4kd/0y/wwEehBXGlVgrzvdrkzTEs5A=;
        b=fN6fFBsWh1hBhwnQoyiGI5Z6nLrzX+XgTWYPwkHKid0K2YKssBr8UC3ejFFIiTlcuS
         pjSLJl5VpbU9+lLF2w133CgP6+DXR3yJelYMcyIZR2bfpcwMaPbxHoWLWULcldyDrZMk
         a0z1aHZvf7bp84uYYVCUINeu14WsPDsVyInt3UewemnmOxYvthmkQEho+kmcYC9b9Z0K
         A2hhVbSmztyRaDPKXw1SL//+H4SdIZF3pTctR+vG9W13yzF7+0hFfPLI0Lut2YiRjqaI
         p0NtUp4+Zd4LaCFCU2whrmz2hqvlyMWlr2HGFS1i8hzdgk165Y7SXjpNQm60U1nwV0sE
         4etQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe49/8HkAe4ppFSWFdcM6LbOYBuI6dv5DZiyXEhh1C+XE9/HTUxuyai5NqhGh+5Q2jQ96Hz0qhNGndppE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsvh1YyL3qPHnHFmJGlR1gC07QgFlC8joizABBtotLXuPU4qzL
	R2YU7lweV8GINPS9wKOqzxxbvYZPN6dtycLkDtCSMi5X3hx+YOgfCpE5aBB0uDTS9tqXmzsmeR4
	aPlZogvLeKYVos2JCKz0OjxxErMBMKk4EhXt+VbU4Yg==
X-Gm-Gg: ASbGncvyynFkmdAKZk8xahtDgG21eb8U6yhdzcRzLM40Ry1lz5xHQ+jDXkhodJUBEZX
	Ik9HMXWu0A4WihuQiaVViY9/KO8yUSBkmhjrqMRbIl7y4PqaOqHOKXXvAxeisi7AT4IZiMl5rI2
	BI8CdFahBP2huxnwC9x/s9swKH0lUSwsdo1690mD7ZJJLJM7S9cUCEV+hqQNpBZQ==
X-Google-Smtp-Source: AGHT+IHEq5ypAjgPeGrXgSB+iQb7yMaRQQKfYmf1cOj3A7y4mag1GtbmVbmT4BQ62LbNkTcruSd+EqYyt3TiF72QD1o=
X-Received: by 2002:a05:6512:4012:b0:553:297b:3d45 with SMTP id
 2adb3069b0e04-5550b8dd339mr6809093e87.43.1751388102208; Tue, 01 Jul 2025
 09:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616095532.47020-1-matt@readmodwrite.com> <CAPhsuW4ie=vvDSc97pk5qH+faoKjz+b51MDYGA3shaJwNd677Q@mail.gmail.com>
 <CAENh_SQPLHC8pswTRoqh0bQR84HHQmnO3bM07UQa1Xu9uY_3WA@mail.gmail.com>
 <CAADnVQ+QyPqi7XJ2p=S9FVDbOxMXvVPU859n+2ApuRQv5T2S5w@mail.gmail.com>
 <CAENh_SQgZ5yVpshKRhiezhGMDAMvgV7SmwD_8u++mACE33oNrg@mail.gmail.com>
 <CAADnVQJgOyBCCySnBkTk-VCsz0dy+ppdGHpggxbtDpBBGhaXVg@mail.gmail.com>
 <CALrw=nFvUwmpjUMYh5iJqjo6SbAO8fZt8pkys7iDjZHfpF2DxQ@mail.gmail.com>
 <CAADnVQLC44+D-FAW=k=iw+RQA057_ohTdwTYePm5PVMY-BEyqw@mail.gmail.com>
 <CAENh_SSduKpUtkW_=L5Gg0PYcgDCpkgX4g+7grm4kxucWmq0Ag@mail.gmail.com>
 <CAADnVQ+_UZ2xUaV-=mb63f+Hy2aVcfC+y9ds1X70tbZhV8W9gw@mail.gmail.com>
 <CAGis_TUNfUOD3+GdbJn1U33W8wW5pWmASxiMa5e5+5-BqJ-PKw@mail.gmail.com> <CAADnVQJp-AtrRj_XESbE5TUj6_dGNDwpRWwu2vEHv1HGOb4Fdw@mail.gmail.com>
In-Reply-To: <CAADnVQJp-AtrRj_XESbE5TUj6_dGNDwpRWwu2vEHv1HGOb4Fdw@mail.gmail.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 1 Jul 2025 18:41:29 +0200
X-Gm-Features: Ac12FXyOUK2ie89s6D74HJ8lkPkT67UPAFc_lYbeFJHGKWlptLg9cG1ciKg7zYQ
Message-ID: <CALrw=nEAXCG6-qWBkPudM-c4pLhZ49jdyDKH5CT=hz9YwgBCBQ@mail.gmail.com>
Subject: Re: [PATCH] bpf: Call cond_resched() to avoid soft lockup in trie_free()
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Matt Fleming <mfleming@cloudflare.com>, Matt Fleming <matt@readmodwrite.com>, 
	Song Liu <song@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-team <kernel-team@cloudflare.com>, Jesper Dangaard Brouer <hawk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 6:25=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon, Jun 30, 2025 at 6:28=E2=80=AFAM Matt Fleming <mfleming@cloudflare=
.com> wrote:
> >
> > On Fri, 27 Jun 2025 at 20:36, Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> > >
> > > Good. Now you see my point, right?
> > > The cond_resched() doesn't fix the issue.
> > > 1hr to free a trie of 100M elements is horrible.
> > > Try 100M kmalloc/kfree to see that slab is not the issue.
> > > trie_free() algorithm is to blame. It doesn't need to start
> > > from the root for every element. Fix the root cause.
> >
> > It doesn't take an hour to free 100M entries, the table showed it
> > takes about a minute (67 or 62 seconds).
>
> yeah. I misread the numbers.
>
> > I never claimed that kmalloc/kfree was at fault. I said that the loop
> > in trie_free() has no preemption, and that's a problem with tries with
> > millions of entries.
> >
> > Of course, rewriting the algorithm used in the lpm trie code would
> > make this less of an issue. But this would require a major rework.
> > It's not as simple as improving trie_free() alone. FWIW I tried using
> > a recursive algorithm in trie_free() and the results are slightly
> > better, but it still takes multiple seconds to free 10M entries (4.3s)
> > and under a minute for 100M (56.7s). To fix this properly it's
> > necessary to use more than two children per node to reduce the height
> > of the trie.
>
> What is the height of 100m tree ?
>
> What kind of "recursive algo" you have in mind?
> Could you try to keep a stack of nodes visited and once leaf is
> freed pop a node and continue walking.
> Then total height won't be a factor.
> The stack would need to be kmalloc-ed, of course,
> but still should be faster than walking from the root.
>
> > And in the meantime, anyone who uses maps with millions
> > of entries is gonna have the kthread spin in a loop without
> > preemption.
>
> Yes, because judging by this thread I don't believe you'll come
> back and fix it properly.
> I'd rather have this acute pain bothering somebody to fix it
> for good instead of papering over.

I think we need both anyway just for the reason we need something to
backport to stable. A full re-implementation of trie might be viewed
as a new feature, but older kernels need to be "fixed" as well.
