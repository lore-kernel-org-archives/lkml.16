Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5BA4685
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 19:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748546532; cv=none; b=fyBn72IcottgvtRCajjjbVT6x2z4qwdUF0EoplcYOUO0DPMemKuufAv/M8Gt4wCTcyZcrG0Yf+qIxwnwaPF450kRwUC5RSd33LRSmDyTEM8NneD0Y8bLsgt+orx3QS9JxBzEsCxntzEqvtfQBLweO4S2fG9r9vaxJa/GuQBoZEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748546532; c=relaxed/simple;
	bh=//kcQKhhyjZ+NR+DfjeU8tqQgiXwCObQJurJL8Ngmj4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=dtnsHFuKNMsDyg557gnEcJW3rePc5EW1JmBShd9cES7Chki4tvCVrxCJmnei29NNphJQ9qfVqstznGMTQtXFQehTo5jdkundReqSJgdqe4vazBBDPCKsFKx6NvGGSIiNoSrT10seRc0hjEFahmccsGM7IoHt7qU/UV4jMqW6wyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3dNQtnyq; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3dNQtnyq"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-73bfc657aefso913832b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 12:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748546530; x=1749151330; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gLjZL1t5Rkyj1FbzmSx+BdHjQ+wVpVfHl2EB4V/19vA=;
        b=3dNQtnyqsnUH4tk6f4+E+3nD/Lcg+p6fFy8PxZrVpugXQBzCzNLXLu1N+2XjgGARCn
         0mxBp9RIYPV0a2aMPm+MZPYnORYsjppDbrpfn/5A0J5tBNwgMZir+4Ya5c+LaknX6/TD
         8egD+J0kwnB9M7V8RrnAjH+u73IMvwou/OjaowHY/HYXIOJnHIBNP8N6N+DUIyiHOMvu
         XvzTIgbTXJ08hnXUQP76nSf0cpfDGE31oh9oldEl530z5rasXWHSpGFp2COAxVck/TEb
         EARzk27FccdDxcARcT48hA9d8571Udyfeu0ACl+Zds/QPcyCtIO+okprOM2wkHGNraGd
         4jNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748546530; x=1749151330;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gLjZL1t5Rkyj1FbzmSx+BdHjQ+wVpVfHl2EB4V/19vA=;
        b=GvUaRP8wlJAu0RZk5ZRLKQVQFPsVDHGYlysRiQs4r7KENkMKR5Dw89zCO1ypzH6Dhb
         MO3OHWibWnwo2OcqqvYZWENhAea26Zx0z35W+wbu15y9Y7cBqPjHro22AhXhkexuMYQQ
         L/pvpj00Lk6cqsYgKhWt/vD0eIWIJmSZCd/lOsMjId/1ucmcBoaAEE6dY0CQx1qqeELE
         HizNmfbHRgRv6t0E6VgTJyJhsuTx2cdaf7ld4JEps0u1upIhK/uCSe1StIrvPRzv+1zU
         TKc+3/UR+Fq7SAmtjTSCjnifQZ9VJ5Q5mFvCx/tibbKfXPNnQghKjTUag8skX6RUrJh7
         znDg==
X-Forwarded-Encrypted: i=1; AJvYcCUVWJdeQpRS2HFMpuwhX2UDaC3aVXqnY75fwV8cAHX9NN84L6uWFZTjEMXMlqnNLgs8hTS4YaVYf2NeyfI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Z3XdW3S/6Db1fdTtT1Wtus8l2PFShlOqnIZe84okZ28CiKHi
	ufaPBbSQRM8zLuSf6uDigQ6NbAu62vnqNoNxvaobnRF92kOWYP+j7AmPPm0CW6AwTRL/6gnJB2R
	tFx7P4XnXOw==
X-Google-Smtp-Source: AGHT+IF7272YsR+P0xvDbs8iwADyn+6vDrmzEe6NhB1nWukMJ2oLMyuozrn/Qkrmjm8I6s8SNkp6LjdPMmju
X-Received: from pfbks22.prod.google.com ([2002:a05:6a00:4b96:b0:747:a305:836a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b8b:b0:73f:ff25:90b3
 with SMTP id d2e1a72fcca58-747bda1b8e4mr861023b3a.24.1748546530327; Thu, 29
 May 2025 12:22:10 -0700 (PDT)
Date: Thu, 29 May 2025 12:22:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529192206.971199-1-irogers@google.com>
Subject: [PATCH v1] perf thread: Ensure comm_lock held for comm_list
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Howard Chu <howardchu95@gmail.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add thread safety annotations for comm_list and add locking for two
instances where the list is accessed without the lock held (in
contradiction to ____thread__set_comm()).

Signed-off-by: Ian Rogers <irogers@google.com>
---
This reverts commit 24bcc31fc75b760e7813e1c8257a7439e045e8ad and
squashes it with the fix:
https://lore.kernel.org/lkml/20250528032637.198960-8-irogers@google.com/
---
 tools/perf/util/comm.c   |  2 ++
 tools/perf/util/thread.c | 26 ++++++++++++++++++++++----
 tools/perf/util/thread.h |  9 +++++----
 3 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
index 8aa456d7c2cd..9880247a2c33 100644
--- a/tools/perf/util/comm.c
+++ b/tools/perf/util/comm.c
@@ -24,6 +24,7 @@ static struct comm_strs {
 static void comm_strs__remove_if_last(struct comm_str *cs);
 
 static void comm_strs__init(void)
+	NO_THREAD_SAFETY_ANALYSIS /* Inherently single threaded due to pthread_once. */
 {
 	init_rwsem(&_comm_strs.lock);
 	_comm_strs.capacity = 16;
@@ -119,6 +120,7 @@ static void comm_strs__remove_if_last(struct comm_str *cs)
 }
 
 static struct comm_str *__comm_strs__find(struct comm_strs *comm_strs, const char *str)
+	SHARED_LOCKS_REQUIRED(comm_strs->lock)
 {
 	struct comm_str **result;
 
diff --git a/tools/perf/util/thread.c b/tools/perf/util/thread.c
index 415c0e5d1e75..f4ad15e1e314 100644
--- a/tools/perf/util/thread.c
+++ b/tools/perf/util/thread.c
@@ -41,6 +41,7 @@ int thread__init_maps(struct thread *thread, struct machine *machine)
 }
 
 struct thread *thread__new(pid_t pid, pid_t tid)
+	NO_THREAD_SAFETY_ANALYSIS /* Allocation/creation is inherently single threaded. */
 {
 	RC_STRUCT(thread) *_thread = zalloc(sizeof(*_thread));
 	struct thread *thread;
@@ -200,7 +201,8 @@ int thread__set_namespaces(struct thread *thread, u64 timestamp,
 	return ret;
 }
 
-struct comm *thread__comm(struct thread *thread)
+static struct comm *__thread__comm(struct thread *thread)
+	SHARED_LOCKS_REQUIRED(thread__comm_lock(thread))
 {
 	if (list_empty(thread__comm_list(thread)))
 		return NULL;
@@ -208,16 +210,30 @@ struct comm *thread__comm(struct thread *thread)
 	return list_first_entry(thread__comm_list(thread), struct comm, list);
 }
 
+struct comm *thread__comm(struct thread *thread)
+{
+	struct comm *res = NULL;
+
+	down_read(thread__comm_lock(thread));
+	res = __thread__comm(thread);
+	up_read(thread__comm_lock(thread));
+	return res;
+}
+
 struct comm *thread__exec_comm(struct thread *thread)
 {
 	struct comm *comm, *last = NULL, *second_last = NULL;
 
+	down_read(thread__comm_lock(thread));
 	list_for_each_entry(comm, thread__comm_list(thread), list) {
-		if (comm->exec)
+		if (comm->exec) {
+			up_read(thread__comm_lock(thread));
 			return comm;
+		}
 		second_last = last;
 		last = comm;
 	}
+	up_read(thread__comm_lock(thread));
 
 	/*
 	 * 'last' with no start time might be the parent's comm of a synthesized
@@ -233,8 +249,9 @@ struct comm *thread__exec_comm(struct thread *thread)
 
 static int ____thread__set_comm(struct thread *thread, const char *str,
 				u64 timestamp, bool exec)
+	EXCLUSIVE_LOCKS_REQUIRED(thread__comm_lock(thread))
 {
-	struct comm *new, *curr = thread__comm(thread);
+	struct comm *new, *curr = __thread__comm(thread);
 
 	/* Override the default :tid entry */
 	if (!thread__comm_set(thread)) {
@@ -285,8 +302,9 @@ int thread__set_comm_from_proc(struct thread *thread)
 }
 
 static const char *__thread__comm_str(struct thread *thread)
+	SHARED_LOCKS_REQUIRED(thread__comm_lock(thread))
 {
-	const struct comm *comm = thread__comm(thread);
+	const struct comm *comm = __thread__comm(thread);
 
 	if (!comm)
 		return NULL;
diff --git a/tools/perf/util/thread.h b/tools/perf/util/thread.h
index cd574a896418..56e08c8ae005 100644
--- a/tools/perf/util/thread.h
+++ b/tools/perf/util/thread.h
@@ -236,14 +236,15 @@ static inline struct rw_semaphore *thread__namespaces_lock(struct thread *thread
 	return &RC_CHK_ACCESS(thread)->namespaces_lock;
 }
 
-static inline struct list_head *thread__comm_list(struct thread *thread)
+static inline struct rw_semaphore *thread__comm_lock(struct thread *thread)
 {
-	return &RC_CHK_ACCESS(thread)->comm_list;
+	return &RC_CHK_ACCESS(thread)->comm_lock;
 }
 
-static inline struct rw_semaphore *thread__comm_lock(struct thread *thread)
+static inline struct list_head *thread__comm_list(struct thread *thread)
+	SHARED_LOCKS_REQUIRED(thread__comm_lock(thread))
 {
-	return &RC_CHK_ACCESS(thread)->comm_lock;
+	return &RC_CHK_ACCESS(thread)->comm_list;
 }
 
 static inline u64 thread__db_id(const struct thread *thread)
-- 
2.49.0.1204.g71687c7c1d-goog

