Received: from mail-vk1-f201.google.com (mail-vk1-f201.google.com [209.85.221.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D492882B0
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746730017; cv=none; b=SokzMl18RdQ+S76o/c9yIyMCRX/KNGuXmkHgDm1+RGpBLa+1b6hXcZuK5IcsGgOR2MLiKWAC3wLk7fjfnvbnXka8P/tyVO8Bc3RxVBzW44EKq//pi97LQ4CIb0ORnpdvHQfPEXhYExueqcfkK/9yA8mDr7pgaHwzoy9GZ9WqcA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746730017; c=relaxed/simple;
	bh=JDJtvsLd6pAgSjFemxlKNebzWLSR94Q0gKRIgC16z9A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Lj9NI1i1mUHwgcVQEvu1v38Lw4rLDCfIj4vHj+Vos56aw2j6YStKnJ4l4bN0NH68qhjZxrlvohF7v+HSeVpYyDB35MCW7vLIDQFNYmh9O4MGpBLwk7KMP6UHKKafw9w3yPvFaxmuhLTLHOJDVDoosV8Qjwvv+qG1HCbvLNOEQkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lFIGs2Z5; arc=none smtp.client-ip=209.85.221.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lFIGs2Z5"
Received: by mail-vk1-f201.google.com with SMTP id 71dfb90a1353d-52c51af3807so121825e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 11:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746730014; x=1747334814; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IBAW9WzDfaO30Qr6hkH4oUfrnATBljwiWcxlfgotkDs=;
        b=lFIGs2Z5QzRvguz3IfUza/Kw3VtQNtDPusHvDoNATVT72J0jN3U/HcOBuLPQvyHqyv
         bDn6CBreNF1eil+AXAJjV93u0SrlhvfbCs2n6iswogMQ/DZoZSHi0qVF0e6c/XY8mNDM
         26BM7OdC7ZpUZLlwXLL579+N/0DWLlNsPFIyqOFzmD9wpwu6T4AZAN2fq1vAdE6l10Qz
         CY75UG7hOdOWjmgbAm0uD9WoWkiUaOFmEyNqzmAAyMPHhV8G80oxhASaHHGaS/ykMMeV
         WShRCvHEIO0vaxQ2SO+gPebQchBXQTlH/O4J9N/wnO+6bRPhl/X+RpeWf8hjybs6CoJ7
         RAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746730014; x=1747334814;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IBAW9WzDfaO30Qr6hkH4oUfrnATBljwiWcxlfgotkDs=;
        b=ht90Y4gxbG332zBRQ7RmNHunKcxsZ95S92QZo9feUq/8yBLwtm5YpLhAJFTDkmy8u3
         F6m+TZ0gYrJ6BtqGN7jBQgrFxFw7RXaT+heGhXrvrgRvXrqYrbB9IekWJYiA9b8cKo1+
         eC1AeCj7kAQ9xakEl06xYSYxhjVxwRLlSd1M9tMqwQWTo74jFSYh3IfMSOmMIWczcDfw
         DCKLFIA/GBxGKNhCd1SwKnklTpbVjnlyP+ARuigiGTZlAHQxHR2/4LfjiGrbU3O06doA
         VJHPhe1A/dlABltvYlRNijq8MD30QswKABm4z1Ikh1AKzeaKTCFFsvHaPB6rvoJCBTX9
         USUg==
X-Forwarded-Encrypted: i=1; AJvYcCWlb0g1oOabroPHiJsX29ZhfEFh0f9L7suY9fvk88JGzzn+RCgMx3zOE21Wz6TYBBqKmzqnbu38CoK1NjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3IvOmRTgVbJ9G5Ip+FyA3rUzILSR/tl/0tp79vmYwV3TSKpG4
	spoCpk8te+Sc8RmpCyand0drP7lrs1DfhZoxhAXfy+1iBUIudiu+OGtNain6yPHCm2QgwdP+l0V
	WeGVESZPFeZsCBua7Cg==
X-Google-Smtp-Source: AGHT+IFvlfYZC2prDcJoUl/Lv0MPGRDwzVSm29UhzJxGswg/cvFXev8EsLu92bMLUeQ0toOW4Nlb9mHr6Zg+i/u5
X-Received: from vkben11.prod.google.com ([2002:a05:6122:280b:b0:529:1066:edac])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6122:2a09:b0:526:1ddd:7603 with SMTP id 71dfb90a1353d-52c538183a0mr902501e0c.0.1746730014050;
 Thu, 08 May 2025 11:46:54 -0700 (PDT)
Date: Thu,  8 May 2025 18:46:45 +0000
In-Reply-To: <20250508184649.2576210-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250508184649.2576210-1-jthoughton@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250508184649.2576210-5-jthoughton@google.com>
Subject: [PATCH v4 4/7] cgroup: selftests: Move cgroup_util into its own library
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Yu Zhao <yuzhao@google.com>, 
	David Matlack <dmatlack@google.com>, James Houghton <jthoughton@google.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

KVM selftests will soon need to use some of the cgroup creation and
deletion functionality from cgroup_util.

Suggested-by: David Matlack <dmatlack@google.com>
Signed-off-by: James Houghton <jthoughton@google.com>
Acked-by: Tejun Heo <tj@kernel.org>
---
 tools/testing/selftests/cgroup/Makefile       | 21 ++++++++++---------
 .../selftests/cgroup/{ => lib}/cgroup_util.c  |  2 +-
 .../cgroup/{ => lib/include}/cgroup_util.h    |  4 ++--
 .../testing/selftests/cgroup/lib/libcgroup.mk | 19 +++++++++++++++++
 4 files changed, 33 insertions(+), 13 deletions(-)
 rename tools/testing/selftests/cgroup/{ => lib}/cgroup_util.c (99%)
 rename tools/testing/selftests/cgroup/{ => lib/include}/cgroup_util.h (99%)
 create mode 100644 tools/testing/selftests/cgroup/lib/libcgroup.mk

diff --git a/tools/testing/selftests/cgroup/Makefile b/tools/testing/selftests/cgroup/Makefile
index 1b897152bab6e..e01584c2189ac 100644
--- a/tools/testing/selftests/cgroup/Makefile
+++ b/tools/testing/selftests/cgroup/Makefile
@@ -21,14 +21,15 @@ TEST_GEN_PROGS += test_zswap
 LOCAL_HDRS += $(selfdir)/clone3/clone3_selftests.h $(selfdir)/pidfd/pidfd.h
 
 include ../lib.mk
+include lib/libcgroup.mk
 
-$(OUTPUT)/test_core: cgroup_util.c
-$(OUTPUT)/test_cpu: cgroup_util.c
-$(OUTPUT)/test_cpuset: cgroup_util.c
-$(OUTPUT)/test_freezer: cgroup_util.c
-$(OUTPUT)/test_hugetlb_memcg: cgroup_util.c
-$(OUTPUT)/test_kill: cgroup_util.c
-$(OUTPUT)/test_kmem: cgroup_util.c
-$(OUTPUT)/test_memcontrol: cgroup_util.c
-$(OUTPUT)/test_pids: cgroup_util.c
-$(OUTPUT)/test_zswap: cgroup_util.c
+$(OUTPUT)/test_core: $(LIBCGROUP_O)
+$(OUTPUT)/test_cpu: $(LIBCGROUP_O)
+$(OUTPUT)/test_cpuset: $(LIBCGROUP_O)
+$(OUTPUT)/test_freezer: $(LIBCGROUP_O)
+$(OUTPUT)/test_hugetlb_memcg: $(LIBCGROUP_O)
+$(OUTPUT)/test_kill: $(LIBCGROUP_O)
+$(OUTPUT)/test_kmem: $(LIBCGROUP_O)
+$(OUTPUT)/test_memcontrol: $(LIBCGROUP_O)
+$(OUTPUT)/test_pids: $(LIBCGROUP_O)
+$(OUTPUT)/test_zswap: $(LIBCGROUP_O)
diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testing/selftests/cgroup/lib/cgroup_util.c
similarity index 99%
rename from tools/testing/selftests/cgroup/cgroup_util.c
rename to tools/testing/selftests/cgroup/lib/cgroup_util.c
index 0ef3b8b8d7f74..4b975637351b2 100644
--- a/tools/testing/selftests/cgroup/cgroup_util.c
+++ b/tools/testing/selftests/cgroup/lib/cgroup_util.c
@@ -17,7 +17,7 @@
 #include <unistd.h>
 
 #include "cgroup_util.h"
-#include "../clone3/clone3_selftests.h"
+#include "../../clone3/clone3_selftests.h"
 
 /* Returns read len on success, or -errno on failure. */
 ssize_t read_text(const char *path, char *buf, size_t max_len)
diff --git a/tools/testing/selftests/cgroup/cgroup_util.h b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
similarity index 99%
rename from tools/testing/selftests/cgroup/cgroup_util.h
rename to tools/testing/selftests/cgroup/lib/include/cgroup_util.h
index 139c870ecc285..b7006dc761aba 100644
--- a/tools/testing/selftests/cgroup/cgroup_util.h
+++ b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
@@ -2,9 +2,9 @@
 #include <stdbool.h>
 #include <stdlib.h>
 
-#include "../kselftest.h"
-
+#ifndef PAGE_SIZE
 #define PAGE_SIZE 4096
+#endif
 
 #define MB(x) (x << 20)
 
diff --git a/tools/testing/selftests/cgroup/lib/libcgroup.mk b/tools/testing/selftests/cgroup/lib/libcgroup.mk
new file mode 100644
index 0000000000000..7a73007204c39
--- /dev/null
+++ b/tools/testing/selftests/cgroup/lib/libcgroup.mk
@@ -0,0 +1,19 @@
+CGROUP_DIR := $(selfdir)/cgroup
+
+LIBCGROUP_C := lib/cgroup_util.c
+
+LIBCGROUP_O := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBCGROUP_C))
+
+LIBCGROUP_O_DIRS := $(shell dirname $(LIBCGROUP_O) | uniq)
+
+CFLAGS += -I$(CGROUP_DIR)/lib/include
+
+EXTRA_HDRS := $(selfdir)/clone3/clone3_selftests.h
+
+$(LIBCGROUP_O_DIRS):
+	mkdir -p $@
+
+$(LIBCGROUP_O): $(OUTPUT)/%.o : $(CGROUP_DIR)/%.c $(EXTRA_HDRS) $(LIBCGROUP_O_DIRS)
+	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
+
+EXTRA_CLEAN += $(LIBCGROUP_O)
-- 
2.49.0.1015.ga840276032-goog

