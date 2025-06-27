Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D822C08B8
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025139; cv=none; b=BsHJtl2Tl2kjVnWbdq+UxQ/zmw+AShIY0yYZNwSLjmPByyltjyad9Lw+S11dpQI9Vs5G2wEKFAzeBReAPAzQOW53rLkDMpAvPLFzI5KSZAy9aMUMUCRdPrgOaI0VibZUfYrg0+qWH5B4ypSe+fNqSk4RnWRgXa1N8x+zVCKP2Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025139; c=relaxed/simple;
	bh=oe/djtKSTdSzpUdhBo9TuVrBDGew6WT12dilaDKbJ6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iL7dtcJwRW4aPXJHxBwBxJ6lhS+NxrZwYlITuHpNiH48MACsL9XhTM8fWwaWP66+5rjdWQZ6vz23Q5yWKwZ31KAUwCAXNdL5IrdkIjqc2sXnte3AKEcshPqbV9L050rdnUVxYP4IZu2gKUG2sFpPVreugjNgaw/gC+xV4Jy29OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UNXA1+ZP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UNXA1+ZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751025136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OUoybRgoNWhIkWcgJ2UioTXoFAnH9jtRNvXiFttaDg0=;
	b=UNXA1+ZPM0YMv2tWZRFJQnsLPdR04Y6hIptB73QlPj3DMeXMjYW4tltMm15UYITH2HLpjE
	1J8t3Wu0W8tZhMUSeqjwKvHfoqzSogiMcDaDzakAJSp8eVJz3KOAiYR32saWlKS0SmrUvA
	5BMB3U7IQIE7aNefjKInyPId/yTH7jE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-nQlPTTL4NhWbScIck-psfg-1; Fri,
 27 Jun 2025 07:52:13 -0400
X-MC-Unique: nQlPTTL4NhWbScIck-psfg-1
X-Mimecast-MFC-AGG-ID: nQlPTTL4NhWbScIck-psfg_1751025132
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B81341954198;
	Fri, 27 Jun 2025 11:52:11 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.44.32.84])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A0A2619560A7;
	Fri, 27 Jun 2025 11:52:06 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <llong@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 4/5] tools/sched: Add root_domains_dump.py which dumps root domains info
Date: Fri, 27 Jun 2025 13:51:17 +0200
Message-ID: <20250627115118.438797-5-juri.lelli@redhat.com>
In-Reply-To: <20250627115118.438797-1-juri.lelli@redhat.com>
References: <20250627115118.438797-1-juri.lelli@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Root domains information is somewhat hard to access at runtime. Even
with sched_debug and sched_verbose, such information is only printed
on kernel console when domains are modified.

Add a simple drgn script to more easily retrieve root domains
information at runtime.

Since tools/sched is a new directory, add it to MAINTAINERS as well.

Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 MAINTAINERS                      |  1 +
 tools/sched/root_domains_dump.py | 68 ++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100755 tools/sched/root_domains_dump.py

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163..b986a49383c9c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22165,6 +22165,7 @@ F:	include/linux/wait.h
 F:	include/uapi/linux/sched.h
 F:	kernel/fork.c
 F:	kernel/sched/
+F:	tools/sched/
 
 SCHEDULER - SCHED_EXT
 R:	Tejun Heo <tj@kernel.org>
diff --git a/tools/sched/root_domains_dump.py b/tools/sched/root_domains_dump.py
new file mode 100755
index 0000000000000..56dc91f017b20
--- /dev/null
+++ b/tools/sched/root_domains_dump.py
@@ -0,0 +1,68 @@
+#!/usr/bin/env drgn
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2025 Juri Lelli <juri.lelli@redhat.com>
+# Copyright (C) 2025 Red Hat, Inc.
+
+desc = """
+This is a drgn script to show the current root domains configuration. For more
+info on drgn, visit https://github.com/osandov/drgn.
+
+Root domains are only printed once, as multiple CPUs might be attached to the
+same root domain.
+"""
+
+import os
+import argparse
+
+import drgn
+from drgn import FaultError
+from drgn.helpers.common import *
+from drgn.helpers.linux import *
+
+def print_root_domains_info():
+
+    # To store unique root domains found
+    seen_root_domains = set()
+
+    print("Retrieving (unique) Root Domain Information:")
+
+    runqueues = prog['runqueues']
+    def_root_domain = prog['def_root_domain']
+
+    for cpu_id in for_each_possible_cpu(prog):
+        try:
+            rq = per_cpu(runqueues, cpu_id)
+
+            root_domain = rq.rd
+
+            # Check if we've already processed this root domain to avoid duplicates
+            # Use the memory address of the root_domain as a unique identifier
+            root_domain_cast = int(root_domain)
+            if root_domain_cast in seen_root_domains:
+                continue
+            seen_root_domains.add(root_domain_cast)
+
+            if root_domain_cast == int(def_root_domain.address_):
+                print(f"\n--- Root Domain @ def_root_domain ---")
+            else:
+                print(f"\n--- Root Domain @ 0x{root_domain_cast:x} ---")
+
+            print(f"  From CPU: {cpu_id}") # This CPU belongs to this root domain
+
+            # Access and print relevant fields from struct root_domain
+            print(f"  Span       : {cpumask_to_cpulist(root_domain.span[0])}")
+            print(f"  Online     : {cpumask_to_cpulist(root_domain.span[0])}")
+
+        except drgn.FaultError as fe:
+            print(f"  (CPU {cpu_id}: Fault accessing kernel memory: {fe})")
+        except AttributeError as ae:
+            print(f"  (CPU {cpu_id}: Missing attribute for root_domain (kernel struct change?): {ae})")
+        except Exception as e:
+            print(f"  (CPU {cpu_id}: An unexpected error occurred: {e})")
+
+if __name__ == "__main__":
+    parser = argparse.ArgumentParser(description=desc,
+                                     formatter_class=argparse.RawTextHelpFormatter)
+    args = parser.parse_args()
+
+    print_root_domains_info()
-- 
2.49.0

