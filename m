Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235FE1442F4
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 16:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749486555; cv=none; b=D+YR7iRryZm49NWrQAhzrfVI8sTQKAaUkxIRsjJ4ZLky730fQ6mChu44jTNTnXeZLfl7OTwY6lqgMRKUBtXzvDjw/YU2XEz2kM6sjdXE7RG/NXZhke6WHJ9vLjhNVQAdVQzWHN/vNnpDmmasDYUhuFhN+pDO8RuHng5BLOtfmAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749486555; c=relaxed/simple;
	bh=/WIK+Zu5FCGDxkkG1lsiJBU0oVY383XAcjU5SWOwYcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMHa9MNtEuoBoDM9nu6tGOQ6WJZddrGMpNIAG7nTBShM3FYIf2jleMGdF62XxUekct1YRSVnePQjMANNkehE5FpBhbQE6vM1Dbc5pqGXx/wb48idb7HeyNALD3oEISEQRFMQkxMqRoJYrhiu0MJbniqZI+thFgQ0U1PMnmvZkkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EF29yWKH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EF29yWKH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE83C4CEEB;
	Mon,  9 Jun 2025 16:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749486554;
	bh=/WIK+Zu5FCGDxkkG1lsiJBU0oVY383XAcjU5SWOwYcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EF29yWKH+jAhy1Po6wgH168ShjzMjameCB+oH1oOGd9v/b3FBDa5RuwyRhXa9bEAk
	 +diAh2VmtK+VEiXsq/Uhc+f4ndWsHxY/kc9IoBu3wTXuWKpLo+Ax153UgYWrdDd6TS
	 JVLWF4lV3UZS8qoOlodvMoptpLj5eEen/d3xfZLfaJF+VUNImnrooT9lmfwl2l50mn
	 PefXjAvyoPLtMRo0Bcn0cCl6cBj93ZGnzYyiPlewzhDHC+YWxXGPqU0eiY+JawHtO1
	 PMk2rN5UdhioxGYbvMrjGHpTBAen9ffLhDHrztRtsiKSw3E2v9lX3gedxml9vfjMqY
	 EAo+wbB5sCNEw==
Date: Mon, 9 Jun 2025 06:29:13 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Jonathan Corbet <corbet@lwn.net>, Emily Soto <emilys@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Documentation: Clarify time slice handling in
 task lifecycle
Message-ID: <aEcL2Z42Krv0EEYt@slm.duckdns.org>
References: <20250609162342.18790-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609162342.18790-1-arighi@nvidia.com>

On Mon, Jun 09, 2025 at 06:23:42PM +0200, Andrea Righi wrote:
> It is not always obvious how a task's time slice can be refilled, either
> explicitly from ops.dispatch() or automatically by the sched_ext core,
> to skip subsequent ops.enqueue() and ops.dispatch() calls. This
> typically happens when the task is the only one running on a CPU.
> 
> To make this behavior easier to understand, update the task lifecycle
> diagram to explicitly document how time slice handling works in such
> cases.
> 
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

Applied to sched_ext/for-6.17.

Thanks.

-- 
tejun
