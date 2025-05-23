Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E9A1F2BA7
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748032370; cv=none; b=e88YHLrf4GaQ6SbFJLqRqJYPWNKtCau3mH0QiOKO2nGBHL8952t9hxu07VxO1UQN4Edx5w3JS+DWx9/ee9AwTxYgoN4I5fLZJudpmU5lGAL+64b2OmR24swHUpZiJFTySy7iygbPdHqO0ngW0q4pu5PotnUCE0eSVZOOZxK8ocE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748032370; c=relaxed/simple;
	bh=G9czfRWtK5GpAW80nG2ZBUs8aoQ0XZnEuKIEThGW+Ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TuVlDxfd47gGMUN9xGw+qiJtbNn59fq0/u2ZRKJEt6yEY3b98qOyvFtHa+kyK+SzkYLrRqqRfSAzQBqGW8J5cq5uUdTx3NGzk8vnTc4iRr/JGsPipKjsV5tw5ZMQB1rwKDXmCDZjrDokS9NT34+ZOidt9CclMd56SUhPTP0yOUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iHgCllZ1; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iHgCllZ1"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-48b7747f881so18211cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748032368; x=1748637168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pMiDeMVs0fzVOomIpahcrje2YzoGJzAVTfniCnIw70=;
        b=iHgCllZ1TtgNoX/7FTqLNMVSsOssV+j6w/Rf4Cn1Q/wIT2XuV0em8jOcOfds3HAgS7
         wQWa+sqK7dGNt6XwyDwWEaBWXT8h0PXbtsDsNCSqIz6Oql3XVXDOepnt9WWPFNkDZW/d
         k1rg955+EyGRvAEUG3SUAur04qy7A98cSCs8OF6ftMdb53xFuM8vqC3ZBPaC1Wxlry3Q
         hLZ2BcZx9ScoatuPwmYthcuSah9KJ9u6BKfzDPgGhWPkbSprhbyPMGaVQrTp7CD/o2Kk
         FofmvRbCRz8b5uQk6kVGLyJzC4oUnZLjKJLCQngQ/2mGXsheRTvwGQhKqfnSGrYMIT02
         sN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748032368; x=1748637168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pMiDeMVs0fzVOomIpahcrje2YzoGJzAVTfniCnIw70=;
        b=kSse5GL7F5v9dhY0yxtayBn9gKi6G4jwS0Esh5djB0wnwWvqNgm8dOLqK6183wcxJG
         4UvlAm3b8UjQuBd8vrM0aYnkehVloLD2cUVJSeoN6XB8w6jl5wXikVL5yPkDxm1Qd1hJ
         V5P0JsoB9y96DwauOkzfzFLhDhQsVNpjXYI+Zvlh8Mv6JZZny3/sCGYKKAYXrJVzeQN5
         e5SO5xLPxg5cxar9fIPGwuxNSbioQkZ0uLNT6QYzeXY6af9a7nI/k7PHWCf4V+59ogke
         DB0zIuQStehjrkLkYTc4qPP7s5Xmkb1X6pam+f+dPgV3G+35Q+lEVd77zW3DoAZXSUrs
         zFSw==
X-Forwarded-Encrypted: i=1; AJvYcCXvt6UWK8YTQ8wDD2LIAs1epnqwrMLLKT8FfkQorEcR7tFRdYjhwlUkAumzZeemAVHtJAAvdJ5kWbioj3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6CQ8z9gwaECn08qDJ0j+bu3zdlbdDqCyGgK4IIkqKXODem7kx
	axSCh3y3bd/atIBAiLUoE7psbraJiEOG5IkEeklc2w+7stz9k2UbJDizeC4ZZLoOzdnZDBetWz2
	TizUg7djv5TN4WP70DeFBFv32He2jRRyBUFckY/h/g77K0vCmgtKYF8a5
X-Gm-Gg: ASbGncvuFwYZ5IAMRnvCXS7hlfsh0lZAws7+JAbSqNevId1jR2QpcvpIGGab+eLCwLS
	6bnVEZDQ7xCbX9SnDfjlUMhDkvJ6SBdYV4FK0rGy2A2nHr+EtZ3BitYFZ2y5+ZaIQfdphU306Cf
	VOoc/ZjCYhad8g1sc8Hp7Lad9QcNNRKOC3wCmSBDCoKaakkkwSPHiLktVgN/2ktcW0H6OnX/ck
X-Google-Smtp-Source: AGHT+IGrVZM04XvgPaseySOZs3bNAx9IWsIGdKJgbBIh7931NB51szk/oOGmgDnpT1nAaRLP3Tcbk8fCMZNDMwITH9M=
X-Received: by 2002:a05:622a:50a:b0:47e:a6ff:a215 with SMTP id
 d75a77b69052e-49f48a80470mr730551cf.0.1748032367629; Fri, 23 May 2025
 13:32:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAP045Ap3e6x52TvB8WyBHBjJ8HYtAmnKnGgj_fog3P+F5igP-A@mail.gmail.com>
 <aBkaDN7N_6qDGdIz@x1.local> <CAP045ArAVtR6_Y-WWcqpB54Z+fwNYSWSyrTZKjctocwA0sK5eg@mail.gmail.com>
 <CAP045AoWZQZvLR8B0h09XL=cS2aD3yDwtthdeZ64JWEOPkZ_=w@mail.gmail.com>
 <aCIZqV6mEQZftFvA@x1.local> <CAP045Ao-onmzcVSic+4D+aDc_M9HTF7UK3NAdC5BcZvDmN370g@mail.gmail.com>
 <aCNIKm5OJ2h12z2j@x1.local>
In-Reply-To: <aCNIKm5OJ2h12z2j@x1.local>
From: Axel Rasmussen <axelrasmussen@google.com>
Date: Fri, 23 May 2025 13:32:11 -0700
X-Gm-Features: AX0GCFuei6DlMWnYUe6pjJG86zq4kdI3WzoC1j39chgxgqjWjmM9AKKx8Ot51F0
Message-ID: <CAJHvVcjLecujsDCQ2AK89C5HJ7LLYc8ez1VEpG5m9yP8eJtnHg@mail.gmail.com>
Subject: Re: Suppress pte soft-dirty bit with UFFDIO_COPY?
To: Peter Xu <peterx@redhat.com>
Cc: Kyle Huey <me@kylehuey.com>, Andrew Morton <akpm@linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, criu@lists.linux.dev, 
	"Robert O'Callahan" <robert@ocallahan.org>, Mike Rapoport <rppt@kernel.org>, 
	Andrea Arcangeli <aarcange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 6:25=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, May 12, 2025 at 10:16:12AM -0700, Kyle Huey wrote:
> > Personally I don't think it's a real issue to have to create a
> > sacrificial fd once at process initialization to see what features are
> > available. I wouldn't have even said anything if the man page hadn't
> > explicitly told me there was another way.
>
> Yes, that's indeed the part that could be confusing and needs fixing.  Ju=
st
> to keep a record (I have you copied), I sent the man-pages changes here:
>
> https://lore.kernel.org/r/20250512171922.356408-1-peterx@redhat.com

Agreed, at a high level I think this is the right fix. I believe I
just forgot the probing required a separate FD when I wrote that
version of the man page. :)

>
> We can stick with the sacrificial fd until there's a solid clue showing
> that we should introduce a new way to probe.

For what it's worth, I'm still convinced the whole handshake / probing
thing is overcomplicated, and it would be simpler to just do:

1. Userspace asks for the features it wants (UFFDIO_API)
2. Kernel responds (fills in the struct) with the (possibly subset) of
features it supports
3. Userspace can react as it sees fit if it gets a subset (fail with
error, gracefully degrade, ...)

But, based on previous discussion of that I believe I'm in the minority. :)

If we are sticking with the handshake approach, I agree needing a
second uffd is no big deal. We could add an ioctl to just probe
without configuring, but that would purely be for convenience, and I
don't think it saves many lines of code in userspace. So, on balance /
considering the small benefit I would probably prefer keeping the
kernel simpler.

>
> Thanks,
>
> --
> Peter Xu
>

On Tue, May 13, 2025 at 6:25=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, May 12, 2025 at 10:16:12AM -0700, Kyle Huey wrote:
> > Personally I don't think it's a real issue to have to create a
> > sacrificial fd once at process initialization to see what features are
> > available. I wouldn't have even said anything if the man page hadn't
> > explicitly told me there was another way.
>
> Yes, that's indeed the part that could be confusing and needs fixing.  Ju=
st
> to keep a record (I have you copied), I sent the man-pages changes here:
>
> https://lore.kernel.org/r/20250512171922.356408-1-peterx@redhat.com
>
> We can stick with the sacrificial fd until there's a solid clue showing
> that we should introduce a new way to probe.
>
> Thanks,
>
> --
> Peter Xu
>
