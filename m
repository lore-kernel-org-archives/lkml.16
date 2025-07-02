Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74182DCF76
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751475420; cv=none; b=lIfyvtUQMMPDxUS6C2BLaqFPQyBi54Iibc9RBWJxzOx9ta8fX9FBKM4I9gII1VAHcgIVnwjQ0SVLKADynX/6v4einnIB79S+2iN+aLAzQEjNJix9Ibnasiq2/If2MLFCsYGd7lZqyzbK84M8g8ttBqu2HBJSZJcmyc6Zyx9y75Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751475420; c=relaxed/simple;
	bh=7SlooTOK9TfIj1SqgbI4JXV35XGMr7m8t7eSmUpMnIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2R0QX9Atpgrc5qPchxFNXsUwCY0mVgQy880/OV9cJW6OLkdmRchRpt5DGqchZUMoxInm7inYxGt3O7dwo+UY5IoDakv+Hyo2JBpbFIsuELT72c/3TFSH2nM6vaBxzp/qc05gJwKJMOtLnXKl2OjSFz0FsiHjwV8pohR1b+lSng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=S6EZMjpp; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="S6EZMjpp"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso9009453a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 09:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1751475417; x=1752080217; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e8/uvlPqD4CZgTZ4reU0BZKjR48ea3dcbDn19W3W2ng=;
        b=S6EZMjppOx8COb64LjW6kMLFXRYuTr5V+NvoeUQZGHgiOih5r4JUEFdg0P/oST8ID0
         2mkktuLnb0o7x6Gtrawy8HAYzpMlUb6eP5ztp9mBdmIu/oXv4jb9mXd/b5zhYHF0Fdg+
         P6Zl+ijJd0T+kDulS5ujc39Lf7UM75X9073jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751475417; x=1752080217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8/uvlPqD4CZgTZ4reU0BZKjR48ea3dcbDn19W3W2ng=;
        b=DqIQGaZx1X+kxpDQrQFZK3DSQSZmF+A1rU41eh25FKMDzkdG9/ygqdFMAwwLr3Ni9m
         iSv0/NSJ1dTVHuDUYhbNIv5cZyncAZ6gWlVVcNeOF5IN0W3zDpViWGNxBHDv+oeXDkCE
         6shJZOpFZ7iSCUjjgo4QJeW0TmRyItXkLCl6BhCnH4wXl9awg2t9cfDHkpoB/YHS0fLb
         vwaIwJl+dzYrq8BUarNbeNHXj/Oc5N1kHOqeHiQIUmym7g0j+lk66/OPYaXPzqZd0PnT
         xBWvEVTFATnQpQHvpl6VrquAv9KNtwnDD7xHuAluKWB6AOVR3mTViDCaLh619oswXZI4
         wsHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyJ3Hk9yqcoszCXMvawE+2FNgV0nHSrx5ZjJhOpjYePy+YcUSDptaRDmAuFtK6vvH5sYWyHHVKj1p+0IQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJDf0fzxjtV3U6i4CutbFnNK1jhb8CeBSNqIyZSM6yv0zBlm63
	kbu1IL9PGKkhsknTTtq3HMOh6+rhhdFqG0eIW5R8GJ+7M/61QhbSsWsh1QLfjRcPzDIXmD7bawx
	c63EjL80=
X-Gm-Gg: ASbGncvAUL9rvEdWVnrz+e3huESHlXeGooJoXGALRHfbDhJdKvCYOPRrC4oAaiqepEV
	GnzaZkqeN2AZw5Jse/axSzn0bP500pmAnsW9f3L9EmtXaHQQVC9lNx4YFUFFxAJwzGDVL/wirnJ
	jILhr2N8vLkQkL/Co1Nv5njcdJ5pF5WrS7mfEc3vKNI/XhEgK+B8/eSqe/crBZFu3wI1dBDVbzB
	3+ElOZ3aoq+fhusZpODCR8zCsHYtn99vcikWT4gO+qFQ7onGrvz8sZcAsHV9hzecCFVWqojF1k7
	cDYE1O6sde/vLTr+C6Wb5bQmJhAKqM+aBhk/OOBwdn2iGzTaq73vNrm3RwY73w4NJjPQrwi6OQh
	uvsBMs39zp5QolWGNFQsY6PapZYnEP8DCMmY2
X-Google-Smtp-Source: AGHT+IHQKXZQ04s/OO8DmPI8I4MFd6xK+DEHv/dOP79UBBLiQyIi4Ev9V91V9bcktoT2HrZzsBU5kQ==
X-Received: by 2002:a05:6402:b6e:b0:608:3f9c:c69d with SMTP id 4fb4d7f45d1cf-60e5350016dmr2518575a12.33.1751475417147;
        Wed, 02 Jul 2025 09:56:57 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828de500sm9448082a12.18.2025.07.02.09.56.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 09:56:57 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so8253163a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 09:56:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5s+2/kAg+FzDKqkMHxnDPNFTMDqnWmQWZnOJ20xphxnarOjjjEFAlFjd3giD7aTx1+s6OqTS0PilFU5U=@vger.kernel.org
X-Received: by 2002:a05:6402:3550:b0:609:aa85:8d78 with SMTP id
 4fb4d7f45d1cf-60e52cc4800mr3206129a12.8.1751475416392; Wed, 02 Jul 2025
 09:56:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701005321.942306427@goodmis.org> <20250701005451.571473750@goodmis.org>
 <20250702163609.GR1613200@noisy.programming.kicks-ass.net> <20250702124216.4668826a@batman.local.home>
In-Reply-To: <20250702124216.4668826a@batman.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Jul 2025 09:56:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiXjrvif6ZdunRV3OT0YTrY=5Oiw1xU_F1L93iGLGUdhQ@mail.gmail.com>
X-Gm-Features: Ac12FXw4HRUmsY26ZzTIlgUFVvvKfSBHwdgpc89cjL9awvQELp5EmXGzK0yXAsM
Message-ID: <CAHk-=wiXjrvif6ZdunRV3OT0YTrY=5Oiw1xU_F1L93iGLGUdhQ@mail.gmail.com>
Subject: Re: [PATCH v12 06/14] unwind_user/deferred: Add deferred unwinding interface
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, x86@kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrii Nakryiko <andrii@kernel.org>, Indu Bhagat <indu.bhagat@oracle.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, Beau Belgrave <beaub@linux.microsoft.com>, 
	Jens Remus <jremus@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jens Axboe <axboe@kernel.dk>, Florian Weimer <fweimer@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Jul 2025 at 09:42, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> As the timestamp is likely not going to be as useful as it is with
> Microsoft as there's no guarantee that the timestamp counter used is
> the same as the timestamp used by the tracer asking for this, the cookie
> approach may indeed be better.

I think having just a percpu counter is probably the safest thing to
do, since the main reason just seems to be "correlate with the user
event". Using some kind of "real time" for correlation purposes seems
like a bad idea from any portability standpoint, considering just how
many broken timers we've seen across pretty much every architecture
out there.

Also, does it actually have to be entirely unique? IOW, a 32-bit
counter (or even less) might be sufficient if there's some guarantee
that processing happens before the counter wraps around? Again - for
correlation purposes, just *how* many outstanding events can you have
that aren't ordered by other things too?

I'm sure people want to also get some kind of rough time idea, but
don't most perf events have them simply because people want time
information for _informatioal_ reasons, rather than to correlate two
events?

               Linus
