Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E692239E93
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 16:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750348895; cv=none; b=K739Tacw2a5HP4tETdPwnjZ8iZnrw076Ked4EjuIv04RqKjcMtmfhYecsC2fQA9KXfRJdHPKAau40qkgbm7eKxCK5sNF9YnLT265iYMiQRvAteKc0k/M45wNrZDsUIueb9sbnpFdYwVBqyoum/inbk2EB3EuVle6Ny13lNg9i0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750348895; c=relaxed/simple;
	bh=eJUS8dwdbsRtv2bw3fS17fWzd7oYQ9OWDvw5s0bJJTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/3Y2Us95QFLSPYa6d3f5VFOoxyROTjiS6W6sqaxHj8cL7yH7PDfNVq1rN9E2slW3T1xTwm7RDDjeNli5cDQL3XhHwz7B0zqDFH7hhA70Dw8YIl80GpnMQZJy1kjKKn3jUXgE1lkONSgNn4RupjmUqr/e7NuAsUbaLBCOVTmHnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81C9A12FC;
	Thu, 19 Jun 2025 09:01:13 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 642F03F66E;
	Thu, 19 Jun 2025 09:01:32 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 1/2] arm64: poe: Handle spurious Overlay faults
Date: Thu, 19 Jun 2025 17:00:41 +0100
Message-ID: <20250619160042.2499290-2-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250619160042.2499290-1-kevin.brodsky@arm.com>
References: <20250619160042.2499290-1-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We do not currently issue an ISB after updating POR_EL0 when
context-switching it, for instance. The rationale is that if the old
value of POR_EL0 is more restrictive and causes a fault during
uaccess, the access will be retried [1]. In other words, we are
trading an ISB on every context-switching for the (unlikely)
possibility of a spurious fault. We may also miss faults if the new
value of POR_EL0 is more restrictive, but that's considered
acceptable.

However, as things stand, a spurious Overlay fault results in
uaccess failing right away since it causes fault_from_pkey() to
return true. If an Overlay fault is reported, we therefore need to
double check POR_EL0 against vma_pkey(vma) - this is what
arch_vma_access_permitted() already does.

As it turns out, we already perform that explicit check if no
Overlay fault is reported, and we need to keep that check (see
comment added in fault_from_pkey()). Net result: the Overlay ISS2
bit isn't of much help to decide whether a pkey fault occurred.

Remove the check for the Overlay bit from fault_from_pkey() and
add a comment to try and explain the situation. While at it, also
add a comment to permission_overlay_switch() in case anyone gets
surprised by the lack of ISB.

[1] https://lore.kernel.org/linux-arm-kernel/ZtYNGBrcE-j35fpw@arm.com/

Fixes: 160a8e13de6c ("arm64: context switch POR_EL0 register")
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/kernel/process.c |  5 +++++
 arch/arm64/mm/fault.c       | 30 +++++++++++++++++++++---------
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index a5ca15daeb8a..be1717eaf23b 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -671,6 +671,11 @@ static void permission_overlay_switch(struct task_struct *next)
 	current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
 	if (current->thread.por_el0 != next->thread.por_el0) {
 		write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
+		/*
+		 * No ISB required as we can tolerate spurious Overlay faults -
+		 * the fault handler will check again based on the new value
+		 * of POR_EL0.
+		 */
 	}
 }
 
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index ec0a337891dd..11eb8d1adc84 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -487,17 +487,29 @@ static void do_bad_area(unsigned long far, unsigned long esr,
 	}
 }
 
-static bool fault_from_pkey(unsigned long esr, struct vm_area_struct *vma,
-			unsigned int mm_flags)
+static bool fault_from_pkey(struct vm_area_struct *vma, unsigned int mm_flags)
 {
-	unsigned long iss2 = ESR_ELx_ISS2(esr);
-
 	if (!system_supports_poe())
 		return false;
 
-	if (esr_fsc_is_permission_fault(esr) && (iss2 & ESR_ELx_Overlay))
-		return true;
-
+	/*
+	 * We do not check whether an Overlay fault has occurred because we
+	 * cannot make a decision based solely on its value:
+	 *
+	 * - If Overlay is set, a fault did occur due to POE, but it may be
+	 *   spurious in those cases where we update POR_EL0 without ISB (e.g.
+	 *   on context-switch). We would then need to manually check POR_EL0
+	 *   against vma_pkey(vma), which is exactly what
+	 *   arch_vma_access_permitted() does.
+	 *
+	 * - If Overlay is not set, we may still need to report a pkey fault.
+	 *   This is the case if an access was made within a mapping but with no
+	 *   page mapped, and POR_EL0 forbids the access (according to
+	 *   vma_pkey()). Such access will result in a SIGSEGV regardless
+	 *   because core code checks arch_vma_access_permitted(), but in order
+	 *   to report the correct error code - SEGV_PKUERR - we must handle
+	 *   that case here.
+	 */
 	return !arch_vma_access_permitted(vma,
 			mm_flags & FAULT_FLAG_WRITE,
 			mm_flags & FAULT_FLAG_INSTRUCTION,
@@ -635,7 +647,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 		goto bad_area;
 	}
 
-	if (fault_from_pkey(esr, vma, mm_flags)) {
+	if (fault_from_pkey(vma, mm_flags)) {
 		pkey = vma_pkey(vma);
 		vma_end_read(vma);
 		fault = 0;
@@ -679,7 +691,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 		goto bad_area;
 	}
 
-	if (fault_from_pkey(esr, vma, mm_flags)) {
+	if (fault_from_pkey(vma, mm_flags)) {
 		pkey = vma_pkey(vma);
 		mmap_read_unlock(mm);
 		fault = 0;
-- 
2.47.0

