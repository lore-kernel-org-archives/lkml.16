Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243561E515
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909695; cv=none; b=ubd+B5Fn/cbN9Bkjrg93B1jV530cuuGhqaPxeUFOmFhQ9hAqOlqhWIWa/Z8o9tAbHEEgY30YJpokyiX2HTmtx6WI9JSfe0IOxx4UEZzTQRUJmrIQ3+dmxvwJucp920uoRTTMO78ffuNAut83FMumFgTF7SIn4dfoALwjmmk3Q20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909695; c=relaxed/simple;
	bh=AvMfWLvTTNlSaZzhYJRzJ22Y5akNCKwEDl/ms22zTVU=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=XcZ6+n+DJDjbEUlxZMOQLNfZfJ4s/PKXZRzVcppuYrreUorvaHkquwqxW1J/fBVjx2LgUQOZHKiEK5diXtZPAZQM7K8zSfX6Cd4XCjCx+p/1KlIT2hh1k4z01320thVuxLhNDKLv7pbfqj+mDQ3OxjY+A1p4lphM7y2Od/qIpZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VeKO/AHP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8CthQKMc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VeKO/AHP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8CthQKMc"
Message-ID: <20250429065420.125439431@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=dzosJNCvmzKIX9RdmCBoR9wrniXmPjUK+yULOxcvuuE=;
	b=VeKO/AHPNroIZTKJ5iP49KHuGZDccYESayyG87yQrtH0RH76kREPD9E82VFb4Wt4E2QyPE
	7xJmWpKVTkAKwocyw34yq0g/e5of6zwqK7ZJbRz6y0+kqO4Rdidmk3bKE3Kj7njU00/bbX
	L8/UIBe/Jglv5PmDIZN2FFNuPtO1E1Rrusa4aVSE5oxhHbTesPKd4jYIXsFqdcFzjdXcTW
	rj09ioYHN4IwsIbAEtzAYdKKXMlx9hQ70x4YVuOsT1XqvpaBse2sRsFf3ubVXPiU4rB4Ju
	RHwYuC1bGdrt7NfQp86fNFUXNr/7E4u08U1e2DRx0gsAkdlFj3nbCUbXeQWkNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=dzosJNCvmzKIX9RdmCBoR9wrniXmPjUK+yULOxcvuuE=;
	b=8CthQKMcLK7Pt9tLeSJfrWQluJfOf2GiwZAEr7PJNCiGoRdq+3iyW5Z2bGS4y62nyrfoJz
	mXVT6Dui6fU/P2Bg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 02/45] genirq/irqdesc: Switch to lock guards
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:54:50 +0200 (CEST)

Replace all lock/unlock pairs with lock guards and simplify the code flow.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/irqdesc.c |  127 +++++++++++++++++----------------------------------
 1 file changed, 43 insertions(+), 84 deletions(-)

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
-
-	raw_spin_lock_irq(&desc->lock);
-	ret = sysfs_emit(buf, "%s\n", irqd_is_level_type(&desc->irq_data) ? "level" : "edge");
-	raw_spin_unlock_irq(&desc->lock);
 
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
 
@@ -677,14 +645,13 @@ static inline int alloc_descs(unsigned i
 
 static int irq_expand_nr_irqs(unsigned int nr)
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
 

