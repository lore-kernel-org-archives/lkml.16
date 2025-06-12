Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F697205AA3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749727428; cv=none; b=oIl7oc909T9uPTGLtRi0eculcabLwLlzOCMsAy+FRA6aG0HnOTFUIobmWvPpL4wSHtfFQ8Lml+Nz383HyQO86uvOKElIdFiyWhT9p1ON9r2s/XSPokuKRLnerNheRC9YeJD0l0gQ67rOvBAJrX6DOx9x1KHRf2O7SkKuu3dqYAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749727428; c=relaxed/simple;
	bh=YsJ6rEnNPS+8TR3CqwwWLYLczfYwYURpGBH4PNaP/Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjsttFOK75lLcqyPxU4krrj+iTQVEddTKsGOv3bMFZ4XmKFnUw/wd1/Vu6KbeQLdr5v/fvvv6I5tTZdScVw0Gmv4Uk/VWbzk+jgediwJzIzK0F786k7ZHzqqOa3tYeEV+Iq9uq90d+t0CmZJHsT+jhrGMizkrib60svm6e4UPn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rq6Bff2d; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rq6Bff2d"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45300c82c1cso2676585e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749727425; x=1750332225; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voVo8I9QxBGtkmzh70LjWyku2Zrwfval80U+5bI7i/E=;
        b=rq6Bff2dkI2W9BsRMu4nrSpdvjSeL4x/k9azam2DNIxBwS22FwsMQdPzhl2Ar80oUf
         sExzn3BpAZ6dftQKHnKerbe2X69e/kW7l6Fo7GXbew8t/eUeK68oT+D7rXAFFNGzlhtd
         7eiYvduYlvNcO1DE5qEJNMwEfJppEj9JHumxyvNRjhba0xZIq//BJXlZu6JJfyJZO7rp
         0q3axj98TDKE4l4TLuICmYCmsrHqJS/43iQj7OFg6RHzYJrURakhu/udAttxtKiy3fLF
         bht7y1nIAokyOwIiiF0u4crYbKWc4HHerj7UH7QSDNBlE1oCZh9YoDzxSbNqs1XZNeYq
         DEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749727425; x=1750332225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=voVo8I9QxBGtkmzh70LjWyku2Zrwfval80U+5bI7i/E=;
        b=XSgoBlqXwcpF1ID6V433VU/LLcPO4aDLK32xnDVSy7q/knUNloBMmfSkJvmWMRrAXT
         Ge27PjrKcPqPfa01rMn5Kn2yj/U8MnsdBLrz0ED4ZFJtrnU17c4dtDkX/K+47sBWlx8L
         Lyz97BN4DmnQUMnC/wxcgXduoIKk2kmc/4SCwsl37NhWBoZwijjzytxsjZeYdX2jTolS
         0fS3CjsosSi8C/qg4P4K2lmihBBTFamIAvNiJ0IWckebkqNuWmBIanjipi87+OFNESsP
         IqHUfM+bUA8sxTK9S3d39dlizsuO/gKjkwHcsXKmXXjsyyWxT+j5sNqN3L1oROKf+4jK
         0vUw==
X-Forwarded-Encrypted: i=1; AJvYcCX4JvlGHkot0SyDp0g60BwVuVSof7hWzsokq/UbTN4nNLWOyktmtLgu3f3gNm93mP6w2OiSqPjRCsRu3ks=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBwMqscjuAxyedFYoNUqIJIR+nyZeL4YSGLBtqF2RDJQixKTNT
	triZYkmJY1KD4Pkl8qg6bm88Dh8/wESRckyddeLOLTg9W+zt2obcvuQy2I0W66DWWKmnS0Wfnzk
	OTXUgn0rju1/6MPv9qgCHPMizJl9YJRKVOGgdpiAw
X-Gm-Gg: ASbGncsgM734m8EHQLIJhrVNYpXXzmyeZ9uul1sZ409KbCWhK+8u6X+76wTrpcKy8E9
	4MI87a1ydY4EyxzvtpV4zeobfKYW1o2PsgOymYYS+HRqs4yy5SWVENsO0ONTkW2sFGdgXMoxiif
	iJ9OVP22bCjOLUYIrKF9xadnJqqz+c95JN6o/+OrbOK9cSgQsx5Z+PM+7uMiolN2exoTghgmzfz
	Q==
X-Google-Smtp-Source: AGHT+IHjfHB6y71K2hC5Ih2R5CHYh4ILWbUdAgtXcI2ldvwQBCDT8/0wF1Iz+BMUuAjD5RFmos4CpMmLLSdnWI0AvEI=
X-Received: by 2002:a05:600c:5246:b0:441:d4e8:76cd with SMTP id
 5b1f17b1804b1-4532b939503mr32287595e9.29.1749727424476; Thu, 12 Jun 2025
 04:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603205416.49281-1-dakr@kernel.org> <20250603205416.49281-2-dakr@kernel.org>
 <DAKE8OYKXUWH.1NRVGV5IKW7I9@kernel.org>
In-Reply-To: <DAKE8OYKXUWH.1NRVGV5IKW7I9@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Jun 2025 13:23:29 +0200
X-Gm-Features: AX0GCFvg6RMKsP0uZ5MO2JZ7BZWnOprlzLsuZ4KlUrS0Oike2SOx1MVOlnQegKU
Message-ID: <CAH5fLgicAeLOnNUm-gMytYe5NmmMvwbWtXBUhWM5w7vY_BUnYw@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: completion: implement initial abstraction
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, chrisi.schrefl@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 9:58=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Tue Jun 3, 2025 at 10:48 PM CEST, Danilo Krummrich wrote:
> > Implement a minimal abstraction for the completion synchronization
> > primitive.
> >
> > This initial abstraction only adds complete_all() and
> > wait_for_completion(), since that is what is required for the subsequen=
t
> > Devres patch.
> >
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Juri Lelli <juri.lelli@redhat.com>
> > Cc: Vincent Guittot <vincent.guittot@linaro.org>
> > Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Ben Segall <bsegall@google.com>
> > Cc: Mel Gorman <mgorman@suse.de>
> > Cc: Valentin Schneider <vschneid@redhat.com>
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>
> I have a couple comments on the documentation, but the rest seems good.
> So with those fixed:
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
>
> > ---
> >  rust/bindings/bindings_helper.h |   1 +
> >  rust/helpers/completion.c       |   8 +++
> >  rust/helpers/helpers.c          |   1 +
> >  rust/kernel/sync.rs             |   2 +
> >  rust/kernel/sync/completion.rs  | 111 ++++++++++++++++++++++++++++++++
> >  5 files changed, 123 insertions(+)
> >  create mode 100644 rust/helpers/completion.c
> >  create mode 100644 rust/kernel/sync/completion.rs
> >
> > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_h=
elper.h
> > index a5a6fb45d405..9da3fe89295c 100644
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -17,6 +17,7 @@
> >  #include <linux/blk_types.h>
> >  #include <linux/blkdev.h>
> >  #include <linux/clk.h>
> > +#include <linux/completion.h>
> >  #include <linux/configfs.h>
> >  #include <linux/cpu.h>
> >  #include <linux/cpufreq.h>
> > diff --git a/rust/helpers/completion.c b/rust/helpers/completion.c
> > new file mode 100644
> > index 000000000000..b2443262a2ae
> > --- /dev/null
> > +++ b/rust/helpers/completion.c
> > @@ -0,0 +1,8 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/completion.h>
> > +
> > +void rust_helper_init_completion(struct completion *x)
> > +{
> > +     init_completion(x);
> > +}
> > diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> > index 805307018f0e..7a5c520be8cb 100644
> > --- a/rust/helpers/helpers.c
> > +++ b/rust/helpers/helpers.c
> > @@ -13,6 +13,7 @@
> >  #include "build_assert.c"
> >  #include "build_bug.c"
> >  #include "clk.c"
> > +#include "completion.c"
> >  #include "cpufreq.c"
> >  #include "cpumask.c"
> >  #include "cred.c"
> > diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> > index 36a719015583..c23a12639924 100644
> > --- a/rust/kernel/sync.rs
> > +++ b/rust/kernel/sync.rs
> > @@ -10,6 +10,7 @@
> >  use pin_init;
> >
> >  mod arc;
> > +pub mod completion;
> >  mod condvar;
> >  pub mod lock;
> >  mod locked_by;
> > @@ -17,6 +18,7 @@
> >  pub mod rcu;
> >
> >  pub use arc::{Arc, ArcBorrow, UniqueArc};
> > +pub use completion::Completion;
> >  pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
> >  pub use lock::global::{global_lock, GlobalGuard, GlobalLock, GlobalLoc=
kBackend, GlobalLockedBy};
> >  pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
> > diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completi=
on.rs
> > new file mode 100644
> > index 000000000000..4ec4c2aa73a5
> > --- /dev/null
> > +++ b/rust/kernel/sync/completion.rs
> > @@ -0,0 +1,111 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Completion support.
> > +//!
> > +//! Reference: <https://docs.kernel.org/scheduler/completion.html>
> > +//!
> > +//! C header: [`include/linux/completion.h`](srctree/include/linux/com=
pletion.h)
> > +
> > +use crate::{bindings, prelude::*, types::Opaque};
> > +
> > +/// Synchronization primitive to signal when a certain task has been c=
ompleted.
> > +///
> > +/// The [`Completion`] synchronization primitive signales when a certa=
in task has been completed by
> > +/// waking up other tasks that can queue themselves up to wait for the=
 [`Completion`] to be
>
> s/can queue themselves/have been queued/
>
> > +/// completed.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::sync::{Arc, Completion};
> > +/// use kernel::workqueue::{self, impl_has_work, new_work, Work, WorkI=
tem};
> > +///
> > +/// #[pin_data]
> > +/// struct MyTask {
> > +///     #[pin]
> > +///     work: Work<MyTask>,
>
> Can we maybe add a dummy value like `Mutex<i32>` here that the task
> changes, so we can print the value of it below (after waiting for the
> task)?

If there's something incorrect in the docs, sure, let's fix it. But
since this is supposed to land as a part of a fix, perhaps it would be
best to have the work of making these docs perfect be a follow-up that
can land in the usual merge window?

Alice
