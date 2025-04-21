Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51FC1EE03C;
	Mon, 21 Apr 2025 19:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745263539; cv=none; b=j0CWMF8aD95parsOGt1h4p5eIhWfeb/k0XO50an19XXklu8iN6wynaCvNMKeaqevosQzjA+gejMKOAX2vH0a5gP5mo22H7vlf5fvgDH8/3KJegOHaagINrq+U0V3UbMpbcIb8fzIdezSiSZFayEHC1LyzlzMTimORcDxVLH8F5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745263539; c=relaxed/simple;
	bh=PmFXp/1pIENAsC50OkNNaGrcSNdWHyXTpcpcmEFFedE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MFkazP0zmikqEu1yYh9M/DmpfE+SOO2fAB85yFYx/xEU+pIP6Kw1d8PlPd/2hzVQXw/h/KBB6g+bWc7jOsl2gGRPl1JP8/ouiD13/gLYK7UxoMYFpD7rdFopQ/GNhOoUW3UWiL2812723avTvslUcqtuvrNte3i9F3TMJ8PPiys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=SBFY1Ci4; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="SBFY1Ci4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745263534; x=1745522734;
	bh=PmFXp/1pIENAsC50OkNNaGrcSNdWHyXTpcpcmEFFedE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=SBFY1Ci4BB2RRBR0+shztWuvYMpQpEWw29Sw0KfBTqELkwwl9kuQ0v5J8vOKE9yAO
	 Na5hxSzqiixmPJW15NuCI+Bcqm66lR92cfSdD3ie4BHs+WEou9t0LZ5HUA8ULzy7Rw
	 KUXClXTXd2ccBgJOvYIGZvEdZ9Kn5NVz3VnSAK9JqMWCvvm7Q+w++/Sd34KykaOqYw
	 A65m6tn4njR/O2FQASdfKJmyf0GuIBRp1PSZHNM/xjDt6dj9Z4Hu2em1bPLBuqZg6j
	 4YeMVzNfjapKw9/zNQnlSXzShr4EIfqvzs0SDwt3J/j07wdEGUX6qIfsPEEWcW7Q1A
	 HGZ4Jcsnanh8w==
Date: Mon, 21 Apr 2025 19:25:30 +0000
To: Tamir Duberstein <tamird@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Aliet Exposito Garcia <aliet.exposito@gmail.com>, Fiona Behrens <me@kloenk.dev>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] rust: transmute: add `cast_slice[_mut]` functions
Message-ID: <D9CKABQE6FC5.IGM9KTS4E0VX@proton.me>
In-Reply-To: <CAJ-ks9m0=TRiq_6p_11xj3GjXJnPgrHYp9UByZt1HEHXyTorEg@mail.gmail.com>
References: <20250421134909.464405-1-benno.lossin@proton.me> <20250421134909.464405-2-benno.lossin@proton.me> <CAJ-ks9m0=TRiq_6p_11xj3GjXJnPgrHYp9UByZt1HEHXyTorEg@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 8545d9adc5a0e500d76a013308f6c40167c6a554
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon Apr 21, 2025 at 8:42 PM CEST, Tamir Duberstein wrote:
> On Mon, Apr 21, 2025 at 9:50=E2=80=AFAM Benno Lossin <benno.lossin@proton=
.me> wrote:
>> +/// Casts the type of a slice to another.
>> +///
>> +/// # Examples
>> +///
>> +/// ```rust
>> +/// # use kernel::transmute::cast_slice;
>> +/// #[repr(transparent)]
>> +/// #[derive(Debug)]
>> +/// struct Container<T>(T);
>> +///
>> +/// let array =3D [0u32; 42];
>> +/// let slice =3D &array;
>> +/// // SAFETY: `Container<T>` transparently wraps a `T`.
>> +/// let container_slice =3D unsafe { cast_slice(slice) };
>> +/// pr_info!("{container_slice}");
>> +/// ```
>
> How can this example compile? The type of `container_slice` can't
> possibly be known.

I should really start the habit of rerunning my testing scripts before
final submission... I added this example after the initial run... I
think you're correct in that it doesn't compile. Will fix for the next
version.

---
Cheers,
Benno

