Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B3721B9C4
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748509798; cv=none; b=Fddad5vim0E0OCU0ByGOppDBQX4+epj9kmmnSGvX6Wa4deRjbyZ8ZemsfDj0rVHXs7d+5HAxiCP9pJsgojOr+QIftMKbsTytRL6nTvVHapAXPvcQk4mx14smWGXQzJ/DTtKWBHA1iGcBNbVccGp3ok5I4c93tCfjzoZUDTrP5sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748509798; c=relaxed/simple;
	bh=8x9/93+KkG39Ch5DJbQzH5mIGwAJ3JC8ir4cVwBdKC4=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=cCrnr+foUWECE9mMp9rCCPBx3iaLk3BzUDFB2SXo5YaK6Is3jqsJcfv2YeB/3lDOPRVlMzTmCLVifb1LftsA2CoWr3JHt6l3IQanlG3bEkaQbjH/tGs4lveHPC+6QbsEPAzPr7PUXjCpP1ZgRNT/skZofeCAR7U1azc2q+UeqRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4b7LDJ3bZvz5B1Ct;
	Thu, 29 May 2025 17:09:52 +0800 (CST)
Received: from njb2app06.zte.com.cn ([10.55.23.119])
	by mse-fl2.zte.com.cn with SMTP id 54T99TV3093258;
	Thu, 29 May 2025 17:09:29 +0800 (+08)
	(envelope-from jiang.kun2@zte.com.cn)
Received: from mapi (njy2app03[null])
	by mapi (Zmail) with MAPI id mid204;
	Thu, 29 May 2025 17:09:32 +0800 (CST)
Date: Thu, 29 May 2025 17:09:32 +0800 (CST)
X-Zmail-TransId: 2afb6838244cffffffffee4-070fa
X-Mailer: Zmail v1.0
Message-ID: <20250529170932156bHp8FtRc-KjUKWmV17JyR@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4IG5leHRdIHNpZ25hbDogVXBkYXRlIHRoZSBjb21tZW50IG9uIF9fc2VuZF9zaWduYWxfbG9ja2VkKCkgaW4KIGRvX25vdGlmeV9wYXJlbnQoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 54T99TV3093258
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68382460.002/4b7LDJ3bZvz5B1Ct

From: Qiu Yutan <qiu.yutan@zte.com.cn>

Update the comments for the call to __send_signal_locked()
in do_notify_parent() based on community discussions.

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
