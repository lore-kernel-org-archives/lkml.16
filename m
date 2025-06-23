Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EB8222590
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750716151; cv=none; b=DBvzCgrdyIy2vL6OZCdSA8OsIolTk792bt8YvSqOvAtFpOpkO0XEL10Om9ahzS0CYd88/o8znsEJRk2q6LMagWpKldy2MN1W+JZMDdZIzGALnyFWiMIhm1eYHOD3HMU/fPLtzHhU9N+Lu8WYUOKjOxWDj5oBXnhXv61R+qt0cd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750716151; c=relaxed/simple;
	bh=tm68YT9a90HPd8SyW4iO2vSE3JmiWgDiE2AIAJmX8cs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k6CQCd1DGxFK42r14ylHYTLt7DvpPBKCZ1FiK7Gb3jy1d57EH+VncBfy8weUZp39Q18FWHA60Pd8i2rxFVwTAxyR6zupW7rmPbHeCESggfSS2Dofd+7GDikC1X+F7b1FzNSLigzXgS57g2+EElvDAFpaHcjS+PdUNNoLrwecIF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mLljcyqE; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mLljcyqE"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-23536f7c2d7so77343775ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750716149; x=1751320949; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FjLS6fcFTOZbBe8HRGEmYIIW3v/Kj3AYN+Rfg45vazE=;
        b=mLljcyqE+cN0gYHo68sKuQZr01aYfgDJ6obkjPoMKEG3vKIvc67/e94lHSoRqJvgwH
         XbvCM5Ud4Ufg87WI21YfSdwB+H9Z3Wy4oGv05Utwrs53vGYnQhuPx7qpGfpVXqr2LJAj
         u0F6LNfHTIFfaclTJJjxjtQkMiQ1xCixR0w8mw4ISHYELoE9forZSf+xWd/ZQg0U31Qz
         9h/xFgnXe3UkXRUuckrdd0WuZNn8dKEZ3LCixcNpf2bUhgN3HErZToCp23yyc71JSWEw
         wjGBAR+bw30TjIu9Ul8bzebyFm27UAFow09qf3o73rJ2WdctoTWVvugleLcXPDE/U6fQ
         vTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750716149; x=1751320949;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FjLS6fcFTOZbBe8HRGEmYIIW3v/Kj3AYN+Rfg45vazE=;
        b=oVtSlmt/tKB2QIL4/Bc9airtAngXUF40EkZjp46p83tXy0VxnFirWM0qAsqO2bPQVP
         4871A0PcxUpHF3UMkQ+Z8Y8L0eTu2R4geeKtn1b0lOPSNHSQ24i1GNF4McuPR6kIWPxH
         mPC+YqKfkVqStvkX3fYd0axMs3rgEtOe/tz7XhvYvBl80GzY2cpBZoTxF7CuXbObz95k
         nByPFN3anAIq1bVjA66LtvaofScTwNIfhonrXjUyJEh7sf9ZpXtBY6AAxgbzNIHL6VGe
         UV+TUHAhpj/5hgSSS2R2FSWFvRg7Luv/MBmLXjhBIWs+KXWm8nVSPd01BLs7dpWqUxEj
         o4Lg==
X-Gm-Message-State: AOJu0YyH5/NwhKJ02BTaUHz2xs62RJTQ8Lbk5zTIOXrPXZyamlRxwK4N
	YHnhqRW9v1YCMMaHeINxhAX9MQBxlma66hYzmC0w9b23wjzymHECCnFxEx5U9xVnU8N2ZvRrwkC
	YYadr4uJV0j8RViGjQBpAd8N1A3NtXgCS0jM6yUbpF9734e/1FokPRkxVL1ED280Yhoqu5Hd4kq
	pTBqeUDqTjWFAZ+e46RoeSCDjt6t0ENtbJ2m30gTNFH4gXLXsj
X-Google-Smtp-Source: AGHT+IGzJsBNOaAcKMsbU8yG12pavTHGw1eWDlStWQqJz/Nc2zUxppOqUd2+PPJeTvp9fI3xCaQC+RawAqtw
X-Received: from pgbfq17.prod.google.com ([2002:a05:6a02:2991:b0:b31:cc05:3c03])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e5c9:b0:235:1b91:9079
 with SMTP id d9443c01a7336-237d991ec7fmr244574145ad.32.1750716149286; Mon, 23
 Jun 2025 15:02:29 -0700 (PDT)
Date: Mon, 23 Jun 2025 22:02:18 +0000
In-Reply-To: <20250623220221.978054-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250623220221.978054-1-jstultz@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250623220221.978054-2-jstultz@google.com>
Subject: [PATCH 2/2] test-ww_mutex: Move work to its own UNBOUND workqueue
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

The test-ww_mutex test already allocates its own workqueue
so be sure to use it for the mtx.work and abba.work rather
then the default system workqueue.

This resolves numerous messages of the sort:
"workqueue: test_abba_work hogged CPU... consider switching to WQ_UNBOUND"
"workqueue: test_mutex_work hogged CPU... consider switching to WQ_UNBOUND"

Signed-off-by: John Stultz <jstultz@google.com>
---
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Suleiman Souhlal <suleiman@google.com>
Cc: kernel-team@android.com
---
 kernel/locking/test-ww_mutex.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-ww_mutex.c
index cc0d2e59049a8..d7c3f7f533f42 100644
--- a/kernel/locking/test-ww_mutex.c
+++ b/kernel/locking/test-ww_mutex.c
@@ -70,7 +70,7 @@ static int __test_mutex(unsigned int flags)
 	init_completion(&mtx.done);
 	mtx.flags = flags;
 
-	schedule_work(&mtx.work);
+	queue_work(wq, &mtx.work);
 
 	wait_for_completion(&mtx.ready);
 	ww_mutex_lock(&mtx.mutex, (flags & TEST_MTX_CTX) ? &ctx : NULL);
@@ -229,7 +229,7 @@ static int test_abba(bool trylock, bool resolve)
 	abba.trylock = trylock;
 	abba.resolve = resolve;
 
-	schedule_work(&abba.work);
+	queue_work(wq, &abba.work);
 
 	ww_acquire_init_noinject(&ctx, &ww_class);
 	if (!trylock)
-- 
2.50.0.727.gbf7dc18ff4-goog

