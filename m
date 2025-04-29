Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35F82C2584
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909750; cv=none; b=iBHJ0Bu5aoWcOoa1aAyMAcLq9HLihHsKBRUjTj1QD9ydT9AEEWrSgfsmTJDj6Hx2fAWcXpc0Sr24ef0jOeRIEhGfpxEBvQmk7RO+3blovpqTg8cHGD4etMzYyI0/ZzoAA/yRDKyPMP4Ut9kXU9vxyepUVsn82yXexU1tGN89JR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909750; c=relaxed/simple;
	bh=2XxpC2RxhOA7srYB+U7Vp2rZuFSoscf2aU9AyMnU7b8=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=kddpEltkxGQpxrxBj4YLRTNdf1OoTR0NNb5RatrZr7bfDH5boqqHq598/AjIwECUrdc5kpz+6P4mWNOMYcISA1+oAk1bW5Zx6S57zq2gJC5GASnubxZbsjRNfyTKB9xPB6KzsMt5aZ63tEluj3RsCgwXh4r6FG64yj3Mq4gVndw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0Rbu3fzF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OiwUQlw2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0Rbu3fzF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OiwUQlw2"
Message-ID: <20250429065422.376836282@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=y0RQv0Usg6hq2Yp5lrhta5X/eMpx9K5AAvjl1AWK/n8=;
	b=0Rbu3fzFw7EIo3Mi5SR33dZmt3k0pbykzFBj/SmgivzDpBEnTg424CVlRfNgofGkQPe16o
	BRdTB0JGpiztLi2+2Qk+u/tgexQf7WqkocqVyVHNrZL7yX1VGJfC+rvdPndg/M9oKYYmB0
	x1K7DSGEkrS1x525WcmKy/TQ2pr35Rm1iw950JHRqk+4th0bbng/HavqfvXnQHSXuIKsBW
	k4+i6A0pwq20XgRnj/Dl1uknQrRTt30Jsrg/EjerAL4XWpVPhOavCQameDQw+JS5mQXC8V
	MQdCkUCCDAATaDINu9Z5oY8HYbpESbsHkCcpwW1ufzacnG/tc8MsEwNOTnuQ+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=y0RQv0Usg6hq2Yp5lrhta5X/eMpx9K5AAvjl1AWK/n8=;
	b=OiwUQlw2LMJzTqIDPLhoIpqd+Lz65KXZQR/BczY3P++XZDJ+BoQ1bgV7//2/3xWdgEQ9cH
	3bG4IyGvAhZEotAQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 39/45] genirq/manage: Rework irq_percpu_is_enabled()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:46 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/manage.c |   16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2321,19 +2321,9 @@ void enable_percpu_nmi(unsigned int irq,
  */
 bool irq_percpu_is_enabled(unsigned int irq)
 {
-	unsigned int cpu = smp_processor_id();
-	struct irq_desc *desc;
-	unsigned long flags;
-	bool is_enabled;
-
-	desc = irq_get_desc_lock(irq, &flags, IRQ_GET_DESC_CHECK_PERCPU);
-	if (!desc)
-		return false;
-
-	is_enabled = cpumask_test_cpu(cpu, desc->percpu_enabled);
-	irq_put_desc_unlock(desc, flags);
-
-	return is_enabled;
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_PERCPU)
+		return cpumask_test_cpu(smp_processor_id(), scoped_irqdesc->percpu_enabled);
+	return false;
 }
 EXPORT_SYMBOL_GPL(irq_percpu_is_enabled);
 



