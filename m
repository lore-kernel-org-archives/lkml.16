Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437091DA634;
	Wed, 16 Apr 2025 21:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744840760; cv=none; b=FOEfEBDp7MseqAdnX0w8i46Lari5cApIQPxf0xt0MZj7CKpYhAP7v8v56AaSWwPlXIWijer4LxFMjwnXzabyVPiBUW4YKb0agEp8OOAorcKazLqiykVBNhjiJVxmwJp1NrWs5wLXEmRDa7ntvXl8j88cubIkV+BHD3oFCHPJ/1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744840760; c=relaxed/simple;
	bh=5Vn9a29xgSJ1Uvk2UvOFEKkCEa6/SHOtxguDtcVd0vY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pKhpZ3N9HSlnVHae3JVhpWPj1Nx9heq8tEQHKdWFctETiU1q6Em9LvNyUN4SrJP/1lEbilgySDXF03W+V/nzZjrCjoR2sV9kcfRu/wTybesZIWvyvldJr3tOus0Am2cu9FjexpyBLvj1uCP7TTyRNdefHO3HBNq5V6do5wZ3+9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=NKZm447N; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="NKZm447N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ud2bmrtxubhfrptd2tpzo7iyy4.protonmail; t=1744840749; x=1745099949;
	bh=5Vn9a29xgSJ1Uvk2UvOFEKkCEa6/SHOtxguDtcVd0vY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=NKZm447Nk4llnt1M9AGvNG6ZbYKF36xd+jR7IfzbXx6CmUsV5Fik2sW25mtGocrZN
	 ugKg1cQPLFq5vY/nV7xW6KfUK4O+0uLFcJARA3VY3hRfKhkCq5V8uwI37U+TejQiaJ
	 qfml5Ma/m7dHAdk8o/ZftGZWdJj60E5RN0pY0YYPFG5G7kBDAjJV4625sUQrMGquu1
	 pD94IuaJRNsNzsSjUfBSrsweloOUAC0seWT8nm0R4DUcRayNbwtSY6cQrEHUbskcsP
	 qdUVl7p6WOeAJwZuNUot40C+hnWK1kD55oKROJvaG6EugENSgvSBWs9ugyTDRZHjfE
	 XrolqoGgpL7nQ==
Date: Wed, 16 Apr 2025 21:58:59 +0000
To: Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rust: pin-init: examples: conditionally enable `feature(lint_reasons)`
Message-ID: <D98EF3MYE7MJ.2B088TMY4FJU2@proton.me>
In-Reply-To: <Z_4mLRn-piSzuuf6@google.com>
References: <20250414195928.129040-1-benno.lossin@proton.me> <20250414195928.129040-3-benno.lossin@proton.me> <Z_4mLRn-piSzuuf6@google.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 1d9d31a5a32d218b7ee8f2525cc0bbe57988830d
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue Apr 15, 2025 at 11:26 AM CEST, Alice Ryhl wrote:
> On Mon, Apr 14, 2025 at 08:00:20PM +0000, Benno Lossin wrote:
>> `lint_reasons` is unstable in Rust 1.80 and earlier, enable it
>> conditionally in the examples to allow compiling them with older
>> compilers.
>>=20
>> Link: https://github.com/Rust-for-Linux/pin-init/pull/33/commits/ec494fe=
686b0a97d5b59b5be5a42d3858038ea6a
>> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
>
> Why not just always use #![feature] together with -Astable_features like
> the kernel does?

I'd like to know when a feature becomes stable, since I don't keep track
of them like Miguel does.

---
Cheers,
Benno

