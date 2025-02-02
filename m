Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B17B1F9EC1
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 17:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738518123; cv=none; b=QEV3Oe07MIVCHqP4S8cutvZSRQmqPqhOcPATSrV8XD/4/ReWMEP5VtWT2pEm2rP72agVfvPPMgWBkUHAwsEtNqDMfBwLvjNMOvrCwfnMSzGupVshwXlKmDjDy8NsByN//GMPVCg2287MuVBoxn3nrmvAVL8x74xrGdeoFM0v4Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738518123; c=relaxed/simple;
	bh=Uny68yKFSjDpqYfSoaWwX4HfoHaFwL4WdYbQye8Hp1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSvsVobVI9zaTWEPypjBT/oFphZptAde90Kq5PRbthmrooh9VGoRDdm5wSnO5wo2QcL0RkNuwvFL0IHxAKjd8SJ52SV7lE0VPk794RW1lpJg8AuHjJlWbv2jqHVH7CR6CmwwFLW5BK4ClT9wQBaIiJYmV8GKnsJPdlERDWUqtJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2WpJtvK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2WpJtvK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8A4C4CED1;
	Sun,  2 Feb 2025 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738518122;
	bh=Uny68yKFSjDpqYfSoaWwX4HfoHaFwL4WdYbQye8Hp1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D2WpJtvKnv3IDezuEbOvKokp4rUkah0n+bjRch79Qy1D1HpCnimkJ2+V2w5ht+edD
	 N2oe39FhukW8mu5ZX52DaV5iWMmYM2mBpEjAY1/JeIy42PIJODKUst+vbuGJ6+g7VR
	 xbUjbpmhoL+BUBv/64H2cCplVirQ3n2u7XRszF+gSYNQGG98sMdBxlNSi4wLN/1nus
	 BIyjCuRr5DH/+9LguwY854bUd4Dd+agf86NQDvSEuusjF436vM+aYYZdGiPvP5NMeB
	 cW56vXXQASkmdAzwlDwyE4Z8tUYfG4KKD0Dbns32yJFemVDOMWS4SnZj+dFnlu0CyI
	 B96+EvGK69jCg==
Date: Sun, 2 Feb 2025 07:42:01 -1000
From: Tejun Heo <tj@kernel.org>
To: Changwoo Min <changwoo@igalia.com>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Fix incorrect time delta calculation in
 time_delta()
Message-ID: <Z5-uaQu5t4mXxwNk@slm.duckdns.org>
References: <20250202033748.359169-1-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250202033748.359169-1-changwoo@igalia.com>

On Sun, Feb 02, 2025 at 12:37:48PM +0900, Changwoo Min wrote:
> When (s64)(after - before) > 0, the code returns the result of
> (s64)(after - before) > 0 while the intended result should be
> (s64)(after - before). That happens because the middle operand of
> the ternary operator was omitted incorrectly, returning the result of
> (s64)(after - before) > 0. Thus, add the middle operand
> -- (s64)(after - before) -- to return the correct time calculation.
> 
> Fixes: d07be814fc71 ("sched_ext: Add time helpers for BPF schedulers")
> Signed-off-by: Changwoo Min <changwoo@igalia.com>

Applied to sched_ext/for-6.14-fixes.

Thanks.

-- 
tejun
