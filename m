Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADCB2701B3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398103; cv=none; b=JORJh16GPjGlg89TRi+9DuzzMFwmL7xZ7ARxNvBaKcf8LtQLscrzOJ2EWF+1NVrsiHoJDqLK5Z6UnIJAHXRFbEk1owChvC18fkp7KH1HSqh7AJpxUgI3uDeyVd3254soOKKAVVnJ0Q1GUJ8vC8BFKWJyf8D62N+xUYZkAGW3ZNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398103; c=relaxed/simple;
	bh=lxI7uZm0J8wxK/ssb3AyiM5Vlyi6PpJgaX+mJgJT0qE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuUUmk72kaUQy9T0Id2Hsodj9R8HAPiqfqgUYklVSaRfVKFSwx167nnmKeCnsERj94jEYKd4Xh1d1w6zHWkfcI435G/HKKXiqfQbsWNXkvH4eZNeDKmmBbMDKBHb/J1M38nedwfGwYu8BK9RF4Trix2AEWkF4uUQQzGMgz0lRrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RuSTyi6A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RuSTyi6A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11ABC4CEE2;
	Wed, 23 Apr 2025 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745398102;
	bh=lxI7uZm0J8wxK/ssb3AyiM5Vlyi6PpJgaX+mJgJT0qE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RuSTyi6AYiIXpMn7HmgxqlWIEs1Rqk+Xl2bKtLvaQ1s/QEdTz6EFB8lP41hGw008h
	 4RdP3hLk1SqU3T0NUDDd2Cp7H/wM8wkcXISxdMfO4KxZlOXQyCKpLK0GYPVEKqfwot
	 M1dol5r/n8I425eDRzDlceRWZjAkoVxGfg9OxYNxdFDrZYLr91o5En0NsgurQUoa/H
	 NxYTX40WhG0DP1CAz3VfvhKNXzLZ8ewNKwd3MCF3ib78BQ4za/CJu6jvv6gov6Umqp
	 ZUu3MaYv+ONa9GvLBKe+scEeYGYVvyOIDLw3wF6aYh5y4sE0zak+/Y/7A20tIwfrIn
	 ye5xmXT556K1w==
Date: Wed, 23 Apr 2025 10:48:17 +0200
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
Message-ID: <aAipUTTQuv9MXoTA@pollux>
References: <0bfa746ca37de1813db22e518ffb259648d29e02.camel@mailbox.org>
 <5a5d4a33-2f7b-46e4-8707-7445ac3de376@igalia.com>
 <aAd54jUwBwgc-_g2@cassiopeiae>
 <d3c0f721-2d19-4a1c-a086-33e8d6bd7be6@igalia.com>
 <aAeMVtdkrAoMrmVk@cassiopeiae>
 <52574769-2120-41a1-b5dc-50a42da5dca6@igalia.com>
 <aAeiwZ2j2PhEwhVh@cassiopeiae>
 <f0ae2d411c21e799491244fe49880a4acca32918.camel@mailbox.org>
 <aAetRm3Sbp9vzamg@cassiopeiae>
 <88f892f9-e99a-4813-830f-b3d30496ba3c@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88f892f9-e99a-4813-830f-b3d30496ba3c@igalia.com>

On Wed, Apr 23, 2025 at 08:34:08AM +0100, Tvrtko Ursulin wrote:
> 
> IMO it is better to leave it. Regardless of whether it was added because
> some driver is actually operating like that, it does describe a _currently_
> workable option to avoid memory leaks. Once a better method is there, ie.
> FIXME is addressed, then it can be removed or replaced.

I'm not willing to sign off on encouraging drivers to rely on scheduler
internals -- also not in this case, sorry.

Our primary goal with the scheduler is to *remove* such broken contracts where
drivers rely on scheduler internal implementation details, mess with scheduler
internal data structures etc. This is clearly a step back.

And AFAICT, as by now drivers either do a) or simply nothing (with the exception
of the mock scheduler). Drivers can do a) in the meantime, there's no reason at
all to additionally offer b).
