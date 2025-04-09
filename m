Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6B921ABAB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233119; cv=none; b=Lo0WtCKX8xGp3MW3Xm4XZWalTGS7YFT+VrWEr9hSyI/KfoJ8cIbfOMalX1FdTmHErX8claagPuGP4qXLXLHHDr0UG8/t53BvTNw6pcOC2CRXFQb5IaJGxgwdBHf+S6yWxlJq/JDx9H7UpI4g2YPxcqZP7v+XjM3pPj6Vm+yxw6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233119; c=relaxed/simple;
	bh=GJ6oVkxqkplRcYkmLa6I7Q6iusu/lTsYw+WCUreyhGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LDR0bHtQVAWsWQSj8KpmAL6qoj/zPq69Gd73dOCppPYsaoOIfuqcz2tzm3WgtanWfj0pQuXtCfPMBJKrVpGpZiTzzAOuNvlqVs/IotTbT1CU3PgCtAt1zY+NNyxK8QPtbH5/sUIC7lhER9ZtV8aXcvTGR0wb4TvJgfSycHSE0iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ff4nhkYq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ff4nhkYq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DD6C4CEE8;
	Wed,  9 Apr 2025 21:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744233119;
	bh=GJ6oVkxqkplRcYkmLa6I7Q6iusu/lTsYw+WCUreyhGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ff4nhkYq8MVOoI99+KA9vkpXZZIZnHRoC7/DDBRj8heysnRkNqcwpBt+X2A+CLGrj
	 nUbzhjLMAquYUNrpqHsPGjarGqMo4fAFtsf8EUDZsr/4BPTz2Bhj/+5KnwVYhQqGaB
	 SRFDOsvq/f3FX68CyZbEbcQkTmTqJdosASXIC5A4E3T8MJGez6SQEd7ZlXkJHcIuGH
	 Bqx4ALqQelBuYzmvKshexxI61UHX9aW0ZREheEU6/u6cgz95fbEQ1iTLrFsSnZXBUX
	 bcmdoWJweZ49z77gVdPa6hNZYAz7RDbG6gFuF+wUngkRRBX5XswaFSKREHqaiFsSLV
	 gDBmesjqCqDnA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>,
	Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 6/8] x86/fpu: Make sure x86_task_fpu() doesn't get called for PF_KTHREAD|PF_USER_WORKER tasks during exit
Date: Wed,  9 Apr 2025 23:11:25 +0200
Message-ID: <20250409211127.3544993-7-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211127.3544993-1-mingo@kernel.org>
References: <20250409211127.3544993-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fpu__drop() and arch_release_task_struct() calls x86_task_fpu()
unconditionally, while the FPU context area will not be present
if it's the init task, and should not be in use when it's some
other type of kthread.

Return early for PF_KTHREAD or PF_USER_WORKER tasks. The debug
warning in x86_task_fpu() will catch any kthreads attempting to
use the FPU save area.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/fpu/core.c | 8 +++++++-
 arch/x86/kernel/process.c  | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index e4c20908ee49..4a2193892e5d 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -683,7 +683,13 @@ int fpu_clone(struct task_struct *dst, unsigned long clone_flags, bool minimal,
  */
 void fpu__drop(struct task_struct *tsk)
 {
-	struct fpu *fpu = x86_task_fpu(tsk);
+	struct fpu *fpu;
+
+	/* PF_KTHREAD tasks do not use the FPU context area: */
+	if (tsk->flags & (PF_KTHREAD | PF_USER_WORKER))
+		return;
+
+	fpu = x86_task_fpu(tsk);
 
 	preempt_disable();
 
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 5fb502c97b08..de9df37c5d67 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -109,7 +109,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 #ifdef CONFIG_X86_64
 void arch_release_task_struct(struct task_struct *tsk)
 {
-	if (fpu_state_size_dynamic())
+	if (fpu_state_size_dynamic() && !(current->flags & (PF_KTHREAD | PF_USER_WORKER)))
 		fpstate_free(x86_task_fpu(tsk));
 }
 #endif
-- 
2.45.2

