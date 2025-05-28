Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8941FBE8C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748463360; cv=none; b=f9AllbftKq5yppZLm5eyREHhDOYcjZdudALBJSbXVM4/prpnrAJoU2QP7nwnDJe6CNzGUc/x61b9EiD8J/XdGYF/E0t9h9jY2owi2vIc4J8kr5replo9+vMCQm1QV5EQ7tVpE58Mzj+YzPAMC3840rWokX+4XTQDLPDHJfo2Enw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748463360; c=relaxed/simple;
	bh=oAeNHZy2YqycxWBrm4FfFXv1Gg/VaMIbDM0ZxqMs0IQ=;
	h=Message-ID:Date:From:To:Cc:Subject; b=H+eSBzNXeurymFTBI8fAZree2HGOSSX3NlBta1bybenDiqTtz0dxz+E84L7dxKOAeI30+ygO2wBhe0SNHHVUhxsncA0jC1w7UvtABnGKXzQgHrsUMKcYrvxmnSqTkfc7Vju4NkpqDnqoF7FJrjChdH9q8LsEFXie4IZDv92L74c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82037C4CEE3;
	Wed, 28 May 2025 20:15:59 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uKNCu-0000000AmUS-25P7;
	Wed, 28 May 2025 16:17:00 -0400
Message-ID: <20250528201643.598382331@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 28 May 2025 16:16:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Tomas Glozar <tglozar@redhat.com>,
 John Kacur <jkacur@redhat.com>
Subject: [for-next][PATCH 0/3] tracing/tools: Updates for v6.16
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
tools/for-next

Head SHA1: 8020361d51eea5145402e450d91b083bccdcd874


Costa Shulyupin (1):
      rtla: Set distinctive exit value for failed tests

Tiezhu Yang (1):
      rtla: Define __NR_sched_setattr for LoongArch

Tomas Glozar (1):
      rtla: Define _GNU_SOURCE in timerlat_bpf.c

----
 tools/tracing/rtla/src/osnoise_hist.c  |  5 +++--
 tools/tracing/rtla/src/osnoise_top.c   |  5 +++--
 tools/tracing/rtla/src/timerlat_bpf.c  |  1 +
 tools/tracing/rtla/src/timerlat_hist.c |  5 +++--
 tools/tracing/rtla/src/timerlat_top.c  |  5 +++--
 tools/tracing/rtla/src/utils.c         |  2 ++
 tools/tracing/rtla/src/utils.h         |  6 ++++++
 tools/tracing/rtla/tests/engine.sh     |  7 +++++--
 tools/tracing/rtla/tests/hwnoise.t     |  4 ++--
 tools/tracing/rtla/tests/osnoise.t     |  6 +++---
 tools/tracing/rtla/tests/timerlat.t    | 12 ++++++------
 11 files changed, 37 insertions(+), 21 deletions(-)
