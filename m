Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647472D8DB5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 23:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744761200; cv=none; b=Mc2Mzbr9AvaQ9YPo8Z78dUbziUpGEUZt7iNVcf9rO9wbdJ8HfkJyxgoPm3WaIRBR8cg4WW5JFXSTMQPAqopCFDt3X2WKvPmzIk4nXrpyc1taQ9KZsdZ7CLuR9ChCpXIk1I3+gdugothhfsetB/ZnhByLK4NX73nxpKOMCIZR5mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744761200; c=relaxed/simple;
	bh=HXkqcx2ZNAR3MgBMkemVZlr6XaFgZx7DtM8Y81VBFzs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZN7aO5JVm2vamR++7C5ofNoPkp5pHsNFfnLFLwaBVa31NUfLzUbdtmv+8vXQI3909tgGuaQlw/Gle+KFQWz9tb2/Tf0PSDHkaKikUi2JdQ9/5EV9/B5gaCHunXVCs9/Gy5ecyor3FoYvR5KLE5jt9c/48QG0yMM+kwTUObm9TV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yGsAv4PL; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yGsAv4PL"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-73c205898aaso223201b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744761198; x=1745365998; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/YGrgTL2+oDLw5q7YMCd5Rvj3aEMaQaNt09r3bkhF+Q=;
        b=yGsAv4PLYROAf6y7BynQ/LxnOkx4dDhBGz+h7q229r9aRCMQKLiCwyCy+qoQUTyd4q
         sjXh9j+ZifgxwiK5xzk5GMpfKm28cpw1BY6zcsiNX6Tz5DrwqLyEez9cXr5+mbJbsshX
         dvluW5n6eaMzdOpZg5LhG8IWglK9tRjtl68JNwbim5oGzpK3wqYMOlBNLy1tP/pPh1Hw
         w2duiNtAHC7nclBeKSF/1n612AGuJgNleEwttqLqXnkyFin2AE+EkNHGGmJLWOCbdnrS
         LunKzvgxWW/EHxQC1HnGPgQ6sUf0rUblrbbX2uf3nkLHW0JzYVj43FgUuYxax46h+tDo
         lWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761198; x=1745365998;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/YGrgTL2+oDLw5q7YMCd5Rvj3aEMaQaNt09r3bkhF+Q=;
        b=Y69zrI01TgfM+AWL7rt3H+andyOkGkBIaNDD3nwl+0/pgCIAoYjLKy8YtC5jvTqmNW
         a9IMopiIzJh+/jMphstBYoLLhHrkK5QB8l1Cp+SUJ3+dlev6Y+Obj8CtTzu/Tv+RzEh9
         mJnWc9KYFArDtZgAK3uXVGTzep8ko4tww8O8NXZDq8WWWeoAMMXx279FGNe+e8OzpT9y
         sZS5QtEHmpX6xezXfxlFlFsUVrry2fly5VMmVOnYJz4kvpjWUfnIYM3IrMIQvP/khN5v
         YuLgQPmwZMDM3HUuKkAz5LoV0kLkIkKKY/65vTDLqvytbPo5NbxNL+DJUioVKO4xC4UQ
         HzWA==
X-Forwarded-Encrypted: i=1; AJvYcCU3t3YObITX6kmgwEQT9o9vm7Ycj80xZcjXjFQyT5BCygU2LyorN5yfs2hlSYDV5N2JmVI3QeM1UAdUUv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTHdTRV7V9mtUfig7iijzOlXccl6rumM1eb70d9ofhcsKwqG/g
	4oi3MESJ3wYhqWymxRGVViPQPTY/X3LZRqGRCpELhA3e6fB9uIfqpd84AT3saubQ5+995MVk7WZ
	TriRH0XZxwRHGUw==
X-Google-Smtp-Source: AGHT+IE7bA+Epf0Jw9RBloEojnGr5yL1MgbHZ3M/WXOieK8JDAU4vde/iJaqsYqpSx1NFMbLMFBdp5uyhqF4/ec=
X-Received: from pfiu22.prod.google.com ([2002:a05:6a00:1256:b0:730:8b4c:546c])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:9308:0:b0:736:ab48:5b0 with SMTP id d2e1a72fcca58-73c1f8c3c9cmr1921173b3a.2.1744761198662;
 Tue, 15 Apr 2025 16:53:18 -0700 (PDT)
Date: Tue, 15 Apr 2025 23:53:07 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250415235308.424643-1-tjmercier@google.com>
Subject: [PATCH v2] cgroup/cpuset-v1: Add missing support for cpuset_v2_mode
From: "T.J. Mercier" <tjmercier@google.com>
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Waiman Long <longman@redhat.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Android has mounted the v1 cpuset controller using filesystem type
"cpuset" (not "cgroup") since 2015 [1], and depends on the resulting
behavior where the controller name is not added as a prefix for cgroupfs
files. [2]

Later, a problem was discovered where cpu hotplug onlining did not
affect the cpuset/cpus files, which Android carried an out-of-tree patch
to address for a while. An attempt was made to upstream this patch, but
the recommendation was to use the "cpuset_v2_mode" mount option
instead. [3]

An effort was made to do so, but this fails with "cgroup: Unknown
parameter 'cpuset_v2_mode'" because commit e1cba4b85daa ("cgroup: Add
mount flag to enable cpuset to use v2 behavior in v1 cgroup") did not
update the special cased cpuset_mount(), and only the cgroup (v1)
filesystem type was updated.

Add parameter parsing to the cpuset filesystem type so that
cpuset_v2_mode works like the cgroup filesystem type:

$ mkdir /dev/cpuset
$ mount -t cpuset -ocpuset_v2_mode none /dev/cpuset
$ mount|grep cpuset
none on /dev/cpuset type cgroup (rw,relatime,cpuset,noprefix,cpuset_v2_mode,release_agent=/sbin/cpuset_release_agent)

[1] https://cs.android.com/android/_/android/platform/system/core/+/b769c8d24fd7be96f8968aa4c80b669525b930d3
[2] https://cs.android.com/android/platform/superproject/main/+/main:system/core/libprocessgroup/setup/cgroup_map_write.cpp;drc=2dac5d89a0f024a2d0cc46a80ba4ee13472f1681;l=192
[3] https://lore.kernel.org/lkml/f795f8be-a184-408a-0b5a-553d26061385@redhat.com/T/

Fixes: e1cba4b85daa ("cgroup: Add mount flag to enable cpuset to use v2 behavior in v1 cgroup")
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 kernel/cgroup/cgroup.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 27f08aa17b56..cf30ff2e7d60 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -2353,9 +2353,37 @@ static struct file_system_type cgroup2_fs_type = {
 };
 
 #ifdef CONFIG_CPUSETS_V1
+enum cpuset_param {
+	Opt_cpuset_v2_mode,
+};
+
+const struct fs_parameter_spec cpuset_fs_parameters[] = {
+	fsparam_flag  ("cpuset_v2_mode", Opt_cpuset_v2_mode),
+	{}
+};
+
+static int cpuset_parse_param(struct fs_context *fc, struct fs_parameter *param)
+{
+	struct cgroup_fs_context *ctx = cgroup_fc2context(fc);
+	struct fs_parse_result result;
+	int opt;
+
+	opt = fs_parse(fc, cpuset_fs_parameters, param, &result);
+	if (opt < 0)
+		return opt;
+
+	switch (opt) {
+	case Opt_cpuset_v2_mode:
+		ctx->flags |= CGRP_ROOT_CPUSET_V2_MODE;
+		return 0;
+	}
+	return -EINVAL;
+}
+
 static const struct fs_context_operations cpuset_fs_context_ops = {
 	.get_tree	= cgroup1_get_tree,
 	.free		= cgroup_fs_context_free,
+	.parse_param	= cpuset_parse_param,
 };
 
 /*
@@ -2392,6 +2420,7 @@ static int cpuset_init_fs_context(struct fs_context *fc)
 static struct file_system_type cpuset_fs_type = {
 	.name			= "cpuset",
 	.init_fs_context	= cpuset_init_fs_context,
+	.parameters		= cpuset_fs_parameters,
 	.fs_flags		= FS_USERNS_MOUNT,
 };
 #endif
-- 
2.49.0.777.g153de2bbd5-goog

