Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1165256C84;
	Mon, 12 May 2025 12:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747052586; cv=none; b=cvQ0mYgl+YKyyS4WwXscqRgn2eYHVs6eGsAxFup1OIcTgN0X3fdtVKDNPz61Ktosbr0n4WfABtGp5BIQy93HdwFrwqysIZ/Q1KQ6N6LABPLxIk7rK9vGDGBknmMDoIrpihkC08B0YG+0M5QiODhoh5DweTNCJxce7ky5OyFDbwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747052586; c=relaxed/simple;
	bh=2WNZsBiK3HiRTHULHlEXidSD2YudyevaPY4FvNsGzxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n583HddQL07t0h1Uo/jWYZ2A/OZyuCHoHTmdSqO6YeyvMYObE8m2aGEYlRdmAvmpONhtgI315n34IE+5ZRdqnEJ0b1cqw87x32jc2KHqr3rfAREY//TXhni2ynRK3Jc8JB17WeC6iXEIFiEh8IkvwzrAqOj2fNnppLFvgO4cccE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozxBVWXo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozxBVWXo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51193C4CEE7;
	Mon, 12 May 2025 12:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747052586;
	bh=2WNZsBiK3HiRTHULHlEXidSD2YudyevaPY4FvNsGzxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozxBVWXoxSIkRzW8dM4064bu3lgZBaeQwAEp2tZRril6R8vRUFQDxo8DTgQzhA3CS
	 +Tn0N5GnKfRSiv0LGu0wPgabbLIyYnXGfJdyz7frzpZK8BqfGnJkFKCFnAtxP/8dfY
	 FVaYqi0c7CnvOMcTnqJEZ8KqlU4jg4/qFDmJ6eS5QkShg1a1pqtqARV+78KCdkYEiD
	 KS53e3a8DMRTtlpqcvYa6IhsqYwuiECeUHg6B0ZLoDCqw1Slz12+4hGS8f7j1gST63
	 aPdeqc79DuvbZb8OemzwG0OOLUj2ZUxJfIiDHQinqbTUV8BudxI0j5rBSmPsyW9apT
	 7iEBuEHbY+j5g==
Date: Mon, 12 May 2025 14:22:59 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 3/4] rust: drm: gem: s/into_gem_obj()/as_gem_obj()/
Message-ID: <aCHoI2Em6M2Y8QdD@pollux>
References: <20250501183717.2058109-1-lyude@redhat.com>
 <20250501183717.2058109-4-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501183717.2058109-4-lyude@redhat.com>

On Thu, May 01, 2025 at 02:33:18PM -0400, Lyude Paul wrote:
> There's a few changes here:
> * The rename, of course (this should also let us drop the clippy annotation
>   here)
> * Return *mut bindings::drm_gem_object instead of
>   &Opaque<bindings::drm_gem_object> - the latter doesn't really have any
>   benefit and just results in conversion from the rust type to the C type
>   having to be more verbose than necessary.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/drm/gem/mod.rs | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index f70531889c21f..55b2f1d056c39 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -42,8 +42,7 @@ pub trait IntoGEMObject: Sized + super::private::Sealed {
>  
>      /// Returns a reference to the raw `drm_gem_object` structure, which must be valid as long as
>      /// this owning object is valid.
> -    #[allow(clippy::wrong_self_convention)]
> -    fn into_gem_obj(&self) -> &Opaque<bindings::drm_gem_object>;
> +    fn as_gem_obj(&self) -> *mut bindings::drm_gem_object;

Maybe just as_raw()? Either way,

	Reviewed-by: Danilo Krummrich <dakr@kernel.org>
