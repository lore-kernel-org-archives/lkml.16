Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D05E23C380;
	Thu,  6 Feb 2025 22:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738881577; cv=none; b=aFTsluPslzccX3yF0bllkHlce54LlYz+ncFxGEUMuNWyeH8Zoev4K0ionY+oETvE44MO5EgratwSGlI+EIluxT5vmsTw8SC0/FydNSJOhkYnsMi9B0xptfugU2tMmAe6AbzKmBqica50cRKG/7CatSyjcDH0ATTjRJYz12l2B8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738881577; c=relaxed/simple;
	bh=qQJEP+zXtmpryh62HYo+jZSpM5jiL+VAFb2PF+0RdZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1hp/G3Dl159Op0N2fksxePyiGpjN/RpE8MWMUDgnTKtfeETJMgbZIJqCc4p4XZQ3OYgyA1DEJy5jZgY1v8H5kZ7sycrzKN8S2ur3Y4jreRilsOfkhp5HrZYcRgz4Ob+lGznSDzW5GWLNqOPoFdBSLgxdjQ/p7YhKj3iuER1quE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SG7Id26f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SG7Id26f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181A6C4CEDD;
	Thu,  6 Feb 2025 22:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738881577;
	bh=qQJEP+zXtmpryh62HYo+jZSpM5jiL+VAFb2PF+0RdZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SG7Id26fLV6OKIHoVZVG+coUnB7vRzoMHuhYns/D6qn13atKl/MVPONHn28EzdFA9
	 LCje0A5aehqzDbiTlCfp0V6X0cXAvUsd3f+Ma936TydfdszgsQy4Vgu+Vu4nPumIlJ
	 vdCdNBED5FKIjAyuzrQlYmOaprV9NIsUm974l8wcEVJTFbCvXLd7UhG5MvrsJDzkzX
	 b1PvjPgT3BGbZu/K6U0GXNCS2jl33YiHHeroYvm3oMLboQdAuWS0kZfYLMk/CbHFIt
	 45gForINKz4WmWJQBvXes0rjL7J7n9wBhUfwJVEa3Q2Dw7YdYbrZYdQFoprzbSQSfv
	 SfSGCZmhHl9Hw==
Date: Thu, 6 Feb 2025 23:39:31 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust/kernel: Add faux device bindings
Message-ID: <Z6U6I-ln5AcGTjI9@cassiopeiae>
References: <20250206210503.102061-2-lyude@redhat.com>
 <Z6U4APfuIEOgMzmd@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6U4APfuIEOgMzmd@cassiopeiae>

On Thu, Feb 06, 2025 at 11:30:30PM +0100, Danilo Krummrich wrote:
> On Thu, Feb 06, 2025 at 04:04:56PM -0500, Lyude Paul wrote:
> > This introduces a crate for working with faux devices in rust, along with
> > adding sample code to show how the API is used. Unlike other types of
> > devices, we don't provide any hooks for device probe/removal - since these
> > are optional for the faux API and are unnecessary in rust.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Maíra Canal <mairacanal@riseup.net>
> > ---
> >  rust/bindings/bindings_helper.h  |  1 +
> >  rust/kernel/faux.rs              | 60 ++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs               |  1 +
> >  samples/rust/Kconfig             | 10 ++++++
> >  samples/rust/Makefile            |  1 +
> >  samples/rust/rust_driver_faux.rs | 29 +++++++++++++++
> >  6 files changed, 102 insertions(+)
> >  create mode 100644 rust/kernel/faux.rs
> >  create mode 100644 samples/rust/rust_driver_faux.rs

Forgot to mention, we should also add the new files to the MAINTAINERS file.
