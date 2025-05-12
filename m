Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC8B24DFFD;
	Mon, 12 May 2025 22:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747088234; cv=none; b=c2RV/5jJwVbjHP9D8Vsn+Nnjyup4pBUo4WRoNy9MqJB4Rt7AceNOUf03PvwVZ43KR/rizdMvN1D1wyEBJqwpKUrdTGkr/ffoin4YcYdH9GUebLGNTdZUKFa25Ja2URNackNOD6z8ILuHP9JoayhOwxEWAkW5tRYXuGg+NdInBb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747088234; c=relaxed/simple;
	bh=V2RN0phQQ4I6fxeWpbMqgRtPQ1lwTUdTOKAtatK8rtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fWO36MYr7QQuZ3h0UXmK2MhSa7aCtquY2g6L4AxdCyje7EItQ3c8C0FmDy+NaLVIo9+dT7+TfjRpbY9oywmW36jbJ01My8A5gOf7mO8C5rGfCuDSj0xASA4bDTbwzbztjXOCZjAB4+DytLliluvUy+H/w85mlRQ0PC24PSSCeOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFhXpCK8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFhXpCK8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0353AC4CEE7;
	Mon, 12 May 2025 22:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747088234;
	bh=V2RN0phQQ4I6fxeWpbMqgRtPQ1lwTUdTOKAtatK8rtk=;
	h=From:Date:Subject:To:Cc:From;
	b=FFhXpCK82kRf8eK/WzKD0IeqVtLK/1q7ThAGAfoP3K+vCD/ZAUWawRP5+Hbq6UNqc
	 /iXECd67SpUj9e5wTtxbdlRsLW97qFEc0/dkukhvZLIkydmqKvRfeQ0rKQYzBjCDXC
	 5o+BRGT5jUTe/bvpQxNfJ4GUxuqY8bg85l4BATNkdzSOMpNZTHMZxsEqb/DoWSXamx
	 eFGK93te7sGc3grV+nxdZcgrCvaw/7diIOXg6Q9aRhIhR2DIsV9gS8/T/P47yZ8hAg
	 qVExCteZmUJutC8uNser/IhIUVA1bY7DN/sVfRzvu6NYDXWypj4QlCKJDvIwFQRNBj
	 yrmWbnOXMVt4w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 13 May 2025 00:16:55 +0200
Subject: [PATCH] genirq: Ensure flags in lock guard is consistently
 initialized
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-irq-guards-fix-flags-init-v1-1-1dca3f5992d6@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFZzImgC/x2MQQqAMAzAviI9W9imXvyKeJiuzoJMbVUE8e8Oj
 4EkDygJk0JbPCB0sfKaMtiygHH2KRJyyAzOuMY01iHLjvH0EhQnvnFafFTkxAdaV1fkB6pqYyH
 3m1A2/nfXv+8H0JYo/msAAAA=
X-Change-ID: 20250512-irq-guards-fix-flags-init-1243eabe3401
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, 
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792; i=nathan@kernel.org;
 h=from:subject:message-id; bh=V2RN0phQQ4I6fxeWpbMqgRtPQ1lwTUdTOKAtatK8rtk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBlKxRnFHEqvjYKm3PvAJfRUX+PSNLEHrfnTk2pf/oy0W
 HOGU4Sto5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExkhQfDP7Omfdefpl/UrOJo
 13rVwvVj25YvDfI81W/M97Vb1GaFlTL8s78Vf8Ywov/jCWsHfRnNlEWNco0zz6g9rhfp+XU24Js
 DFwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After the conversion to locking guards within the interrupt core code,
several builds with clang show the "Interrupts were enabled early"
WARN() in start_kernel() on boot.

In class_irqdesc_lock_constructor(), _t.flags is initialized via
__irq_get_desc_lock() within the _t initializer list. However, the C11
standard 6.7.9.23 states that the evaluation of the initialization list
expressions are indeterminately sequenced relative to one another,
meaning _t.flags could be initialized by __irq_get_desc_lock() then be
initialized to zero due to flags being absent from the initializer list.

To ensure _t.flags is consistently initialized, move the call to
__irq_get_desc_lock() and the assignment of its result to _t.lock out of
the designated initializer.

Fixes: 0f70a49f3fa3 ("genirq: Provide conditional lock guards")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 kernel/irq/internals.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index bd2db6ebb98e..476a20fd9bfc 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -176,10 +176,10 @@ __DEFINE_UNLOCK_GUARD(irqdesc_lock, struct irq_desc,
 static inline class_irqdesc_lock_t class_irqdesc_lock_constructor(unsigned int irq, bool bus,
 								  unsigned int check)
 {
-	class_irqdesc_lock_t _t = {
-		.bus	= bus,
-		.lock	= __irq_get_desc_lock(irq, &_t.flags, bus, check),
-	};
+	class_irqdesc_lock_t _t = { .bus = bus, };
+
+	_t.lock = __irq_get_desc_lock(irq, &_t.flags, bus, check);
+
 	return _t;
 }
 

---
base-commit: c1ab449df871d6ce9189cb0a9efcd37d2ead10f0
change-id: 20250512-irq-guards-fix-flags-init-1243eabe3401

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

