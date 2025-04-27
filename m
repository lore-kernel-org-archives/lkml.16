Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF07C18FDAB
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 16:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745772020; cv=none; b=lUsN2Lk8ha3Tz5PQcCz/1kwqMk1kIim1QrxBkfW1d3DrsHnb/n0YcnW6aGWYbgcOdxJQ/drdumFVvJwYZsIy54UFhOUxTk53iylQL2Xd7ijY7au3WVzGXgBIC1PYfU9mpSMk1hYORNWom5kFaaAFrk7p5U5hBu9GsVe7dduXuHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745772020; c=relaxed/simple;
	bh=LM90r3Y+weh/nc9Q6Rt2jDo/M8Djn5nVOIsjqVwCqAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qyTIseiVd0eX/tYwt9ucWkvJgZe1+CMEUSwR8UWqQer0ymaDULTY4ZMf6J3rQ/Lroyz1lzMfYJpht5itapygcFqN0tUbikhNzr2gTn2UwVP4zKJqIyic5Wo+skvinefQFvtHZW0fS+3V9+qHi2vIprZ/d1pZvMwsAMxxU0sWVuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Rm9SzHVZ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Rm9SzHVZ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so6050444a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745772015; x=1746376815; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Hd4NWPkkSFF9D2y+FVFKzC83gG6cCjw8U9KM82KHYk=;
        b=Rm9SzHVZRMvs954CpNQxManKX5Qli++eFBzlMG/MJmu38pcbNPhkoPFuCpdyDeJnDc
         RI0ODNxz+oyvGnOj+KqdPckADrKNlkzwh73YEoQtH2K6UzZtA1BKlSwAHRzD2hpo7QbW
         MzcTUQSw1RoJgAf0voxhouLIgJwGRwAhmzhPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745772015; x=1746376815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Hd4NWPkkSFF9D2y+FVFKzC83gG6cCjw8U9KM82KHYk=;
        b=fdiEKunQDFa1EKFQuqBxEA58RKcuQqYLceAuGApKFGLs8qjWbMcfRDJcDx/iq6fdmu
         7US6r3Q/wbQC6B08FxiFc8ziop+X0AgjWArOQFlZTlfOWJC/oD6F7JI6FDwYB/8BVnJm
         L7nfbeOON8bVX4yG849mZp0xDj8NOxjo7OEpVvYntQcFO8EeIkWiQh2nxmi/U/6UOkEH
         bqtUbjjERZTvRVmlT2Rf18TCaJEAVKAc9i8XSe+b/QFjCZC05fDyhqQ0//b+IAKJRpFT
         I9M2P56xXkhLqJGxLbY6+OhJ+PedCBC8tQf8Zx5or67PhwINDQF3FFMc4hrEfwiDoWIe
         oS3g==
X-Forwarded-Encrypted: i=1; AJvYcCUsNRhw2JaKVtRuDdzF2a6dDdX1kqrhQSrT805L0xv+v+uunkf9/cWkqV9BL5TgvTrNlCBtpO53eJY1+4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbuVtZC1vYOvTfw45vMgatdYPaIGvsPKBvFqPrSxKqV9Pb18bb
	Yu8S4HynqKvg6OlO8hfZ9/z7m29QmjC0oDvQ/yVsWUmHO7vh6zan2rbDA2k50KAKa+qapVf9doZ
	HhiDByQ==
X-Gm-Gg: ASbGncvhLwps8UqAnjv1z/IeN5eUlafyVf4B9pAy5oDZNqXSdh/b/8KbNA9qOJQQMd/
	ibsRpacEXQS4sx0w6x6JjbhVhkszTgvglN3K7D7qb3iVEIjJgeVYhCXtgXhnrR+UG/7wekqJOva
	V8yPGgZuTljJOSmwNFzOObiTa77+K2ughAet4wuMBz+vBjFBrbzaSlfzE0ByLZRB+gA2GcNRNJA
	Er84P/6BxT7WGt/+Y4GyaVjdxqVf4YP0F3YNUltWzXh+q/lwNMs9Gsm5aciemyUDwpEJWZxTtTY
	ORtT+hTqXwjFH1GabwXH1XHldg6bSReATtALoZfvdoLvZro07VQ7mKoq6rxBbEUbxAYu4cqv07C
	RQ0gYxccat2BArWqHn/18Y1Io/A==
X-Google-Smtp-Source: AGHT+IFdAvHqsYTMtG+JSYHAeVApRMWZGdLiK96ipIU3RFnjQZskmre2aUy7KdleWgWOAcGiMV4Olw==
X-Received: by 2002:a17:907:3f93:b0:aca:d5a1:c324 with SMTP id a640c23a62f3a-ace8460ce1dmr574621866b.0.1745772015003;
        Sun, 27 Apr 2025 09:40:15 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecfa375sm468034366b.121.2025.04.27.09.40.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 09:40:13 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acb5ec407b1so652348866b.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:40:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzXlxCCZYAEDTXmdNqLsZ8j6rWr7YQb80eDFo3L9WMIFHHsMITQx4KJcJAQ5OOZvY7VDO21d/w7ywaoGM=@vger.kernel.org
X-Received: by 2002:a17:907:7289:b0:ace:68ad:b4d8 with SMTP id
 a640c23a62f3a-ace84a8a378mr574294566b.38.1745772012656; Sun, 27 Apr 2025
 09:40:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202504211553.3ba9400-lkp@intel.com> <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com>
 <aAmeJmL0hUx2kcXC@xsang-OptiPlex-9020> <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com>
 <aA3FL6e1HVAw1J+w@xsang-OptiPlex-9020>
In-Reply-To: <aA3FL6e1HVAw1J+w@xsang-OptiPlex-9020>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 27 Apr 2025 09:39:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgxD6DPv1H_uZX4MVB5GvFyGduzMFu2qAeb5dBrE=nHog@mail.gmail.com>
X-Gm-Features: ATxdqUHYNNA1LWbBxds3-1LXU1tMS9D3fS1ZRHo9f0oi5JK0wmvgdfrwhCsVAck
Message-ID: <CAHk-=wgxD6DPv1H_uZX4MVB5GvFyGduzMFu2qAeb5dBrE=nHog@mail.gmail.com>
Subject: Re: [linus:master] [x86/cpu] f388f60ca9: BUG:soft_lockup-CPU##stuck_for#s![swapper:#]
To: Oliver Sang <oliver.sang@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, oe-lkp@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>, John Stultz <jstultz@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Apr 2025 at 22:49, Oliver Sang <oliver.sang@intel.com> wrote:
>
> We reran the tests. if only enable X86_TSC, the various issues still
> exists. if only enable X86_CMPXCHG64, various issues gone.

Well, that's unexpected. I really didn't expect X86_CMPXCHG64 to make
any difference, since we should still use the cmpxchg64 instruction,
just with the alternative re-writing instead of directly.

Thanks for re-running the tests.

All the non-cmpxchg64 code sequences get replaced by the cmpxchg64
ones dynamically, so it all shouldn't matter one whit.

Except for during early boot. Because we do default to the old i386
sequences all the way *until* we do the alternatives replacement with
the good cmpxchg64 ones.

It does change code generation, in that we have to have that
alternative which now can be a call, so it's not a complete no-op, but
I'm still surprised.

And except for not using CMPXCHG_LOCKREF at all, but that should be
just a performance thing, and not noticeable during boot.

Hmm...

I'd love to understand why X86_CMPXCHG64 apparently matters, but I
can't convince myself that it's worth really pursuing.

            Linus
