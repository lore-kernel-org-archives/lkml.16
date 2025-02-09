Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E17842065
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 06:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739082830; cv=none; b=GXoZy3TfPkFN+aU1KaYjGKHRvfYgqO0w6MocrW/EwQCtka2ihw/V1OvzH6YKFQzgqOMB9LOIu6uOCnjhvbVeEDFFPJI3Hoi9fblP7kUxZYPfuk44TOssV4j/3R/hpBYiatmV2qpq5R72BPqxwetPEp93mcMb7/HiwwkIEzocwyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739082830; c=relaxed/simple;
	bh=VMFuAC0HS759OsXlxvxdVDytMlkPwBHgF7qlvYiusNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDJpyYYEapzdQLsaOl4ILhqqab/4HYY5Ds5cwBXK2F7ks8qbQCpP8BGz8URF5ZRmRBusjnyZNoWZs6wmX4E3HwtgMUZbc/jf0qc4FLmFUNkw8WyklVp2H9Hj4DIZMtseEP+kyaatbKlJKSP4DR99UZaYVLK0BdmtL2epmrfoooA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XsOx8eMy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsOx8eMy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9CAC4CEDD;
	Sun,  9 Feb 2025 06:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739082829;
	bh=VMFuAC0HS759OsXlxvxdVDytMlkPwBHgF7qlvYiusNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XsOx8eMyq25GLCRkOCZNkxPHNQopFFFDM5vLHxpkIOQ3GGklZhpdiXyBNYcnrQuK/
	 WVoKvrNWtxyPGlNGZg2FdfTj+wyJOzSHmxv4N0qEL0wwRwkWloz8n03Ik5OhNp4+hO
	 YoFacqcnnYGk5hpCsi77YwaVePa4TSUCVVPJPXGAYuZam0eBCsUQJok4HgQ9OFH0o+
	 NeHOzKLV2IfNZF1k+FzImzX90qmEkx3D1pqjQjzmYVUVxbfPMtZzCfTVWmVf7S1QK3
	 /KNS3AOdDDGmcRcBsTpsxbgclhNvSbZxuVu0WONE2fo31pvuNLzvqDfxVgSWylHcOn
	 TiOQSEyyty8aw==
Date: Sat, 8 Feb 2025 20:33:48 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org, sched-ext@meta.com
Subject: Re: [PATCH sched_ext/for-6.14-fixes 2/2] sched_ext: Fix migration
 disabled handling in targeted dispatches
Message-ID: <Z6hMTDhikIpxTSzY@slm.duckdns.org>
References: <Z6Zz79AUub1YuHwD@slm.duckdns.org>
 <Z6Z0GgXetBRy1-X1@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6Z0GgXetBRy1-X1@slm.duckdns.org>

On Fri, Feb 07, 2025 at 10:59:06AM -1000, Tejun Heo wrote:
> A dispatch operation that can target a specific local DSQ -
> scx_bpf_dsq_move_to_local() or scx_bpf_dsq_move() - checks whether the task
> can be migrated to the target CPU using task_can_run_on_remote_rq(). If the
> task can't be migrated to the targeted CPU, it is bounced through a global
> DSQ.
> 
> task_can_run_on_remote_rq() assumes that the task is on a CPU that's
> different from the targeted CPU but the callers doesn't uphold the
> assumption and may call the function when the task is already on the target
> CPU. When such task has migration disabled, task_can_run_on_remote_rq() ends
> up returning %false incorrectly unnecessarily bouncing the task to a global
> DSQ.
> 
> Fix it by updating the callers to only call task_can_run_on_remote_rq() when
> the task is on a different CPU than the target CPU. As this is a bit subtle,
> for clarity and documentation:
> 
> - Make task_can_run_on_remote_rq() trigger SCHED_WARN_ON() if the task is on
>   the same CPU as the target CPU.
> 
> - is_migration_disabled() test in task_can_run_on_remote_rq() cannot trigger
>   if the task is on a different CPU than the target CPU as the preceding
>   task_allowed_on_cpu() test should fail beforehand. Convert the test into
>   SCHED_WARN_ON().
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Fixes: 4c30f5ce4f7a ("sched_ext: Implement scx_bpf_dispatch[_vtime]_from_dsq()")
> Fixes: 0366017e0973 ("sched_ext: Use task_can_run_on_remote_rq() test in dispatch_to_local_dsq()")
> Cc: stable@vger.kernel.org # v6.12+

Applied 1-2 to sched_ext/for-6.14-fixes.

Thanks.

-- 
tejun
