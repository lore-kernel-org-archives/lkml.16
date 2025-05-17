Received: from e240-8.smtp-out.eu-north-1.amazonses.com (e240-8.smtp-out.eu-north-1.amazonses.com [23.251.240.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7292E136A
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 02:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747448529; cv=none; b=gCyDQv7D1K4zSYVbDZW2nO5/YctjqmOVnso4C5AeF3SYRWlcaRQXH/ycdj2UWgrDp1wJamoa9pjys64QNAW958jGWP47uszvxFgxIOsdnvPDtEj3L6tKP8jwg2SASa5asES3zv5f30FXIa1bcHWPSeiZ5mCVYv72h24IuNjbjMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747448529; c=relaxed/simple;
	bh=L7fuPDo+UJBntD0Z2zkf0zIPuZ0aUDR+7T66a+hsGE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MItHUEq/NbI18HofE5r/RCOa1P1a6DWiX9FUS8tyCr5XwNPS0rsBR9VuDIOEjU5iJF3RwQiDgWsBXgjRHsGDENp0CSa73i19r/ThfLlLl6pLEPk5KTyGaNMCzmdKMhZlFrddiJH3vJLdRNYYkjQfHGLtOkE+WnDU9tNOWM8qEfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b=Crb92FWi; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=yEiXcKv8; arc=none smtp.client-ip=23.251.240.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b="Crb92FWi";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="yEiXcKv8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1747448525;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L7fuPDo+UJBntD0Z2zkf0zIPuZ0aUDR+7T66a+hsGE8=;
	b=Crb92FWi4WNw5mYtqUFY/DxHH0yxx6tr//Hq/9M3wq6XelEArxYCt6vcGABy+Hgu
	ukbgxFjSNn44VbFMd+BTzye7BWbgJDMrlptXiy91a5OdbRMH5AQnCDy/6HQgQLBYy0n
	kYD6SV3q2+NKMT+Bgks9T0f8fcgJ4fR1+UeJvPgI7KBxB4VcS3XDQiT2rhLpByRQly0
	OUGxQUud2W6WuTe5vsmBfHk5wTz+bDBcRcaZwY7Gsi2baER2PNRrqeG7PUDO+lSskG0
	xb+bE3CgKj7C1jsKzbNgkwBpB1cxwwr/kUY/fd7sJgcLGlERvFwvJ7yi46NHiVkc6ew
	tGviBYRQ3g==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1747448525;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=L7fuPDo+UJBntD0Z2zkf0zIPuZ0aUDR+7T66a+hsGE8=;
	b=yEiXcKv8sfU5gFEknzeZXsohyvFdF626V5f+HTRpMq7DOmXYb4uxhsNUnb3EAG/8
	CdzqDS9/L5DuIOD8DbZHV7E7JtJ5cDCQUBl25UaAE7o+NeZivz0vDC8n83Ery8OIswK
	6AEQsKCW1ycpBIUCB/JEtJpCo+XqVNS7yePNUm78=
X-Forwarded-Encrypted: i=1; AJvYcCVlV3FwtTps0BPjRbe6oDZ1Wz5rLHKSAkejxbhGpwgWAjI0qvZz87LvdRwcruX5NE6b0KJLZxYUe6pNgKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWRfvC8azDC5QBeE710GHT227qELPYi3hUHJyTP+swhiTDOJA5
	pqj3LwuS3/ItzadINjwqNDqHhdG927JWQ9rZgRa2C5y0yX9+w0gXROGuI0KEQrH2DctNsu3OqfZ
	WnylLlMh8cD2iDig6RLGdtYhblBD6mWg=
X-Google-Smtp-Source: AGHT+IH/hdHMEnp4yJIIKBDaNwmmHY2VjMeeVN3vxwbw9a7pP3YW8Kt3l03nfD527lRrL0SqSmpNQZAOu/0vZc9EnPQ=
X-Received: by 2002:a17:903:32cf:b0:231:d108:70e with SMTP id
 d9443c01a7336-231d4519cbdmr82305405ad.21.1747448523002; Fri, 16 May 2025
 19:22:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <01100196db61ea58-123409dc-7381-487b-91b6-166193f3f349-000000@eu-north-1.amazonses.com>
 <20250516235509.GU2023217@ZenIV>
In-Reply-To: <20250516235509.GU2023217@ZenIV>
From: Ozgur Kara <ozgur@goosey.org>
Date: Sat, 17 May 2025 02:22:05 +0000
X-Gmail-Original-Message-ID: <CADvZ6Ep5K4YwNtF15Ovbv87jyNwpaoebPMTz8sRhHoxyPdD7kw@mail.gmail.com>
X-Gm-Features: AX0GCFvqExYMam732wRVl5Nb4KysoU2PtN5DYRTVllMfEcSSguqi17sieIvIGog
Message-ID: <01100196dc0c725e-d82023e0-45a5-4914-ab2e-82c5e9f900e2-000000@eu-north-1.amazonses.com>
Subject: Re: [PATCH] kernel: fix acct.c first test openai codex
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>, 
	Joel Granados <joel.granados@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.17-23.251.240.8

Al Viro <viro@zeniv.linux.org.uk>, 17 May 2025 Cmt, 02:55 tarihinde =C5=9Fu=
nu yazd=C4=B1:
>
> On Fri, May 16, 2025 at 11:15:49PM +0000, Ozgur Kara wrote:
> > From: Ozgur Karatas <ozgur@goosey.org>
> >
> > Hello,
> >
> > i want to try out the openai codex and it seemed like a logical
> > process so with rcu_read_lock() a protection is started but we dont
> > call rcu_read_unlock(); it has to be called to end rcu read lock.
> >
> > I guess, this means rcu stays open forever and data structures are not
> > cleaned which causes performance degradation.
> >
> > Regards
> >
> > Ozgur
> >
> > Reported-by: Ozgur Karatas <ozgur@goosey.org>
>
> ... showing that one needs *something* that would be able to reason somew=
here
> in the loop.
>
> Your "I guess, this means" is an excellent example - you've got something
> (openai codex, visual examination, whatever) pointing you to unusual patt=
ern -
> rcu_read_lock() + call of function with no rcu_read_unlock() in sight.
>

Hello Al,

first thanks a lot for your guidance and insightful perspective and
your advice was incredibly valuable, very valuable.
And not just for this specific patch but also in helping us understand
how to approach bugs and testing in kernel world.

it really clarified how things that look like straightforward fixes
can actually be symptoms of deeper design decisions and why blindly
patching based on heuristics can lead us astray.
So your mentorship reminded us that understanding the why behind
kernel code is way more important than just code and that thoughtful
investigation is key in kernel development.

When examining every new technology (ai, openai codex) i think we need
an engineering perspective but you should know that i didnt send it
with a very short research, sorry.
and i didnt think about whether rcu should leave this open while doing
read copy and what would happen if it did but you said it very well,
so this was enough of a guide for me and i will definitely look into
it and try to understand it better by going to for example git blame
and grep.
I actually thought i understood this code and fix but that was it and
i just believed the patch was correct without any need for static
analysis or heuristic warnings.

Still we live with these, i mean ai or many other tools come into our
lives and this is also a learning phase for me, i need to learn more.
and i actually asked ai tool this again and this time it got a better answe=
r:

"rcu locks are complex, it is not enough to just appear to be missing.
why does it appear to be missing? look at the entire code, how is the
lock/unlock balance provided?
look at past commits, why does it appear that there is no unlock there?
look at similar codes, is it intentional to act like this in that place?
experiments, tests, asking questions are a must.
in other words, do not ask =E2=80=9Cthe tool warned, let=E2=80=99s patch it
immediately=E2=80=9D but =E2=80=9Cwhy is there such a warning, is it really=
 a
problem?=E2=80=9D
"

this is a pattern i dont normally see elsewhere in kernel and i was
convinced that the switch was left open.
i learned that rcu_read_lock shouldnt be missing and it actually
improved my approach to kernel.

so thank you again.

Regards

Ozgur

> Next step: hypothesis that unlock might be missing.
>
> Next step: blindly send a patch adding an unlock on the strength of that
> hypothesis?
>
> Sorry, no.  It's not just that hypothesis is wrong - it is, but that's no=
t
> the real issue.  It's that instead of
>         * asking how the hell could that work
>         * trying to trigger that and checking whether the hypothesis is
> corrent
>         * looking around for similar places to see whether it looks inten=
tional
> (in which case it still might be a bug, but if it's inconsistent, the odd=
s of
> a bug are going up)
>         * looking through the history (e.g. with git blame) to see if the=
re
> might be any explanations in commit message
>         * looking through the function in question (git grep would immedi=
ately
> point to fs/fs_pin.c, and the first glance would show rcu_read_unlock() o=
n
> all paths through it, with the total balance of lock/unlock being -1 on
> each)
> you've chosen to post a patch "fixing" the problem as a way to see whethe=
r
> it's actually there.
>
> Folks, programming tools can be very useful in directing to places that m=
ight
> be worth checking.  The codebase is huge, so any heuristics useful in tri=
age
> are Good Things(tm); if instead of "bug found because somebody looked at
> random line picked out of millions such and it turned out to be broken" y=
ou
> have "bug found because such-and-such heuristic had picked that line as
> odd-looking and it turned out to be broken", you win even if it lists
> 20 places and only one of them turns out to be actually broken.
>
> But you really can't treat that as anything beyond a hint to bump that
> particular place in the list of things to look through.  It might tell yo=
u
> what looks unusual, but that's it.  Same as with any warning from any
> source.
>
> Asking around is fine; so's experimenting, so's reasoning, etc.
> But you can't go from "tool gives a warning, I guess it translates into p=
lain
> language this way" to "modify that place so that the tool doesn't point t=
o
> that place anymore".  You really need to understand what's going on first=
.
>
>
