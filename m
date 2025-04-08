Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3C0224AE0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744135979; cv=none; b=RJP2MNPHxWQJvIaSPrtakkTotdmVC+rxKBrmosvc2/n5nvuXq5bJuQxRz3GsTM+cKcFtBUi0CU/LIofuEkyCESbMA4P6XD4iLPduORbNgya0UgRaT6bEN50DvDqWjBKoEMiqra2SBXKAhwkc8duhivc6JhRTxwTk+heN2u42jaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744135979; c=relaxed/simple;
	bh=SEYMtGN2s9cKuK2V1zVNlrzWEmIY+k7uAhMwzkbcrI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYt5l3GqXTFNLOI7GBWsD1BZzHe3rMfQzv3eDuLIOnHdejl/YRmVrxBjeKKIbeBONwUQPfxpn3oqEydNlXuPj8zFVYaPFrzyRWhPziKjmAF8lXZOTweHP5j++dbx3s9eZzSikHu33Crg4mVlq6fP4vpS1Bctgsq6u6bDR0I/2zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qN6wyJqB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qN6wyJqB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138DBC4CEE5;
	Tue,  8 Apr 2025 18:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744135978;
	bh=SEYMtGN2s9cKuK2V1zVNlrzWEmIY+k7uAhMwzkbcrI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qN6wyJqBOCnBU4HhCAEQOTQ2O88yVnG7rAG1mDXa3uJflqjaP/UzdHQx47wmN/8Mc
	 Q9I3JEgJJqI4PtESaCu5kpUzvz1E51Z4dSs1le+WJINn0Ren2MacKptGWlqVNE8trT
	 uf1G6WqiLISiCegFEyuz3I2QCT4iBzpft/O/TtMvn2mS8M8ZjDmWJmfMOtR6cxQUgO
	 +sN5wjOayQSlWl7nBA+fZEsVZU6LxppB+jj9CftUKfcNp4v8dFJjKaSQqXSSf2bto1
	 Ey72vQqRYugjHEa3CeMrSSyPjEo3eQFBow04rgji5LVtRLfHUf54QfKC2kMjj/DXst
	 Vnj4TZ3mhX3PA==
Date: Tue, 8 Apr 2025 08:12:57 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH sched_ext/for-6.15-fixes] sched_ext: Mark
 SCX_OPS_HAS_CGROUP_WEIGHT for deprecation
Message-ID: <Z_VnKbElcEWWg4CH@slm.duckdns.org>
References: <Z_RdpDkLCXm140RT@slm.duckdns.org>
 <Z_TXIe2fVpAt-CAg@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_TXIe2fVpAt-CAg@gpd3>

SCX_OPS_HAS_CGROUP_WEIGHT was only used to suppress the missing cgroup
weight support warnings. Now that the warnings are removed, the flag doesn't
do anything. Mark it for deprecation and remove its usage from scx_flatcg.

Signed-off-by: Tejun Heo <tj@kernel.org>
Suggested-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 21eaf081d336..fdbf249d1c68 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -163,7 +163,7 @@ enum scx_ops_flags {
 	/*
 	 * CPU cgroup support flags
 	 */
-	SCX_OPS_HAS_CGROUP_WEIGHT = 1LLU << 16,	/* cpu.weight */
+	SCX_OPS_HAS_CGROUP_WEIGHT = 1LLU << 16,	/* DEPRECATED, will be removed on 6.18 */
 
 	SCX_OPS_ALL_FLAGS	= SCX_OPS_KEEP_BUILTIN_IDLE |
 				  SCX_OPS_ENQ_LAST |
@@ -5213,6 +5213,9 @@ static int validate_ops(const struct sched_ext_ops *ops)
 		return -EINVAL;
 	}
 
+	if (ops->flags & SCX_OPS_HAS_CGROUP_WEIGHT)
+		pr_warn("SCX_OPS_HAS_CGROUP_WEIGHT is deprecated and a noop\n");
+
 	return 0;
 }
 
