Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B289190679;
	Sun, 22 Jun 2025 21:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750626315; cv=none; b=drtWhm3LrQ7OtG38aC/tFyHG9/+jOwAgqWInaDMkuyH1aLPmrVOEWvwDUawu282l6Ke130j/iHT0xsfmpoe1Xe0JXtGBefJX6+vnr2Jl4zgZjnkvg5tVIX65uxxQTeYhjJFYH7ko3OJkpmD9oIgHrwEKkyC/ApvOI1ftKwyLULc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750626315; c=relaxed/simple;
	bh=qUJ8906YdxIrcjtqFEQT3f/Z4j0y/07bm4JHeUaAWJk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RXRXHeLH35BvP0nOnPlrK3WDCcVHdG2jq6B82SJupjh8D1qceWpoGuAHdsECH26W/yjRegeaJS5xX+9auq+M8ZEr+pKqTZSMPc93uD6yu3SJ4dQ3gYmJud2ydZ39gF1nxlbtv/8inmzCuTUHb5NnMj6Fxris13ysa+vSy0eObHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+/HmUPZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+/HmUPZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC93C4CEE3;
	Sun, 22 Jun 2025 21:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750626314;
	bh=qUJ8906YdxIrcjtqFEQT3f/Z4j0y/07bm4JHeUaAWJk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=s+/HmUPZTSDdlPB8lbJZn9udrvNMhoZ3fkyu8wcc1ect07oOw5GZ9G6F6FeD7WwuQ
	 lxrJFfvcx8n3X0HyB9s7LrAuzDblfaSK+MYuQ1uHq9w/+XNXNfbP/nfhtqa4sk5kx6
	 Wb7bpKJu53utB2yf9Zvdq0dY3DS0Aj3f1QHBNQ0D4kONHtgNOOvgxRXBZzXwHlAir2
	 meYplvJsQd8o2jLJM+4G0NBe++UgpNwvnZ2PVD5wo4wXJhRrvIKUXI5BCWqp6Yl3pK
	 fB4D6yTKTIjH3kJ6+UumshmU7pII/O9b11mzat0UCau6xLeklps2H4kzhoCOml07/H
	 t/mb9ImG9vVXA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 23:05:09 +0200
Message-Id: <DATD8G28N47E.HWFYVQ7MRX8P@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] rust: implement `kernel::sync::Refcount`
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Will Deacon" <will@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Mark Rutland"
 <mark.rutland@arm.com>, "Tamir Duberstein" <tamird@gmail.com>, "Ingo
 Molnar" <mingo@kernel.org>, "Mitchell Levy" <levymitchell0@gmail.com>,
 "Lyude Paul" <lyude@redhat.com>, "Wedson Almeida Filho"
 <wedsonaf@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250622125802.3224264-1-gary@kernel.org>
 <20250622125802.3224264-2-gary@kernel.org>
In-Reply-To: <20250622125802.3224264-2-gary@kernel.org>

On Sun Jun 22, 2025 at 2:57 PM CEST, Gary Guo wrote:
> +impl Refcount {
> +    /// Construct a new [`Refcount`] from an initial value.
> +    #[inline]
> +    pub fn new(value: i32) -> Self {

Should we really allow users to set a negative value from the get-go?
Here a `u31` might come in real handy...

> +        // SAFETY: There are no safety requirements for this FFI call.
> +        Self(Opaque::new(unsafe { bindings::REFCOUNT_INIT(value) }))
> +    }
> +
> +    #[inline]
> +    fn as_ptr(&self) -> *mut bindings::refcount_t {
> +        self.0.get()
> +    }
> +
> +    /// Set a refcount's value.
> +    #[inline]
> +    pub fn set(&self, value: i32) {

Same here. We should of course provide a `saturate` function, but I
don't see a reason to set it to another negative value.

---
Cheers,
Benno

> +        // SAFETY: `self.as_ptr()` is valid.
> +        unsafe { bindings::refcount_set(self.as_ptr(), value) }
> +    }
