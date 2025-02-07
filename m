Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CF51E261F;
	Fri,  7 Feb 2025 12:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738930566; cv=none; b=iGyspParTZdXYdUEVLk/vfNGXfo26GPi5qhXU/t6aPekmprKn/Z87YqaOJjJ7GRVSVQjp52D5+t0O1jOnm9piJZuIzHZdWsAKfiGzCejKVwgoWVE5TmIh+Iu06L03nEp4uxhV+k6d3OIelcV0/IaQKx2E7182CayiEevXHh7JGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738930566; c=relaxed/simple;
	bh=iy+Oa6QDbbqdL4VN+qctN+E8BgMC7GBKiyIRqBy5oDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aK3z05RG2n5u9Ej9D/CV/awTQFMPka/6ipAIhWKKTm+reRdYQldk9hKpkK7aT/plkwZf0ow9sojOwuY+7T5+jTH4GWSfif+c/zDXWtukxMUY/3A7cRba4KTTD235k3htYCRNA3JEl3R32IG9gmtw15Ak8VTICbNUp2F0/BYSHdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QuuZYSxu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QuuZYSxu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A3FC4CED6;
	Fri,  7 Feb 2025 12:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738930565;
	bh=iy+Oa6QDbbqdL4VN+qctN+E8BgMC7GBKiyIRqBy5oDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QuuZYSxuaLe7dYOZrWqV4Gr5Yy7mSbWGX6Wt7hZOCNqI1x2x41KLUIJHqrRSRBDd3
	 4tYbuaCZ3fvzhiXfRLbveb9TbU5YP51445+Su8iR3UR8Nj+jYCljpC8j/IRSwBnkpO
	 1C1v93/syjxPoBjApyv6JZ5T/9Zzyplm89rI7tk4=
Date: Fri, 7 Feb 2025 13:16:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust/kernel: Add faux device bindings
Message-ID: <2025020715-subsonic-silenced-36c5@gregkh>
References: <20250207004049.178049-1-lyude@redhat.com>
 <CANiq72=bspqRga-hTTb3Vh9kD0ctyTehM9dvJdR=8biTE+iCQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=bspqRga-hTTb3Vh9kD0ctyTehM9dvJdR=8biTE+iCQw@mail.gmail.com>

On Fri, Feb 07, 2025 at 12:42:41PM +0100, Miguel Ojeda wrote:
> On Fri, Feb 7, 2025 at 1:42 AM Lyude Paul <lyude@redhat.com> wrote:
> >
> > This introduces a crate for working with faux devices in rust, along with
> 
> s/crate/module
> 
> (also in the module description)
> 
> > +//! C header: [`include/linux/device/faux.h`]
> > +use crate::{bindings, device, error::code::*, prelude::*};
> 
> Newline between.
> 
> > +        // SAFETY: self.0 is a valid registered faux_device via our type invariants.
> 
> Markdown.
> 
> > +// SAFETY: The faux device API is thread-safe
> > +unsafe impl Send for Registration {}
> > +
> > +// SAFETY: The faux device API is thread-safe
> > +unsafe impl Sync for Registration {}
> 
> Perhaps some extra notes here would be useful, e.g. is it documented
> to be so? Especially since faux is being added now, it may make sense
> to e.g. take the chance to work on mentioning this on the C side.

How can or should I mention this on the C side?

thanks,

greg k-h
