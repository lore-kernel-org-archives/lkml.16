Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F0B1A5B92
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 03:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700668; cv=none; b=AGTza0s8ssPpL5pt5NbWEirTH+zAIlyAYpX6kBY8ZeAToNwLCISA6a2b8UXiMeWeYJA0MFajqnJhxrTnnZ8hwC3HAS62vOxh9T6caRLdlxDrMaqGy789q9A36CAWb3xR+qGnU0loWIQAZ+tY2y10Ma474l/KXzEkQTRd5//2w08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700668; c=relaxed/simple;
	bh=CQtQgmc2RdVb7mtqJkvmdmIoIsDlVyjrM3+6xXubAdw=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=ECHeQcc6eFitgW9f4n0G8bMKSuyfiK2EHxl7YbqPel0eZ0pPXVPS+b+VKBgBeC2+btvDyzMwRn0wWfWkKJK4Hzk7V08W4OHGmjTgyf4+XawjL4Qg/vgZLyWtQlHVpKMcFvImT2IJx11yVdYw1sTJSUgbjUON4KbVtoStAZ1lmhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bHpdf3zFlz5DN7D;
	Thu, 12 Jun 2025 11:57:42 +0800 (CST)
Received: from njb2app05.zte.com.cn ([10.55.22.121])
	by mse-fl2.zte.com.cn with SMTP id 55C3vOHA074733;
	Thu, 12 Jun 2025 11:57:25 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njb2app05[null])
	by mapi (Zmail) with MAPI id mid204;
	Thu, 12 Jun 2025 11:57:26 +0800 (CST)
Date: Thu, 12 Jun 2025 11:57:26 +0800 (CST)
X-Zmail-TransId: 2afd684a502648f-2fdc0
X-Mailer: Zmail v1.0
Message-ID: <20250612115726263u9zKGGhkQXNFUB3OQZqCR@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.kun2@zte.com.cn>
To: <oleg@redhat.com>, <tglx@linutronix.de>, <frederic@kernel.org>,
        <peterz@infradead.org>, <brauner@kernel.org>,
        <viro@zeniv.linux.org.uk>, <joel.granados@kernel.org>,
        <lorenzo.stoakes@oracle.com>, <linux-kernel@vger.kernel.org>
Cc: <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>, <fan.yu9@zte.com.cn>,
        <qiu.yutan@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIFJFU0VORCBsaW51eCBuZXh0XSBzaWduYWw6IFVwZGF0ZSB0aGUgY29tbWVudCBvbiBfX3NlbmRfc2lnbmFsX2xvY2tlZCgpIGluCiBkb19ub3RpZnlfcGFyZW50KCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 55C3vOHA074733
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 684A5036.001/4bHpdf3zFlz5DN7D

From: Qiu Yutan <qiu.yutan@zte.com.cn>

Update the comments for the call to __send_signal_locked()
in do_notify_parent() based on community discussions.

Suggested-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Qiu Yutan <qiu.yutan@zte.com.cn>
Signed-off-by: Fan Yu <fan.yu9@zte.com.cn>
Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
---
 kernel/signal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index 148082db9a55..45dc60f8b833 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -2252,8 +2252,8 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
 			sig = 0;
 	}
 	/*
-	 * Send with __send_signal as si_pid and si_uid are in the
-	 * parent's namespaces.
+	 * Use __send_signal_locked() instead of send_signal_locked()
+	 * because the latter can wrongly change si_pid/si_uid
 	 */
 	if (valid_signal(sig) && sig)
 		__send_signal_locked(sig, &info, tsk->parent, PIDTYPE_TGID, false);
-- 
2.25.1
