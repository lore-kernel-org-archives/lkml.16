Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDFF1FDE02
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654738; cv=none; b=hjsuFoJRw7BB0ROBecpQSBcN5ECBsI/K1qA7ZhQRH6qVAgi6kSGuy5MF7ovWhAE7isItKOW9ZT2f273NHrLhaDUymALDTvQkIuHB2yg2LY8vO1iT0LeT3Z00hAW+zEW9Bnd9s/g9XX3hH2igEamujjtT6c4fzuAcp6XvUKVeBK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654738; c=relaxed/simple;
	bh=CCsMW2Y4vgWxPuHdWABQb40IsOOZLbjksJf8mcF8rtI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vGj/BTfiwlElSA4qOOp86qdsRWL/Oe9qWFtK29L+uMrClbfwsUZaIcJBAgtKUkHMqloiI86sN4KpuQAOlkExpEYqH419LZWzkvEvqGuOWcSytZLXqLEhuTTPKO2C/m0bfUScBBdnTmP2ZzoxMjde2vX40n/iqUx7AQuI39VArng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F7761BCB;
	Wed, 11 Jun 2025 08:11:56 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ED4E03F59E;
	Wed, 11 Jun 2025 08:12:13 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	ardb@kernel.org,
	frederic@kernel.org,
	james.morse@arm.com,
	joey.gouly@arm.com,
	scott@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 6/6] arm64/futex: support futex with FEAT_LSUI
Date: Wed, 11 Jun 2025 16:11:54 +0100
Message-Id: <20250611151154.46362-7-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611151154.46362-1-yeoreum.yun@arm.com>
References: <20250611151154.46362-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since Armv9.6, FEAT_LSUI supplies load/store unprevileged instructions
for kernel to access user memory without clearing PSTATE.PAN.

This patch makes futex use futex_atomic operations implemented with these
instruction when cpu supports FEAT_LSUI otherwise they work with
ldxr/stlxr with clearing PSTATE.PAN bit.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/futex.h | 99 +++++++++++-----------------------
 1 file changed, 31 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/include/asm/futex.h b/arch/arm64/include/asm/futex.h
index bc06691d2062..ed4586776655 100644
--- a/arch/arm64/include/asm/futex.h
+++ b/arch/arm64/include/asm/futex.h
@@ -9,71 +9,60 @@
 #include <linux/uaccess.h>
 
 #include <asm/errno.h>
+#include <asm/lsui.h>
 
-#define FUTEX_MAX_LOOPS	128 /* What's the largest number you can think of? */
-
-#define __futex_atomic_op(insn, ret, oldval, uaddr, tmp, oparg)		\
-do {									\
-	unsigned int loops = FUTEX_MAX_LOOPS;				\
-									\
-	uaccess_enable_privileged();					\
-	asm volatile(							\
-"	prfm	pstl1strm, %2\n"					\
-"1:	ldxr	%w1, %2\n"						\
-	insn "\n"							\
-"2:	stlxr	%w0, %w3, %2\n"						\
-"	cbz	%w0, 3f\n"						\
-"	sub	%w4, %w4, %w0\n"					\
-"	cbnz	%w4, 1b\n"						\
-"	mov	%w0, %w6\n"						\
-"3:\n"									\
-"	dmb	ish\n"							\
-	_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %w0)				\
-	_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %w0)				\
-	: "=&r" (ret), "=&r" (oldval), "+Q" (*uaddr), "=&r" (tmp),	\
-	  "+r" (loops)							\
-	: "r" (oparg), "Ir" (-EAGAIN)					\
-	: "memory");							\
-	uaccess_disable_privileged();					\
-} while (0)
+#define FUTEX_ATOMIC_OP(op)										\
+static __always_inline int										\
+__futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
+{									\
+	return __lsui_ll_sc_u_body(futex_atomic_##op, oparg, uaddr, oval);					\
+}
+
+FUTEX_ATOMIC_OP(add)
+FUTEX_ATOMIC_OP(or)
+FUTEX_ATOMIC_OP(and)
+FUTEX_ATOMIC_OP(eor)
+FUTEX_ATOMIC_OP(set)
+
+#undef FUTEX_ATOMIC_OP
+
+static __always_inline int
+__futex_cmpxchg(u32 __user *uaddr, u32 oldval, u32 newval, u32 *oval)
+{
+	return __lsui_ll_sc_u_body(futex_cmpxchg, uaddr, oldval, newval, oval);
+}
 
 static inline int
 arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *_uaddr)
 {
-	int oldval = 0, ret, tmp;
-	u32 __user *uaddr = __uaccess_mask_ptr(_uaddr);
+	int ret;
+	u32 __user *uaddr;
 
 	if (!access_ok(_uaddr, sizeof(u32)))
 		return -EFAULT;
 
+	uaddr = __uaccess_mask_ptr(_uaddr);
+
 	switch (op) {
 	case FUTEX_OP_SET:
-		__futex_atomic_op("mov	%w3, %w5",
-				  ret, oldval, uaddr, tmp, oparg);
+		ret = __futex_atomic_set(oparg, uaddr, oval);
 		break;
 	case FUTEX_OP_ADD:
-		__futex_atomic_op("add	%w3, %w1, %w5",
-				  ret, oldval, uaddr, tmp, oparg);
+		ret = __futex_atomic_add(oparg, uaddr, oval);
 		break;
 	case FUTEX_OP_OR:
-		__futex_atomic_op("orr	%w3, %w1, %w5",
-				  ret, oldval, uaddr, tmp, oparg);
+		ret = __futex_atomic_or(oparg, uaddr, oval);
 		break;
 	case FUTEX_OP_ANDN:
-		__futex_atomic_op("and	%w3, %w1, %w5",
-				  ret, oldval, uaddr, tmp, ~oparg);
+		ret = __futex_atomic_and(~oparg, uaddr, oval);
 		break;
 	case FUTEX_OP_XOR:
-		__futex_atomic_op("eor	%w3, %w1, %w5",
-				  ret, oldval, uaddr, tmp, oparg);
+		ret = __futex_atomic_eor(oparg, uaddr, oval);
 		break;
 	default:
 		ret = -ENOSYS;
 	}
 
-	if (!ret)
-		*oval = oldval;
-
 	return ret;
 }
 
@@ -81,40 +70,14 @@ static inline int
 futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *_uaddr,
 			      u32 oldval, u32 newval)
 {
-	int ret = 0;
-	unsigned int loops = FUTEX_MAX_LOOPS;
-	u32 val, tmp;
 	u32 __user *uaddr;
 
 	if (!access_ok(_uaddr, sizeof(u32)))
 		return -EFAULT;
 
 	uaddr = __uaccess_mask_ptr(_uaddr);
-	uaccess_enable_privileged();
-	asm volatile("// futex_atomic_cmpxchg_inatomic\n"
-"	prfm	pstl1strm, %2\n"
-"1:	ldxr	%w1, %2\n"
-"	sub	%w3, %w1, %w5\n"
-"	cbnz	%w3, 4f\n"
-"2:	stlxr	%w3, %w6, %2\n"
-"	cbz	%w3, 3f\n"
-"	sub	%w4, %w4, %w3\n"
-"	cbnz	%w4, 1b\n"
-"	mov	%w0, %w7\n"
-"3:\n"
-"	dmb	ish\n"
-"4:\n"
-	_ASM_EXTABLE_UACCESS_ERR(1b, 4b, %w0)
-	_ASM_EXTABLE_UACCESS_ERR(2b, 4b, %w0)
-	: "+r" (ret), "=&r" (val), "+Q" (*uaddr), "=&r" (tmp), "+r" (loops)
-	: "r" (oldval), "r" (newval), "Ir" (-EAGAIN)
-	: "memory");
-	uaccess_disable_privileged();
-
-	if (!ret)
-		*uval = val;
 
-	return ret;
+	return __futex_cmpxchg(uaddr, oldval, newval, uval);
 }
 
 #endif /* __ASM_FUTEX_H */
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

