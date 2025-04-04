Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BBE3D984
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 18:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743792829; cv=none; b=ndH+SOVYLy2ewzDKCbi/PTY+DfHC9NV4vfq9PX2yBBNDZG0Xk6eDE0aBNHYeLbFCKmiwlE4AKddfhEIH8xLwsMd8w+3/jVoyD9jgFk5EaS8HB/2mXUvVT5VSV4RI/sn79J5HaL5qthIuCNjAgNfb43IPugSKKGyL65+hB+zisT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743792829; c=relaxed/simple;
	bh=4roYM9MGxVbQ3FCF7i4OX5frWmKimjizq1bm5jax3qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tkac3A9HrY6niImWFF2z+yeRvUKrC7X5C+7WNfjY7gPXzG+JxvOzZ9rapcUcXJ4TDNOKNPSFIVldBgo9DsGO44HA3h8ikRECZB26eYPGHfa/XY0WJ8XtiqQgW2/9QzKMm2g6RatDYrjYW+AU7hW5e9fpki62VHabYFc3Q3u79jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wn2jG5p4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wn2jG5p4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A46CC4CEDD;
	Fri,  4 Apr 2025 18:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743792828;
	bh=4roYM9MGxVbQ3FCF7i4OX5frWmKimjizq1bm5jax3qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wn2jG5p4zr/e/ie3oaKfWHVpdKvF7cAnitUJNTo31d1Qi6KfuBdNBUC/U7iDaeIF+
	 oADYRukeXYTfN9yW3Yof8mezl4BNqKmEN+QW9ZRyOEdCmue7pRbdiZn+PL/Jjs11l6
	 AMx3iPi9x3ZZtKhK4u4ugnKFA1S6/cflJmRdHeT3s93q8JlcW+RU/ZDZSOgMUfiMT6
	 kXed6laqyRIwXGjv5dv01tuoDJuuNPuTHUvYWA9aIIWsRcQvjn7Uf/nV9M8gd7G6wV
	 SDyDAtrnkltWM5kqsX+sZgfk0kTqZjsrApebCZvjjY5/hRwaazX+SVJieBVaFrlL/b
	 Ehixha2DFFxLg==
Date: Fri, 4 Apr 2025 08:53:47 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: void@manifault.com, multics69@gmail.com, linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: Re: [PATCHSET sched_ext/for-6.16] sched_ext: Cleanup "ops" usage in
 symbols
Message-ID: <Z_Aqu8cKVHa4SnMR@slm.duckdns.org>
References: <20250403225026.838987-1-tj@kernel.org>
 <Z--NLGOGQe_9xULR@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z--NLGOGQe_9xULR@gpd3>

On Fri, Apr 04, 2025 at 09:41:32AM +0200, Andrea Righi wrote:
> Hi Tejun,
> 
> On Thu, Apr 03, 2025 at 12:49:42PM -1000, Tejun Heo wrote:
> > The tag "ops" is used for two different purposes. First, to indicate that
> > the entity is directly related to the operations such as flags carried in
> > sched_ext_ops. Second, to indicate that the entity applies to something
> > global such as enable or bypass states. The second usage is historical and
> > causes confusion rather than clarifying anything. For example,
> > scx_ops_enable_state enums are named SCX_OPS_* and thus conflict with
> > scx_ops_flags.
> 
> We should probably rename also SCX_OPS_TASK_ITER_BATCH, which is not
> related to sched_ext_ops as well.
> 
> Apart than that and the other comment about scx_error(), this looks like a
> good cleanup.
> 
> Acked-by: Andrea Righi <arighi@nvidia.com>

Applied 1-5 to sched_ext/for-6.16. Will address the suggestions in separate
patches.

Thanks.

-- 
tejun
