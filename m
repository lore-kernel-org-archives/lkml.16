Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA922A1C9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745451322; cv=none; b=CgnB0EllnN7i5HtlSHaNzXxPJkUSwqhCJ+xoAzy/+Ou/5kpXnhFeTskJiQOE81i0+fPD1eX3EQGuewBUf1RryIGDzoavkOcYgOp24NhQpj84FaMeI7tesfEto0ahmW/+hXpXIplkN8aJHBHC8J4vp16OXI0VRyB9uimAzCI7vsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745451322; c=relaxed/simple;
	bh=IENIViIvMMuyCx/9UyFORnLI8z2d9sdnDpUcGNgUBDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATnE5PridKWDhN3e3GvMKMSK9aeMqqtUQe7K3HZfWBNWBfVgAyl+QamhS0U6VkZOGPkB7IlSXR+SNc4wbAb9T13VhAftGZAThpIygDpCHO1xrrtMRdBMIE4jK8UETq95lMPMCDgAtNM94GMZQClGkS/v4zXJjxstC6Y8Mrgb9eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJpee2i0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJpee2i0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D52C4CEE2;
	Wed, 23 Apr 2025 23:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745451322;
	bh=IENIViIvMMuyCx/9UyFORnLI8z2d9sdnDpUcGNgUBDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJpee2i0dfwPB60rnOB3yZTef12h9tC9AdWhwfOQYJriCW4tg7M0lUoEXFkljeiOh
	 J7UFRUlcDCieKYzwttB48sVXL+RER8Vw1DuR6TZPmcech7KffjRm1rI6/5npUeH9sp
	 1ZeVag9sv9ldQgnEFPaiQ9r8R4TtqihPwi3ix1kaM0wj+F/EaM02QIF8yaa+YoF1qc
	 MwKx7tBbu3SB80KzRk+ujxZaJhzueQCo4NuTv7Le3q9XqUTmJjXG2mZYV2IHgt+csz
	 afIILEGFhdKJQt2qsqoGHSFdqwNfKxriuZAYrI8Q0o2H2fQpu0QAFemo1nk/9N0KVx
	 JUNUiM5H00zkw==
Date: Wed, 23 Apr 2025 13:35:20 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Jake Hillion <jake@hillion.co.uk>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched_ext: Clarify CPU context for running/stopping
 callbacks
Message-ID: <aAl5OIe5GLv1tkh1@slm.duckdns.org>
References: <20250423210205.281689-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423210205.281689-1-arighi@nvidia.com>

On Wed, Apr 23, 2025 at 11:02:05PM +0200, Andrea Righi wrote:
> The ops.running() and ops.stopping() callbacks can be invoked from a CPU
> other than the one the task is assigned to, particularly when a task
> property is changed, as both scx_next_task_scx() and dequeue_task_scx() may
> run on CPUs different from the task's target CPU.
> 
> This behavior can lead to confusion or incorrect assumptions if not
> properly clarified, potentially resulting in bugs (see [1]).
> 
> Therefore, update the documentation to clarify this aspect and advise
> users to use scx_bpf_task_cpu() to determine the actual CPU the task
> will run on or was running on.
> 
> [1] https://github.com/sched-ext/scx/pull/1728
> 
> Cc: Jake Hillion <jake@hillion.co.uk>
> Cc: Changwoo Min <changwoo@igalia.com>
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

Applied to sched_ext/for-6.16.

Thanks.

-- 
tejun
