Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF0C18CC1D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745597290; cv=none; b=fUFj1BkGKHV1gjSFXHCgY2CfBidEb7kAJhBsTRvmO4V+eV3eL8ECmZ/4TGJ+wbG+BeCDaxVcK8g5080wdq0Z+nqVl99Ll7AFPqb4ZI10oGV1dDl5NTsN0sugOIezRAmKe++TcnYr9ktYz7uIZJI7ugwkmRiNok5L+Dhvi09LwJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745597290; c=relaxed/simple;
	bh=pNXJ3/U0hKm/bEbC/CqrkzhF3ks8x7lnek+wO+2a7PI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aaaCZ/pGZFpT6UV0jcYUY3q1vSeE/4wd7WF9yolh5HrK34seJvjIxSgBlDGWLZCkpp1XgDJeO8saJ7hF69f3niRARsIgNkaJMSkAWsOpGggZ0hbEWK0jDeIjuwtVDtLXiH+1uSZr9DjJqUjycO8CEjlv4f8ENheCfFEl9rqHAPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F5xaDdXM; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F5xaDdXM"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e6e1cd3f1c5so1970718276.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745597288; x=1746202088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhtHm5TJ7Sf0WfPuEXwkbJxFSOzkS7Oo48FDFS+N83o=;
        b=F5xaDdXMkIHbF+yz6NXjr7Xj0QAgV0tj1qv7JJcIjzYBEYtWIoCbBMmDMelX5Ld4ub
         hy52cjvDgTuj97k/6B/XcDzeG6ikVnhJmL8D9iPKcXEUGehyfjbbNhv7b10smAJ65z07
         mF/mX2EpzzVTXgwkQz7ziXm6l4qN4gqYGXux9DTNMA6L04AHE8JmNPJf5ov/p+ywNHJi
         ZR3hCToJQ2iED3jPQFSPGTxVgexSPgiEj87ra5Lns9s6UiKBdESmvJM5LH3YWbLaj5F6
         DrVLxesG9Op2oWtU1wy4jXG8+9J9rKQq33ZqEqoqjCbktB1hHi3LQGjoTkKgmIoaEmZW
         Vn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597288; x=1746202088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhtHm5TJ7Sf0WfPuEXwkbJxFSOzkS7Oo48FDFS+N83o=;
        b=R+PZmQVGlzq99miJYcMNeleR/Dbm3/tMa03YzMY54k3dYaTW+MV+Sz18X1++Bmglv5
         Ms/mTV2pcfKmqoWXPMihlc3507EeLdgFGDr8mDWTr1AfFHWkg1xrmV+OHMYhcs6ORYnc
         z5oJsOQehLKiyQzYBZ7tJfRobvMFeMaPjJnc3tOuxSVlx2B9mAdqrCyJQz7SWHkMBc3m
         Y1aHaKoS4YmDomNrJIK5lmakp7CtP0f4kqyDf0PLJ0M+11pDziuJj5QjxQNb+56VRtS9
         i+YO5lz438WfJ1pvKMSOoWMa/T4uyZa3PCX4XvR2XWfMKY5cnWLMSO2a0b631Q+1Ezt9
         qEng==
X-Forwarded-Encrypted: i=1; AJvYcCUm5jrTwWXvjeyPHX5/cELn84HHRG2GTNJHsAqb/5puidOP54Gsxb73ljdmMxV5+sGfdl1FX/9R3NPDRuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPA3FclYNco8nmkW5rM4KfFHwhmcpkceLLQJxWAkUJVTurW+Wi
	c6QT0wnA80Ew45UW5UGCLgxTFFWLjgNyuVqHSBE+sDBNfMWQOLPGN/545nVhYbgjgE+IhGnc7vY
	LpGSESHTvpuMb9F7yJXBZWqRnVnnSEtAjirq9
X-Gm-Gg: ASbGncsRiD2tGjvK2Qe5o6Jy/JN8wE2upIPbB1EAEnEmhcRqCHQAvoQ3bJmnpZBgmb7
	OY0U0bKVDGbYheelfjoIuCNc9jDPnZCfvJKiaWTgyeX5Nqu48y5vrLKwp107HYJdyJwA09GqWmD
	XTb7aSNsmoMdaEZbhMiLmkCg58N5266mtd26XBnjycHGQbnp4Rmb44zUBY
X-Google-Smtp-Source: AGHT+IEatrbWqjCHU8cjshAn8KWTbq6dL1hiJ3EiouEz0VgKtWX+noIp6HQyBBmsFL4VoX2ccj6KPu1mnwPRs4oW83I=
X-Received: by 2002:a05:6902:2084:b0:e6d:f1b6:f696 with SMTP id
 3f1490d57ef6-e73165bf781mr3624687276.11.1745597287592; Fri, 25 Apr 2025
 09:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424215729.194656-1-peterx@redhat.com> <CADrL8HXuZkX0CP6apHLw0A0Ax4b4a+-=XEt0dH5mAKiN7hBv3w@mail.gmail.com>
 <dfc6db2d-0af2-44c2-8582-7e783b0292ab@redhat.com>
In-Reply-To: <dfc6db2d-0af2-44c2-8582-7e783b0292ab@redhat.com>
From: James Houghton <jthoughton@google.com>
Date: Fri, 25 Apr 2025 12:07:31 -0400
X-Gm-Features: ATxdqUHADNxLtMHz3cAEkG3rEGMR6V7j-etzi4jHK5PVzArCZtZsDkvCN62uy6E
Message-ID: <CADrL8HW--e8GVe+6aW7ZvDEBBDHp3cBC9Tcs_6duOJ5H+ZWNpQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] mm/userfaultfd: Fix uninitialized output field for
 -EAGAIN race
To: David Hildenbrand <david@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 11:58=E2=80=AFAM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 25.04.25 17:45, James Houghton wrote:
> > On Thu, Apr 24, 2025 at 5:57=E2=80=AFPM Peter Xu <peterx@redhat.com> wr=
ote:
> >>
> >> When discussing some userfaultfd issues with Andrea, Andrea pointed ou=
t an
> >> ABI issue with userfaultfd that existed for years.  Luckily the issue
> >> should only be a very corner case one, and the fix (even if changing t=
he
> >> kernel ABI) should only be in the good way, IOW there should have no r=
isk
> >> breaking any userapp but only fixing.
> >
> > FWIW, my userspace basically looks like this:
> >
> > struct uffdio_continue uffdio_continue;
> > int64_t target_len =3D /* whatever */;
> > int64_t bytes_mapped =3D 0;
> > int ioctl_ret;
> > do {
> >    uffdio_continue.range =3D /* whatever */;
> >    uffdio_continue.mapped =3D 0;
> >    ioctl_ret =3D ioctl(uffd, UFFDIO_CONTINUE, &uffdio_continue);
> >    if (uffdio_continue.mapped < 0) { break; }
> >    bytes_mapped +=3D uffdio_continue.mapped;
> > } while (bytes_mapped < target_len && errno =3D=3D EAGAIN);
> >
> > I think your patch would indeed break this. (Perhaps I shouldn't be
> > reading from `mapped` without first checking that errno =3D=3D EAGAIN.)
> >
> > Well, that's what I would say, except in practice I never actually hit
> > the mmap_changing case while invoking UFFDIO_CONTINUE. :)
>
> Hm, but what if mfill_atomic_continue() would already return -EAGAIN
> when checking mmap_changing etc?
>
> Wouldn't code already run into an issue there?

Ah, thanks David. You're right, my code is already broken! :(

So given that we already have a case where -EAGAIN is put in the
output field, I change my mind, let's keep putting -EAGAIN in the
output field, and I'll go fix my code.
