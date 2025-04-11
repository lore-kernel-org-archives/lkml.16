Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B05A29B233
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363051; cv=none; b=NAPKqhFFng2JuP3qC+Jah5uD4vgOWIdHNscXJ+ZCaJf9a7YHyRMkkvPnj2u0XE5YAxkBWKTcLlr0/Np593hpkHPnMlIwE0Z2r9KX2TgTWss4Vq4Yxffd0WQsKDc+GwgvBVZUFw0IWpJxPHkHyG9ifffxGExornEGwAGAXhqs8gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363051; c=relaxed/simple;
	bh=3CCwyN59Ybqhcm67dh86gT11q1lwFQKwlaUQ0udsiZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PeMosYHQB9fGqhaQKsyLbuM3eAYpiz8qLdDc0ZpUMR447aygqZGe/JmqjbxZ8iSDFTlV56qVGxainZVNtQ6fxbt/DIPZYaDBASiuYPKnPUp8zjhloV/MtEAbAnvfYxRSERsuEpxhS4Gku4BO09yA2+hl7FuEFXljAEEABGhaaE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B014106F;
	Fri, 11 Apr 2025 02:17:29 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 042073F6A8;
	Fri, 11 Apr 2025 02:17:25 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [RFC PATCH v4 08/18] arm64: Context-switch POR_EL1
Date: Fri, 11 Apr 2025 10:16:21 +0100
Message-ID: <20250411091631.954228-9-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250411091631.954228-1-kevin.brodsky@arm.com>
References: <20250411091631.954228-1-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

POR_EL1 is about to be used by the kpkeys framework, modifying it
for (typically small) sections of code. If an exception occurs
during that window and scheduling occurs, we must ensure that
POR_EL1 is context-switched as needed (saving the old value and
restoring the new one). An ISB is needed to ensure the write takes
effect, so we skip it if the new value is the same as the old, like
for POR_EL0.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/processor.h | 1 +
 arch/arm64/kernel/process.c        | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 1bf1a3b16e88..0afaf96ca699 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -185,6 +185,7 @@ struct thread_struct {
 	u64			svcr;
 	u64			tpidr2_el0;
 	u64			por_el0;
+	u64			por_el1;
 #ifdef CONFIG_ARM64_GCS
 	unsigned int		gcs_el0_mode;
 	unsigned int		gcs_el0_locked;
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 45a55fe81788..1f38c29b0c95 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -418,6 +418,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 	ptrauth_thread_init_kernel(p);
 
+	if (system_supports_poe())
+		p->thread.por_el1 = read_sysreg_s(SYS_POR_EL1);
+
 	if (likely(!args->fn)) {
 		*childregs = *current_pt_regs();
 		childregs->regs[0] = 0;
@@ -639,6 +642,12 @@ static void permission_overlay_switch(struct task_struct *next)
 	if (current->thread.por_el0 != next->thread.por_el0) {
 		write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
 	}
+
+	current->thread.por_el1 = read_sysreg_s(SYS_POR_EL1);
+	if (current->thread.por_el1 != next->thread.por_el1) {
+		write_sysreg_s(next->thread.por_el1, SYS_POR_EL1);
+		isb();
+	}
 }
 
 /*
-- 
2.47.0

