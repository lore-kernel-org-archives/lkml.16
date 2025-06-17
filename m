Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78C42EE999
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750185411; cv=none; b=uryXAbBPf9PkWHs7yl+2FxT/FB2j2C2SKHfsn2IGaEfnHGTCzaBP13+nSd7wndcp2Vrfg4oZvFI1wrLJNgzrSPXVjPoJxru+LOJM7rNj3b9GTNVBw6yGRaF14wejiF3gi6goCqi4THesoN8o8Nrh/pvKfNkbT5kD/wQTVroeCqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750185411; c=relaxed/simple;
	bh=DPGuwCDJOfOiHrOtdabFRKVGir64HkLXq5DYDJdM2RM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YwckAgXYtr5OfNBV+2L20LdC2HnVB3ySvfzr+bLp3aNxNJDPkaofUdmMCyuFUTNlRPX3JOlSRp8nRlDMKHXLvu4PgeUQ0h0TKVFxXd2+FTOukeDyWyWUYx+M9YT2bQAa7hy2AG96DyIN8b2U1ksBu8A1Tr8XwcaCZABJxYBOdZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AF3D1688;
	Tue, 17 Jun 2025 11:36:28 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 518FE3F58B;
	Tue, 17 Jun 2025 11:36:47 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	ardb@kernel.org,
	frederic@kernel.org,
	james.morse@arm.com,
	joey.gouly@arm.com,
	scott@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v3 5/7] arm64/futex: add futex atomic operation with FEAT_LSUI
Date: Tue, 17 Jun 2025 19:36:33 +0100
Message-Id: <20250617183635.1266015-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617183635.1266015-1-yeoreum.yun@arm.com>
References: <20250617183635.1266015-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current futex atomic operations are implemented with ll/sc instructions and
clearing PSTATE.PAN.

Since Armv9.6, FEAT_LSUI supplies not only load/store instructions but
also atomic operation for user memory access in kernel it doesn't need
to clear PSTATE.PAN bit anymore.

With theses instructions some of futex atomic operations don't need to
be implmented with ldxr/stlxr pair instead can be implmented with
one atomic operation supplied by FEAT_LSUI.

However, some of futex atomic operations still need to use ll/sc way
via ldtxr/stltxr supplied by FEAT_LSUI since there is no correspondant
atomic instruction or doesn't support word size operation
(i.e) eor, cas{mb}t But It's good to work without clearing PSTATE.PAN bit.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/futex_lsui.h | 132 ++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 arch/arm64/include/asm/futex_lsui.h

diff --git a/arch/arm64/include/asm/futex_lsui.h b/arch/arm64/include/asm/futex_lsui.h
new file mode 100644
index 000000000000..0dc7dca91cdb
--- /dev/null
+++ b/arch/arm64/include/asm/futex_lsui.h
@@ -0,0 +1,132 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Arm Ltd.
+ */
+
+#ifndef __ASM_FUTEX_LSUI_H
+#define __ASM_FUTEX_LSUI_H
+
+#include <linux/uaccess.h>
+#include <linux/stringify.h>
+
+#define FUTEX_ATOMIC_OP(op, asm_op, mb)					\
+static __always_inline int						\
+__lsui_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
+{									\
+	int ret = 0;							\
+	int val;							\
+									\
+	mte_enable_tco();						\
+	uaccess_ttbr0_enable();						\
+									\
+	asm volatile("// __lsui_futex_atomic_" #op "\n"			\
+	__LSUI_PREAMBLE							\
+	"1:	" #asm_op #mb "	%w3, %w2, %1\n"				\
+	"2:\n"								\
+	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)				\
+	: "+r" (ret), "+Q" (*uaddr), "=r" (val)				\
+	: "r" (oparg)							\
+	: "memory");							\
+									\
+	mte_disable_tco();						\
+	uaccess_ttbr0_disable();					\
+									\
+	if (!ret)							\
+		*oval = val;						\
+									\
+	return ret;							\
+}
+
+FUTEX_ATOMIC_OP(add, ldtadd, al)
+FUTEX_ATOMIC_OP(or, ldtset, al)
+FUTEX_ATOMIC_OP(andnot, ldtclr, al)
+FUTEX_ATOMIC_OP(set, swpt, al)
+
+#undef FUTEX_ATOMIC_OP
+
+static __always_inline int
+__lsui_futex_atomic_and(int oparg, u32 __user *uaddr, int *oval)
+{
+	return __lsui_futex_atomic_andnot(~oparg, uaddr, oval);
+}
+
+static __always_inline int
+__lsui_futex_atomic_eor(int oparg, u32 __user *uaddr, int *oval)
+{
+	unsigned int loops = LL_SC_MAX_LOOPS;
+	int ret, val, tmp;
+
+	mte_enable_tco();
+	uaccess_ttbr0_enable();
+
+	asm volatile("// __lsui_futex_atomic_eor\n"
+	__LSUI_PREAMBLE
+	"	prfm	pstl1strm, %2\n"
+	"1:	ldtxr	%w1, %2\n"
+	"	eor	%w3, %w1, %w5\n"
+	"2:	stltxr	%w0, %w3, %2\n"
+	"	cbz	%w0, 3f\n"
+	"	sub	%w4, %w4, %w0\n"
+	"	cbnz	%w4, 1b\n"
+	"	mov	%w0, %w6\n"
+	"3:\n"
+	"	dmb	ish\n"
+	_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %w0)
+	_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %w0)
+	: "=&r" (ret), "=&r" (val), "+Q" (*uaddr), "=&r" (tmp),
+	  "+r" (loops)
+	: "r" (oparg), "Ir" (-EAGAIN)
+	: "memory");
+
+	mte_disable_tco();
+	uaccess_ttbr0_disable();
+
+	if (!ret)
+		*oval = val;
+
+	return ret;
+}
+
+static __always_inline int
+__lsui_futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
+{
+	int ret = 0;
+	unsigned int loops = LL_SC_MAX_LOOPS;
+	u32 val, tmp;
+
+	mte_enable_tco();
+	uaccess_ttbr0_enable();
+
+	/*
+	 * cas{al}t doesn't support word size...
+	 */
+	asm volatile("//__lsui_futex_cmpxchg\n"
+	__LSUI_PREAMBLE
+	"	prfm	pstl1strm, %2\n"
+	"1:	ldtxr	%w1, %2\n"
+	"	eor	%w3, %w1, %w5\n"
+	"	cbnz	%w3, 4f\n"
+	"2:	stltxr	%w3, %w6, %2\n"
+	"	cbz	%w3, 3f\n"
+	"	sub	%w4, %w4, %w3\n"
+	"	cbnz	%w4, 1b\n"
+	"	mov	%w0, %w7\n"
+	"3:\n"
+	"	dmb	ish\n"
+	"4:\n"
+	_ASM_EXTABLE_UACCESS_ERR(1b, 4b, %w0)
+	_ASM_EXTABLE_UACCESS_ERR(2b, 4b, %w0)
+	: "+r" (ret), "=&r" (val), "+Q" (*uaddr), "=&r" (tmp), "+r" (loops)
+	: "r" (oldval), "r" (newval), "Ir" (-EAGAIN)
+	: "memory");
+
+	mte_disable_tco();
+	uaccess_ttbr0_disable();
+
+	if (!ret)
+		*oval = oldval;
+
+	return ret;
+}
+
+#endif /* __ASM_FUTEX_LSUI_H */
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

