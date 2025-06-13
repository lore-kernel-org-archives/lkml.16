Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD338F6C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749856989; cv=none; b=H/8EoDqEnvcJZHkDf31ksi4KCPcBqLEe/+To4TNMhvemRSvPmzPtcDrxlRrM4LFJDb4RemgVgSKGZSETjvIwRqFMi8F5Pe4tri1gffORcbFjPmKPbHr4Zf05RL4apQsILT4d0cOMN07yIzA6fWqpF+VniXN7XeCFcOv1cEJGJno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749856989; c=relaxed/simple;
	bh=nBtLZknoESRg0wFszCZq3RsdmiY34H8E6LkwU7+Mskw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Deo5TRbiKijSlomr48Ys79ImRSCfv/ktam7s2Pas0ItVf6yhy11Smn+w10FpaChYPz94zX5d0btwfDwdjjxLK1HvyGvzpMU+MitpZtyBiudaGXZ5dK4L7341yh/Wg2PHN1vndcYmOstr48aQu7nCUssiD84CGhStJgKd0vs+Jj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSCiZp5d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSCiZp5d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6238C4CEE3;
	Fri, 13 Jun 2025 23:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749856988;
	bh=nBtLZknoESRg0wFszCZq3RsdmiY34H8E6LkwU7+Mskw=;
	h=Date:From:To:Cc:Subject:From;
	b=BSCiZp5dF6c3NxcMEImObZThIUHq6LcA6OPotdfcNKlQPUVdNdCGBgw9LzIYR8q44
	 G21Ts5iSxFIbOtj3rPvhmC/gvNKeiwM0Iqc+MtWp/xluLpeeWMr6Xwu+rpv0et1bW4
	 ild9Ie2qVYovBgnq6XQVEMlqXb51SjsDLtnJFklce7CTTKMpsVMWUpl7RPDxABzfRX
	 NQbxKv4TkrCcRqoxSb7K4Wi45CowYPxeqDd6a9RJwBFcONRGHvG0SIxM/d04eKXszC
	 7vnI8+PsWbIaO4/kr1y8broQJZialB0RIayrPKgZkP1nwrhvY3lR4nxjgbz2VcIUsE
	 P4Z87GcoW+F/g==
Date: Fri, 13 Jun 2025 13:23:07 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2 sched_ext/for-6.16-fixes] sched_ext: Make
 scx_group_set_weight() always update tg->scx.weight
Message-ID: <aEyy27BecPPHDWHc@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Otherwise, tg->scx.weight can go out of sync while scx_cgroup is not enabled
and ops.cgroup_init() may be called with a stale weight value.

Signed-off-by: Tejun Heo <tj@kernel.org>
Fixes: 819513666966 ("sched_ext: Add cgroup support")
Cc: stable@vger.kernel.org # v6.12+
---
 kernel/sched/ext.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4241,12 +4241,12 @@ void scx_group_set_weight(struct task_gr
 
 	percpu_down_read(&scx_cgroup_rwsem);
 
-	if (scx_cgroup_enabled && tg->scx_weight != weight) {
-		if (SCX_HAS_OP(sch, cgroup_set_weight))
-			SCX_CALL_OP(sch, SCX_KF_UNLOCKED, cgroup_set_weight, NULL,
-				    tg_cgrp(tg), weight);
-		tg->scx_weight = weight;
-	}
+	if (scx_cgroup_enabled && SCX_HAS_OP(sch, cgroup_set_weight) &&
+	    tg->scx_weight != weight)
+		SCX_CALL_OP(sch, SCX_KF_UNLOCKED, cgroup_set_weight, NULL,
+			    tg_cgrp(tg), weight);
+
+	tg->scx_weight = weight;
 
 	percpu_up_read(&scx_cgroup_rwsem);
 }

