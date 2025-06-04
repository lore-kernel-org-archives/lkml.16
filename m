Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3798418E1F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056029; cv=none; b=NyZvk8P1cDg2V1ndifikeRbum4EcE4MzbE1aL+i8uX5d2EEGU8AU4Ffw2up0c4XP13kmKyh2iCtjqwhejmrJah31KIuhYnPRQu//k21iBwV59xBFJsqLRRYgfc12oonji6nyv4tsNC7uhlhI+qjvhqRuaNSd0AKwHnDQIoZATJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056029; c=relaxed/simple;
	bh=hhaoHECGZqzEpU9MTiy2t7cqLq5LWg93CmxEmAbN2pM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUACOlnR5Xl1xx9NyGsNazNnpBrmhIfo5Q/C8fz8yo2OJHU3WfrF9B1fcK0y9lhooiO2j8JH0okR3yoAM7I7Ww9z8T3PHWAAqjyN3rT6hUoDbuzfqUEM7X8xxWMQv8qeLYeRD4caTqyfsGezXSa7RrUP+CenE0NNuxU6BHK3bbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXT6NWtA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXT6NWtA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F77C4CEE4;
	Wed,  4 Jun 2025 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749056028;
	bh=hhaoHECGZqzEpU9MTiy2t7cqLq5LWg93CmxEmAbN2pM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WXT6NWtAmVdO6YCKYmBq1oxfVRkO/uSH6SnVzBZ9qhEGoHV3lrl4Jx8S+qcptwIK+
	 Jur1H7p5sTLycJzMoZkbRM6r91ygI3u/LdNCS+r7jOOZFKrVF2iX8OADTmL7YRXbqI
	 RBYvJtHKr2U7FrsWXRo7ajPyntQ0ic276AXO2okaHqaufPnVMpuVNuT90qqJyH14eF
	 uWxGA259OB44qflNK5oQnKvnd1AR2vnoGaXmK4FAQEgAMbC/KupBpbMCGzNl2qQVfc
	 dn0OII6WNP5UCHsQJU2kTp/IOQCG0R52C8VCfGA4d+JvOSKm7gBnogf8CfuUwqhARt
	 5j4NlWpwaoqFg==
Date: Wed, 4 Jun 2025 18:53:44 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sched: Discourage usage of separate workqueues
Message-ID: <aEB6GOTlC_Z_Rq8b@cassiopeiae>
References: <20250604081657.124453-2-phasta@kernel.org>
 <7a09c357-2d28-4dd6-b637-4387cc430938@amd.com>
 <aEBhIzccXBPyt_58@phenom.ffwll.local>
 <aEB4DFFE2C7gElRL@lstrano-desk.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEB4DFFE2C7gElRL@lstrano-desk.jf.intel.com>

On Wed, Jun 04, 2025 at 09:45:00AM -0700, Matthew Brost wrote:
> On Wed, Jun 04, 2025 at 05:07:15PM +0200, Simona Vetter wrote:
> > We should definitely document this trick better though, I didn't find any
> > place where that was documented.
> 
> This is a good idea.

I think - and I also mentioned this a few times in the patch series that added
the workqueue support - we should also really document the pitfalls of this.

If the scheduler shares a workqueue with the driver, the driver needs to take
special care when submitting work that it's not possible to prevent run_job and
free_job work from running by doing this.

For instance, if it's a single threaded workqueue and the driver submits work
that allocates with GFP_KERNEL, this is a deadlock condition.

More generally, if the driver submits N work that, for instance allocates with
GFP_KERNEL, it's also a deadlock condition if N == max_active.
