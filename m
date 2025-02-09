Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943CA1E0E0D
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 17:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739122826; cv=none; b=h+KNzTLMeIR6LR8SQjXddBx/Q9gZfLwWofyWObwvo+V/vSROIuC8gXStI7dZc2AD165pcN66YReHzXOfJqKNz779Bp+f7nAbofVbz02wv06Dx+7cYtjfT0nQKiaa+AzrXnVVDqXHt2NVAlCcaA8rXlCy3lEUPb6ZOasddyQjthQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739122826; c=relaxed/simple;
	bh=awNkYa3Md5bUo8i8zsV7pVKF5MYaBSWMYBPHO3M15Qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWmjdMA5Ehqpe7O70pFfxqpNtdT+qL4MO048p2wX1JIqKn0mHcwLvwsLqRdjjZH6po5qGRllXJp+9r63M2KmNcJXUIlUJah8vxUtKimiRiUbh6gtFBDH0WYstVGJaoRRRIS9SAJ1B5vo85AbT2eFOzD70TNsgVvpGzcO8ODkhks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QLgE5oaJ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QLgE5oaJ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab7c6fc35b3so675466b.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 09:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739122822; x=1739727622; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8f+USY5i1jojbJGeDtJw0r2JSIdnbcI05exT8JPCLJM=;
        b=QLgE5oaJzyNQdDyTgdQ2U4IKIxedsy5o/EGCYMF2/zGGpWOvolWiwiSz4UrXku0zBF
         tcrWLmHfj0PaGXAaPDu00DFniPG1ZA+tQFGQwG9SeQCT+iwS2OkDI2SLEl7A/JzJ7YqT
         U1A+0SgSO6RSewqi8lbqK86D3l6mJnlE5oukw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739122822; x=1739727622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8f+USY5i1jojbJGeDtJw0r2JSIdnbcI05exT8JPCLJM=;
        b=YAkxgi9QPrCeU0qoY0RlusqUPCAr2LK5kKqsCK9NIS4P4Qk4JAXbNCPTEySdd7LubV
         k/zud2KDc4sSKyfyTlWroiYn+K+3+F9ASkhYoFiJ2jHW02VQbgXnGCAWqZuOID0O0q35
         pVC53XSsDhjKLbIG/X2QYec/SAEhtl9/k3Bz9GwxT577eJppxhRsPxXbBlNovHuJPSxM
         pSEcTJ/iIl3tWlJyQ1lcTbIi9hxNqPE9eO9l46x8fKpR62vDWOmdxxt/fJogABY+B+yo
         vhIyL/zzztodKBxSWubTWEZhFUr80gxs3cSEV60vJkPSrG7G1utu46lpffxPRkgEBEbD
         l2sA==
X-Forwarded-Encrypted: i=1; AJvYcCVfnfCGLed6PEaVSd9xOUXkIop3jFL7DBQra8812ypduQw1n8BXcEJiZIMk6cWlFq0Kvix7rOB9jrH4Uk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhHDG/zr8Pm3Q304PEtThac6JlmPclO0JXLZ7k0vYf3nMJYDzT
	jO9Mr3LznX7UYJRR2XfTg6ikZG8LHxeh9lLrO9qrr0dlMLjR5992sAyZ6QYWGRLPeWdFTNa8Uq7
	5y40=
X-Gm-Gg: ASbGnctGYk7wKRyGM6uoyBiYonbiiDrVLVu5dGOqnEWou4vh8w01jwkhukwi6jdTAyf
	1PHh7xp8GJAMd6gWmTCNXfs6nlO0rilQ4atYXWqpD65T6CZMMymA/RhxnrQ8HHTO9YYEjzm1zrd
	+3A6mJwXIq5WULqkeDqhEfe2Q8zflCA0EO2+OgvTED2PYvRF1ScSGO2NCUAZV4Zc8kA8YZdEY67
	YHxz9zP9txxdT6RDD+xcme/YShNAcIoADR6Bjpo2w2OFPQI+4dAYIA/dc6To/CVvbgmHfNdjlNc
	dHH16XleX3sON+JlD2FaTwMbipPp0/GKm6GN3gPX+Zb5ENwCxeKGSg26pJH9AM4qMQ==
X-Google-Smtp-Source: AGHT+IFg7Km7kBL9tH9vcEh41bVtlUZ78ftQ0V/qO2uoInqYGQexoEV8lvGyd/gT9bodp+1FtOcNwQ==
X-Received: by 2002:a17:907:c48c:b0:ab7:b424:dd11 with SMTP id a640c23a62f3a-ab7b424e60emr323426066b.16.1739122822537;
        Sun, 09 Feb 2025 09:40:22 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bb9cc86fsm108486666b.140.2025.02.09.09.40.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 09:40:21 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so1790944a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 09:40:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUg2k3KwD+vEuWwjVxpXAfkpc6FC3It+g7iq+etTWH4xpPZdH2harfQeVOCSg/tObtleai1OBZ8UTYb3UE=@vger.kernel.org
X-Received: by 2002:a05:6402:13c8:b0:5d0:ed71:3ce4 with SMTP id
 4fb4d7f45d1cf-5de44feaa0bmr13224043a12.6.1739122821546; Sun, 09 Feb 2025
 09:40:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209105600.3388-1-david.laight.linux@gmail.com> <20250209105600.3388-2-david.laight.linux@gmail.com>
In-Reply-To: <20250209105600.3388-2-david.laight.linux@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 Feb 2025 09:40:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgu0B+9ZSmXaL6EyYQyDsWRGZv48jRGKJMphpO4bNiu_A@mail.gmail.com>
X-Gm-Features: AWEUYZnVB4u0CE8_NqktnRI7jAQu96wYzkqcCCQdZkJ0CHx-FvrH7mTME3sNsc4
Message-ID: <CAHk-=wgu0B+9ZSmXaL6EyYQyDsWRGZv48jRGKJMphpO4bNiu_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] uaccess: Simplify code pattern for masked user copies
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Feb 2025 at 02:56, David Laight <david.laight.linux@gmail.com> wrote:
>
> Code can then be changed:
> -               if (!user_read_access_begin(from, sizeof(*from)))
> +               if (!masked_user_read_access_begin(&from, sizeof(*from)))
>                         return -EFAULT;

I really dislike the use of "pass pointer to simple variable you are
going to change" interfaces which is why I didn't do it this way.

It's actually one of my least favorite parts of C - and one of the
things that Rust got right - because the whole "error separate from
return value" is such an important thing for graceful error handling.

And it's also why we use error pointers in the kernel: because I
really *hated* all the cases where people were returning separate
errors and results. The kernel error pointer thing may seem obvious
and natural to people now, but it was a fairly big change at the time.

I'd actually much prefer the "goto efault" model that
"unsafe_get/put_user()" uses than passing in the other return value
with a pointer.

I wish we had a good error handling model.

Not the async crap that is exceptions with try/catch (or
setjmp/longjmp - the horror). Just nice synchronous error handling
that doesn't require the whole "hide return value as a in-out
argument".

I know people think 'goto' and labels are bad. But I seriously think
they are better and more legible constructs than the 'return value in
arguments'.

Yes, you can make spaghetti code with goto and labels. But 'return
value in arguments' is worse, because it makes the *data flow* harder
to see.

          Linus
