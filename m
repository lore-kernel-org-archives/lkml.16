Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E67D515
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747710966; cv=none; b=DLp61/RPaEWz9mZOHBKjKsXrn2auKmecERVRDK4YSFXKF0Q5mnrdI8yb9+PFyUTVedXpPBw4FBMNlO2pJQ0wbWkIdrAfbsWZ8wi6TDpZabUvyB3Gd8mrX9YqMqw90EpZK8H+Uo8OiDUEl26c0dTzt+whx7knbb7iT5gRsxcnmi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747710966; c=relaxed/simple;
	bh=nRhpHv6oHTyiSD62FahxTEpoWjh1OEnhwGSW3orWgR8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L+OqAlug7YCeQZ9G7pfuofwv0RKJQAjG3Ll7SssIB8e22YXcPEg7lMNij98F0wzCb7uOo5xvc67f5+ayVrhZ9kCo2TCTbXrgyIH439UAHJXM6cLzWzMJpViB81x5aIStkZ0FLeVds2F+0r6OKHvf7VngjrdrJsAOhqPounjLNDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=aPFeaO8S; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="aPFeaO8S"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742c73f82dfso1790050b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 20:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747710963; x=1748315763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aaQyNwcaivEahcWZfzCLbvdpavVF88y+CIxVNvLkwSQ=;
        b=aPFeaO8SLM+ATSaHhJCTiaVEGg1GQbJCQJQHqX0TrnIrTQR1J7RCYAPbNgZSSXDbgw
         /3FmoILQl1cKYFL46cmmd+Dmy7jmU4OCI3hiVZjUlDTvoaUJe3z3naBx+psxJNKvnWiX
         ItWBUqOMKRkuf2VlYlZG9sWFDjswb5g70aRyM2kuh0wSQ3qxYbLIBMB+uHHc5+503xQ9
         Aw3JGvSMDs62X22vJqyncB+KOFy0m2oyhBF0kCeYWk+B7RqG0e4XM2Tl2TAR3WmC7sy5
         bpEmnEN/kK3UfhJLqc6WfNIlriiRbc+ClNwxivsSCtfBh5xJjYbSRx1xtIXlYo6quPN4
         35Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747710963; x=1748315763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaQyNwcaivEahcWZfzCLbvdpavVF88y+CIxVNvLkwSQ=;
        b=Xejhxpw1X+xtc0t+uFl2ZODAwpebWCMG1yX/ELNgxb7vrDlqGYrN0aIMIJIacep1SS
         y/E1zGeSwkVX3Lu1Yb+Qm1HH+QNTeb9/EaXQ2ou77bcXBAF+J2WDH7h8pfVlDdjSv+V3
         mOFHXZQceEHCkgU6gxZn8f1FhZ0xT0uuVf6BBv0+tnKRD3WjzvpQA5u5FiDSX6q+p2kC
         ExR0zwLiGrdFCYxtmw51ZRunYcJkwnO/5Bbc5wMdnCTQPX/wCoVlYsqHcgkM9W6+vF0c
         W7xo2pBkJnBrdzFu8P/fgyyLHsretnaZqjsZS63AC6v7l6g9B9zk06iTXG4mTqHR+8Jw
         r0vw==
X-Forwarded-Encrypted: i=1; AJvYcCWYbPPSSrVDm9fMWheE7YS03MNqLwmMGbyt57Zma3b3M1dJxghiNgOYNiWtDI8Js9taATjyOxIyYzBKc2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTq+9Gyqprt76COGh3CPQiq5xC1TMgo8Qfkvw5PAZmL8NpCi7X
	nKdJnP2OhGavbFurt/mCEa8V2oegj984jESXMmc8RVlWOcGbD2DbbzlGw2udt1EqS8dh9Ji4Dqj
	z5inx
X-Gm-Gg: ASbGnctfcDJEd+yyitFmcOpBNe1hOND2KgUssFWAxrcFR8RLV8hEtCNqatX6zcb3bPM
	LUacTGFk8qrkISTurRUNiFxbvVOsgHd/U46wyjFuaDZs0wnPBK4Alo8wxqZjDjFDfRnkVWXuYkI
	g93UZ3cBB4YiyTBuAngU16C4m/peP2nRh+Ifol6m+gqDbmZmGADXfZu7v8ELSp2ON2NTPma2IFh
	FAqU6fcvJudicqD4b+la3m/3VyS3uGNDpeq3fPdPLVmobv3NKjxUQzGGe6GwyADtbs59ukHRknN
	LSbfqidnoVEDYQXovFvhKjXrWQiBGX8rK0yAvKZONC6GU726wljiLIFVTiY3YReUmOtzgf8mO5J
	+
X-Google-Smtp-Source: AGHT+IEz9Fexfj5ew7Cz9bhXuSo5L0CfJzqvrjRZC8GEQy+PE1jXnLcxgSxRhEfAQJINGQdY6QLnYA==
X-Received: by 2002:a05:6a00:1148:b0:740:b372:be5 with SMTP id d2e1a72fcca58-742a97ac5b4mr17637564b3a.9.1747710963323;
        Mon, 19 May 2025 20:16:03 -0700 (PDT)
Received: from n37-069-081.byted.org ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829b9dsm6947216b3a.88.2025.05.19.20.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 20:16:02 -0700 (PDT)
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
To: tj@kernel.org,
	hannes@cmpxchg.org,
	longman@redhat.com
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev,
	Zhongkun He <hezhongkun.hzk@bytedance.com>
Subject: [PATCH] cpuset: introduce non-blocking cpuset.mems setting option
Date: Tue, 20 May 2025 11:15:52 +0800
Message-Id: <20250520031552.1931598-1-hezhongkun.hzk@bytedance.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting the cpuset.mems in cgroup v2 can trigger memory
migrate in cpuset. This behavior is fine for newly created
cgroups but it can cause issues for the existing cgroups.
In our scenario, modifying the cpuset.mems setting during
peak times frequently leads to noticeable service latency
or stuttering.

It is important to have a consistent set of behavior for
both cpus and memory. But it does cause issues at times,
so we would hope to have a flexible option.

This idea is from the non-blocking limit setting option in
memory control.

https://lore.kernel.org/all/20250506232833.3109790-1-shakeel.butt@linux.dev/

Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>
---
 Documentation/admin-guide/cgroup-v2.rst |  7 +++++++
 kernel/cgroup/cpuset.c                  | 11 +++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 1a16ce68a4d7..d9e8e2a770af 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2408,6 +2408,13 @@ Cpuset Interface Files
 	a need to change "cpuset.mems" with active tasks, it shouldn't
 	be done frequently.
 
+	If cpuset.mems is opened with O_NONBLOCK then the migration is
+	bypassed. This is useful for admin processes that need to adjust
+	the cpuset.mems dynamically without blocking. However, there is
+	a risk that previously allocated pages are not within the new
+	cpuset.mems range, which may be altered by move_pages syscall or
+	numa_balance.
+
   cpuset.mems.effective
 	A read-only multiple values file which exists on all
 	cpuset-enabled cgroups.
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 24b70ea3e6ce..2a0867e0c6d2 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -3208,7 +3208,18 @@ ssize_t cpuset_write_resmask(struct kernfs_open_file *of,
 		retval = update_exclusive_cpumask(cs, trialcs, buf);
 		break;
 	case FILE_MEMLIST:
+		bool skip_migrate_once = false;
+
+		if ((of->file->f_flags & O_NONBLOCK) &&
+			is_memory_migrate(cs) &&
+			!cpuset_update_flag(CS_MEMORY_MIGRATE, cs, 0))
+			skip_migrate_once = true;
+
 		retval = update_nodemask(cs, trialcs, buf);
+
+		/* Restore the migrate flag */
+		if (skip_migrate_once)
+			cpuset_update_flag(CS_MEMORY_MIGRATE, cs, 1);
 		break;
 	default:
 		retval = -EINVAL;
-- 
2.39.5

