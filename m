Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FF5194091
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 23:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738970390; cv=none; b=RsOii5/bqD8Tux2gcPk/LnG2+WKIkzDuov6cAUortCgw9K9jx9dIapL2bnuDjeDYNnl6wIVBxtk1tzvCkj3q7JXqzHCRtfwdi7kf5oV4t42z6K2UFnRtV7EcBHeC0NlibdtwuLj4DyQ4G/o6/ywOTMlnMToxifZ+r+AgxoggP+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738970390; c=relaxed/simple;
	bh=nCuWVn/fqjD5cuwf8pKjD/ExNhH/G0yGVZefKWML/lQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g9Jg0SPovhoiEndRdg7b2K3lPxkPdWmd/lqssnM71pRHmZcvSgVvKCuETTLw7ewSKs3qYGQ4F34qiXh2UehiC84ARfeslRMgiKXjW49bAF70G9sbCwvk7uFKGGpzoCgNX/jS5+XyPdMdDZ6jozF/pySp74MltItEz2hnCNTXFJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WkLoSOIg; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WkLoSOIg"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f9f6a2fa8dso3725506a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 15:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738970388; x=1739575188; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oKP+POe8yN22ZejOggVcFvoxyB9zGhHldfLECEsynhg=;
        b=WkLoSOIgjHCfJSegTFML+Dg3WO1KPk9tf2wDT9qSi7IYq9ULukt+Jj7sO67kAGXs37
         /ljdc41GxB/g/lBBpUbwJwT0yI6VDiYrrbMYZiZBnKPbIdg9qKzIeJzsw6SeQXD39KPC
         CjhRgRvXByCZbHCJEjxcix4RcU/2GS9jz4xF65wTi8ZWj9O2VQJ1efDN3DNmWV2RrD5F
         yQiHcGgsEwaq7Ba+lu3AZxS+dbbbIa4xpZe0hsobxvM9RE0WQHfotuoFwuDaIdW6/Rjr
         o4ZX3is3XA2WfB3FNzE96AzTuAH3ISjUiz+ZZtoXgTG5RAbrOFN5uXCIB7YFHP+PqpII
         u5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738970388; x=1739575188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKP+POe8yN22ZejOggVcFvoxyB9zGhHldfLECEsynhg=;
        b=ree3jlN00CsZsTAWXEThZXw4vmGyApTbNAhgpnq54zHzPJ3Tw9v8ghFHtKy+h1oSYu
         vm2qSUIVduSpRe+LZe+LEFU6i57wAZWB1VtDm/LU2xW8KE05Yu2Lx3wrd0VRNTMMdsTg
         u8HEj85KoQ0ZIl6u2b0BZiizWhQbbSLk3Q/TSpJf/EI8rA+QKTy7vqzE4d7qbrfYHlJQ
         qmb5gThNJhYjPkKRe0kssw0miDk+uZYJ1oAGcuBM41+BJ5stvAgY3kVWuAPBaLiW3DLP
         +P7mrX8Ei0Avev1q15zaZuR66sYkVOfTyvitnmbAUBgOWqHPceL0thHTNIIpfQK2oovQ
         tP5w==
X-Forwarded-Encrypted: i=1; AJvYcCUheZN79cFOmSO0gM9XQ3GjUdErHVGvFsxPD0v+hikK/KCCv/QQZfyyXjta+TbFhc7v4pq4nzDAy89IKkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT6at2l1WOzlem4jO6QCaIDnOEnyrAHlCFSGRNKDumhGF9mnxW
	mj8uQCYRmO5I+K4G67L+lAJU1rikLe8QGc5CURr7lB468LKpLWgdVh3fOh9wkB5bAJsxL4k6RGr
	Ahcrt7k95hL3W/w//QyOQnQ0wOL++NL+rofJJ
X-Gm-Gg: ASbGnctdH6Jf+mQDCo+c7Da3KVZ0CpiVs3O/R8ew5nH3lFCV4RClsYkXiD9RmanJQWn
	cWscgnYNw7Cg2x0O8h/ajW0jCIlpOKVAKZr18kKYvX7FPvgESP/s3iJn7OjYm8E3obtHrYhHAsl
	FK+sJi3atWzYWRsEXJBmi3GE8ijePV
X-Google-Smtp-Source: AGHT+IG2srijMi5AWg2Bol5FNtfE3Qrb0tVmx99iXxrGkP3mIMBvnwO1+BccnxAH+cLqvI25m1CrlHFrnM6Pc9kgZjA=
X-Received: by 2002:a17:90b:164e:b0:2fa:b8e:3d26 with SMTP id
 98e67ed59e1d1-2fa243f2c2fmr6994347a91.30.1738970387977; Fri, 07 Feb 2025
 15:19:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206175114.1974171-1-bvanassche@acm.org> <20250206175114.1974171-4-bvanassche@acm.org>
 <20250207035345.GA4920@lst.de> <567ceff3-bbd9-4724-a80d-3db46ee40c98@acm.org>
In-Reply-To: <567ceff3-bbd9-4724-a80d-3db46ee40c98@acm.org>
From: Marco Elver <elver@google.com>
Date: Sat, 8 Feb 2025 00:19:11 +0100
X-Gm-Features: AWEUYZkM2m1uKWwv0IHXqw15aeShtARgS1oDh1y_aJD_h3IMpy_BH2lupOAXrzE
Message-ID: <CANpmjNOQDgmyXQZGbHoPJi+Mr0rkZ=SH3NMkbRSfhueNyDAhog@mail.gmail.com>
Subject: Re: [PATCH RFC 03/33] locking: Introduce <linux/thread_safety.h>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 23:34, Bart Van Assche <bvanassche@acm.org> wrote:
[...]
> > Those are all nasty shouting names, without and good prefixing.
> >
> > But more importantly ACQUIRE() and RELEASE() seems to duplicate the
> > existing __acquires/__releases annotations from sparse.  We really need
> > to find away to unify them instead of duplicating the annotations.
>
> I think that we are better off to drop support for the sparse locking
> annotations. Linus added the macro __cond_acquires() two years ago in

+1 to dropping Sparse support -- although we can retain the same keywords.

[...]
> * The argument of __acquire() and __release() can be a "capability" or
>    the address of a synchronization object. A few examples where the
>    argument represents a capability:

Not a problem, and can be solved by introducing "token" instances...

>    __acquire(RCU);
>    __acquire(RCU_BH);
>    __acquire(RCU_SCHED);

For RCU: https://lore.kernel.org/lkml/20250206181711.1902989-16-elver@google.com/

>    __acquire(bitlock);

For bitlock: https://lore.kernel.org/lkml/20250206181711.1902989-15-elver@google.com/

>    An example where the argument represents the address of a
>    synchronization object:
>
>    static inline void do_raw_spin_lock(raw_spinlock_t *lock)
>          __acquires(lock)
>    {
>         __acquire(lock);
>         arch_spin_lock(&lock->raw_lock);
>         mmiowb_spin_lock();
>    }
>
>    If __acquire() and __release() would have to be supported for both
>    sparse and Clang, that would probably involve modifying all instances
>    of these two macros across the entire kernel tree and making it
>    explicit whether the argument is a capability or the address of a
>    synchronization object.

This is not a problem as I have demonstrated with my approach. Using
token instances is also the way we'd be able to support things like
preempt-disable-enable, irq-disable-enable, etc.

In general I'm in favor of dropping Sparse support, but the majority
of existing annotations can be reused, simplifying our work.
