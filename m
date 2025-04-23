Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAE82CCC9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745404010; cv=none; b=CkfeOiLrhG2TyqT72skr4CtJOISAlUAJXNNcJ4yw5lESt6d4IkEZ9iux5C1y83SchDdYNqqbIsbahaAQaLkUy3bRmeeLj53yTuonSuleQmm4RaQw50Z0EIcWUG0Q71DNzJi9GjzNKK3Jgn+J+BXSOPeX+xvwkoLk6PgnZy+M4Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745404010; c=relaxed/simple;
	bh=ntTT//J2B8pcFKYLfru/QnidU17YFxtnzYOlBfMeaLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6lNiRsq88YViz5MVcam3GFktDcK5zUzLgRmLsPEDNjBqKAPZSoLlOLZWaOS3K0eGS9ssyhw48U62xaRgM/cKFho4lsG6J3zoObYy/orrB5Eh14J09qetQZVt/z2I8wHbYtgCUhR9TFPBQTPa0rsf2j8tTfbujlhA1fwUevzK7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIVL03PD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIVL03PD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F98C4CEE2;
	Wed, 23 Apr 2025 10:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745404010;
	bh=ntTT//J2B8pcFKYLfru/QnidU17YFxtnzYOlBfMeaLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PIVL03PD2Re97acHs7r+J1qgTccfAsRgtr4NedPLtOaZ/f1HiQDEy2ivUkf5/W740
	 zpJ8nWbPcOM9EjusEIH/33HvMFZe9R8DJNZPqqVDni5kzAbrPtzn+zcbqx8vI7cP1s
	 aqOUrfM+fEVPlG6FWKEQrsKsyZItUu/n98ezZzEs1rvDxuupkV6rqCskMzNDkYQxc8
	 pF33v8M6enghp4WsJFK14grgzWNXGzYnV1oFAzi4Gx7VT9CgswbxndCRgGlJaA4Llx
	 RiGs6U+wj67GFRASuFwN8yZuvj1gKgGxaeWypYHql5hCJqcYz2Gy9LLDlBs6g6LWRO
	 wbPUGKYmSl+WA==
Date: Wed, 23 Apr 2025 12:26:44 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
Message-ID: <aAjAZH7m96oz4ohC@pollux>
References: <aAd54jUwBwgc-_g2@cassiopeiae>
 <d3c0f721-2d19-4a1c-a086-33e8d6bd7be6@igalia.com>
 <aAeMVtdkrAoMrmVk@cassiopeiae>
 <52574769-2120-41a1-b5dc-50a42da5dca6@igalia.com>
 <aAeiwZ2j2PhEwhVh@cassiopeiae>
 <f0ae2d411c21e799491244fe49880a4acca32918.camel@mailbox.org>
 <aAetRm3Sbp9vzamg@cassiopeiae>
 <88f892f9-e99a-4813-830f-b3d30496ba3c@igalia.com>
 <aAipUTTQuv9MXoTA@pollux>
 <893b1d5e-7940-4abb-97bb-57f9ee2916cc@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <893b1d5e-7940-4abb-97bb-57f9ee2916cc@igalia.com>

On Wed, Apr 23, 2025 at 11:10:51AM +0100, Tvrtko Ursulin wrote:
> 
> On 23/04/2025 09:48, Danilo Krummrich wrote:
> > On Wed, Apr 23, 2025 at 08:34:08AM +0100, Tvrtko Ursulin wrote:
> > > 
> > > IMO it is better to leave it. Regardless of whether it was added because
> > > some driver is actually operating like that, it does describe a _currently_
> > > workable option to avoid memory leaks. Once a better method is there, ie.
> > > FIXME is addressed, then it can be removed or replaced.
> > 
> > I'm not willing to sign off on encouraging drivers to rely on scheduler
> > internals -- also not in this case, sorry.
> > 
> > Our primary goal with the scheduler is to *remove* such broken contracts where
> > drivers rely on scheduler internal implementation details, mess with scheduler
> > internal data structures etc. This is clearly a step back.
> > 
> > And AFAICT, as by now drivers either do a) or simply nothing (with the exception
> > of the mock scheduler). Drivers can do a) in the meantime, there's no reason at
> > all to additionally offer b).
> 
> What mechanism do we currently have to enable using a), and which you would
> not consider needing knowledge of scheduler internals?

The rule is that drivers must not call drm_sched_fini() before all jobs are
processed.

For this, drivers may reference count their scheduler "subclass" for each job
in flight and only call drm_sched_fini() once the reference count becomes zero,
or keep their own list of jobs in flight and just wait for the list to become
empty.

This is possible with the regular API and none of this requires relying on
scheduler internals or messing with scheduler internal data structures.

The problem is limited to the aspect that the GPU scheduler does not provide an
API for drivers to solve this problem.
