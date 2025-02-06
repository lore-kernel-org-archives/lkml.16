Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5102225780
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738829418; cv=none; b=pvHWuh7cPHzpJtdScCjOehsu3IsnZGf9CH5hp0EtN93IMvCepF+tEoyyenJAoqRUrfiI2W9Bj6vTnkMYlZ7PNd922e8oE7n9PW4LOUdaelfynbXWdRyZmybLgtEIR2gMBnK2nNhy7jyDpoRymXYakGhLeZ8XBRMY95Ij7BXGJvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738829418; c=relaxed/simple;
	bh=FgvNNOrKi5BTCOctf/X5ZFDE9UwogkDozn2yBiLEj/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O436/yyPcsJ03v+v13kLV3QZhVDam45gsMpK8bfpLW11LlwqGEUh8qIjf4gOFNqM0cns7xKT9A0vUTKrt4jGk+NW9U7udzgvyNK0ylvelOFGKp1ZcHSvywACnJa3IHP1lzHQ5k/cxDMyHTi4L1MAB4BHSLRGGqVmgM1TWdrOHCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KUrDDJlV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KUrDDJlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738829413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ttz+a3pnQUmTf0MGk2lsv1aLrwsABrFcgglcEw3OomU=;
	b=KUrDDJlVg/dPfuAX5Wrw8cuLvGRf6qj799pSFWXeC1CrGLuzsnRLhQyNPOezZvsODGU2Ys
	jvDy72Dz7RrAQXhv0CwC8CVwOYUaJL1du8YUd/lxb11+OwYV3SedbhD7s9Rd1oKhzvWdlp
	D6JMEzD7Hhd2pIIYCkI5HAuNPUK5VUE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-448-IG_HBxEPMsSnfeGrEQlbQg-1; Thu,
 06 Feb 2025 03:10:10 -0500
X-MC-Unique: IG_HBxEPMsSnfeGrEQlbQg-1
X-Mimecast-MFC-AGG-ID: IG_HBxEPMsSnfeGrEQlbQg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D5181800878;
	Thu,  6 Feb 2025 08:10:09 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.45.224.82])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 859B919560AE;
	Thu,  6 Feb 2025 08:10:07 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-trace-kernel@vger.kernel.org
Cc: Gabriele Monaco <gmonaco@redhat.com>
Subject: [RFC PATCH 02/11] rv: Add license identifiers to monitor files
Date: Thu,  6 Feb 2025 09:09:38 +0100
Message-ID: <20250206080952.98478-3-gmonaco@redhat.com>
In-Reply-To: <20250206080952.98478-1-gmonaco@redhat.com>
References: <20250206080952.98478-1-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Some monitor files like the main header and the Kconfig are missing the
license identifier.

Add it to those and make sure the automatic generation script includes
the line in newly created monitors.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 kernel/trace/rv/monitors/wip/Kconfig            | 2 ++
 kernel/trace/rv/monitors/wip/wip.h              | 1 +
 kernel/trace/rv/monitors/wwnr/Kconfig           | 2 ++
 kernel/trace/rv/monitors/wwnr/wwnr.h            | 1 +
 tools/verification/dot2/dot2k.py                | 1 +
 tools/verification/dot2/dot2k_templates/Kconfig | 2 ++
 6 files changed, 9 insertions(+)

diff --git a/kernel/trace/rv/monitors/wip/Kconfig b/kernel/trace/rv/monitors/wip/Kconfig
index 3ef664b5cd903..e464b9294865b 100644
--- a/kernel/trace/rv/monitors/wip/Kconfig
+++ b/kernel/trace/rv/monitors/wip/Kconfig
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
 config RV_MON_WIP
 	depends on RV
 	depends on PREEMPT_TRACER
diff --git a/kernel/trace/rv/monitors/wip/wip.h b/kernel/trace/rv/monitors/wip/wip.h
index 2e373f2c65ed7..c7193748bf369 100644
--- a/kernel/trace/rv/monitors/wip/wip.h
+++ b/kernel/trace/rv/monitors/wip/wip.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Automatically generated C representation of wip automaton
  * For further information about this format, see kernel documentation:
diff --git a/kernel/trace/rv/monitors/wwnr/Kconfig b/kernel/trace/rv/monitors/wwnr/Kconfig
index ee741aa6d6b89..d3bfc20037db9 100644
--- a/kernel/trace/rv/monitors/wwnr/Kconfig
+++ b/kernel/trace/rv/monitors/wwnr/Kconfig
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
 config RV_MON_WWNR
 	depends on RV
 	select DA_MON_EVENTS_ID
diff --git a/kernel/trace/rv/monitors/wwnr/wwnr.h b/kernel/trace/rv/monitors/wwnr/wwnr.h
index d0d9c4b8121b5..0a59d23edf610 100644
--- a/kernel/trace/rv/monitors/wwnr/wwnr.h
+++ b/kernel/trace/rv/monitors/wwnr/wwnr.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Automatically generated C representation of wwnr automaton
  * For further information about this format, see kernel documentation:
diff --git a/tools/verification/dot2/dot2k.py b/tools/verification/dot2/dot2k.py
index 7547eb290b7df..153cc14bcca45 100644
--- a/tools/verification/dot2/dot2k.py
+++ b/tools/verification/dot2/dot2k.py
@@ -160,6 +160,7 @@ class dot2k(Dot2c):
 
     def fill_model_h_header(self):
         buff = []
+        buff.append("/* SPDX-License-Identifier: GPL-2.0 */")
         buff.append("/*")
         buff.append(" * Automatically generated C representation of %s automaton" % (self.name))
         buff.append(" * For further information about this format, see kernel documentation:")
diff --git a/tools/verification/dot2/dot2k_templates/Kconfig b/tools/verification/dot2/dot2k_templates/Kconfig
index 90cdc1e9379e1..03100eda17075 100644
--- a/tools/verification/dot2/dot2k_templates/Kconfig
+++ b/tools/verification/dot2/dot2k_templates/Kconfig
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
 config RV_MON_%%MODEL_NAME_UP%%
 	depends on RV
 	select %%MONITOR_CLASS_TYPE%%
-- 
2.48.1

