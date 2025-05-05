Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1357288C93;
	Mon,  5 May 2025 22:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483346; cv=none; b=a6dNWRRCPjIOrxf22rELP5HrOApVXoNSQyHY1lEpIJ+fe0BGHdlDPbmt4TINBCngKnLnMUvtRd9rNE+QghI659JB3KEKlXI8/6KXggbpR3U0+h0nTVLt+pBE5WW4D8RcrwfoqL3XdEfKxUL/UFsft+HUPnNJhxcpXvg6AHdSqqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483346; c=relaxed/simple;
	bh=tkogEudEvpw9mjS1wtAuORHuCiG1rANSBzhh0smNXaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RMHGUWx6wISIA16ghT2nNmc+a9kXy2WmvQNw3F+8+4kxlxhosAnmrgBRsYN9WzCidxc7grfRnyhs+Uk8ifdbl3T8rBfK8g48R/4tyeXjA4W098YR5jlMoZmmzIZOOpx1gGVTBPpHDSKbZnij6PIddMPoAO+VhOCYxI62pfOnS80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmPF75gF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmPF75gF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF6EC4CEE4;
	Mon,  5 May 2025 22:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483346;
	bh=tkogEudEvpw9mjS1wtAuORHuCiG1rANSBzhh0smNXaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lmPF75gFVM4M5/BrmkKsPcTRicqYXUqmtNXXPJeZqQmxRve+2wGpirIBCZ8kIHEMO
	 ZMj5UYUUkNtarXDXFajRLu8byKFG3zCmURUhy/ZBW16jZ4UhJ/cD+b1dVpo2xulrm9
	 oNAt7kjs1vxuDcmpKQyzwpwhANW+Azz1PKoxjoA0rkHBlxOuCgomnR8Wed8q/1BbzI
	 juP/4VGhBoNwdSJHqpvkIDoAWxMN4yfVNHKAlKWDSVfPJ1Yl1/yDuT/HfAQZRE1gMP
	 Zc+kRjPC9Gd6RwymdA2uLBuSqTFt5OT4kLrVPFt7TluHl0Iyakw48nNEXEfmrYQXid
	 YyDf/ZDJWXhPA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	akpm@linux-foundation.org,
	mhocko@suse.com,
	mjguzik@gmail.com,
	pasha.tatashin@soleen.com,
	alexjlzheng@tencent.com
Subject: [PATCH AUTOSEL 6.14 046/642] exit: fix the usage of delay_group_leader->exit_code in do_notify_parent() and pidfs_exit()
Date: Mon,  5 May 2025 18:04:22 -0400
Message-Id: <20250505221419.2672473-46-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Oleg Nesterov <oleg@redhat.com>

[ Upstream commit 9133607de37a4887c6f89ed937176a0a0c1ebb17 ]

Consider a process with a group leader L and a sub-thread T.
L does sys_exit(1), then T does sys_exit_group(2).

In this case wait_task_zombie(L) will notice SIGNAL_GROUP_EXIT and use
L->signal->group_exit_code, this is correct.

But, before that, do_notify_parent(L) called by release_task(T) will use
L->exit_code != L->signal->group_exit_code, and this is not consistent.
We don't really care, I think that nobody relies on the info which comes
with SIGCHLD, if nothing else SIGCHLD < SIGRTMIN can be queued only once.

But pidfs_exit() is more problematic, I think pidfs_exit_info->exit_code
should report ->group_exit_code in this case, just like wait_task_zombie().

TODO: with this change we can hopefully cleanup (or may be even kill) the
similar SIGNAL_GROUP_EXIT checks, at least in wait_task_zombie().

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
Link: https://lore.kernel.org/r/20250324171941.GA13114@redhat.com
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/exit.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/exit.c b/kernel/exit.c
index 3485e5fc499e4..6bb59b16e33e1 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -265,6 +265,9 @@ void release_task(struct task_struct *p)
 	leader = p->group_leader;
 	if (leader != p && thread_group_empty(leader)
 			&& leader->exit_state == EXIT_ZOMBIE) {
+		/* for pidfs_exit() and do_notify_parent() */
+		if (leader->signal->flags & SIGNAL_GROUP_EXIT)
+			leader->exit_code = leader->signal->group_exit_code;
 		/*
 		 * If we were the last child thread and the leader has
 		 * exited already, and the leader's parent ignores SIGCHLD,
-- 
2.39.5

