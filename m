Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCC52BE64A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 20:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751576321; cv=none; b=AZiCb4pcEZE+8zyvo9Jbl53Pa/v6KAaHMbCN3cLbWVxNjr4Dmbjacy7sf5r9LqKYAee5kI7lBaJWFSI/xrvz0O6bG6b8y0cEs5/ls/r9hlyj4iiyPNCzwYPTur2GkC3IGRx7qreqpk/rD07AkIsgkjU+y1rjSR9lIH6iW8SmDWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751576321; c=relaxed/simple;
	bh=DiJjAsxd3NLx6OvlELv3sKg3BSU/dtVOQuiuh5Nz4Ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eikIsDkVWJwbiMjvdyk6fU4aKQoVwrerEM43Sd8KsvZf4dlo+85/uvh8zBQMxyORCpQi7HC1wWvtslluRoq1Qx0y68SU41hS5cmkBKuw+QD8TwfV+W1ClbVqveJtZEY42HVf2Y7YxodmBJmU9NkIKtkaJzGWeEDQUNZj9yBJqeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AVzQ77Im; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AVzQ77Im"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae3b336e936so55924666b.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 13:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1751576315; x=1752181115; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XpibsVHxYqxJwhE/Mgkya5GxIWQIBQtSRQMl/dLvVIY=;
        b=AVzQ77Imqo9REfO/kKiLsqagdUITM63fRGqXnI52YTKLrX9TsV5V98i2s/XRl1vJHZ
         Ntxm0yd/MnaDmGZYWrxy/AuWeKbuN0Ulz1h35PLPS/eZMyMzA9UMYJivB64P0vxxJdGi
         ZJ0YCk6TMhCZiXr93SpB4yhtfxODcyRFrvqWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751576315; x=1752181115;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpibsVHxYqxJwhE/Mgkya5GxIWQIBQtSRQMl/dLvVIY=;
        b=dfkY0PZ8LK5Pxj9E+YfNffSMkiHQQ5jQon7VNSfFGZxneY8KOA8QEyBZQOx8PS6Qfd
         qQgXDbq7dnfAni7kz2ANn5ep7Rx5UC68TzA2mbrAquJgx2z+ZYSt+EuZjdyD5/m7glQ7
         Kgewx999QTSYckicqHNE7axJ+fjlCRXf71OME0/ABm5j+3v6n/LsFzG5TEQKW2YL+2c7
         /OAVX43oGzfmWBA64aZBgn020NdhnayMEDG94YtnoWCmbC21F8uw1P/XQrZo8O+b44y6
         2iYfqkXI2CIvHoKSlO2/abURluIWF/SWEnqDSf8XpHHjtC1ndf1EkcotseLVWIuCXWoR
         EewA==
X-Gm-Message-State: AOJu0YxFzFBQJyOKs84xvOzVSUQSkTUtdUyCJrrfqjvztHnKo9W5rRjF
	tWhncx7UYmqJLGOwnSha2TqyWTZ4k9Ec0m1kSvMQDLC0ocpiw+2bjCwQD3vgZ1N1+79o+JoHhrp
	CpVYsXOE=
X-Gm-Gg: ASbGncuCJea8jZM2oCjz8UvAsEPfo+St7gor2oOWKhQM0pkW3FstyboWnr+rJqTdp/b
	swfmR60NtMdpwvAVLgS1NM9Ug/GXWyf4hedfPUhatCwCTvc3zfadBhbY5TNrgxRWVarzSa/q8jN
	BEdT6d/2ucq7mw0I6Sftb64mIs0TxYxGN1JdYlT0cwJrjPxCn3NnuLlRfUhs9ndc/9IKsPbh9Iv
	sxhRmxF+6DmafhCF7QrxThqE2rGFoz/UB42qKFQ2htC4Ie+R1emijjUICgcAavTT0r//TxW0RME
	WpuRRRn77hhQ8pvUwn2ZcQPQlcLBqRYQw6THjPx8cOmyQscZaBAwKmA0u0qODdK9+k9aEV8QX2J
	RQpepC/eslEFrshHquGLJFPGzANPZqHa6GO1n
X-Google-Smtp-Source: AGHT+IEgBVirFugL+eT3cUuk+NJWLmc8tgXjHOC7CjC3s7olunlFCCuWN55orfgOwkSfWlW0B3j74Q==
X-Received: by 2002:a17:907:94cb:b0:ade:44f8:569 with SMTP id a640c23a62f3a-ae3c2c9d41bmr922446766b.42.1751576314555;
        Thu, 03 Jul 2025 13:58:34 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e757sm38739066b.156.2025.07.03.13.58.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 13:58:34 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so442586a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 13:58:33 -0700 (PDT)
X-Received: by 2002:a05:6402:d0b:b0:607:f257:ad1e with SMTP id
 4fb4d7f45d1cf-60fd33621b5mr42848a12.22.1751576313551; Thu, 03 Jul 2025
 13:58:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703115222.2d7c8cd5@batman.local.home> <CAHk-=wjXjq7wJM-xnTCcGCxg2viUcN6JfHBETpvD94HX7HTHFQ@mail.gmail.com>
 <20250703152643.0a4a45fe@gandalf.local.home>
In-Reply-To: <20250703152643.0a4a45fe@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 3 Jul 2025 13:58:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgdM_A1iWs6=y__nDcVq9pZRynd1mO8F9XnAeZuHumHtA@mail.gmail.com>
X-Gm-Features: Ac12FXwYVzSrl3kui7aMRaxe8iQweZ7A051wIMsfyQxmbAoaWneINGskzeXmSE4
Message-ID: <CAHk-=wgdM_A1iWs6=y__nDcVq9pZRynd1mO8F9XnAeZuHumHtA@mail.gmail.com>
Subject: Re: [RFC][PATCH] ftrace: Make DYNAMIC_FTRACE always enabled for
 architectures that support it
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux trace kernel <linux-trace-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, ChenMiao <chenmiao.ku@gmail.com>, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

" part

On Thu, 3 Jul 2025 at 12:26, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> I always thought the "HAVE_" configs was a way for architectures to state
> that it supports something but doesn't necessarily enable it. Whereas the
> not "HAVE_" configs are user selectable.

I don't actually think we have those kinds of rules in practice.

We have very random Kconfig things. A lot of things are "architecture
just selects the feature directly", and the naming is a random
collection of ARCH_HAS_abc, ARCH_USE_abc, ARCH_WANT_abc, HAVE_ARCH_abc
and HAVE_abc.

And those are the patterns that _try_ to be some kind of pattern, and
ignores all the "architecture just selects the feature directly".

Honestly, when we have *five* different syntaxes for "this
architecture supports feature 'abc'", I'd argue that not only isn't
there a standard way, all those different syntax forms are just
confusing.

I get the strong feeling that the reason people have those different
prefixes is literally to just group things together alphabetically -
ie some people use "ARCH_HAS_xyz" just because that way they can put
the "select" statement next to another ARCH_HAS_xyz that they also
maintain.

And then in addition to those various "arch has", we have the
"GENERIC_xyz" Kconfig entries that architectures also select.

I think those GENERIC_xyz Kconfig options may actually have more of a
pattern: that _tends_ to be about "I'm not implementing my own
version, please just pick the generic version". That one is one of our
better patterns, I think.

So the reason I dislike the HAVE_xyz pattern is exactly that there
_isn't_ a pattern. When there are fifteen different patterns, it's not
a pattern at all.

That said, maybe it's better to have one place that has that "if
FUNCTION_TRACER, even if I despise the nonsensical "helper
indirection" just because of the random naming.

              Linus
