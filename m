Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF83285C9D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287798; cv=none; b=oyEm6dDq5R6cvcuYl4MJhJcb6aZT6K+Gw8NgUP0BAXjKSx+gmH7CoJ1FDbsSomYLEbk0WTcWvYQptIJDYqIwDX1cmr1tFDhydejw5wT5AtkaI7GtbWqy49wly0hpM9A2Z2zMWe+5tIpU+egtNH8i0NRfrgjOzgTPph/Bya1P8R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287798; c=relaxed/simple;
	bh=Z6T1jAb7F/sOa4Pcx+p6AtI4ROeujWx4zdFw1+uBdlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3+M/kCNKBuNCjdtJKvpWvQZZegEDUBn8hOBK++F/5Og8DlDdS4YZMERfNyXt3P9sEn5blhbfSEtZC5mkfysKx1RdqPcnNPNS2ZZFPXSLeA6t5ZYwp29wL5Ytvbbm52PsYi0Wx8uZuDxM2ugp5aD5bXQaw5jJARj+B566vKb9x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omgPWYez; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omgPWYez"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF670C4CEE3;
	Mon, 30 Jun 2025 12:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751287798;
	bh=Z6T1jAb7F/sOa4Pcx+p6AtI4ROeujWx4zdFw1+uBdlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=omgPWYezV1EF4qlGGewBzCYEEobJAAHwaZV4STrVhv411YETYtgjzbcpIhHgeI7lO
	 A1Acz92apTURSm8dN0elKOE/XeoX2I7zmNrBgTh+ombWqbOyFsr5f1WqEYtMgDKL/x
	 kgTsMFMVZPMHhENljMLXyg3zFyx48aukru7o9kbi7dLF/STdTggNY14o1CS2ig6HiT
	 NzzNe37got/lugnnKvg76eFPisAC3jtEDDsiks3HjJXNhJA27VtGsQyYPXZ1mUQspH
	 PRGMjl6zqeneWhIUQUdXMO+UCIcei01ele6hQ1+U1XrnNXcbrNAqJyY+PQ3wPb4cm+
	 TyCp/ajuq/thg==
Date: Mon, 30 Jun 2025 14:49:52 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sched/tests: Make timedout_job callback a better
 role model
Message-ID: <aGKH8HUtiqID1mbe@pollux>
References: <20250605134154.191764-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605134154.191764-2-phasta@kernel.org>

On Thu, Jun 05, 2025 at 03:41:55PM +0200, Philipp Stanner wrote:
> Since the drm_mock_scheduler does not have real users in userspace, nor
> does it have real hardware or firmware rings, it's not necessary to
> signal timedout fences nor free jobs - from a functional standpoint.
> 
> The unit tests, however, serve as a reference implementation and a first
> example for new scheduler users. Therefore, they should approximate the
> canonical usage as much as possible.
> 
> Make sure timed out hardware fences get signaled with the appropriate
> error code.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Given the discussion on this patch we agree that, unit test should remain to be
unit tests, but at the same time (as far as possible) represent the intended
usage of the scheduler's APIs.

Given that, "reference implementation" might be slightly overstated and we
should just say something along the lines of "make them represent the intended
usage of the scheduler's APIs".

Also, since this patch is a prerequisite of your teardown series, please mention
that in the commit message.

With that:

	Acked-by: Danilo Krummrich <dakr@kernel.org>

Fine for me if you fix up those two nits when applying the patch.

- Danilo
