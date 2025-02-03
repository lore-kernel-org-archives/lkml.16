Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12D220CCC2
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738605593; cv=none; b=odfCcrEpr6WWhgjAUMgpybsgxUMRFlPifKUo6eYpd+Q1Do6zHO5NRhLjdx1dHLzEeMqxkFGMR5C3+bPiIZCtoiG40UmC961hAjirtT1pJjw8z/TqODOSttRYsWpyDsnxjcGgRL7QoRUEbDDB02fLVB7sjt6X7IXLccaiyfxBzIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738605593; c=relaxed/simple;
	bh=DRqo2tI/jD+hvbE77iUn8+c1LjzgkQ+6yg/NXUhsVhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JFmnfNOyVpf0ngReFtG9a2A1wyhLV78yHKaUXVLbXYVSoGsc/+7ckXvm7UuK9XXoRU+8QRDZJ8zWX5dkDdjqLCWOkmTXt6vKDXhl8MDYqBdupY+XilfvzRs2f6f7WYbZHhl0xGIeMEih7Cf4rRufjSxcXLRKL5VtiBpTzrB6rFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=Qz09DwLR; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="Qz09DwLR"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YmvQs4fz2zlgTx2;
	Mon,  3 Feb 2025 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738605585; x=1741197586; bh=9Pc38
	sCnRSaQi7+9TEFa/3Jd8jLI4qqzP/qKeBFbqcg=; b=Qz09DwLR8MX/OZ8gFjdbG
	MUQxQPncEKpyUGyUIjo/SH1wF3D1tsq5lRQYOCT6y/rBk5WePoz2ZXBXL7BHPtus
	OGmAlq+hMJuXvyeGeL9HMgROY1Zu/beMsJgeUmpqLws61whT1CKyQi0EBbxUzpKH
	zVol8rjcwPXysRQe/GP/CZiddzgNzz6Y+x4C6eI/8aWSAQJRzb3HJZoauz1WdPSI
	EHXtNDUu2sT7mN2sM9WZeyxyPGM/2oXe1X3nEzbcI8aBSx7LcOVTvnOXJuJ0rxeA
	y0FqVKxcFfWRZBgnJNotjqL6xv6gBmSrmSbjdkz3W8y5qbC33RBPzobaqcYo3rQL
	g==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id aCd8AiruCWmY; Mon,  3 Feb 2025 17:59:45 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YmvQl474MzlgTwv;
	Mon,  3 Feb 2025 17:59:43 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH 1/5] lockdep: Introduce lockdep_unregister_key_nosync()
Date: Mon,  3 Feb 2025 09:59:35 -0800
Message-ID: <20250203175939.3133477-2-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
In-Reply-To: <20250203175939.3133477-1-bvanassche@acm.org>
References: <20250203175939.3133477-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a variant of lockdep_unregister_key() that doesn't sleep and hence
that may be called from inside RCU callbacks.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/lockdep.h  |  5 +++++
 kernel/locking/lockdep.c | 22 +++++++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 67964dc4db95..afb3f0ec7304 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -117,6 +117,7 @@ do {							\
 } while (0)
=20
 extern void lockdep_register_key(struct lock_class_key *key);
+extern void lockdep_unregister_key_nosync(struct lock_class_key *key);
 extern void lockdep_unregister_key(struct lock_class_key *key);
=20
 /*
@@ -372,6 +373,10 @@ static inline void lockdep_register_key(struct lock_=
class_key *key)
 {
 }
=20
+static inline void lockdep_unregister_key_nosync(struct lock_class_key *=
key)
+{
+}
+
 static inline void lockdep_unregister_key(struct lock_class_key *key)
 {
 }
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 4470680f0226..6e0423df9ebe 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -6558,8 +6558,11 @@ void lockdep_reset_lock(struct lockdep_map *lock)
  * Unlike lockdep_register_key(), a search is always done to find a matc=
hing
  * key irrespective of debug_locks to avoid potential invalid access to =
freed
  * memory in lock_class entry.
+ *
+ * Does not call synchronize_rcu(). The caller is responsible for making=
 sure
+ * that memory is only freed after concurrent accesses have finished.
  */
-void lockdep_unregister_key(struct lock_class_key *key)
+void lockdep_unregister_key_nosync(struct lock_class_key *key)
 {
 	struct hlist_head *hash_head =3D keyhashentry(key);
 	struct lock_class_key *k;
@@ -6568,8 +6571,6 @@ void lockdep_unregister_key(struct lock_class_key *=
key)
 	bool found =3D false;
 	bool need_callback =3D false;
=20
-	might_sleep();
-
 	if (WARN_ON_ONCE(static_obj(key)))
 		return;
=20
@@ -6594,6 +6595,21 @@ void lockdep_unregister_key(struct lock_class_key =
*key)
=20
 	if (need_callback)
 		call_rcu(&delayed_free.rcu_head, free_zapped_rcu);
+}
+EXPORT_SYMBOL_GPL(lockdep_unregister_key_nosync);
+
+/*
+ * Unregister a dynamically allocated key.
+ *
+ * Unlike lockdep_register_key(), a search is always done to find a matc=
hing
+ * key irrespective of debug_locks to avoid potential invalid access to =
freed
+ * memory in lock_class entry.
+ */
+void lockdep_unregister_key(struct lock_class_key *key)
+{
+	might_sleep();
+
+	lockdep_unregister_key_nosync(key);
=20
 	/* Wait until is_dynamic_key() has finished accessing k->hash_entry. */
 	synchronize_rcu();
