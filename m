Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244F82D9798
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025145; cv=none; b=qu9z/3cbWsJ/OmJmNrGkjAOUpO6K2MP1bAwI0bpNxiY1loHs+SbvKXn2nsxgs28GH2h1WcvxR+48NUofxUop3gJXQy4VjgrtCDaX6AsSKwkHqYbjMniVZFDx5GvpuzyyPcdUOiFofaJcySQ530DIRHK/zrc0qbETBzx5nj9oQzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025145; c=relaxed/simple;
	bh=+wUi4GXukNo2pvBcAQ46Qj1TJ38IJNJg5MzaCi/0apg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PzC3rIFNWEM7JTVLRxIP0gZYQhqMbYVNTMKjvgjXrqky3B6wcS48ggV+c62Af4Q/NFw6YFXtvC53lGgQCytO8Ce6iwqV/aMoWyudCv33TBKDiMUk5SCbgfP+W3D3urxFSCO1v5p7xPqObl7Wd3RuZ8lDhNMBO0ATnloDo4PAIHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cj0e/SEr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cj0e/SEr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751025143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NK5HahFlaS1XZ4t7oWyohvLCLN5zar3OEBM1RLwvCbE=;
	b=cj0e/SErSkZH4Z6JId9ow2YmRIePhFsbOYq8x7I0Ks7177ozapDr222DRyrPScJ5xN/LcD
	6cbbd6In2KaK8PEH+5pyUjxTOVXd+2t55KNMexugJqQSpdwmMCfkC4Y8cDmLKDnpPpfcz/
	+9hNYe15appDWyTT2GKxThVT8MLdXH4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-468-bJHnK-l7PnaOJpZJ83RoXg-1; Fri,
 27 Jun 2025 07:52:19 -0400
X-MC-Unique: bJHnK-l7PnaOJpZJ83RoXg-1
X-Mimecast-MFC-AGG-ID: bJHnK-l7PnaOJpZJ83RoXg_1751025138
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 418DA1801212;
	Fri, 27 Jun 2025 11:52:18 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.44.32.84])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4F82819560A7;
	Fri, 27 Jun 2025 11:52:13 +0000 (UTC)
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
Subject: [PATCH 5/5] tools/sched: Add dl_bw_dump.py for printing bandwidth accounting info
Date: Fri, 27 Jun 2025 13:51:18 +0200
Message-ID: <20250627115118.438797-6-juri.lelli@redhat.com>
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

dl_rq bandwidth accounting information is crucial for the correct
functioning of SCHED_DEADLINE.

Add a drgn script for accessing that information at runtime, so that
it's easier to check and debug issues related to it.

Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 tools/sched/dl_bw_dump.py | 57 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100755 tools/sched/dl_bw_dump.py

diff --git a/tools/sched/dl_bw_dump.py b/tools/sched/dl_bw_dump.py
new file mode 100755
index 0000000000000..aae4e42b17690
--- /dev/null
+++ b/tools/sched/dl_bw_dump.py
@@ -0,0 +1,57 @@
+#!/usr/bin/env drgn
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2025 Juri Lelli <juri.lelli@redhat.com>
+# Copyright (C) 2025 Red Hat, Inc.
+
+desc = """
+This is a drgn script to show dl_rq bandwidth accounting information. For more
+info on drgn, visit https://github.com/osandov/drgn.
+
+Only online CPUs are reported.
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
+def print_dl_bws_info():
+
+    print("Retrieving dl_rq bandwidth accounting information:")
+
+    runqueues = prog['runqueues']
+
+    for cpu_id in for_each_possible_cpu(prog):
+        try:
+            rq = per_cpu(runqueues, cpu_id)
+
+            if rq.online == 0:
+                continue
+
+            dl_rq = rq.dl
+
+            print(f"  From CPU: {cpu_id}")
+
+            # Access and print relevant fields from struct dl_rq
+            print(f"  running_bw : {dl_rq.running_bw}")
+            print(f"  this_bw    : {dl_rq.this_bw}")
+            print(f"  extra_bw   : {dl_rq.extra_bw}")
+            print(f"  max_bw     : {dl_rq.max_bw}")
+            print(f"  bw_ratio   : {dl_rq.bw_ratio}")
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
+    print_dl_bws_info()
-- 
2.49.0

