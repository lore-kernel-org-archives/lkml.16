Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD45231CB0
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389240; cv=none; b=ABqORHSBWMoOQv4ce3mMNR1OF6KwuscIyixQG+VwvAGDkrzJGxBD7Mn2B1X2zlbe8/d4L15jY3PLXQUhlQvp4JgKpq0ruFsCRqwkFSWFxgB5nMrdTsPiL+1RRLWYsb+D4523z+O0n8te4two5rm8J5fb8bI7Mw4TMs8KS7Wf0Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389240; c=relaxed/simple;
	bh=0NmYmHQpmmTXAe2glYLIWi5M+RsPJTTf88j/HHzPGiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EI2+nr4sUaxyC0/zU+ofXJhABhlU+FxvHoA3f9Y5vCXvQDZdKEqcEdAxM0epGxXkab9pzAw84w+grHE0zCylv2WjFd/xcoSdc+hayvkcfr/VkIIPnzMTtRMfpx9mC92exDPoHEBuDEwSaBx7MHzS63NHR7ygRHUsH3BaACF9wtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcKZy4Gm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcKZy4Gm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC948C4CEEB;
	Fri, 16 May 2025 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747389239;
	bh=0NmYmHQpmmTXAe2glYLIWi5M+RsPJTTf88j/HHzPGiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QcKZy4Gmo2P63XWMThleIHYS7/cocfu3Q3YxBEdcqEkiHVs7DzZq0AO9jC6qHAnSh
	 4N1lYNti52dAHWiUQIfBi648Hzh6B2J1mxes1ZL958oQtR8jCWad/sCviatNTTqxUN
	 S2XsaZqU24xBfc5ZSRwamXONSglPBtNx7Tk8w6kISiNIPVzgt4juIFq4b8/P4veVNR
	 wsf+jcLB0hxLfjDwEqbalFsv4CaKKBOrFAvaJKxlT2ECoxW9JJHrwYsxvdzMExro+l
	 ONLVxFgh7CvP8ILynCoL+RBjZZTiBZR2My9quDDwWoxuC2I4Zu/cPYCGS3tKWmKG/E
	 CXbXHN+Y7tizA==
Date: Fri, 16 May 2025 11:53:54 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v2 2/6] drm/sched: Prevent teardown waitque from blocking
 too long
Message-ID: <aCcLMhS5kyD60PEX@pollux>
References: <20250424095535.26119-2-phasta@kernel.org>
 <20250424095535.26119-4-phasta@kernel.org>
 <1297389f-70f6-4813-8de8-1a0c4f92250a@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1297389f-70f6-4813-8de8-1a0c4f92250a@igalia.com>

On Fri, May 16, 2025 at 10:33:30AM +0100, Tvrtko Ursulin wrote:
> On 24/04/2025 10:55, Philipp Stanner wrote:
> > +	 * @kill_fence_context: kill the fence context belonging to this scheduler
> 
> Which fence context would that be? ;)

There's one one per ring and a scheduler instance represents a single ring. So,
what should be specified here?

> Also, "fence context" would be a new terminology in gpu_scheduler.h API
> level. You could call it ->sched_fini() or similar to signify at which point
> in the API it gets called and then the fact it takes sched as parameter
> would be natural.

The driver should tear down the fence context in this callback, not the while
scheduler. ->sched_fini() would hence be misleading.

> We also probably want some commentary on the topic of indefinite (or very
> long at least) blocking a thread exit / SIGINT/TERM/KILL time.

You mean in case the driver does implement the callback, but does *not* properly
tear down the fence context? So, you ask for describing potential consequences
of drivers having bugs in the implementation of the callback? Or something else?

> Is the idea to let drivers shoot themselves in the foot or what?

Please abstain from such rhetorical questions, that's not a good way of having
technical discussions.

- Danilo
