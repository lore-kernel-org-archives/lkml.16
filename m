Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A988A2066CE
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378083; cv=none; b=czzYAQzW+Fm3XH67mWzHjr+w3vyNtdcMR98tbscyOzc9oA8gRaZ/jFwZU10T27+ye0Tn6X3/I4/mXri5vSDrp0RHCcno89Dg6WjphTr5HXhIJV5qb2P/6u6UO1HK+jQlYupVdSlvhkWTfd5tbaINBywINMZtyO+CEkOzzn3k+0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378083; c=relaxed/simple;
	bh=WFrf8h0EsBhuIZr3pXmc+Gk70qBJc63v1czz66GunHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RJR0ZIFG30KuPUTKy/+SzipaAthA6lp4CcjFXHv4Wz5+CZEWYmdaxCcgirzYnA5YRhojIjR7aHdVpsqEoZhlt0cyT1MEz8l196LswMx95BxDdZ2P4km74M1r0L0HnCsOpvzYssZ5UwOcmLdke+t/zQ61JCHKHQayHg27tsxH5CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CYNjee9S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CYNjee9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748378080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qyhGX9TysOct1LJVAWGiSKDcEfScPBYQiUtTvog/bC8=;
	b=CYNjee9SqtfBrPUPaJiNvltFynHK3zCQz4RKZMr0c/FUD/ciYQdYrM9eWqas8svaHgDTfY
	py7qICmXsfa9EG3lvZCUqSv9eX3GyiPsCs+0eYFva09NEfF/+uZPsEOmu1A5caRSBCz85R
	DW8QyYE2ScXb0ivAuZyqfWOM6/ArYtI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-645-DEPerqrVOlqKWpNASXTynQ-1; Tue,
 27 May 2025 16:34:37 -0400
X-MC-Unique: DEPerqrVOlqKWpNASXTynQ-1
X-Mimecast-MFC-AGG-ID: DEPerqrVOlqKWpNASXTynQ_1748378075
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9F7DD1801BC0;
	Tue, 27 May 2025 20:34:01 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.82.65])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 21BE418003FC;
	Tue, 27 May 2025 20:33:57 +0000 (UTC)
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
Subject: [RFC v10 00/14] Refcounted interrupts, SpinLockIrq for rust
Date: Tue, 27 May 2025 16:26:45 -0400
Message-ID: <20250527203355.551287-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

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

