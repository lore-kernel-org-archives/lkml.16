Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7008F187346;
	Sun, 25 May 2025 12:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748177305; cv=none; b=G5uoOob9qrwJiK+6uCP1tniB+fjsqiVi8t999Cta8/bATj2jI9YXsp/yT4u9660qYe6vMk9rhyatqv7yzOfremZrg4naW9G0MTaHZ5EH+F6NWtoOhn0aQvEdXhWfPDJ3mqVptzRBZNa/qXIypr9jP6lnC0YvMspyBeACsZEaulY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748177305; c=relaxed/simple;
	bh=cAWRLJuqRv7h//RQ2U9EsXb1jckLLD4OdgZVi/W2rAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eloQMruzbjHgCnUsxlgAHKj7oI+cS7D7yzbsLLEu9Lbp3YkysLXOwgTQQkOGADLzfgUz2UiWz0ryQb275rmqF4/ZH9DsIOIglqjy1F37esXbZhQDCt8GFZKg58AibKasVgp6odl5VTuOQnH1RMFmELOP5FBgXvFo4IC2L8oe4/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUsekchk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUsekchk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FEDC4CEEA;
	Sun, 25 May 2025 12:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748177304;
	bh=cAWRLJuqRv7h//RQ2U9EsXb1jckLLD4OdgZVi/W2rAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eUsekchkul/A/BANBz6aMizhZbOghJyH7ohsE6KVJcYhK7i2oWSFPa+elWFZcf9VI
	 2RLjvlcVnBfaYa6HdOc3fMHRNWU7Q5SEhBbq3tfWAN2JcQm4nX3hFGXjZLwjExA6G8
	 ulaG/TnJ9s/pUbkBwllE0YR+By4UI7jjp7Om05MiBEigDUsaavjsja4qQN5+HDmh/a
	 7D/DfwmQaVytPW+T66rlQk3yQRrfemOJxf1rZ8FXVs5lTpBks6aHER7zmZXBd76YhI
	 VHcS/at9PCNkXySISwFY/ySJJ6CDMYuQh5xGpgQWFNIdOR0/hKLnHqpmBatV58/ykS
	 cFxbuQKlww6Pg==
Date: Sun, 25 May 2025 14:48:18 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 4/9] rust: device: Enable printing fwnode name and path
Message-ID: <aDMRkq9oPzFJBBzy@pollux.localdomain>
References: <20250524192232.705860-1-remo@buenzli.dev>
 <20250524192232.705860-5-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524192232.705860-5-remo@buenzli.dev>

On Sat, May 24, 2025 at 09:22:27PM +0200, Remo Senekowitsch wrote:
> +    /// Returns an object that implements [`Display`](core::fmt::Display) for
> +    /// printing the full path of a node.
> +    pub fn display_path(&self) -> impl core::fmt::Display + '_ {

While testing the code I found the following buggy print statement:

	"test-device@2/test-device@2/test-device@2/test-device@2: property 'test,u32-required-prop' is missing"

and I think the following changes fix this:

> +        struct FwNodeDisplayPath<'a>(&'a FwNode);
> +
> +        impl core::fmt::Display for FwNodeDisplayPath<'_> {
> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> +                // The logic here is the same as the one in lib/vsprintf.c
> +                // (fwnode_full_name_string).
> +
> +                // SAFETY: `self.0.as_raw()` is valid by its type invariant.
> +                let num_parents = unsafe { bindings::fwnode_count_parents(self.0.as_raw()) };
> +
> +                for depth in (0..=num_parents).rev() {
> +                    let fwnode = if depth == 0 {
> +                        self.0.as_raw()

	self.0

> +                    } else {
> +                        // SAFETY: `self.0.as_raw()` is valid.
> +                        unsafe { bindings::fwnode_get_nth_parent(self.0.as_raw(), depth) }

	let ptr = unsafe { bindings::fwnode_get_nth_parent(self.0.as_raw(), depth) };
	FwNode::as_ref(ptr)

where FwNode::as_ref() is

	unsafe fn as_ref<'a>(ptr: *mut bindings::fwnode_handle) -> &'a Self

> +                    };
> +
> +                    // SAFETY: `fwnode` is valid, it is either `self.0.as_raw()`
> +                    // or the return value of `bindings::fwnode_get_nth_parent`
> +                    // which returns a valid pointer to a `fwnode_handle` if the
> +                    // provided depth is within the valid range, which we know
> +                    // to be true.
> +                    let prefix = unsafe { bindings::fwnode_get_name_prefix(fwnode) };
> +                    if !prefix.is_null() {
> +                        // SAFETY: `fwnode_get_name_prefix` returns null or a
> +                        // valid C string.
> +                        let prefix = unsafe { CStr::from_char_ptr(prefix) };
> +                        write!(f, "{prefix}")?;
> +                    }
> +                    write!(f, "{}", self.0.display_name())?;

	write!(f, "{}", fwnode.0.display_name())?;

Otherwise we always write the name of self, no matter the actual parent depth.

> +
> +                    if depth != 0 {
> +                        // SAFETY:
> +                        // - `fwnode` is valid, because `depth` is
> +                        //   a valid depth of a parent of `self.0.as_raw()`.
> +                        // - `fwnode_get_nth_parent` increments the refcount and
> +                        //   we are responsible to decrement it.
> +                        unsafe { bindings::fwnode_handle_put(fwnode) }
> +                    }
> +                }
> +
> +                Ok(())
> +            }
> +        }
> +
> +        FwNodeDisplayPath(self)
> +    }
