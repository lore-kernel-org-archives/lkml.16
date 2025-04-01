Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE211E22FC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743481655; cv=none; b=YZ2uSseCVeshzaApWDY2lC5l0IaUysmb99C6Du7xWlTu53kNbpc18M6PrRYSwXHHRlRT1swYVrfxDLO52iSIg2VRr6ohn+hLh5UOI/UNd4m5QgTcbdoDxbLf9feKjzXCE2UrATyKsye3f49/MDJ2Lzk0SUHeylCPuU7ReWgrdCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743481655; c=relaxed/simple;
	bh=DpZApQ3fxMrUC3/ISfLUORB6Dhdjyueg6i2b7UimCCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K+s5sImj5R6oGR3A9KTylA0Mh/3KltzYJHXqtTz1TZlzuYOhtywHcxxYfPCRV3fwXPTQIlRJm6MlcJvt6NE/wcmYJmEnKOA2DNrTXzx3+i4w7IQbzc0LChmNQCjTf4DF8fo54AT987AMFcquP1TJYoJeynt2Int4gBJJfPZjEWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/9EpPfK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/9EpPfK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF655C4CEEA;
	Tue,  1 Apr 2025 04:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743481654;
	bh=DpZApQ3fxMrUC3/ISfLUORB6Dhdjyueg6i2b7UimCCE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c/9EpPfKmzwqtjO2QCtI+aSTz3WLv2lSsRKVKWo5gOpoaA/FadxaXmzYHy9XnVdCT
	 1ZpnH70cknGt7fh/7I9+T9/xvPJISZUdBJrXij9nO2JM0AQwmsfNZrkb2UnaZab6+2
	 s0NLoEI0u0mLUQp3ExguIUk6++42F41WsXfZYXKLoz3/h2KuZx63btM6eRr8FsaruK
	 NPqSrVntLZN99h/4dGqUzsll8zRlvXGRbJUITmGEzqujxERPHoSE+oWMYEdku4KF02
	 qZRFcMJO+Aeskbp/ENlHhfl5HV29O9PtPslzBzBCHIWqdTzP0OJcCfPezlX+WjcHR5
	 P2gymXOLCp7fw==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 10/11] context_tracking: Always inline ct_{nmi,irq}_{enter,exit}()
Date: Mon, 31 Mar 2025 21:26:45 -0700
Message-ID: <8509bce3f536bcd4ae7af3a2cf6930d48c5e631a.1743481539.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1743481539.git.jpoimboe@kernel.org>
References: <cover.1743481539.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks to CONFIG_DEBUG_SECTION_MISMATCH, empty functions can be
generated out of line.  These can be called from noinstr code, so make
sure they're always inlined.

Fixes the following warnings:

  vmlinux.o: warning: objtool: irqentry_nmi_enter+0xa2: call to ct_nmi_enter() leaves .noinstr.text section
  vmlinux.o: warning: objtool: irqentry_nmi_exit+0x16: call to ct_nmi_exit() leaves .noinstr.text section
  vmlinux.o: warning: objtool: irqentry_exit+0x78: call to ct_irq_exit() leaves .noinstr.text section

Fixes: 6f0e6c1598b1 ("context_tracking: Take IRQ eqs entrypoints over RCU")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/d1eca076-fdde-484a-b33e-70e0d167c36d@infradead.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 include/linux/context_tracking_irq.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/context_tracking_irq.h b/include/linux/context_tracking_irq.h
index c50b5670c4a5..197916ee91a4 100644
--- a/include/linux/context_tracking_irq.h
+++ b/include/linux/context_tracking_irq.h
@@ -10,12 +10,12 @@ void ct_irq_exit_irqson(void);
 void ct_nmi_enter(void);
 void ct_nmi_exit(void);
 #else
-static inline void ct_irq_enter(void) { }
-static inline void ct_irq_exit(void) { }
+static __always_inline void ct_irq_enter(void) { }
+static __always_inline void ct_irq_exit(void) { }
 static inline void ct_irq_enter_irqson(void) { }
 static inline void ct_irq_exit_irqson(void) { }
-static inline void ct_nmi_enter(void) { }
-static inline void ct_nmi_exit(void) { }
+static __always_inline void ct_nmi_enter(void) { }
+static __always_inline void ct_nmi_exit(void) { }
 #endif
 
 #endif
-- 
2.48.1

