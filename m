Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762B9253352;
	Mon, 12 May 2025 17:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747069744; cv=none; b=pQKq0F97tp+ItQziDoojjcYruSrk6+X0i00JLk4Wun0Cap17YP8FABxRAu80ZUfz097Vca8vPrNMSTjEuzjUnYRe3CUDciTfG1sHwG34BvWT5GNQtbo0+1SkKZaE5NsFg8+z4ok3QQLKfV1YFfWxyS/eXzD4A/L/KtfuInDBUP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747069744; c=relaxed/simple;
	bh=NXrn6pd6C/pHrLJRV8tm1na465rKRwRiRJAsOnDNemg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGR43XD991om5EHOSiRQ+Vxh1BLuHrBqq0XQkbajzw3A2lRa5cvb7eh+CivijyMZcg7i+XZDNsNyQ8WBNOgLYab+bnSLmvwTcIyMkrqe+p42bHipYlw09RAYSjfSvJpkv3uF6hHRlviNkOAeSREWqUQf3k5CwFl9e9mrhk3qIzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfBRFxip; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfBRFxip"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0542EC4CEE7;
	Mon, 12 May 2025 17:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747069744;
	bh=NXrn6pd6C/pHrLJRV8tm1na465rKRwRiRJAsOnDNemg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kfBRFxipEX9Zi6bx8K12OZUZKZJ5Ej0zY3Oh2qmYxXTsfNNcItD5ExaQFlGC3QO8r
	 SH3jhdntHJWMCgRhD60gsmhfQejxr6qSnd64toFAS7i+a+ARgdiJxmwmuXUzIJCPIW
	 Osu790tp65CuFDxhdvqWVKrLR5fmS/In6lFnK8unfaX1d0hpFhTkulhfOa1REU7Jin
	 0QhRoUsJ1GZ1eSJn4v50ShHCH5WVg584lvOELBejruVBNtKA48FFtorOIROWImn8lp
	 uIui+pkwcyoywGYxGqzQ+n5KA2+ZLwUQ1RqkQJlAUnnDxzizwumsYmaYzXT4l+qTyN
	 EAppQaZJcq1TQ==
Date: Mon, 12 May 2025 12:09:02 -0500
From: Rob Herring <robh@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Saravana Kannan <saravanak@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 5/9] rust: device: Introduce PropertyGuard
Message-ID: <20250512170902.GA3463681-robh@kernel.org>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-6-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504173154.488519-6-remo@buenzli.dev>

On Sun, May 04, 2025 at 07:31:50PM +0200, Remo Senekowitsch wrote:
> This abstraction is a way to force users to specify whether a property
> is supposed to be required or not. This allows us to move error
> logging of missing required properties into core, preventing a lot of
> boilerplate in drivers.
> 
> It will be used by upcoming methods for reading device properties.
> 
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  rust/kernel/device/property.rs | 59 ++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
> index 6ccc7947f9c31..59c61e2493831 100644
> --- a/rust/kernel/device/property.rs
> +++ b/rust/kernel/device/property.rs
> @@ -123,3 +123,62 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
>          unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
>      }
>  }
> +
> +/// A helper for reading device properties.
> +///
> +/// Use [`Self::required_by`] if a missing property is considered a bug and
> +/// [`Self::optional`] otherwise.
> +///
> +/// For convenience, [`Self::or`] and [`Self::or_default`] are provided.
> +pub struct PropertyGuard<'fwnode, 'name, T> {
> +    /// The result of reading the property.
> +    inner: Result<T>,
> +    /// The fwnode of the property, used for logging in the "required" case.
> +    fwnode: &'fwnode FwNode,
> +    /// The name of the property, used for logging in the "required" case.
> +    name: &'name CStr,
> +}
> +
> +impl<T> PropertyGuard<'_, '_, T> {
> +    /// Access the property, indicating it is required.
> +    ///
> +    /// If the property is not present, the error is automatically logged. If a
> +    /// missing property is not an error, use [`Self::optional`] instead. The
> +    /// device is required to associate the log with it.
> +    pub fn required_by(self, dev: &super::Device) -> Result<T> {
> +        if self.inner.is_err() {
> +            dev_err!(
> +                dev,
> +                "{}: property '{}' is missing\n",
> +                self.fwnode.display_path(),

Is it possible to do "{self.fwnode}: property ..."?

Then if we want to modify the default, we could do something like 
"{self.fwnode:pn}"? It doesn't look like that's something which would 
work OOTB and is not something we need to solve now. So just the default 
formatter is good for now.

Rob
