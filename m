Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C0616D9C2
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 21:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746480640; cv=none; b=MIDSf+ZuR4CDXlWETk621R1ZJorcG7IDpfzK7TP9VEgzHTGBhM7EKucklNZ36rqDZV+Jthc4H1aVnkr8CoPtbG9jGfS30NrI3JVlT/RifI6/wlWHsk9cDy/Nu0eUh9l+mATPNUZvZOueNCkUNg/qqPKHlYWCOhYB7IDPptNNrLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746480640; c=relaxed/simple;
	bh=Bj2fusfJTaaWr0/xX5QKN09D9c+IyZzzknNjk0DRKO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QxaWmIVCpgbCbT0GM+hB3NvGcd34Lro6zF1N4LZMoOMkXWytArVDtOa9N7RNWIJn60TjqRgqQk7A4RFVjRxNCt45Sn4o1SBcgOsHGXObpgDfXk27aswt3y8iZkbtmKVd75ubBOkqWqc62f6yOzxvSulZh5hSQ+eBTA3YdGtzfMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=He41qURn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="He41qURn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3527FC4CEE4;
	Mon,  5 May 2025 21:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746480640;
	bh=Bj2fusfJTaaWr0/xX5QKN09D9c+IyZzzknNjk0DRKO8=;
	h=Date:From:To:Cc:Subject:From;
	b=He41qURn356N+WZ9NGxXG3uT8/1fHsD0+clnf/9yB+yqY2dcifm3kMhcW4VKynjAq
	 e/GEXTbyC6WJbMbJqC3f7E5qVF0QtTUidFfnXYRb/5HXdGN/JHzxZ6tuvJV2JRxIEU
	 hOd2d4gHACxdWRZmCj+exuvA/CyPeiF/lP7os4hupQeb6CtDYzo8DcIm8N/ScWYbdJ
	 SrpJj58EFNSnP1C4pbpDQUEEeOxXcjybsOr4Ia4+SOQQsXNatQ9uITsyS46KL/c+90
	 zl9eoOKbsjsbkj5tvPrskfuq7B1NWB2O+wpczfUF4N6aYfxAJXXu53jdrNd6T2eceF
	 q/a3TGBAi+aKg==
Date: Mon, 5 May 2025 11:30:39 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH sched_ext/for-6.15-fixes] sched_ext: bpf_iter_scx_dsq_new()
 should always initialize iterator
Message-ID: <aBkt_4tEZATxf6-Q@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 3ca42b7aea35cbcfb8d1fdde09e10a54edf97b26 Mon Sep 17 00:00:00 2001
From: Tejun Heo <tj@kernel.org>
Date: Mon, 5 May 2025 11:28:21 -1000

BPF programs may call next() and destroy() on BPF iterators even after new()
returns an error value. bpf_iter_scx_dsq_new() could leave the iterator in
an uninitialized state after an error return causing bpf_iter_scx_dsq_next()
to dereference garbage data. Make bpf_iter_scx_dsq_new() always clear
$kit->dsq so that next() and destroy() become noops.

Signed-off-by: Tejun Heo <tj@kernel.org>
Fixes: 650ba21b131e ("sched_ext: Implement DSQ iterator")
Cc: stable@vger.kernel.org # v6.12+
---
 kernel/sched/ext.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 4e37b40ce280..f5133249fd4d 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -6827,6 +6827,12 @@ __bpf_kfunc int bpf_iter_scx_dsq_new(struct bpf_iter_scx_dsq *it, u64 dsq_id,
 	BUILD_BUG_ON(__alignof__(struct bpf_iter_scx_dsq_kern) !=
 		     __alignof__(struct bpf_iter_scx_dsq));
 
+	/*
+	 * next() and destroy() will be called regardless of the return value.
+	 * Always clear $kit->dsq.
+	 */
+	kit->dsq = NULL;
+
 	if (flags & ~__SCX_DSQ_ITER_USER_FLAGS)
 		return -EINVAL;
 
-- 
2.49.0
