Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C01254673;
	Tue, 22 Apr 2025 15:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745336549; cv=none; b=f3zNpItgERw5rdTHD4+QZ1VRT4HdCKiTwtsoQvzDSyA5M/vNxOF+FeQ577BNCbNVvJLtpOrbh96Nxcoj235sBRFx3M18M84PWTciQIJuUqN1L0EytpQdWzvkmmdeIuQSf+kOzStmxTc3ngMG4kS38b3IM0GZ1Pun6RgvLxi4qXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745336549; c=relaxed/simple;
	bh=UjmE7mMRVfetjzx8FX9GEDrQFOSFL9/M99AxaPe/WFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ObXPwh0MP5D7QpjVMYRbUyESo0r8ROK4wO+CWhbT77BwS8IGtp2kBNSpw8BZO6lmVEpKvcrJN0uyKD1vxPWPev7frZAOwpzVXkSKE2PCHDY2h5sHVzCnC0ThouhDKo+5U5KYIPGcsKwhcNp4rRIyMclJHIjZOwFT9pRgalZG3MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWfY4YTC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWfY4YTC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D7AC4CEE9;
	Tue, 22 Apr 2025 15:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745336548;
	bh=UjmE7mMRVfetjzx8FX9GEDrQFOSFL9/M99AxaPe/WFE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MWfY4YTCRapUqCdkB62dVPD6RevemNrraWnJYH65Xf7r+M38bYA8JIPmLHkCzOfmG
	 nid7XWERxxlCWW+V4CZ9JcXQhU34Ydy33/ccYqR0ypw1/WnVzBH7xIKCjCyMsBlIHu
	 xGLquvKZY89rnOg1ORTEByi87QdzFYaBh0zT+Zj8xBkpkgv0nDnZrREX3vd+41nQQO
	 xZ8MfZAC5V9Ryql6HBOo8NhIImhmLjqZxYhr7Epi3Qgi8pwMYJ2IIOCAsbtS1ncv09
	 FgKcFWNYm+qWL/qzwTrL9bOECh4VJtUEd4xHR2YxLbrr3B8LRmUEWpoEl2m5y2/EVz
	 Kw/BHraf9u++Q==
Message-ID: <7320995f-cd6d-4e65-b144-bd20151f9e5e@kernel.org>
Date: Tue, 22 Apr 2025 17:42:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] rust: alloc: split `Vec::set_len` into
 `Vec::{inc,dec}_len`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tamir Duberstein <tamird@gmail.com>,
 Andrew Ballance <andrewjballance@gmail.com>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com>
 <Z_-wlwaiJNsSZbCC@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <Z_-wlwaiJNsSZbCC@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 3:28 PM, Alice Ryhl wrote:
> On Mon, Apr 07, 2025 at 10:52:30AM -0400, Tamir Duberstein wrote:
>> This series is the product of a discussion[0] on the safety requirements
>> of `set_len`.
>>
>> Link: https://lore.kernel.org/all/20250315154436.65065-1-dakr@kernel.org/ [0]
>> Link: https://lore.kernel.org/all/20250316111644.154602-2-andrewjballance@gmail.com/ [1]
>> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> 
> I'm still wondering if the divergence from upstream alloc is worth it...
> but the code is okay.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Does this still apply to patch 1 in v4 [1]?

[1] 
https://lore.kernel.org/rust-for-linux/20250416-vec-set-len-v4-1-112b222604cd@gmail.com/
