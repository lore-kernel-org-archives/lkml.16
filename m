Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEF327A10E;
	Fri, 25 Apr 2025 15:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745596118; cv=none; b=iiEHw6w/GWs8Q3S5STkBr2MPWEbAQAdbA3oDyeqpenLn7WUpG9mulWFvipCu53S8qmK9fDOHJM6Wwl8V9LUf0GqnEkAmng84z8ynpkORbdBNfjinspRHs0qA35Uwc0sDyoB6khsXFOxjGfZGRIwjQZSlznWQBgMRJ9VEwZ2hmhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745596118; c=relaxed/simple;
	bh=gbP/LTJ4bOaqyh9iK33lI3eC1HyFQnqEr9G9WVBueew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpx41sezLDWUxUDomzCk5N3JiTR/+xcAuewse5aNOP2bBzAiAx1CMsgFAE+xouVnLaZw0Qj80iEvsP1Oq9f8Dxniv5QSTBzj62hVLA6Fxm3UXfs5NF+5SqWNRblVO5DiASeBcGf2miERdy3Ro20HSy2yAcyrrxah2tXoCaU0A6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccOKCHgS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccOKCHgS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32522C4CEE4;
	Fri, 25 Apr 2025 15:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745596117;
	bh=gbP/LTJ4bOaqyh9iK33lI3eC1HyFQnqEr9G9WVBueew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccOKCHgStsMm/dwByxT8FVp1XCET4mKAtX35WQ+CVQv1LA0HVQ67um2ecEMtd+Nxg
	 c6jighDrmifLWcB11WhELXLSBcL8CGMf54GVmQCTDKwa3Ysuuj38z6rSUok8jINF/t
	 YjIZCDBilL1dNBu/WEin8MmJhNqLKHn+ujcXvKMuvXtmTm3VexxDOkiPWe1XZbcJUA
	 0c4QLBeSfb/poMKMUfaEWMmcJLp/DsAQ75Qilr5Mi8eoEH6BOpxvfFXq+PGTGCmiq9
	 dh9+IU+vosIbN8xK17vxzgQkpIjvsytz7qo7cMk6iQQ2cYiWfg5JA68GLhXZIL0kAu
	 BeNRDGiRW0+0Q==
Date: Fri, 25 Apr 2025 17:48:31 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 2/7] rust: property: Enable printing fwnode name and
 path
Message-ID: <aAuuz8BfATawK5oL@pollux>
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-3-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425150130.13917-3-remo@buenzli.dev>

On Fri, Apr 25, 2025 at 05:01:25PM +0200, Remo Senekowitsch wrote:
> Add two new public methods `display_name` and `display_path` to
> `FwNode`. They can be used by driver authors for logging purposes. In
> addition, they will be used by core property abstractions for automatic
> logging, for example when a driver attempts to read a required but
> missing property.
> 
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  rust/kernel/device/property.rs | 78 ++++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
> index d89715f7d..28850aa3b 100644
> --- a/rust/kernel/device/property.rs
> +++ b/rust/kernel/device/property.rs
> @@ -49,6 +49,84 @@ pub(crate) fn as_raw(&self) -> *mut bindings::fwnode_handle {
>          self.0.get()
>      }
>  
> +    /// Returns an object that implements [`Display`](core::fmt::Display) for
> +    /// printing the name of a node.
> +    pub fn display_name(&self) -> impl core::fmt::Display + '_ {
> +        struct FwNodeDisplayName<'a>(&'a FwNode);
> +
> +        impl core::fmt::Display for FwNodeDisplayName<'_> {
> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> +                // SAFETY: self is valid by its type invariant
> +                let name = unsafe { bindings::fwnode_get_name(self.0.as_raw()) };
> +                if name.is_null() {
> +                    return Ok(());
> +                }
> +                // SAFETY: fwnode_get_name returns null or a valid C string and
> +                // name is not null
> +                let name = unsafe { CStr::from_char_ptr(name) };
> +                write!(f, "{name}")
> +            }
> +        }
> +
> +        FwNodeDisplayName(self)
> +    }
> +
> +    /// Returns an object that implements [`Display`](core::fmt::Display) for
> +    /// printing the full path of a node.
> +    pub fn display_path(&self) -> impl core::fmt::Display + '_ {
> +        struct FwNodeDisplayPath<'a>(&'a FwNode);
> +
> +        impl core::fmt::Display for FwNodeDisplayPath<'_> {
> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> +                // The logic here is the same as the one in lib/vsprintf.c
> +                // (fwnode_full_name_string).
> +
> +                let num_parents = unsafe { bindings::fwnode_count_parents(self.0.as_raw()) };
> +
> +                for depth in (0..=num_parents).rev() {
> +                    let fwnode = if depth == 0 {
> +                        self.0.as_raw()
> +                    } else {
> +                        // SAFETY: `self.0.as_raw()` is valid
> +                        unsafe { bindings::fwnode_get_nth_parent(self.0.as_raw(), depth) }
> +                    };
> +
> +                    // SAFETY: fwnode is valid, it is either `self.0.as_raw()` or
> +                    // the return value of `bindings::fwnode_get_nth_parent` which
> +                    // returns a valid pointer to a fwnode_handle if the provided
> +                    // depth is within the valid range, which we know to be true.
> +                    let prefix = unsafe { bindings::fwnode_get_name_prefix(fwnode) };
> +                    if !prefix.is_null() {
> +                        // SAFETY: fwnode_get_name_prefix returns null or a
> +                        // valid C string
> +                        let prefix = unsafe { CStr::from_char_ptr(prefix) };
> +                        write!(f, "{prefix}")?;
> +                    }
> +                    // SAFETY: fwnode is valid for the reasons stated above
> +                    let name = unsafe { bindings::fwnode_get_name(fwnode) };
> +                    if !name.is_null() {
> +                        // SAFETY: fwnode_get_name returns null or a valid
> +                        // C string
> +                        let name = unsafe { CStr::from_char_ptr(name) };
> +                        write!(f, "{name}")?;
> +                    }

I think you should be able to just call

	FwNodeDisplayName(self).fmt(f)?

for this part, which saves you the duplicated code.
