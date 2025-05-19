Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C445928313B;
	Mon, 19 May 2025 16:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747673721; cv=none; b=JqJiX+HK6VnRjjBLkh/P0iL322TvAYcpr8VMqLuFIqLw3Jb2FoMvx3VrrjTJe97FjBgqLixNYR6Xl9NAMJNv7ykGod966gMiUT2uuDTBJjxla8H004i8lzqQ/fG/fMgO/9Kxmu6voNgt4XWjioDqvT9O/fSh05hehz0r+qVJpJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747673721; c=relaxed/simple;
	bh=2h0wqLSQAYlElqRvO3VWXqKcEeKB1rJERvwy1eOIfRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJPj5UU4p+CrqatlBPKAqc1bhU01oz9FgaRBudHnU+y7TtjUKkx0SWQZ5DPnA4aB3OcV6rS0Amo3lwPfEtGGvI7eTJSoBhFZLLo0mQFArO4eudNCjdN25RKRHR/qq7QSoNkpAj1CGnOfqavvWShT3IC/59jlSQXWPJfLPnqiNPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DmvIyYmr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmvIyYmr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF4DC4CEE4;
	Mon, 19 May 2025 16:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747673721;
	bh=2h0wqLSQAYlElqRvO3VWXqKcEeKB1rJERvwy1eOIfRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DmvIyYmrZw9KxwuV3vy7iaq2az7uLh0I5ZryIaEK/JcaKbHGmEvaZQoD3PP8WSLn3
	 8Fx2aAAMGhRG6QSvffgCza6onu3XlAqPSmL7Xg4TF50zWzFVTfdeD17+d4EoxBflfk
	 pWLcnL2PN12Hnt6WKOZV/w5MGMlSP0I9YZZbjkYrtjQsjupYkbC+36Ao+lmQ5en14V
	 gxtZA+YAQxzV2GoVHZYoXKz5PqeUD+evujZoypecoYalPUzL8qMMCmIH52OCrJXC/3
	 FzETVaKkd/c5exIXW0LvqKe7AVwmp4sNB3GzGcz7ohM2rz/qQYaSSqqPjWvsZky9OX
	 pdbkPQ0phMphg==
Date: Mon, 19 May 2025 18:55:14 +0200
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
Subject: Re: [PATCH v4 6/9] rust: device: Add bindings for reading device
 properties
Message-ID: <aCtici15vSCBDbzE@pollux>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-7-remo@buenzli.dev>
 <aCH5WgORn9ZGl9Il@pollux>
 <DA093HA2415H.29OCPLS0M7H84@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA093HA2415H.29OCPLS0M7H84@buenzli.dev>

On Mon, May 19, 2025 at 05:43:17PM +0200, Remo Senekowitsch wrote:
> On Mon May 12, 2025 at 3:36 PM CEST, Danilo Krummrich wrote:
> >> +/// Implemented for all integers that can be read as properties.
> >> +///
> >> +/// This helper trait is needed on top of the existing [`Property`]
> >> +/// trait to associate the integer types of various sizes with their
> >> +/// corresponding `fwnode_property_read_*_array` functions.
> >> +pub trait PropertyInt: Copy {
> >> +    /// # Safety
> >> +    ///
> >> +    /// Callers must uphold the same safety invariants as for the various
> >> +    /// `fwnode_property_read_*_array` functions.
> >
> > I think you have additional requirements on the fwnode, propname and val
> > pointers as well as on nval, please document them as well.
> 
> What are the additional requirements? The implementation just calls the
> underlying `fwnode_property_read_*_array` with the exact same arguments,
> so I don't know what the additional requirements are.

First of all, I don't think you can refer to the safety requirements of the
`fwnode_property_read_*_array` functions, since they don't have any documented
safety requirements.

So, I think you have safety requirements regarding pointer validity of fwnode,
propname and val.

Additionally, there's the requirement that val has to be an array of nval
length.

Also, the PropertyInt trait itself has to be unsafe, given that it contains
unsafe functions.

I also pinged Benno about it, he usually knows best how to cover such things
properly. :)

> >> +    unsafe fn read_array_from_fwnode_property(
> >> +        fwnode: *const bindings::fwnode_handle,
> >> +        propname: *const ffi::c_char,
> >> +        val: *mut Self,
> >> +        nval: usize,
> >> +    ) -> ffi::c_int;
> >> +}
