Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6261E35961;
	Thu,  1 May 2025 17:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746120758; cv=none; b=N8gbyP3NhfeCl5OBvMZb9ZzK8p+sYSH0ggjoy4J36uf+Ba70OQVyjYnIuGj35V7+W49z1kXjx2OZnbyPcesiXDUJo4ygQxZUvLevV1HkzslAqYFwvfeMSea/5nEubCGlWjNifAnd5DrXC0uyCwgtiVJ/vTq6CLJ0FutYhDD6NJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746120758; c=relaxed/simple;
	bh=ZsC2Jb52bxPa7Urrfp/X+caJzIRF69jd9zUsgErkG5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQw4qI7O9VhYnRqqJX4VTEuClRB3wtaNBti4/+QMcymw/3Kc0uQ6CS6aVg4Ce9VUXHHgjuP35adRsWMLNLlwmmhROhjltVszuKMLcqKhbhikyiR2WCqbaFq4z7wydr2lH+ajAHJK1PX7IvHp6M9CBA/KO+ejFC8h0EitVWtnNIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fabgb3Gp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fabgb3Gp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF92C4CEE3;
	Thu,  1 May 2025 17:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746120757;
	bh=ZsC2Jb52bxPa7Urrfp/X+caJzIRF69jd9zUsgErkG5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fabgb3GpeDVJ4RZhabe/nPmPbTIgaLtI0uX738jd90sZsaDL7N11iMf+5+Iu4dTSC
	 E7s2DJFwHkXC/56Akey/XJ3UIfcNPeqJuDoSCO92SwcvxR+ezz/cPl0J4RfJZdrB+T
	 sYHyNalUBFtmlsRl1zPKkimr0cnhkOlZ8Awi6qOwUrDvetIAJZPIKeJKG49lgIE3ON
	 9QlJ8372u8YAl59ujnbVZmsLdjkGjJB/HUSqD0eGlBntb2icQFfH0cTq0mCENOsCzN
	 6oIVka4bOenp4RYH6sLHEZw6XmPLXug2HuvapQvaKTQ2cTMXhln4LZt2NYk17Go2fN
	 hIuGgYxnLo3mA==
Date: Thu, 1 May 2025 19:32:31 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/4] rust: debugfs: Bind file creation for long-lived
 Display
Message-ID: <aBOwLxagw4NwoQwX@pollux>
References: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
 <20250430-debugfs-rust-v2-2-2e8d3985812b@google.com>
 <aBNO1rMcAwo-TNWQ@pollux>
 <CAGSQo005hmZCJNBUJE+oJ9NH7e9wCALaGYLGN-DL_Du7+9K0YQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo005hmZCJNBUJE+oJ9NH7e9wCALaGYLGN-DL_Du7+9K0YQ@mail.gmail.com>

On Thu, May 01, 2025 at 09:09:27AM -0700, Matthew Maurer wrote:
> On Thu, May 1, 2025 at 3:37 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > On Wed, Apr 30, 2025 at 11:31:57PM +0000, Matthew Maurer wrote:
> > Besides that, don't we also need a separate type for a file to be able to attach
> > non-static data anyways? I.e. something like:
> >
> >         #[cfg(CONFIG_DEBUG_FS)]
> >         struct File<T> {
> >            dentry: *mut bindings::dentry,
> >            data: T,
> >         }
> >
> >         #[cfg(not(CONFIG_DEBUG_FS))]
> >         struct File<T> {
> >            _p: PhantomData<T>,
> >         }
> >
> > I'm not exactly sure how v1 did this; I haven't had time to look at v1 before v2
> > was posted. I seems like v1 relied on a separate structure storing the data,
> > which also held a reference to the corresponding dentry or something along those
> > lines?
> In v1, this was done via
> ```
> #[pin_data]
> struct Values<T> {
>   dir: /* ignore this type */,
>   #[pin]
>   backing: T
> }
> ```
> Then, there was an interface that let the user provide a building
> function which had to have a fully polymorphic lifetime, which would
> be passed a backing reference that it was allowed to attach to
> subdirectory files. Since the dir would be cleaned up before the
> backing went away, we could know that it successfully outlived it.
> It'll probably look a little different when I send the follow-up
> series on top of this one.
> 
> Attaching to the root directory rather than each individual file made
> sense to me because this meant that if you had
> ```
> struct Foo {
>   prop_a: u32,
>   prop_b: u32
> }
> ```
> it would not be as tricky to attach `prop_a` to one file and `prop_b`
> to another, because the directory would own `Foo`.

Thanks for the explanation! I need to think a bit more about this approach.

> This'll probably be
> clearer when I send up a dependent series on top of v3 later today.

At least from my side, no need to rush. :) I'll have quite limited bandwidth for
the next ~10 days anyways.
