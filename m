Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D1C1CEEBE;
	Sat,  5 Jul 2025 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731359; cv=none; b=HHStYO5hHa0IqFw11w/c+R/cUfqmuwHuSVTEvMDyCJc31FD38QCO0cU4hfkGsDGUkrMF6hf8GWEi0btf81WBK2cB7gb2DBcCVq5FEOrq5GA4N3beHhkCXE/KxUksvM9drGc57J6J/4X0K6A5q3PvSHhIAy/6oLUwFq66KeUxMMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731359; c=relaxed/simple;
	bh=7vdt48QBWQf5q8f779BC4cb9Bfcp13XBVQsQAxZGI+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDzfQ7nr34ebfwfc54h14NVCxcwyqY8E7ZaUYjIo92gREYcOKoJjichIQ4A9zRO4Ks3677dKoU/3p5VkpXv5tzYfaSePeWgwdSIy8F+dRWpmEZloapfdponZvSb0Iry21zqMCbAoxR1lEIkPBgPgU0bLXC5NlAbvBhn8f0qOPDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ihCkeGYY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ihCkeGYY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1E5C4CEE7;
	Sat,  5 Jul 2025 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751731358;
	bh=7vdt48QBWQf5q8f779BC4cb9Bfcp13XBVQsQAxZGI+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ihCkeGYYv5nVocs2RZ8+6a89JIYQR8B68A3Niwg1XxNGsx/ywCdzoKN6EaFP2Ikof
	 gdJgWs0St5nYAfQK5kJIMoKnnCkoOu3jMV4DsvEEcvCoXVuYkNJtlUCop2+RY+PQLH
	 FxjrUCOap/K8OSbylK8XwizgLOzF9HYvI/Ag42i4=
Date: Sat, 5 Jul 2025 18:02:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: miscdevice: remove unnecessary import
Message-ID: <2025070514-fled-spooky-1d1d@gregkh>
References: <20250704-cstr-include-miscdevice-v1-1-bb9e9b17c892@gmail.com>
 <CAJ-ks9nJhBDQtVUGNJVPmtrK6M8S9_Q+vpVGeSLtspJNaaX+nw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9nJhBDQtVUGNJVPmtrK6M8S9_Q+vpVGeSLtspJNaaX+nw@mail.gmail.com>

On Sat, Jul 05, 2025 at 11:56:19AM -0400, Tamir Duberstein wrote:
> On Fri, Jul 4, 2025 at 3:50 PM Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > `kernel::str::CStr` is included in the prelude.
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  rust/kernel/miscdevice.rs | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> > index 288f40e79906..8309d656088a 100644
> > --- a/rust/kernel/miscdevice.rs
> > +++ b/rust/kernel/miscdevice.rs
> > @@ -17,7 +17,6 @@
> >      mm::virt::VmaNew,
> >      prelude::*,
> >      seq_file::SeqFile,
> > -    str::CStr,
> >      types::{ForeignOwnable, Opaque},
> >  };
> >  use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};
> >
> > ---
> > base-commit: 769e324b66b0d92d04f315d0c45a0f72737c7494
> > change-id: 20250704-cstr-include-miscdevice-4c5cb26a0ece
> >
> > Best regards,
> > --
> > Tamir Duberstein <tamird@gmail.com>
> >
> 
> Oops, should have sent this to Greg. Sent
> https://lore.kernel.org/all/20250705-miscdevice-maintainers-v1-1-9a6b67f7602f@gmail.com/
> to make this easier in the future.

Thanks, I just noticed this as well.  I'll queue up this, and the
MAINTAINERS update when I get a chance tomorrow or so.

greg k-h
