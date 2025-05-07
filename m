Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFD6156237
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746635704; cv=none; b=CVvly3ZBxSqODO6s1eNqTcEWf3l13pdZXwpUPMHoYQ6J/I9vpwTzYl/zjCu/601a+F6H+QZdpy+JQMnUCsCUInGv9yF8o7bLPEycz0AUhBrGSSm1HzsZdlqDBQJP1DvikSxUzMOCYgYIdo3o46QfbthLAYyiGwB8xMai9PoqCkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746635704; c=relaxed/simple;
	bh=kad3jINNZ0osjkDMFkqfo9JLDhhK/YCCvNjLOOfIsUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlSUZPopnvZvSbrwgSIdGxE4bJiNunZidv01SBH0puLqP4ksRwXPCANczikNKyBQNwucN77eWvPMI2FYxtKs17rlvqyjgh1/60KYpGUC5ziV0DvLS4HKYAtgHt7VN380RBpwUGqOqJVcfWkoU0Hxemyp2CahY3jZZvBjbvUDw3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sZSeTLFk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sZSeTLFk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0A6C4CEE2;
	Wed,  7 May 2025 16:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746635703;
	bh=kad3jINNZ0osjkDMFkqfo9JLDhhK/YCCvNjLOOfIsUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sZSeTLFkyGwKwCd31moc58PtGiSuEiUcNGorc82opu4eu3COTP8vQABhNlA4R/pJT
	 y/KMTBi1PEF6ZscUlrdZlgNj7fLyPFVKoYBGkSRpbv5zIQrkABLBQw8mbSHuhS3ZdW
	 /CFHIOzCRFm5wjpaRr4LO+uqFdZaUczUuqthQbe1ofBTJxfda8HM/h6q+qrUbFOfn1
	 LmJZ/VnbjckNhBp0t1ys37LdxRJn2XJ0TfOsSZSzQuKCaBe6PRv9OsTuM8zJDjr69a
	 AgTHnr8Lnyrp4wckZaMCWAtBGfiKERiMp9KiDOuiprmn3I/WsiKU5O4PMJFTSQI6hW
	 nLWq8x7OFKFRw==
Date: Wed, 7 May 2025 06:35:02 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched_ext/for-6.15-fixes] sched_ext:
 bpf_iter_scx_dsq_new() should always initialize iterator
Message-ID: <aBuLtjMM9LHLkreU@slm.duckdns.org>
References: <aBkt_4tEZATxf6-Q@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBkt_4tEZATxf6-Q@slm.duckdns.org>

Applied to sched_ext/for-6.15-fixes with a small update to commit message as
suggested by Andrea.

------ 8< ------
From 428dc9fc0873989d73918d4a9cc22745b7bbc799 Mon Sep 17 00:00:00 2001
From: Tejun Heo <tj@kernel.org>
Date: Mon, 5 May 2025 11:30:39 -1000
Subject: [PATCH] sched_ext: bpf_iter_scx_dsq_new() should always initialize
 iterator

BPF programs may call next() and destroy() on BPF iterators even after new()
returns an error value (e.g. bpf_for_each() macro ignores error returns from
new()). bpf_iter_scx_dsq_new() could leave the iterator in an uninitialized
state after an error return causing bpf_iter_scx_dsq_next() to dereference
garbage data. Make bpf_iter_scx_dsq_new() always clear $kit->dsq so that
next() and destroy() become noops.

Signed-off-by: Tejun Heo <tj@kernel.org>
Fixes: 650ba21b131e ("sched_ext: Implement DSQ iterator")
Cc: stable@vger.kernel.org # v6.12+
Acked-by: Andrea Righi <arighi@nvidia.com>
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

