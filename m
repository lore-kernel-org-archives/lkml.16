Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA0B19D062
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738869541; cv=none; b=S7Xp2AiCJyCxxm1ErlkpukVy2zE40plKhLYUfnzlgpvny0KUCbXqTkkwEMNaRPrYzG5ebJmTAjo+wVjozX7JxQxDIz9T1zGMPoOyMhLU/O1lecdG8dnYaLldFMb4+eFmDgrlh1jvK+HVRnl8jMS4M2pZaj16K12l3j8przEg47s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738869541; c=relaxed/simple;
	bh=NwhX1KnHyxjMGDH/lr4c6VEN2bxPU+NP0pnTfAFejxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EqbCjNZHS/1FLx3W508AKXWlBeFt1j//kZWw+osQN34n/MG8SohvQz2LubBNjZjNIBjAaMTrPWyTZnQhyvHTCYutzcsBQNmu9bvSiRxHkF+p3LclxZjrG7zd2lK6KQJnpBSZRfc74S3CXBXRMwHHp3p+CyVk4FoOWGRCs4pmex0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ErB0Q8Qy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ErB0Q8Qy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738869538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EEQf7ryYSSLimnHt06zLnX/5wHpNkn2LEDmn102ciEw=;
	b=ErB0Q8QyX2trVGB9HcpK2C1L3v8fKVR+Zb44jsvre5H1gvdWNrEc0Q2MKbHKISwmOpMq32
	/EePsj+8M3gFt+EGRDxSfa4m9tRDFKewWgvMdKqezXgBmFkKpdXDuKICCM11cthKmc0Bkp
	ah9WUhEjw3sqI5AVPEKE5TomVCb/aMM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-249-CrcOZk4BO1uMRSFJ4oT-BA-1; Thu,
 06 Feb 2025 14:18:55 -0500
X-MC-Unique: CrcOZk4BO1uMRSFJ4oT-BA-1
X-Mimecast-MFC-AGG-ID: CrcOZk4BO1uMRSFJ4oT-BA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CD1FD195604F;
	Thu,  6 Feb 2025 19:18:53 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.64.158])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4158019560AE;
	Thu,  6 Feb 2025 19:18:50 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rik van Riel <riel@surriel.com>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v5] x86/nmi: Add an emergency handler in nmi_desc & use it in nmi_shootdown_cpus()
Date: Thu,  6 Feb 2025 14:18:44 -0500
Message-ID: <20250206191844.131700-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Depending on the type of panics, it was found that the
__register_nmi_handler() function can be called in NMI context from
nmi_shootdown_cpus() leading to a lockdep splat like the following.

  WARNING: inconsistent lock state
  inconsistent {INITIAL USE} -> {IN-NMI} usage.

   lock(&nmi_desc[0].lock);
   <Interrupt>
     lock(&nmi_desc[0].lock);

  Call Trace:
    _raw_spin_lock_irqsave
    __register_nmi_handler
    nmi_shootdown_cpus
    kdump_nmi_shootdown_cpus
    native_machine_crash_shutdown
    __crash_kexec

In this particular case, the following panic message was printed before.

  Kernel panic - not syncing: Fatal hardware error!

This message seemed to be given out from __ghes_panic() running in
NMI context.

The __register_nmi_handler() function which takes the nmi_desc lock
with irq disabled shouldn't be called from NMI context as this can
lead to deadlock.

The nmi_shootdown_cpus() function can only be invoked once. After the
first invocation, all other CPUs should be stuck in the newly added
crash_nmi_callback() and cannot respond to a second NMI.

Fix it by adding a new emergency NMI handler to the nmi_desc
structure and provide a new set_emergency_nmi_handler() helper to set
crash_nmi_callback() in any context. The new emergency handler will
preempt other handlers in the linked list. That will eliminate the need
to take any lock and serve the panic in NMI use case.

Signed-off-by: Waiman Long <longman@redhat.com>
Acked-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/include/asm/nmi.h |  2 ++
 arch/x86/kernel/nmi.c      | 42 ++++++++++++++++++++++++++++++++++++++
 arch/x86/kernel/reboot.c   | 10 +++------
 3 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/nmi.h b/arch/x86/include/asm/nmi.h
index 41a0ebb699ec..f677382093f3 100644
--- a/arch/x86/include/asm/nmi.h
+++ b/arch/x86/include/asm/nmi.h
@@ -56,6 +56,8 @@ int __register_nmi_handler(unsigned int, struct nmiaction *);
 
 void unregister_nmi_handler(unsigned int, const char *);
 
+void set_emergency_nmi_handler(unsigned int type, nmi_handler_t handler);
+
 void stop_nmi(void);
 void restart_nmi(void);
 void local_touch_nmi(void);
diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index ed163c8c8604..9a95d00f1423 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -40,8 +40,12 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/nmi.h>
 
+/*
+ * An emergency handler can be set in any context including NMI
+ */
 struct nmi_desc {
 	raw_spinlock_t lock;
+	nmi_handler_t emerg_handler;
 	struct list_head head;
 };
 
@@ -132,9 +136,22 @@ static void nmi_check_duration(struct nmiaction *action, u64 duration)
 static int nmi_handle(unsigned int type, struct pt_regs *regs)
 {
 	struct nmi_desc *desc = nmi_to_desc(type);
+	nmi_handler_t ehandler;
 	struct nmiaction *a;
 	int handled=0;
 
+	/*
+	 * Call the emergency handler, if set
+	 *
+	 * In the case of crash_nmi_callback() emergency handler, it will
+	 * return in the case of the crashing CPU to enable it to complete
+	 * other necessary crashing actions ASAP. Other handlers in the
+	 * linked list won't need to be run.
+	 */
+	ehandler = desc->emerg_handler;
+	if (ehandler)
+		return ehandler(type, regs);
+
 	rcu_read_lock();
 
 	/*
@@ -224,6 +241,31 @@ void unregister_nmi_handler(unsigned int type, const char *name)
 }
 EXPORT_SYMBOL_GPL(unregister_nmi_handler);
 
+/**
+ * set_emergency_nmi_handler - Set emergency handler
+ * @type:    NMI type
+ * @handler: the emergency handler to be stored
+ *
+ * Set an emergency NMI handler which, if set, will preempt all the other
+ * handlers in the linked list. If a NULL handler is passed in, it will clear
+ * it. It is expected that concurrent calls to this function will not happen
+ * or the system is screwed beyond repair.
+ */
+void set_emergency_nmi_handler(unsigned int type, nmi_handler_t handler)
+{
+	struct nmi_desc *desc = nmi_to_desc(type);
+
+	if (WARN_ON_ONCE(desc->emerg_handler == handler))
+		return;
+	desc->emerg_handler = handler;
+
+	/*
+	 * Ensure the emergency handler is visible to other CPUs before
+	 * function return
+	 */
+	smp_wmb();
+}
+
 static void
 pci_serr_error(unsigned char reason, struct pt_regs *regs)
 {
diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index dc1dd3f3e67f..9aaac1f9f45b 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -926,15 +926,11 @@ void nmi_shootdown_cpus(nmi_shootdown_cb callback)
 	shootdown_callback = callback;
 
 	atomic_set(&waiting_for_crash_ipi, num_online_cpus() - 1);
-	/* Would it be better to replace the trap vector here? */
-	if (register_nmi_handler(NMI_LOCAL, crash_nmi_callback,
-				 NMI_FLAG_FIRST, "crash"))
-		return;		/* Return what? */
+
 	/*
-	 * Ensure the new callback function is set before sending
-	 * out the NMI
+	 * Set emergency handler to preempt other handlers.
 	 */
-	wmb();
+	set_emergency_nmi_handler(NMI_LOCAL, crash_nmi_callback);
 
 	apic_send_IPI_allbutself(NMI_VECTOR);
 
-- 
2.48.1

