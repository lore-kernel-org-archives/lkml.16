Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch [79.135.106.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A862F1EEA4A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745367633; cv=none; b=r6ak/ZM8u43Sdqr/nzHT+jbfOhOLmsjQq1BlEZsBXr8wdWLyRG6USjqtCwkU6gA8X1tR4B7osVD+JfxvJeWln535c7ddkTL+Q1vxH6EmTayls9pslHQFDjrGyxpQ+p4ocP6BrhmLQkiFE3KXhf7dygjDI4zE2kiQDHMtYfl3hiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745367633; c=relaxed/simple;
	bh=Rj+1L7wiGc50aCgbicmrIfLIlsPYyFqQnB3WkNjAi7w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rLFaSEFjrVgBXzmlPB3w9ECYiRxOvlER3fdxRCLfvtH7OZqAduGEmwhUisROeENyHH9YDZ/Bstjd30iBYb79qsH29JaKg6TAiCyntKoESVS8wuxfXnv9u3roNiZrlx2SP6lUg+DuPsvzo+XL2uHNAJFAGN9wo5YA9IlUyK3jLfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca; spf=pass smtp.mailfrom=gianis.ca; dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b=hFgYO+g1; arc=none smtp.client-ip=79.135.106.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gianis.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b="hFgYO+g1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gianis.ca;
	s=protonmail; t=1745367629; x=1745626829;
	bh=qWMVyorMyU7WrTA+bky3Xgb1ylZ1FY0Pzqsqe9JTPKI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=hFgYO+g17Z7f0z7U1SH712Qf0n/1MSMi9uNpqT1n0hSAFpeyxvN+c9R1CVG5WSvHG
	 QzuhCt9hAdkw6g7HB5o1eEIHuKmYX6MTY+i8UfgJU7QL4vIvMHnz2vaVPOvwAKWVVq
	 ZXsX8kXSLjNLevDd4YHuDABEgOorG4NdfreLWCGL9G8rhsqAV6mhrlBW14spEcI3fY
	 vTz/qQ+J8HBCPII1Qk9zGTZW/MDlIEt60nOhX5LHg7yY6B+09AisDu5IOkPZqd1RX9
	 FvHN1fQavk4CU8gFsl8lOxlgGB8pd57JzDEQlDwUEiTZUPUnz38+RC52Y0fV8if8u7
	 hoC+2jJlbN8EA==
Date: Wed, 23 Apr 2025 00:20:22 +0000
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
From: "Dhaval Giani (AMD)" <dhaval@gianis.ca>
Cc: linux-kernel@vger.kernel.org, Dhaval Giani <dhaval.giani@amd.com>, Gautham Shenoy <gautham.shenoy@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>, "Dhaval Giani (AMD)" <dhaval@gianis.ca>
Subject: [PATCH 2/3] sched/fair: Add a test to test that a task selected to run has positive lag
Message-ID: <20250422-b4-eevdf-tests-v1-post-v1-2-35d158254c72@gianis.ca>
In-Reply-To: <20250422-b4-eevdf-tests-v1-post-v1-0-35d158254c72@gianis.ca>
References: <20250422-b4-eevdf-tests-v1-post-v1-0-35d158254c72@gianis.ca>
Feedback-ID: 128275035:user:proton
X-Pm-Message-ID: a9caaeb7b2dd126acf537f9ed036f7b74efe0297
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Lemma 1 from the original EEVDF paper says that any task that
has a positive lag is eligible to run.

This test tests the opposite - any task that is picked to run must
have a positive lag for it to be eligible to run.

To: Ingo Molnar <mingo@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
To: Juri Lelli <juri.lelli@redhat.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
To: Ben Segall <bsegall@google.com>
To: Mel Gorman <mgorman@suse.de>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org
Cc: Dhaval Giani <dhaval.giani@amd.com>
Cc: Gautham Shenoy <gautham.shenoy@amd.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Dhaval Giani (AMD) <dhaval@gianis.ca>
---
 kernel/sched/eevdf-tests.c | 41 +++++++++++++++++++++++++++++++++++++++++
 kernel/sched/fair.c        |  2 ++
 kernel/sched/sched.h       |  2 ++
 3 files changed, 45 insertions(+)

diff --git a/kernel/sched/eevdf-tests.c b/kernel/sched/eevdf-tests.c
index 3bc016d3025733e53f586e30fcd31f650156d47e..8532330769bcc93dbf9cd98ebba=
75c838f62c045 100644
--- a/kernel/sched/eevdf-tests.c
+++ b/kernel/sched/eevdf-tests.c
@@ -18,10 +18,51 @@
=20
 #ifdef CONFIG_SCHED_EEVDF_TESTING
=20
+/*
+ * Test parameters
+ */
+bool eevdf_positive_lag_test;
+u8 eevdf_positive_lag_count =3D 10;
+
 static struct dentry *debugfs_eevdf_testing;
 void debugfs_eevdf_testing_init(struct dentry *debugfs_sched)
 {
 =09debugfs_eevdf_testing =3D debugfs_create_dir("eevdf-testing", debugfs_s=
ched);
=20
+=09debugfs_create_bool("eevdf_positive_lag_test", 0700,
+=09=09=09=09debugfs_eevdf_testing, &eevdf_positive_lag_test);
+=09debugfs_create_u8("eevdf_positive_lag_test_count", 0600,
+=09=09=09=09debugfs_eevdf_testing, &eevdf_positive_lag_count);
+
 }
+
+void test_eevdf_positive_lag(struct cfs_rq *cfs, struct sched_entity *se)
+{
+=09static int eevdf_positive_lag_test_counter;
+=09u64 eevdf_average_vruntime;
+
+=09if (!eevdf_positive_lag_test)
+=09=09return;
+
+=09if (!se || !cfs)
+=09=09return;
+
+=09eevdf_average_vruntime =3D avg_vruntime(cfs);
+=09eevdf_positive_lag_test_counter++;
+
+=09if (se->vruntime > eevdf_average_vruntime) {
+=09=09trace_printk("FAIL: Lemma 1 failed - selected task has negative lag\=
n");
+=09=09eevdf_positive_lag_test =3D 0;
+=09=09eevdf_positive_lag_test_counter =3D 0;
+=09=09return;
+=09}
+
+=09if (eevdf_positive_lag_test_counter > eevdf_positive_lag_count) {
+=09=09eevdf_positive_lag_test =3D 0;
+=09=09eevdf_positive_lag_test_counter =3D 0;
+=09=09trace_printk("PASS: At least %u selected tasks had positive lag\n",
+=09=09=09=09=09=09=09eevdf_positive_lag_count);
+=09}
+}
+
 #endif /* CONFIG_SCHED_EEVDF_TESTING */
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index eb5a2572b4f8b6b5517befc299312b6ae7476e88..924d9d35c2aa937bc0f4ca9565b=
a774397b90f77 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -980,6 +980,8 @@ static struct sched_entity *pick_eevdf(struct cfs_rq *c=
fs_rq)
 =09if (!best || (curr && entity_before(curr, best)))
 =09=09best =3D curr;
=20
+=09test_eevdf_positive_lag(cfs_rq, best);
+
 =09return best;
 }
=20
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 09cefe2aa871bbd533a413c76026895e969a58e7..5ad5e033e1c81167b712ab176d4=
d55e6b5d82d06 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3990,8 +3990,10 @@ void sched_enq_and_set_task(struct sched_enq_and_set=
_ctx *ctx);
=20
 #ifdef CONFIG_SCHED_EEVDF_TESTING
 void debugfs_eevdf_testing_init(struct dentry *debugfs_sched);
+void test_eevdf_positive_lag(struct cfs_rq *cfs, struct sched_entity *se);
 #else /* CONFIG_SCHED_EEVDF_TESTING */
 static inline void init_eevdf_testing_debugfs(struct dentry *debugfs_sched=
) {}
+static inline void test_eevdf_positive_lag(struct cfs_rq *cfs, struct sche=
d_entity *se) {}
 #endif /* CONFIG_SCHED_EEVDF_TESTING */
=20
 #endif /* _KERNEL_SCHED_SCHED_H */

--=20
2.49.0


