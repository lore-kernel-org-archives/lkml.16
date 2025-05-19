Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB3021858D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 22:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694814; cv=none; b=hmGY1O/VAUsoihr0yRWULZzQ4Y3CPdOsLxO2c+R3I602m0cviVPpkW028k+K1VwQ3smF2ukeKGDMcQ0dc1/9Pw4hNzYRbmqEcgAR7EPqijBlbG3zpY9Iz5uK0k6rhQjqdBrgZfyRlH0gQUjB75feSl+gSUQ3kNO+KoOpWk2YZdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694814; c=relaxed/simple;
	bh=hampTiEqcM64fslRupocPnzv6w7Y1qqL0QZORCAGJ5g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=f94zWbw8vJFBDcovmef7lyM1BvnQqHMo0Y6uTQloUHuGlg7B/SY6IxyZD/bUuKqk8LWjyBgt9nTmNTjGgtEZdUvIncR4llPCj/Fa2TjKMeAxt5jTpSKnZ0JTKdMOMoqL1CBJv1kduq6+uEeYKG+a5374oEqaiw8rixYEgz1KZCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RONU30kC; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RONU30kC"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-231d4e36288so33508055ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747694812; x=1748299612; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E9B7fD98tiHNIK7g1ap3uCvtfvAjWJDBjHAW2LaV36I=;
        b=RONU30kC77cvJCpzIxYluKjYchENZbp13NNW3B9i/sEamMXfFRGpuspbQ1XVg+2Kjm
         hg6ZMzozHGjMyLuN4BQX0STKiqmIfdcrgwIEFGfMrnbMrCVvEDbHEXHcT5t/0bVYX9s7
         fW2C/mWckOTZQ50o6KaeK1kILfrdlmf0W6n4ZgXmRhN+ZW+2MYSJeru3OMwsT7/jJOhN
         7R8FUmUUensHsTwxtx6fe/RyWwxaKHqS3VA4EptRdlQV0OznccMErdQkQG6kIQTyjokr
         U3cVJOIcfmePkfhoOlwGkaQuLEOTgRGsYdE2EuwkxTtldwJGbC96A4GBoiUYYpFvL1Ri
         2qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747694812; x=1748299612;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E9B7fD98tiHNIK7g1ap3uCvtfvAjWJDBjHAW2LaV36I=;
        b=hMMhbPTQio4CbUau1C+8FsYbjcW1/ZN3j5phFO9pe2uHZdHz0TQwSAXxxnWl3dzFXk
         mp2pVjNH4nPSbzmZr2/roSZKJ+IBPAJV7Lb+jFOTnO4uXdVL+URKJPoDs9+2WPGOXvfl
         GY6KrHmxWxunBaR67hs+QiXbYGHpttTWYP4mfW9BDzQ7g2sfEX6AmxSF9dKZwCvOcn1g
         gUt+vwIoeHarApVuyASqnhqCq5wjDXX2t49hVFp5HP6Hy/uSKeOa46fpe8Pj45sz5+e0
         Srwp1ixTWqA6A3NwXiLRlWBDTh9w+3sq99OYTAjB5mAcs2Q+YyG7PtooG58sFJu3JfkV
         Gmbw==
X-Forwarded-Encrypted: i=1; AJvYcCVeTdseEZPuBppQ1jGjkfUHtVj0tcqXHDJVmDfEiehuqeri9CUvS2vxxZKZ2ftrmk8xOaljm1XSG3R+wB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYyA1f7zcAYAkd3/9JWMbEb46tLH8iHhif+ivVBfYMBsQPCch5
	USQNeoB6n183IHmcFIjvJ9+i3maHqXfWLdp+/en4HhX5bQE/u+DSP5NHLUR07TPX971zLZvVa/g
	PGI8J+wJOVg==
X-Google-Smtp-Source: AGHT+IGKk00Z52yIOLFbplK0BmTXlnSsVEn/uFG6HYB3tI9b1ssiet2LR2dH2LCBFQMTRhNGanF5YaYrEvW0
X-Received: from plpe4.prod.google.com ([2002:a17:903:3c24:b0:22e:4288:ad7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2ec8:b0:224:1943:c65
 with SMTP id d9443c01a7336-231d44e64e6mr204413365ad.14.1747694812083; Mon, 19
 May 2025 15:46:52 -0700 (PDT)
Date: Mon, 19 May 2025 15:46:44 -0700
In-Reply-To: <20250519224645.1810891-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519224645.1810891-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519224645.1810891-2-irogers@google.com>
Subject: [PATCH v1 2/3] perf rwsem: Add thread-safety annotations
From: Ian Rogers <irogers@google.com>
To: langfei@huawei.com, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, James Clark <james.clark@linaro.org>, 
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Howard Chu <howardchu95@gmail.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Add annotations used by clang's -Wthread-safety. Fix dsos compilation
errors caused by a lock of annotations.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dsos.c  |  3 +++
 tools/perf/util/mutex.h | 11 +++++++++++
 tools/perf/util/rwsem.c |  4 ++++
 tools/perf/util/rwsem.h | 10 +++++-----
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index e0998e2a7c4e..4d213017d202 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -157,6 +157,7 @@ static struct dso *__dsos__find_by_longname_id(struct dsos *dsos,
 					       const char *name,
 					       const struct dso_id *id,
 					       bool write_locked)
+	SHARED_LOCKS_REQUIRED(dsos->lock)
 {
 	struct dsos__key key = {
 		.long_name = name,
@@ -262,6 +263,7 @@ static int dsos__find_id_cb(struct dso *dso, void *data)
 
 static struct dso *__dsos__find_id(struct dsos *dsos, const char *name, const struct dso_id *id,
 				   bool cmp_short, bool write_locked)
+	SHARED_LOCKS_REQUIRED(dsos->lock)
 {
 	struct dso *res;
 
@@ -338,6 +340,7 @@ static struct dso *__dsos__addnew_id(struct dsos *dsos, const char *name, const
 }
 
 static struct dso *__dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id)
+	SHARED_LOCKS_REQUIRED(dsos->lock)
 {
 	struct dso *dso = __dsos__find_id(dsos, name, id, false, /*write_locked=*/true);
 
diff --git a/tools/perf/util/mutex.h b/tools/perf/util/mutex.h
index 62d258c71ded..38458f00846f 100644
--- a/tools/perf/util/mutex.h
+++ b/tools/perf/util/mutex.h
@@ -42,6 +42,12 @@
 /* Documents functions that acquire a lock in the body of a function, and do not release it. */
 #define EXCLUSIVE_LOCK_FUNCTION(...)  __attribute__((exclusive_lock_function(__VA_ARGS__)))
 
+/*
+ * Documents functions that acquire a shared (reader) lock in the body of a
+ * function, and do not release it.
+ */
+#define SHARED_LOCK_FUNCTION(...)  __attribute__((shared_lock_function(__VA_ARGS__)))
+
 /*
  * Documents functions that expect a lock to be held on entry to the function,
  * and release it in the body of the function.
@@ -55,6 +61,9 @@
 /* Documents a function that expects a mutex to be held prior to entry. */
 #define EXCLUSIVE_LOCKS_REQUIRED(...) __attribute__((exclusive_locks_required(__VA_ARGS__)))
 
+/* Documents a function that expects a shared (reader) lock to be held prior to entry. */
+#define SHARED_LOCKS_REQUIRED(...) __attribute__((shared_locks_required(__VA_ARGS__)))
+
 /* Turns off thread safety checking within the body of a particular function. */
 #define NO_THREAD_SAFETY_ANALYSIS __attribute__((no_thread_safety_analysis))
 
@@ -66,9 +75,11 @@
 #define LOCKS_EXCLUDED(...)
 #define LOCK_RETURNED(x)
 #define EXCLUSIVE_LOCK_FUNCTION(...)
+#define SHARED_LOCK_FUNCTION(...)
 #define UNLOCK_FUNCTION(...)
 #define EXCLUSIVE_TRYLOCK_FUNCTION(...)
 #define EXCLUSIVE_LOCKS_REQUIRED(...)
+#define SHARED_LOCKS_REQUIRED(...)
 #define NO_THREAD_SAFETY_ANALYSIS
 
 #endif
diff --git a/tools/perf/util/rwsem.c b/tools/perf/util/rwsem.c
index 5109167f27f7..9d26832398db 100644
--- a/tools/perf/util/rwsem.c
+++ b/tools/perf/util/rwsem.c
@@ -27,6 +27,7 @@ int exit_rwsem(struct rw_semaphore *sem)
 }
 
 int down_read(struct rw_semaphore *sem)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 #if RWS_ERRORCHECK
 	mutex_lock(&sem->mtx);
@@ -37,6 +38,7 @@ int down_read(struct rw_semaphore *sem)
 }
 
 int up_read(struct rw_semaphore *sem)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 #if RWS_ERRORCHECK
 	mutex_unlock(&sem->mtx);
@@ -47,6 +49,7 @@ int up_read(struct rw_semaphore *sem)
 }
 
 int down_write(struct rw_semaphore *sem)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 #if RWS_ERRORCHECK
 	mutex_lock(&sem->mtx);
@@ -57,6 +60,7 @@ int down_write(struct rw_semaphore *sem)
 }
 
 int up_write(struct rw_semaphore *sem)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 #if RWS_ERRORCHECK
 	mutex_unlock(&sem->mtx);
diff --git a/tools/perf/util/rwsem.h b/tools/perf/util/rwsem.h
index ef5cbc31d967..b102d8143181 100644
--- a/tools/perf/util/rwsem.h
+++ b/tools/perf/util/rwsem.h
@@ -10,7 +10,7 @@
  */
 #define RWS_ERRORCHECK 0
 
-struct rw_semaphore {
+struct LOCKABLE rw_semaphore {
 #if RWS_ERRORCHECK
 	struct mutex mtx;
 #else
@@ -21,10 +21,10 @@ struct rw_semaphore {
 int init_rwsem(struct rw_semaphore *sem);
 int exit_rwsem(struct rw_semaphore *sem);
 
-int down_read(struct rw_semaphore *sem);
-int up_read(struct rw_semaphore *sem);
+int down_read(struct rw_semaphore *sem) SHARED_LOCK_FUNCTION(sem);
+int up_read(struct rw_semaphore *sem) UNLOCK_FUNCTION(sem);
 
-int down_write(struct rw_semaphore *sem);
-int up_write(struct rw_semaphore *sem);
+int down_write(struct rw_semaphore *sem) EXCLUSIVE_LOCK_FUNCTION(sem);
+int up_write(struct rw_semaphore *sem) UNLOCK_FUNCTION(sem);
 
 #endif /* _PERF_RWSEM_H */
-- 
2.49.0.1101.gccaa498523-goog

