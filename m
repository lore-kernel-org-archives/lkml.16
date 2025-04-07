Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C226D2063F9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041477; cv=none; b=lBrqTWfxrviPYTgItzLaiY9NoKcn8xz/VHouWsPquvLjYs/QmGf+d89KVmqpENvW42ed7IyW5BEeWRICX6kJ4tbyMk+Bm6tmgajvG/uiSSnLe1jSQLRq2Mkt/VWwWl71Olhp7naSdpUrzyvkIhHEuErAIVsSb4CiEvOZFKRhgy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041477; c=relaxed/simple;
	bh=NMtemmKnPmyQcs6axqNmBbUMi56qsYrZm/MNY3rHVaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sswi+ycxwHK5LwfaGDRWc5dbxWLKBFRx8lFLSlKWYFsguSdD3UWpSBfTI3p/EA2Ag50yArI3MbnZwhzHJ9Y3BOBVlNcf+OrDbFYCQpG7lh9fsQ5dOpjsQ1Y46idA4vGvmm23glxMHld0FUlYt0HjT6WXrKGlo95HB/v7XuFf3kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YUitFDit; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0oy7WEbu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YUitFDit";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0oy7WEbu"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744041471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0GEZ2YVGNjbG0flB6FM5Jwo67WRq8Fq4s1znrOXO320=;
	b=YUitFDit1l1ulvjRVfD1lUjJvYd/W7Jhcb5snUDvaKUfXfpFdm0oF2he/Kb1TWi2GdSr2E
	Co5KqqRZI1fYu/gEWlFU1M1QQdHF7qxI7UAgMeFePMsmZGEQmeqnbGgv7U28+CcZE6zXl/
	rR+fNMIgK7P8WqXFP3Z5ns6QLs/jSg82pwc/WcbjJRf+z/+elVGhaCpCULztTGeGcvsP5G
	H6t1pn/cWVEfYMfCXEKMJVhPHM9MJXuD/tykMqCXywGCdnK2j7oLGDGipwHu8+3Ow/w+8I
	rG06Nbcvs6bVHLlMx9ufihAfSFZG39qMI4vlx92aHJ99UTR9iKii4JlHwMrO9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744041471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0GEZ2YVGNjbG0flB6FM5Jwo67WRq8Fq4s1znrOXO320=;
	b=0oy7WEbu4uB8C6mb5fVgmtt0wZ1lrq5kOYB2xfwCKH6oOMZoh89spQzEht3etaSYGMw0UY
	s6XiOC31oWAAOPAg==
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v11 08/19] futex: Acquire a hash reference in futex_wait_multiple_setup().
Date: Mon,  7 Apr 2025 17:57:31 +0200
Message-ID: <20250407155742.968816-9-bigeasy@linutronix.de>
In-Reply-To: <20250407155742.968816-1-bigeasy@linutronix.de>
References: <20250407155742.968816-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

futex_wait_multiple_setup() changes task_struct::__state to
!TASK_RUNNING and then enqueues on multiple futexes. Every
futex_q_lock() acquires a reference on the global hash which is dropped
later.
If a rehash is in progress then the loop will block on
mm_struct::futex_hash_bucket for the rehash to complete and this will
lose the previously set task_struct::__state.

Acquire a reference on the local hash to avoiding blocking on
mm_struct::futex_hash_bucket.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/waitwake.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index d52541bcc07e9..bd8fef0f8d180 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -406,6 +406,12 @@ int futex_wait_multiple_setup(struct futex_vector *vs,=
 int count, int *woken)
 	int ret, i;
 	u32 uval;
=20
+	/*
+	 * Make sure to have a reference on the private_hash such that we
+	 * don't block on rehash after changing the task state below.
+	 */
+	guard(private_hash)();
+
 	/*
 	 * Enqueuing multiple futexes is tricky, because we need to enqueue
 	 * each futex on the list before dealing with the next one to avoid
--=20
2.49.0

