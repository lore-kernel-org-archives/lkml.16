Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EDE19EED2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743720633; cv=none; b=TjQO7hqjhTpun9nqQGDyccelkDOXgaB1PyiW+wsxny27W4hwb/BRW6gVcE56vUapaqd2m6ezYYZ3P+gLR7OjBDQGYK8EvNN6U2bcEB+D1ZQaYbqCicA+vXiZeYQuI7rD7EITs/e6oPPLANGrZnJ0aHBWVOy/pG4/uYF032FJ65U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743720633; c=relaxed/simple;
	bh=0JuVEqkHkN4ir0IVIaGUNAbQxBLs5xh9wlzIENsUF1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gi/JjSVBAO3ATixEXN8g5kyxitnIN5Grptsa2Vsz7MsCuvwDZ6NEZfrFq0tnw/fYUD+F/dYIGXMfEI+B9Y/5KeY7ZixXLrf5bhowm8awTSczXxFgRqLqwbNLQPoHjIj5mw3KHu+GHka3nkAcG3Tcrou+9EsSNBuvltDMJ63C5Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMuDsWbw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMuDsWbw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A0FC4CEE3;
	Thu,  3 Apr 2025 22:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743720632;
	bh=0JuVEqkHkN4ir0IVIaGUNAbQxBLs5xh9wlzIENsUF1I=;
	h=From:To:Cc:Subject:Date:From;
	b=kMuDsWbw3bAqTn/zMNHzRG8OCVdkDT++rzKD//ag6pb21dBW29t+p1jW4OuXF36af
	 FRy7ZC9sf3ymhZRQ/kA16kYO6EVIhxQtjvEE+j5vlG2LkkzOuHaFM7L7KeiAhL6xqC
	 IRBku9bhpLFLoGuG5ew/p4gN0Qev/X6kZ4ZnPNqPO9j93rTi4r101oqZUuf0fx8xE1
	 lVaxQX3A0bxqyrCZX1hS1W2zfQyJlZUdNa3fbkSEg3KnKgzbunN6r5asmZ7iCPdFXN
	 BWIbBxfq7x7rlTwaJDIiJg9vgeGIsx5b5l3HYriEvZdRyfEJQvPcyiaJmdxWXXX3Vm
	 CElRWG7U+encQ==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: [PATCHSET sched_ext/for-6.16] sched_ext: Cleanup "ops" usage in symbols
Date: Thu,  3 Apr 2025 12:49:42 -1000
Message-ID: <20250403225026.838987-1-tj@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tag "ops" is used for two different purposes. First, to indicate that
the entity is directly related to the operations such as flags carried in
sched_ext_ops. Second, to indicate that the entity applies to something
global such as enable or bypass states. The second usage is historical and
causes confusion rather than clarifying anything. For example,
scx_ops_enable_state enums are named SCX_OPS_* and thus conflict with
scx_ops_flags.

This inconsistency will become more noticeable with the planned multiple
scheduler support. Clean them up in preparation.

This patchset is on top of the current linus#master e8b471285262 ("Merge tag
'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux") and
contains the following patches:

 0001-sched_ext-Drop-ops-from-scx_ops_enable_state-and-fri.patch
 0002-sched_ext-Drop-ops-from-scx_ops_helper-scx_ops_enabl.patch
 0003-sched_ext-Drop-ops-from-scx_ops_bypass-scx_ops_breat.patch
 0004-sched_ext-Drop-ops-from-scx_ops_exit-scx_ops_error-a.patch
 0005-sched_ext-Drop-ops-from-scx_ops_-init-exit-enable-di.patch

which are also available in the following git branch:

 git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-drop-ops-from-names

diffstat follows.

 kernel/sched/ext.c                |  458 ++++++++++++++++++--------------------
 kernel/sched/ext_idle.c           |   20 -
 kernel/sched/sched.h              |    4
 tools/sched_ext/scx_show_state.py |   14 -
 4 files changed, 239 insertions(+), 257 deletions(-)

--
tejun

