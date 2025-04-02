Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com [209.85.219.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D391E5B81
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743629373; cv=none; b=QplaBJP6AUFY2yK+kgLsH0cftuwI4DIgpmmRhzXz1Q5N8fMhp8igPY1xjV8oT4vaUI4i0R/MiIQnNfT/RlwtukpYO9+ltVzr4QXwBssPI/8BCVBIqLy63qqCSMR5x1pmvC3SYzDtQE9oblwjMgBhgoKNpiL/q+4umZ+XoKpNYi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743629373; c=relaxed/simple;
	bh=vCBRQPiouCzyrJRzxj8SsCXLfwKBnYvZ4pEyZUOH2mQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=kzSJyfiWTVIDm//OF5jM8hbFe7+yevSFIDloFRN9I+GP+Azp2lUKlwkktSNY1QLPb5X8WAGvuoLH6e0ymwAEeujlO+aCpJ2jaqz3rN5wz2Z+PTTHmDeH7wYm0nBRGuPq+brvdeNkxtksV9OkWq+dssPEuoJp4KJHkZt38HCpucI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4XIkdW1x; arc=none smtp.client-ip=209.85.219.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4XIkdW1x"
Received: by mail-qv1-f73.google.com with SMTP id 6a1803df08f44-6e8f99a9524so6461746d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 14:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743629371; x=1744234171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=trvBVv0rXfO/3TrfDu+pcou0NGXSDE3XVSvynmCGSh4=;
        b=4XIkdW1xzoxi2IyYwYbCBsDo0abAnBFNzF+tBXkt4TA/9muoQbY1ws36azG8q034TX
         l1z/eeJ7ukbSOGFfCT6pB+2v0YnFtJGy3WsomDdXia6p+97HAYC+agzXtkj5QYX1OQUk
         D/LKbAhfkWu39bDP2tPAOzx6L0WK3w3GLpBP6zrchtNxliwbKoy3xS37CcLQf4ZNTDFW
         hF0Qh5ri0f1d2sIybdt7+ARQxgA6i9BsnzGpkJSiKDnY+mUFCiXO5QJr2mbqZNAhds25
         0HR+3gcK0sG4H/lv/SsS91KUR68jMtbwxDZGhNVk2MMiwNAxWpU+6KpUbNDyi/pom7zd
         XSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743629371; x=1744234171;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trvBVv0rXfO/3TrfDu+pcou0NGXSDE3XVSvynmCGSh4=;
        b=u9EMKctf02nzR12zk8ixmaFh5MZKXe19M4pdtKMDJZl1Dbf6EZJig+fWJTkzRfGZJv
         q4EWKsLNIH4JnMtXd+XjVAk3ekATfJGjv6Fymfnu0/U6Jgvhh+nzwK/t+m4UBpRmlb7E
         6AKVCg0YVdwoVy8qClzYtQY2iYy45n0m9iqz4h52t4Y8UDgMZFNOcgISbJR5zO2MGTM8
         9p5L6t7tWzyMconaJvYtCYGaJxKolQZUdzfsPhEw8qUiW99GjzMYv4092k7HAvyu1VjX
         ZLvU3/o2ep+DCp8/U28W8x1dz09XEkzHRVg6qgk5nZ+fq2iTQnt3esBmZY/6lIBvy/sZ
         XeSg==
X-Forwarded-Encrypted: i=1; AJvYcCXLh60egpLPlbAFwnfN38Fz2TVz0yfeMXzUtVOzD5ZFu4x3AU0W6s5rKKtbj8e+HJxxWHdJIMfHZ3n/dG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDvmQTHP27ZykKotuit6jBE7T5bwoDl+ZmSaWbzRBBUnz8RlCP
	4hLr1uVKAiLt1BSJ1QYBZkre4zqqtNn2EpkjQt8cV3hbDs5RxqSnwGTE2vSAIyRZg4EZDr4G6d+
	I2QklEA==
X-Google-Smtp-Source: AGHT+IEmsld+lqqFM2rUoN56Lwptvxi+vto2+9vGTv/NX8TD5MSQ7mjTlXO9agi+4K/WgJtrQXrs8xHKlGj7
X-Received: from qvbre18.prod.google.com ([2002:a05:6214:5e12:b0:6ed:10fd:292a])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6214:f02:b0:6d4:1680:612d
 with SMTP id 6a1803df08f44-6ef0daeec84mr6897036d6.0.1743629371188; Wed, 02
 Apr 2025 14:29:31 -0700 (PDT)
Date: Wed,  2 Apr 2025 21:29:00 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402212904.8866-1-zecheng@google.com>
Subject: [RFC PATCH 0/2] sched/fair: Reorder scheduling related structs to
 reduce cache misses
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	Zecheng Li <zecheng@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reorder the fields within the `struct cfs_rq` and `struct sched_entity`
to improve cache locality. This can reduce cache misses to improve
performance in CFS scheduling-related operations, particularly for
servers with hundreds of cores and ~1000 cgroups.

The reordering is based on the kernel data-type profiling
(https://lwn.net/Articles/955709/) indicating hot fields and fields
that frequently accessed together.

This reordering aims to optimize cache utilization and improve the
performance of scheduling-related functions, particularly
`tg_throttle_down`, `tg_unthrottle_up`, and `__update_load_avg_cfs_rq`.
The reordering mainly considers performance when
`CONFIG_FAIR_GROUP_SCHED` is configured. When it is disabled, there is
no CFS bandwidth control and only a single `cfs_rq` exists per CPU, thus
its layout would not significantly impact performance.

We use a benchmark with multiple cgroup levels to simulate real server
load. The benchmark constructs a tree structure hierarchy of cgroups,
with =E2=80=9Cwidth=E2=80=9D and =E2=80=9Cdepth=E2=80=9D parameters control=
ling the number of children
per node and the depth of the tree. Each leaf cgroup runs a `schbench`
workload and gets an 80% quota of the total CPU quota divided by number
of leaf cgroups (in other words, the target CPU load is set to 80%) to
exercise the throttling functions. Bandwidth control period is set to
10ms. We run the benchmark on Intel and AMD machines; each machine has
hundreds of threads.

Kernel LLC load misses for 30 seconds. d3 w10 (wider tree) means a
cgroup hierarchy of 3 levels, each level has 10 children, totaling 1000
leaf cgroups. d5 w4 represents a deeper tree with more hierarchies. Each
benchmark is run 10 times, the table shows 95% confidence intervals of
the kernel LLC misses in millions.


| Kernel LLC Misses | d3 w10            | d5 w4             |
+-------------------+-------------------+-------------------+
| AMD-orig          | [3025.5, 3344.1]M | [3382.4, 3607.8]M |
| AMD-opt           | [2410.7, 2556.9]M | [2565.4, 2931.2]M |
| Change            | -22.01%           | -21.37%           |
| Intel-orig        | [1157.2, 1249.0]M | [1343.7, 1630.7]M |
| Intel-opt         | [960.2, 1023.0]M  | [1092.7, 1350.7]M |
| Change            | -17.59%           | -17.86%           |

Since the benchmark limits CPU quota, the RPS results reported by
`schbench` did not show statistically significant improvement as it
does not reflect the kernel overhead reduction.

Perf data shows the reduction of LLC misses percentage within the kernel
for the depth 5, width 4 workload. The symbols are taken from the union
of top 10 symbols in both original and optimized profiles.

| Symbol                                | Intel-orig | Intel-opt |
+---------------------------------------+------------+-----------+
| worker_thread                         | 75.41%     | 78.95%    |
| tg_unthrottle_up                      | 3.21%      | 1.61%     |
| tg_throttle_down                      | 2.42%      | 1.77%     |
| __update_load_avg_cfs_rq              | 1.95%      | 1.60%     |
| walk_tg_tree_from                     | 1.23%      | 0.91%     |
| sched_balance_update_blocked_averages | 1.09%      | 1.13%     |
| sched_balance_rq                      | 1.03%      | 1.08%     |
| _raw_spin_lock                        | 1.01%      | 1.23%     |
| task_mm_cid_work                      | 0.87%      | 1.09%     |
| __update_load_avg_se                  | 0.78%      | 0.48%     |

| Symbol                                | AMD-orig | AMD-opt |
+---------------------------------------+----------+---------+
| worker_thread                         | 53.97%   | 61.49%  |
| sched_balance_update_blocked_averages | 3.94%    | 2.48%   |
| __update_load_avg_cfs_rq              | 3.52%    | 2.62%   |
| update_load_avg                       | 2.66%    | 2.19%   |
| tg_throttle_down                      | 1.99%    | 1.57%   |
| tg_unthrottle_up                      | 1.98%    | 1.34%   |
| __update_load_avg_se                  | 1.89%    | 1.32%   |
| walk_tg_tree_from                     | 1.79%    | 1.37%   |
| sched_clock_noinstr                   | 1.59%    | 1.01%   |
| sched_balance_rq                      | 1.53%    | 1.26%   |
| _raw_spin_lock                        | 1.47%    | 1.41%   |
| task_mm_cid_work                      | 1.34%    | 1.42%   |

The percentage of the LLC misses in the system is reduced.

Zecheng Li (2):
  sched/fair: Reorder struct cfs_rq
  sched/fair: Reorder struct sched_entity

 include/linux/sched.h | 37 +++++++++++---------
 kernel/sched/core.c   | 81 ++++++++++++++++++++++++++++++++++++++++++-
 kernel/sched/sched.h  | 70 +++++++++++++++++++++++--------------
 3 files changed, 144 insertions(+), 44 deletions(-)


base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
--=20
2.49.0

