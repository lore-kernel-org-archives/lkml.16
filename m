Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com [209.85.160.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D35817B402
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887558; cv=none; b=nAPza33Ur5qtoilXRMxw6A4vMYXbgyk7yiNx1ZpOigWmViCZRko6GBpIdaC8eE3uOVulhqq0Fjl9RJxgJ71UcpgNP6PzYi4NEcUoRasBys6/dlNeDBIjo5GsLVGBR3nc+Xz4+KrlcjPjxJzAs0AfLHKy/LEHodTmr6ibqLFQWnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887558; c=relaxed/simple;
	bh=uTxgffaCVKDusEkGXgA8/2r4K1mAz1i0Gtv0hWUC+OM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=C7/H4AJBqdSQZqVkY9TJHFn81vbkQr7TguAm5Nwq3QRlItKP1M7DDI2mkY3IP5wuSYD0Xsp6dKeZw7o9TfT8qUH8UCNXNbS7oWZzNlXwp6HlcLlVixiXfsDB02sVQMCmQ1RvrCvi9K6yQW3k4jh3PqlVQ7AhF3GPMtkTOf3/WFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MzIBjG/R; arc=none smtp.client-ip=209.85.160.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MzIBjG/R"
Received: by mail-qt1-f201.google.com with SMTP id d75a77b69052e-4a58f455cdbso13575271cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 11:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748887555; x=1749492355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QyDj/2B3/il5yCN5lwJYwPP19JR+5CMXAKDxaydY8hI=;
        b=MzIBjG/RufGUa3wiuNa0AlV94qNqgblea9XlebkjWpVVM3JNGR4JwRUQkzLjMlAdEc
         3JDHx1XlFuPFkhbz3L6y0igJKysZfqWwiGEeZ+W1SD9RcNruqunM3KydOiAJ+xpwP0uN
         cZmMYU1y97yozyRARkmBfsdJYRw87D1WzBXj0/ccv+nPpY5Tnkn7zssxrctJCqQGczjz
         K8YBDkm62EsMTtZ04LywU4BAZT3heIE382fl/MzDzmypIt8usBQxyePAnBJjhvw8OqW+
         A9CPYov1+DtnDMuKuUkSiJvaf1yEcwVXWRNXb2JrZC3V4XJc5ovJbP4yfgp/BDLiQM4r
         wL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748887555; x=1749492355;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyDj/2B3/il5yCN5lwJYwPP19JR+5CMXAKDxaydY8hI=;
        b=MJCWYGHrf49jEMfzbxPjOcY7sNru6FHGZ+OyZzRrK6mDATuvxHKEaIWi9nIkgENG20
         1w88HTNuW8DcWGsRUQ2y+gz2DzrjUcKRS1S4JvuDCjwVhxvBpegoXiI00Q3GsoU5Qyh+
         mADfVCmSxiZaHSdDuQ3Yg+15yjbono/F7mq8yLsn9O6N57RO+Ciulc0Qf8Ac7/aJY6Dy
         TpOOho7j6+9sIkuHVNEdMf2nFwcQ/y3vPVWMqza7TYv6zf89/NVKRHPd1/peKqRDDyb2
         uhXLEcvfNBAyxofBJfzCsxlkZtoqW12BJbZdeTBvtpPt8hqQhCaFAaJU2MKtiU1NG644
         KVsA==
X-Forwarded-Encrypted: i=1; AJvYcCUfCwmB5SoHKPJhn6930b/j/PQ+T6enJydjigNaudbNMjD23Ze90ZHFq0cnU9G+gl82CsTWxfGqQPUkrmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YznColOIRG/G1IKGiSLQiZIncOlb3b31ByaS5pWGVpdgk/hoTXY
	6UTUdwuIu3vHIXgvP+H+lBB+DQeISTo7Ok/H/oiZDqqGSOjMxlLksPq8lhu14UV/Nyw/JtGwqLE
	Gm75srqOgkQ==
X-Google-Smtp-Source: AGHT+IGOtRccs4qjSAskTq1bZg5Ex4D2SU2mqQL7o/L1nlbh1LnNAAcvD0MsyC1c/jlkLhb23LZqzldScSLr
X-Received: from qtbha6.prod.google.com ([2002:a05:622a:2b06:b0:49b:ddb8:8b75])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:a05:622a:1ccf:b0:4a4:2f42:a676
 with SMTP id d75a77b69052e-4a4aed6b20amr163585291cf.29.1748887555163; Mon, 02
 Jun 2025 11:05:55 -0700 (PDT)
Date: Mon,  2 Jun 2025 18:05:40 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602180544.3626909-1-zecheng@google.com>
Subject: [RFC PATCH v2 0/3] sched/fair: Reorder scheduling related structs to
 reduce cache misses
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Josh Don <joshdon@google.com>, 
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>, linux-kernel@vger.kernel.org, 
	Zecheng Li <zecheng@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reorder the fields within the `struct cfs_rq` and `struct sched_entity`
to improve cache locality. The two structs are heavily accessed, and
their layouts have not been optimized yet. This can reduce cache misses,
improving performance in CFS scheduling-related operations, particularly
for servers with hundreds of cores and ~1000 cgroups.

The reordering is based on kernel data-type profiling
(https://lwn.net/Articles/955709/) indicating hot fields and fields
frequently accessed together on real workloads.

This reordering aims to optimize cache utilization and improve the
performance of scheduling-related functions, particularly
`tg_throttle_down`, `tg_unthrottle_up`,`__update_load_avg_cfs_rq`, and
`sched_balance_update_blocked_averages`. The reordering mainly considers
performance when `CONFIG_FAIR_GROUP_SCHED` is configured. When it is
disabled, there is no CFS bandwidth control and only a single `cfs_rq`
exists per CPU, thus its layout would not significantly impact
performance.

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
benchmark is run 10 times. The table shows 95% confidence intervals of
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

Other benchmarks (without CPU share limits) show no regression.
They ran in a cgroup hierarchy with depth 5, width 4 setting (1024
instances) for 10 runs. perf profiles confirm the targeted CFS functions
have lower LLC misses after reordering cfs_rq and sched_entity.

For avg latency and time, lower is better; for record/s, higher is
better. Ranges are 95% CI.

           | base                 | opt                  | metric
-----------+----------------------+----------------------+-------------
 sysbench  | 45.05 [44.69, 45.42] | 44.51 [43.99, 45.04] | avg latency
 hackbench | 27.00 [26.39, 27.61] | 27.29 [26.38, 28.20] | time
 ebizzy    | 948.2 [848.1, 1048]  | 951.8 [840.8, 1063]  | record/s

LLC cache miss in kernel. The fluctuation is in the order of =C2=B110%.

           | base   | opt
-----------+--------+--------
 sysbench  | 404M   | 351M
 hackbench | 3,294M | 3,169M
 ebizzy    | 2,149M | 1,956M

Although we see a noticable reduction in LLC misses, the application
throughput improvement is negligible because the cycles spent accessing
cfs_rq and sched_entity are around ~1% among these benchmarks. The
improvement saves 20% of the cycles accessing them, which is a ~0.2%
direct saving. However, this benefits most workloads with quite large
cgroup hierarchies.

v2 updates:

- Add macros to conditionally align a cache group to avoid extra RAM
paddings on architectures with cacheline sizes other than 64B.

- Add more benchmark results.

Zecheng Li (3):
  cache: conditionally align cache groups
  sched/fair: Reorder struct cfs_rq
  sched/fair: Reorder struct sched_entity

 include/linux/cache.h | 28 +++++++++++++++
 include/linux/sched.h | 39 +++++++++++----------
 kernel/sched/core.c   | 81 ++++++++++++++++++++++++++++++++++++++++++-
 kernel/sched/sched.h  | 81 +++++++++++++++++++++++++++++--------------
 4 files changed, 184 insertions(+), 45 deletions(-)


base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
--=20
2.49.0

