Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED87227BB7
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 06:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738738492; cv=none; b=FENDsKLJYAF41cWWs+zGApFlDBtOgoIkSJBHil5a+tosRe2Wy2x/6gLuhS/OV7fRmhO2Jg2/Ltk41lGRgvYtuLTa2lFL54//NJ5kCj8iNKqEKT/xhKiSnd/iUBfEzFCJeOpuFELk9RznTowPURALQSfLVnMcDEBqvpYKC5lh9Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738738492; c=relaxed/simple;
	bh=oqv7jBSncpt9Oun63nIOrYg61g/GvpeccewqH2aHn9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=buXoimz+EGm+MI6Cl7co52klvhITTQY/d0gERtS3JUTjoI2twjFy0+/Jk8RqotTJFvESp3i6/E+L5D+ccHYlZNThHFpCkNeuG23XSRW8YaP+G9W/1gln/ddnM0qp/duuK4tkO76c9OMVDCG3tOag8LiUhHkC7Rwjfo1zqdjzqGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EpCQv+5E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EpCQv+5E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738738489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DU3mbDfOckusgvw3Q2V0BpSskMHFw4hNrktOktZ/6Jo=;
	b=EpCQv+5Ef4/OiH8hye8c7Y2VN9oD3xUYlXJkTY1IdOFeTzfqPeXXSVorioXz+N2AivohLh
	IE7WQ3Qtlx1blkRHgjwymQ0VoHFhxuWaflm1WSrJxFsRhi+NEg38vZfvs12iEnnRNrmbqs
	B1EjfWFSgFuLNIuwy57qGbEg/TkuLDY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-xL-uatl0PrOpU5wwILoZBg-1; Wed,
 05 Feb 2025 01:54:45 -0500
X-MC-Unique: xL-uatl0PrOpU5wwILoZBg-1
X-Mimecast-MFC-AGG-ID: xL-uatl0PrOpU5wwILoZBg
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4CB121956094;
	Wed,  5 Feb 2025 06:54:44 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.64.7])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0F1821800360;
	Wed,  5 Feb 2025 06:54:41 +0000 (UTC)
From: Seiji Nishikawa <snishika@redhat.com>
To: dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org
Cc: linux-kernel@vger.kernel.org,
	snishika@redhat.com
Subject: [PATCH] x86/mm: Harden copy_from_kernel_nofault_allowed() to prevent false MCEs
Date: Wed,  5 Feb 2025 15:53:36 +0900
Message-ID: <20250205065336.440890-1-snishika@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Multiple instances have been observed where bpf_probe_read_kernel()
triggers a machine check exception (MCE) due to an invalid address being
accessed in copy_from_kernel_nofault(). The issue arises while
pagefault_disable() is in effect, preventing normal fault handling and
leading to an MCE.

        ......
mce: [Hardware Error]: CPU XX: Machine Check Exception: X Bank X: bf80000000200401
mce: [Hardware Error]: RIP !INEXACT! 10:<ffffffffa8ce2d1e> {copy_from_kernel_nofault+0x3e/0xf0}
mce: [Hardware Error]: TSC XXXXXXXXXXXXXXXX ADDR XXXXXXXX MISC XX PPIN XXXXXXXXXXXXXXXXXX
mce: [Hardware Error]: PROCESSOR X:XXXXX TIME XXXXXXXXX SOCKET X APIC XX microcode XXXXXXX
mce: [Hardware Error]: Run the above through 'mcelog --ascii'
mce: [Hardware Error]: Machine check: Processor context corrupt
Kernel panic - not syncing: Fatal machine check
        ......

        ......
--- <NMI exception stack> ---
 #5 [fffffe00014f8e08] delay_tsc at ffffffffab3c5cfc
 #6 [fffffe00014f8e08] wait_for_panic at ffffffffaae4340d
 #7 [fffffe00014f8e18] mce_timed_out at ffffffffaae43de8
 #8 [fffffe00014f8e30] do_machine_check at ffffffffab9303e4
 #9 [fffffe00014f8f30] exc_machine_check at ffffffffab9308f5
#10 [fffffe00014f8f50] asm_exc_machine_check at ffffffffaba00c3a
    [exception RIP: copy_from_kernel_nofault+62]
    RIP: ffffffffab0e2fee  RSP: ffff9de0b79b7d78  RFLAGS: 00000202
    RAX: ffffffffffffffff  RBX: ffffffffff5fc34b  RCX: 0000000000000010
    RDX: 0000000000000008  RSI: 0000000000000008  RDI: ffffffffff5fc34b
    RBP: ffff9de0b79b7df8   R8: 0000000000000001   R9: 0000000000000000
    R10: 0000000000000001  R11: ffff8e323b4f4710  R12: 0000000000000008
    R13: 0000000002566780  R14: 0000000000000000  R15: ffff9de0b79b7e80
    ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0018
--- <MCE exception stack> ---
#11 [ffff9de0b79b7d78] copy_from_kernel_nofault at ffffffffab0e2fee
#12 [ffff9de0b79b7d90] bpf_probe_read_kernel at ffffffffab04d568
#13 [ffff9de0b79b7e08] copy_from_kernel_nofault at ffffffffab0e2fcd
#14 [ffff9de0b79b7e28] bpf_probe_read_kernel at ffffffffab04d568
#15 [ffff9de0b79b7e90] bpf_trace_run2 at ffffffffab04e4e6
#16 [ffff9de0b79b7ec0] syscall_exit_work at ffffffffaaf99a00
#17 [ffff9de0b79b7ed8] syscall_exit_to_user_mode at ffffffffab931ce9
#18 [ffff9de0b79b7ee8] do_syscall_64 at ffffffffab92e169
#19 [ffff9de0b79b7f50] entry_SYSCALL_64_after_hwframe at ffffffffaba00121
        ......

The root cause is that copy_from_kernel_nofault_allowed() currently only
blocks access to the exact vsyscall page (0xffffffffff600000) but does
not account for addresses slightly below or above it that result in
similar failures.

Observed faulting addresses and their deltas from VSYSCALL_ADDR:

- 0xffffffffff5fc294  (-0x3d6c)
- 0xffffffffff6000c7  (+0xc7)
- 0xffffffffff5fc3b0  (-0x3c50)
- 0xffffffffff5fcde0  (-0x3220)
- 0xffffffffff5fce94  (-0x316c)
- 0xffffffffff600050  (+0x50)
- 0xffffffffff5fc2f8  (-0x3d08)
- 0xffffffffff6008a0  (+0x8a0)
- 0xffffffffff5fc1c7  (-0x3e39)
- 0xffffffffff60009d  (+0x9d)
- 0xffffffffff600678  (+0x678)
- 0xffffffffff6000c7  (+0xc7)
- 0xffffffffff5fc34b  (-0x3cb5)
- 0xffffffffff5fcde0  (-0x3220)

The invalid addresses are likely caused by incorrect pointer arithmetic,
out-of-bounds accesses in a BPF program using bpf_probe_read_kernel(), or
invalid user-space pointers. Other contributing factors include
speculative execution, uninitialized or corrupted pointers, and SMAP
restrictions when vsyscall=xonly is enabled. Additionally, the use of
pagefault_disable() prevents proper fault handling, potentially leading
to an MCE. Bugs in the JIT compiler or verifier, as well as exploit
attempts, may also be responsible.

The existing check that blocks access to the exact vsyscall page was
introduced in patch 32019c659ecf ("x86/mm: Disallow vsyscall page read
for copy_from_kernel_nofault()"). However, this check does not cover
addresses slightly below or above it that exhibit similar failure
patterns.

This patch extends copy_from_kernel_nofault_allowed() to block access not
only to the vsyscall page (0xffffffffff600000) but also to a range
spanning four pages below it and one page above its start. This prevents
unintended memory accesses that could otherwise lead to fatal MCEs.

By preventing such invalid accesses, this patch improves the robustness
of the kernel and mitigates the impact of potential BPF program
misbehavior.

Fixes: 32019c659ecf ("x86/mm: Disallow vsyscall page read for copy_from_kernel_nofault()")
Signed-off-by: Seiji Nishikawa <snishika@redhat.com>
---
 arch/x86/mm/maccess.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/mm/maccess.c b/arch/x86/mm/maccess.c
index 42115ac079cf..0388577ebc91 100644
--- a/arch/x86/mm/maccess.c
+++ b/arch/x86/mm/maccess.c
@@ -18,11 +18,11 @@ bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 		return false;
 
 	/*
-	 * Reading from the vsyscall page may cause an unhandled fault in
-	 * certain cases.  Though it is at an address above TASK_SIZE_MAX, it is
-	 * usually considered as a user space address.
-	 */
-	if (is_vsyscall_vaddr(vaddr))
+ 	 * Block accesses to the vsyscall page and a surrounding range
+ 	 * to prevent misaligned reads that could bypass the check.
+ 	 */
+	if (vaddr >= VSYSCALL_ADDR - (4 * PAGE_SIZE) &&
+	    vaddr < VSYSCALL_ADDR + PAGE_SIZE)
 		return false;
 
 	/*
-- 
2.48.1

