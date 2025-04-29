Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B128278170
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909700; cv=none; b=rCJT/7zvhN2lRgDI1rfveoOLLWDJ/4nsQV78sGwSuG7rEgUrfpIc9i/6wsZEB2xC5WATcSZezhgB0Yn5BaaE6GGtRPYz0N2UyXE5AGe3IF/k7Rx0TVSyQgDsLhV/Y0i/gIagtUO5jpnc9hm9BpSmQNtKjnB7VLak9q5oL5RqqOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909700; c=relaxed/simple;
	bh=BWVRW9YA5cTKoCcGVsxNlU8n1clFrzbVU2pWay4GD/k=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=JZoMWDGMr9vbIZlctWHnfzkj7ZQTXqFCMr3/9tulqw3svYuyRxajsVMqFiQB85Edcl++IEtAVS+g1UruZhcRPSnvU/tVf/T0IsZwcmEwFMkwzhdJK92CuorDl+FMMS5HMQVDsn8A0QQoxeUBOLfVcKmhIJlmq4mVSoSh9ljU2pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2JWA+rR6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vJQo7D06; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2JWA+rR6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vJQo7D06"
Message-ID: <20250429065420.061659985@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=8wB5bfUxsIJlccvcP/91E0ttQd1d4YLJbnfb/Vr+Klg=;
	b=2JWA+rR6h2drRLE6gM2WioHseeMQH6z76rUbb0urwyKCKCXAqEw5i60PgSIB3kov2p/jnm
	Bwuiw89TR9gznCbjuXNZhOKZJAOxusKSk4R3hDNPlXczge/wyq44x2f5W198EFP/RLgj3k
	UXZlou2hjnyrFx/PAdmgf9cczgaFA0KsLCrc4TmnkyvAA/LpOcI/r8ZucTEJMlop2FDbVb
	yDatqQCaq0G+/DFRTN+n0+rFoJeSw9XrJjlcMeTmJ0MzSc9WeXo7RCTyTf7G7qwy7S0cDb
	xAfMBaB1+EK2Zh84HyWzMM6M/KXM0MnjQdIdlnglR8co72U+tP6hhPDaOB8tMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=8wB5bfUxsIJlccvcP/91E0ttQd1d4YLJbnfb/Vr+Klg=;
	b=vJQo7D06i+KPtlm2WvIAiPfPgVXz0jAyK2OXY+GSmu6nxxCubkWaGgIiAwqSr2bBwbSesH
	mEWawn8Qx0Ut/5Ag==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 01/45] genirq: Provide conditional lock guards
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:54:49 +0200 (CEST)

The interrupt core code has an ever repeating pattern:

    unsigned long flags;
    struct irq_desc *desc = irq_get_desc_[bus]lock(irq, &flags, mode);

    if (!desc)
       return -EINVAL;
    ....
    irq_put_desc_[bus]unlock(desc, flags);

That requires gotos in failure paths and just creates visual clutter.

Provide lock guards, which allow to simplify the code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jiri Slaby <jirislaby@kernel.org>

---
 kernel/irq/internals.h |   35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -141,6 +141,10 @@ extern int irq_setup_affinity(struct irq
 static inline int irq_setup_affinity(struct irq_desc *desc) { return 0; }
 #endif
 
+
+#define for_each_action_of_desc(desc, act)			\
+	for (act = desc->action; act; act = act->next)
+
 /* Inline functions for support of irq chips on slow busses */
 static inline void chip_bus_lock(struct irq_desc *desc)
 {
@@ -160,14 +164,33 @@ static inline void chip_bus_sync_unlock(
 #define IRQ_GET_DESC_CHECK_GLOBAL	(_IRQ_DESC_CHECK)
 #define IRQ_GET_DESC_CHECK_PERCPU	(_IRQ_DESC_CHECK | _IRQ_DESC_PERCPU)
 
-#define for_each_action_of_desc(desc, act)			\
-	for (act = desc->action; act; act = act->next)
-
-struct irq_desc *
-__irq_get_desc_lock(unsigned int irq, unsigned long *flags, bool bus,
-		    unsigned int check);
+struct irq_desc *__irq_get_desc_lock(unsigned int irq, unsigned long *flags, bool bus,
+				     unsigned int check);
 void __irq_put_desc_unlock(struct irq_desc *desc, unsigned long flags, bool bus);
 
+__DEFINE_CLASS_IS_CONDITIONAL(irqdesc_lock, true);
+__DEFINE_UNLOCK_GUARD(irqdesc_lock, struct irq_desc,
+		      __irq_put_desc_unlock(_T->lock, _T->flags, _T->bus),
+		      unsigned long flags; bool bus);
+
+static inline class_irqdesc_lock_t class_irqdesc_lock_constructor(unsigned int irq, bool bus,
+								  unsigned int check)
+{
+	class_irqdesc_lock_t _t = {
+		.bus	= bus,
+		.lock	= __irq_get_desc_lock(irq, &_t.flags, bus, check),
+	};
+	return _t;
+}
+
+#define scoped_irqdesc_get_and_lock(_irq, _check)		\
+	scoped_guard(irqdesc_lock, _irq, false, _check)
+
+#define scoped_irqdesc_get_and_buslock(_irq, _check)		\
+	scoped_guard(irqdesc_lock, _irq, true, _check)
+
+#define scoped_irqdesc		((struct irq_desc *)(__guard_ptr(irqdesc_lock)(&scope)))
+
 static inline struct irq_desc *
 irq_get_desc_buslock(unsigned int irq, unsigned long *flags, unsigned int check)
 {

