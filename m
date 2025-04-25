Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996E62192F3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618325; cv=none; b=EFFGtmMX4dw7UXxpkXtJX9S5DPf0PKHldCJnYwg8n27IZ5WhxkIG3pXqI45KcsvtOyhK3Wgf3uMSvWxekm8pGhOm3zukr0CivzB0tm9WthqYJfJRTsuX0PQKv0+U/uHOh1kiMPaad4uIoNphwoVjpiHRYcwssCuSecJ6kLvAMpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618325; c=relaxed/simple;
	bh=yX2UEgTHUmX6YmhF88QfxUBfblz5Fv1UnU+8YjXszeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JiRTpQEaXtvxNFMRxBs1IwcF/BGPHgcV2C2FPh76UQ5/SQzN2HcKw59aQ6P7IThR0P861LBQCLBioO3/Tb8wlY81GVw3gjgiAi79mp6Ws9KPLgzykEkRH7y7q5kkP8/CJW/dXU3HcuhTbqwgLV6HqQvhcwx6sFCKcw6bB/dv07c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjmehz+F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjmehz+F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A5FC4CEE9;
	Fri, 25 Apr 2025 21:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745618324;
	bh=yX2UEgTHUmX6YmhF88QfxUBfblz5Fv1UnU+8YjXszeY=;
	h=From:To:Cc:Subject:Date:From;
	b=cjmehz+FVEy5uOMNEYEx3Xxvgq+ERXtpekGEc9XqFsSf3eWUP4+oRBwCPbsDOESK2
	 LBhJpqjOygmnlEq8jf62PWuEmnpfmJP1H9cQaIonFJkRKhBCRxiwwryaCrzJiVxeSY
	 dMObzwrwStFrrTlbXmjJ9V5wsK4myDL06FUNRNat3Ws9xibOCqAUES41ZmdCi2S1U1
	 julXUVfqVFI1qycgSTVRNkv6IdNbJwy/6GJmjc+TyP7l/AyxQq9Kospoxkz2MMpLx1
	 IrsD+I5Byjh7aLVN2X14iT+xkopTIX8wRNWyenTKPDEI41rvuEIdswb91Qivwi6/bG
	 AdRKIWb+6EGkw==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: [PATCHSET v2 sched_ext/for-6.16] sched_ext: Introduce scx_sched
Date: Fri, 25 Apr 2025 11:58:15 -1000
Message-ID: <20250425215840.2334972-1-tj@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v[1] -> v2:

- 0003-sched_ext-Use-dynamic-allocation-for-scx_sched.patch updated to store
  scx_sched pointer in sched_ext_ops->priv so that bpf_scx_unreg() can
  determine the scx_sched to destroy regardless of where initialization
  failed. This will also help with supporting multiple schedulers.

- Minor updates to 0010-sched_ext-Move-event_stats_cpu-into-scx_sched.patch.

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

 git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx_sched-v2

diffstat follows. Thanks.

 kernel/sched/ext.c      |  892 ++++++++++++++++++++++++++----------------------
 kernel/sched/ext_idle.c |    3
 2 files changed, 496 insertions(+), 399 deletions(-)

--
tejun

[1] http://lkml.kernel.org/r/20250423234542.1890867-1-tj@kernel.org
