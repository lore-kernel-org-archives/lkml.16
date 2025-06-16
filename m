Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA383C2F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750077614; cv=none; b=LYGcKUoZXZIE2zgwq1Z2qbx8UYFQp+G4PaK9fOvFjQci8Bbk2O9pn78pf2gQsWhq9APIY7JkSFTiEskFEblA2+M1wqEcFQAwqveZJH64YoGQp66y0eH5SV0ir+yGl0e+7MVvOoSq5fZyVF3J87K9USj6eV4Jkn3rJm6QzB1/rqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750077614; c=relaxed/simple;
	bh=9QGg5yJeGQKXvILBwKjBKkwTRejMhUwZuga1YYAU7f8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tF9yD3X/ygJctc3lI7/7nVgiXraxjWS8S3ejy8LXMoHxpbtwn+KrGWu7uw83b/p6aDAQfrhlZnagpL1HaVKkKFeQy6U/gWE23KUgSwQj2Rn/738kEMnJrTM6VmYOzwJkWNQITZm3I9gVMnXSx5W317Fiiy/7hf5/szrLoSqVLlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=POjhqEBc; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="POjhqEBc"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ade30256175so871814966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750077611; x=1750682411; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gbd+dXhG09Wd4ENt4bH7myz8gNmQMbD2p4DO0upXrZc=;
        b=POjhqEBcbTTU5ELsxBbw6h/yaon5mWJrJ7MsYeK+rP7PARTIrM0C4Y1wNwdXWr1Mb1
         iYHiwWhDLNl9OXoon4aIEW/ehTcFDEDyFhiN76iApDEW/NPB9Qbto2donKRmcBL8Kwso
         TEqFRexqLJkaaDsH2RWQAOroYOKujd186ZUavQUW0IUdImCZvPdUGvjSMTCrEWa9dBen
         pVGe0Mt4OPg+NEcxglMRBHK32o6DXF/6hPrwrku6BRvhHgMsNLBIPbBBTNGSIX4I0ZWD
         GDBJD7iPCsaFic6aw5mgYdvp0weFkjbtuywBWQaPoAuGeygA8HGpVsi/MM1FEPDK+nIw
         IuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750077611; x=1750682411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gbd+dXhG09Wd4ENt4bH7myz8gNmQMbD2p4DO0upXrZc=;
        b=YkPE5dx0uw3LebRKFTHrziQxaFt+I2MZ3xXAd+QG3ZOR9wx1q1+jqNEericWuRoohi
         r8A91jJmalguPhMJ2ez/ULIu/jETe7sQUu4wVl3e6Vfs0J4L82I8dNrmnMJ6Geu6YbMX
         U38i5bOIxNHphqRBgJatf4zI4TuBVTlVBfFN4fjBEltC82JGnShirzBNlBxFVykPKhJH
         sPCEDUsg0DBFhqSd+pcKKUE4T7gcodNlFLQ88naF9ltJngD5WctJmJhLzVfB9iJhFTUl
         do3Ag5evh3eKiapzKhLsZJwBr9e6a238CTBjZqCo7t1YccajYdVEaxqrZZpUI7nTGHSA
         gPFA==
X-Forwarded-Encrypted: i=1; AJvYcCXVBxmsoxoWKC2TpwxUaScMPvZRCD5soSqBSKoZ55uNwquysXn6og1hQc1+tCTvGXdXSXmzZ/qg9ydvasc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKB2IiZOxu9AFpK5j1XcGhAa1wBf7h4KvwqIFrnmHGv+q/W2US
	Wnliv2URneiFA9kZf/3ANwcBiRpp/HV6Njla1OWswivRdOWi1/ggGT/Z2hAFGjUYQIW5z9QPQPz
	YbIKRSKG0EuYA0VgAJfgKlJ9HkijugFaVjU8IT4wHvQ==
X-Gm-Gg: ASbGnctxQn1hviFxAUabjUpE7+hXV7ijF9HnDxPGnm9A0aiNO4h7ECMXcuio+HWZwER
	8EbTEzx+xSU5FbqWQrznHCIDRn6D83mq+AAPxxGOayff77pl3QPO7bQi/MUeoH3v9sdKwGJyBq4
	KGmLcYmWL6iHpC0Ba7fcFsGA8I12cN5VO6rJG322a0t06cYtF1XdT57tdudRSQgasaefdn3hM=
X-Google-Smtp-Source: AGHT+IHSdj9QI/tQtZjAn6JadSTaIPPI/y0H4z0Gy0CMyAEqnQBVzpEcNrn5Szda/rAFPCnXWDefhmM9rWiUZgMm+fk=
X-Received: by 2002:a17:907:9719:b0:ad8:8719:f6f3 with SMTP id
 a640c23a62f3a-adfad30f0b2mr856812666b.22.1750077610784; Mon, 16 Jun 2025
 05:40:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520094538.086709102@infradead.org> <20250520101727.984171377@infradead.org>
 <CAKfTPtDOQVEMRWaK9xEVqSDKcvUfai4CUck6G=oOdaeRBhZQUw@mail.gmail.com>
 <20250606153800.GB39944@noisy.programming.kicks-ass.net> <CAKfTPtDhC3nCcWcWSz08nadZDJ0OtbgZ0r3Usjcu6AagGqYcRA@mail.gmail.com>
 <20250611093934.GB2273038@noisy.programming.kicks-ass.net>
In-Reply-To: <20250611093934.GB2273038@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 16 Jun 2025 14:39:59 +0200
X-Gm-Features: AX0GCFtJoI32HApwvycgdxpmp8ywOFZdR8zBeJxhgS4Me4xjOEqiFNpUYdcBFek
Message-ID: <CAKfTPtBw81fGU21Y5C58SBdGkD0=SHFpRQw=yywK6Hf0gX4ohQ@mail.gmail.com>
Subject: Re: [RFC][PATCH 5/5] sched: Add ttwu_queue support for delayed tasks
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	clm@meta.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 11:39, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Jun 06, 2025 at 06:55:37PM +0200, Vincent Guittot wrote:
> > > > > @@ -3830,12 +3859,41 @@ void sched_ttwu_pending(void *arg)
> > > > >         update_rq_clock(rq);
> > > > >
> > > > >         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
> > > > > +               struct rq *p_rq = task_rq(p);
> > > > > +               int ret;
> > > > > +
> > > > > +               /*
> > > > > +                * This is the ttwu_runnable() case. Notably it is possible for
> > > > > +                * on-rq entities to get migrated -- even sched_delayed ones.
> > > >
> > > > I haven't found where the sched_delayed task could migrate on another cpu.
> > >
> > > Doesn't happen often, but it can happen. Nothing really stops it from
> > > happening. Eg weight based balancing can do it. As can numa balancing
> > > and affinity changes.
> >
> > Yes, I agree that delayed tasks can migrate because of load balancing
> > but not at wake up.
>
> Right, but this here is the case where wakeup races with load-balancing.
> Specifically, due to the wake_list, the wakeup can happen while the task
> is on CPU N, and by the time the IPI gets processed the task has moved
> to CPU M.
>
> It doesn't happen often, but it was 'fun' chasing that fail around for a
> day :/

Ok, it makes sense now.
