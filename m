Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811F2320F;
	Wed,  4 Jun 2025 18:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749063439; cv=none; b=Fr6x5pR0/sq29WkX07rpah3fW75umEbvFDsCtfs3yzRlToCYQzyVOo2CvtmiwA/ZcIDBUIGMOcAv4p1jyB7m97hFAeblhEZ4gDnflYOrwNJvwM0iE5EKVlKVF6KzkKdcHrJq+1m3akvHg1m5AlX5hyoKRRP+al7Tgwn3DDLIiTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749063439; c=relaxed/simple;
	bh=iJ1q+c3Gj1u9vRGIqFindBNw9XMdex5v4Tpbt2wrCz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1mC0T78QtkYfCcl8oT4B8yHDUV8aA36Ch30EbelDZyeBCUGFJowhtkxcbuoyv/xcdJ1Uibcx2Ac43uVqtrLpF6iffneZ3V5UoX0PnmW6gYet516LZhthLbsN82v5xGwww6QfRQEjRQuHAFsPwXn8bQtpESBB3+nE0POu9W32xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3mg+D2y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3mg+D2y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFF1C4CEE4;
	Wed,  4 Jun 2025 18:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749063438;
	bh=iJ1q+c3Gj1u9vRGIqFindBNw9XMdex5v4Tpbt2wrCz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N3mg+D2yPd4ESJYA6C2vs7riXu4gYgEk+dvKlJNWjJwccSG38RwRqDDOhK9fp/81Z
	 3DoroZIhja0SuZ/03M/f4DeJMYN0QQbe1ld2e8cqlyzloE8mDz9HDeZGS4nYo76k1m
	 SCpb2gi7iPgv1IIIusM5Nl/kwKlXq6jk0etryJFztMdCR55FFuWj/Ahn5AOJUk7GWa
	 3Zd+KfNmJOzSR/8hBLNEQ8X4K5j4f0IeCBcCQi8/YhZMUf/8b9tqn3DT4+QCHHhywo
	 pgS7w2qXVjDr0yji7ONeXyX6mfT2LAeEY0XGEJBX1oyQqbYkEriKMGWKtbBBrGWt7E
	 l2NYDFn2AqqQA==
Date: Wed, 4 Jun 2025 20:57:12 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
Message-ID: <aECXCGVaVNt7lQ0J@cassiopeiae>
References: <aD6yOte8g4_pcks7@google.com>
 <aD62ZGBwqXxTroeX@cassiopeiae>
 <aD64YNuqbPPZHAa5@google.com>
 <aD68BzKRAvmNBLaV@cassiopeiae>
 <CAH5fLgjweugttOtuiyawNp5s2N9JPoo5FTJ+Zs9t_S87ggC1Gg@mail.gmail.com>
 <aD7DvBfAxKi7Fpg_@cassiopeiae>
 <CAH5fLggKL4jMjrJJEYV=Snqftu+oc4-sTNj9spinON5kHVP9xg@mail.gmail.com>
 <aD7JuyVRVr5dSqE9@cassiopeiae>
 <aD7Lhsjh6HPXedjT@cassiopeiae>
 <C6A531ED-B464-46C5-A1B1-BD4A87528CA1@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C6A531ED-B464-46C5-A1B1-BD4A87528CA1@collabora.com>

On Wed, Jun 04, 2025 at 03:32:16PM -0300, Daniel Almeida wrote:
> So, what is the result of this discussion?
> 
> > On 3 Jun 2025, at 07:16, Danilo Krummrich <dakr@kernel.org> wrote:
> > 
> > On Tue, Jun 03, 2025 at 12:09:05PM +0200, Danilo Krummrich wrote:
> >> Yes, we could solve this with a lock as well, but it would be an additional
> >> lock, just to maintain the current drop() semantics, which I don't see much
> >> value in.
> > 
> > If we want to keep the current drop() semantics we could use a completion
> > instead.
> > 
> > // Devres::drop()
> > revoke_nosync()
> > complete()
> > 
> > // devres_callback
> > if !try_revoke() {
> > // we end up here if try_revoke() indicates that the object was
> > // revoked already
> > wait_for_completion()
> > }
> 
> This looks like what is going on here [0], so should I implement what Alice suggested? i.e.:
> 
> > > Based on this, we could imagine something along these lines:
> > > 
> > > struct RegistrationInner(i32);
> > > impl Drop for RegistrationInner {
> > > fn drop(&mut self) {
> > > free_irq(...);
> > > }
> > > }
> > > 
> > > struct Registration<T> {
> > > reg: Devres<RegistrationInner>,
> > > data: T,
> > > }
> > > 
> > > Here you can access the `data` on the registration at any time without
> > > synchronization.

Yes, I think that's the best approach. You can also have a look at [1], which
implements this approach for misc device already, even though it's slightly more
complicated.

[1] https://lore.kernel.org/lkml/20250530142447.166524-6-dakr@kernel.org/

> 
> — Daniel
> 
> [0] https://lore.kernel.org/rust-for-linux/CANiq72nfOcOGJuktzSpNAUWwekaZ98JL7c1FhMKCjPSG80JMPA@mail.gmail.com/T/#t
