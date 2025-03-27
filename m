Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22043189BAC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 04:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743048595; cv=none; b=IsvVC358uGL0p7QPr8Lyf4LKMVAIUglKKovf4LdKiM48+7fj6+gfoddeGexoeJOAG9zWL8a41HmarhMr0KxfT3Azi++sz1yvvIklaom11IQZVDU05sIkcX+Umu0YbqcQIVoHZfxUA9CpsA+TIE1e1NHahuxMDNMiJaK9wjzQH9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743048595; c=relaxed/simple;
	bh=Lz1FQLkO9pjDr4w82/Pd95GcHEkMkqv3nNZh8P0KAio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kuFqyz0I8WwdvQOYKNoozB9V+pBj8XAbmTKSmvRjW8hE/Z/fDC31GwUeyqoGOFssGibew0pZD1SKCbm9TDQ/MMqrCeK76vFiOoCRpVkXTh/tx7YoC30SnE69JDkIcpdCFlQjp4Ul+/hgdt+yv3054a6PjfcnBdT87m+npRBPjSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UFh4n+nI; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UFh4n+nI"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so683645a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 21:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743048591; x=1743653391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOWeEw9Pu7F8nbiAXPD7wEj/kT9XBFmAh+hzKHsE59g=;
        b=UFh4n+nIhL5CavEpEhSA+WtwZiq7lItzW/qC6N2E5lb1fzC4wC5Tm0QOZi0AD9M1mv
         Ke9PE6zAsCGvYhPNhDlZ0v0TITnv6VvJCMjcCLAh3xokeoNaZ8NDTP6fpY1LsOnQSn2z
         y9X5nDwr3mmyrCi9oA9Z6J3BZ/eKJgjFHxHmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743048591; x=1743653391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOWeEw9Pu7F8nbiAXPD7wEj/kT9XBFmAh+hzKHsE59g=;
        b=BAX/QelUP1l10LpTBuO9yrQ0CYA39f6nwA9gNo2qMjLi5VnXo02lXijEArU3ua4m9p
         rqIFGmxSFYAYDHQoPT+FsvnXB7U896eYy6y7idrmUe8OJSAef2yWPrTFlIOmrwLYiY4s
         tSSG6PRMx+Qh35c5I26+22S6RbojlGzZUGQWIrlA3SpWUxdAyGLGp4nUJBPU0fTASHeK
         fK5lJfrdsJKaj8kv9Ffzm07RCkGHSvoLxWzz67UsKgNRUn2yQHDA3jCv+NL/LwZc9DWq
         G2srRbYuAaFsGpoVvtfuZDf4qu8Iy3x+wylvwZO7tZc5NIOxeZbNWt0ydzVwy065LKwR
         ysJA==
X-Forwarded-Encrypted: i=1; AJvYcCVDmB6/4m8HOPTl491EIrn4rwxR9/LVHtZmuGZspYfHS1+uMQKje++x5jdJer3NynjIya1LsLzCEGdjFNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyacHa6UtTk4gRH6jrDEN6AOWUqU9SpxqHLWPHMA5Ti05Lpta6f
	ZqsRfHlYdhX/fD+1ER2mxWIFsM1xs2Ao+x0DO/uoch2xR6pvu9KlxvVRP5leG5sgSMJtfyaxFLZ
	b8Gc=
X-Gm-Gg: ASbGncuZUovXwiett7JHRz3rtBzLZuppRZOh0sDRcTlBDTO4Y7q06hUZXu+LmEOKIBV
	sh7fmMZphFNJ37EKwFHv2pCcy39V4e9EoaCgLvkbK7uT8qkpbE2OXF5fdGM+0qFr+ZgGKXcc5Hf
	d9x6ahl+ZC/7F24O6tEmNss9pOscjjM28k43pqWDbeq8HmQBDKBfPm2OYY5OFqy2ReVdRXo318p
	X5/bRMSNJcGLok93eRBiMdshhVyG4941AKCfiuV8Tm9Ys9CPnwhYZehrC8xwj1+tGZoIXtrFjbk
	PelSZGh4XMUo6VHXUtLn721oHAcFGo5908Q4RzcQ6205u5enM7+eLdxG+H8QhudlpNb4hBwJuIv
	aGS691SizLNL2AALpnDE=
X-Google-Smtp-Source: AGHT+IFire5HE/oqKNRUb2jHUMUvumfr9SjMxurMQ1NBr5MWa9Yvh47MQ26Hhe4q5T1OPNxuQLA/Cw==
X-Received: by 2002:a17:907:9625:b0:abf:6db5:c9a9 with SMTP id a640c23a62f3a-ac6fb10678amr177961466b.39.1743048591046;
        Wed, 26 Mar 2025 21:09:51 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efda6d3fsm1133324666b.184.2025.03.26.21.09.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 21:09:50 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so85601166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 21:09:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXHEUrgyQtOWOaQxARaWc3fiK5wXm9m8SjRC738sEYRZ93UK9l2eK6plRoFoDuAJFLjAdBsCeoU0JTFbM=@vger.kernel.org
X-Received: by 2002:a17:906:c10d:b0:abf:69e6:438b with SMTP id
 a640c23a62f3a-ac6fae622dfmr169188166b.9.1743048590150; Wed, 26 Mar 2025
 21:09:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d0ade43454dee9c00689f03e8d9bd32a@paul-moore.com>
 <CAHk-=wjbahY4JjLCXNT4o3xVq2cejqBG69z+MNfHsN9FQBnbOw@mail.gmail.com>
 <CAHC9VhRExVqdhHqs0njs7NY6bFg0BfcE-gMpS30HW9O7MSDfWQ@mail.gmail.com>
 <CAHk-=wi9m8-_3cywQCohJQEQtuQ+teS4gOtBkWZrhFWzNy-5_A@mail.gmail.com>
 <CAHC9VhT3D7X=4SpO5xbYm=JUwJqTa7tn=J6QMDBV96c7VBUw4g@mail.gmail.com>
 <CAHk-=wiH3hoPTxX3=xTRzRuCwktf3pNzFWP45-x6AwoVAjUsUQ@mail.gmail.com>
 <CAHC9VhT5G6W7g9pB3VM6W7wCEJjWfYSUWNgWF+rRiQ4ZQbGMEQ@mail.gmail.com>
 <CAHk-=whwQhJtafHN4B1w-z2Gno__xLHS4NouKKHrYNTYa8kz3g@mail.gmail.com>
 <CA+zpnLeK2Ecj1mBod2rFe4ymd9eXiJkbyYwFh4Yrmck3DVB2SA@mail.gmail.com>
 <CAHk-=wiBH8FBL+pnXui8O-FSdyoG-yX81mUF9bsZcC6rR5ZtgQ@mail.gmail.com> <CA+zpnLe_AOpS_F1UBNOvN3YRswUSy_3=0jjUAy4GPxEHYumD0g@mail.gmail.com>
In-Reply-To: <CA+zpnLe_AOpS_F1UBNOvN3YRswUSy_3=0jjUAy4GPxEHYumD0g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Mar 2025 21:09:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgJ0gzYJD+MghfVW-YeGLW6sLU5soFY13KWmPAxobk5Mw@mail.gmail.com>
X-Gm-Features: AQ5f1Jphh6bvpH_hyDGYydwiPutImRu0h5mKD_G1WlOxtBvFwB1PFPSAJ7TmHxU
Message-ID: <CAHk-=wgJ0gzYJD+MghfVW-YeGLW6sLU5soFY13KWmPAxobk5Mw@mail.gmail.com>
Subject: Re: [GIT PULL] selinux/selinux-pr-20250323
To: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Cc: Paul Moore <paul@paul-moore.com>, "Cameron K. Williams" <ckwilliams.work@gmail.com>, 
	"Kipp N. Davis" <kippndavis.work@gmx.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	selinux@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Kralevich <nnk@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Mar 2025 at 20:28, Thi=C3=A9baud Weksteen <tweek@google.com> wro=
te:
>
> That is not quite right. If you look at commit 581dd6983034 [1], when
> a firmware is about to be loaded, the kernel credentials are used.

Ahh, that's good, at least there's no "random state" to check.

But it does still mean that the security check is pointless - there
aren't any other credentials that would validly be used for firmware
loading, so what was the point of checking them again?

In fact, the commit you point to was made exactly *because* the kind
of pointless and wrong security checks that I'm complaining about were
done, wasn't it?

                    Linus
