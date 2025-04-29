Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8DE213E67
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745952104; cv=none; b=QS8v06X26pZVuYmqe0VCmWtit9UeGF1m3a495zVZiSCrBs1/bcT+O/7NN1+jfZvmHQomnUre8AR3zIFhAVWTeEQFScYxO/CteZiDdCz7EcSZUGpelNdUY2II0ZZI9Vzw0bCK+gAuCHxoFEcAMGwUL3n9yO/4VclwljOtOIHSjzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745952104; c=relaxed/simple;
	bh=+VXAkOYjvogrioLI8Nn0e/cha9At6mkf2huzN4dLye8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4DLvP5fqAjtz7bJUsK7rNqwl8gUKxtXbIgMsFKG4yUXElsrH4l6uvJt6CChPCw9mE9gY8PVyXEVOUn+/4WAlTnTMkZzoojsU8/6ivSBd2FYfj0CePVCF1x1gbxne2Vh4nH/7yS774FU9yqZK1hEly63dwy7h6MsSNh9Q+cNKvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rnhN25Xg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rnhN25Xg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA672C4CEE3;
	Tue, 29 Apr 2025 18:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745952104;
	bh=+VXAkOYjvogrioLI8Nn0e/cha9At6mkf2huzN4dLye8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnhN25Xg6W8PgzyWHRfZxRh3/Vdn2QL1dNj0vNOSDnrIXqK2w0DKhXNgSQk/z60Yf
	 3Ow2iHgGwehmvdKc+TtTPYU4joqgXiXfta1NIlD4Pks+LHuvxwx9N0oAsKDYtzmTwm
	 3YCTYQHZYtZGMH2f4x77LlsiGJn+O7W2Mj5NoxIuDfIgCEDgpXzNWqi8V5NC3D/LP6
	 Nk8M09VZfpRLKFRiAtL2QO7+z5EOVZM82OyBasFsH9IDz6JcG0HEnilEXNgHaEn3jB
	 3+1IxdrcOf2az8VGzBC2CtEmM+aRLZYedbNJ/FcXLqtGKW23eEbrZ0eYGjOtSafwuY
	 6eEb5JWFjVCVA==
Date: Tue, 29 Apr 2025 08:41:42 -1000
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com, arighi@nvidia.com, multics69@gmail.com
Cc: linux-kernel@vger.kernel.org, sched-ext@meta.com
Subject: Re: [PATCHSET v2 sched_ext/for-6.16] sched_ext: Introduce scx_sched
Message-ID: <aBEdZsyMu2kHg2_B@slm.duckdns.org>
References: <20250425215840.2334972-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425215840.2334972-1-tj@kernel.org>

On Fri, Apr 25, 2025 at 11:58:15AM -1000, Tejun Heo wrote:
> v[1] -> v2:
> 
> - 0003-sched_ext-Use-dynamic-allocation-for-scx_sched.patch updated to store
>   scx_sched pointer in sched_ext_ops->priv so that bpf_scx_unreg() can
>   determine the scx_sched to destroy regardless of where initialization
>   failed. This will also help with supporting multiple schedulers.
> 
> - Minor updates to 0010-sched_ext-Move-event_stats_cpu-into-scx_sched.patch.
> 
> In preparation of supporting multiple hierarchical schedulers, this patchset
> packages the states which are currently global but need to become per
> scheduler instance into the new struct scx_sched.
> 
> Currently, the only supported scheduler instance is the system-wide root one
> (scx_root) and the code assumes scx_root in many places. A follow-up
> patchset will introduce multiple scheduler support scrutinizing and updating
> each such occurrence appropriately.
> 
> There's significant amount of churning but most changes are straightforward
> if not trivial, and no user visible changes are expected.
> 
>  0001-sched_ext-Introduce-scx_sched.patch
>  0002-sched_ext-Avoid-NULL-scx_root-deref-through-SCX_HAS_.patch
>  0003-sched_ext-Use-dynamic-allocation-for-scx_sched.patch
>  0004-sched_ext-Inline-create_dsq-into-scx_bpf_create_dsq.patch
>  0005-sched_ext-Factor-out-scx_alloc_and_add_sched.patch
>  0006-sched_ext-Move-dsq_hash-into-scx_sched.patch
>  0007-sched_ext-Move-global_dsqs-into-scx_sched.patch
>  0008-sched_ext-Relocate-scx_event_stats-definition.patch
>  0009-sched_ext-Factor-out-scx_read_events.patch
>  0010-sched_ext-Move-event_stats_cpu-into-scx_sched.patch
>  0011-sched_ext-Move-disable-machinery-into-scx_sched.patch
>  0012-sched_ext-Clean-up-SCX_EXIT_NONE-handling-in-scx_dis.patch

Applied to sched_ext/for-6.16.

Thanks.

-- 
tejun
