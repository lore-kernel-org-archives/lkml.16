Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67825221D92
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745949764; cv=none; b=dXLRzbFz+xf8SyLA0+b0UXwWXq9RD6Hfi07g8jgTDeeUMWRMwWOndnkmJupmlwbplg9wOwATgaj3VL30Xdn6xLFlj6Rm8AqLD1Jc68e9F0E0YBNPtL9q05H7/1pjVNwFPa4x5kix7HNpb8yA08gqmZtZesI5Q/F2a8BRy3fIZUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745949764; c=relaxed/simple;
	bh=PnC/Km0GfczvzhC2q/R9Mk2poTy+phNIBsTR7CD7W+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6zyftzAJ9m5RpjSvJKl4xwcHGmraRlv/nwct6dfHwtJqH05yfIocd+iagTyW1Z9cFovvwNO7R9VJ/z0URkBgaEHoSORXrm7pKPvzaqkX1pUVgGExfP0VZOQCzrW9gwupoNiSBa29dZq4qKuZTJvMAJZWmXkXvXXzGJ2tH8xEmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clzY15Xy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clzY15Xy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1225CC4CEE3;
	Tue, 29 Apr 2025 18:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745949764;
	bh=PnC/Km0GfczvzhC2q/R9Mk2poTy+phNIBsTR7CD7W+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=clzY15XyGGwIzh0WLfkMpFoZN2i9019W7bBU9WPZMhx79oU6CobDgecBzz0y0TIb5
	 OUA2E2mgJa8tl0jWA+NV5bJ5udk9Bi5kjlazlZpTR032RN2k1FiKyqIyANRDx45Q11
	 9ZBq3MSBfjfAJs1MbPz6WHtv/hUFTpF0Alya+xij2fAO+yUY0rnRYqsEmYJoiz5zEV
	 nKRW2G8y62zwgMvKEYuHOh9Gwr3STyxaMaq/37+8Ze0jfttR04D7QNcOD4X/U/p5Zg
	 fE1J5SvPBgg0gUCCAHYW3bC5mU59Acaw24fBpJVw8WKRLeRsUy5mD2X/aSFPGaVcr0
	 RJD62lPicoNcA==
Date: Tue, 29 Apr 2025 08:02:43 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Fix rq lock state in hotplug ops
Message-ID: <aBEUQ5M1IhE5hElP@slm.duckdns.org>
References: <20250428214320.137576-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428214320.137576-1-arighi@nvidia.com>

On Mon, Apr 28, 2025 at 11:43:20PM +0200, Andrea Righi wrote:
> The ops.cpu_online() and ops.cpu_offline() callbacks incorrectly assume
> that the rq involved in the operation is locked, which is not the case
> during hotplug, triggering the following warning:
> 
>   WARNING: CPU: 1 PID: 20 at kernel/sched/sched.h:1504 handle_hotplug+0x280/0x340
> 
> Fix by not tracking the target rq as locked in the context of
> ops.cpu_online() and ops.cpu_offline().
> 
> Fixes: 18853ba782bef ("sched_ext: Track currently locked rq")
> Reported-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

Applied to sched_ext/for-6.15-fixes.

Thanks.

-- 
tejun
