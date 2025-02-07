Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71E5194C6A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738962974; cv=none; b=OW22L1/U4frHEreVRbAgo2O+QURY0psOZpNM+vJi5JMSEabF1WSKP4PoPBWI2BzadMytBdmk0aM6z1KJFG6sjh4mZTtCKNFDGd41voynXyJRtdQFjjhO+4tSjjtC5dUCcehcx6DvgjO1jTXjX4/CpaAjPcQ8PvXxcQgIeEU9YLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738962974; c=relaxed/simple;
	bh=wAB8wrAH27a054btGvkYTtyL9HVh//P5TEAeDQMMsOk=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SwI8Rv0qKRG95tRlfjU4zX/b/jCTXuItbMGkKJNklgcZTnXcaeJkDonoN7JKTTMLTms6Ais0tl9ZWQ+3YYsTQGMBTj9PYP9YB0gHa7U2D1EMsIfMjgAm9yRRn+oAlO9XSee6UmByTEtmedM7Z6N6aX736KT1+vsxZE2V2SRoVvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GlpHsWaV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nMt1Adce; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GlpHsWaV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nMt1Adce"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738962970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dPIsYcEi7cL0vy+2BbDAVB8vWVCujcidKi+brvoAQmo=;
	b=GlpHsWaV9m4kdbutFVe07rVOKeMoXwVArr2NlnjJyQjG4xSCVxCH40EJb1oqoH5WykV+N3
	NxQqck20+olhXehmxQ76fz+68aMHXhaD3SFtQ3N0uqAS5ys1Zx8TFbs7YxUGLZCyRyxRc0
	6dmILWZS6AeHESurQJdt2idmqTyPRK+ayKor2gh88SV8m9dmwx9yOiAOVzi2kXYcBWalux
	uFeB5GP8ODCBMvcuBGiK1meiclYwzXBx8js9KyTMHkrFEm9RA8VdZUDO69VbQCL7FvY3PZ
	qGwH+DnWal/2HBO2xyVLMtBe0MdEpQ5hgCKc8dvYjacG8Dejz4NEIkUGsmQfQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738962970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dPIsYcEi7cL0vy+2BbDAVB8vWVCujcidKi+brvoAQmo=;
	b=nMt1Adce0mCt6DpmpnjxTOiPeulRl68LxvEkxCKz2gTvTCmo9hhweKsQPoMHiW19JkGiN/
	2H7GgwsZFctXBLAQ==
To: Jens Axboe <axboe@kernel.dk>, Nam Cao <namcao@linutronix.de>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] hrtimers: Make hrtimer_update_function() less expensive
In-Reply-To: <ad55978e-4356-494e-8cda-9e6487344768@kernel.dk>
References: <cover.1738746927.git.namcao@linutronix.de>
 <9b33f490fb1d207d3918ef5e116dc3412ae35c1e.1738746927.git.namcao@linutronix.de>
 <35d4b9be-3d08-4eaa-8750-7b34ec6e6064@kernel.dk> <87y0yjm4hi.ffs@tglx>
 <4f317ca3-0ffd-4ee0-9da6-8b80a6366d0f@kernel.dk> <87h656n3r6.ffs@tglx>
 <ad55978e-4356-494e-8cda-9e6487344768@kernel.dk>
Date: Fri, 07 Feb 2025 22:16:09 +0100
Message-ID: <87ikpllali.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The sanity checks in hrtimer_update_function() are expensive for high
frequency usage like in the io/uring code due to locking.

Hide the sanity checks behind CONFIG_PROVE_LOCKING, which has a decent
chance to be enabled on a regular basis for testing.

Fixes: 8f02e3563bb5 ("hrtimers: Introduce hrtimer_update_function()")
Reported-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/hrtimer.h |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -333,6 +333,7 @@ static inline int hrtimer_callback_runni
 static inline void hrtimer_update_function(struct hrtimer *timer,
 					   enum hrtimer_restart (*function)(struct hrtimer *))
 {
+#ifdef CONFIG_PROVE_LOCKING
 	guard(raw_spinlock_irqsave)(&timer->base->cpu_base->lock);
 
 	if (WARN_ON_ONCE(hrtimer_is_queued(timer)))
@@ -340,7 +341,7 @@ static inline void hrtimer_update_functi
 
 	if (WARN_ON_ONCE(!function))
 		return;
-
+#endif
 	timer->function = function;
 }
 
