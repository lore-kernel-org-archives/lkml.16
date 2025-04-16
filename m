Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E28314B950
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744838499; cv=none; b=uB+zKscPG+e0PSPfwiX1Zi6f+MS+PkD2TGyxj3IugCoxO8UXypsLHz1BH2WKql8ry3M+/x81MYuL3TV67A3HWcAAp9z04jUpXYwDcpZcY2WtEXUIhOOKrBOpG4Hor6OeBdGo/46S+nfgFHJXwLNjyx+XxoLSziC15yCefkKHVWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744838499; c=relaxed/simple;
	bh=DVoqT8qsDRyJhgtJ1VvvxghcA00Ab+2wkNy3Iz+ewhs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rsMnX8GH6RNBwv3pOivwzhH6sB2xFRZxAOqHVQ6M9p2BtaRIfklwXlkIRDXnvsTX+dyh9gHIe+TZgWbfI6ue5zaywsiN+Vz2JCxvR3pTV1n9JqIEfhmM1Mlb7onQ1ZEpS5P/bpV5uU2m4+KldorW7icfrCWFNVnwI9pOZPAV53w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=In6jFld7; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="In6jFld7"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-72f3b4c0305so74656b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744838495; x=1745443295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wkndMNdYvDec99tXS1CiK27/3EziB9EOgZrv4lFSVDA=;
        b=In6jFld7R7PJ3FEK4tqAtcw1TUHhzOW+MOrc2GwGGmO5njJXAXDSCG99jfe0XnWGPC
         Xyz5i9ZE1lwpzDGwt71cnp1VVx4WHfHKayvXEcTy5+QNog3TS651V+/OtrYJ3JdrMSg7
         Kp91LHOZhKzvLuNktbTZBqY7Nnu/6uWJCjTbnC7N8KY0426Ke+dknHXnLdm+IM/RmZrY
         O/h3iR5ldSgGpAPBJ8Pj0Hlsl/BfE+fbVSe43J1P5aKlq4raR4katRLMxmFzzrKnzmxK
         NFzfWXKHcWMVP1m6frfQGBYI3gEpfQP3/P90pnv0C9x2sxhZGpMGVomIHdBOXtUwu5d/
         yTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744838495; x=1745443295;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkndMNdYvDec99tXS1CiK27/3EziB9EOgZrv4lFSVDA=;
        b=a70fp93LmeV3ZUs1NkE3uXk5E8QsmpfLGZqVNuHIF/SxFxH0Nw+cmRHms3BXZ9tUYv
         baT4y/6P4q5XoExAmbwV0/Y6fukPQozuPHIYwIfB3tIjh9ybuM/XXTobwntAf8pkw9EW
         qtIh5SWHo9bHnIyGCGEgeQIbi9rQeWghs2iAPH8i2xPsbo86pB3jXaZFqFhu7OGh7AzZ
         ZuGX3TNBaL/5M/EX0RbabgT/wZwpLecLU5rhWWTuB0SY/YDYwRjrj4gpHahpwAj9Rjd+
         COPVH7XxDtCjY7VPJHYXFP0KOM1Pe9sBzifrya9Qw1/93cuKCr7YxrZCK2XLlBxl4HEz
         tvgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgWRwbgFYJ2dpNYAtxHnXTYN5WJI3RH8kXWIlz/od9V+nPKOTCt9uJ87SAY/yyJp09CG4T3Kpm9CEKtfY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3V0/XSoLGSQJP6ne3YcB6PXcKUj2Hmy1lX/yMwYBiW8QSQ6Mu
	vwM1rFyYZN0DjM+doRx8Ukz2ug4EZmxPiQKY67ENbweSZTvK25OoQLOQ1c//d9eCt9h36iA1H4L
	R5phDMnXMLvKdjw==
X-Google-Smtp-Source: AGHT+IGSAwE6TnAMGW+PAVbupvu/6ji9u/tyeYWJaw6uEs3vaTNPMr2u27sbf6BxGvanlfKwPdlqnvLBi1b8Yxw=
X-Received: from pfvx7.prod.google.com ([2002:a05:6a00:2707:b0:73c:25ef:3578])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2ea7:b0:73b:71a9:a5ad with SMTP id d2e1a72fcca58-73c267e1db0mr4729877b3a.16.1744838494831;
 Wed, 16 Apr 2025 14:21:34 -0700 (PDT)
Date: Wed, 16 Apr 2025 21:17:51 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250416211752.945849-1-tjmercier@google.com>
Subject: [PATCH v3] cgroup/cpuset-v1: Add missing support for cpuset_v2_mode
From: "T.J. Mercier" <tjmercier@google.com>
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Waiman Long <longman@redhat.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, Kamalesh Babulal <kamalesh.babulal@oracle.com>, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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
none on /dev/cpuset type cgroup (rw,relatime,cpuset,noprefix,cpuset_v2_mode=
,release_agent=3D/sbin/cpuset_release_agent)

[1] https://cs.android.com/android/_/android/platform/system/core/+/b769c8d=
24fd7be96f8968aa4c80b669525b930d3
[2] https://cs.android.com/android/platform/superproject/main/+/main:system=
/core/libprocessgroup/setup/cgroup_map_write.cpp;drc=3D2dac5d89a0f024a2d0cc=
46a80ba4ee13472f1681;l=3D192
[3] https://lore.kernel.org/lkml/f795f8be-a184-408a-0b5a-553d26061385@redha=
t.com/T/

Fixes: e1cba4b85daa ("cgroup: Add mount flag to enable cpuset to use v2 beh=
avior in v1 cgroup")
Signed-off-by: T.J. Mercier <tjmercier@google.com>
Acked-by: Waiman Long <longman@redhat.com>
Reviewed-by: Kamalesh Babulal <kamalesh.babulal@oracle.com>
Acked-by: Michal Koutn=C3=BD <mkoutny@suse.com>
---
v2: Limit cpuset params to just cpuset_v2_mode instead of all of cgroup1_fs=
_parameters per Michal and Waiman
v3: Make cpuset_fs_parameters static per Kamalesh Babulal

 kernel/cgroup/cgroup.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 27f08aa17b56..0d83ac266a00 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -2353,9 +2353,37 @@ static struct file_system_type cgroup2_fs_type =3D {
 };
=20
 #ifdef CONFIG_CPUSETS_V1
+enum cpuset_param {
+	Opt_cpuset_v2_mode,
+};
+
+static const struct fs_parameter_spec cpuset_fs_parameters[] =3D {
+	fsparam_flag  ("cpuset_v2_mode", Opt_cpuset_v2_mode),
+	{}
+};
+
+static int cpuset_parse_param(struct fs_context *fc, struct fs_parameter *=
param)
+{
+	struct cgroup_fs_context *ctx =3D cgroup_fc2context(fc);
+	struct fs_parse_result result;
+	int opt;
+
+	opt =3D fs_parse(fc, cpuset_fs_parameters, param, &result);
+	if (opt < 0)
+		return opt;
+
+	switch (opt) {
+	case Opt_cpuset_v2_mode:
+		ctx->flags |=3D CGRP_ROOT_CPUSET_V2_MODE;
+		return 0;
+	}
+	return -EINVAL;
+}
+
 static const struct fs_context_operations cpuset_fs_context_ops =3D {
 	.get_tree	=3D cgroup1_get_tree,
 	.free		=3D cgroup_fs_context_free,
+	.parse_param	=3D cpuset_parse_param,
 };
=20
 /*
@@ -2392,6 +2420,7 @@ static int cpuset_init_fs_context(struct fs_context *=
fc)
 static struct file_system_type cpuset_fs_type =3D {
 	.name			=3D "cpuset",
 	.init_fs_context	=3D cpuset_init_fs_context,
+	.parameters		=3D cpuset_fs_parameters,
 	.fs_flags		=3D FS_USERNS_MOUNT,
 };
 #endif

base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
--=20
2.49.0.777.g153de2bbd5-goog

