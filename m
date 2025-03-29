Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329C91C36
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 00:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743209287; cv=none; b=Ce0fSFzp833fUuF4myHvq+ll5RbtcXwC/ynnxB5wb07e45mJ0AI3d8v9QKpKfkVYDiat8lSNXpi16cCdAWd96QRORigkvf2vKnoM0Jwq1EaLMydoYdU+/FvtNs7h4FjTqCqkU9M4XL9AB/NaHSol60cNdDTNABHRHLSNwHEnXrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743209287; c=relaxed/simple;
	bh=kkrqbbJS3tHCnckBYHJoVp5XYegzl6tPCEj6+qz4oz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ro4GMcBjWaaY/bITqtlhuA0shqx0BZ9ILs+QM8uM5TGBER9IJLr3QpHK8WNG7kZJf5d93Ctek+H5YL6k6sMafooyE6T5M6Q7iQQ4LsgDAkUC6fVQtrquH90Swkcx7nJrFao3x1Vga5wOZlTNFOT13AlL3csO60nlgrthGaKlb1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=I/O2+5cq; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="I/O2+5cq"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso4239663a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743209283; x=1743814083; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vSWfXqTtVONWjEjGnSYCIl5O9S7T/KCfljo3I595s4w=;
        b=I/O2+5cqMIq7s+jCTjai34PePm+TgH+IFptelADfkwvhTTfDSdPLdCZGRhV3j5Fmex
         qm5x8Zh4JGoHxpLQulN6z1U1RRFHBaQOmsf1ecX5H8gDEk/WSWDqXmSCLTMoKBSwv6Ay
         7mG3CIrxZIzDwEjcUTZzbCgRRVYQljlE1GX/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743209283; x=1743814083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSWfXqTtVONWjEjGnSYCIl5O9S7T/KCfljo3I595s4w=;
        b=akB8HXJRao+/6NOZow9WzIDggUo2yA7vBlpLFkyABcc6r2phyL8rEg2RCFfNuM3yQh
         n5wAASzn5hPqf4bxgoxZjmmXXOrGP9i3iBCkyxwfzLDi4zNxuhnVtZiEhLG5hHf0alU8
         g4g3sv0Ww8s+7YdRU9Qq/PEEg+3a2Qpu2peG57pVgSryyZnp5O8Yolfpy6KRSvSIvcZW
         FNxciBT4AZZZOCpX0vfEWB9r5w2w/0KlvS5sYCP6jSfFIp1xqo52IRC1Lp9FcjpbtO5E
         UXQsYX5EvDxnvUOx6kyWqQ7CFKf9SJMhq/45SBzQQVgly7FNlFZXK4nrxVPkNTyGhcb6
         /kLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOEKMAa2UQQKbtqdrXdRiBEdZIGO6DjZgeYnk+tqvjM8UfINQhZfwifBQCZMSW3RW6WcL4elwItfXpcdc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6gmVPM7d1S0Ke4y67asiUxw6Yay+BlD/2w3BDjrNPcvw7OFKW
	GxldhcfjcP3W6Jbs9sVDb40xdke85Ewq6NtOUPkk7g6jcqtlr85fPz765xV8H2nzdbjD9/VFgcT
	D9mU=
X-Gm-Gg: ASbGncv0RZoLC0dFLyrHb0Zw8tM2eIw2f68bRYolSHgHXxBpanu7dqISCXyuYrjDwlH
	OCrt2Ql1iytfvWv1rQa79yfmedeH+5RosN1e9U53i2HlVsMOzqBVwA8+ocVzV7q0XQQiZa9PtGn
	8fZzfKzjXjZ7lacMJRUtuAr1nglTFdedLoWog2tknC4zlyFPrmzBuOIPN2+9tkXkuujq7hFJOQg
	6kvYfRmJpstMF2hq7YfYC4k2Ff/TBowlniHmShQv8KnDjQtvHAckasHsXUxjvfy/pjCMDPdq42T
	/cPiJW5R4cVfhfzGyoeu4mxAeuKehO8X9qDEpDw9bEfnwa5dTIaInWp05BjHdmDZZwinlPTjd7z
	zTXhWXV2BY7qjwnMLl8c=
X-Google-Smtp-Source: AGHT+IFYkxgVbEJk1bsAV8ZW5mRCzHBgdPTZBxA2HxyxPFFQ+UY5VQh9nbQ2jN5J3qHjQIBOTpl6jA==
X-Received: by 2002:a17:907:86a2:b0:ac7:3323:cfdc with SMTP id a640c23a62f3a-ac73898bff7mr96230166b.10.1743209283062;
        Fri, 28 Mar 2025 17:48:03 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961fd81sm238577666b.108.2025.03.28.17.48.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 17:48:02 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abec8b750ebso432573566b.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:48:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXr+BkImpfQgSK6zQOSTLE/QWNtWkuxK32+UtBgEis98EMyNnln49PVPwKnkMy/lRC5SFYSnJhojm7V+gw=@vger.kernel.org
X-Received: by 2002:a17:907:7243:b0:abf:59e1:ad88 with SMTP id
 a640c23a62f3a-ac738a52618mr108343466b.29.1743209282057; Fri, 28 Mar 2025
 17:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
In-Reply-To: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Mar 2025 17:47:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
X-Gm-Features: AQ5f1JpwLkBfLNPVNA75n3MocrdUGO9s7ICZtUVMklJ6FSaTF5cP68qqN1KX5Co
Message-ID: <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
Subject: Re: [git pull] drm for 6.15-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: simona.vetter@ffwll.ch, dri-devel <dri-devel@lists.freedesktop.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 19:53, Dave Airlie <airlied@gmail.com> wrote:
>
> This is the main drm pull request for 6.15. Bit late, but my wife was
> away getting a PhD and kids took over my writing summaries time, and
> fd.o was offline last week which slowed me down a small bit.

Grr. I did the pull, resolved the (trivial) conflicts, but I notice
that this ended up containing the disgusting "hdrtest" crap that

 (a) slows down the build because it's done for a regular allmodconfig
build rather than be some simple thing that you guys can run as needed

 (b) also leaves random 'hdrtest' turds around in the include directories

People already complained separately about this. It should never have
made it to me in this broken form.

Why the heck is this testing being done as a regular part of the build?

And dammit we don't add random turd files for dependencies that then
make the source tree nasty.

The thing that made me notice that it was still there was that "git
status" complains about the stupid turds not being ignored.

But more importantly, those turds also break filename completion! So
no, adding it to gitignore doesn't actually fix the problem, it would
just have made me not notice as quickly.

This thing needs to *die*.

If you want to do that hdrtest thing, do it as part of your *own*
checks. Don't make everybody else see that disgusting thing and have
those turds in their trees.

I'll just disable it by marking it BROKEN for now. You guys can figure
out what you want to do, but no, forcing others to see those things is
not the answer.

I would suggest you *not* make this part of the Kconfig setup and
normal build at all, but be something where *you* can run it as part
of your tests (ie do it as a "make drm-hdrtest" kind of thing, not as
part of regular builds).

                 Linus
