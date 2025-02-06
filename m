Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEC5192D77
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864317; cv=none; b=FQKHnLy5tpC/7wffNJ6COY472bb3gZvgU3cpeKpnVSVfnprielvHw/HQCfvGm64dk28XJtC8QAmHDsgXtNGbiyOj+BhznQvJ8lrnckHCSPjFcXa0wVCZ6mYiFsLm2UEUjSBgt2kjBThPAFT54DdEM1ivy8078Gbl1Wp5N3KBOa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864317; c=relaxed/simple;
	bh=2ZfNrLeD6lzmxA4m0DmVz6d+9KcBMT2WgllLy+H4IaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tb2DnQk0FOgChQrZdncgBAgsVMvW7tgTa3G5mFqx5cLWIUWxE7EbISzzAjJoyagxaTMkX7Q66MLSLvJ2XaqIvULqWeurvHzkVEmZBDx1EL0UrZ/IVZ0WsremdUIInWJoCLrYgc73+7yMZAJW58hRaON7B9XWWQ+ApwBjnJbTZV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=XyMjciGl; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="XyMjciGl"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6L1gp8zlgTyC;
	Thu,  6 Feb 2025 17:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864307; x=1741456308; bh=xYKYA
	Do1LL7lwrdlVJMu7MDfo3ToR2EEpYXWMbkK2zk=; b=XyMjciGlxZrrum35gDerb
	8PaQNdHMNugXWokG0kWos8g20h0M8XF3ImJrEQF944RmTd9XPqsA3BANP/arwGnj
	rjsfLK5/3HZuEicXCEHlVDwqgWSNYnsYE1rrQdLdQa1yk3zJ/nV+ClXOthlZy0yx
	788hD6+8Q7ICdb1XnA6+OUPlurnHiSugBJYB8DoLYoqIspOuVYAUeVlHbJXBcV0v
	FvDTug+Rypp9KcQnW44goPmryjIFqBZYErSEuhoqUFO4PNo3TX7qceNxqr4BBtrd
	ovG+528HPhyDz8QOd0ool0hs/wrV6Tvxe57Sp25BFI4VOIbeB62+M/JSkK/X+nM8
	A==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 9Wq1y9BkZtNl; Thu,  6 Feb 2025 17:51:47 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl5w6dcyzlgTxr;
	Thu,  6 Feb 2025 17:51:32 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH RFC 05/33] locking/mutex: Change the atomic_dec_and_mutex_lock() return type
Date: Thu,  6 Feb 2025 09:50:46 -0800
Message-ID: <20250206175114.1974171-6-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change the return type of atomic_dec_and_mutex_lock() from int into
bool. This will make it easier to add a thread-safety annotation to
this function. This patch does not change the behavior of any kernel
code because all atomic_dec_and_mutex_lock() callers either check whether
the return value of this function is zero or that it differs from zero.

This patch makes the atomic_dec_and_mutex_lock() signature consistent
with that of refcount_dec_and_mutex_lock().

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 Documentation/locking/mutex-design.rst | 2 +-
 include/linux/mutex.h                  | 2 +-
 kernel/locking/mutex.c                 | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/locking/mutex-design.rst b/Documentation/locki=
ng/mutex-design.rst
index 7c30b4aa5e28..ec02e47b6e9e 100644
--- a/Documentation/locking/mutex-design.rst
+++ b/Documentation/locking/mutex-design.rst
@@ -144,7 +144,7 @@ Acquire the mutex, interruptible::
=20
 Acquire the mutex, interruptible, if dec to 0::
=20
-   int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock);
+   bool atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock);
=20
 Unlock the mutex::
=20
diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index 2bf91b57591b..6c0a8a843a29 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -196,7 +196,7 @@ extern void mutex_lock_io(struct mutex *lock);
 extern int mutex_trylock(struct mutex *lock);
 extern void mutex_unlock(struct mutex *lock);
=20
-extern int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock);
+bool atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock);
=20
 DEFINE_GUARD(mutex, struct mutex *, mutex_lock(_T), mutex_unlock(_T))
 DEFINE_GUARD_COND(mutex, _try, mutex_trylock(_T))
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index b36f23de48f1..0af175f5f031 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -1118,19 +1118,19 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(contention_end);
  *
  * return true and hold lock if we dec to 0, return false otherwise
  */
-int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock)
+bool atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock)
 {
 	/* dec if we can't possibly hit 0 */
 	if (atomic_add_unless(cnt, -1, 1))
-		return 0;
+		return false;
 	/* we might hit 0, so take the lock */
 	mutex_lock(lock);
 	if (!atomic_dec_and_test(cnt)) {
 		/* when we actually did the dec, we didn't hit 0 */
 		mutex_unlock(lock);
-		return 0;
+		return false;
 	}
 	/* we hit 0, and we hold the lock */
-	return 1;
+	return true;
 }
 EXPORT_SYMBOL(atomic_dec_and_mutex_lock);
