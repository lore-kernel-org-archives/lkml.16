Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EA61CD1F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743844636; cv=none; b=H3f6F9p3XNshCUV9L7ntCDlcmIMHvK9tqKDO5azahnqP/Q5TTgOLmubaPStZlOZ97mqVj8jNTw57ORlRIp584V4JmXHi9MV3wkv1oSH9ACxkSKfXyMyhZF+f9G7GKRTb5NMK4OzOBj02U//vX0nZGFXbuxM+hlwjTVR5Pq2YcrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743844636; c=relaxed/simple;
	bh=2rCy+Ck5yfAgzHT45oha42fKEAaYt70tftTo7+nyLPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2LVXT7f7ffhDbVAtOMjq0MXwaCwmj8S/PENaJ36sf8uZXlFAt+GRH654f+JCeVh9qUe2kBFdOGSil/hGjw9sHCCBLXSz/WI2Ennz6NWXV0VqgxbTYYajB/hxQFrhH78Y0tchpNkown8jn8iCb6UFq38YB8jjvNizjMR+E/6HiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5aagnOZ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5aagnOZ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac73723b2d5so575803966b.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743844633; x=1744449433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3HK5SswwBYFo1XBkr/esZ4pnjyWcYzsoqyCNgrNyeE=;
        b=H5aagnOZQdCazb3l6izBrvs/Mdv1LILs6Fl0kKjlSHgBDuXLVntXQwBJUrIQBrvcfj
         vcYqC16D3fjKmn/75DjL3w8kFUCQigI+IJmLKODv83gTbvjRC8eR2CsgvJoJvqGVccmD
         4UJvYW59ctEy0Ac4ZPocGdm/CLuvSkLLkZD87uOnFvILGYdiENeIpshXQy5fuBCahIDS
         0cXIBEDIQqhgm/NRhKgO1PzHDJtFxWV5Q+PfklqDryK4CvhLUGvigZzgRpUQ8aaRFdEX
         pRHbL+Or+j1FMtFm3dlBLJ/MWgKHSW3ooM3ZEc/75ZVq/rCBAEg3QXGpy6hGRFVJe8r1
         vcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743844633; x=1744449433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3HK5SswwBYFo1XBkr/esZ4pnjyWcYzsoqyCNgrNyeE=;
        b=PwAzF5dkR3jhKHP37io2XSKUSLbNu9fkdcOp7S6r4jPJm++cG/RllwFi5NuGMPgteI
         pfmgyXoeigxJGO0duq+mmdD9eq91Oyvv1XyJGSFWDI5hlPvusMOhMbeN1RfcmOr/M6eB
         EqIvwpFCTvZYAexG8fL0j9o4+6fQrosst/SVIi1zQcsC91BlmmCsbstgc9dRiq1+zPqc
         21JvbCzV4eUyjeRg371WpLXXuOy7+NZRPBDiss6uP4Hwt7vLXjC+wsX2SIgNE+orYCb+
         vUPzDWaDbeRs5LRanMdY8j+M/aOmbwuZIJOMDc0iwR3iXeSvGXo4Lo6ZclApIf53x75/
         Ap0A==
X-Gm-Message-State: AOJu0YwJdRP84kXt20SWMz8oy2131lz3nU2SIC843AF+ppx/x3wtUXf4
	NNFtDlkgxiBn5okOEwWue7xp7ddMy/L/MEIESuhavMYkTdob/H0NX0PkS3ZaByr45tvQuyu3fur
	ofJRbMhDFYmxcNxdJDCNZ/oneHec=
X-Gm-Gg: ASbGnctiIz6AQdo74CtfPRM3JxKVLAGl76Z3kif7pKQq7gxu0nSGShzkvXr1tRSLJez
	BqDvVx9DNZ31oDXFpp0Q8nJfFVjUg3PVYocSJlYUuvWXzd5RhDCuzUgBfqd6BR+38jG7tggY4q0
	+mhgTldBwobO/0iDvXucg0P+BMLw==
X-Google-Smtp-Source: AGHT+IEXQSHcKKdsgkzg+T5/88jXY+7/6c5qylSKz4j83+1NKlhfPEqvuygrVOOgrnC01HZH4rWhmhO9dVWwxWDnQ/Y=
X-Received: by 2002:a17:907:6e90:b0:ac3:991:a631 with SMTP id
 a640c23a62f3a-ac7e72c54a8mr188731766b.34.1743844632500; Sat, 05 Apr 2025
 02:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop> <20250403211514.985900-8-paulmck@kernel.org>
In-Reply-To: <20250403211514.985900-8-paulmck@kernel.org>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sat, 5 Apr 2025 11:17:00 +0200
X-Gm-Features: ATxdqUGiaXMHdgdwkAept-ze_vXP0L7Dpaam7fKl7Kd9RXf0HaVktL-bzMWIewQ
Message-ID: <CAGudoHF5H0NhCu-mCjtd1SGRc5P=8X7jmTaP9k12zZixX1-9LA@mail.gmail.com>
Subject: Re: [PATCH RFC 8/9] ratelimit: Reduce ratelimit's false-positive misses
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	Andrew Morton <akpm@linux-foundation.org>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jon Pan-Doh <pandoh@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Karolina Stolarek <karolina.stolarek@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 11:15=E2=80=AFPM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> The current ratelimit implementation can suffer from false-positive
> misses.  That is, ___ratelimit() might return zero (causing the caller
> to invoke rate limiting, for example, by dropping printk()s) even when
> the current burst has not yet been consumed.  This happens when one CPU
> holds a given ratelimit structure's lock and some other CPU concurrently
> invokes ___ratelimit().  The fact that the lock is a raw irq-disabled
> spinlock might make low-contention trylock failure seem unlikely, but
> vCPU preemption, NMIs, and firmware interrupts can greatly extend the
> trylock-failure window.
>
> Avoiding these false-positive misses is especially important when
> correlating console logged hardware failures with other information.
>
> Therefore, instead of attempting to acquire the lock on each call to
> ___ratelimit(), construct a lockless fastpath and only acquire the lock
> when retriggering (for the next burst) or when resynchronizing (due to
> either a long idle period or due to ratelimiting having been disabled).
> This reduces the number of lock-hold periods that can be extended
> by vCPU preemption, NMIs and firmware interrupts, but also means that
> these extensions must be of much longer durations (generally moving from
> milliseconds to seconds) before they can result in false-positive drops.
>
> In addition, the lockless fastpath gets a 10-20% speedup compared to
> the old fully locked code on my x86 laptop.  Your mileage will of course
> vary depending on your hardware, workload, and configuration.
>

First a nit: the func returns an int with 1 or 0, perhaps one extra
patch to make it bool can be squeezed in here?

One of the previous patches fixes a bug on 32-bit archs.

Maybe it will sound silly, but my suggestion below hinges on it: is
this patchset written with 32-bit kernels in mind?

If not, I wonder if the 32-bit stuff can stay with the locked variant
and the 64-bit can get a lockless fast path which issues 8-byte
cmpxchg on the event count + (to be introduced) sequence counter.

I think that would be significantly easier to reason about as it would
guarantee no changes are made if someone is reconfiguring the struct,
while providing the same win from single-threaded standpoint.

I think you know what you mean, but just in case here is a pseudocode
draft of the fast path:

#define RATELIMIT_NEED_INIT BIT(31)
#define RATELIMIT_IN_FLUX BIT(0)

struct ratelimit_state_change {
        int             events_left;
        unsigned int    seq;
};

struct ratelimit_state {
        raw_spinlock_t  lock;

        int             interval;
        int             burst;
        int             missed;
        struct ratelimit_state_change rsc;
        unsigned long   begin;
};

seq =3D READ_ONCE(rs->rsc.seq);
smp_rmb();
if (seq & (RATELIMIT_NEED_INIT | RATELIMIT_IN_FLUX))
        goto bad;
begin =3D READ_ONCE(rs->begin);
burst =3D READ_ONCE(rs->burst);
interval =3D READ_ONCE(rs->interval);
events_left =3D READ_ONCE(rs->rsc.events_left;
smp_rmb();
/* checks if we can cmpxchg go here */
....
/* now the work */
struct ratelimit_state_change new =3D {
        .events_left =3D events_left - 1;
        .seq =3D seq;
}
if (try_cmpxchg64_relaxed(&rs->rsc, ......)) {
        return true; /* succeeded */
}
/* ... retry based on what we got, most likely only ->events_left has chang=
ed */

On the stock kernel the struct is 32 bytes. I'm combining flags and
the new seq field to avoid growing it.

This does cut down on available seq size, but it should be plenty as
is. This also means the slowpath will have to be careful to not
blindly ++ it to not walk into flags, but I think that's easier to
handle that races. ;)

That said this is merely a suggestion, I'm not going to push for it.

I recognize this swaps atomic_dec into an cmpxchg loop which in
principle will have worse throughput in face of multiple CPUs messing
with it. However, the fast path in both your and my variant issues
loads prior to the atomic op which already do most of the damage, so I
don't think this bit matters that much.
--=20
Mateusz Guzik <mjguzik gmail.com>
