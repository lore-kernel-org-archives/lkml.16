Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95A6235340
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859664; cv=none; b=Ao+uWylDUHj9JZV6Q25xRf7uB0f3cUgoREJVo6pU2PA7NxVtTJDM8YJDFkgAA8V3+3tRT3D+stCz38bldSRxcN2ZRdIug0oP/c1l6/dURnXfeeAz+fc6CdCmnZtYP0za3rrOWsA6Pd1ApPSdWiP6bTwHxUYkxUWLDILKWHE41vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859664; c=relaxed/simple;
	bh=gNVuFESDEsx3ltuvvw5fhegFwKFfAykjObJkZ2QsS18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVB4hutXOtHCXP7Xr8bFT8R/Pn04sPP+P/TMQE0297993amkD7JSHkc8naU4vcs1OcTz5cDVPJj6rmw+bwNmWFM2sznhIYRYGhxO/SYWULfTq1wHOCGAElTMPoECGm4qzWh7NYj2jMRqNtrhZpTBS71Y3d5wEM3mXnG0P6cGMno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=em3WvrkB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="em3WvrkB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47349C4CEDD;
	Thu,  6 Feb 2025 16:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738859663;
	bh=gNVuFESDEsx3ltuvvw5fhegFwKFfAykjObJkZ2QsS18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=em3WvrkBUjJRK/pqfEvx5yzkUqnkLHC87K/u4r7ieE+HzNuMbIKOO/PvkghppbJRk
	 FboLV2S/jVIt8ON/QMcHuYXMnjMgxEv7BJcN1ok/CadJTQFp409YeBJ15XImmyAYxI
	 gC+CnwYctOx/EB5tW9B0Um2nrsrEkdxb7VFp/Ehh9RdTgbbRoZlERb5ikheb4asUyZ
	 ddBz4pjyAmjmfeuBtY7Q1YoA81yquq9Q8fZe9h7bXoA6rUtJY1em8zbhIiC+QnSPs8
	 ydugxqfJ7RQlXdlPeeo9JOaZoZLNB0nSMEnLI7mGyvzQqtc/6+nOzy/4pAXmkSEsN6
	 DScVSFRTHKwOg==
Date: Thu, 6 Feb 2025 06:34:22 -1000
From: Tejun Heo <tj@kernel.org>
To: imran.f.khan@oracle.com
Cc: jiangshanlai@gmail.com, haakon.bugge@oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] workqueue: introduce
 queue_delayed_work_on_offline_safe
Message-ID: <Z6TkjhgSgzzTnm4t@slm.duckdns.org>
References: <20250204113635.298634-1-imran.f.khan@oracle.com>
 <Z6Jn5wOcFKpSGFW4@slm.duckdns.org>
 <c842fb2d-47e9-4b20-a5db-f55730b2c093@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c842fb2d-47e9-4b20-a5db-f55730b2c093@oracle.com>

On Wed, Feb 05, 2025 at 11:54:20AM +1100, imran.f.khan@oracle.com wrote:
...
> The problem is for the cases where a CPU is already offline or in the
> middle of being offlined and past timers_dead_cpu callback. In such a
> scenario if someone puts a delayed work on this CPU, we have problem. 
> The WARN_ON_ONCE in [1] can indicate  this but the dwork's timer would
> still end up on the offlined cpu and will not be migrated (since CPU was
> past timer_dead state , when dwork was queued).
> 
> One way to avoid this is that we ask callers to do the needful (hotplug lock,
> hotplug callbacks) and ensure dwork does not end up on such offlined CPU.
> The other way (as attempted in this patch) would be to give such users an
> interface, that can ensure that  dwork never ends on on offlined CPU.

I don't think introducing a new interface makes sense here. Either the WARN
is enough or we can follow what queue_work_on() does and ensure that the
delayed work item gets executed *somewhere*.

Thanks.

-- 
tejun
