Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C4928D850
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909706; cv=none; b=LdkCP5bpfzkUIyFpgH6+spufGeLPQl9bJB9AYWrCTAhjH1HG6Ne5y4IOigNjIVBopFtbfeGX/gyA+KwS9ntln5onxnXPX3lNH9AM7RDGpm5owmG2hkpNeyzEpDRoLmI7oA4l9uKJaLc4n+pfiZ2e1IYQZuXFc3TH3bN+INsy23M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909706; c=relaxed/simple;
	bh=Dxk9kviW1jE9kunPeDh6mO84LJh/7jpiB8henybvJHs=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=jwnqtGAwDiM4beXGQUDQ0OD6GxfpFVIkrHOnf5S7RCTMJbt6tL+jX9jPnjhLwJ7JZpbR/nb778wfq2D1PClqHOVeU8KpacJZ/WcYulsFpnhXsaZcJ9DJ2nOLeEXUk4vMM2qfvhtI+ok0uLHsxNEs2AmylMx8tuxROSpRzHP2Nok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KQFs9uhr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0F7ND3TF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KQFs9uhr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0F7ND3TF"
Message-ID: <20250429065420.620200108@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=XaBNorVPoQIjdihkTL64MEhNSumYpX6J1+eefUBdUaU=;
	b=KQFs9uhrhdp6z9AN/N/HPXZp6Oib8v7xrW9JMYfZfCayDSvx6n8BvZTDXoG2Ai2kIRGE1N
	QouJvD8V7/wsl8/3uN6ffL4MLpStR4HaBcNF9T40Gg9h2sLJLknW4u9u3CSRm2RxNekO2V
	60hrRk4cE4fxU74h6FYmbhtW0zwW9enP3ORnoXFVqQRRhFibXsg1snkpsceZjdOfWUKWm1
	SM79gcnCGtyk53EMx9+zcGYBcPdVjTUFDfjUfgOwV545q6yABF26d6hCFf+7TZ2Yh5PXvo
	oM//ufvnTykDG9UWzqjRdNFTYzbn7ns0ys7/ttcgc9jQi7XIHYAUV6TbVzzFGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=XaBNorVPoQIjdihkTL64MEhNSumYpX6J1+eefUBdUaU=;
	b=0F7ND3TFEhU66q6z3PeU5e7pVfwHfa1rkvikn4DDym/BA7kVx7CehvkTgO9e28vFpYYjTv
	9Dq3GJzjKjI06UAQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 10/45] genirq/debugfs: Convert to lock guards
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:02 +0200 (CEST)

Convert all lock/unlock pairs to guards and tidy up the code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/debugfs.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/kernel/irq/debugfs.c
+++ b/kernel/irq/debugfs.c
@@ -160,7 +160,7 @@ static int irq_debug_show(struct seq_fil
 	struct irq_desc *desc = m->private;
 	struct irq_data *data;
 
-	raw_spin_lock_irq(&desc->lock);
+	guard(raw_spinlock_irq)(&desc->lock);
 	data = irq_desc_get_irq_data(desc);
 	seq_printf(m, "handler:  %ps\n", desc->handle_irq);
 	seq_printf(m, "device:   %s\n", desc->dev_name);
@@ -178,7 +178,6 @@ static int irq_debug_show(struct seq_fil
 	seq_printf(m, "node:     %d\n", irq_data_get_node(data));
 	irq_debug_show_masks(m, desc);
 	irq_debug_show_data(m, data, 0);
-	raw_spin_unlock_irq(&desc->lock);
 	return 0;
 }
 



