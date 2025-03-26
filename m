Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B659125F7A2
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 21:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743023189; cv=none; b=oU2CH+13z/ttH3N0UzwlbgVBuUvg/371cz4Klir5qZ+8q6GC42N54W7Y1BNjlawqjG04aCz6qQipWW9c2LDDGkR1yTRznNwc0dlA5YJ/Tpe9a6vbro1TQ5yiRHP+J/HsPfdKjqxir0WgziGQfnF7pePmUmttQC66wG5yRpOYvKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743023189; c=relaxed/simple;
	bh=rBOd0N7sw7lqSgPKAUfjO0c8aSqpEDqRGYRlPQCZwgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQBc52Oj82lUv6qgI2Gfqer+8K02w4ojdnUqxZu9i/1aBLzsLhVEWKq3LZbZFBTsJ/xZw/XdZG0jjG63OdZUwb7VQ4Rb1F37b/NLHEGzMGFPjst/N00v6lgtDBBc4Y/BIjdihHSl/DnwyoF64/hNmhbatWNRPgTQydlQR17YlXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=S7B7usao; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="S7B7usao"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so41807666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 14:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743023185; x=1743627985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IzdIojrDdHs/8zIWGqiZCIGtqwEg8y5P2tmcwYv1zsk=;
        b=S7B7usao0A81kfX4snBkhwoBFIy7ggcLD35/0Ansmf/cddBLgIdmZjw55X+3uZaEOa
         bqqDJY92D8DBoDiLuPbcRT6KnJGG/sJwMbjdXudryla2eNlUfhp2/lJzezRSLASd4eCE
         Y7pAkItDXlpYnaiCawglmWhn7BBtc7+QmoZEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743023185; x=1743627985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzdIojrDdHs/8zIWGqiZCIGtqwEg8y5P2tmcwYv1zsk=;
        b=OVCkfgmNnhpmp4IcOjpK5T/fL01DFkcj5eF5sQf9YP+vHdXbdFOFiRXTH8mooxBXPu
         ihDZiRyr5f4tLzRtvSxXF/Nvy/2NR7G5L0VXb+ggx+g4Dllno+ts5mtp9FDLGMf0+zSg
         xpCeB4+uXtSxbOvhOsQZEsyLOEDbamB2kma88lQvDMB87lGE+X2gsqIic+Jq4atT2QcD
         fga2MY7uLDRiwcz1H7NNUsTWZXPYYGIMeLkY95oe+xDSXNaoT5N/3saTD1s6UNMxpS4/
         Oyi3jwKdk2QEmataMdqwC+y97gGF8RD4eoJV86pqTzomjhWm1o1mBNdMHsHJpB/H+OF7
         mG/w==
X-Forwarded-Encrypted: i=1; AJvYcCXN8OpTte6GbwxrdFaz0iDRz4XGcNN+Yq1prbCSlpzPNNtpwUpcpLeWwaHp6PSGiaG7oq/GD/6GyAfZfnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYkdKlJivhEkFz+gSPlP7mutQiybLZm7UE5yBjDMgZkzC9oA+9
	j5tbVGczm0MibKFJPFXYYCxP/fO+QIib9MVlokhv5zrvIxRiIeUAACYTV/vGVe6eJphn3vb9hyR
	Da/o=
X-Gm-Gg: ASbGncv9lbpD/Sqez70pULVGNt1iHBf102qCuDigzoOoJ0oY40VEqgU0ai313QHVVwm
	zPn5v8C/NghBQOVWugOvovoVLM1n+SNG901sh6GYmqmPCkd3GhFJXRDFVU1tCcojgSLAuZeXGrO
	3tRlIum94gbd4yM6e69L4ECv+3HNmB4p9dZjc4GeWz4HIHQkL3hzmVi5ZmPoKX5yN/cH+6q65fR
	7sveV3UD+40hVOcTIzG3oQo624TMic55ZcX/V9JGPUGzzgUHw/4ZYlbeWrNFLTaj9p1reO3aqB/
	SUAYg+VLuKy7gKZ7lHnjFvjPjcj1sBCthAlM2Kryl8yH75Y/0B7s8sBeYx9uyputzhjutY3PUMG
	8Wx5sHszqWPp+FfJ4P7Q=
X-Google-Smtp-Source: AGHT+IFXASovv2jA/4BqJVkwBel9Ejb30CZBisxd6IewQMXZGD2zxrzVHyjs3HsDFVDZJ6JYPGnMcA==
X-Received: by 2002:a17:907:1c28:b0:ac6:e33a:31fc with SMTP id a640c23a62f3a-ac6fb14c8b7mr82334566b.51.1743023184600;
        Wed, 26 Mar 2025 14:06:24 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbdfcd3sm1103082466b.132.2025.03.26.14.06.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 14:06:23 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac29fd22163so42439466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 14:06:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxFr27UJ910lmwNt5MAn2ibIwL0uKeGlDvd8UqHL55zO94Cbk70MM20AVydwy0Rijgkjq40/NRaILyvng=@vger.kernel.org
X-Received: by 2002:a17:907:1c27:b0:ac2:cf0b:b809 with SMTP id
 a640c23a62f3a-ac6faefb3c6mr77839666b.31.1743023183362; Wed, 26 Mar 2025
 14:06:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d0ade43454dee9c00689f03e8d9bd32a@paul-moore.com>
 <CAHk-=wjbahY4JjLCXNT4o3xVq2cejqBG69z+MNfHsN9FQBnbOw@mail.gmail.com>
 <CAHC9VhRExVqdhHqs0njs7NY6bFg0BfcE-gMpS30HW9O7MSDfWQ@mail.gmail.com>
 <CAHk-=wi9m8-_3cywQCohJQEQtuQ+teS4gOtBkWZrhFWzNy-5_A@mail.gmail.com> <CAHC9VhT3D7X=4SpO5xbYm=JUwJqTa7tn=J6QMDBV96c7VBUw4g@mail.gmail.com>
In-Reply-To: <CAHC9VhT3D7X=4SpO5xbYm=JUwJqTa7tn=J6QMDBV96c7VBUw4g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Mar 2025 14:06:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiH3hoPTxX3=xTRzRuCwktf3pNzFWP45-x6AwoVAjUsUQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpOP7o7v4OvVtYDIcepm7xWCMUr4sx6jgUkuQxGuRmvGQLwQrHUGSdEb-s
Message-ID: <CAHk-=wiH3hoPTxX3=xTRzRuCwktf3pNzFWP45-x6AwoVAjUsUQ@mail.gmail.com>
Subject: Re: [GIT PULL] selinux/selinux-pr-20250323
To: Paul Moore <paul@paul-moore.com>
Cc: "Cameron K. Williams" <ckwilliams.work@gmail.com>, "Kipp N. Davis" <kippndavis.work@gmx.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, selinux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Mar 2025 at 13:48, Paul Moore <paul@paul-moore.com> wrote:
>
> Looking at the pre-patched code one can see that SELinux only enforced
> access controls on kernel module loading

I *know*.

I've looked at that commit. It's why I'm asking.

>      Moving forward to the recent pull
> request, the LSM hooks do have the ability to gate these additional
> file types, and for a LSM such as SELinux that aims to provide
> comprehensive access controls, adding support for enforcing controls
> on these additional file types is a logical thing to do and consistent
> with our other work.

Again - you're explaining what it *does*.  I see what it does. That
was never the issue. That was the only part that the commit message
talked about.

What I'm asking for is *WHY*.

I realize that to you, the security side is what you do, and you feel
that this is all some internal thing to selinux and may feel that I'm
butting in where I shouldn't.

But to others, these things cause extra overhead, so it's *not* just
internal to selinux. It affects others in bad ways.

I want the _reasons_ for new policy hooks to be *explained*.

>  The fact that these changes didn't happen at the
> same time as the enabling support for the other file types is likely
> due to an ongoing challenge we face where we sometimes fail to keep
> current with all facets of kernel development.

You are still just talking about what the code does.

I repeat: my questions is *WHY*.

*WHY* is that policy needed at all?

As you correctly point out, it has NOT EXISTED for a long long time
already, and the code has been the old way since 4.x timeframe.

So my question literally boils down to "WHY SHOULD IT EXIST NOW"?

We've done quite well without it.

And I do not not see the point of allowing a driver module load (which
*is* a policy, and has been for a long time), and then disallowing
loading the firmware that the driver needs.

That's insane. So explain to me why you added what looks like
completely insane policy hooks.

See what I'm complaining about? I'm literally looking at that code,
and I understand what it does, but it adds policy for something where
I do not believe policy makes any sense what-so-ever.

The whole "any policy, anywhere, any time, for any reason" model is not valid.

We don't ask for permission for core kernel functionality. We don't
ask permission to do things the kernel needs to do.

And new policy rules need to be explained.

             Linus
