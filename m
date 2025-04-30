Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EE01DE3BE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745995006; cv=none; b=qB05520UZEQauE3YU6lgQy6CyBS3w01iJMgdmH+aEZokPfIW8HnN9REf5gLUa4MGuJcA3PTbXalkwGwIQ+1WgxxaoErB+WLz91yiGxO41vL9f1GeA+4A0sUKoncW6hgqwWfuDHm6xw0E0jWp96XnO3FsJzaDm8nq9p9ahzuiUUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745995006; c=relaxed/simple;
	bh=s++kBQMUPR8STazuC3AVEzPBLPa903y0uKttqdRzob0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q6RoIHcfvci1mS3ixWlxp8JQT+cT3szTfuTExVt6erD1fVyspxgwX3119anEHVB+tkowtbnqGhivQHoZivDlWHtAlGYY/fndJC1BodqFPyhmOCq3d1TMMMGk8f3XTT56jVbocdb+wJiAEDVps19laELw+guPMW4EdCLfK1aLkkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pnMT08av; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Wdq57TC6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pnMT08av";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Wdq57TC6"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745995001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zD7ZBEoqaxTOJ7HvYYkOrI7JiWbq4HlzWrXmmIVARBc=;
	b=pnMT08aviRvpsxx3HYmPqcBsniHpekqCUQ/snT7ive8frC6aXhY8qSoUt0DGyYhq/n9DAf
	kMXifthAXzvf0hqx6A+Qpboc1BFGI/PeEabxaJMkVp2j11801+JCCd2dLnLiYBswnpWucj
	RzozAbbWqtlIeDfJrP+5ayHRtWc5iXJe+T2PWYrBUA1HnciJ9NkP3pkSg1tc5tCUuXwDjr
	12UEOtgL1ANSyzh1aIv644c/A7lQVEZux+FFB/nUYGpHHXrudKiU+PfrZsM7CAJRa0bIyT
	rEvHoQro/lpjvBFIEp6XCTHmWdFdJtMLSHFURdDGuXZ7WWNjqNd3bYUAsldGEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745995001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zD7ZBEoqaxTOJ7HvYYkOrI7JiWbq4HlzWrXmmIVARBc=;
	b=Wdq57TC6s0QAQfBQrSFVWT3fAHTYHx5unj98uaMxZAcsH7QA1yZqpyaniXO0BnlFn+btSt
	WO6EMOF0ayA1M/CQ==
To: Jiri Slaby <jirislaby@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2a 02/45] genirq/irqdesc: Switch to lock guards
In-Reply-To: <b566459c-b0b6-4019-8231-04d246f07b0d@kernel.org>
References: <20250429065337.117370076@linutronix.de>
 <20250429065420.125439431@linutronix.de>
 <b566459c-b0b6-4019-8231-04d246f07b0d@kernel.org>
Date: Wed, 30 Apr 2025 08:36:39 +0200
Message-ID: <871ptaqhoo.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Replace all lock/unlock pairs with lock guards and simplify the code flow.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2a: Fixup the stub function too - Jiry
---
 kernel/irq/irqdesc.c |  129 +++++++++++++++++----------------------------------
 1 file changed, 44 insertions(+), 85 deletions(-)

--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -246,8 +246,7 @@ static struct kobject *irq_kobj_base;
 #define IRQ_ATTR_RO(_name) \
 static struct kobj_attribute _name##_attr = __ATTR_RO(_name)
 
-static ssize_t per_cpu_count_show(struct kobject *kobj,
-				  struct kobj_attribute *attr, char *buf)
+static ssize_t per_cpu_count_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
 	ssize_t ret = 0;
@@ -266,99 +265,75 @@ static ssize_t per_cpu_count_show(struct
 }
 IRQ_ATTR_RO(per_cpu_count);
 
-static ssize_t chip_name_show(struct kobject *kobj,
-			      struct kobj_attribute *attr, char *buf)
+static ssize_t chip_name_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
-	ssize_t ret = 0;
 
-	raw_spin_lock_irq(&desc->lock);
+	guard(raw_spinlock_irq)(&desc->lock);
 	if (desc->irq_data.chip && desc->irq_data.chip->name)
-		ret = sysfs_emit(buf, "%s\n", desc->irq_data.chip->name);
-	raw_spin_unlock_irq(&desc->lock);
-
-	return ret;
+		return sysfs_emit(buf, "%s\n", desc->irq_data.chip->name);
+	return 0;
 }
 IRQ_ATTR_RO(chip_name);
 
-static ssize_t hwirq_show(struct kobject *kobj,
-			  struct kobj_attribute *attr, char *buf)
+static ssize_t hwirq_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
-	ssize_t ret = 0;
 
+	guard(raw_spinlock_irq)(&desc->lock);
 	raw_spin_lock_irq(&desc->lock);
 	if (desc->irq_data.domain)
-		ret = sysfs_emit(buf, "%lu\n", desc->irq_data.hwirq);
-	raw_spin_unlock_irq(&desc->lock);
-
-	return ret;
+		return sysfs_emit(buf, "%lu\n", desc->irq_data.hwirq);
+	return 0;
 }
 IRQ_ATTR_RO(hwirq);
 
-static ssize_t type_show(struct kobject *kobj,
-			 struct kobj_attribute *attr, char *buf)
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
-	ssize_t ret = 0;
 
-	raw_spin_lock_irq(&desc->lock);
-	ret = sysfs_emit(buf, "%s\n", irqd_is_level_type(&desc->irq_data) ? "level" : "edge");
-	raw_spin_unlock_irq(&desc->lock);
-
-	return ret;
+	guard(raw_spinlock_irq)(&desc->lock);
+	return sysfs_emit(buf, "%s\n", irqd_is_level_type(&desc->irq_data) ? "level" : "edge");
 
 }
 IRQ_ATTR_RO(type);
 
-static ssize_t wakeup_show(struct kobject *kobj,
-			   struct kobj_attribute *attr, char *buf)
+static ssize_t wakeup_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
-	ssize_t ret = 0;
-
-	raw_spin_lock_irq(&desc->lock);
-	ret = sysfs_emit(buf, "%s\n", str_enabled_disabled(irqd_is_wakeup_set(&desc->irq_data)));
-	raw_spin_unlock_irq(&desc->lock);
-
-	return ret;
 
+	guard(raw_spinlock_irq)(&desc->lock);
+	return sysfs_emit(buf, "%s\n", str_enabled_disabled(irqd_is_wakeup_set(&desc->irq_data)));
 }
 IRQ_ATTR_RO(wakeup);
 
-static ssize_t name_show(struct kobject *kobj,
-			 struct kobj_attribute *attr, char *buf)
+static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
-	ssize_t ret = 0;
 
-	raw_spin_lock_irq(&desc->lock);
+	guard(raw_spinlock_irq)(&desc->lock);
 	if (desc->name)
-		ret = sysfs_emit(buf, "%s\n", desc->name);
-	raw_spin_unlock_irq(&desc->lock);
-
-	return ret;
+		return sysfs_emit(buf, "%s\n", desc->name);
+	return 0;
 }
 IRQ_ATTR_RO(name);
 
-static ssize_t actions_show(struct kobject *kobj,
-			    struct kobj_attribute *attr, char *buf)
+static ssize_t actions_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
 	struct irqaction *action;
 	ssize_t ret = 0;
 	char *p = "";
 
-	raw_spin_lock_irq(&desc->lock);
-	for_each_action_of_desc(desc, action) {
-		ret += sysfs_emit_at(buf, ret, "%s%s", p, action->name);
-		p = ",";
+	scoped_guard(raw_spinlock_irq, &desc->lock) {
+		for_each_action_of_desc(desc, action) {
+			ret += sysfs_emit_at(buf, ret, "%s%s", p, action->name);
+			p = ",";
+		}
 	}
-	raw_spin_unlock_irq(&desc->lock);
 
 	if (ret)
 		ret += sysfs_emit_at(buf, ret, "\n");
-
 	return ret;
 }
 IRQ_ATTR_RO(actions);
@@ -414,19 +389,14 @@ static int __init irq_sysfs_init(void)
 	int irq;
 
 	/* Prevent concurrent irq alloc/free */
-	irq_lock_sparse();
-
+	guard(mutex)(&sparse_irq_lock);
 	irq_kobj_base = kobject_create_and_add("irq", kernel_kobj);
-	if (!irq_kobj_base) {
-		irq_unlock_sparse();
+	if (!irq_kobj_base)
 		return -ENOMEM;
-	}
 
 	/* Add the already allocated interrupts */
 	for_each_irq_desc(irq, desc)
 		irq_sysfs_add(irq, desc);
-	irq_unlock_sparse();
-
 	return 0;
 }
 postcore_initcall(irq_sysfs_init);
@@ -569,12 +539,12 @@ static int alloc_descs(unsigned int star
 	return -ENOMEM;
 }
 
-static int irq_expand_nr_irqs(unsigned int nr)
+static bool irq_expand_nr_irqs(unsigned int nr)
 {
 	if (nr > MAX_SPARSE_IRQS)
-		return -ENOMEM;
+		return false;
 	nr_irqs = nr;
-	return 0;
+	return true;
 }
 
 int __init early_irq_init(void)
@@ -652,11 +622,9 @@ EXPORT_SYMBOL(irq_to_desc);
 static void free_desc(unsigned int irq)
 {
 	struct irq_desc *desc = irq_to_desc(irq);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&desc->lock, flags);
-	desc_set_defaults(irq, desc, irq_desc_get_node(desc), NULL, NULL);
-	raw_spin_unlock_irqrestore(&desc->lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &desc->lock)
+		desc_set_defaults(irq, desc, irq_desc_get_node(desc), NULL, NULL);
 	delete_irq_desc(irq);
 }
 
@@ -675,16 +643,15 @@ static inline int alloc_descs(unsigned i
 	return start;
 }
 
-static int irq_expand_nr_irqs(unsigned int nr)
+static inline bool irq_expand_nr_irqs(unsigned int nr)
 {
-	return -ENOMEM;
+	return false;
 }
 
 void irq_mark_irq(unsigned int irq)
 {
-	mutex_lock(&sparse_irq_lock);
+	guard(mutex)(&sparse_irq_lock);
 	irq_insert_desc(irq, irq_desc + irq);
-	mutex_unlock(&sparse_irq_lock);
 }
 
 #ifdef CONFIG_GENERIC_IRQ_LEGACY
@@ -823,11 +790,9 @@ void irq_free_descs(unsigned int from, u
 	if (from >= nr_irqs || (from + cnt) > nr_irqs)
 		return;
 
-	mutex_lock(&sparse_irq_lock);
+	guard(mutex)(&sparse_irq_lock);
 	for (i = 0; i < cnt; i++)
 		free_desc(from + i);
-
-	mutex_unlock(&sparse_irq_lock);
 }
 EXPORT_SYMBOL_GPL(irq_free_descs);
 
@@ -844,11 +809,10 @@ EXPORT_SYMBOL_GPL(irq_free_descs);
  *
  * Returns the first irq number or error code
  */
-int __ref
-__irq_alloc_descs(int irq, unsigned int from, unsigned int cnt, int node,
-		  struct module *owner, const struct irq_affinity_desc *affinity)
+int __ref __irq_alloc_descs(int irq, unsigned int from, unsigned int cnt, int node,
+			    struct module *owner, const struct irq_affinity_desc *affinity)
 {
-	int start, ret;
+	int start;
 
 	if (!cnt)
 		return -EINVAL;
@@ -866,22 +830,17 @@ int __ref
 		from = arch_dynirq_lower_bound(from);
 	}
 
-	mutex_lock(&sparse_irq_lock);
+	guard(mutex)(&sparse_irq_lock);
 
 	start = irq_find_free_area(from, cnt);
-	ret = -EEXIST;
 	if (irq >=0 && start != irq)
-		goto unlock;
+		return -EEXIST;
 
 	if (start + cnt > nr_irqs) {
-		ret = irq_expand_nr_irqs(start + cnt);
-		if (ret)
-			goto unlock;
+		if (!irq_expand_nr_irqs(start + cnt))
+			return -ENOMEM;
 	}
-	ret = alloc_descs(start, cnt, node, affinity, owner);
-unlock:
-	mutex_unlock(&sparse_irq_lock);
-	return ret;
+	return alloc_descs(start, cnt, node, affinity, owner);
 }
 EXPORT_SYMBOL_GPL(__irq_alloc_descs);
 
