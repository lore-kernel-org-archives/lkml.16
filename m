Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7551DF27E;
	Wed,  2 Jul 2025 10:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451415; cv=none; b=KntrmWVQOO+7wxbfotUdDLML8lUigf4M3J8kn2z7kZA/PQoUJyaP8F2TqPmzeXq5wKJ3B0Q0QV5DTM1G2GPRTmQQjJTqm1Of1DeNpYfMiLkBupklQgetFQav1brQsjBbn6QWUtIPzcvApzOIGeJUQqujeDS30bf28Z9BOG0ByNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451415; c=relaxed/simple;
	bh=nJMHPXeAJaBz7xhsn1CHhGywgMoqmwosoUeaAN0Iqwc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Z/ED+fm/FlAE7FXgjF8dFTXAnhDL7odCx9a7pheICJWK20DRPr+7Z3CN3jokY9xnH6jnCBj6nuXjOYcC228/4PnlDUrKsoqA5MNylMBypHXR9P0Z6Mvui8HuujRmX7GwEJSM1EA8XYx8LPSBzTLP+RV/tCj+RotQD3Ca6RamJg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5rZtJFP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5rZtJFP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1D5C4CEED;
	Wed,  2 Jul 2025 10:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751451414;
	bh=nJMHPXeAJaBz7xhsn1CHhGywgMoqmwosoUeaAN0Iqwc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Z5rZtJFP5THphnMGrAwNEsylF5NxdVxbBcxvCTPSdp72Z/Sbophtc7TPZs1YatmIt
	 t/tP8337Skyo6r1GjPXAfNfOVx43T2rT1K19ql0/FaCawx+sXQdGG+pHW0Ws5hyAd/
	 ahlDuVLQujhoZ9CQPrdj2u657lcnOGFCyNPwUU/tHHYJZSz74rMBwxkvxnh5PEN6XN
	 vhRjQk01XjKEt5GANo/pkJoXWazhPLJu3cF1ei/ez6ZUM9Lio6DTJbc2mWyGFQdEcI
	 wcTYT011g2+G4DpvDZGwOOXVIuahSVw4cysXxXGaH3hvA9jxkDSX8rleUMbdbGaC5K
	 yAmYCsyHJgzmQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 12:16:47 +0200
Message-Id: <DB1HPGT5MG09.25OEO7K36RNKX@kernel.org>
Subject: Re: [RFC RESEND v10 00/14] Refcounted interrupts, SpinLockIrq for
 rust
From: "Benno Lossin" <lossin@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Boqun Feng"
 <boqun.feng@gmail.com>, <linux-kernel@vger.kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250527222254.565881-1-lyude@redhat.com>
In-Reply-To: <20250527222254.565881-1-lyude@redhat.com>

On Wed May 28, 2025 at 12:21 AM CEST, Lyude Paul wrote:
> Hi! While this patch series still needs some changes on the C side, I
> wanted to update things and send out the latest version of it that's
> been sitting on my machine for a while now. This adds back the
> mistakenly missing commit messages along with a number of other changes
> that were requested.
>
> Please keep in mind, there are still some issues with this patch series
> that I do need help with solving before it can move forward:
>
> * https://lore.kernel.org/rust-for-linux/ZxrCrlg1XvaTtJ1I@boqun-archlinux=
/
> * Concerns around double checking the HARDIRQ bits against all
>   architectures that have interrupt priority support. I know what IPL is
>   but I really don't have a clear understanding of how this actually
>   fits together in the kernel's codebase or even how to find the
>   documentation for many of the architectures involved here.
>
>   Please help :C! If you want these rust bindings, figuring out these
>   two issues will let this patch seires move forward.
>
> The previous version of this patch series can be found here:
>
> https://lore.kernel.org/rust-for-linux/20250227221924.265259-4-lyude@redh=
at.com/T/

Overall I think it looks good, I haven't checked the details though.
IIUC, the C side will also change a bit, inducing some more changes on
the Rust side as well, so I'll just take a look when this becomes a
normal patch series :)

Thanks for the hard work Lyude & Boqun!

---
Cheers,
Benno

> Boqun Feng (6):
>   preempt: Introduce HARDIRQ_DISABLE_BITS
>   preempt: Introduce __preempt_count_{sub, add}_return()
>   irq & spin_lock: Add counted interrupt disabling/enabling
>   rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers
>   rust: sync: lock: Add `Backend::BackendInContext`
>   locking: Switch to _irq_{disable,enable}() variants in cleanup guards
>
> Lyude Paul (8):
>   rust: Introduce interrupt module
>   rust: sync: Add SpinLockIrq
>   rust: sync: Introduce lock::Backend::Context
>   rust: sync: Add a lifetime parameter to lock::global::GlobalGuard
>   rust: sync: lock/global: Rename B to G in trait bounds
>   rust: sync: Expose lock::Backend
>   rust: sync: lock/global: Add Backend parameter to GlobalGuard
>   rust: sync: lock/global: Add BackendInContext support to GlobalLock
>
>  arch/arm64/include/asm/preempt.h  |  18 +++
>  arch/s390/include/asm/preempt.h   |  19 +++
>  arch/x86/include/asm/preempt.h    |  10 ++
>  include/asm-generic/preempt.h     |  14 +++
>  include/linux/irqflags.h          |   1 -
>  include/linux/irqflags_types.h    |   6 +
>  include/linux/preempt.h           |  20 +++-
>  include/linux/spinlock.h          |  88 +++++++++++---
>  include/linux/spinlock_api_smp.h  |  27 +++++
>  include/linux/spinlock_api_up.h   |   8 ++
>  include/linux/spinlock_rt.h       |  16 +++
>  kernel/locking/spinlock.c         |  31 +++++
>  kernel/softirq.c                  |   3 +
>  rust/helpers/helpers.c            |   1 +
>  rust/helpers/interrupt.c          |  18 +++
>  rust/helpers/spinlock.c           |  15 +++
>  rust/kernel/interrupt.rs          |  83 +++++++++++++
>  rust/kernel/lib.rs                |   1 +
>  rust/kernel/sync.rs               |   5 +-
>  rust/kernel/sync/lock.rs          |  69 ++++++++++-
>  rust/kernel/sync/lock/global.rs   |  91 ++++++++++-----
>  rust/kernel/sync/lock/mutex.rs    |   2 +
>  rust/kernel/sync/lock/spinlock.rs | 186 ++++++++++++++++++++++++++++++
>  23 files changed, 680 insertions(+), 52 deletions(-)
>  create mode 100644 rust/helpers/interrupt.c
>  create mode 100644 rust/kernel/interrupt.rs
>
>
> base-commit: a3b2347343e077e81d3c169f32c9b2cb1364f4cc

