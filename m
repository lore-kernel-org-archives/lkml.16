Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A60C274B39;
	Tue, 24 Jun 2025 15:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750779358; cv=none; b=rJFTiVr+C4qGnidB1q7YH7EgkuIRw7XklX1ClKSPfyVGQYHX1XCbToPkzRxPKvyA0XE/LrggY4gSl9mgpeeiolE/hBf5I9yDB+TACM8pqBFBCy1pv0LcSrAOoD78/x+KQ9Nn6DMz92JMrtgnTnAOqPuxhhaiH73DVbJsbRGXoVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750779358; c=relaxed/simple;
	bh=DRqR9Ha0k6DhcalVMjKRWy3O1Lm+9xUHZDW7jOei0Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u8h5bXaMQt6ydrbJD+gEgRd8DKGPcqOvFEfuP6gtv8McRuI+U9EHG6P8+B60WmM/hTEb6h3NS7974AGuLmLnrbvZ6UjWfDz6U+8y8UPuYiGYyyldQ/WdDE9L+fJYJd99sM87ruTA2E4LZbtE9jixRYllAWmACAXRe4HQNMn8kxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofeVI+uj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofeVI+uj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2217C4CEE3;
	Tue, 24 Jun 2025 15:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750779357;
	bh=DRqR9Ha0k6DhcalVMjKRWy3O1Lm+9xUHZDW7jOei0Fo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ofeVI+uj2dSV/VDxHIE7DmfHk6a3Vn6RVzy/r4ULxwKxonRlyO3NmJCxyFD6c6Zmx
	 SyqIL4swhkECFnBB95XAG9vzTnXKucT0gsBr4nnvEvdAl0dtSfQKNfAnGP2JcbEvOF
	 texjyI5j7AWhj6/OZFvmLkufc7T4Am8Qw1VtyrgBYRNYOsL6rYX+7asBaA+H30lMUT
	 PopeCbtGCfvA5FVgoOsH4/dm3Kb16riklga42G6svKkbsidGUwJYqIWbgJaMjw3ZMY
	 s7ooUrPiI/yrL90yRbLosWJg1WYBYOQa6mOPKg23qXsMuLvZ03h38vDy04UfDAlPeY
	 XunsuQR1DiNig==
Message-ID: <9ccd25dc-d642-4fcd-8dbb-ae221fa97556@kernel.org>
Date: Tue, 24 Jun 2025 17:35:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add Opaque::cast_from
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/25 5:27 PM, Alice Ryhl wrote:
> Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
> `container_of!`") we have enforced that the field pointer passed to
> container_of! must match the declared field. This caused mismatches when
> using a pointer to bindings::x for fields of type Opaque<bindings::x>.
> 
> This situation encourages the user to simply pass field.cast() to the
> container_of! macro, but this is not great because you might
> accidentally pass a *mut bindings::y when the field type is
> Opaque<bindings::x>, which would be wrong.
> 
> To help catch this kind of mistake, add a new Opaque::cast_from that
> wraps a raw pointer in Opaque without changing the inner type. Also
> rename raw_get() to cast_into() for naming consistency.

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
