Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B058527FD4E;
	Wed, 18 Jun 2025 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236340; cv=none; b=WAu6w6ZLPsTlTVh+IQnkgtdBH1tq97OmEXsLaxCTSU4Ukamk1PclRM9xOLqPJ9tA8x+qCXO8YOpMpgXHGzLTDHTGN4sCdVmm3yztrLAaqtjlXrIzeqVU13gBJ2qR/qyQ+VuNHW8ZU5ZCVGN0O+Om0qILUhVihUT58TmvP2VkwK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236340; c=relaxed/simple;
	bh=HA88CUWHfkAZaPnP2oWeB91Vz2S970QlnpfZ5k0CruQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KFz0UwxX7HwzKDKniQKYZk4rE4LQmGT+90/r9TL7LqXCrufTPYvdTpX2oMWFVBf9/djD+c4m2xHcw7oORZYUmYnIc47pN6YF9TQtMiYI7p6lklSFH051dQ6SM40BasJ8FLp/79J+G9ejly8xcXtznzVLZ7o9aEyHJmoua77QCsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE0331BC0;
	Wed, 18 Jun 2025 01:45:17 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 157823F66E;
	Wed, 18 Jun 2025 01:45:35 -0700 (PDT)
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
	akpm@linux-foundation.org,
	surenb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v9 08/10] kselftest/arm64/mte: add verification for address tag in signal handler
Date: Wed, 18 Jun 2025 09:45:11 +0100
Message-Id: <20250618084513.1761345-9-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618084513.1761345-1-yeoreum.yun@arm.com>
References: <20250618084513.1761345-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the address tag [63:60] verification when synchronous mte fault is happen.
when signal handler is registered with SA_EXPOSE_TAGBITS,
address includes not only memory tag [59:56] but also address tag.
Therefore, when verify fault address location, remove both tags

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 .../selftests/arm64/mte/mte_common_util.c     | 38 ++++++++++++++-----
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.c b/tools/testing/selftests/arm64/mte/mte_common_util.c
index d9702a542cb6..10dcbc37e379 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.c
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.c
@@ -33,12 +33,25 @@ static unsigned int mte_cur_pstate_tco;
 
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
@@ -51,13 +64,18 @@ void mte_default_handler(int signum, siginfo_t *si, void *uc)
 		}
 		/* Compare the context for precise error */
 		else if (si->si_code == SEGV_MTESERR) {
+			if ((!mtefar_support && si_atag) || (si_atag != MT_FETCH_ATAG(cur_mte_cxt.trig_addr))) {
+				ksft_print_msg("Invalid MTE synchronous exception caught for address tag! si_tag=%x, si_atag: %x\n", si_tag, si_atag);
+				exit(KSFT_FAIL);
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
@@ -73,11 +91,11 @@ void mte_default_handler(int signum, siginfo_t *si, void *uc)
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
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

