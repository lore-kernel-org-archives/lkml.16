Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC411EFFBE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745367622; cv=none; b=f4ZwEB6qmpemtDZJ7q2ia1Qp2jLk9NWJVySRWlGBNGGEox1zlxCXt9COQDI1l9Qujm+5wyZqB51cIyqqvvqOznCO6hIXRsvsGoyr7vHpQ+hbfYn7gLsDSdqDd0aMJHZE+oLJwpfUt6EcYVgNBsUIPebF06+UyRJnjttXFfF3s9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745367622; c=relaxed/simple;
	bh=+r3R+rr2bW0jfdEyFH6BjapHu/ndfnpWM2yE25YJd2c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=flRIyaeaXkeMattNCsXjixp/HweD/oUpMOQM/a6N5EvAuZd8ACAsW1moFDcwlFZwQiCd5BvyeDFvouZpfzuLDN0T1/+H0OjazLd2Wl+4buvjLv4K1QWyybA16rIJscffZH+Eig3hu6DY+WxLLLas0pgoJaqCKay6dpgmMeQbvTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca; spf=pass smtp.mailfrom=gianis.ca; dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b=gsF/xgNZ; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gianis.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b="gsF/xgNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gianis.ca;
	s=protonmail; t=1745367618; x=1745626818;
	bh=dk+pasafF4bM7w+MFfwsEvyKgaRymc8SSrDzFjrIskQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=gsF/xgNZz9F+qYh3bwgztJo+49+eal2kVBMuTXUnF7qNnYDW561DF61Q0FBB9weYs
	 4cw/dYk0VGK7VGQcyQGUCMY39bGCX3EaA1dfTRepHgqbvq6AeUtnnuUVLfE1XR3Mzc
	 Ge+CCJpJos+Nk+ye8xhrefcFkL6iXqSqPG38DxzEuMQhm6es+x7cPdRZbzcseBQb3Z
	 Tr/EPloIHhsg9Y69eXXxcxlXpEAN/U1uCk6LmPOLlMh3vAZvSgz4A3pJy+jW3XlQOq
	 N9DX0H1fCCqIwgDiqdvmCZO79Xya9k6PbOScC5uL8DgiZiankBQjL+aMgK10VwU410
	 8KgCueI2GeYQg==
Date: Wed, 23 Apr 2025 00:20:14 +0000
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
From: "Dhaval Giani (AMD)" <dhaval@gianis.ca>
Cc: linux-kernel@vger.kernel.org, Dhaval Giani <dhaval.giani@amd.com>, Gautham Shenoy <gautham.shenoy@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>, "Dhaval Giani (AMD)" <dhaval@gianis.ca>
Subject: [PATCH 1/3] sched/fair: Introduce a new debugfs directory for EEVDF tests
Message-ID: <20250422-b4-eevdf-tests-v1-post-v1-1-35d158254c72@gianis.ca>
In-Reply-To: <20250422-b4-eevdf-tests-v1-post-v1-0-35d158254c72@gianis.ca>
References: <20250422-b4-eevdf-tests-v1-post-v1-0-35d158254c72@gianis.ca>
Feedback-ID: 128275035:user:proton
X-Pm-Message-ID: d7f28bbef72c90bc7d8a399e3a768f4d2324476b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

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
 kernel/Kconfig.preempt     |  9 +++++++++
 kernel/sched/Makefile      |  1 +
 kernel/sched/debug.c       |  2 ++
 kernel/sched/eevdf-tests.c | 27 +++++++++++++++++++++++++++
 kernel/sched/sched.h       |  7 +++++++
 5 files changed, 46 insertions(+)

diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index 54ea59ff8fbeb653b7084a78bd0d933076deaad5..96f47cf498aa10d7cbb375093e5=
533753ed7a414 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -176,3 +176,12 @@ config SCHED_CLASS_EXT
 =09  For more information:
 =09    Documentation/scheduler/sched-ext.rst
 =09    https://github.com/sched-ext/scx
+
+config SCHED_EEVDF_TESTING
+=09bool "EEVDF testing"
+=09help
+=09  This option is a debug option to test that your changes to the
+=09  fair scheduling code do not break EEVDF invariants. There are
+=09  controls exposted in debugfs to allow tests to be run. This has a
+=09  performance impact, so do not enable unless you are a scheduler
+=09  developer and know what you are doing.
diff --git a/kernel/sched/Makefile b/kernel/sched/Makefile
index 8ae86371ddcddf836172ee93ca34f2e91b4057a7..1a8416b8009ebf7cf38ac7b326f=
4b6472e62909a 100644
--- a/kernel/sched/Makefile
+++ b/kernel/sched/Makefile
@@ -37,3 +37,4 @@ obj-y +=3D core.o
 obj-y +=3D fair.o
 obj-y +=3D build_policy.o
 obj-y +=3D build_utility.o
+obj-y +=3D eevdf-tests.o
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 557246880a7e0839277df662703b7bfabeb3a497..e61acd5463145e4a54dcc816c1d=
a774922ed0127 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -536,6 +536,8 @@ static __init int sched_init_debug(void)
=20
 =09debugfs_fair_server_init();
=20
+=09debugfs_eevdf_testing_init(debugfs_sched);
+
 =09return 0;
 }
 late_initcall(sched_init_debug);
diff --git a/kernel/sched/eevdf-tests.c b/kernel/sched/eevdf-tests.c
new file mode 100644
index 0000000000000000000000000000000000000000..3bc016d3025733e53f586e30fcd=
31f650156d47e
--- /dev/null
+++ b/kernel/sched/eevdf-tests.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc
+ *
+ * Author: Dhaval Giani (AMD) <dhaval@gianis.ca>
+ *
+ * Basic functional tests for EEVDF - Invariants
+ *
+ * Use the debugfs triggers to run them
+ *
+ */
+
+#include <linux/debugfs.h>
+#include <linux/sched.h>
+
+#include "sched.h"
+
+#ifdef CONFIG_SCHED_EEVDF_TESTING
+
+static struct dentry *debugfs_eevdf_testing;
+void debugfs_eevdf_testing_init(struct dentry *debugfs_sched)
+{
+=09debugfs_eevdf_testing =3D debugfs_create_dir("eevdf-testing", debugfs_s=
ched);
+
+}
+#endif /* CONFIG_SCHED_EEVDF_TESTING */
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index c5a6a503eb6de3867ea25f13dca3660da2805ff8..09cefe2aa871bbd533a413c7602=
6895e969a58e7 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -44,6 +44,7 @@
 #include <linux/lockdep.h>
 #include <linux/minmax.h>
 #include <linux/mm.h>
+#include <linux/mmu_context.h>
 #include <linux/module.h>
 #include <linux/mutex_api.h>
 #include <linux/plist.h>
@@ -3987,4 +3988,10 @@ void sched_enq_and_set_task(struct sched_enq_and_set=
_ctx *ctx);
=20
 #include "ext.h"
=20
+#ifdef CONFIG_SCHED_EEVDF_TESTING
+void debugfs_eevdf_testing_init(struct dentry *debugfs_sched);
+#else /* CONFIG_SCHED_EEVDF_TESTING */
+static inline void init_eevdf_testing_debugfs(struct dentry *debugfs_sched=
) {}
+#endif /* CONFIG_SCHED_EEVDF_TESTING */
+
 #endif /* _KERNEL_SCHED_SCHED_H */

--=20
2.49.0


