Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231511A83F9
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 22:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694813; cv=none; b=E3z/kQnYyOmPsPC5h5Pp/xx3oRqIUd11Qy7dN4nCuiV8Miv4jz4/j+z8So/nu7ynfGYBFE/74/UO4ruCWRlHOws0TWSGCyzWt2MF66UhbwLdR3l7v0UHUzXjXmvS5Ndj2fpe3Ui706W6e4t9B9DXPnWRkSCL9Ggv3S9l/wigVNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694813; c=relaxed/simple;
	bh=I7I2sRbvItFxCmQj4vPhU9oUJu99f14BP1WCs3BzVNA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=EZtuJXZIcv7i1OB6L5+IIZ0o0hI8N9tGbdFblDFJwIZP4w2mcoENPYmGwmKm+sFkKp8GWkRqst+w+LkkU8S2RmFYJHaatH3mzgq/1RMQnVK91l7MFvCy73ynVU6uDEmArZKDgFSBcK1ytNf20qguWXShjWK3TIM1+GF6kM7FmQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yUZfv0Ry; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yUZfv0Ry"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-742b01ad1a5so4805694b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747694810; x=1748299610; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=drkhaIiLDTSEyMyeVkIjGYcSDU5tMRWddFy401r3wfM=;
        b=yUZfv0RyfDhnNt1HxpkVKQi4BFvMlNmBjnRJyb7MpdIBMbS78ndJD/iOjWWlCuH4xE
         WIweXkNEa0SR7GVC5QzacHg4HHPcfbzsum9mmBoX46ThwFM5WrQgrqRnZc0hKC4Z/yAm
         Jt+xdWPG5ClGiPcfOQzcPyOPCU1V+5UHGhfW68eWI1GuMwZriHji8kC4Tn35eVve6+IW
         2QfWpRKI/pj4YItSwLAmkPzRD8K2RnWdwFBWfuqvRHXwQVfPFoH/Je6iTqqe+Om4oCOP
         v32ugrbyNS0l7v1GvDHxnAbMz/AXdhFRkl1Rm8+P1VipYqhKVoScbXvr3Fch6ZtgKzf9
         5j9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747694810; x=1748299610;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drkhaIiLDTSEyMyeVkIjGYcSDU5tMRWddFy401r3wfM=;
        b=qd3Fm+j2bUs4N8YCzdNjN8DrjGGii5CkA3NcwK+PnkJBMHKNzxGWbJp4noznNU9omY
         ZwtXrLhoC3fl9FDCfG/A36aoJdgFyCr00sQabwreVyrPif78wKYN6+iqK13dZqgbBLuM
         FJk5uUbN8rDqcxNNIg2RbP2xGrOLKQjeWppBlpUCFWvy1miN6uoqbv3PWcIf4dniPjhf
         5afekbMCzGmO7DreWv38A62Vi3wK74hQ0qCob6Q0DQ3/+GnpjV+P5d33AXjFbHXJjc64
         gcDTCp0yqe/VK9NR5aY3z/mXqYKZb80T5TpGsxdjSqtlHAmrB6F1AfQrMWjxddRELHum
         aQsg==
X-Forwarded-Encrypted: i=1; AJvYcCUfiVb/ip2pNCtT3P/OZG4aniGf/NrABGo6CAMVHZecwvMI9PRBqyRVzpu/zHbaGsprTWrEgUshiEHQkCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYZmmthN2KAGlfYJ7RFBzMhUpO30XJGfuQyYfK8XB3JHrJx+2E
	Qp/rimRBnr4fRXr9+HgXEhTe1pZ+7ebVthBKHF6G0iHKmU5xTQZ1ytKlMiXw6frwJ0wMa7g+OJu
	Fg62aesmFyA==
X-Google-Smtp-Source: AGHT+IFS2B4zNJvVlte18uhhB7AZ/JaHnQshp/6/xrgjD5y92JvbJ4A+a3mLnC79I8+y1spNu0RRK9FLDfz7
X-Received: from pfij19.prod.google.com ([2002:aa7:8013:0:b0:742:a97f:55eb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3e0b:b0:736:34a2:8a18
 with SMTP id d2e1a72fcca58-742acd75e6amr22243628b3a.24.1747694810372; Mon, 19
 May 2025 15:46:50 -0700 (PDT)
Date: Mon, 19 May 2025 15:46:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519224645.1810891-1-irogers@google.com>
Subject: [PATCH v1 1/3] perf dso: Minor refactor to allow Wthread-safety analysis
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

The pattern:
```
if (x) {
   lock(...)
}
block1;
if (x) {
   unlock(...)
}
```
defeats clang's -Wthread-safety analysis where it complains of locks
held on one path and not another. Add helper functions for "block1"
then restructure as:
```
if (x) {
   lock(...);
   block1();
   unlock(...);
} else {
   block1();
}
```

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c | 45 +++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 8619b6eea62d..057fcf4225ac 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1349,6 +1349,16 @@ struct dso *machine__findnew_kernel(struct machine *machine, const char *name,
 	return dso;
 }
 
+static void __dso__set_long_name_id(struct dso *dso, const char *name, bool name_allocated)
+{
+	if (dso__long_name_allocated(dso))
+		free((char *)dso__long_name(dso));
+
+	RC_CHK_ACCESS(dso)->long_name = name;
+	RC_CHK_ACCESS(dso)->long_name_len = strlen(name);
+	dso__set_long_name_allocated(dso, name_allocated);
+}
+
 static void dso__set_long_name_id(struct dso *dso, const char *name, bool name_allocated)
 {
 	struct dsos *dsos = dso__dsos(dso);
@@ -1362,18 +1372,11 @@ static void dso__set_long_name_id(struct dso *dso, const char *name, bool name_a
 		 * renaming the dso.
 		 */
 		down_write(&dsos->lock);
-	}
-
-	if (dso__long_name_allocated(dso))
-		free((char *)dso__long_name(dso));
-
-	RC_CHK_ACCESS(dso)->long_name = name;
-	RC_CHK_ACCESS(dso)->long_name_len = strlen(name);
-	dso__set_long_name_allocated(dso, name_allocated);
-
-	if (dsos) {
+		__dso__set_long_name_id(dso, name, name_allocated);
 		dsos->sorted = false;
 		up_write(&dsos->lock);
+	} else {
+		__dso__set_long_name_id(dso, name, name_allocated);
 	}
 }
 
@@ -1451,6 +1454,16 @@ void dso__set_long_name(struct dso *dso, const char *name, bool name_allocated)
 	dso__set_long_name_id(dso, name, name_allocated);
 }
 
+static void __dso__set_short_name(struct dso *dso, const char *name, bool name_allocated)
+{
+	if (dso__short_name_allocated(dso))
+		free((char *)dso__short_name(dso));
+
+	RC_CHK_ACCESS(dso)->short_name		  = name;
+	RC_CHK_ACCESS(dso)->short_name_len	  = strlen(name);
+	dso__set_short_name_allocated(dso, name_allocated);
+}
+
 void dso__set_short_name(struct dso *dso, const char *name, bool name_allocated)
 {
 	struct dsos *dsos = dso__dsos(dso);
@@ -1464,17 +1477,11 @@ void dso__set_short_name(struct dso *dso, const char *name, bool name_allocated)
 		 * renaming the dso.
 		 */
 		down_write(&dsos->lock);
-	}
-	if (dso__short_name_allocated(dso))
-		free((char *)dso__short_name(dso));
-
-	RC_CHK_ACCESS(dso)->short_name		  = name;
-	RC_CHK_ACCESS(dso)->short_name_len	  = strlen(name);
-	dso__set_short_name_allocated(dso, name_allocated);
-
-	if (dsos) {
+		__dso__set_short_name(dso, name, name_allocated);
 		dsos->sorted = false;
 		up_write(&dsos->lock);
+	} else {
+		__dso__set_short_name(dso, name, name_allocated);
 	}
 }
 
-- 
2.49.0.1101.gccaa498523-goog

