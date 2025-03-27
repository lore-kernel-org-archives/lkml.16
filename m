Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com [209.85.222.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D46E4594A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743038699; cv=none; b=FdrxFTjZTJRuhK0YvAmKueJXzLeVmTStKCrmqncrFxcef/pbn/SoPbBaVuwRP/EnIX+AikgLQxXeWHQ/0hpl2OuBHYbypJvDiTZ+ZJ/5aw04bfzrvX69HygXvOwxe7yIE26eU2r62GWgtBxD63+lj/8jUrGZHnPYxA2vaZbz8aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743038699; c=relaxed/simple;
	bh=BfLa2QteAJuzJlCbZuLE5l/LTfJiKpsDE6KPN4nYm+Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dkldoebVFKrrX45Vxg6q0OPTRlwQGO9Iau8U2cIlmB8so67q1fIkZmuSad+OX0Sufmqrd/Og6M82Kb61vVAl9Ww61UgWr5RBbynhStm4TLSSsRN2qZdWcXasGDpIWubgxac1z5am2exV11oseWAl/S5EFkxvkTts44xaY/uLH+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KmrUwvL1; arc=none smtp.client-ip=209.85.222.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KmrUwvL1"
Received: by mail-ua1-f73.google.com with SMTP id a1e0cc1a2514c-86d8b6218easo124567241.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 18:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743038696; x=1743643496; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gGqxd23a/0EjTo66Tj0AOPzp5tI+DdYta3+Brtl9zUU=;
        b=KmrUwvL1hVwacRGIfD9buNw1suFiCTEnS1DkD0ZmATQfvusHIiyhG+yhWiMVlcndr/
         DaVG43fkG5yGf5JQ4qpZV3SI5LSIgxD2DYreMBEw/mzq7/OHUs8+QFaZUeMQb+P+E15L
         1qXsAM4ARcCBO6QskIHiAeFc/TOG1XHPbzgpx0Zqa5xfWuW2i7pYY1+p1A76ETyHozW4
         UQkzVSfp662sY4Np3gZpegTZ//bCtCQKfI3KGbyftjc/x9sAShOyrrAjcYuw+uV2HFwl
         KKK2iXwwK2DRWnvfVFVn7NDLr2gi2VRUEca6VKkBJcCrJXdPHqUwOkCc0mAUB9THa+rj
         7eSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743038696; x=1743643496;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gGqxd23a/0EjTo66Tj0AOPzp5tI+DdYta3+Brtl9zUU=;
        b=lhcolGqFVQk2lZpNCpQV9sbklQIDXwOsSKZBR9oZSd9juz+lza56Jky3MZ7ZOghdfz
         3tPg52iicSGd8zdttXMBgEiIMcJdPH4akc2FjNJwpnMsQAPLDnshHG40qK7+LMvZ+H1f
         IVCTvcfCvjhJ3u2HM3YuAQCtRitL1TA3Qz8mMVgZ+8yOVEgnHkergdoD5+M9kSyFhzs/
         8+ok/F8g7gUZxXAXe5nwaEwD9ak9YtwMYAlFD/YueQvry6nG6KB+F76uMkWfbo+Md97B
         7QwAwXvGihvBsJnQnPjDC/3BbMHllB/0Szlrgbr4N0CbnEl1or4DTiLPWagJOZP+OVMV
         F6tA==
X-Forwarded-Encrypted: i=1; AJvYcCUU/Q6Pk7xTtFAe5rcMEgibQhXRZcCELdbj0Fg0HvQusFn0hXajYDTmaJETit/dtZgRxAf7V0awPtskJxk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5E7q2OOC+36EkOEleYPlZKS7PSmWxezwqJjel/ihaZvzuSJ2d
	NcXZA0/j1OlzVkFnm9i9zTxHxSFww3CsoNG23tHcH66/ZaBmYKYVXu1Eu0rAmIUBehYH1gZXGg8
	zzpuYRLWMLkeP7eZKFw==
X-Google-Smtp-Source: AGHT+IHGl12nIoVpESkgRXoTlyIOOjXfd42fJqbcs3jdHsAlXFB74Da6kCtuJ1aDXxzdgLsg1P+I7e2U7pMaDK9c
X-Received: from vsbby4.prod.google.com ([2002:a05:6102:5044:b0:4c5:5592:22ae])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a67:e716:0:b0:4c1:9cb2:8389 with SMTP id ada2fe7eead31-4c586efe52dmr2559753137.2.1743038696346;
 Wed, 26 Mar 2025 18:24:56 -0700 (PDT)
Date: Thu, 27 Mar 2025 01:23:48 +0000
In-Reply-To: <20250327012350.1135621-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250327012350.1135621-1-jthoughton@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250327012350.1135621-4-jthoughton@google.com>
Subject: [PATCH 3/5] cgroup: selftests: Move cgroup_util into its own library
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, 
	Yu Zhao <yuzhao@google.com>, James Houghton <jthoughton@google.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

KVM selftests will soon need to use some of the cgroup creation and
deletion functionality from cgroup_util.

Suggested-by: David Matlack <dmatlack@google.com>
Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/cgroup/Makefile       | 21 ++++++++++---------
 .../selftests/cgroup/{ => lib}/cgroup_util.c  |  3 +--
 .../cgroup/{ => lib/include}/cgroup_util.h    |  4 ++--
 .../testing/selftests/cgroup/lib/libcgroup.mk | 12 +++++++++++
 4 files changed, 26 insertions(+), 14 deletions(-)
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
index 1e2d46636a0ca..d5649486a11df 100644
--- a/tools/testing/selftests/cgroup/cgroup_util.c
+++ b/tools/testing/selftests/cgroup/lib/cgroup_util.c
@@ -16,8 +16,7 @@
 #include <sys/wait.h>
 #include <unistd.h>
 
-#include "cgroup_util.h"
-#include "../clone3/clone3_selftests.h"
+#include <cgroup_util.h>
 
 /* Returns read len on success, or -errno on failure. */
 static ssize_t read_text(const char *path, char *buf, size_t max_len)
diff --git a/tools/testing/selftests/cgroup/cgroup_util.h b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
similarity index 99%
rename from tools/testing/selftests/cgroup/cgroup_util.h
rename to tools/testing/selftests/cgroup/lib/include/cgroup_util.h
index 19b131ee77072..7a0441e5eb296 100644
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
index 0000000000000..2cbf07337c23f
--- /dev/null
+++ b/tools/testing/selftests/cgroup/lib/libcgroup.mk
@@ -0,0 +1,12 @@
+CGROUP_DIR := $(selfdir)/cgroup
+
+LIBCGROUP_C := lib/cgroup_util.c
+
+LIBCGROUP_O := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBCGROUP_C))
+
+CFLAGS += -I$(CGROUP_DIR)/lib/include
+
+$(LIBCGROUP_O): $(OUTPUT)/%.o : $(CGROUP_DIR)/%.c
+	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
+
+EXTRA_CLEAN += $(LIBCGROUP_O)
-- 
2.49.0.395.g12beb8f557-goog

