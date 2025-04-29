Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7252C1092
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909740; cv=none; b=ceQYPXoSf3byecETjQmmwCRYD+ArBYWdiH/NXZltHA00C/5h74ILMpRS+bZOtXZ0K9ch3D6u07ul8P/3Nf/LzXtOYunw9/Uf0RzNEDKrTgbrkQyWr2Jk5WJBE0rO/uMrYp0qK8/wdZVXZQNQ0JHwQlQ10cFrnc7izmYoVesyjV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909740; c=relaxed/simple;
	bh=rCH7D3YVndEYHBTKqPrNqC8oHb9QQzzNUIxTqgLAkRQ=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=Gzi9qzY8pJ+Oa/iuxxrE0YpynWiXDy8v8pGz5/mpMGCEGLkHz9NmjZUBinize1X/ZBbGib7OJbi6zG8f3gJZ8LoJf18O0zGMq1iL+eou7BLd/uediJPT8dvNI41RTpPkjlebLNNX/+oEB9DweYWXqDM/qoDgXkeVcriJtgqGpm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IE7dhnHS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AJVnwbAE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IE7dhnHS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AJVnwbAE"
Message-ID: <20250429065422.013088277@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=mixybEw9e+vbXEPkKLLg2DsKs+WX44nTeRjKqscHOG4=;
	b=IE7dhnHSGujZHuosb/hG6Ajo1vS7CrXe2i2XlErtruH/qOA/rE/ZSB/yt6lPJT2Ui1wW6m
	I396DBprNiGj5Xzq7AnisIs/YV+hlFLsLkkTgjPi0lKaAuNfEjGM3foA9AJf0BuVR2uQGF
	H7LWk/06+V/VN67latoD2uqYkTf0LafBlwuixoLlz6K7myzVAlKYKdTQ+I3u/zoHJgvzeg
	7ocdfMyuWnxUee9fMKo3FdkSgxdOm5WZWcLSTk3fpRHGh68zm72HRqbFipxSvMUtzoh96N
	qxrRn9UTsTlTPvg+AmNhK8rHXVtryiy3gBpMN0J5WyknIIKS1eqKal7f9JtZFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=mixybEw9e+vbXEPkKLLg2DsKs+WX44nTeRjKqscHOG4=;
	b=AJVnwbAEqbw7j4sw1slhr764QYPY+a5/W4j696YK3HIllVsvmuGVamvTvz/EKi+J5+gUKQ
	JysFUrpyzK5jnAAQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 33/45] genirq/manage: Rework __disable_irq_nosync()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:37 +0200 (CEST)

Use the new guards to get and lock the interrupt descriptor and tidy up the
code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/manage.c |   13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -658,14 +658,11 @@ void __disable_irq(struct irq_desc *desc
 
 static int __disable_irq_nosync(unsigned int irq)
 {
-	unsigned long flags;
-	struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
-
-	if (!desc)
-		return -EINVAL;
-	__disable_irq(desc);
-	irq_put_desc_busunlock(desc, flags);
-	return 0;
+	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+		__disable_irq(scoped_irqdesc);
+		return 0;
+	}
+	return -EINVAL;
 }
 
 /**



