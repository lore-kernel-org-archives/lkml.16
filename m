Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D8E145355;
	Thu,  5 Jun 2025 15:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749136123; cv=none; b=MY34ryuONHqmVt90r2Hxw/GR1c19yqsbXs1bb7CJp+jNfcwFDu9ZTiypjxLy/8Mo5cU2bFG2S8ZwNEnUK92dAR39NCPf/RC/h6v8o4Zj63JgTC8akgrWuk9mKYggGQJoURQsyRpm2QEBDPLE5WRBvbY06P0IHJFZ40n8vIqTm54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749136123; c=relaxed/simple;
	bh=eZKF+KQlpwHqJNTPOrcnmE84pyon0govQK9/bnf1jLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HujX8FrA27oZgPkOoUBNi9RCJb9q2WYFE+FnEzZiBNed3THwL9RH4gRAskdRiz0GyEBXNabYtJ4dNdAkQheRAfdn+0KA2nnKq3VMmt7Z3dhe76WZvL3xPgdHMahFFfN5Vu91kb0EUvTgM1ZJ6/56pLz/AEqxi4M2IvRP7GjMbeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pMTGSVmn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pMTGSVmn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51B5C4CEE7;
	Thu,  5 Jun 2025 15:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749136122;
	bh=eZKF+KQlpwHqJNTPOrcnmE84pyon0govQK9/bnf1jLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pMTGSVmnD5T11tXRr2QpazpKp63Fa92vzW3P2GCGr2TrgJnUusGrUnbvhcqH1o8e4
	 GxZzRnHaex7DTHwGessFNcJtXT+MCWJPqLhPJ+Z0Y1uiPyqOfOQwl8YEnfuDJvunkG
	 KLJQSRSgqsPK8ujg/oxFAn1Hn6kLt6Xqpbcl6C2jdrrIUJvi4JZj4/3jiGHd6eMdiI
	 U5KHK6N7hZo7r2mlza3meQcwdM+NB5TDDeC3hVKLOdn2c1E1xQqqSm3vkiJdOyL2D8
	 F6eE25r7j6hxOpEap3A97O/DZ9oKkZJORv6ABccQLj/M7Qz3zFCKSbESNd7vADV1mI
	 zlOdUG++DGS4A==
Date: Thu, 5 Jun 2025 10:08:40 -0500
From: Rob Herring <robh@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Saravana Kannan <saravanak@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 5/9] rust: device: Introduce PropertyGuard
Message-ID: <20250605150840.GA2539727-robh@kernel.org>
References: <20250530192856.1177011-1-remo@buenzli.dev>
 <20250530192856.1177011-6-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530192856.1177011-6-remo@buenzli.dev>

On Fri, May 30, 2025 at 09:28:52PM +0200, Remo Senekowitsch wrote:
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
> index 8e0414b0517e4..b789fbbd0e6cc 100644
> --- a/rust/kernel/device/property.rs
> +++ b/rust/kernel/device/property.rs
> @@ -155,3 +155,62 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
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

Is it possible to make "{self.fwnode}: property..." work? Just need to 
implement Display trait on FwNode, right?

Doesn't look to me like we can alter what we print like in C, but for 
dmesg it's usually the full path we want anyways.

Rob
