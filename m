Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C6B1D5CE8
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187313; cv=none; b=qEMJ5w7KxEwWSLwhBhUzYgZJppF3rg1KwIoDd66ZjZVwtQx2NkZ+Cdwp8R36nL1ef3Cv88MDcZ0leJYTXHBe8MH9FWW963ya7gtWeDP0erZDb5+ROM71uww2AwrMfao1J3wcs+LRgjjnq5vPK012y2DZify3nlkSWtoyrMYgZag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187313; c=relaxed/simple;
	bh=q9uPqLTY23wTOJPd4l5UeTu14FuWmA115jTfrX5akA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lSUfrOUXyQJde06MTKh8pmPc65i8ntmDUDBp46zRXDJZgMq+1s+fFULm4ADPB1xvzlx+aLp+zEZgOObo88VNYEnUlLOhyL+5JU3i/0aOvXtYBz/GQ7Qtyj7WhdQUWIRt+z4/KcHoyBCI8vS9L2yTvSvRF101U5D+/f7yWerlnbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 12ADB72C90B;
	Mon, 10 Feb 2025 14:35:10 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 03C8D7CCB3A; Mon, 10 Feb 2025 13:35:09 +0200 (IST)
Date: Mon, 10 Feb 2025 13:35:09 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Oleg Nesterov <oleg@redhat.com>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/7] ptrace_get_syscall_info: factor out
 ptrace_get_syscall_info_op
Message-ID: <20250210113509.GF887@strace.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210113336.GA887@strace.io>

Move the code that calculates the type of the system call stop
out of ptrace_get_syscall_info() into a separate function
ptrace_get_syscall_info_op() which is going to be used later
to implement PTRACE_SET_SYSCALL_INFO API.

Signed-off-by: Dmitry V. Levin <ldv@strace.io>
Reviewed-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/ptrace.c | 58 +++++++++++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/kernel/ptrace.c b/kernel/ptrace.c
index d5f89f9ef29f..22e7d74cf4cd 100644
--- a/kernel/ptrace.c
+++ b/kernel/ptrace.c
@@ -921,7 +921,6 @@ ptrace_get_syscall_info_entry(struct task_struct *child, struct pt_regs *regs,
 	unsigned long args[ARRAY_SIZE(info->entry.args)];
 	int i;
 
-	info->op = PTRACE_SYSCALL_INFO_ENTRY;
 	info->entry.nr = syscall_get_nr(child, regs);
 	syscall_get_arguments(child, regs, args);
 	for (i = 0; i < ARRAY_SIZE(args); i++)
@@ -943,7 +942,6 @@ ptrace_get_syscall_info_seccomp(struct task_struct *child, struct pt_regs *regs,
 	 * diverge significantly enough.
 	 */
 	ptrace_get_syscall_info_entry(child, regs, info);
-	info->op = PTRACE_SYSCALL_INFO_SECCOMP;
 	info->seccomp.ret_data = child->ptrace_message;
 
 	/* ret_data is the last field in struct ptrace_syscall_info.seccomp */
@@ -954,7 +952,6 @@ static unsigned long
 ptrace_get_syscall_info_exit(struct task_struct *child, struct pt_regs *regs,
 			     struct ptrace_syscall_info *info)
 {
-	info->op = PTRACE_SYSCALL_INFO_EXIT;
 	info->exit.rval = syscall_get_error(child, regs);
 	info->exit.is_error = !!info->exit.rval;
 	if (!info->exit.is_error)
@@ -965,19 +962,8 @@ ptrace_get_syscall_info_exit(struct task_struct *child, struct pt_regs *regs,
 }
 
 static int
-ptrace_get_syscall_info(struct task_struct *child, unsigned long user_size,
-			void __user *datavp)
+ptrace_get_syscall_info_op(struct task_struct *child)
 {
-	struct pt_regs *regs = task_pt_regs(child);
-	struct ptrace_syscall_info info = {
-		.op = PTRACE_SYSCALL_INFO_NONE,
-		.arch = syscall_get_arch(child),
-		.instruction_pointer = instruction_pointer(regs),
-		.stack_pointer = user_stack_pointer(regs),
-	};
-	unsigned long actual_size = offsetof(struct ptrace_syscall_info, entry);
-	unsigned long write_size;
-
 	/*
 	 * This does not need lock_task_sighand() to access
 	 * child->last_siginfo because ptrace_freeze_traced()
@@ -988,18 +974,42 @@ ptrace_get_syscall_info(struct task_struct *child, unsigned long user_size,
 	case SIGTRAP | 0x80:
 		switch (child->ptrace_message) {
 		case PTRACE_EVENTMSG_SYSCALL_ENTRY:
-			actual_size = ptrace_get_syscall_info_entry(child, regs,
-								    &info);
-			break;
+			return PTRACE_SYSCALL_INFO_ENTRY;
 		case PTRACE_EVENTMSG_SYSCALL_EXIT:
-			actual_size = ptrace_get_syscall_info_exit(child, regs,
-								   &info);
-			break;
+			return PTRACE_SYSCALL_INFO_EXIT;
+		default:
+			return PTRACE_SYSCALL_INFO_NONE;
 		}
-		break;
 	case SIGTRAP | (PTRACE_EVENT_SECCOMP << 8):
-		actual_size = ptrace_get_syscall_info_seccomp(child, regs,
-							      &info);
+		return PTRACE_SYSCALL_INFO_SECCOMP;
+	default:
+		return PTRACE_SYSCALL_INFO_NONE;
+	}
+}
+
+static int
+ptrace_get_syscall_info(struct task_struct *child, unsigned long user_size,
+			void __user *datavp)
+{
+	struct pt_regs *regs = task_pt_regs(child);
+	struct ptrace_syscall_info info = {
+		.op = ptrace_get_syscall_info_op(child),
+		.arch = syscall_get_arch(child),
+		.instruction_pointer = instruction_pointer(regs),
+		.stack_pointer = user_stack_pointer(regs),
+	};
+	unsigned long actual_size = offsetof(struct ptrace_syscall_info, entry);
+	unsigned long write_size;
+
+	switch (info.op) {
+	case PTRACE_SYSCALL_INFO_ENTRY:
+		actual_size = ptrace_get_syscall_info_entry(child, regs, &info);
+		break;
+	case PTRACE_SYSCALL_INFO_EXIT:
+		actual_size = ptrace_get_syscall_info_exit(child, regs, &info);
+		break;
+	case PTRACE_SYSCALL_INFO_SECCOMP:
+		actual_size = ptrace_get_syscall_info_seccomp(child, regs, &info);
 		break;
 	}
 
-- 
ldv
