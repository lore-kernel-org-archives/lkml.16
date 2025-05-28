Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9D6220694
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748463360; cv=none; b=bpYfsZ7JPUQsR3Qh0dsBEyuobKMLpiDLvPko0yymH25aW0nMqoCgCVIKE0MADbCcrE1S1TFG1onom9BNXy5+GuWn/LIooWoduPpNAB214y3rJZKcmwtPm+vqQ3gCPtsXAOS+aduydKnpQdf5vppyhY9NkiOwvN+JW+qw3qzVCbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748463360; c=relaxed/simple;
	bh=+FgCq89Cdpe4zuX876VtyztIcXoCYwomKtNBoZ7t7WM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=TXkIc58BJlMWjWyBxlkf8Y8rVsueF2nUbV05ACessl7kxJWoom3SUvqDjLvzPzJgE52J0IHqxPRB/vd8c01/BBwzJkS4GyJb2rZ3KruE0LFQKuTeSuZiQgW4RbyiwUQ6rWjV8h8j9PArIvKR9zOIxzkv4XPBw5auWPXGS7FYFcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1851C4CEED;
	Wed, 28 May 2025 20:15:59 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uKNCu-0000000AmVT-3Xdi;
	Wed, 28 May 2025 16:17:00 -0400
Message-ID: <20250528201700.695393744@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 28 May 2025 16:16:45 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Tomas Glozar <tglozar@redhat.com>,
 John Kacur <jkacur@redhat.com>,
 Haiyong Sun <sunhaiyong@loongson.cn>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [for-next][PATCH 2/3] rtla: Define __NR_sched_setattr for LoongArch
References: <20250528201643.598382331@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Tiezhu Yang <yangtiezhu@loongson.cn>

When executing "make -C tools/tracing/rtla" on LoongArch, there exists
the following error:

  src/utils.c:237:24: error: '__NR_sched_setattr' undeclared

Just define __NR_sched_setattr for LoongArch if not exist.

Link: https://lore.kernel.org/20250422074917.25771-1-yangtiezhu@loongson.cn
Reported-by: Haiyong Sun <sunhaiyong@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 tools/tracing/rtla/src/utils.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/tracing/rtla/src/utils.c b/tools/tracing/rtla/src/utils.c
index 4995d35cf3ec..d6ab15dcb490 100644
--- a/tools/tracing/rtla/src/utils.c
+++ b/tools/tracing/rtla/src/utils.c
@@ -227,6 +227,8 @@ long parse_ns_duration(char *val)
 #  define __NR_sched_setattr	355
 # elif __s390x__
 #  define __NR_sched_setattr	345
+# elif __loongarch__
+#  define __NR_sched_setattr	274
 # endif
 #endif
 
-- 
2.47.2


