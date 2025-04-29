Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3722C3764
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909758; cv=none; b=lfIso4DKqEvtMDkJlWpkuv6R09ZS2+rYlxwT/LomNNxlTOGaq0LvHI22I8QNvqF+q6XAjsUDFYnYtkSxHd9/r30GAhIdrGUQD/MugEPFOf4muVZQFc1iLgslClzJ5n8BNCKSJBEqtjatMshNng/hMv7WjkLQ1TQcv9NQX5L1rF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909758; c=relaxed/simple;
	bh=A53lDnTtx1pSe4rB+QcTgrY2OTzmit0u8CfjoqN4b+4=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=rKtG/22GJS8edu98fcSUNuhsqkfQaRAPc0OfR8bMYbdVVcBaKD734DFAje/rFy2gUh0wgpy07Y8Mj6CNhffxb+w1grhvCTjiwATa65AlmPwzFG3gFAoLzoTs34eVUBwJK6bUT3/lqrtyy2AwCi8ihGbMtKffWdSWHr/Cf5+amB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=a64przSr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4zAxbean; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="a64przSr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4zAxbean"
Message-ID: <20250429065422.729586582@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745909755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=9e21ikF2knHkJivTgzjPtHpEHiTJHT9JB5QoqPVKPvw=;
	b=a64przSr0Pt8KY/e0kvyPioZh1C0J6Sqa4qwCnrQkSClZ7Ukd93CqAgki+l7up64o3qqGW
	UfHjYUNmyS6tsyDZALKDzWbgf1m+Taytd7EIqfhOQfTwXZ2RU+aSlFV9aj9uYyPbdWZgWK
	ZT6oEmMNos3Q4rn5BFNYj7gTlAo3aY+B9IT7geBr+6JNs9nswJajk3XxU0D6gZ/VsQD+tU
	SLPsC8MQAxbn6s1dGR/DR+Mdcp1zLF/+AMcIQRKHSyCtCTM73cqe3jkWdAk6rFMPh16xWr
	fDRFIGKyBFBE+vEiYBLT7e7R2G/0RhkGoEfstOkH72gXTbfCBhLET8ue9L4TqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745909755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=9e21ikF2knHkJivTgzjPtHpEHiTJHT9JB5QoqPVKPvw=;
	b=4zAxbeanjaBFDb2QfhHEiygmfDWtuJpgNBtaGeqwHhvTmFUqw9Lp6ZUsje+OstrI7KH1UF
	e1+zVhKtNVMRBoCw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [patch V2 45/45] genirq: Remove irq_[get|put]_desc*()
References: <20250429065337.117370076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 08:55:54 +0200 (CEST)

All users are converted to the guards. Remove the helpers.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 kernel/irq/internals.h |   24 ------------------------
 1 file changed, 24 deletions(-)

--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -191,30 +191,6 @@ static inline class_irqdesc_lock_t class
 
 #define scoped_irqdesc		((struct irq_desc *)(__guard_ptr(irqdesc_lock)(&scope)))
 
-static inline struct irq_desc *
-irq_get_desc_buslock(unsigned int irq, unsigned long *flags, unsigned int check)
-{
-	return __irq_get_desc_lock(irq, flags, true, check);
-}
-
-static inline void
-irq_put_desc_busunlock(struct irq_desc *desc, unsigned long flags)
-{
-	__irq_put_desc_unlock(desc, flags, true);
-}
-
-static inline struct irq_desc *
-irq_get_desc_lock(unsigned int irq, unsigned long *flags, unsigned int check)
-{
-	return __irq_get_desc_lock(irq, flags, false, check);
-}
-
-static inline void
-irq_put_desc_unlock(struct irq_desc *desc, unsigned long flags)
-{
-	__irq_put_desc_unlock(desc, flags, false);
-}
-
 #define __irqd_to_state(d) ACCESS_PRIVATE((d)->common, state_use_accessors)
 
 static inline unsigned int irqd_get(struct irq_data *d)

