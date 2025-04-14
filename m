Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA474274FD8;
	Mon, 14 Apr 2025 17:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652841; cv=none; b=ExLs2iLjlndzByt5su8ZT/xRoY1ontGn+Xua3OJelsXuBK8JqXWUaHTJDiK3eL92NuC8n1ev5aHcP276nEUsY1wunmwr1Ii9znVMYo0Cm+8rEZ+hp7xMuYaGklvZARX012u17H5mE3kZjldpBwL0HhN8cIoxwCLx/HmropsQ2Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652841; c=relaxed/simple;
	bh=n52F+k3/sJAswTnbsTZnWYDe6nfThXy3jd0ISfC88Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cS49kB7XXNaD/zpERDx0TyKwYUtnHijU16WZXViGXfsTCYo2WGqpTAcRbU4NJECQ6wr5Zwp0qeHsQr+HNgjxNoTW1qqSGs3lIP4d8sMe+7A5kXpZsfPduKgXaOXVGdYUeocuvv27j2q2xhibdJuc37p7n0IEdHSMMjmH1rYZ+cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9Kyrger; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9Kyrger"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFDFC4CEE2;
	Mon, 14 Apr 2025 17:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744652840;
	bh=n52F+k3/sJAswTnbsTZnWYDe6nfThXy3jd0ISfC88Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l9KyrgerRz6+gBiMIpCsSo1fLFiB3LvVA1NAP58tT/VKiJj3ZVIp0AzhilveQwBrU
	 8xyrEKfxiyFSV+KCY+xWlGM97DwZOHLCyriSUbHuECTgUJqzOXznVbbMkepKG9CDAF
	 RkIewoRm+ZQ3lVaOSumqmBiS/SonkriSOT4ey4akSjonH8VlZ4LcQwfunFzBWntqym
	 gyvrkrmDuKCG/seitQBA2bcW78sTkur7ozWpQpRldAqzsyyVCj/DfScRKA5shcoDbk
	 dMH15Bh1ovqdezJx1vgN05joCHhGqJ5jCKFTuG613f1A8Qzcaf4HzAJwiAfAhSpxjy
	 nVmrme4ipzwAw==
Date: Mon, 14 Apr 2025 07:47:19 -1000
From: Tejun Heo <tj@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: rust: add delayed work items
Message-ID: <Z_1KJ98k7WL5qWfS@slm.duckdns.org>
References: <20250411-workqueue-delay-v1-1-26b9427b1054@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411-workqueue-delay-v1-1-26b9427b1054@google.com>

On Fri, Apr 11, 2025 at 11:12:29AM +0000, Alice Ryhl wrote:
> This patch is being sent for use in the various Rust GPU drivers that
> are under development. It provides the additional feature of work items
> that are executed after a delay.
> 
> The design of the existing workqueue is rather extensible, as most of
> the logic is reused for delayed work items even though a different work
> item type is required. The new logic consists of:
> 
> * A new DelayedWork struct that wraps struct delayed_work.
> * A new impl_has_delayed_work! macro that provides adjusted versions of
>   the container_of logic, that is suitable with delayed work items.
> * A `enqueue_delayed` method that can enqueue a delayed work item.
> 
> This patch does *not* rely on the fact that `struct delayed_work`
> contains `struct work_struct` at offset zero. It will continue to work
> even if the layout is changed to hold the `work` field at a different
> offset.
> 
> Please see the example introduced at the top of the file for example
> usage of delayed work items.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

FWIW, looks fine to me on the first glance. Please let me know how you want
to route it. If you want it to be through the wq tree, please let me know
what to do about the dependencies (I just applied the "remove
HasWork::OFFSET" patch to wq/for-6.16 but don't have the other one).

Thanks.

-- 
tejun
