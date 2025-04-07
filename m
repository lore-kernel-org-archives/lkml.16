Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CDD23AE64
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010602; cv=none; b=qS3W5ibqNC7/xbEGe90xVLaDiogYz6GLfCANgY90zsO5CqSKtUjrdNDuzQPU0AeLYo8Lj2iTl0wrveC5dE+UvL2xIsn21jjzSMcnAiVv8o2UpuH72FI9xyUZBWA9yg8Q15neDG2OCFbG+we+HjEfB72xO4uuLTdlgIBvjHoFU+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010602; c=relaxed/simple;
	bh=UuNxr+dgb3XIhq08xwKLSg4KhRrlfHTjE4wv/bqgM3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yo50/BFB5naIajP1x/I/BNL0amC3orkgXXA5nbN3Da0UnNymoQecfmzCAqrQsVT4BH4WCmeYdoUEPfjXZUM69Xjvk09/ye9Uo/ESVzxlqrL/H8IcaTm1OB5PFpfaFzb3caGU4m1xUnGNDpBpt96EfLp2v7rAO17hPn/4r9rcDR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OQxt9aoP; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OQxt9aoP"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499c5d9691so4542567e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010598; x=1744615398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUd5CzqXaQB5AwQd8DkMGlZHik2isRpXFAR7jhuDtNk=;
        b=OQxt9aoPzHpDL0zNTADmXUKp4r8o39eI3NpYhRL3pPUehBbY1Lyn/FUb9+YODMd+Rp
         aBer1FplK+abC7eOaKIlJdIn8dZlJiLZ+PdL2KLs70vJ0j5MQZbdXsLqGSs7EemkN1IM
         0r48OJ3nxNX/gQfWZiPZCq16n7DQ7ucHkK8gePaq/wQzFK5Kr6ThzC/QNzflhBHW021E
         p/K1sHye9Ous34qeBSQ9YeHTwroM4izxqsQ5BWHLYW4hYWBfm2CM2vk9Gl6hjKFIWrQD
         BZyC4qYeI8qpiGjiUAUWSX7/cdZXMOpLo/z+VZhl+hux+ElLUqfymxWdl3mEmDpG1O6P
         KI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010598; x=1744615398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUd5CzqXaQB5AwQd8DkMGlZHik2isRpXFAR7jhuDtNk=;
        b=JlPvPkjPVjm4M6ThoB3AeTZsRqAJC8gQYUj3Tdi1zD4l4aHW6n+DWTaFCcTyFnvYM8
         2/NXZfRNDQprMFiMqL2dho3nK4sGqXlsqzfU5EgkCAc3ftGKQUoZPw9kH0c5CKfbvv7W
         qSuK/kgBloHBtMLV/wgWFqKDS+uWGzqvOa5BNgcfyA0uEYtkjnv4z31kdLZakK1cifln
         Q7hTgYKtI6+MiHGIiWF2gLSymM7cA0LKj1xMqb8wZcw2d9F/jCVPbnardremf6znu++F
         POvJEt6Y1Y1lyyJ0lTxOHipxUJOj06IfDmv0xvUKsMxWczODPTSEKwXD0oJ6UJrGMJUs
         LU2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRs2glrdazGMZPxRgCeRhitihzHr8aT+nkxVjXKQwDYcl+tHvO81e5/4DBvyHjyNuOBy54jQpjxczhFa4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDwDA234OT4rwkEEN8vxHZXlcstHjIwnMXCliGupKjt2/nUxP3
	KqIeTEeyshVA2Upo7p9FuxAWU6beDOOl1NoDd2vMyLogRUqvlpQKfeHBBh0ZecMFelxPb10B9eK
	QeyYiMZw/TueMj0UeYEFwY4Nxeulm9rrkteqTVw==
X-Gm-Gg: ASbGncspifI2stVwkTWGmgubuejZwQiFT325En9ly/hNpfQAdYeLYqNjqhWuqMHPPJ7
	G6h9m9eVwpypiyI0YU22vEidsZAeljZxEdraKGOWz50tnR7B4Hki1EkZD648Svg6wWUT0c6FS3b
	eoH7NfDqxgGiWlop98Vok/w6c8cGhMwe7yGKnXgDc8ehvzKMPA27x+P/Cfyg==
X-Google-Smtp-Source: AGHT+IG1jAmodpPx/XmYnNtzVfJa5iS9LvQwvsGvZE3AWc7IyY26h11tDYkbzWLwdsIhau0ejGv7gK2SJ6yZOhnYWqY=
X-Received: by 2002:a05:6512:2245:b0:545:4cb:b25d with SMTP id
 2adb3069b0e04-54c22776cd9mr2760346e87.13.1744010598590; Mon, 07 Apr 2025
 00:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-devm-mutex-must-check-v1-1-cf62b440bc33@linaro.org> <20250407091438-557fe081-0c03-40d9-9b1e-9331c5181e31@linutronix.de>
In-Reply-To: <20250407091438-557fe081-0c03-40d9-9b1e-9331c5181e31@linutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 09:23:07 +0200
X-Gm-Features: ATxdqUGAEAOThS3IdiNhVWD3EkFt25Lrh15QTblYaEDhUhmO9TxLO-v-jypwPvM
Message-ID: <CAMRc=Mc-GGsr0Fpfi3hzoH4UGkHeaXQQUvQ2NR=kjbzsotYHWA@mail.gmail.com>
Subject: Re: [PATCH] locking/mutex: annotate __devm_mutex_init() with __must_check
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:21=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Mon, Apr 07, 2025 at 09:03:46AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Unlike the non-managed mutex_init(), devm_mutex_init() can fail (for
> > instance: on OOM). Now that we've fixed all instances of users not
> > checking the return value, annotate it with __must_check to avoid this
> > problem in the future.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  include/linux/mutex.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> > index 2143d05116be..e194f8c22d72 100644
> > --- a/include/linux/mutex.h
> > +++ b/include/linux/mutex.h
> > @@ -126,7 +126,7 @@ do {                                               =
       \
> >
> >  #ifdef CONFIG_DEBUG_MUTEXES
> >
> > -int __devm_mutex_init(struct device *dev, struct mutex *lock);
> > +int __must_check __devm_mutex_init(struct device *dev, struct mutex *l=
ock);
>
> This didn't work for me, see [0].
>
>         "Unfortunately __must_check/warn_unused_result don't propagate th=
rough
>         statement expression."
>
> Also it is missing the !CONFIG_DEBUG_MUTEXES case.
> I'll resend my patch once more.
>
>
> [0] https://lore.kernel.org/lkml/20250208-must_check-devm_mutex_init-v3-2=
-245e417dcc9e@weissschuh.net/
>

Thanks, I should have actually tested it, duh.

Bartosz
