Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209AE1CB501
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744138455; cv=none; b=XH9L6SEskN5BkbHNZfcyutvVCC4Qd53qKR6AmKIYvK5rqVD9T+V6DaCqcWZUdCClN7ray7y9bpFVZ9U8sEjyTtmGsdDrAueY1PARmDqVQIt9veGozsek6o+eBYRxr5Hi3R/jbo/8zItm58plhbR7JBUabwiU8AM5JEXVWl1DXqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744138455; c=relaxed/simple;
	bh=VmS/4ParMDF83Zncg5BQod7Q/xEIxRkbJD6MfHxGsAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZCNfCTE73IqS6W5gxNNL95LLzzhe2BqOWaVhOJc4fG1hGf8TYbBzT01kBAgGR8rIdSCf89Afqc1qaD4LI8l3+ApTQdZ2I1pEV1Wvo1AYRlJ1MTBmFrB8JvnPmxLaosKt1Ip/+etSrIfRS/7aCibD992Dg/PbPRHhZbK6vK8pp/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1ReKC1Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1ReKC1Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB66C4CEE8;
	Tue,  8 Apr 2025 18:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744138454;
	bh=VmS/4ParMDF83Zncg5BQod7Q/xEIxRkbJD6MfHxGsAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1ReKC1YMjqOoXKDfLoS/q7HiGXvyj5cp8M4GMWXWtMBvBvBgsUo+HFonPYQz0VKE
	 D91xuNjI520um8YYYqiKX7fO25TiByzOjzhUaeELjvlw4/CnGl0fEGhRa0T1Fe1r4s
	 wjAfnLOLAAiCpWuvOi5e9eFZiUfzGwfoU3IjJnd/AxfW4JYfB+Kkzc85Yld6rkywqc
	 wL1aJdddrW1B28Xznj54fssejap/nnhzBMXNZC/kFQdUmVU+v/HLnvndX38kfMAfHk
	 +lPgNOmW7iJ6k9y3h4RjOUkuUKtG8shnnXKHN486WsK/87Pmrohl2gzYoAzq81FpQS
	 eEZjKSFfCv6vw==
Date: Tue, 8 Apr 2025 08:54:13 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 sched_ext/for-6.15-fixes] sched_ext: Mark
 SCX_OPS_HAS_CGROUP_WEIGHT for deprecation
Message-ID: <Z_Vw1cP0nofz6tsa@slm.duckdns.org>
References: <Z_RdpDkLCXm140RT@slm.duckdns.org>
 <Z_TXIe2fVpAt-CAg@gpd3>
 <Z_VnKbElcEWWg4CH@slm.duckdns.org>
 <Z_VrcMkl2w7EIPC0@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_VrcMkl2w7EIPC0@slm.duckdns.org>

On Tue, Apr 08, 2025 at 08:31:12AM -1000, Tejun Heo wrote:
> SCX_OPS_HAS_CGROUP_WEIGHT was only used to suppress the missing cgroup
> weight support warnings. Now that the warnings are removed, the flag doesn't
> do anything. Mark it for deprecation and remove its usage from scx_flatcg.
> 
> v2: Actually include the scx_flatcg update.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Suggested-by: Andrea Righi <arighi@nvidia.com>

Applied to sched_ext/for-6.15-fixes. Thanks.

-- 
tejun
