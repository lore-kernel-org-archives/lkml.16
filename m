Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A081F1537
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748402810; cv=none; b=KMeMrPNjfwqRGfUeUKGy2B4AOPLpQ0vS7uTUSAumlrp2crJ5Y2sVzKyH59qHN2ovnjCzxHgjigsmlq8JmjvEQfDeADL+5d8k5M4pAzqek8n3yKtqsSAq/YA0p9I1v8ZkkTUxWn+vWR6v3bRc/vZZy7NhY3gkh9pV8cFmbaMNMLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748402810; c=relaxed/simple;
	bh=vodGThRXgNPhLOZhGOF+xKFixgiQjVsXK1iLntjGX+8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=Uj58lH38u1HDd6y2ftA0lX2J03wQ9hZ3rHPTN6hXX5fTnTKg8HO+LzyFbwdiAFNgvmnSlbgbmG24QkgCcIkZJwxE80BXgSGcVLQWbIRjKEUL7hMW0ooZ/vJxLYTNsqbFyMMJ98MqePsgFmcqqPfDz6DjDkxqokJ+8WtgbKXR12g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p9vpnSQl; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p9vpnSQl"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311e7d05931so232812a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748402808; x=1749007608; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kpuphHNFZYk51oscAtbjRW9L8GOQohc1UsTHbxwK6q0=;
        b=p9vpnSQlxH3k5pkSbvoN8l+1sTUuYCZO4qYklJh9SaQldD1ci6vKtvjpWlMdmXI94a
         zdnATKL+kUjp+pMwOXZjMIG/qDrRlb9Zpc/j50yTXdg+OT8mE5XqkfOsDmlKir4G2WSc
         ehRWnxzHuOvQeIVShhxqMdL1eqKj+CdKAeMpAyUU1KguWxo6JBbIZQZwEleFouCuUThf
         MzPPvQJKHS8tbM1TLThtRWoamxgcoHdX7e5aWR5ajRVPReX7rZRNH58XIWYASqtFcXPr
         MvAm/kI8p6/7GI4sJOIBUr8kn2NEoNWePUR7mNKI2E/zXn/6tGTzXmcjcPyjfxIIR7mh
         eazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748402808; x=1749007608;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kpuphHNFZYk51oscAtbjRW9L8GOQohc1UsTHbxwK6q0=;
        b=GE4HRFytplgWQ5GoyQDqjLBLNONScxW15X6qGTnPXyFSc49qYzIFvLiQp12a/vBYec
         /RnMqx/T6KPhdbIcQ3fP14LDM1b/S0nNOo4EAu9ESf7FQhKerwkJK0g+FMcYgbu2o6dL
         XhcabnASc3MEZ8+vGHJL08BTybuASK3lUZOX4E5kqGvgTQdVx+ortjUoHU6to9Wioxmt
         lz59zcmM9wdvtfXFKn6KLKyyBDvNpoizVOjg0UHPcWdiCJsN+QMZyDxgQsCQcfeqkXJs
         LErBCAJSEO/VzX60w/Pa8PIklRAbaMmQAdoaj84rB76DOF+qUtvxoFlqTqq/tBR0/CQ9
         dQcA==
X-Forwarded-Encrypted: i=1; AJvYcCXhR7ajSEKza4Ej5k7nMIxU0U73rFR9LL0VxO8l1vNJiHA/DHyU/2DzgMDTrlV0KBxkPULCKkXmYKmy6o8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1BP+co5zOTL2+kPvNVo/lqG56ifM4vCJvcv08pk6hqddqAppX
	1RF5FSFxMonBOug5NCMNMmMApG9nMBhqxAJu5Sl2ijTlZuOPJPeMLZW8MC5TZptQnqzPA6YD8Jm
	ElRKjwOzblw==
X-Google-Smtp-Source: AGHT+IE2ixd/IZtDfy0s9qwtIYYwndIgI/TKU5XqnZAyvxDPYGq4ceG0lTr5ap0cGswGY9kMhS/jNXjv+XTN
X-Received: from pjbsw8.prod.google.com ([2002:a17:90b:2c88:b0:311:b186:430c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fc4e:b0:2ff:5357:1c7e
 with SMTP id 98e67ed59e1d1-311100da2c8mr20426074a91.20.1748402808499; Tue, 27
 May 2025 20:26:48 -0700 (PDT)
Date: Tue, 27 May 2025 20:26:34 -0700
In-Reply-To: <20250528032637.198960-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250528032637.198960-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1238.gf8c92423fb-goog
Message-ID: <20250528032637.198960-5-irogers@google.com>
Subject: [PATCH v2 4/7] perf intel-tpebs: Avoid race when evlist is being deleted
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, James Clark <james.clark@linaro.org>, 
	Howard Chu <howardchu95@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Reading through the evsel->evlist may seg fault if a sample arrives
when the evlist is being deleted. Detect this case and ignore samples
arriving when the evlist is being deleted.

Fixes: bcfab08db7fb ("perf intel-tpebs: Filter non-workload samples")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 4ad4bc118ea5..3b92ebf5c112 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -162,9 +162,17 @@ static bool is_child_pid(pid_t parent, pid_t child)
 
 static bool should_ignore_sample(const struct perf_sample *sample, const struct tpebs_retire_lat *t)
 {
-	pid_t workload_pid = t->evsel->evlist->workload.pid;
-	pid_t sample_pid = sample->pid;
+	pid_t workload_pid, sample_pid = sample->pid;
 
+	/*
+	 * During evlist__purge the evlist will be removed prior to the
+	 * evsel__exit calling evsel__tpebs_close and taking the
+	 * tpebs_mtx. Avoid a segfault by ignoring samples in this case.
+	 */
+	if (t->evsel->evlist == NULL)
+		return true;
+
+	workload_pid = t->evsel->evlist->workload.pid;
 	if (workload_pid < 0 || workload_pid == sample_pid)
 		return false;
 
-- 
2.49.0.1238.gf8c92423fb-goog

