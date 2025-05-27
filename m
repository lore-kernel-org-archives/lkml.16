Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4869A214209
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384591; cv=none; b=A2Q4XiP8eTpO4s6fsg+/sLHjOhF+nT6HL2Hv3Wp1x2VuTgec8YqxQ6FgfsXokz6B0r8pHrfLN1fAeIXm8yYFKaFX9uwYuHml1VsxAr1vs6PYc9QA3yiJVrTPpOCGvXZaNikNzl5vFiFcx5pesJf5fai2u/BMMr8yhNtCOT+pwtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384591; c=relaxed/simple;
	bh=WFrf8h0EsBhuIZr3pXmc+Gk70qBJc63v1czz66GunHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rnKgPTh5vLgENU/7d1DYR+r1Sc2AvLAtPMi5NTe9qDsfXUtElYSydOMMbxYGz9Ni2azrEg6kfPOaVYRSmlxWBhY9Dlir+cAFbW4/siIvKYYRPb3NTpkuZSC5vtF8qSiXzW1K3f6DYGppHY7l4TYiqHPJfLdwN71OUxVG8/3BG0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EbGgDvJA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EbGgDvJA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748384588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qyhGX9TysOct1LJVAWGiSKDcEfScPBYQiUtTvog/bC8=;
	b=EbGgDvJAL7ywd+plxxwLC2I+ZzBtbG7eg96XhYbipAtYAyjF0lr2hPX6h0yMgoDr3I2Ax+
	LNO6NsXoTKYvLfKk6vQtOobTYEgIFxXXr4svx9FjgYo65BczVctH/6G/ZbBAnh4VjOcQ7i
	GdM8TsF5atE77RI46ndzyn6+N3qdsEw=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-301-WrhpyblTO72F1AwR2fgrTw-1; Tue,
 27 May 2025 18:23:02 -0400
X-MC-Unique: WrhpyblTO72F1AwR2fgrTw-1
X-Mimecast-MFC-AGG-ID: WrhpyblTO72F1AwR2fgrTw_1748384580
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 41397195608B;
	Tue, 27 May 2025 22:23:00 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.105])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ABED419560AF;
	Tue, 27 May 2025 22:22:56 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [RFC RESEND v10 00/14] Refcounted interrupts, SpinLockIrq for rust
Date: Tue, 27 May 2025 18:21:41 -0400
Message-ID: <20250527222254.565881-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Hi! While this patch series still needs some changes on the C side, I
wanted to update things and send out the latest version of it that's
been sitting on my machine for a while now. This adds back the
mistakenly missing commit messages along with a number of other changes
that were requested.

Please keep in mind, there are still some issues with this patch series
that I do need help with solving before it can move forward:

* https://lore.kernel.org/rust-for-linux/ZxrCrlg1XvaTtJ1I@boqun-archlinux/
* Concerns around double checking the HARDIRQ bits against all
  architectures that have interrupt priority support. I know what IPL is
  but I really don't have a clear understanding of how this actually
  fits together in the kernel's codebase or even how to find the
  documentation for many of the architectures involved here.

  Please help :C! If you want these rust bindings, figuring out these
  two issues will let this patch seires move forward.

The previous version of this patch series can be found here:

https://lore.kernel.org/rust-for-linux/20250227221924.265259-4-lyude@redhat.com/T/

Boqun Feng (6):
  preempt: Introduce HARDIRQ_DISABLE_BITS
  preempt: Introduce __preempt_count_{sub, add}_return()
  irq & spin_lock: Add counted interrupt disabling/enabling
  rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers
  rust: sync: lock: Add `Backend::BackendInContext`
  locking: Switch to _irq_{disable,enable}() variants in cleanup guards

Lyude Paul (8):
  rust: Introduce interrupt module
  rust: sync: Add SpinLockIrq
  rust: sync: Introduce lock::Backend::Context
  rust: sync: Add a lifetime parameter to lock::global::GlobalGuard
  rust: sync: lock/global: Rename B to G in trait bounds
  rust: sync: Expose lock::Backend
  rust: sync: lock/global: Add Backend parameter to GlobalGuard
  rust: sync: lock/global: Add BackendInContext support to GlobalLock

 arch/arm64/include/asm/preempt.h  |  18 +++
 arch/s390/include/asm/preempt.h   |  19 +++
 arch/x86/include/asm/preempt.h    |  10 ++
 include/asm-generic/preempt.h     |  14 +++
 include/linux/irqflags.h          |   1 -
 include/linux/irqflags_types.h    |   6 +
 include/linux/preempt.h           |  20 +++-
 include/linux/spinlock.h          |  88 +++++++++++---
 include/linux/spinlock_api_smp.h  |  27 +++++
 include/linux/spinlock_api_up.h   |   8 ++
 include/linux/spinlock_rt.h       |  16 +++
 kernel/locking/spinlock.c         |  31 +++++
 kernel/softirq.c                  |   3 +
 rust/helpers/helpers.c            |   1 +
 rust/helpers/interrupt.c          |  18 +++
 rust/helpers/spinlock.c           |  15 +++
 rust/kernel/interrupt.rs          |  83 +++++++++++++
 rust/kernel/lib.rs                |   1 +
 rust/kernel/sync.rs               |   5 +-
 rust/kernel/sync/lock.rs          |  69 ++++++++++-
 rust/kernel/sync/lock/global.rs   |  91 ++++++++++-----
 rust/kernel/sync/lock/mutex.rs    |   2 +
 rust/kernel/sync/lock/spinlock.rs | 186 ++++++++++++++++++++++++++++++
 23 files changed, 680 insertions(+), 52 deletions(-)
 create mode 100644 rust/helpers/interrupt.c
 create mode 100644 rust/kernel/interrupt.rs


base-commit: a3b2347343e077e81d3c169f32c9b2cb1364f4cc
-- 
2.49.0

