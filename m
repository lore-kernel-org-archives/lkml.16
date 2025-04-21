Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B9C1D5154
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 04:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745210023; cv=none; b=TazJ6j0IMQG+AlhiPmCQqjhPLOGhx73zEQ640YMnZB7ANrJf+SEryvAw0FwLnwAQQUXV0E4eyhg+ovvZQS7tqz8hFf4EqPaYqdTgYb14+CiCsPuxah8i1e25FY92ysLGdYCJfSHjpd1pKHON4c47abhCkFvbMwodzX1TVFIlhww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745210023; c=relaxed/simple;
	bh=JN8iby6an3mfDwdowPn91zamLY1xRGg6bBMjYkZ0DIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIR0mkctBbPw2mvZS/rWqe3h6/BD92Bq2HmFlDIAUuOPL3V6BIHomxuouQyMByRXwtcSiHeRbqLKEwi2ZyLQE/MTfwP8MbKokCLtP6kwUmDHKLPY40eaHIG8zoIUpVqovjRLWHJPNCI7c+nvi6wg5JCnHX74mv7Uufcj5CrE+Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=C2kGt9rL; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C2kGt9rL"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so5096536a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 21:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745210019; x=1745814819; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lVqDWiNRjRqlUA4pP3gMK9BF373U1wIAPXz+PfM0geY=;
        b=C2kGt9rL9pX1ULJ11cpH0T7/gxViYTqYtTySfhw1XAGkpe95yCMdVfNaKKd7wxBiBm
         6gtTKYwJv/PpYn3EpZ5MypA0BVqzCua8xqlEJkNd80qtDUrYUsjhsX4ixmPGB7SK4VzI
         qR++JnR4xbevazzaWd/b8l2svTh51Q9G0YOlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745210019; x=1745814819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVqDWiNRjRqlUA4pP3gMK9BF373U1wIAPXz+PfM0geY=;
        b=WfIiIWIeTrGDDm168Ycjfg9t789s81mFupjuPWaSgDfewi9HGHaFr6lVeo6eeFf3rL
         PcUHyKDIxInArRILlIly+XqRKmNee0F+vFGWD06K3Ve7uFqcG2xFC8kqrSbFcbwzjlJl
         6u0RgF4tRC22g3wSpKB9z23S7bluK0LfBtLCWgFergZXmaMcXmw0No02Cardhrcm2mVe
         GJVp89yqPdssmzysEW/+UOQfCjL9DjnMA8aE2YH5J7+VZQi+cOBa69GQE4ow/CM8RUV/
         f+Y7oJnp5oQrlBOc6pHUqXGKk/hU1MnjccYBjM/Q4jwpGcrdgSKWrl67Hijz+oOQvN44
         Xz5g==
X-Forwarded-Encrypted: i=1; AJvYcCWm+aQ6qb3qAMsNknm4jWOfIiUwJPM9jlnEXbYt9G8S3L5Ob6f1zLlbesYPGBU6d5bEOlSqDnsYmiATaAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCtodTAeD7Ee4mTxGXAiKUDxQfyF5RQOjjMUjq11QD9KDM0w4y
	p8YnLZhaZLXKnQCsvCD5kBiAoZb9HmWSINColT25LcfmTxoj2Hsg4C6GkvTiVxjn33i0H4beBZS
	ePRI=
X-Gm-Gg: ASbGnctilFUzLa99UogN071NehT5FiC6p6oRUsFCuKYSjk6RDGU+PPm9rb5RiROWcP+
	oz+Twnqh9i//tDbkT3bC297Xdi+kG5iYJgAJwskRL8S3dlXD2UvbqCNV0tMH0HfadjDsQifAqBb
	CpKDliDRB77YH5RIrOGZgnZk6V4wEQREKCAzhlMZ/lCf9DLsgaUEo/4vAWVLzS4xTJedDuw8iq9
	F8iA31UNDAqA0hNvwE/bWBeJzZganSbfGPv8/FAlfeNhATx45ujm6CyG+/8VL0N8NUJhu8j1wBq
	0X0Wcy239Da/Rrg3RpXEsteAyzTd3gscK+oYhXH8EdnHgxU7KLhqW/RXAxLBhs/qzu/dvbHIyqu
	ScW7Mye1N9eN6Hio=
X-Google-Smtp-Source: AGHT+IErxcfssrRh6LgO/wfG2ELSVkHBoi8HN3SVvBbZwFe8MEhBXp14kPbobJMAteVCBLhUiA/N8g==
X-Received: by 2002:a05:6402:2347:b0:5f6:25d6:71dd with SMTP id 4fb4d7f45d1cf-5f627c16862mr8715241a12.0.1745210018854;
        Sun, 20 Apr 2025 21:33:38 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6255955bfsm4092544a12.44.2025.04.20.21.33.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 21:33:37 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so512135966b.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 21:33:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1efZluxNUeWWqHKEKsYL5jV9Eu7U2RzXMZdd+olqnb+95LxLO5EvfXSO0q4ctlHyatzaMdJtT5UrASxc=@vger.kernel.org
X-Received: by 2002:a17:907:1c14:b0:aca:95e7:9977 with SMTP id
 a640c23a62f3a-acb74b508b5mr953823166b.28.1745210016471; Sun, 20 Apr 2025
 21:33:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4f941c51-784a-4f10-8df5-6bd103d1d80e@roeck-us.net> <202504201840.3C1F04B09@keescook>
In-Reply-To: <202504201840.3C1F04B09@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 20 Apr 2025 21:33:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=whryuuKnd_5w6169EjfRr_f+t5BRmKt+qfjALFzfKQNvQ@mail.gmail.com>
X-Gm-Features: ATxdqUGGqXh-vFivnudAlmvqx6H6i8OFi9l4FYYx5jTgGwSOGb4QhTZQHzEtAbE
Message-ID: <CAHk-=whryuuKnd_5w6169EjfRr_f+t5BRmKt+qfjALFzfKQNvQ@mail.gmail.com>
Subject: Re: [PATCH] gcc-15: acpi: sprinkle random '__nonstring' crumbles around
To: Kees Cook <kees@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Apr 2025 at 18:52, Kees Cook <kees@kernel.org> wrote:
>
> Can you please revert this mess and use what has already been planned
> for this warning? It is, once again, really frustrating when you update
> to unreleased compiler versions. :(

Ehh. Kees, that's the compiler in F42.

Really. It's not some "unreleased compiler version".

It's the main compiler in one of the biggest Linux distributions, out now.

Why do you think I made the change? Because the kernel DID NOT BUILD
without those changes.

So no. This was not some kind of "solved problem". Quite the reverse.

         Linus
