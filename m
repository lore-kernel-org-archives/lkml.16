Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EB6253B46
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744225615; cv=none; b=Thpz6xizRQXUkvaYLxlAqbroNDzBbxxmPeLPPgPLE5H4wsgCtW9uYNl88Kp0TXHgo9ZmFLuPbA2rVRAxkT85Tc9yxHLqYtefAYvDccn28+kiINrR8SnFMfN+V1iAlk75g/AcdkbhW26uUWRe8ZXczgfCcu1tS5I58ls6Ud580qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744225615; c=relaxed/simple;
	bh=+9fuBJejwno9vlxLG4fXIl+II6GIWfgD1/Po/wY7cOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/2zMVJdTjc4QJKPKYifogwHsibrSYvp8ONK7eVgT+hSSuLdx+8GFvcpQTTesOZPJKToK2y4JJyB1o7DvQeV2biguPdvRHrRgCMNLZy4QMSHzToRgG2xLN7Ic2zqRkb652JqMRPff63Pqyl8qFTrLqCxeouaAm9V75b40dYQYA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9IU0IaA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9IU0IaA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69177C4CEE2;
	Wed,  9 Apr 2025 19:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744225614;
	bh=+9fuBJejwno9vlxLG4fXIl+II6GIWfgD1/Po/wY7cOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R9IU0IaAMHe8fzwoYmvfsmLzA4zaAe9WRkK1A6c3t7qDe5naVhD9SwXcod2I3RghW
	 7TjucyK1R/o4IAI52tZdv1jnvERY5NiA91MFpPtv4M4iZ4q+conTPl6n1RmkTflw69
	 emsoCW7k66pVFHrXTukVwCScxUnBsvBI8grjT36SC50/n4mnCiaO3vCDMOpwiC89Nx
	 g1h2u8MOUVf3SbtLKhJoCfSO+zV9/0rG2CJ+16YcxNH6g3kl+qlMxfL04aNjoUnyig
	 qO0nKAJ1CuiXtwc8BWXbtZtlM+xOmumeEjqX6CFXUNkhH1GwzOPyv0GfY/IXvK3hw7
	 pzlS6+rkuRe4Q==
Date: Wed, 9 Apr 2025 09:06:53 -1000
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com, arighi@nvidia.com, multics69@gmail.com
Cc: linux-kernel@vger.kernel.org, sched-ext@meta.com
Subject: Re: [PATCHSET sched_ext/for-6.16] sched_ext: Reduce usage of
 static_keys
Message-ID: <Z_bFTQBweZf59CzC@slm.duckdns.org>
References: <20250408230616.2369765-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408230616.2369765-1-tj@kernel.org>

On Tue, Apr 08, 2025 at 01:06:00PM -1000, Tejun Heo wrote:
> sched_ext uses static_keys to optimize branches on ops flags and which ops
> are implemented. Some of those branches aren't that hot and while others are
> hotter, they are unlikely to cause meaningful overhead difference given
> everything else that's going on. static_keys were used more because there
> was no reason not to use static_keys. However, the planned multiple
> hierarchical scheduler support won't work with global static_keys as these
> branches would have to be based on the specific ops instance.
> 
> This patchset replaces static_key usages with tests on ops.flags and a
> bitmap tracking which operation is implemented. I couldn't see performance
> difference in numerous hackbench runs on a Ryzen 3990x machine before and
> after the patchset.
> 
> This patchset contains the following five patches:
> 
>  0001-sched_ext-Indentation-updates.patch
>  0002-sched_ext-Remove-scx_ops_enq_-static_keys.patch
>  0003-sched_ext-Remove-scx_ops_cpu_preempt-static_key.patch
>  0004-sched_ext-Remove-scx_ops_allow_queued_wakeup-static_.patch
>  0005-sched_ext-Make-scx_has_op-a-bitmap.patch

Applied to sched_ext/for-6.16.

Thanks.

-- 
tejun
