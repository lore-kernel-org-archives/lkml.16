Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392D128B7F3
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295039; cv=none; b=LDKvodliLCthGKZ44+iQHcZzRRuHhPrLm6SKI3TmcVeybgMrHTYQEPfrAF6G+JF0DlrOp5LqOXcrmdULp0mZ8oRvkDKE5fvJyRSSXbjA+oxbUY4rGvk2jzCQoPJWYGlYqi6tN+y0JZ07vKVcZPfXmfEnC9xk56UrKd4RaBevbhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295039; c=relaxed/simple;
	bh=JKcdzskNBG2gv+2opYysBC76J4fT6gAvUPmpMbNQ7n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5KofiYSVEjmdPoDZTwXy0kwXHl33L0K/k1POeFMXBCanb+cOe9yoUy7pkQ6AGFJ6A9GCZnCnxYTgcnrqH8vZ4gmCz7hloWBF8RcPgNY7BdNFDhoUAEgGJ+SdVFDHV1hD2pFMeV2foM9qS8OhZ3AHn2eo/W9JW7WC9JDCOQq2b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tyC1qnPE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ag/1SJFq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tyC1qnPE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ag/1SJFq"
Date: Mon, 30 Jun 2025 16:50:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751295035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AyTl6LkN47yVn0x7QRLEVXaJXcJVffHJPLhqBWqczyY=;
	b=tyC1qnPEnUq6FG4isqzrMAfH/wDt2soQaH1NmNql9xzngbUiffF3QWmak8d+fgkKrfDDFI
	vL5rZ9uMa2nQgDc4Nwlr/hYI2h9GGZ31VikowNJv46IY+pUM1PibpbwaNVZSXxg2Iy6JL/
	pYF9Ys87zxWYSy7H/V8QJYaNUSj/mw5IgYFL2Xy3y5fHVAHGRYEUXOd+QwMsbSSIWE/dhl
	JLnkurhpfw647y6c0YKEOWtt+awBlVsA/WaQBoO86RHDJSzb/3mscUVvwvaPUnLMuNrBEe
	9k/AXky7WdFQa08Q4W5c++ewhMjJ1XuSaYnl6jSDz5zkleoPZLdgMHiiGljVLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751295035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AyTl6LkN47yVn0x7QRLEVXaJXcJVffHJPLhqBWqczyY=;
	b=ag/1SJFqsRjy+8iChnMvR+ls3XAP2JyWURmL3GNw/HQ/qqGknO6k22rtXavy6BzrgV0R9y
	fLDYYZOat0KEB6Cw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] futex: Temporary disable FUTEX_PRIVATE_HASH
Message-ID: <20250630145034.8JnINEaS@linutronix.de>
References: <20250604092815.UtG-oi0v@linutronix.de>
 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
 <20250604200808.hqaWJdCo@linutronix.de>
 <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>
 <20250606070638.2Wk45AMk@linutronix.de>
 <20250624190118.GB1490279@noisy.programming.kicks-ass.net>
 <71ea52f2-f6bf-4a55-84ba-d1442d13bc82@meta.com>
 <20250626131715.GI1613200@noisy.programming.kicks-ass.net>
 <20250626135034.18sab4Xp@linutronix.de>
 <20250627110457.GA1613200@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627110457.GA1613200@noisy.programming.kicks-ass.net>

Chris Mason reported a performance regression on big iron. Reports of
this kind were usually reported as part of a micro benchmark but Chris'
test did mimic his real workload. This makes it a real regression.

The root cause is rcuref_get() which is invoked during each futex
operation. If all threads of an application do this simultaneously then
it leads to cache line bouncing and the performance drops.

Disable FUTEX_PRIVATE_HASH entirely for this cycle. The performance
regression will be addressed in the following cycle enabling the option
again.

Reported-by: Chris Mason <clm@meta.com>
Closes: https://lore.kernel.org/all/3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com/
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 init/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index af4c2f0854554..666783eb50abd 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1716,9 +1716,13 @@ config FUTEX_PI
 	depends on FUTEX && RT_MUTEXES
 	default y
 
+#
+# marked broken for performance reasons; gives us one more cycle to sort things out.
+#
 config FUTEX_PRIVATE_HASH
 	bool
 	depends on FUTEX && !BASE_SMALL && MMU
+	depends on BROKEN
 	default y
 
 config FUTEX_MPOL
-- 
2.50.0

