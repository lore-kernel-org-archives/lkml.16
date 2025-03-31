Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C022144DB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435799; cv=none; b=cJwGQymen4bngPxeDYGl3YRrPXKjo6DWtUFQe4mTbsuDM+rQJBbsOTRfMzOJvC+e/tPl0823hM2RY/05BAzhthfdik7p9rflTBY7XrixaKZldpaz3IWKee68nqHtpqj+zAoCsAfVPmioTlCq7wqmVle9neflHe73PGuh3DCIEn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435799; c=relaxed/simple;
	bh=8M21e2bPw/XHrMwJQJmij5CTAx82o/bwvoYo/O+0QBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMYvwn70m4rpx6HNr6hr61wRRxs0v4ZasMFVjQlhsIVVULzbSFjnaEzUGbKAH/9X+kw9u/e9Vrp7EXd0e0uvunnXW1hgTUFff+gXEHISJ9Jipiv8ERh5Nr7G91YcBaQyMjHSfYLtLH9Q8vSHF63nwZgUxi+a1C1Fzc06sHIpysk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Q6aaM3vb; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q6aaM3vb"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so8652727a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743435794; x=1744040594; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yMjGxaRDGHxjr3R7uBwpfoqzwwin8pE68FeG7DU6JqA=;
        b=Q6aaM3vbqRyx82Ul2OavSTxgseqWqRph7/232zZ8nBs9VcfPqMHZdFVNDjtPs3jYPY
         RQVo5FL9eenvrsBwyMaUHvFSVqw3Cl2vHnbsSPU0QNNeniGpm3VwQOFC40QSH0qvnYgF
         9vp7aB8McMzLhnWntKrsrCcI5Yp3rE3w4TtzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435794; x=1744040594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMjGxaRDGHxjr3R7uBwpfoqzwwin8pE68FeG7DU6JqA=;
        b=lAvzVq11+PqbAjPstnMqweWa6taHC++FZtjGZo/BJa0m6/vMtghJ1NeVRphB/oJnPo
         GfYGtF9NOgv1+D3PVQVQfi8tFdW3zBadilfwzM5cosbJQF5WV7/QlUeIBe81BAliBHKN
         L4/A8h2N2N25eCGYHGENjQ2cMVb1Oz60TLMUF1FPl4UO0JE3S/cGxvIIMA2tagTMLiFD
         IElxyjHHusK7YOgDhjzPw3gQ/tv84nnr6AEUVR3mhiTOTk7BMOqWb1EoXhI103BHkH0t
         0IUyyyw2BttyAG0dZe14vRCKNj9BQcAXyBL3vYOlpujWhzYVFQ51Uf1cb89Mq721Cx9+
         CKPg==
X-Forwarded-Encrypted: i=1; AJvYcCUetZi6xiXYeQiMWx3TsbDyNHw8v9rBZ/DW0nJnB3C0FrZmAQZUcYLzYO8+VmvRzBZVT7nCNDxYZD4J+Zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFWy/gyFWgMUY7+8QoWi0hO+MKPkPTORWuczWzRJTw3UTNnLLZ
	N84iMDRsZGMYbfOulraNiwvoC0GKv9D9pnhPpTjYeKWJGDk00ALBKvM8O3UqT/YHJE8PauTFs7q
	QMyA=
X-Gm-Gg: ASbGncul7oghcbzfWIONwLvLcxblQYYWr3uVu62wjzY9yNpwPU1nPRg9ML6ygyq3Mo2
	TnT1BAhhf2WVlb9TD2twIRDmv+dMTofZgHa8ccXpqdfUX6cwKbTVWLrkhguux22WlOuIH21HKNf
	CVGP2FRaPoTaM5GYKkTaAGD2YMlqF8Fe7KYVgac+Dg/lG+PvLsdUM1GpY5u/SxcJPVXB/wUF9sm
	gx37l/1qDdkJJkn4ET7yGadQFXYdE/9F4pjmbYMr1/TL2gUP7/1eVpN6KVjYL61v+S4t7mrvR2O
	1Aakj3Nzn6D/mFfaJRYD3QyiW1US84W9VOcAASeg8sbRMOYpItuQuyh9uoz7ZLIzSnlZEK65gw3
	mIPDg5VyCbycZuH0aPak=
X-Google-Smtp-Source: AGHT+IGQ8sE4d4C9nVIpEwH9KwHHzQ88xJqFiR+ftzFbyCeNdt410LL10vOfwLOgjqhDwnFF42Dppw==
X-Received: by 2002:a05:6402:3508:b0:5e5:e1e2:327a with SMTP id 4fb4d7f45d1cf-5edfd9f72acmr6856077a12.23.1743435793799;
        Mon, 31 Mar 2025 08:43:13 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17b2eacsm5769079a12.59.2025.03.31.08.43.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 08:43:12 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so8652677a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:43:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWilcFjQFf/05nmmthEmF/yxkpJjZGEAa1OtTPQ59zrowTJsbWTQ4cBwoP2XtVnw90RshpptlVVNgG0CAY=@vger.kernel.org
X-Received: by 2002:a17:907:3da3:b0:ac3:4227:139c with SMTP id
 a640c23a62f3a-ac738a5064dmr780994366b.24.1743435792395; Mon, 31 Mar 2025
 08:43:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com> <87h6394i87.fsf@intel.com>
In-Reply-To: <87h6394i87.fsf@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 Mar 2025 08:42:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjMrqzuUmH-mFbR_46EWEFS=bB=J7h9ABMVy56Vi81PKQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqDOQu2rXYlordNqK8OP1UL71OTMOmBdN7AbqaVHtfzJ6PVQyJ_bez4boI
Message-ID: <CAHk-=wjMrqzuUmH-mFbR_46EWEFS=bB=J7h9ABMVy56Vi81PKQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.15-rc1
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>, simona.vetter@ffwll.ch, 
	dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 03:17, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> I suggest a Kconfig knob to truly make this opt-in, only for developers
> who actually want it.

So honestly, the thing I *really* hated was the horrendous naming.

I live in auto-complete. I basically never type out file-names, and I
replace keyboards every once in a while because my TAB key has worn
down (not really, but you get the idea).

And *if* this feature is useful - and while I disagree about the whole
"header files have to be self-sufficient" as a general rule, I can see
it being useful for uapi headers - then dammit, the file naming needs
to *DIE*. It needs to be taken out behind the shed and shot in the
head, because it messes with TAB-completion.

Having "this has been checked" turds that live in the same name-space
as real files is wrong.

In the kernel, we often hide them explicitly (ie using the dot prefix
to make them hide, but also to make them not mess with auto-complete).
That's an option. But some people hate the hiding, and if that's an
issue, just put it all in a different subdirectory entirely.

Yes, I realize that you guys may live in the whole "different
subdirectory entirely" world of doing the whole build in a separate
build directory, and might say "why are you working in the same tree
as the generated files in the first place if auto-complete is so
important to you".

And to that I say "because I equally often look at the generated
files". When they make *sense* to look at, not when they are
auto-generated makefile checking crap.

So please. This feature needs to be done completely differently.

           Linus
