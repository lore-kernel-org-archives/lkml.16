Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60085220F24
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748463360; cv=none; b=N6g2T/nkcxJWNuCQQESul6KU7bKOG2bj84PDAiMscSuTIMrdxaR3hvfiy9HlkRpdXVjNOPeXjxVqxX0/9iK1bIo1jgQAeGkjY+z21Gr1kRzWklpHBvcIi66lLQ8zuxBJ59KP8ZNHB4AxOeP4bhYuwpR75pHFGsAXMgwrZZPiA6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748463360; c=relaxed/simple;
	bh=Xj2bJg33cCVgN3TKRaUTD/7wxzeDFRgZB8D+XxgPToQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=A9r+m0ZHJ4hV8wChCOc+pCwnTZzTWij6ccUbMT78PKgUuj6ne9rfzFIyWwglpwTrMVwR9J/1PjBnj0S+c6+jkj8JdoHGkd9g6SH6lZtSautbuIyt/3Zn+7NZrRBv9YQOIfhgnP8JdtxAUXjMcB5gdNCCZ4sG/JJFMB2TsF1x4gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEE7C4CEF1;
	Wed, 28 May 2025 20:15:59 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uKNCv-0000000AmVx-03Kx;
	Wed, 28 May 2025 16:17:01 -0400
Message-ID: <20250528201700.865197025@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 28 May 2025 16:16:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Tomas Glozar <tglozar@redhat.com>,
 John Kacur <jkacur@redhat.com>,
 Luis Goncalves <lgoncalv@redhat.com>
Subject: [for-next][PATCH 3/3] rtla: Define _GNU_SOURCE in timerlat_bpf.c
References: <20250528201643.598382331@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Tomas Glozar <tglozar@redhat.com>

Newer versions of glibc include a definition of struct sched_attr in
bits/sched.h (included through sched.h which is included by rtla).
Commit 0eecee340672 ("tools/rtla: fix collision with glibc
sched_attr/sched_set_attr") has modified the definition of struct
sched_attr in utils.h, so that it is only applied with older versions of
glibc that do not define it, in order to prevent build failure.

The definition in bits/sched.h depends on _GNU_SOURCE.
timerlat_bpf.c does not define _GNU_SOURCE, making it fall back to the
definition in utils.h. The latter has two fields less, leading to
shifted offsets of struct timerlat_params in timerlat_bpf_init.

Because of the shift, timerlat_bpf_init incorrectly reads
params->entries as 0 for timerlat-hist and disables the creation of
histogram maps, causing breakage in BPF sample collection mode:

$ rtla timerlat hist -d 1s
Error pulling BPF data

Fix the issue by also defining _GNU_SOURCE in timerlat_bpf.c.

Cc: John Kacur <jkacur@redhat.com>
Cc: Luis Goncalves <lgoncalv@redhat.com>
Link: https://lore.kernel.org/20250430144651.621766-1-tglozar@redhat.com
Fixes: e34293ddcebd ("rtla/timerlat: Add BPF skeleton to collect samples")
Signed-off-by: Tomas Glozar <tglozar@redhat.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 tools/tracing/rtla/src/timerlat_bpf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/tracing/rtla/src/timerlat_bpf.c b/tools/tracing/rtla/src/timerlat_bpf.c
index 5abee884037a..0bc44ce5d69b 100644
--- a/tools/tracing/rtla/src/timerlat_bpf.c
+++ b/tools/tracing/rtla/src/timerlat_bpf.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #ifdef HAVE_BPF_SKEL
+#define _GNU_SOURCE
 #include "timerlat.h"
 #include "timerlat_bpf.h"
 #include "timerlat.skel.h"
-- 
2.47.2


