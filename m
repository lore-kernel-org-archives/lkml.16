Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F2421171B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743797416; cv=none; b=saJbOa9j/fZKa0322zC/HpkaaJ9PfgoefjQIIUptY1dZ9bCxHqDa6qnaavdArwoSyYh/vuyNtaPihJdf4LLv12HFq/YozPPdPlb8CSmKsIIiA0mrvr2d3eB+f2VC4c0E6SiuA3PhSX/OQLshj9gyd8lc4I9ytFKn2cSHsgW94A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743797416; c=relaxed/simple;
	bh=DE4KCV0TzLpLW4OL3j8Qh5bJB7kbdPfxVvil/YKeYS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocfdj69lXyGCUwYLa9Mfe5DPomGhzTV51BJS3NdqVJAXpj2qLMxkdOfuwazD+voTYBorISrZ92Ka7+igNz4GPHtLNDiVJSKm6n2iEmJElQPui12NF3hJ/C/wsNVBiOJSvoQHP5ngqHe9zQ3HRvfn8TaE8pAt4hj4PD+W0amzSIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtrJUgQm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtrJUgQm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572CDC4CEDD;
	Fri,  4 Apr 2025 20:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743797415;
	bh=DE4KCV0TzLpLW4OL3j8Qh5bJB7kbdPfxVvil/YKeYS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtrJUgQm/RZJuBmSf1V9Y6qJD/rY3hy0898aUp+SCKowvyMKC/cIOxirSc2iIvMMx
	 pmRrUey/kC1GpL10awWxeLm99HZbMNJNJaruCFlWofkCJqSJPq2C8DTeLAkzu27z99
	 QDyhDHU7h6ooqh0jxY+4jeO+GbLZomljUFIuZiUWebow5idkkJeUien9YMcA+pTOg+
	 AWYwaSyit7AKYkC3SnXPcSijD95DYzRciQsgQ+eSsQEsdwtujczK+jKThUvw/v3d/D
	 7taU9lEcOyBpDoDPfFIa59VbHCuWQyNq5PZJDy8l8AftN/rpyvyp1y1H2nKmh85KWv
	 uP+MfPxQ6lVwA==
Date: Fri, 4 Apr 2025 10:10:14 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: void@manifault.com, multics69@gmail.com, linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: Re: [PATCH 6/5] sched_ext: Drop "ops" from SCX_OPS_TASK_ITER_BATCH
Message-ID: <Z_A8piEiBmvATU7s@slm.duckdns.org>
References: <20250403225026.838987-1-tj@kernel.org>
 <Z--NLGOGQe_9xULR@gpd3>
 <Z_AvCG5HcMV6b_xT@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_AvCG5HcMV6b_xT@slm.duckdns.org>

On Fri, Apr 04, 2025 at 09:12:08AM -1000, Tejun Heo wrote:
> The tag "ops" is used for two different purposes. First, to indicate that
> the entity is directly related to the operations such as flags carried in
> sched_ext_ops. Second, to indicate that the entity applies to something
> global such as enable or bypass states. The second usage is historical and
> causes confusion rather than clarifying anything. For example,
> scx_ops_enable_state enums are named SCX_OPS_* and thus conflict with
> scx_ops_flags. Let's drop the second usages.
> 
> Drop "ops" from SCX_OPS_TASK_ITER_BATCH.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Suggested-by: Andrea Righi <arighi@nvidia.com>

Applied to sched_ext/for-6.16.

Thanks.

-- 
tejun
