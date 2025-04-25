Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C4526B941;
	Fri, 25 Apr 2025 15:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745595347; cv=none; b=lRkZPRCLeq8TeBc4Sc1Nem+jexf2JxvbHzEa96SwbFz3mH9vuiEc8nMwR3Xc3ykfIVKPDUfTF2P/7jx10iA+7vCuvpe4SophdtN0lpnUwVyZ0iG0hP1tRiN/v8eZtu3bWOiJUtYTm41q9iMm5eCZ8qON/zuScBWlmxihH4CBdaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745595347; c=relaxed/simple;
	bh=cWQ1d3mdoIx5G/o20c1FN7avcI1fOAdiygYreazt/K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6Y//1i85HVcSD2m3Z+nqXpLgT6EM2K5snASd5yXmwJZRGeBbg6/8vl4N3FTuF7QxZtAHwo8/Gs76mCLxycfmId3ALmTXKahC6vVOCwNt/XoG8oLJGlBIbMwPiYfOUkH3RYpb41r/4lk2lXQFME+GpKXanvE0eSBwY2xvsICKRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJQ23jPi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJQ23jPi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05867C4CEE4;
	Fri, 25 Apr 2025 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745595344;
	bh=cWQ1d3mdoIx5G/o20c1FN7avcI1fOAdiygYreazt/K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJQ23jPi9jlZOxEmzSEnv3yUPPowBO4fjV6iV/8McOiWl23PvcVOIdbPE5A1hB+wb
	 fNvT4eVhNcjjto3aIefdjjyt6TQ3Q6TUQ8FQ0EqUspyfFu0VxE7QiozF/quLYKdNxq
	 GPMhkY/l6KkcLf0/dQkLmNC4X7MOyBXCvBNL5JL7C9qIc+2IeK4yNND6X9wcjUNuXf
	 tyBmiHOOZMdXXq89vXUDt8bIYA5b889AUF7DfmAzN9u361DdLxi3RM2mic+UZGi76v
	 KVYXjpqG/ZA8rsdLvXz0emWcJ+TPIkpZ3uBhfUUFLi476j88V80YxePRLQp2p/WL4e
	 vEVgGHRa58hug==
Date: Fri, 25 Apr 2025 17:35:38 +0200
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
Subject: Re: [PATCH v3 3/7] rust: property: Introduce PropertyGuard
Message-ID: <aAuryiI0lY4qYyIt@pollux>
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-4-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425150130.13917-4-remo@buenzli.dev>

On Fri, Apr 25, 2025 at 05:01:26PM +0200, Remo Senekowitsch wrote:
> This abstraction is a way to force users to specify whether a property
> is supposed to be required or not. This allows us to move error
> logging of missing required properties into core, preventing a lot of
> boilerplate in drivers.
> 
> It will be used by upcoming methods for reading device properties.
> 
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  rust/kernel/device/property.rs | 57 ++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
> index 28850aa3b..de31a1f56 100644
> --- a/rust/kernel/device/property.rs
> +++ b/rust/kernel/device/property.rs
> @@ -146,3 +146,60 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
>          unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
>      }
>  }
> +
> +/// A helper for reading device properties.
> +///
> +/// Use [`Self::required`] if a missing property is considered a bug and
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
> +    /// missing property is not an error, use [`Self::optional`] instead.
> +    pub fn required(self) -> Result<T> {
> +        if self.inner.is_err() {
> +            pr_err!(
> +                "{}: property '{}' is missing\n",
> +                self.fwnode.display_path(),
> +                self.name
> +            );

Hm, we can't use the device pointer of the fwnode_handle, since it is not
guaranteed to be valid, hence the pr_*() print...

Anyways, I'm not sure we need to print here at all. If a driver wants to print
that it is unhappy about a missing required property it can do so by itself, I
think.
