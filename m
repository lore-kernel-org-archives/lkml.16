Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDB4288DB
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 08:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739088639; cv=none; b=mXnqjq6bcqbLxz6/0LUO9xv+tXCd/dE4xeKKt4u07whyagREqXqWGavlgZj5t54qK9BGqy4m5TawyoOMsRnrPQRvclcR5ti2UjVOr4tVo2Opw66ZSZvopT27Colx3T2jTmtanUghPNNOoqt8cBoFn3/AmJzVqgejvoymHva/yPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739088639; c=relaxed/simple;
	bh=5VeaBHROD7fVQ6W/x1ZwlGM1/gQpgsop3o7sNHmVSP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EOmF4F+60mQRArsLsfMqQuC6D2t0Eldu7O96EfAZ9Xtgf4J3VZzgPcFX8cvMWgegvRIRIA1ZgUpqqxJgj+FRrA7Q489ouKiyizZ5wYxX5rKlOZRLUHbzG7rWSH2IDkxDdXt5fYK//+uUC9wtjPsGafG8flMFSbMtAdxjHvbSR/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=g1c8+0Fr; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="g1c8+0Fr"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739088635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PpdLBBDZVNZMnRiBRMgmZzv1cJUkHqfLJcITLgAJFD0=;
	b=g1c8+0FrgfHmcO+J+xAV8ltzFQH6OzRObw2H2wvjrATGnAafesOzlLAZz6MJb6rm45ieVg
	FaeTMd12IjE7H++tIy0QYj76Y/6mKcWqzk5F7PTjVd3v9fdgnvArIdl+CkgWZHs4OuvpEa
	ggmMh5JwARbMiiHJGpSssUrkuRqA1FY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] sched/core: Remove duplicate included header file stats.h
Date: Sun,  9 Feb 2025 09:10:20 +0100
Message-ID: <20250209081020.1739-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The header file stats.h is included twice. Remove the redundant include
and the following make includecheck warning:

  stats.h is included more than once

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 kernel/sched/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 165c90ba64ea..b00f884701a6 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -91,7 +91,6 @@
 #include "autogroup.h"
 #include "pelt.h"
 #include "smp.h"
-#include "stats.h"
 
 #include "../workqueue_internal.h"
 #include "../../io_uring/io-wq.h"
-- 
2.48.1

