Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3806C19CD1B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749193810; cv=none; b=JjXdnl1WM2aT+DX1vFKDJUWaLlMV+3F5m/4thoFoZfvmhFNArBvEiLTYWWyWFec0Qi6nZTY14M0JG1uEiz81okH+E14AO4PJz1+Tp+lUbbYn0sreLfJNkg2xrXFGBpXWxvlgoAhj3CvPGzLQg8OEcUAsX1167402tz35ajs5VnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749193810; c=relaxed/simple;
	bh=GE10Jp7w3vgYYB2dCGeJgGB3gcYPdTbhyjRFYkwy+Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VdAkpQRfjk5a6YNDvBQv0sAgn97c5JrZOVUig4UcWVxle9NM2WvFvPCo33jS/k9b4x40uFTp7Aqa4Nw/vFn6rwypwA5yS9o1jOOrmWSulyYjvJg/PEf3+qQ8C5/hveT4yDb1gXEK3PjT3aPzTgt30XUwecT4O1ei4GPd1158OeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AoQ9bFBT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AoQ9bFBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749193807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MxJNFACo9rn3IWUaAFK5nXlw1xwbNXA8vdGLsqbsFak=;
	b=AoQ9bFBTa1gVdk6az/7GLhUK3e8TBqQvuphpTy6wnZkXqlEs4Z3DOEdWtGFYSwqdOyNzH5
	nl+yXbAPvydD0KXme4bmVSszl6oApXGcssxHfCb9JMvwQz51UegcM3lF9Qe1J30X0dZhB0
	/hILyC1CVW68lgDLV8A912UZcbjKuUI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-213-u-It7wpsOqa1-HgzrqvDTA-1; Fri,
 06 Jun 2025 03:10:01 -0400
X-MC-Unique: u-It7wpsOqa1-HgzrqvDTA-1
X-Mimecast-MFC-AGG-ID: u-It7wpsOqa1-HgzrqvDTA_1749193799
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 72B9319560B1;
	Fri,  6 Jun 2025 07:09:58 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.225.83])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 863EF18003FC;
	Fri,  6 Jun 2025 07:09:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files
Date: Fri,  6 Jun 2025 09:09:50 +0200
Message-ID: <20250606070952.498274-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The kernel Makefiles define the __ASSEMBLY__ macro to provide
a way to use headers in both, assembly and C source code.
However, all the supported versions of the GCC and Clang compilers
also define the macro __ASSEMBLER__ automatically already when compiling
assembly code, so some kernel headers are using __ASSEMBLER__ instead.
With regards to userspace code, this seems also to be constant source
of confusion, see for example these links here:

 https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
 https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
 https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
 https://github.com/riscv-software-src/opensbi/issues/199

To avoid confusion in the future, it would make sense to standardize
on the macro that gets defined by the compiler, so this patch series
changes all occurances of __ASSEMBLY__ into __ASSEMBLER__.

I split the patches per architecture to ease the review, and I also
split the uapi headers from the normal ones in case we decide that
uapi needs to be treated differently from the normal headers here.

The x86 and parisc patches already got merged via their specific
architecture tree:

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24a295e4ef1ca8
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a141be3233af7
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cccaea1d66e94b
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e2b6a188625a2b

So I assume the riscv patches should also go via the riscv tree.

v2:
- Split the riscv patches from the global series
  (see https://lore.kernel.org/all/20250314071013.1575167-1-thuth@redhat.com/)
- Rebased the patches on linux-next and fixed the conflicts
  and new occurances of __ASSEMBLY__

Thomas Huth (2):
  riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers

 arch/riscv/include/asm/alternative-macros.h   | 12 ++++++------
 arch/riscv/include/asm/alternative.h          |  2 +-
 arch/riscv/include/asm/asm-extable.h          |  6 +++---
 arch/riscv/include/asm/asm.h                  | 10 +++++-----
 arch/riscv/include/asm/assembler.h            |  2 +-
 arch/riscv/include/asm/barrier.h              |  4 ++--
 arch/riscv/include/asm/cache.h                |  4 ++--
 arch/riscv/include/asm/cpu_ops_sbi.h          |  2 +-
 arch/riscv/include/asm/csr.h                  |  4 ++--
 arch/riscv/include/asm/current.h              |  4 ++--
 arch/riscv/include/asm/errata_list.h          |  6 +++---
 arch/riscv/include/asm/ftrace.h               |  6 +++---
 arch/riscv/include/asm/gpr-num.h              |  6 +++---
 arch/riscv/include/asm/image.h                |  4 ++--
 arch/riscv/include/asm/insn-def.h             |  8 ++++----
 arch/riscv/include/asm/jump_label.h           |  4 ++--
 arch/riscv/include/asm/kasan.h                |  2 +-
 arch/riscv/include/asm/kgdb.h                 |  4 ++--
 arch/riscv/include/asm/mmu.h                  |  4 ++--
 arch/riscv/include/asm/page.h                 |  4 ++--
 arch/riscv/include/asm/pgtable.h              |  4 ++--
 arch/riscv/include/asm/processor.h            |  4 ++--
 arch/riscv/include/asm/ptrace.h               |  4 ++--
 arch/riscv/include/asm/scs.h                  |  4 ++--
 arch/riscv/include/asm/set_memory.h           |  4 ++--
 arch/riscv/include/asm/thread_info.h          |  4 ++--
 arch/riscv/include/asm/vdso.h                 |  4 ++--
 arch/riscv/include/asm/vdso/getrandom.h       |  4 ++--
 arch/riscv/include/asm/vdso/gettimeofday.h    |  4 ++--
 arch/riscv/include/asm/vdso/processor.h       |  4 ++--
 arch/riscv/include/asm/vdso/vsyscall.h        |  4 ++--
 arch/riscv/include/uapi/asm/kvm.h             |  2 +-
 arch/riscv/include/uapi/asm/ptrace.h          |  4 ++--
 arch/riscv/include/uapi/asm/sigcontext.h      |  4 ++--
 tools/arch/riscv/include/asm/csr.h            |  6 +++---
 tools/arch/riscv/include/asm/vdso/processor.h |  4 ++--
 36 files changed, 81 insertions(+), 81 deletions(-)

-- 
2.49.0

