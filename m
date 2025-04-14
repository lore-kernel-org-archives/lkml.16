Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1384423D285;
	Mon, 14 Apr 2025 17:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744651424; cv=none; b=NvtF/ieF2vNZjZyVmKg7S6YxnfLFDVqAEX2Hn12OLXCxHj2bzQY9qjOek9cu0U5gKJcDRBnaaatrH6PpAc3j62xmjuBvgp4kiYpZTTKLLbehfv+++5S3krAZMFXC5ADeFXJEmEnnPKR6RV8zf6J7D1a2wyCfDPHtYY6B6hhKqoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744651424; c=relaxed/simple;
	bh=GPTmCec+ZNuZRCM/kaKGVD8ffsbiT/xRq/puE0O1Dm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C73SGBmCwR6NjiLjpaklcEpp/AivRp/zwxVVM2+iyRe5z+zapM723FNPSMsF2dlcZVKLrs3MdlwVDMazsChyliGPRuVTtQ1IBPKHtqcUKTLMIPN7qWQZM6VrIa0oeaekxk1ORUF/QRcEOckq0dIsQq7H528Ji/KLB8OyyU/grBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eK09fqo6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eK09fqo6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458C0C4CEE2;
	Mon, 14 Apr 2025 17:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744651423;
	bh=GPTmCec+ZNuZRCM/kaKGVD8ffsbiT/xRq/puE0O1Dm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eK09fqo6Tst8TjcXpz2D1a2TMRdcjSZcXkpRtG+qVGFTMUWiL1VRiUNzvuD4U+xX1
	 YbA3FRJRclAlPHccWt4t1GRhlPiNvBsiAKg6OUIzh663Vpoi6PP9zmeXhgR5ASOgg5
	 ei8iNwuUuJVbRH2KyQhz2mdzNbligi8n6lu2R8+ZJuiY80DsNcDxY7g/mw9SkZk2KZ
	 ofGzlgfWxYRf0Vv920pyYWYafLhgtYuiFkJjEmwkzyClZIn2MUJYRt8BPT7dEmI3jZ
	 /NfhN7mAeW2PSg8P8zMnvOXUMjFaFUbgFLuHihKjfrUBbwZDfxBShCL7/InTNfb1MZ
	 KThyK3y6SeMTg==
Date: Mon, 14 Apr 2025 07:23:42 -1000
From: Tejun Heo <tj@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
Message-ID: <Z_1EnkPiBKakGYtM@slm.duckdns.org>
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

Hello,

On Fri, Apr 11, 2025 at 03:34:24PM +0000, Alice Ryhl wrote:
> Creating workqueues is needed by various GPU drivers. Not only does it
> give you better control over execution, it also allows devices to ensure
> that all tasks have exited before the device is unbound (or similar) by
> running the workqueue destructor.
> 
> This patch is being developed in parallel with the new Owned type [1].
> The OwnedQueue struct becomes redundant once [1] lands; at that point it
> can be replaced with Owned<Queue>, and constructors can be moved to the
> Queue type.
> 
> A wrapper type WqFlags is provided for workqueue flags. Since we only
> provide the | operator for this wrapper type, this makes it impossible
> to pass internal workqueue flags to the workqueue constructor. It has
> the consequence that we need a separate constant for the no-flags case,
> as the constructor does not accept a literal 0. I named this constant
> "BOUND" to signify the opposite of UNBOUND.

Maybe name it NONE or DUMMY? Doesn't affect this patch but [UN]BOUND are a
bit confusing and as a part of the effort to reduce unnecessary usage of
cpu-bound workqueues, there's a plan to flip the default and use PERCPU for
the cpu-bound workqueues.

Thanks.

-- 
tejun
