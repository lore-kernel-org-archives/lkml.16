Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E49F2749D5;
	Tue, 15 Apr 2025 10:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714134; cv=none; b=X5kMm/LudIvb42XCnGAjzyzQ3o4OcAy1zmFk/sz5kGygef3Cjqf5rENxAtID+CvA4IC9edZ3c+7GF50ycxfsx3ctnZFW3qV9BShUWMvKXPW4IahzoYhtJIen2S+ZgQBSNx+C5YPSebS+vZJxV1G9b83GeywDdP7ivQEFRXSVn9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714134; c=relaxed/simple;
	bh=N8sByQ+5iyPna0XPswyBM24sOwsZtpVZsMOmx4nx2Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QeG/0an2ViUqjfURdRpJzRKPqLuSRfebyNzA2ihsfLpWRl1W19u1nx8pDzEcRJB/VtMg6jL6376apcu6lkZR+GBK70HiLdjYR860LK3Nr8p2Yor1dlfJVnaIJh6edLYg2DckA5o5LrKVR9IabRjVhYFaDGtujyckMihsb5ulAeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g95mg/3g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g95mg/3g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C912C4CEDD;
	Tue, 15 Apr 2025 10:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744714134;
	bh=N8sByQ+5iyPna0XPswyBM24sOwsZtpVZsMOmx4nx2Tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g95mg/3gAHnytZDuToatmQzwuRXNCxFSHQMCJvrVGpIj0sXkGOnzAgbsf/HFP13Pd
	 t9CFxsOUmSt5E0kEPr9SIl0UVxFXE1469SDg+/qbtASlXhN6w8AhoBelfOV92EOk0Y
	 sRTTQM4AEVzMAy+3egUWtcIXJYLZ7RMXwGD606v0HvhJ05t5d0MlUd8LMVyvTucbKu
	 jHDItGSku44xAIyysRwmy7NKCHC3G4f3OVZ0P9G6Gurrpsr1PaI4G7Tv5+eYBP+5j5
	 7XquHtwaj4LJQ430JH8NYh1Z2G3epO97t1H777w9cVNFnCujbH0EtZxW/+Oy4nIJGD
	 QMvp9KWPsyZCg==
Date: Tue, 15 Apr 2025 12:48:48 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
Message-ID: <Z_45kDv_wAHIBNpI@cassiopeiae>
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1QzTdV8mHJYdQ6@cassiopeiae>
 <Z_4gb8ZAlbfhobgW@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_4gb8ZAlbfhobgW@google.com>

On Tue, Apr 15, 2025 at 09:01:35AM +0000, Alice Ryhl wrote:
> On Mon, Apr 14, 2025 at 08:15:41PM +0200, Danilo Krummrich wrote:
> > On Fri, Apr 11, 2025 at 03:34:24PM +0000, Alice Ryhl wrote:
> > > 
> > > +/// An owned kernel work queue.
> > 
> > I'd suggest to document that dropping an OwnedQueue will wait for pending work.
> > 
> > Additionally, given that you're about to implement delayed work as well, we
> > should also mention that destroy_workqueue() currently does not cover waiting
> > for delayed work *before* it is scheduled and hence may cause WARN() splats or
> > even UAF bugs.
> 
> Ah, that's a problem :(
> 
> Can we make destroy_workqueue() wait for delayed items too? And/or have
> a variant of it that does so? I'm not sure what is best to do here...

I think the problem is that the workq is not aware of all the timers in flight
and simply queues the work in the timer callback. See also [1].

I'm not sure there's an easy solution to that, without adding extra overhead,
such as keeping a list of timers in flight in the workqueue end. :(

[1] https://elixir.bootlin.com/linux/v6.13.7/source/kernel/workqueue.c#L2489
