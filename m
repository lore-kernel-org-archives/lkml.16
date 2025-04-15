Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C7E1DAC92
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706647; cv=none; b=nk4NeeUzaTa1tRXpPs5CE82T3YWCcCfwdKDbrC/feR0jYxqOUhri3sh87gVgfZB/KCnQfXz/CB/dC3xMiYqjFVnm2EqQAxhKosdBaEsMk1+4Di7iVGX3vCV3muu9ca/VRbS/c5sowA1nMoErsp7LjFiR/n2ugNWaxIQ71EaYvDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706647; c=relaxed/simple;
	bh=/896ZSGYVka8ViOpejF5mVMvn2q24U+I9OQ8NbvRuVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jiXawgZuLACpSXwtHfzXAJ2Km4UFNtnkibA9pRVrahW9kJJk4Jg6gnLArzEHO4WdK9jZArUL1bA2oOtcYSsvSNW00ed2bANfqgBjAzYzdWIsNsiIPx9jWXJ+wtOf5Tn7wd1Hce2PEbs86AwQr6C3hDwHJ1lMnEdJBNJMV9VRvQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sl9M7YQJ; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sl9M7YQJ"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30c2d427194so48581291fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744706643; x=1745311443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/896ZSGYVka8ViOpejF5mVMvn2q24U+I9OQ8NbvRuVo=;
        b=sl9M7YQJeXkS9kbOcucEV+sSU2DXBaRAJoA+cFbZHBQfCEN7PduMCbRogvw9AoDCJb
         IKthqh43KJwj6lAKtUmeBWbAb1e3I9qKEap70+/IW5BaUtXUNKxdkddRGoDIWX/NqRIN
         6cFtKKrg6zxKuGJPUxyCS7uaI8efhA6PgbeH73Zzss0ebnEv51Mm8+I1BwYNCue1tMNq
         IjuTthYMIyvKcUSHW0EYhsz/PX7pU7zfqyvXpqzRooBC+CfdDN+UKdbc878b0VWJANqg
         FFHC/l8d0luubKyFiI4JNjtfdShav3SWvqHWmNAJXeouqvjv56fCVO8P/B7pm435qCAB
         45RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744706643; x=1745311443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/896ZSGYVka8ViOpejF5mVMvn2q24U+I9OQ8NbvRuVo=;
        b=v1WoTen/nHIz9wSveHd1sytwKGrBFe7mTt8VxYWgv4/S36imbP03odld2LltqMz7WH
         7Gk0DNDT/3+cJmGDoH/Oqo4UrhmlywDDLqBj2lg2Evq0ta2knxzPLoofbrgTpCajj2uW
         qnEbDGE/XITfJ7MP5mq1l0Cv9PuzLoauKHJ5pzbeRe7zoxhEQuP/b7RJ0B0Uo1Nkoi+x
         w4Q+pIrrvwg3a4Ma4AZ7KJVvAtPZjofq/KvywzxbgNMYN6Feiopjgk02QhfS8a0arT1/
         U8x6GSmEuvnyCcGsnex5g91NLDts2z3ASL2z/kwPXyazV2kkVO6rJ0xcSUtOcBPsBkgi
         FO8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7zFywcy42BQzDSyOhTQty65Y7GQ4Er0GnIB+suf00YgwceqO4JwUXTwgQz5PXYl/j+O+oZwQw7pNp2jI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUkScV+ZKpsP2DkNFP6lrq0R7JScBvdsuwfYpuWRFWYZM9CErX
	G149KqL7fn7FV0RtdliVj0P2KA7Gy2UII3fQeSdPBS3LQjjSM+tPQkmkrlD/3XQ8zF4canV+gyr
	S3MGHPGdaTGf2H6Ay734MhtIU4ZHAUmH8pc9dgA==
X-Gm-Gg: ASbGncvaKc/T5PXUPxgUndiLHau02FtY8VFJL96gok5GjTbWizrq1zwgU6aXfxHQXOm
	GHKbJpdtMLKfO91APUsOgL3y/9+l5UuUaP80Wm5PdDIctuN0ltt7gm2gEf2QgYdckSR4mQBK8BO
	HI0dzf14biR77pCNWbUfdINA==
X-Google-Smtp-Source: AGHT+IFEF/mev3PLvuZ16YQoq/3i5ecaCkHYf9BvQQvirms/WCQvY3L8dXR+US+m2FWo+fBT7ZLAd5znR/L3ddnzFLg=
X-Received: by 2002:a2e:a885:0:b0:30b:c07d:29f3 with SMTP id
 38308e7fff4ca-31049a1accemr47067261fa.21.1744706643015; Tue, 15 Apr 2025
 01:44:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
 <20250331-gpio-todo-remove-nonexclusive-v1-3-25f72675f304@linaro.org>
 <CACRpkdYMRnmYD1YRavZs7MHEVFM42bOL2=6s4rJzFDnfLJ4fAQ@mail.gmail.com>
 <CAMRc=McBWncrCcX87a3pYeZ3=uYGNhpSrK74hDP-XNYrT8WMMg@mail.gmail.com>
 <CACRpkdbeObj7t=quffRrZtZQRRSr6GBeayN3o_8H8zGDD22XpQ@mail.gmail.com> <CAMRc=McKgfT1ZLVzsVbBJ5pFc3bwcGT4AyXG+V0JPP0z6ft3tg@mail.gmail.com>
In-Reply-To: <CAMRc=McKgfT1ZLVzsVbBJ5pFc3bwcGT4AyXG+V0JPP0z6ft3tg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:43:52 +0200
X-Gm-Features: ATxdqUGhXPkYsUwayw5aKSjE23R1hNX1yvPVRHIMfBfrJh6y9OenbmdwuTvFuD0
Message-ID: <CACRpkdYev-uRGwsjbpnYWKUCg0QWy8ZRaFDjJRPVbHCPXPgX2A@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: TODO: track the removal of GPIOD_FLAGS_BIT_NONEXCLUSIVE
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> I don't agree with this. I could possibly live with that being used
> exclusively in lower-level core subsystem code (for instance:
> regulator/core.c) but, in this form, this still requires drivers - who
> have no business knowing whether the GPIO they use is shared - to use
> the right API. Not to mention that once you make an interface
> available, people will be very eager to abuse it. IMO this should be
> approached from the other side.
>
> The closest thing to making the sharing opaque to consumers is
> providing a pwrseq-backed, faux GPIO chip that allows a very limited
> set of operations on GPIOs - get, get_value, set_value - and return an
> error on others. A value set would actually be equivalent to "enable
> high" and be refcounted by pwrseq. I have something in mind but this
> cycle, I already have a lot on my plate. I will get to it eventually
> and come up with some code to back my idea.
>
> In any case: the GPIO sharing logic should be hidden, I just need to
> figure out how to make it possible to be notified about when the value
> change actually happens as per Mark's requirement.
>
> Let me reiterate: a random ethernet PHY driver should not have to call
> gpiod_get_shared() or anything similar - why would it? It can be used
> in all kinds of situations, whether the GPIO is shared is none of its
> business.

I get your point, it's just that I don't see how pwrseq solves it, so I
would have to see it.

I think a bit of my problem is with the name, as in how would a
power seqeunce solve the problem of a GPIO that is shared for
something not power or reset for example.

But maybe all the existing cases we have are shared power or
reset :D

I could think of a shared LED GPIO (this LED should be on if
any consumers A...X are active) but I just made that up.

Yours,
Linus Walleij
