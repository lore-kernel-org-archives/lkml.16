Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA2713BAE3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745451948; cv=none; b=roczKFqvu9VbWGIKi1W5tixygn/BpgzpqHDvlYQ82srzNwL99m9K4s7IxbFx/7LZVkMjHtFRErll/oZ13nZ4QYX7IRcaWTAUcSyjifO62I+FvsEky4KZFpAMkMnsHoTx8EU33GAo1fITW0Ug3xfLUTjJCvtFO4PoTpaQJS3IFw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745451948; c=relaxed/simple;
	bh=BZcU/Bdor7IKkth7urQP+bfeYnNBndpdp8HWEGPcLhA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=gT0e6kaKKA3JMGuZTNFxoczYVQMHty4W3Rwg5fzSCIvCcHU/VvRcPJiU3azM60qyQYSNXE3UnteYektF3W9+D59hQ18sGPkgnQ5nVCRAs/65I8B9u55LY6bD6fsO2rWBstpQqxozAbuf33Dq7AxWLblgqWh7aEwBdEPDFtHLPY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePrAuceC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePrAuceC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87CDC4CEE2;
	Wed, 23 Apr 2025 23:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745451947;
	bh=BZcU/Bdor7IKkth7urQP+bfeYnNBndpdp8HWEGPcLhA=;
	h=From:To:Subject:Date:From;
	b=ePrAuceCELpKQT0oh3zDQ810dr51kiyEP/pgFbK/JycLup5j9y1w6+r4Sm0hnn2nB
	 6hLEAreCmohZ6WekZhfgGE3ETmS4VaSL/drUSLPCmecI/Gq/JfJw5YFe3Tv9ETefwf
	 +klcfQTorJhhbsfO7L8vQRXmA/YuM2bvrMhZM3kJwnqBII4y3iGZpMFpPNeX3UqkJu
	 mxsGRkJZA4ZNxcTDhlJv/pSey3TMPYDCP0kdw7F9FtoPNvXORHgV2nRV7gpenjL2EQ
	 Na544EKAuRBrDkeOPQ+wwmp+cYhaiV6M709eSIjqcmSTgMliR0HpPZGq0+Nn6vsNUA
	 qXPA9nNBBGabQ==
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCHSET sched_ext/for-6.16] sched_ext: Introduce scx_sched
Date: Wed, 23 Apr 2025 13:44:38 -1000
Message-ID: <20250423234542.1890867-1-tj@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation of supporting multiple hierarchical schedulers, this patchset
packages the states which are currently global but need to become per
scheduler instance into the new struct scx_sched.

Currently, the only supported scheduler instance is the system-wide root one
(scx_root) and the code assumes scx_root in many places. A follow-up
patchset will introduce multiple scheduler support scrutinizing and updating
each such occurrence appropriately.

There's significant amount of churning but most changes are straightforward
if not trivial, and no user visible changes are expected.

0001-sched_ext-Introduce-scx_sched.patch
0002-sched_ext-Avoid-NULL-scx_root-deref-through-SCX_HAS_.patch
0003-sched_ext-Use-dynamic-allocation-for-scx_sched.patch
0004-sched_ext-Inline-create_dsq-into-scx_bpf_create_dsq.patch
0005-sched_ext-Factor-out-scx_alloc_and_add_sched.patch
0006-sched_ext-Move-dsq_hash-into-scx_sched.patch
0007-sched_ext-Move-global_dsqs-into-scx_sched.patch
0008-sched_ext-Relocate-scx_event_stats-definition.patch
0009-sched_ext-Factor-out-scx_read_events.patch
0010-sched_ext-Move-event_stats_cpu-into-scx_sched.patch
0011-sched_ext-Move-disable-machinery-into-scx_sched.patch
0012-sched_ext-Clean-up-SCX_EXIT_NONE-handling-in-scx_dis.patch

and is also available in the following git branch:

 git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx_sched

diffstat follows. Thanks.

 kernel/sched/ext.c      |  886 ++++++++++++++++++++++++++----------------------
 kernel/sched/ext_idle.c |    3
 2 files changed, 491 insertions(+), 398 deletions(-)

--
tejun

