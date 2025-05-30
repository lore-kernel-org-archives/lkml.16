Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00279217648;
	Fri, 30 May 2025 21:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748641947; cv=none; b=cpQBYTye9WUJeqIBKZ3+sIbAUP2fXXVfQsHUorfu6FCsNhAr0oxuyKUIobWsKTAMZVrDaFJgQzt6CYadBxoFngpotH9G+XTpCVqoNc/jmz0QgHEjrvxzRNg2J2+4sM1+3rwiaB/ocfSsVIjcjAY86ChSUBynUYEDTFo1iRzGDlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748641947; c=relaxed/simple;
	bh=nmGCnwx8oP4NZxNHfBYFoZ5gwe1CLMg+XkqnteD6J18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YV+zAW5GY5q2UooXhGOGf96THBdHlRNvDHdMydQON7OVvF+WaNvrUXyiv6ZCDteJbVAbVlXLzKuboZEKgFXGwWN/K8cQ7tltsHJUWDYadDklt6oGLdsbOpAE2ZQ7NKcd3GrleFJf0ZRgYIo4trJOI6ZjcB/ucQBDaox1Svq9oqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+gXq3b6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+gXq3b6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE3FC4CEE9;
	Fri, 30 May 2025 21:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748641946;
	bh=nmGCnwx8oP4NZxNHfBYFoZ5gwe1CLMg+XkqnteD6J18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j+gXq3b6H+0u1aCnx6NP/OeVwNmUimfHYrhBP9qRB0Y3LXnu8/u9ik3B+4vZrCek7
	 wugmjraPsUrhZ4iEascw9ZXWSEVeGxkqPuygUjBelgUC9EU4/+Mowqf6J/qPkyzxiJ
	 crLAdd81iRygc/G2R91/IODcWS6oaURMdlzyjZUFZoANWSuQ5/oVN6wPVYta834zr+
	 6PeO1ZoZzO9G738SoOmrTjGMD3hqrITITlQF/rIBGR4nNNLkb9bhTd7V7Acp9kq/6B
	 3WVhHyKzoZKAGxzOhKBCpidhSBTDJXzoKTIxhtyU+noOWXT4mA4vZcHABjoWlx+vpP
	 yim/vSG8N3X6g==
Date: Fri, 30 May 2025 23:52:20 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, gregkh@linuxfoundation.org,
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] rust: types: support fallible PinInit types in
 Opaque::pin_init
Message-ID: <aDoolJF959s85MEL@pollux>
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-2-dakr@kernel.org>
 <DA9QST4SISFK.37NSCTH594NSF@kernel.org>
 <6dfafb34-8b85-4f54-9453-c39297d1f851@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6dfafb34-8b85-4f54-9453-c39297d1f851@gmail.com>

On Fri, May 30, 2025 at 10:11:00PM +0200, Christian Schrefl wrote:
> 
> 
> On 30.05.25 9:29 PM, Benno Lossin wrote:
> > On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
> >> Currently, Opaque::pin_init only supports infallible PinInit
> >> implementations, i.e. impl PinInit<T, Infallible>.
> >>
> >> This has been sufficient so far, since users such as Revocable do not
> >> support fallibility.
> >>
> >> Since this is about to change, make Opaque::pin_init() generic over the
> >> error type E.
> >>
> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >> ---
> >>  rust/kernel/types.rs | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> >> index 22985b6f6982..75c99d6facf9 100644
> >> --- a/rust/kernel/types.rs
> >> +++ b/rust/kernel/types.rs
> >> @@ -354,13 +354,13 @@ pub const fn zeroed() -> Self {
> >>      }
> >>  
> >>      /// Create an opaque pin-initializer from the given pin-initializer.
> >> -    pub fn pin_init(slot: impl PinInit<T>) -> impl PinInit<Self> {
> >> -        Self::ffi_init(|ptr: *mut T| {
> >> +    pub fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self, E> {
> >> +        Self::try_ffi_init(|ptr: *mut T| -> Result<(), E> {
> >>              // SAFETY:
> >>              //   - `ptr` is a valid pointer to uninitialized memory,
> >> -            //   - `slot` is not accessed on error; the call is infallible,
> >> +            //   - `slot` is not accessed on error,
> >>              //   - `slot` is pinned in memory.
> >> -            let _ = unsafe { PinInit::<T>::__pinned_init(slot, ptr) };
> >> +            unsafe { PinInit::<T, E>::__pinned_init(slot, ptr) }
> > 
> > Could you move this function into an `impl pin_init::Wrapper<T>` block?
> > (it's the same function, but in a trait that was recently added)
> 
> This is then basically this patch [0] from my `UnsafePinned` series.
> Just that I did not update the comment. :)

As mentioned in [0], I wasn't aware of this patch -- let's go with yours then.

> [0]: https://lore.kernel.org/rust-for-linux/20250511-rust_unsafe_pinned-v4-2-a86c32e47e3d@gmail.com/ 
