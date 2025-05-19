Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0AE27876C
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747658142; cv=none; b=ure9e0PYR6jPfTfJiVuRbwZcdMhL4StdOsaJLmwbn9+fphLaDg2h15laYxiYXGKdQEDF4Q0EhKguPSF5vHCNcbGYnSu1g1VjF5PFj5/g0ugrMzx3MgHQG7WQVLlE/g7Nmz7f8OuDxnXxGuGdhR6U3Eep68SZwtTtcQVrsMqIDAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747658142; c=relaxed/simple;
	bh=h/jHKw3kD1UoLZdhvu9N8CX7eVHnHrwSEacWRDnO27c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8Odub9/cETl9OzRGASHofEdvoaQ/NIOkfBQCaGGCzMjGL/JGVzvI/Dgvg47lcKHQ+d37E5w1g1AeVdD5Z2WRvhSDSB58XBYSsvG3tHcGtZ4zgRTDa0cGcu4kkKnG6GJWuItQ+t7CiK1CnF2lnTt3fs5ncb1UEk45nt9/gXFXuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QWZAF9mz; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWZAF9mz"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad1b94382b8so796667766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 05:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747658139; x=1748262939; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jaqnelmhXDMJ9MVU43vitj0wc6YSbcEgfnfp1MR4UNk=;
        b=QWZAF9mz6/OFydTa06zC4q6DYcEoelDrhUQqn2IYfcypSTiQYP6MURflYZNa9ZpyH+
         xkqC52LDP+7+tifGMw7LyeYOMvmNaJTIEtn7LFeWSXwFbljSaxP9vExt3we0hvbIJ6KT
         klp24sA2wC7+RGAm+7nAztxOe5Mz6pYnH97yjW3op/bEEbm6VcR25GsaxTOgw4hqigs8
         FxQCtneal0T3eoK8iUhmBYDijvIQALlwJcyqceNMZrQSDHeGspk3ZA0vM61SBBeb6AyX
         e3IdJmfvOWj0dT+71OXoOfB3mbetYoO7iCDQhJgTRuX6liUXMEIseT42Xf7H2RXV/Wj+
         ijwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747658139; x=1748262939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jaqnelmhXDMJ9MVU43vitj0wc6YSbcEgfnfp1MR4UNk=;
        b=WOl0z5mwVCBecSl2IlZ8300+8CY8igwPxMJWdtfVTdI0e+Fm5R1AJEv7nHVU+cOrPi
         CEJGklw2zGj8nrTVF8Xy+hgZWo44foEiA9uaV9PIjg4dd8AVjFmtcinVBhNpvSrj6v+E
         8ik5HNJzKAU2kJ80TWKVB270kDh523IVKQjo27/g9XHlFQL2mZovqyWInQxlQojAlI5C
         lTKWmgM+KzJ3wY0tJCgT8+mVZg8JaIlyrTuz3RY+f0mvY8MHiLqGFQ4D54s7ZH9ySx/e
         iLGGL1V92ontp/c9LErP4A3fRQaxiGuCYI2UAxwLdWqFZlb6EZfP4SzPmdkYUjKHeZZ7
         EMyw==
X-Forwarded-Encrypted: i=1; AJvYcCW+1rO2VTscf2NdXSLFUO/LQdNZakIfKQv9KcPryZsYCBqnv4f+wuG6qdkBjM0rTa7xC+LEhdoZOQrWtfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YybFT6jPChMMmFN28gyLFVJLbSLJpomjZOeHA2jFeM7kfs7btRf
	/Cyg3D6DhGRUDZhC1mYcdmBaI10bAIJNQRD59SiHTA5Jee6lOcC+xTKIK+FIC3SBK6WVgiqZMU/
	rRbCFyuv1niflHmyEgYmT51pyT1ARzdHgvdKf920uMQ==
X-Gm-Gg: ASbGncuSCWfaA+kqCwrg0BeTXZZfuRMAWktrsTpDgM+3Y1b0f8FssjoFmdmHfwk6D0L
	8qDNK83z2rAIyG0MnZaG+qCL7oUxIzzrbWwJlhc9J4OE90Vc0dbe36LKRNxLGX/ZcOTRM6RLhZn
	LsaS7EBkfFrfVL1kz2npFHZnm6wvDBOjEn3TOFEqQjgc3BUhYf/Az5fqhG3Wuk0w==
X-Google-Smtp-Source: AGHT+IF4eIqhtrc+6I57JtzN8T69+0a5kBByXRsTt5Vgm1fGY3uwK3UwQBXHYFy3TDCpoGVeZtntfDbE3hCBM0igRZg=
X-Received: by 2002:a17:907:60d6:b0:ad5:211e:8cff with SMTP id
 a640c23a62f3a-ad52d5ba7b7mr1057424266b.37.1747658139023; Mon, 19 May 2025
 05:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519092540.3932826-1-limingming3@lixiang.com> <20250519093857.GC24938@noisy.programming.kicks-ass.net>
In-Reply-To: <20250519093857.GC24938@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 19 May 2025 14:35:26 +0200
X-Gm-Features: AX0GCFtwAPx-On4jvEu1RgfjZ7x8W6B4v1YRjdYURF1h2r811b2tPgdoSKyBZn0
Message-ID: <CAKfTPtB-fjPH+=EBbeZvvWvOdbecVJvPzmNB2sQrAM4H0gL8Dw@mail.gmail.com>
Subject: Re: [PATCH] sched/eevdf: avoid pick_eevdf() returns NULL
To: Peter Zijlstra <peterz@infradead.org>
Cc: limingming3 <limingming890315@gmail.com>, mingo@redhat.com, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, limingming3@lixiang.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 May 2025 at 11:39, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, May 19, 2025 at 05:25:39PM +0800, limingming3 wrote:
> > pick_eevdf() may return NULL, which would triggers NULL pointer
> > dereference and crash when best and curr are both NULL.
> >
> > There are two cases when curr would be NULL:
> >       1) curr is NULL when enter pick_eevdf
> >       2) we set it to NUll when curr is not on_rq or eligible.
> >
> > And when we went to the best = curr flow, the se should never be NULL,
> > So when best and curr are both NULL, we'd better set best = se to avoid
> > return NULL.
> >
> > Below crash is what I encounter very low probability on our server and
> > I have not reproduce it, and I also found other people feedback some
> > similar crash on lore. So believe the issue is really exit.
>
> If you've found those emails, you'll also have found me telling them
> this is the wrong fix.
>
> This (returning NULL) can only happen when the internal state is
> broken. Ignoring the NULL will then hide the actual problem.
>
> Can you reproduce on the latest kernels?, 6.1 is so old I don't even
> remember what's in there.

Wasn't eevdf merhged in v6.6 ?
