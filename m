Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400AA29CE1;
	Fri, 11 Apr 2025 13:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377041; cv=none; b=LlvWrnz6lf6RaQcNQtcfSvvqvhg3OZ5PnHEV216nGx/Ge6lLyZzMgPzwIv65zttNpDi8Ux+/zeid0N2pr/eAmt2NfSaPy54kIvgJUpspZgmD8FALRyerHqOKlOpCET2O+2eeOt30BHNY954Dl7aq86Jii+G7Sk4W2kjjHT+ExP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377041; c=relaxed/simple;
	bh=DB4OyooWv2U0Drv2u+vexH72qbl8XchQ7K+SQOk+Vk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQVSGs0UVZlVOa6/jTXxQhSik3Bp8/LUTFroxFMTg2xbgzSAVaT2Tu0MhSxQ5Ods1RCQHRmISkHRqBDYO3b9wxwxGsFR9cFihH0Twjx8/jNLt15OSuKB8THjAQkID+hUQsMtrO+zQZV9kvxAp9o9vrF70QoRytYIdDJllXAwBGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M60hDIa5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M60hDIa5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C53C4CEE2;
	Fri, 11 Apr 2025 13:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744377040;
	bh=DB4OyooWv2U0Drv2u+vexH72qbl8XchQ7K+SQOk+Vk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M60hDIa5EUPHNA1l5RO883omURZWC4NxR7HUDAUikHRQfvsTzc/Dzfs+tXLQHucjq
	 H56rx4tpCXcQSZ+PmVYS4VgKXrBQSyXFIQ6QsF6mvQgTKDjF73hpKOoOGISofKx/fp
	 REeOfBW4WUhCfWmVUB77U5GZtjZT51BjpfIqF6iuO8rqX7wIKCDNx1zePrj+I7zB2k
	 1nRTAZBwtEpcOKjFOJ3O50/bWKS1/iT49cxTcJFAvMfDm5IVjHWFAkdIStMX3IYafE
	 iFfOs56vxVysRUXG/rvqiVcE8W7XexgBa/t7srwUU0GxMjDB4SqM56e6YJoOoT4oSm
	 IoF4a4X9C2JmA==
Date: Fri, 11 Apr 2025 15:10:35 +0200
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
Message-ID: <Z_kUyx8ytlac1d__@cassiopeiae>
References: <20250411-box_trait_objs-v2-1-c5f31b8db847@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411-box_trait_objs-v2-1-c5f31b8db847@nvidia.com>

On Fri, Apr 11, 2025 at 09:07:26PM +0900, Alexandre Courbot wrote:
> This enables the creation of trait objects backed by a Box, similarly to
> what can be done with the standard library.
> 
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

I assume you have a specific use-case in nova-core for this? For this cycle, can
you get away without having this in nova-core?
