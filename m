Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A23A1E89C;
	Fri, 11 Apr 2025 14:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381372; cv=none; b=jfCE9NjRFQNNKJqmk5q+4JOOlRkziqQ7nI/8BokaLAOw/HozjZaGj2XAwXMLnjyV5zxc8M5X80IXgfWV5SzyPH0gjiwi+/cWal+DW1aGVUKaojZD9ix+0pedOlUW0ma3jqBwHlOm54B7Q4DxGvcH+n1qBe/wpmbJtXlZO2Q+1cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381372; c=relaxed/simple;
	bh=8T1NSpNTYOEUEkOy7euD+86xiKnkU6Yse89529ibSg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2r9xre2Tp0F+oyAmUI3Aw8C28fp9k+MdS58/MRbsON6MyPlIWsRyL+lKNLSJiJ9s2gLNTQ4t7k+tjg7x63eW+bhhHn20JqRrbBTBa0E3uuc2y3FUQsy6a0PM2KVrlwSwC9HXbm0x7UfiezgI3YMBSAtSwojBsrSc+wVwaXXvJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1plTs9U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1plTs9U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709DFC4CEE2;
	Fri, 11 Apr 2025 14:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744381371;
	bh=8T1NSpNTYOEUEkOy7euD+86xiKnkU6Yse89529ibSg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k1plTs9UFVR22p1gZdKbpKmUhelhMgA4lWgOqRSd28LecPd6hNkgE81F14863mzg/
	 A2Kl416Y3hubTwsM0zNPZmaEF49G1pNXW7HOEcGviBEeugkwh7D46m6Jl9Zp2UKtmX
	 Kl79MUv1dcgQHjAVg7yS9o6JSJTO/4s7wJN820sE8u3K3K/IpJ4F5sSkNuSUu0mFvO
	 rnv1Z0FDmbXWDY+fWxB2MCU7wwcGd/9IKnGIBoNo3ATKkWvK6SuUG4n6amjc1wTCjs
	 NN6VhJH/P4hqZFFnLj8Prow/6EF3EZTQ6MrNeBW1ERiahZXKXIWYebOgruhBgxGNBH
	 4GMaWzOv0fBBw==
Date: Fri, 11 Apr 2025 16:22:46 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: alloc: allow coercion from `Box<T>` to `Box<dyn
 U>` if T implements U
Message-ID: <Z_kltpjo9bn4ah-l@cassiopeiae>
References: <20250411-box_trait_objs-v2-1-c5f31b8db847@nvidia.com>
 <Z_kUyx8ytlac1d__@cassiopeiae>
 <D93UDYZH7A8F.1FG8EIW013NKJ@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D93UDYZH7A8F.1FG8EIW013NKJ@nvidia.com>

On Fri, Apr 11, 2025 at 10:26:23PM +0900, Alexandre Courbot wrote:
> On Fri Apr 11, 2025 at 10:10 PM JST, Danilo Krummrich wrote:
> > On Fri, Apr 11, 2025 at 09:07:26PM +0900, Alexandre Courbot wrote:
> >> This enables the creation of trait objects backed by a Box, similarly to
> >> what can be done with the standard library.
> >> 
> >> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >
> > I assume you have a specific use-case in nova-core for this? For this cycle, can
> > you get away without having this in nova-core?
> 
> That's correct, and our next nova-core iteration will likely depend on
> this to provide some basic HAL. If this cannot make it for this cycle, I
> guess I can always use Arc temporarily.

I'd prefer to take this through the alloc tree (for this cycle), but this also
means you can't use it until the next cycle in nova. I assume that's just a
minor inconvinience?
