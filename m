Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch [79.135.106.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582D6522F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745367074; cv=none; b=Hv2UppxoL8p52H/jt6usiK0cdz/2BpJdDVg/LbVFlkWynOs5ioP4Aht67vdhFkIFFu46ovph/Jt8a4vzKQl31u/tnDNUE+Um1XLTQpWeckfDpYLwEIlNtsRlH+5bcIHKNlhkCXVtriw4kirUxn7t+VP/tDSk6X90q0ebUmeVJfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745367074; c=relaxed/simple;
	bh=xjFT1BsKeziYp5OXKe9QaSfd2f8za/kuJvE82IPdGHY=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MD5zNJByma1oc+dV1rsqM+FXNPcfrtm7oQv8exXzj9V3XnAEKh7GXhIveDud2Dc6MdK8KXJOfQNLQ2eBiMHYGQqRqpffzyARICEB//48sHchiU8WhehtvwXNleoWVdNpLDm++VP1Ng3ceECw7k9ATfVGsjJeZTAEIW7P85XUatk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca; spf=pass smtp.mailfrom=gianis.ca; dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b=NH/QOGsJ; arc=none smtp.client-ip=79.135.106.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gianis.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b="NH/QOGsJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gianis.ca;
	s=protonmail; t=1745367064; x=1745626264;
	bh=JUJQII/lUEIwd34hQkjYLzqBX3js9lHg0TcXHHDqtng=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=NH/QOGsJVaa2DcngfyzVo8p7U4fR/QM+6U7dcuncJ3kLVJyIKolMK/kcAVL90nFHp
	 rJ1Usz+3p5VuvYyTs9GZkAknDxj4sVjjxYwHvdM2uJ08HaJpSlI/IBd09MSGzUWZkv
	 h04s0Hl5zjjSwVHOIzQs9h6sNCPMWAE5FSwjeRpnM5wi5vF62eEKNrGvpdGJFDyfGD
	 nCs4pX+FUjN/e1CAeyhyHMUo39i5/RjSA7WpREInOeNFKOUkINRMMpnb+S6JrBOFqj
	 E03GV3inawLydjX9E+gzhsjA7h8V33ZIFKgV4GpUods7gHpQYbzsbuZRAfyh6sdrcW
	 ETKy3OthgMGJA==
Date: Wed, 23 Apr 2025 00:11:00 +0000
From: "Dhaval Giani (AMD)" <dhaval@gianis.ca>
Cc: linux-kernel@vger.kernel.org, Dhaval Giani <dhaval.giani@amd.com>, Gautham Shenoy <gautham.shenoy@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>, "Dhaval Giani (AMD)" <dhaval@gianis.ca>
Subject: [PATCH 1/3] sched/fair: Introduce a new debugfs directory for EEVDF tests
Message-ID: <20250422-b4-eevdf-tests-v1-post-v1-1-d005d1c7cf61@gianis.ca>
In-Reply-To: <20250422-b4-eevdf-tests-v1-post-v1-0-d005d1c7cf61@gianis.ca>
References: <20250422-b4-eevdf-tests-v1-post-v1-0-d005d1c7cf61@gianis.ca>
Feedback-ID: 128275035:user:proton
X-Pm-Message-ID: 3b38da9376c847684e1ba2c7ed33f8b99409ccf9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

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


