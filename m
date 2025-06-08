Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC7C1F9A8B
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 07:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749367701; cv=none; b=FGydkxKKihjgwixPZdofY5OSn5sdpE4dyG3DaV97nXQ0chG6c6RHBgQ73FubyHpoMREGfRTm2aDugcNeN39EYjb2RdAxPfF1kREUeedHoq7TbvGn7mLnRdsCbXFBXkEmTExocV/rWPTZs8dvL0uXVeoV0Ojr+DSDe4H9Atny67Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749367701; c=relaxed/simple;
	bh=XnnWRNHZ+L6scphqJqV88BMmUMII9ZdAfNxFGaYc570=;
	h=From:To:Cc:Subject:References:Message-ID:Content-Type:
	 MIME-Version:Date; b=SarHB7NugRacW9MSHH/hTxA+eZPaz0nwhrg6ww4smrlCjKTHJu1RucFUQ0nWSvbJK3Eq2LRhYY/Qjj/pGgfyA3IbLgNIbHJDJ/iP2weJtUm86GLpgbXI/5slWLpMSCoV0QM33MI/bZ/aLJjgaF+vFYrWscxx3h27Nxa1JQIO6Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xNuuZXYO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sni7ZRyJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xNuuZXYO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sni7ZRyJ"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749367697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=MfF5jn0GSw6eW7VQmfIRTRQvpeXkSyIdztAWVr0WEII=;
	b=xNuuZXYOJRIJfijuh46O48XKPfzYCsbIhoDVZ/KINPi8NPgDuV6rfvTXhqpOmrdCchfRR9
	XDRu6qffMNMqbGbfQhd4HKiRwW79Gl1aMSV0vskbNEUvM7Ma8TayjjSQvuTaLEL/LXx34L
	qz91k510O1irssgTDwUDKB36IQJRw2BvX01nwYbcA/dIROaE0jUTotHg2XIom+EgmCpTMj
	E+D5dEwyRCdMKwWUIiGVAMm407uV3WSABpYMlR49NTVht3eAeS8Vaau1rjz37a0DoAevws
	JsJ41gjZTyF+5cW0cZPXnUX+Vu3FTxOf7AtjybhVqImxgBnGtBgqKCHozJ0Hmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749367697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=MfF5jn0GSw6eW7VQmfIRTRQvpeXkSyIdztAWVr0WEII=;
	b=sni7ZRyJl0A7DcuMAFJHNgV06T45mbdrOrXN3P77QnDSTEg4e8EqrAvzhYnusF3us/yW/4
	bFxSZeSpc/AYazBA==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] x86/urgent for v6.16-rc1
References: <174936764731.749406.17114868218275391074.tglx@xen13>
Message-ID: <174936765455.749406.13707130091819875670.tglx@xen13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun,  8 Jun 2025 09:28:16 +0200 (CEST)

Linus,

please pull the latest x86/urgent branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-=
06-08

up to:  dd2922dcfaa3: fs/resctrl: Restore the rdt_last_cmd_clear() calls afte=
r acquiring rdtgroup_mutex


A small set of x86 fixes:

 - Cure IO bitmap inconsistencies

   A failed fork cleans up all resources of the newly created thread via
   exit_thread(). exit_thread() invokes io_bitmap_exit() which does the IO
   bitmap cleanups, which unfortunately assume that the cleanup is related
   to the current task, which is obviously bogus. Make it work correctly

 - A lockdep fix in the resctrl code removed the clearing of the command
   buffer in two places, which keeps stale error messages around. Bring
   them back.

 - Remove unused trace events


Thanks,

	tglx

------------------>
Steven Rostedt (1):
      x86/fpu: Remove unused trace events

Thomas Gleixner (1):
      x86/iopl: Cure TIF_IO_BITMAP inconsistencies

Zeng Heng (1):
      fs/resctrl: Restore the rdt_last_cmd_clear() calls after acquiring rdtg=
roup_mutex


 arch/x86/include/asm/trace/fpu.h | 15 ---------------
 arch/x86/kernel/ioport.c         | 13 +++++++++----
 arch/x86/kernel/process.c        |  6 ++++++
 fs/resctrl/rdtgroup.c            |  4 ++++
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/x86/include/asm/trace/fpu.h b/arch/x86/include/asm/trace/fp=
u.h
index 0454d5e60e5d..721b408d9a67 100644
--- a/arch/x86/include/asm/trace/fpu.h
+++ b/arch/x86/include/asm/trace/fpu.h
@@ -44,16 +44,6 @@ DEFINE_EVENT(x86_fpu, x86_fpu_after_save,
 	TP_ARGS(fpu)
 );
=20
-DEFINE_EVENT(x86_fpu, x86_fpu_before_restore,
-	TP_PROTO(struct fpu *fpu),
-	TP_ARGS(fpu)
-);
-
-DEFINE_EVENT(x86_fpu, x86_fpu_after_restore,
-	TP_PROTO(struct fpu *fpu),
-	TP_ARGS(fpu)
-);
-
 DEFINE_EVENT(x86_fpu, x86_fpu_regs_activated,
 	TP_PROTO(struct fpu *fpu),
 	TP_ARGS(fpu)
@@ -64,11 +54,6 @@ DEFINE_EVENT(x86_fpu, x86_fpu_regs_deactivated,
 	TP_ARGS(fpu)
 );
=20
-DEFINE_EVENT(x86_fpu, x86_fpu_init_state,
-	TP_PROTO(struct fpu *fpu),
-	TP_ARGS(fpu)
-);
-
 DEFINE_EVENT(x86_fpu, x86_fpu_dropped,
 	TP_PROTO(struct fpu *fpu),
 	TP_ARGS(fpu)
diff --git a/arch/x86/kernel/ioport.c b/arch/x86/kernel/ioport.c
index 6290dd120f5e..ff40f09ad911 100644
--- a/arch/x86/kernel/ioport.c
+++ b/arch/x86/kernel/ioport.c
@@ -33,8 +33,9 @@ void io_bitmap_share(struct task_struct *tsk)
 	set_tsk_thread_flag(tsk, TIF_IO_BITMAP);
 }
=20
-static void task_update_io_bitmap(struct task_struct *tsk)
+static void task_update_io_bitmap(void)
 {
+	struct task_struct *tsk =3D current;
 	struct thread_struct *t =3D &tsk->thread;
=20
 	if (t->iopl_emul =3D=3D 3 || t->io_bitmap) {
@@ -54,7 +55,12 @@ void io_bitmap_exit(struct task_struct *tsk)
 	struct io_bitmap *iobm =3D tsk->thread.io_bitmap;
=20
 	tsk->thread.io_bitmap =3D NULL;
-	task_update_io_bitmap(tsk);
+	/*
+	 * Don't touch the TSS when invoked on a failed fork(). TSS
+	 * reflects the state of @current and not the state of @tsk.
+	 */
+	if (tsk =3D=3D current)
+		task_update_io_bitmap();
 	if (iobm && refcount_dec_and_test(&iobm->refcnt))
 		kfree(iobm);
 }
@@ -192,8 +198,7 @@ SYSCALL_DEFINE1(iopl, unsigned int, level)
 	}
=20
 	t->iopl_emul =3D level;
-	task_update_io_bitmap(current);
-
+	task_update_io_bitmap();
 	return 0;
 }
=20
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index c1d2dac72b9c..704883c21f3a 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -176,6 +176,7 @@ int copy_thread(struct task_struct *p, const struct kerne=
l_clone_args *args)
 	frame->ret_addr =3D (unsigned long) ret_from_fork_asm;
 	p->thread.sp =3D (unsigned long) fork_frame;
 	p->thread.io_bitmap =3D NULL;
+	clear_tsk_thread_flag(p, TIF_IO_BITMAP);
 	p->thread.iopl_warn =3D 0;
 	memset(p->thread.ptrace_bps, 0, sizeof(p->thread.ptrace_bps));
=20
@@ -464,6 +465,11 @@ void native_tss_update_io_bitmap(void)
 	} else {
 		struct io_bitmap *iobm =3D t->io_bitmap;
=20
+		if (WARN_ON_ONCE(!iobm)) {
+			clear_thread_flag(TIF_IO_BITMAP);
+			native_tss_invalidate_io_bitmap();
+		}
+
 		/*
 		 * Only copy bitmap data when the sequence number differs. The
 		 * update time is accounted to the incoming task.
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index cc37f58b47dd..1beb124e25f6 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -536,6 +536,8 @@ static ssize_t rdtgroup_cpus_write(struct kernfs_open_fil=
e *of,
 		goto unlock;
 	}
=20
+	rdt_last_cmd_clear();
+
 	if (rdtgrp->mode =3D=3D RDT_MODE_PSEUDO_LOCKED ||
 	    rdtgrp->mode =3D=3D RDT_MODE_PSEUDO_LOCKSETUP) {
 		ret =3D -EINVAL;
@@ -3472,6 +3474,8 @@ static int mkdir_rdt_prepare(struct kernfs_node *parent=
_kn,
 		goto out_unlock;
 	}
=20
+	rdt_last_cmd_clear();
+
 	/*
 	 * Check that the parent directory for a monitor group is a "mon_groups"
 	 * directory.

