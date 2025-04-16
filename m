Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274EB224B1A;
	Wed, 16 Apr 2025 19:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744833435; cv=none; b=ZZEilNqqs87ikQ/IocMgnOpFEE9CgtyOnWGqTarF9iNrwjEGnhG61UXCx31Ew8i8LiKSzsg2h07DKI+56vYQ5hIroPQ7nj0ST/0JbaH1NzGgcGSsyQfkrHfvVps+M7+rMrm7Bwwupu7wNGBOXo/xTAtY5wDMBcp0StN2itJIpPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744833435; c=relaxed/simple;
	bh=Z3z60e9EMfpzK3ewYe4WJO0V5hgCfBQYc+mH4XR92/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r73kCs/ZSqyqnUMZMw5TwHTSxPr7NTTtZYIYj6EpN2mNkM6qqAb8B4dxnzUWV6J8D66Z2YCdiRfNH3RGG1JtduH1kQBTN6gIXrS11uikK/iOaFt6IAIEuwL5YYoUQcpsLo9US28g+pq2F4y1yCJ3lp/C/+TGt7lXjJBc5Xj+QOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+J2lix6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+J2lix6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D80CC4CEE2;
	Wed, 16 Apr 2025 19:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744833434;
	bh=Z3z60e9EMfpzK3ewYe4WJO0V5hgCfBQYc+mH4XR92/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O+J2lix64WH4jrUXMxmBV5Ks5TcVHJwlqkpcuEUn7oxi+QKHfX4YLdMNJy5xoQ+hG
	 WZy7J7hEm6pY45nGCVLuENi7INri6hToesxD0x9AoHV2BIG6gWz5/7BRMrFY4Q9HkH
	 zIHl/umoRg42AfESNsyUXp/5tY9s9c1Pag0mTRuofrzaG9snSfmT0vHYtq4L2KKe26
	 d4YJJpisSYNEZwhjQZYjN0/3+RI4L+c7NtSGfi6aLrLH5xlfWIhYx4caSxP4X1akmg
	 rAyTqIYALjT/wjH4O4idATyx7qWzmoDIr7mRjtX56qEXxL55h9byl3e4yq5v4yZhdw
	 OnEM/stgy0TLg==
Date: Wed, 16 Apr 2025 09:57:13 -1000
From: Tejun Heo <tj@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
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
Message-ID: <aAALmSjLyWqrcQ45@slm.duckdns.org>
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1QzTdV8mHJYdQ6@cassiopeiae>
 <Z_4gb8ZAlbfhobgW@google.com>
 <Z_45kDv_wAHIBNpI@cassiopeiae>
 <Z_-f7Bgjw35iXkui@google.com>
 <CAH5fLgiKxDpWg=dDsTJsrB6Kmkw32GZ9WPO-SrpWm4TZDxGVtg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLgiKxDpWg=dDsTJsrB6Kmkw32GZ9WPO-SrpWm4TZDxGVtg@mail.gmail.com>

Hello, Alice.

On Wed, Apr 16, 2025 at 09:41:21PM +0200, Alice Ryhl wrote:
...
> I thought about implementation approaches. The first thought that
> sprang to mind is add a list of all delayed work items, but now I
> think we can do better. We can have an atomic counter tracking the
> number of delayed work items, and have destroy_workqueue() do this:
> 
> retry:
> drain_workqueue(wq);
> if (has_delayed_work_items(wq)) {
>     wait_for_delayed_to_be_scheduled(wq);
>     goto retry;
> }
> 
> where wait_for_delayed_to_be_scheduled() either waits for the counter
> to hit zero, or waits for at least waits for one of them to be
> scheduled. For example, maybe wait_for_delayed_to_be_scheduled() could
> add a dummy work item *without* waking up the worker threads, and then
> wait for that work item to get executed, which would effectively mean
> that it sleeps until something else wakes up a worker.

I suppose that can work too but the delays can be pretty long, so while
correct, I'm not sure it'd be very pleasant to use. If we per-cpu lists, I
don't think the overhead would be all that noticeable, so may as well do
that?

Thanks.

-- 
tejun
