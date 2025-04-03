Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC547FD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 00:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743638792; cv=none; b=Efecz52WHNAmS/C1f5uEEIJ7K9k4yywDNfxHb4bCjd0Gu6CAJ7/dqKDk7Go7dYkUFpebEwO405yGVhwW6jP8oCdVjKXzukboSfZic2yj86FgYaYw+vP8MyN9SKK75SYas0HHg1nJ/2uGPDWNMKjCcUDYSKmHK6wI93Ze7EZdu+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743638792; c=relaxed/simple;
	bh=nhly9Oo98XoTVMa6E6OYtYSm01eN5GH5P0vWzI1XMTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VSb+BcEhI6JLS1xTQogucx854KBo/va/qCKcZGO5s+D0CeGIfQWv8jSXh5stkB3CLvZwAvGpsRi70kJFsAzVQy9lr6hor4xA6B5Iv3tniXpkKmvz5JYMtpV62Wx98zou1EmtRkXa5xvQeTiWXucZtIIFNxMCdqOYorEs8jnrmbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VZhxgYnK; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VZhxgYnK"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac29af3382dso46612566b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 17:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743638788; x=1744243588; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WDME24yiYohb1xBflLrOYtprUkMulUfhOxUWN86ggD8=;
        b=VZhxgYnKigDkHmPaz3LTGq3drg4E1UMeUc//U5llagqf+Ps0/xGfFYnrj8OcZYfwjp
         3AOM7Bz5AGFpHGp+sgTuP5MXkUCKpuXYjqkVRljtUkFXME6jPmW1FQY1KImQj1LJBoHt
         k1Hp+gXkxa889onjKMRk5iM9TbhUfZMQP7XK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743638788; x=1744243588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDME24yiYohb1xBflLrOYtprUkMulUfhOxUWN86ggD8=;
        b=jfV7ThFLHTGCQwFmfS4MPcBmJwOtR5orCYiGWXaWmwwIVgvy5C7fjLaXG+YNEtRaOg
         YvREV+7udwsmgyyFnNZ3UUl0cDZ6A5Xluz/LcaXmQJKWpOp1quWRzkfxDMtZqp45Ar1c
         mdokHlBKez//NUIK+OwoMZIG8lWvEblD0kORkfc+uTt2pqISLOo2uQfR+3WXJMPa8gx8
         PVGZ1BJpznghlb3X+pVOT9Ulk0sUvZ4rKsMU05rcNMBGCxjFjFOGUnesP/7mX/I1XThx
         jtgb5JqzVvnlci3u8UXdhyuDRAVy82/4/3iNZr0ecEOaEYrsgUXvapxOczZ8KRfB2jVJ
         /fgg==
X-Forwarded-Encrypted: i=1; AJvYcCWGUMK4VbDt9ES20GFMPJxJ/Z3aJr/ouuMJwTe6wM7hqRuPlWvqDwR9jLLBEDw4qXJcrDgQedzzV4I6Ino=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr/IkE9YHObRa7jhJYiRHDNKYirZxA9MzeDH3DJlgy1kYSqcxh
	uQVz4NCS+uQKfrmkldO5o2IfR3ZLfh1rO3/bvSbjg5+tdp9CVW/Dk13FBSvdlVp0mb/jwOKvTE5
	Xq0A=
X-Gm-Gg: ASbGnct/sRmLexsc879Qz4G65cHzSUlIQ3JC3qWMXKTKsJBfYlz5KxZdgAUyKLuVuOw
	3BQ+RyIVgYdJD26ffLxhmMP2pgIrVOI5NRZX78IZBz0tST3zyZI+Ybut6E7aN7rB16Si866DnOS
	Xa2cn9p0Yk8ptL3Snoj8kCKjfZXCC41RzowD0du0JRK4LnQVJ6tbO/NuAFhmiCrN6ILdAYCtgwg
	J90Vr+z5bu4nRAul3lLyEx5Pbvbsu/vej+s/UX5H1GRDjem6BXlfeIJ6lv19atLr1BebIViXdjG
	iT19n7id2RkI67vUuio6Ih/krndwr48sHGbYi1Om+1h6LPxrVrgt9rIsVGy7pec3psoAAREpFCs
	cSHRi40TlIPBUafJYzMI=
X-Google-Smtp-Source: AGHT+IG9feLyDhgqETN7Xz9NMKD4EyWJMM47mcCEKkgvjPeINsufU543vMbXJuuoFD/C4fzFNRSRjA==
X-Received: by 2002:a17:907:7d8c:b0:ac3:8790:ce75 with SMTP id a640c23a62f3a-ac7389ea3a2mr1599213866b.10.1743638788530;
        Wed, 02 Apr 2025 17:06:28 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01c1028sm4833866b.172.2025.04.02.17.06.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 17:06:27 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso42336566b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 17:06:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRASWv4dM5hmPwbsGixI7oKRnwPGlwGdXR5PxpmAENsmKOM/+567w/GvrX8CgCEp5RE25ULZFVZK1Iitw=@vger.kernel.org
X-Received: by 2002:a17:907:3da9:b0:ac2:912d:5a80 with SMTP id
 a640c23a62f3a-ac7389ea3e0mr1522405866b.5.1743638787221; Wed, 02 Apr 2025
 17:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJfpegsQDTYsEWHMK9skpNzUO=GA_DR7zGHftyO2sZH5wjaZLA@mail.gmail.com>
In-Reply-To: <CAJfpegsQDTYsEWHMK9skpNzUO=GA_DR7zGHftyO2sZH5wjaZLA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 17:06:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wihf7K7JhOsm2R6SSRbHuxzpMG+q87nVyD-jZnd+7-0gg@mail.gmail.com>
X-Gm-Features: AQ5f1JqHxQ4y8QfdVOkyBy-Gm3oH8OTY9Em8Hq2QRv5vKqVBHYB0rPkvn3Y6piA
Message-ID: <CAHk-=wihf7K7JhOsm2R6SSRbHuxzpMG+q87nVyD-jZnd+7-0gg@mail.gmail.com>
Subject: Re: [GIT PULL] fuse update for 6.15
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 04:02, Miklos Szeredi <miklos@szeredi.hu> wrote:
>
> Commit 1dfe2a220e9c ("fuse: fix uring race condition for null
> dereference of fc") in this queue has already been merged into
> v6.14-final through Christian's tree (commit d9ecc77193ca).   For some
> reason this causes a merge conflict, the resolution of which is to
> just take the version from this pull (i.e. remove the atomic_set()).

Yup, those "made in both branches" kinds of conflicts are trivial to resolve.

In case you wonder about the "for some reason" part: I say that they
are "trivial to resolve", but they are trivial to resolve only when
it's clear that you should take the *other* changes that the other
branch does.

So put another way: both branches did X (that "fix race condition"
thing) but as different commits, so they had separate history.

But then only one branch did Y (the "remove unneeded atomic set in
uring creation") that is right next to X.

Now, when I look at it and understand the semantics of the patch, I go
"oh, ok, both sides did X, but you also did Y, so I'll take that X+Y
thing". Simple.

But it's simple only because I understand the semantics of the
patches, and I see that I should take the union of the work.

git won't do that, because while there are "patch queue" systems that
do in fact use that exact logic of "both did patch X, the other side
also did patch Y", git is not a patch queue system - and I think patch
queue systems are actually wrong for anything more complicated.

So git will look at the original shared state, and the state of both
sides at the *end*, and make the merge decisions on that basis
(resolving things with a three-way merge if both sides did changes -
that's the simplified case for the simple history situation, at
least).

And in that model, you don't have "both did X, and then one side did
Y". You have "one side did A, the other side did B, and they weren't
the same".

I also will claim that it's the safer thing to do, because who knows
*why* one side did Y and the other side didn't? Without understanding
the semantics of Y, it's very much not clear.

For example, maybe the other side didn't do Y because Y was a quick
hack bug-fix to get things working, and instead simply fixed it at
some deeper level elsewhere that made the quick hack pointless and
possibly even wrong.

So just automatically doing some patch algebra can cause problems.

Of course, the git model of merging can *also* cause problems.

For an example of something that the git merge model will get wrong is
if both sides do 'X', but one side notices that 'X' was horribly buggy
and reverts it, and the other side doesn't.

Now when you merge the two, git will see "one side made no changes at
all, the other side did X" and at that point will merge 'X' and
basically undo the revert.

That *may* be the right thing to do. Again, maybe the other side
didn't revert because the other side fixed the bug properly. But the
*safe* thing would probably have been to treat it as that X+Y vs X
thing, and ask for manual intervention by marking it as a conflict.

But git won't do that, because git will see X+Y as being no change at
all, and then the logic is "one side did nothing, the other side did
new development, when you merge the two you obviously take the new
development".

And that's ignoring the whole issue with three-way merging that git
then does for when there are changes on both sides: it's a traditional
and generally very good strategy, but it can certainly also end up
doing mis-merges when there are semantic conflicts that don't show up
as overlapping changes.

End result: there are no automated merge models that always get the
right answer. The git merge model does work well, but there is no
perfect.

One good thing about the git model is that it tends to be fairly
simple to explain *why* it does something. It's not rocket science.
Merge conflicts really are fairly simple: both sides changed the same
area in different ways.

Of course, things get complicated when code movement or complex
history is involved. Or when the two changes simply clash on a
fundamental level and weren't at all about that kind of "A+B" vs "just
A" situation.

         Linus
