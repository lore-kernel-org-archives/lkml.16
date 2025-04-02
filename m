Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE621F03CA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743616021; cv=none; b=BMkex0bOtsKGNH6Xb0ydZ+v/4JM3AMGbjleRMrXb61/Cg+0NBwLJ0d4MFyjvfhfvR8NlI7F2tmnhLSnlnXFthwMjo65FR0TdPqe8OMgNmMc64GgADWiKKQN0IN7Myk+pI+Ua11aBdencuEvJasvPrtEwQltqdbyEAeCKZf8caRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743616021; c=relaxed/simple;
	bh=EOlZcnFOrqCflQFwOYTy+1h7jZlZEe2uY8Lc98YJXQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tjeS0KQWrjin4eqL2U/km18/gG+wEfL/9+dd1aMx2Jk2LxuJfdJtPZyGNAMyj2R6Iu1ZvnZTWyrcWmmmUVpWOpxASpm5O++96UyatRuAuCTTU0LvyfXU0LDfVTUUkkCKEUVMyjBtlOMylFXLWfrmHrxj87B4g0y+hwHZxXvKJ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iGeuX9i8; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iGeuX9i8"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso178954a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743616017; x=1744220817; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xorHSeXHZOAo+fDlPKYms7iJ4xhfFELkMJgrAoSH+BU=;
        b=iGeuX9i8A5GO+tyZhqym/5POB6RZ/hU3tBxXHU0f1J3BYeqvd7eVsYybr05+56bh3M
         6esQBHs4AOsdoBrCNjkCU6R4RrNUzqcdLlOOU33NBhDLnOGZUO5A+6kmyWGBPJRrW6mL
         ngB7obD9Fn6A1XiKjT3d8nQAB7c5CwziHPFro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743616017; x=1744220817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xorHSeXHZOAo+fDlPKYms7iJ4xhfFELkMJgrAoSH+BU=;
        b=Xuge8glGwu8uay8I1v5WXu/55F1/BfHBINWyuaTGnliba6qogQhAjjVH39ZEQYOD3F
         edlHDHluQgc2t4TEYvPibDL+Ngo+oFrJfzpzYET1xqwsBHeU9ro5RYq8481femZxdvDU
         9FeuXYh28XMFoUMe4NqNW9ySfuHUcxhieK9EK9c14JoAajx/1EUEnqMbhhg+BB7oLHWO
         /Cky3kUKvAADcuMhEzS9QTSesY4gbZYR3goSTBHgKqn/Mgr+S8YDJHY8uHgSYfGPW+5F
         YzyovNXrwMLYVEK23UjWBgK0LuIzN5Ie66EnBaSZR+4BZgqhFSS4N/lrBsqSUn6yIGZ3
         VP1A==
X-Gm-Message-State: AOJu0YxjS1j6dDJBIvX4glD0XjBUHcZEks9615pODGsI0AKr3wjqWr/9
	Ej7kIKlmKC5pe9OCMJN9HW9idZR3JtgDz/HFDHVA7lnd+kl48GdQFrF3oxri3ddx78UIJtBldJV
	Dd2A=
X-Gm-Gg: ASbGnctTUoKxPSnKVhD0ZAhjKagA7dzpmlKT3CLCygiY8fKesooDEVB6h/g4bfhooOp
	hH0SYlWqfivijishiW1Yck14ja4CQLjwdr/DafvVoW8q7m5SXDRTbxu0Vp6fn9vCfbzG6LrXwRv
	wJN5zGjMw3a5Kdf63PY3Chu1OU9ROgbmSpuWFbxcl6kDLkxr/ULYHn4rYNzW0ThI5np53FNjx6P
	CKLUx6Ed4lzN4LHJIqon0QIscK21tqIPeuryH360ySx3MOKipDUbE+R6mmUxLMib/e8g+xP/hsC
	G/GOxlHJA5aZavhbV/dhwwjvnRw6VjCSPwfDasac3UgWdkvdwjbPk90sWpkSH77uxB3KRM/auia
	9RI+fsYxXg8nYlWtTTZTLx33u3tpsTQ==
X-Google-Smtp-Source: AGHT+IHGn+BF0j8rwQeuYN2LSfPqTGn4tvp+Mewc3w9PiI4CALVOiiLo+GNhnsV9yE0qeBS3h/aDbw==
X-Received: by 2002:a05:6402:4310:b0:5e0:8c55:536 with SMTP id 4fb4d7f45d1cf-5edfcbd2529mr16290720a12.4.1743616017414;
        Wed, 02 Apr 2025 10:46:57 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16ef7a7sm9006500a12.36.2025.04.02.10.46.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 10:46:55 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so4024566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:46:55 -0700 (PDT)
X-Received: by 2002:a17:907:7f87:b0:ac3:f0b7:6ad3 with SMTP id
 a640c23a62f3a-ac738c1b69fmr1516270266b.40.1743616015142; Wed, 02 Apr 2025
 10:46:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401225811.008143218@goodmis.org> <20250401225842.597899085@goodmis.org>
 <CAHk-=wifCDa6FfRKzeioYuEqJFTeXnYQ1DpeuYsmmn59NWuakQ@mail.gmail.com>
 <20250402125548.02cc57d0@gandalf.local.home> <20250402130337.5de5a8cf@gandalf.local.home>
 <20250402131431.218d3458@gandalf.local.home> <CAHk-=wh8=QAC0jjcjDRnmsmd2xDf97j8h25=aSFGeh9x+1X8UA@mail.gmail.com>
 <20250402134030.26a9b141@gandalf.local.home>
In-Reply-To: <20250402134030.26a9b141@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 10:46:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjAW=WHnmP3+B8dF_U91FEzkesUW0JPGMsip2CJ9e0hgw@mail.gmail.com>
X-Gm-Features: AQ5f1JpSafEjStqfGbLJ11HrwQUxXblIlVdAsWMZyIwfr8HJB2qb6iMxdcPchKA
Message-ID: <CAHk-=wjAW=WHnmP3+B8dF_U91FEzkesUW0JPGMsip2CJ9e0hgw@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] tracing: Use vmap_page_range() to map memmap ring buffer
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vincent Donnefort <vdonnefort@google.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 10:39, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> This has nothing to do with admins. This would only occur if the kernel
> itself created a buffer from some random physical address and then tried to
> mmap it to user space (which would be a bug).

Do *not* try to check for bugs like that with virt_addr_valid().

It literally snakes debugging harder.

You're much better off getting an oops,. and then you have stack
traces, distro bug trackers, and various other automated tools that
give you information.

Trying to "validate" buggy data is crazy. It's absolutely the opposite
of safety. It's going to cause more bugs, it's going to only work for
the validation scenarios you thought about, and it's going to make it
harder to debug the cases it actually catches.

And if you are trying to catch kernel bugs, *any* data could be that
buggy data. So the whole concept is insane.

Yes, you could make every single line be a "WARN_ON()" with some
random check for the particular data you are using.

Or you could just write good solid code that is actually readable and
maintainable, and doesn't have random pointless checks in it.

          Linus
