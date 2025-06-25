Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C6F2BCF5B;
	Wed, 25 Jun 2025 17:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873165; cv=none; b=RcfHi138WRVm5Xw3FHZi2N1dbGXqC2nP20eN4ayr/YNVecReWKv/6kmB0l7D79l5xmYAUNIg4q4WUo+LM85pq+MEeS4GcrxYa8xmAqRdMy7zKFCUyY4cOHEVKAWzKR/y8kpY9iER/82xOUvrpAWp59rSzDalNI1GsZ9Ewj8BRvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873165; c=relaxed/simple;
	bh=CKN7jXDXNSdo0JPoRAElkX7s0qdgtsJUpELl83VbQOM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=j2LLx9wIKfHdg6IT7x9EtPlvB24Emlzv53tEmuQswLS+7cdNocxxSfsTc5GB0fytUIYX7iX2CDVNTNIbzb2RTvmGv4oM97vxkIPT/X+daWJVt3yJj8F2Nj+kYPVACuCCfoKLVOO6FUQ0VIoDbueWLWyny8Ia0hUEwb5aFr6cGQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=A7ARc/7c; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="A7ARc/7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1750872077;
	bh=CKN7jXDXNSdo0JPoRAElkX7s0qdgtsJUpELl83VbQOM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A7ARc/7cVihbcYi3L2nhTZBJa5JGYExfH9JovW4hj1UDk/lWRioFkPnsRoR1heZC0
	 /p1a4jK8Q4ryTns5zwES0BEegTS3VpQ+Sao094IWUdpw3wngYb6c+r23xdMP7OjAY2
	 ++Fry20RLTEr9ZgxeFe1Dmq4C/fNc4kfKF20eLo4=
Received: by gentwo.org (Postfix, from userid 1003)
	id 1BE7C40267; Wed, 25 Jun 2025 10:21:17 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 17CB040113;
	Wed, 25 Jun 2025 10:21:17 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:21:17 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Mitchell Levy <levymitchell0@gmail.com>
cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
    Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
    =?ISO-8859-15?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Andreas Hindborg <a.hindborg@kernel.org>, 
    Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
    Andrew Morton <akpm@linux-foundation.org>, Dennis Zhou <dennis@kernel.org>, 
    Tejun Heo <tj@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
    Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
    rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 4/5] rust: percpu: Add pin-hole optimizations for
 numerics
In-Reply-To: <20250624-rust-percpu-v1-4-9c59b07d2a9c@gmail.com>
Message-ID: <cd3a600c-a4ee-4034-f605-ad9bac5c7655@gentwo.org>
References: <20250624-rust-percpu-v1-0-9c59b07d2a9c@gmail.com> <20250624-rust-percpu-v1-4-9c59b07d2a9c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Jun 2025, Mitchell Levy wrote:

> The C implementations of `this_cpu_add`, `this_cpu_sub`, etc., are
> optimized to save an instruction by avoiding having to compute
> `this_cpu_ptr(&x)` for some per-CPU variable `x`. For example, rather
> than

Cool. Great progress for Rust support. Maybe we can switch the SLUB
allocator over or come up with SLRB for the Slab Rust allocator ;-)


> +        impl PerCpuNumeric<'_, $ty> {
> +            /// Adds `rhs` to the per-CPU variable.
> +            pub fn add(&mut self, rhs: $ty) {
> +                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
> +                // pointer relative to the `gs` segment register) by the invariants of PerCpu.
> +                unsafe {
> +                    asm!(
> +                        concat!("add gs:[{off}], {val}"),
> +                        off = in(reg) self.ptr.0 as *mut $ty,
> +                        val = in(reg_byte) rhs,

That looks arch specific to x86? What about ARM and other platforms?

