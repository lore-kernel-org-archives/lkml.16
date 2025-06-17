Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC0E2EBB81
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750184414; cv=none; b=hLgfz/b00MORVU9QyMtd7al05qwy2g56A4ynjFMSwxDSiuANVkBzUEx4aWOsBNkwT4e1lmpBH3TBBe0uNzkugejdgv0eRmKudyYSexe5jVbr7D4HkD24HG8On0zbtbFcZuKvS2FZ1RKtV8QMUUxiMVJka9rkWkg49uBCeFYgXak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750184414; c=relaxed/simple;
	bh=8uNQYeonIAxuiCKQbCotQ8z+iFYTqz4Y4T12VPdRZ8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MD6+HXf0XAK/Xg0SrNN+oexxazynpYL9pZKa3VONWhmQ76WE673QVlqm9fi/NAsx7r7nLozMDYA5605HGY+cUupm2NbotFRDVM6iqKkDrL9OMHNOov1z3lejPQXrXDa9gWlwwk4u3qe5sPymwnwz6m+XaRRzHZR5mIYLlp5eZvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdleFCbr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdleFCbr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C27BC4CEE3;
	Tue, 17 Jun 2025 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750184414;
	bh=8uNQYeonIAxuiCKQbCotQ8z+iFYTqz4Y4T12VPdRZ8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MdleFCbr7XKlOQXxryznHbvxQqpzhYm0Q/kObRRzi7502tJHUQMhylZgSQxsEBXIL
	 uxkphbw43fjIu5gBwDAAWC9c2ylaKYPaf1GpHXhIaogfUUyh7Rxom9n3+rEEvw/kb3
	 YZu6y00Yejqv2XS1rcIbHFcx3UPhR9HMRQCCiaTQmZrJvRoigjJlnSWUw/atoXvxr/
	 m91oHABLmCRjjjC4tn8sEu/eRzDvCjcB8hjmkKEy+SCd6xO0fOVi74yDGg6oho4Tz0
	 8dJW2H+sliVCu9WMmbk+neoMLPFqFcRhqNRe1ZyymiUHVkqJpmGzKRHIFYBXsLslk3
	 TMZGZAAt+GMlA==
Date: Tue, 17 Jun 2025 08:20:13 -1000
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 2/2 sched_ext/for-6.16-fixes] sched_ext, sched/core:
 Don't call scx_group_set_weight() prematurely from sched_create_group()
Message-ID: <aFGx3RzxQnirpWpn@slm.duckdns.org>
References: <aEyy27BecPPHDWHc@slm.duckdns.org>
 <aEyzhBAl5zkP6Ku-@slm.duckdns.org>
 <aFB65Zfis1iBvKoc@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFB65Zfis1iBvKoc@slm.duckdns.org>

On Mon, Jun 16, 2025 at 10:13:25AM -1000, Tejun Heo wrote:
> During task_group creation, sched_create_group() calls
> scx_group_set_weight() with CGROUP_WEIGHT_DFL to initialize the sched_ext
> portion. This is premature and ends up calling ops.cgroup_set_weight() with
> an incorrect @cgrp before ops.cgroup_init() is called.
> 
> sched_create_group() should just initialize SCX related fields in the new
> task_group. Fix it by factoring out scx_tg_init() from sched_init() and
> making sched_create_group() call that function instead of
> scx_group_set_weight().
> 
> v2: Retain CONFIG_EXT_GROUP_SCHED ifdef in sched_init() as removing it leads
>     to build failures on !CONFIG_GROUP_SCHED configs.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Fixes: 819513666966 ("sched_ext: Add cgroup support")
> Cc: stable@vger.kernel.org # v6.12+

Applied 1-2 to sched_ext/for-6.16-fixes.

Thanks.

-- 
tejun
