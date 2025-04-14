Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F261A317A;
	Mon, 14 Apr 2025 18:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744654548; cv=none; b=MVBFIBY4OqL6oRF/ErbSLzKQOYVNfFoicIHN7O0/kxywlqx21Pt7z1sTFKeZm3iUTH6aUYgIXCAEbcBwS62ZJjgPHK7toFbsvFoqXwY2fOJAsijloTRkmGPRUmuhR3ZBFjcUt+8xnO5mxSQNF7DqHBfDtpbGRURsB+DxKqOYIrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744654548; c=relaxed/simple;
	bh=sTIZFHQ8cwk5U54rJCA9J1tk6XzV+o5T1Gix++ZMau0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWpMyM7xfPD1rCIZY772PbDm8nQ85IbwOe6jlcRfKNBRhGhzaw2jHLK8Ft2mSU2ppHm2KvV5eVah7ygIUWp+IYuPFpAno1WsXyK4Soo+p0G0SpI+56z5fLFPIAzxcplXFXY5G7GhppTf2bZcVIUfDcXgDl8M/RTrgsmw7aDMagg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7Y+mFLj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7Y+mFLj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7764EC4CEE2;
	Mon, 14 Apr 2025 18:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744654547;
	bh=sTIZFHQ8cwk5U54rJCA9J1tk6XzV+o5T1Gix++ZMau0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n7Y+mFLjlqIAKApI9YiWmC+CdqN2UQFLOuVeR6KDU47hC6Hm/F6pLn5BbfSY0TqCO
	 mjucJ7hLnSsUuc7hmw/5eB614XaVXM1p2p/KafkGT67qVVlAURl7YFNtevqZtc3Qlp
	 TAuJjc9Z0qcy1aQzpLjxHirLNXi+UKo0KM41Ny50VNwsUZk9hZ/Z6vVoXBtY2rgU6+
	 ZM2q6xVeW5aKsde3F/iqQPW8QsnhUTGCqtKlDzK1IX9XuIAWi15ECf6LeIhlqDsW64
	 exPCf8cP3VI+VMrphNnYgdTlaSxV3BAbB/FtNtc5Sx56AQsxd6ZnCps6dK97Dd1mLf
	 PSZo0oO9MrrSQ==
Date: Mon, 14 Apr 2025 20:15:41 +0200
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
Message-ID: <Z_1QzTdV8mHJYdQ6@cassiopeiae>
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>

On Fri, Apr 11, 2025 at 03:34:24PM +0000, Alice Ryhl wrote:
> 
> +/// An owned kernel work queue.

I'd suggest to document that dropping an OwnedQueue will wait for pending work.

Additionally, given that you're about to implement delayed work as well, we
should also mention that destroy_workqueue() currently does not cover waiting
for delayed work *before* it is scheduled and hence may cause WARN() splats or
even UAF bugs.

> +///
> +/// # Invariants
> +///
> +/// `queue` points at a valid workqueue that is owned by this `OwnedQueue`.
> +pub struct OwnedQueue {
> +    queue: NonNull<Queue>,
> +}
