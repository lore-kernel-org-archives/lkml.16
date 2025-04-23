Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9161EFF93
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745430696; cv=none; b=VPuw6IVp7l4iu6Vtqk0eVXeOaKETLuZRS/peJqt65F/yxM+8/DyS8JwYRM0zJAVjJY2XMPIsB7ZQ5IZ47Anot9j0nZ4eSUrOEjTGq5obtb4npCOIkSaFx1hmv++ClMlOynu7I1WON/NZZ3Z7v6MHWwsYaHob38rfIxIZeFFiBRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745430696; c=relaxed/simple;
	bh=AOgjsIHXPLrOHEcQI2LTFaRuySJRRgZnxO0qvdQh5OQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jGGHoO6T4kWtLakOBvoIFbN2dFmaSjTj2+Ws4CRRR2bNJTqbW0Qfq6xbl/FLoUDf/PygWYZDyH5AU+9PmQFmGa851951aT4HOWndJu0GamIa3BAKK47ImHaIOO8WA6St14IH50c0WdFZKVKew+iMMqdLhfhqp2uSPyLiRxatAws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YtCAHyty; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YtCAHyty"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39131f2bbe5so26942f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745430693; x=1746035493; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xdke2Rc+NSDoHPSyzigpiMiAwGhZ+MBxFSb+5HE6Ve0=;
        b=YtCAHytyeV+rFNDoxafmUkg4DuPEHkyV51i8KrEtaNRci6J6ZOIU9+wlQ6tkMeCB5B
         Pzyf4JQpvWW5likuFyuN7tPgyJ9Lk12tKflK02aIG5pwnyrL5ppToSEW0gj9WK6UXSib
         MHKG/PrvhadI3vqmoQpJKbPtF8uHeBk5HbNJfxOoAziFrMImRplw6zZRMuneWe2+P5wB
         F02qkrmcadDNp5rv+YFccVcEgdP7XKVlzKhjuLl966nJJLEdYLnmWSyqvsckxrlQ5B3G
         X+w9ROWt+0SJXJe41Qey0sygjckNY3EJhnRPSSJWAR/ZLs6BXcieGVtzfr8IjeRWv6f2
         e/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745430693; x=1746035493;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xdke2Rc+NSDoHPSyzigpiMiAwGhZ+MBxFSb+5HE6Ve0=;
        b=mCafHelbO+qqglBOfw6PSikU/pEhfi4f0ELvS5qB0gjcMlc29QiTWIklNQB34lCZDf
         6LIuLA0wyHbvKj8P70/mgkma2gPQw2412xMXfNpkhy9lxG3H1ueebyscbx6tzezYRfuQ
         vP+9RaT2requLs/dT4j7hAWCJgT5tCf4TpeCb+m+Lfcl7tZbyhSbaANkJ4mOqalk2L5k
         5HPLNJtwVbjOcvAahQm3GeJPPoNDPOeBsxtFaejFbwMpJekPRHeWurrQeF0IAge/r1aW
         GfTqTNGouw1PuPKkLtqKtatFC0x2JOdRZo8WRCxaSps52gu8PwZa8xvrYE3Yove+OBc3
         ShLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqPPpe2NR98CoISrcmI7jh+QxiDxRR83ntyIiGoaiWtlG55dOMKG19eaPOPBzAmYj1Oa+B+eLvp3KIJKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrthV/kjkjmqEAtQctwUym83U8ACDsz3IRmM/F2Jv9BOyuGj90
	ssBfiyidQYjYlyWvRaPOrrPQ+0wyaGbsh/1wFx7OqgGvQxRzVxvCTUWNy0Ypsi0wtvb40PubMVQ
	GyCs2SlMDvzbPQQ==
X-Google-Smtp-Source: AGHT+IHMMsrlcxZQqJXpxaGb4QS1P9SljBrIs5Q9vSAwwrERKWAkl5QGXgjV8oyVQaYnhqCbEFTsxNryMpDppv4=
X-Received: from wmsd10.prod.google.com ([2002:a05:600c:3aca:b0:43c:fcfd:1ce5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2510:b0:391:2306:5131 with SMTP id ffacd0b85a97d-39efbace660mr16392459f8f.45.1745430693232;
 Wed, 23 Apr 2025 10:51:33 -0700 (PDT)
Date: Wed, 23 Apr 2025 17:51:27 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ4oCWgC/x3MQQrCQAxG4auUrA3U6Ch4FXEh5q8NSkeTjraU3
 t3B5bd4b6GAG4JOzUKOj4XloWK7aejWX4c72LSapJXU7mXHihg9z/zN/ngXFHD3LNGzqCSF4pg OiWr9cnQ2/c/ny7r+ANqkcsppAAAA
X-Change-Id: 20250423-destroy-workqueue-flush-2d25dede7565
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=11185; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=AOgjsIHXPLrOHEcQI2LTFaRuySJRRgZnxO0qvdQh5OQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoCSij7hBPsgv6uxw5cmwz3PrGtBL3Aici220P7
 RJSEwUgbmeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaAkoowAKCRAEWL7uWMY5
 RodXD/91Qo7vss5ujGdc1GbgjcPOLeI1b+3ETJQE6sEAl7n72ZManxtxrEmos7e7thwf1nNPbP7
 73ZyMaz45ygLidQZZNWIXnlytdoyHxtOHO6BABU+fTGMuEghxe4yzdV03+bfptP0gE02nunZKS8
 RkvyWGZYJjyFlkY7NJD0owpVs0dB4hNAk9RDNrF2t6DHqyujnyzEllLZ73xFFI6wSXZy3/asmme
 RVcSFvvSMqErUCqjmkfDd1f51VWlKqiClOCo6nunaGQuoP52rVdFbo61mAF/WejA6i+zf67Y55V
 GewmbnP5NHgcMGIXqg/dAGox7dfDDymwcF7bKV5EZfrqT2NC6moVgNq7ziEHAt5IvhK9Bojw7ac
 qc1S0cAGvAVkobYW3OWu3rMD6TFmPdwbyc7V3rmnSbMqVQ3zwRyRntHeQKtgWAwNm/fwNAftOiz
 yLIbD87oa6Bicj7Pndi4N1tdApyyLas49p5xdufySCmNXq6sZCnz9hOQgp/OsM9vMQ0sZEA8JhW
 6OvnkmoeWSA+LtmHQHdoWt/QgbvbGsEV/oG/MqxrKoEvzm46m+t5fFRkqtaDxCsQ+7vtq1w6eZL
 tfj0ius2Djvh/t6tFQkBgTENEFxzqIQg8G2btzdSyoMKzNU8e+1FU/WT6oGOUHCsIKeVn1ciYMI aTCB7QWOOYAU5jw==
X-Mailer: b4 0.14.2
Message-ID: <20250423-destroy-workqueue-flush-v1-1-3d74820780a5@google.com>
Subject: [PATCH] workqueue: flush all pending jobs in destroy_workqueue()
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Philipp Stanner <phasta@mailbox.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Normally, destroy_workqueue() will wait for queued work to exit, but if
destroy_workqueue() is called while it contains any pending (delayed or
rcu) work, then it fails to wait for the work. When those work items are
eventually queued in the timer/rcu callback, it may result in a UAF when
the callback tries to use a workqueue that has already been freed. (In
fact, they must be queued before we set __WQ_DESTROYING to avoid
triggering a WARN.)

To fix this, we introduce a new list of delayed work items so that
destroy_workqueue() can flush all delayed work items before waiting for
queued jobs. We also call rcu_barrier() to wait for rcu jobs to queue
themselves.

Flush or cancel work?
=====================

This patch proposes that we flush delayed work items rather than
cancelling them. This has the consequence that delayed work items may
executed sooner than the timer placed on them, which is somewhat
unfortunate. However, this is better than cancellation as this has
issues with cleanup - for example self-freeing work items would not get
freed if we cancel them. See the linked discussion for more on this.

Another option could be to wait for the timers to elapse so that the
work items are not executed "too early". This would work, but is deemed
to be too excessive because the timers could be very long. Thus, if the
user doesn't want their delayed work items to run early, they have to
cancel them before calling destroy_workqueue(). (Which is no different
from what is required prior to this patch.)

The same strategy is not used for rcu work items because such work items
are very likely to do something incorrect if an rcu grace period has not
passed when they run. But we still need to wait for them. Thus, this
patch introduces a call to rcu_barrier() in destroy_workqueue().

Dual use of the list_head
=========================

This patch reuses the list_head inside work_struct for the delayed_list
list. This could be dangerous if there is any code out there that is
using the list_head for various other purposes.

To avoid such issues, we ensure that if a work item is queued in
delayed_list, then it *must* be the case that the pending bit is owned
by the timer or by a *currently running* function in kernel/workqueue.c
such as __queue_delayed_work(), delayed_work_timer_fn(),
try_to_grab_pending(), or flush_delayed_work(). Note that this implies
that such functions *must* remove the work item from delayed_list (or
schedule the timer) before they give up ownership of the pending bit.

The above ensures that no existing code assumes it can use the list_head
for its own purposes - if such code exists, it has a bug today because
the list_head could get scheduled by __queue_work() at any time, which
WARNs in such cases.

Link: https://lore.kernel.org/r/aAFnEBv50t11Rjt0@slm.duckdns.org
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Based on top of
https://lore.kernel.org/all/20250404101543.74262-2-phasta@kernel.org/
---
 kernel/workqueue.c | 138 ++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 125 insertions(+), 13 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 2cb8276a27a99c951883d09ed2dbd5f488bda8e2..5b795d8c7ca5a16006fea6c4996acc60230e3984 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -367,6 +367,8 @@ struct workqueue_struct {
 	struct lockdep_map	__lockdep_map;
 	struct lockdep_map	*lockdep_map;
 #endif
+	raw_spinlock_t		delayed_lock;	/* protects pending_list */
+	struct list_head	delayed_list;	/* list of pending delayed jobs */
 	char			name[WQ_NAME_LEN]; /* I: workqueue name */
 
 	/*
@@ -2061,8 +2063,20 @@ static int try_to_grab_pending(struct work_struct *work, u32 cflags,
 		 * guaranteed that the timer is not queued anywhere and not
 		 * running on the local CPU.
 		 */
-		if (likely(timer_delete(&dwork->timer)))
+		if (likely(timer_delete(&dwork->timer))) {
+			/*
+			 * We took ownership of the pending bit from the timer,
+			 * so dwork->wq must be a valid workqueue and
+			 * work->entry must be in delayed_list of that wq. Note
+			 * that dwork->wq can't be freed here because
+			 * destroy_workqueue() spins until we delete the work
+			 * item from delayed_list.
+			 */
+			raw_spin_lock(&dwork->wq->delayed_lock);
+			list_del_init(&work->entry);
+			raw_spin_unlock(&dwork->wq->delayed_lock);
 			return 1;
+		}
 	}
 
 	/* try to claim PENDING the normal way */
@@ -2479,12 +2493,33 @@ bool queue_work_node(int node, struct workqueue_struct *wq,
 }
 EXPORT_SYMBOL_GPL(queue_work_node);
 
+/*
+ * Should be used instead of __queue_work() right after removing a struct
+ * delayed_work from the timer (either by completion or timer_delete). Not
+ * needed if it was never added to the timer in the first place.
+ */
+static void __queue_delayed_work_now(struct delayed_work *dwork)
+{
+	struct workqueue_struct *wq = dwork->wq;
+
+	/*
+	 * The __queue_work() call must happen inside the lock, because
+	 * otherwise destroy_flush_all_delayed() might see the list being empty
+	 * before we call __queue_work(), which would be illegal.
+	 */
+
+	raw_spin_lock(&wq->delayed_lock);
+	list_del_init(&dwork->work.entry);
+	__queue_work(dwork->cpu, wq, &dwork->work);
+	raw_spin_unlock(&wq->delayed_lock);
+}
+
 void delayed_work_timer_fn(struct timer_list *t)
 {
 	struct delayed_work *dwork = from_timer(dwork, t, timer);
 
 	/* should have been called from irqsafe timer with irq already off */
-	__queue_work(dwork->cpu, dwork->wq, &dwork->work);
+	__queue_delayed_work_now(dwork);
 }
 EXPORT_SYMBOL(delayed_work_timer_fn);
 
@@ -2515,6 +2550,10 @@ static void __queue_delayed_work(int cpu, struct workqueue_struct *wq,
 	dwork->cpu = cpu;
 	timer->expires = jiffies + delay;
 
+	raw_spin_lock(&wq->delayed_lock);
+	list_add_tail(&work->entry, &wq->delayed_list);
+	raw_spin_unlock(&wq->delayed_lock);
+
 	if (housekeeping_enabled(HK_TYPE_TIMER)) {
 		/* If the current cpu is a housekeeping cpu, use it. */
 		cpu = smp_processor_id();
@@ -4282,7 +4321,7 @@ bool flush_delayed_work(struct delayed_work *dwork)
 {
 	local_irq_disable();
 	if (timer_delete_sync(&dwork->timer))
-		__queue_work(dwork->cpu, dwork->wq, &dwork->work);
+		__queue_delayed_work_now(dwork);
 	local_irq_enable();
 	return flush_work(&dwork->work);
 }
@@ -5720,6 +5759,9 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 	INIT_LIST_HEAD(&wq->flusher_overflow);
 	INIT_LIST_HEAD(&wq->maydays);
 
+	INIT_LIST_HEAD(&wq->delayed_list);
+	raw_spin_lock_init(&wq->delayed_lock);
+
 	INIT_LIST_HEAD(&wq->list);
 
 	if (flags & WQ_UNBOUND) {
@@ -5832,22 +5874,86 @@ static bool pwq_busy(struct pool_workqueue *pwq)
 	return false;
 }
 
+/*
+ * Helper function for destroy_workqueue() which ensures that all delayed work
+ * items are queued to the workqueue. This means that once the workqueue drains
+ * all jobs, it's guaranteed that no new jobs will be added.
+ *
+ * The user must not call any variant of queue_work_on() during the call to
+ * destroy_workqueue(). It's a user bug if that happens. As for the methods
+ * cancel_delayed_work() and flush_delayed_work(), those are okay to call.
+ */
+static void destroy_flush_all_delayed(struct workqueue_struct *wq)
+{
+	struct delayed_work *dwork;
+	/*
+	 * List of pending delayed work items where the pending bit is not
+	 * owned by the timer, but some other function. We need to wait for
+	 * them to remove themselves from this list.
+	 *
+	 * Protected by wq->delayed_lock.
+	 */
+	LIST_HEAD(running_timers);
+
+	raw_spin_lock_irq(&wq->delayed_lock);
+	while ((dwork = list_first_entry_or_null(&wq->delayed_list,
+				struct delayed_work, work.entry))) {
+		if (likely(timer_delete(&dwork->timer))) {
+			WARN_ON(wq != dwork->wq);
+			list_del_init(&dwork->work.entry);
+			__queue_work(dwork->cpu, wq, &dwork->work);
+		} else {
+			/*
+			 * The timer is in delayed_list, but the timer could
+			 * not be deleted. This means that the pending bit is
+			 * currently owned by another running function. In this
+			 * case we just need to wait for that other function to
+			 * finish running.
+			 */
+			list_move(&dwork->work.entry, &running_timers);
+		}
+
+		/* Give others a chance to use the lock. */
+		raw_spin_unlock_irq(&wq->delayed_lock);
+		raw_spin_lock_irq(&wq->delayed_lock);
+	}
+	raw_spin_unlock_irq(&wq->delayed_lock);
+
+	/*
+	 * We also need to ensure that all rcu_work items are queued. The
+	 * easiest way to do this is to wait for the rcu callbacks to finish,
+	 * so we call rcu_barrier(). The call to rcu_barrier() could happen
+	 * anywhere in this function, but right now we need to wait for timer
+	 * callbacks to remove themselves from running_timers and we have no
+	 * good way of waiting for that other than spinning, so this seems like
+	 * a good time to call rcu_barrier().
+	 */
+	rcu_barrier();
+
+	raw_spin_lock_irq(&wq->delayed_lock);
+	while (!list_empty(&running_timers)) {
+		raw_spin_unlock_irq(&wq->delayed_lock);
+		/*
+		 * The timers are irqsafe, so waiting for them by spinning
+		 * should be okay.
+		 */
+		cpu_relax();
+		raw_spin_lock_irq(&wq->delayed_lock);
+	}
+	raw_spin_unlock_irq(&wq->delayed_lock);
+}
+
 /**
  * destroy_workqueue - safely terminate a workqueue
  * @wq: target workqueue
  *
  * Safely destroy a workqueue. All work currently pending will be done first.
  *
- * This function does NOT guarantee that non-pending work that has been
- * submitted with queue_delayed_work() and similar functions will be done
- * before destroying the workqueue. The fundamental problem is that, currently,
- * the workqueue has no way of accessing non-pending delayed_work. delayed_work
- * is only linked on the timer-side. All delayed_work must, therefore, be
- * canceled before calling this function.
- *
- * TODO: It would be better if the problem described above wouldn't exist and
- * destroy_workqueue() would cleanly cancel all pending and non-pending
- * delayed_work.
+ * Note that delayed work is executed *without* waiting for the delay. This
+ * means that delayed work may execute sooner than expected. This doesn't apply
+ * to rcu work, which is still guaranteed to execute a grace period after being
+ * scheduled. Therefore, calling destroy_workqueue() may involve waiting for a
+ * rcu_barrier().
  */
 void destroy_workqueue(struct workqueue_struct *wq)
 {
@@ -5860,6 +5966,12 @@ void destroy_workqueue(struct workqueue_struct *wq)
 	 */
 	workqueue_sysfs_unregister(wq);
 
+	/*
+	 * Ensure that all delayed work items are queued properly so that
+	 * drain_workqueue() will not miss any pending jobs.
+	 */
+	destroy_flush_all_delayed(wq);
+
 	/* mark the workqueue destruction is in progress */
 	mutex_lock(&wq->mutex);
 	wq->flags |= __WQ_DESTROYING;

---
base-commit: 2762750ac5c6395dfa69b2cf1e3208fe6ae45cd5
change-id: 20250423-destroy-workqueue-flush-2d25dede7565

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

