Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F0E23A9B1;
	Tue, 10 Jun 2025 15:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749567722; cv=none; b=iK4VlPBVxxF4YAwwQjz9QuH4KACAmI2bIWyQe7dbUSPHzAQm4nDzo/uRl75VHTEMRX1BDK4zkjdOVCihvMVk3da0TIzztpD+vfVpM6+Ftu4eDx5b698qx17WoNYlCIDlIADmf7w3nuGElhNtBB6z7Tr9OQd7wfLvl1WX/+FrEJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749567722; c=relaxed/simple;
	bh=PUV2rE/JlzOBU3SGyyRucb3Obn0aXwskI8nwY4ZCyIU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b9yZbVmu5Ab+s8U5z0dRa+CX4XII036iWz2b4GvwCw81SYpSH/R39BydWy0uMag7wpFmrvZOx8WGkfRAoDTpTPo7NCwYKPqF/ag27qf1VXXxrBNOdiR+lzR9XU0ScDTKqeJAsQqD2f9NV61vedk1fhltehs8QokUxroFusiH0AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C7B0175A;
	Tue, 10 Jun 2025 08:01:40 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 70F4F3F59E;
	Tue, 10 Jun 2025 08:01:57 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	shmeerali.kolothum.thodi@huawei.com,
	akpm@linux-foundation.org,
	surenb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v5 4/6] kselftest/arm64/mte: preparation for mtefar test
Date: Tue, 10 Jun 2025 16:01:42 +0100
Message-Id: <20250610150144.2523945-5-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610150144.2523945-1-yeoreum.yun@arm.com>
References: <20250610150144.2523945-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If FEAT_MTE_TAGGED_FAR (Armv8.9) is supported, bits 63:60 of the fault address
are preserved in response to synchronous tag check faults (SEGV_MTESERR).

This patch is preparation for testing FEAT_MTE_TAGGED_FAR.
It shouldn't change the test result.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../selftests/arm64/mte/check_buffer_fill.c   |  2 +-
 .../selftests/arm64/mte/check_child_memory.c  |  4 +-
 .../arm64/mte/check_hugetlb_options.c         |  4 +-
 .../selftests/arm64/mte/check_ksm_options.c   |  4 +-
 .../selftests/arm64/mte/check_mmap_options.c  |  4 +-
 .../arm64/mte/check_tags_inclusion.c          |  2 +-
 .../selftests/arm64/mte/check_user_mem.c      |  2 +-
 .../selftests/arm64/mte/mte_common_util.c     | 70 ++++++++++++++++---
 .../selftests/arm64/mte/mte_common_util.h     |  8 ++-
 tools/testing/selftests/arm64/mte/mte_def.h   |  8 +++
 10 files changed, 85 insertions(+), 23 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/check_buffer_fill.c b/tools/testing/selftests/arm64/mte/check_buffer_fill.c
index 2ee7f114d7fa..5248b5265aa4 100644
--- a/tools/testing/selftests/arm64/mte/check_buffer_fill.c
+++ b/tools/testing/selftests/arm64/mte/check_buffer_fill.c
@@ -415,7 +415,7 @@ int main(int argc, char *argv[])
 		return err;
 
 	/* Register SIGSEGV handler */
-	mte_register_signal(SIGSEGV, mte_default_handler);
+	mte_register_signal(SIGSEGV, mte_default_handler, false);
 
 	/* Set test plan */
 	ksft_set_plan(20);
diff --git a/tools/testing/selftests/arm64/mte/check_child_memory.c b/tools/testing/selftests/arm64/mte/check_child_memory.c
index 7597fc632cad..b97ea3981c21 100644
--- a/tools/testing/selftests/arm64/mte/check_child_memory.c
+++ b/tools/testing/selftests/arm64/mte/check_child_memory.c
@@ -160,8 +160,8 @@ int main(int argc, char *argv[])
 		return err;
 
 	/* Register SIGSEGV handler */
-	mte_register_signal(SIGSEGV, mte_default_handler);
-	mte_register_signal(SIGBUS, mte_default_handler);
+	mte_register_signal(SIGSEGV, mte_default_handler, false);
+	mte_register_signal(SIGBUS, mte_default_handler, false);
 
 	/* Set test plan */
 	ksft_set_plan(12);
diff --git a/tools/testing/selftests/arm64/mte/check_hugetlb_options.c b/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
index 3bfcd3848432..4e644a606394 100644
--- a/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
+++ b/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
@@ -235,8 +235,8 @@ int main(int argc, char *argv[])
 		return err;
 
 	/* Register signal handlers */
-	mte_register_signal(SIGBUS, mte_default_handler);
-	mte_register_signal(SIGSEGV, mte_default_handler);
+	mte_register_signal(SIGBUS, mte_default_handler, false);
+	mte_register_signal(SIGSEGV, mte_default_handler, false);
 
 	allocate_hugetlb();
 
diff --git a/tools/testing/selftests/arm64/mte/check_ksm_options.c b/tools/testing/selftests/arm64/mte/check_ksm_options.c
index 88c74bc46d4f..afea4e381862 100644
--- a/tools/testing/selftests/arm64/mte/check_ksm_options.c
+++ b/tools/testing/selftests/arm64/mte/check_ksm_options.c
@@ -141,8 +141,8 @@ int main(int argc, char *argv[])
 		return KSFT_FAIL;
 	}
 	/* Register signal handlers */
-	mte_register_signal(SIGBUS, mte_default_handler);
-	mte_register_signal(SIGSEGV, mte_default_handler);
+	mte_register_signal(SIGBUS, mte_default_handler, false);
+	mte_register_signal(SIGSEGV, mte_default_handler, false);
 
 	/* Set test plan */
 	ksft_set_plan(4);
diff --git a/tools/testing/selftests/arm64/mte/check_mmap_options.c b/tools/testing/selftests/arm64/mte/check_mmap_options.c
index 17694caaff53..b37bf481c9f9 100644
--- a/tools/testing/selftests/arm64/mte/check_mmap_options.c
+++ b/tools/testing/selftests/arm64/mte/check_mmap_options.c
@@ -201,8 +201,8 @@ int main(int argc, char *argv[])
 	sizes[item - 1] = page_size + 1;
 
 	/* Register signal handlers */
-	mte_register_signal(SIGBUS, mte_default_handler);
-	mte_register_signal(SIGSEGV, mte_default_handler);
+	mte_register_signal(SIGBUS, mte_default_handler, false);
+	mte_register_signal(SIGSEGV, mte_default_handler, false);
 
 	/* Set test plan */
 	ksft_set_plan(22);
diff --git a/tools/testing/selftests/arm64/mte/check_tags_inclusion.c b/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
index a3d1e23fe02a..b96296ab9870 100644
--- a/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
+++ b/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
@@ -180,7 +180,7 @@ int main(int argc, char *argv[])
 		return err;
 
 	/* Register SIGSEGV handler */
-	mte_register_signal(SIGSEGV, mte_default_handler);
+	mte_register_signal(SIGSEGV, mte_default_handler, false);
 
 	/* Set test plan */
 	ksft_set_plan(4);
diff --git a/tools/testing/selftests/arm64/mte/check_user_mem.c b/tools/testing/selftests/arm64/mte/check_user_mem.c
index f4ae5f87a3b7..d1d14aaaba16 100644
--- a/tools/testing/selftests/arm64/mte/check_user_mem.c
+++ b/tools/testing/selftests/arm64/mte/check_user_mem.c
@@ -211,7 +211,7 @@ int main(int argc, char *argv[])
 		return err;
 
 	/* Register signal handlers */
-	mte_register_signal(SIGSEGV, mte_default_handler);
+	mte_register_signal(SIGSEGV, mte_default_handler, false);
 
 	/* Set test plan */
 	ksft_set_plan(64);
diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.c b/tools/testing/selftests/arm64/mte/mte_common_util.c
index a1dc2fe5285b..47e5f940b804 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.c
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.c
@@ -6,6 +6,7 @@
 #include <signal.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <time.h>
 #include <unistd.h>
 
 #include <linux/auxvec.h>
@@ -19,20 +20,38 @@
 #include "mte_common_util.h"
 #include "mte_def.h"
 
+#ifndef SA_EXPOSE_TAGBITS
+#define SA_EXPOSE_TAGBITS 0x00000800
+#endif
+
 #define INIT_BUFFER_SIZE       256
 
 struct mte_fault_cxt cur_mte_cxt;
+bool mtefar_support;
 static unsigned int mte_cur_mode;
 static unsigned int mte_cur_pstate_tco;
 
 void mte_default_handler(int signum, siginfo_t *si, void *uc)
 {
+	struct sigaction sa;
 	unsigned long addr = (unsigned long)si->si_addr;
+	unsigned char si_tag, si_atag;
+
+	sigaction(signum, NULL, &sa);
+
+	if (sa.sa_flags & SA_EXPOSE_TAGBITS) {
+		si_tag = MT_FETCH_TAG(addr);
+		si_atag = MT_FETCH_ATAG(addr);
+		addr = MT_CLEAR_TAGS(addr);
+	} else {
+		si_tag = 0;
+		si_atag = 0;
+	}
 
 	if (signum == SIGSEGV) {
 #ifdef DEBUG
-		ksft_print_msg("INFO: SIGSEGV signal at pc=%lx, fault addr=%lx, si_code=%lx\n",
-				((ucontext_t *)uc)->uc_mcontext.pc, addr, si->si_code);
+		ksft_print_msg("INFO: SIGSEGV signal at pc=%lx, fault addr=%lx, si_code=%lx, si_tag=%x, si_atag=%x\n",
+				((ucontext_t *)uc)->uc_mcontext.pc, addr, si->si_code, si_tag, si_atag);
 #endif
 		if (si->si_code == SEGV_MTEAERR) {
 			if (cur_mte_cxt.trig_si_code == si->si_code)
@@ -45,13 +64,18 @@ void mte_default_handler(int signum, siginfo_t *si, void *uc)
 		}
 		/* Compare the context for precise error */
 		else if (si->si_code == SEGV_MTESERR) {
+		 	if ((!mtefar_support && si_atag) || (si_atag != MT_FETCH_ATAG(cur_mte_cxt.trig_addr))) {
+			  ksft_print_msg("Invalid MTE synchronous exception caught for address tag! si_tag=%x, si_atag: %x\n", si_tag, si_atag);
+			  exit(1);
+			}
+
 			if (cur_mte_cxt.trig_si_code == si->si_code &&
 			    ((cur_mte_cxt.trig_range >= 0 &&
-			      addr >= MT_CLEAR_TAG(cur_mte_cxt.trig_addr) &&
-			      addr <= (MT_CLEAR_TAG(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)) ||
+			      addr >= MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) &&
+			      addr <= (MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)) ||
 			     (cur_mte_cxt.trig_range < 0 &&
-			      addr <= MT_CLEAR_TAG(cur_mte_cxt.trig_addr) &&
-			      addr >= (MT_CLEAR_TAG(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)))) {
+			      addr <= MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) &&
+			      addr >= (MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)))) {
 				cur_mte_cxt.fault_valid = true;
 				/* Adjust the pc by 4 */
 				((ucontext_t *)uc)->uc_mcontext.pc += 4;
@@ -67,11 +91,11 @@ void mte_default_handler(int signum, siginfo_t *si, void *uc)
 		ksft_print_msg("INFO: SIGBUS signal at pc=%llx, fault addr=%lx, si_code=%x\n",
 				((ucontext_t *)uc)->uc_mcontext.pc, addr, si->si_code);
 		if ((cur_mte_cxt.trig_range >= 0 &&
-		     addr >= MT_CLEAR_TAG(cur_mte_cxt.trig_addr) &&
-		     addr <= (MT_CLEAR_TAG(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)) ||
+		     addr >= MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) &&
+		     addr <= (MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)) ||
 		    (cur_mte_cxt.trig_range < 0 &&
-		     addr <= MT_CLEAR_TAG(cur_mte_cxt.trig_addr) &&
-		     addr >= (MT_CLEAR_TAG(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range))) {
+		     addr <= MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) &&
+		     addr >= (MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range))) {
 			cur_mte_cxt.fault_valid = true;
 			/* Adjust the pc by 4 */
 			((ucontext_t *)uc)->uc_mcontext.pc += 4;
@@ -79,12 +103,17 @@ void mte_default_handler(int signum, siginfo_t *si, void *uc)
 	}
 }
 
-void mte_register_signal(int signal, void (*handler)(int, siginfo_t *, void *))
+void mte_register_signal(int signal, void (*handler)(int, siginfo_t *, void *),
+			 bool export_tags)
 {
 	struct sigaction sa;
 
 	sa.sa_sigaction = handler;
 	sa.sa_flags = SA_SIGINFO;
+
+	if (export_tags && signal == SIGSEGV)
+		sa.sa_flags |= SA_EXPOSE_TAGBITS;
+
 	sigemptyset(&sa.sa_mask);
 	sigaction(signal, &sa, NULL);
 }
@@ -120,6 +149,20 @@ void mte_clear_tags(void *ptr, size_t size)
 	mte_clear_tag_address_range(ptr, size);
 }
 
+void *mte_insert_atag(void *ptr)
+{
+	unsigned char atag;
+
+	srandom(time(NULL));
+	atag =  mtefar_support ? (random() % MT_ATAG_MASK) + 1 : 0;
+	return (void *)MT_SET_ATAG((unsigned long)ptr, atag);
+}
+
+void *mte_clear_atag(void *ptr)
+{
+	return (void *)MT_CLEAR_ATAG((unsigned long)ptr);
+}
+
 static void *__mte_allocate_memory_range(size_t size, int mem_type, int mapping,
 					 size_t range_before, size_t range_after,
 					 bool tags, int fd)
@@ -264,6 +307,7 @@ void mte_initialize_current_context(int mode, uintptr_t ptr, ssize_t range)
 	cur_mte_cxt.fault_valid = false;
 	cur_mte_cxt.trig_addr = ptr;
 	cur_mte_cxt.trig_range = range;
+
 	if (mode == MTE_SYNC_ERR)
 		cur_mte_cxt.trig_si_code = SEGV_MTESERR;
 	else if (mode == MTE_ASYNC_ERR)
@@ -316,12 +360,16 @@ int mte_switch_mode(int mte_option, unsigned long incl_mask)
 int mte_default_setup(void)
 {
 	unsigned long hwcaps2 = getauxval(AT_HWCAP2);
+	unsigned long hwcaps3 = getauxval(AT_HWCAP3);
 	unsigned long en = 0;
 	int ret;
 
 	if (!(hwcaps2 & HWCAP2_MTE))
 		ksft_exit_skip("MTE features unavailable\n");
 
+	if (hwcaps3 & HWCAP3_MTE_FAR)
+		mtefar_support = true;
+
 	/* Get current mte mode */
 	ret = prctl(PR_GET_TAGGED_ADDR_CTRL, en, 0, 0, 0);
 	if (ret < 0) {
diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.h b/tools/testing/selftests/arm64/mte/mte_common_util.h
index a0017a303beb..7dbb5e1046ae 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.h
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.h
@@ -34,13 +34,17 @@ struct mte_fault_cxt {
 	unsigned long trig_si_code;
 	/* Flag to denote if correct fault caught */
 	bool fault_valid;
+	/* Expected address tag when mte tag fault triggered */
+	unsigned char address_tag;
 };
 
 extern struct mte_fault_cxt cur_mte_cxt;
+extern bool mtefar_support;
 
 /* MTE utility functions */
 void mte_default_handler(int signum, siginfo_t *si, void *uc);
-void mte_register_signal(int signal, void (*handler)(int, siginfo_t *, void *));
+void mte_register_signal(int signal, void (*handler)(int, siginfo_t *, void *),
+			 bool export_tags);
 void mte_wait_after_trig(void);
 void *mte_allocate_memory(size_t size, int mem_type, int mapping, bool tags);
 void *mte_allocate_memory_tag_range(size_t size, int mem_type, int mapping,
@@ -54,6 +58,8 @@ void mte_free_memory_tag_range(void *ptr, size_t size, int mem_type,
 			       size_t range_before, size_t range_after);
 void *mte_insert_tags(void *ptr, size_t size);
 void mte_clear_tags(void *ptr, size_t size);
+void *mte_insert_atag(void *ptr);
+void *mte_clear_atag(void *ptr);
 int mte_default_setup(void);
 void mte_restore_setup(void);
 int mte_switch_mode(int mte_option, unsigned long incl_mask);
diff --git a/tools/testing/selftests/arm64/mte/mte_def.h b/tools/testing/selftests/arm64/mte/mte_def.h
index 9b188254b61a..6ad22f07c9b8 100644
--- a/tools/testing/selftests/arm64/mte/mte_def.h
+++ b/tools/testing/selftests/arm64/mte/mte_def.h
@@ -42,6 +42,8 @@
 #define MT_TAG_COUNT		16
 #define MT_INCLUDE_TAG_MASK	0xFFFF
 #define MT_EXCLUDE_TAG_MASK	0x0
+#define MT_ATAG_SHIFT		60
+#define MT_ATAG_MASK		0xFUL
 
 #define MT_ALIGN_GRANULE	(MT_GRANULE_SIZE - 1)
 #define MT_CLEAR_TAG(x)		((x) & ~(MT_TAG_MASK << MT_TAG_SHIFT))
@@ -49,6 +51,12 @@
 #define MT_FETCH_TAG(x)		((x >> MT_TAG_SHIFT) & (MT_TAG_MASK))
 #define MT_ALIGN_UP(x)		((x + MT_ALIGN_GRANULE) & ~(MT_ALIGN_GRANULE))
 
+#define MT_CLEAR_ATAG(x)	((x) & ~(MT_TAG_MASK << MT_ATAG_SHIFT))
+#define MT_SET_ATAG(x, y)	((x) | (((y) & MT_ATAG_MASK) << MT_ATAG_SHIFT))
+#define MT_FETCH_ATAG(x)	((x >> MT_ATAG_SHIFT) & (MT_ATAG_MASK))
+
+#define MT_CLEAR_TAGS(x) 	(MT_CLEAR_ATAG(MT_CLEAR_TAG(x)))
+
 #define MT_PSTATE_TCO_SHIFT	25
 #define MT_PSTATE_TCO_MASK	~(0x1 << MT_PSTATE_TCO_SHIFT)
 #define MT_PSTATE_TCO_EN	1
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

