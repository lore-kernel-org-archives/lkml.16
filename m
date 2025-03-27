Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A98748F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743036208; cv=none; b=YXc2oobRN1SrlzdqxWNhEmqOERR3aKWE2XRv12MTDioRXbH+4MR2g3VyRA1jZ6wcTfk0KYDceUwCNj66HIRa1BWBBJu/ykmsMCGYZRuhl6ju4niU9BDUFrJwOzh4ooN0ajXUbbiSO2HGXdRJn5tbDRhQYPZyESPEI6XPTm594oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743036208; c=relaxed/simple;
	bh=ZRIq5Khg6Aq51ijIbZoX9tnJGrHj5zAm9JiOUOAN7GI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJv4d1KlT2h0hbR5eCfo58Nw1Zi8CMYl2kcnUFj9Tre5k5OCudc9CmigAUlphoYg5fxQx85rskYBGRaXCOTPnirUVNV5yKgaVNWrHFlgMuYHbKc6tTxvVqk5hhqu+lpGAPd2Tf3mvNmJY0dbBliN5yr4FcVa9i9wsDo2FSxVqyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=C57T9oNm; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C57T9oNm"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so816125a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 17:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743036204; x=1743641004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSEHvwzqc6+vX4GGSMAkuMZSYs/NqElnjSu4FwXASbM=;
        b=C57T9oNmA5iLocVzoY6tXcZx9Rf8pDTK+thraBcqLGPjuHkahokDphXybekcbdBgwr
         k0eLWVNLoGDcwMHXE+KEci3kyfQEErkgv7BFh0sXeQxmUWcKrsZ/4OYyZs85uOSjUCiI
         pzE1Gmfk557mjm1l7fIM2PSJA7NFaDLVkje7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743036204; x=1743641004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSEHvwzqc6+vX4GGSMAkuMZSYs/NqElnjSu4FwXASbM=;
        b=cxM9NMmrpsrEJUKxWBWBPDvDAqKzHLlsxZyJVlXop0v0aUWFzPNj+O539mCq75b9gL
         2LtXjlQxz1SUsTTbyyMiFVsVAlhQ9lZaNfi6COVK2FOIT3vl6emnAWldNhNVnmgxwU9P
         3EHyA+tiK3wKvcv1wZNu3gWZ9BSC+we4Ws7nsr9YAtsrCvTHBPwzOiKYK5UodU18zmqR
         9VNS4ldJLHcfZsAoNlEzf9PjLtjn5X01NL2y3GpCOzuXuzpBE4Jaal+QFxiZSUW6vnlY
         VgltPFn9s//DhunmgB5G90rp4aJAgeOzU6rNnKPazYX9a8Pqt765rFwaXaqM/EL63xhZ
         MrQA==
X-Forwarded-Encrypted: i=1; AJvYcCU6o0VkCUCEOSReFmqMC39d9rsdpwEhAlNSEzVf0LP/aNtbTt/u+FJJVV54WMPqhcj/ObZXkz7jXYDL/rQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY6KEZzwvHFbYxxzNUPkNLbLrp3E5h3eJ+ktMi1lgLvn08ftyj
	xEhGKlIlmU+FPdhCe4nrOA2zxyIK3HcRS986wagt/nZvUD+lx/VmNQMDy6PDXbgBnJXH5vudHT8
	1aqs=
X-Gm-Gg: ASbGncs8EuasV68853rlct/v3dp9IhJmX27fBb0xPP+dVMz/emBh045nZTVqXQ07+Sd
	XEivWYxKY/VO0+dILjqeDTY3viZriD9H9Wa/vFPyJFGn6sODS1N0T42no6QnN0NSufUpJ6QP1cV
	EVs1L/tVzLi72/1vQYsyiNWZdOtOYsEg0oxWGBR7HmTatQ/11KD6P5Rxh6xtMw4Xp5Ck++kxK/6
	aUysixIlaPxO9caHQXV4ZwUO6hstom5MmgYOsSNeYwDogESm9fV4EWlCdwrEDdZYz2lHqigu19n
	zm+HIEC5IcyrTVfTJwaQ5zizwuscF43nRdAD9v55miE8w6KYf0PmtXnxK2P3r9rrkAy0VZe5SrI
	7r/Jcfp0qIw4Rerdg49E=
X-Google-Smtp-Source: AGHT+IG2zhkF2wUiYM5u3esw+dTliPvNJuSBKWcR8DABmO1ne7OYZuEgGBNkqWIiQ3J5mm6+zHF8Ug==
X-Received: by 2002:a05:6402:440a:b0:5eb:534e:1c6c with SMTP id 4fb4d7f45d1cf-5ed8eb08b2cmr1366034a12.20.1743036203858;
        Wed, 26 Mar 2025 17:43:23 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0c6f25sm10074889a12.57.2025.03.26.17.43.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 17:43:22 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso82025166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 17:43:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEPa+afXC7Pf+eSSTRYpBSQo3ax2uSx8sEeRhnNiIzXgV9EB92OkctgP1EvivBJrkmhRtLBoqdQrN3VM0=@vger.kernel.org
X-Received: by 2002:a17:907:2d89:b0:ac3:4487:6a99 with SMTP id
 a640c23a62f3a-ac6fb17334cmr105428866b.47.1743036201761; Wed, 26 Mar 2025
 17:43:21 -0700 (PDT)
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
 <CAHk-=wiH3hoPTxX3=xTRzRuCwktf3pNzFWP45-x6AwoVAjUsUQ@mail.gmail.com> <CAHC9VhT5G6W7g9pB3VM6W7wCEJjWfYSUWNgWF+rRiQ4ZQbGMEQ@mail.gmail.com>
In-Reply-To: <CAHC9VhT5G6W7g9pB3VM6W7wCEJjWfYSUWNgWF+rRiQ4ZQbGMEQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Mar 2025 17:43:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=whwQhJtafHN4B1w-z2Gno__xLHS4NouKKHrYNTYa8kz3g@mail.gmail.com>
X-Gm-Features: AQ5f1JonWSEl5Zs00Hyi9Ae5fBcyzdZ-fy95HrSDL7P0Ss4g7AbqUZAXwxAg-nE
Message-ID: <CAHk-=whwQhJtafHN4B1w-z2Gno__xLHS4NouKKHrYNTYa8kz3g@mail.gmail.com>
Subject: Re: [GIT PULL] selinux/selinux-pr-20250323
To: Paul Moore <paul@paul-moore.com>
Cc: "Cameron K. Williams" <ckwilliams.work@gmail.com>, "Kipp N. Davis" <kippndavis.work@gmx.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, selinux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Mar 2025 at 16:03, Paul Moore <paul@paul-moore.com> wrote:
>
> On Wed, Mar 26, 2025 at 5:06=E2=80=AFPM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> > That's insane. So explain to me why you added what looks like
> > completely insane policy hooks.
>
> In the security_kernel_read_file() LSM hook, the SELinux callback
> examines if the current task has the ability to perform the designated
> read operation on file A.  Loading a kernel module and loading its
> associated firmware are two events inside the kernel with the current
> task loading data from two different files, each with potentially
> different security properties, and we want to perform an access check
> on each file to ensure it is permitted under the security policy
> defined by the admin.

What this tells me is that there wasn't actually any real ask for
this, and you're trying to make up arguments for a silly patch.

First off, "loading a module" and then "the module loads the firmware"
file are *not* two distinct things with distinct security properties.

The module DOES NOT WORK without the firmware file. So the argument
that they are independent action is complete nonsense. If you don't
trust the firmware, then don't load the module. It's that simple.

Second, your argument that there are different tasks involved is true,
but no, that doesn't mean that there are "potentially different
security properties".

Why? Because as mentioned, loading the module very much implies having
to be able to load the firmware for it - but yes, the firmware loading
might actually happen _later_ and in a different and completely
independent context.

In particular, drivers can do their firmware loads at various random times.

Yes, one common situation is that they do it during module load, for
example, in which case it would be done in the same context that the
module load itself happened.

But it's *also* common that it is done asynchronously while scanning
for devices.

Or done when the device is opened.

Or the firmware file is reloaded when the system resumes from suspend,
because the device lost all its context, so now it's reloading
something that it loaded earlier in a very *different* context, and
that had better not start randomly failing resulting in basically
impossible-to-debug resume problems.

In other words, the context of actual firmware loading is pretty much
random. It isn't necessarily tied to the module loading, but it *also*
isn't necessarily tied to a particular other actor.

So any argument that depends on the context of the firmware load is
bogus a priori. Since there isn't some well-defined context the load
happens in, any policy based on such a context is garbage.

To put it bluntly, your whole argument for why separate policy makes
sense seems completely made-up and has no actual reality behind it.

It also very much sounds like this change was *not* triggered by
anybody actually needing it, and as in fact sounds like just "let's
pattern-match and do the same thing for these things that look similar
but aren't".

This is *EXACTLY* the kind of thing that I think the security layers
should absolutely NOT DO.

You should not add nonsensical policy hooks "just because".

Security policy needs to have some thought behind it, not be some
mindless random thing. And there should have been a documented case of
people needing it.

This is literally why I was asking for the reasoning behind that
patch. The patch looked nonsensical. And I have not at all been
convinced otherwise.

                     Linus
