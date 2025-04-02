Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0703F1EB9EB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743629449; cv=none; b=KZ3CxSD/p1qQA4XmiyBjNj0lUKibqZV3JUyG0+ce+l1cZ7JWDEXxyUYZM8L1VTylryCKjnTk8wl9+KA8+DKN6oHtfHR2jT2fMRkdroraKj5tBZ7s9BDe9H+iPE/iDYtMdJcVP5ejPwc2WZDIDt+HyYyAkWPoUgOCe9nR1Bfqz0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743629449; c=relaxed/simple;
	bh=Cly8INjxdLGQPg8lY1p/Pj1h0c0hjHQgpNWpK+BMHic=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=OOK/2Ssx/PzwF1z6P+Ph1JO+6YGG9l3r7ubBy9Kr7KeQX7uEyus/ecSfJRzmUefH3VqxZfbVae5tRkwTv34dEUd+Ga1Xv/VNCFaTyftC31b4M60ckBFhBCTfc4zrV/Wt2KF+OSeQ+LrZJlG6xxQdpSgxWDZhsGpW5RRrhuvn36Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72835C4CEE8;
	Wed,  2 Apr 2025 21:30:48 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1u05ge-00000006YBS-2kod;
	Wed, 02 Apr 2025 17:31:52 -0400
Message-ID: <20250402213152.509456378@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 02 Apr 2025 17:31:38 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 kernel test robot <lkp@intel.com>,
 Julia Lawall <julia.lawall@inria.fr>,
 Gabriele Monaco <gmonaco@redhat.com>
Subject: [for-linus][PATCH 2/2] rv: Fix missing unlock on double nested monitors return path
References: <20250402213136.747061769@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Gabriele Monaco <gmonaco@redhat.com>

RV doesn't support nested monitors having children monitors themselves
and exits with the EINVAL code. However, it returns without unlocking
the rv_interface_lock.

Unlock the lock before returning from the initialisation function.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Link: https://lore.kernel.org/20250402071351.19864-2-gmonaco@redhat.com
Fixes: cb85c660fcd4 ("rv: Add option for nested monitors and include sched")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202503310200.UBXGitB4-lkp@intel.com
Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/rv/rv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/rv/rv.c b/kernel/trace/rv/rv.c
index 50344aa9f7f9..968c5c3b0246 100644
--- a/kernel/trace/rv/rv.c
+++ b/kernel/trace/rv/rv.c
@@ -809,7 +809,8 @@ int rv_register_monitor(struct rv_monitor *monitor, struct rv_monitor *parent)
 	if (p && rv_is_nested_monitor(p)) {
 		pr_info("Parent monitor %s is already nested, cannot nest further\n",
 			parent->name);
-		return -EINVAL;
+		retval = -EINVAL;
+		goto out_unlock;
 	}
 
 	r = kzalloc(sizeof(struct rv_monitor_def), GFP_KERNEL);
-- 
2.47.2


