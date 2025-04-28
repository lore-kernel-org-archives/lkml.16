Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832D326A1BD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844891; cv=none; b=L20oHQ9OozKXaktN+Cy3tztYdeTtdKO1jiTDXBD1t+YX3IBk+UzHIQqBYPCEDsd5/t2j3W+2ri1BLERhKlnVuKkXXY/s3FFGK3GDH9irPHHZlNaK5JQg22lBj/JvV8KMVe0nul1HVYqwGTpLuhRQh/klKfCyNImvFibxPD8ebfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844891; c=relaxed/simple;
	bh=tDnXOE4HmetRM9ergwtwOk0oofTBYTeowkzenHyMGxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mbch7USYuMkxQoTTRmA+dQVnMOSxRAzls90kLAa/hawj6iLtSQ1Gyq/G0DRiHStkC+bU/DDq/jaYCpfkd8nXuafpQGGI5pYsBJ3z9DJvsRkIIHbbKIVbPaWvLA5eFwFSYW+634EejFGFntfDpJd8n3gcYyG5e6HNJfM0KaWmykA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cqqDGj/v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cqqDGj/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745844888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eg0z7Pus8n3D8i1OBhTFBP+P7WtdwbC7/sBYnKiCqJU=;
	b=cqqDGj/vX5GJZMvpFxpK1q/qAXOH9SixCyUpmgs1cn9JGgAZjfyO6P296diMA8dm9fBKtp
	p48JfzAqUG8XRVEgcGBd+M5R/ufKEPx/cH6IEJYJZJAwi0uU+n2J9ekDYIbCXbDTe1BZa3
	SWkioEo3qYZvjnP9KsWR/ovox/5bUsI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-LXguPoPFN8qL-ZhVr-JD-Q-1; Mon,
 28 Apr 2025 08:54:44 -0400
X-MC-Unique: LXguPoPFN8qL-ZhVr-JD-Q-1
X-Mimecast-MFC-AGG-ID: LXguPoPFN8qL-ZhVr-JD-Q_1745844883
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3F7B71956087;
	Mon, 28 Apr 2025 12:54:43 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.45.225.38])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4FC4119560A3;
	Mon, 28 Apr 2025 12:54:41 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [PATCH v3 1/3] timers: Rename tmigr 'online' bit to 'available'
Date: Mon, 28 Apr 2025 14:54:19 +0200
Message-ID: <20250428125417.102741-6-gmonaco@redhat.com>
In-Reply-To: <20250428125417.102741-5-gmonaco@redhat.com>
References: <20250428125417.102741-5-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

The timer migration hierarchy excludes offline CPUs via the
tmigr_is_not_available function, which is essentially checking the
online bit for the CPU.

Rename the online bit to available and all references in function names
and tracepoint to generalise the concept of available CPUs.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 include/trace/events/timer_migration.h |  4 ++--
 kernel/time/timer_migration.c          | 22 +++++++++++-----------
 kernel/time/timer_migration.h          |  2 +-
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/trace/events/timer_migration.h b/include/trace/events/timer_migration.h
index 47db5eaf2f9ab..61171b13c687c 100644
--- a/include/trace/events/timer_migration.h
+++ b/include/trace/events/timer_migration.h
@@ -173,14 +173,14 @@ DEFINE_EVENT(tmigr_cpugroup, tmigr_cpu_active,
 	TP_ARGS(tmc)
 );
 
-DEFINE_EVENT(tmigr_cpugroup, tmigr_cpu_online,
+DEFINE_EVENT(tmigr_cpugroup, tmigr_cpu_available,
 
 	TP_PROTO(struct tmigr_cpu *tmc),
 
 	TP_ARGS(tmc)
 );
 
-DEFINE_EVENT(tmigr_cpugroup, tmigr_cpu_offline,
+DEFINE_EVENT(tmigr_cpugroup, tmigr_cpu_unavailable,
 
 	TP_PROTO(struct tmigr_cpu *tmc),
 
diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 2f6330831f084..7efd897c79599 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -427,7 +427,7 @@ static DEFINE_PER_CPU(struct tmigr_cpu, tmigr_cpu);
 
 static inline bool tmigr_is_not_available(struct tmigr_cpu *tmc)
 {
-	return !(tmc->tmgroup && tmc->online);
+	return !(tmc->tmgroup && tmc->available);
 }
 
 /*
@@ -926,7 +926,7 @@ static void tmigr_handle_remote_cpu(unsigned int cpu, u64 now,
 	 * updated the event takes care when hierarchy is completely
 	 * idle. Otherwise the migrator does it as the event is enqueued.
 	 */
-	if (!tmc->online || tmc->remote || tmc->cpuevt.ignore ||
+	if (!tmc->available || tmc->remote || tmc->cpuevt.ignore ||
 	    now < tmc->cpuevt.nextevt.expires) {
 		raw_spin_unlock_irq(&tmc->lock);
 		return;
@@ -973,7 +973,7 @@ static void tmigr_handle_remote_cpu(unsigned int cpu, u64 now,
 	 * (See also section "Required event and timerqueue update after a
 	 * remote expiry" in the documentation at the top)
 	 */
-	if (!tmc->online || !tmc->idle) {
+	if (!tmc->available || !tmc->idle) {
 		timer_unlock_remote_bases(cpu);
 		goto unlock;
 	}
@@ -1435,19 +1435,19 @@ static long tmigr_trigger_active(void *unused)
 {
 	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
 
-	WARN_ON_ONCE(!tmc->online || tmc->idle);
+	WARN_ON_ONCE(!tmc->available || tmc->idle);
 
 	return 0;
 }
 
-static int tmigr_cpu_offline(unsigned int cpu)
+static int tmigr_cpu_unavailable(unsigned int cpu)
 {
 	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
 	int migrator;
 	u64 firstexp;
 
 	raw_spin_lock_irq(&tmc->lock);
-	tmc->online = false;
+	tmc->available = false;
 	WRITE_ONCE(tmc->wakeup, KTIME_MAX);
 
 	/*
@@ -1455,7 +1455,7 @@ static int tmigr_cpu_offline(unsigned int cpu)
 	 * offline; Therefore nextevt value is set to KTIME_MAX
 	 */
 	firstexp = __tmigr_cpu_deactivate(tmc, KTIME_MAX);
-	trace_tmigr_cpu_offline(tmc);
+	trace_tmigr_cpu_unavailable(tmc);
 	raw_spin_unlock_irq(&tmc->lock);
 
 	if (firstexp != KTIME_MAX) {
@@ -1466,7 +1466,7 @@ static int tmigr_cpu_offline(unsigned int cpu)
 	return 0;
 }
 
-static int tmigr_cpu_online(unsigned int cpu)
+static int tmigr_cpu_available(unsigned int cpu)
 {
 	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
 
@@ -1475,11 +1475,11 @@ static int tmigr_cpu_online(unsigned int cpu)
 		return -EINVAL;
 
 	raw_spin_lock_irq(&tmc->lock);
-	trace_tmigr_cpu_online(tmc);
+	trace_tmigr_cpu_available(tmc);
 	tmc->idle = timer_base_is_idle();
 	if (!tmc->idle)
 		__tmigr_cpu_activate(tmc);
-	tmc->online = true;
+	tmc->available = true;
 	raw_spin_unlock_irq(&tmc->lock);
 	return 0;
 }
@@ -1850,7 +1850,7 @@ static int __init tmigr_init(void)
 		goto err;
 
 	ret = cpuhp_setup_state(CPUHP_AP_TMIGR_ONLINE, "tmigr:online",
-				tmigr_cpu_online, tmigr_cpu_offline);
+				tmigr_cpu_available, tmigr_cpu_unavailable);
 	if (ret)
 		goto err;
 
diff --git a/kernel/time/timer_migration.h b/kernel/time/timer_migration.h
index ae19f70f8170f..70879cde6fdd0 100644
--- a/kernel/time/timer_migration.h
+++ b/kernel/time/timer_migration.h
@@ -97,7 +97,7 @@ struct tmigr_group {
  */
 struct tmigr_cpu {
 	raw_spinlock_t		lock;
-	bool			online;
+	bool			available;
 	bool			idle;
 	bool			remote;
 	struct tmigr_group	*tmgroup;
-- 
2.49.0

