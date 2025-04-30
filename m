Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C3A24EAB2;
	Wed, 30 Apr 2025 15:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026659; cv=none; b=STHHd+ebr8vZ530a1Uleq/wnjc4wgHHSc6vKc4bhKEXoxjG2NBT3QzpSRx5V4G7/p8gjhflEP3kfrdARsyEqq06qF4QuHrndJUn5OtK8XAMdaGfiX/11Pak00vqcgdp1QU67eGS1+69rzfpz0+IGtxArRBxF3UIAe5OzCmzc5xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026659; c=relaxed/simple;
	bh=F6klmd70pCSjvh8XjpNfawISVetQQx8yKl6HRgMo/JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FV7BqvsLIWWehrAZdmNJl/ooKScXpRMW+UKGm3wrTwa5eCDLwDyxwJ0oyqSngrzYqU7+QrqaxdoWqyVcbrHjRpSo///X8zxnbAZMcD/uZpkjklWiZQ0Rrp1vAxi3ea/aYKfsAxdrhm3zy/3wUY3UXed/756zKJBtrYPM7kS2Nrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MXPgtDJL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MXPgtDJL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8928EC4CEE7;
	Wed, 30 Apr 2025 15:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746026659;
	bh=F6klmd70pCSjvh8XjpNfawISVetQQx8yKl6HRgMo/JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MXPgtDJLzT6Y0myvAs4ksa0iRBEmD/869ZXi2tkMVeSKYBaUodiQdYCPxYY8NijAL
	 4r8iHEAeGaKwC+WMPAUwDQIIcXdOFqLVt3QdS9V+Kj5upzPqdCl2oPAzI+y6xtcwC/
	 0pa/wmz1OBPLh0JvCiazAnSwKL+dSPy/Xi+wMi6s=
Date: Wed, 30 Apr 2025 17:24:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/8] rust: debugfs: Bind file creation for long-lived
 Display
Message-ID: <2025043049-shale-bagpipe-9981@gregkh>
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <20250429-debugfs-rust-v1-2-6b6e7cb7929f@google.com>
 <2025043006-snowflake-headless-e417@gregkh>
 <CAGSQo01-bQydWgiC-+VRL7ac6v8WG2jwZ5RewPheW-quSQBsow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo01-bQydWgiC-+VRL7ac6v8WG2jwZ5RewPheW-quSQBsow@mail.gmail.com>

On Wed, Apr 30, 2025 at 08:12:09AM -0700, Matthew Maurer wrote:
> On Wed, Apr 30, 2025 at 5:06 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Apr 29, 2025 at 11:15:56PM +0000, Matthew Maurer wrote:
> > > +    /// Create a file in a DebugFS directory with the provided name, and contents from invoking
> > > +    /// [`Display::fmt`] on the provided reference.
> > > +    ///
> > > +    /// # Example
> > > +    ///
> > > +    /// ```
> > > +    /// # use kernel::c_str;
> > > +    /// # use kernel::debugfs::Dir;
> > > +    /// let dir = Dir::new(c_str!("my_debugfs_dir"), None)?;
> >
> > Again, can never fail, so don't check it.
> >
> > > +    /// let file = dir.display_file(c_str!("foo"), &200)?;
> >
> > Again, can never fail, so don't check it.
> >
> > And "200" is wrong, did you test these?
> 
> How is 200 wrong? This displays the number "200" in a file called
> "foo" in the directory "my_debugfs_dir"?

Oops, sorry, I thought that was the "mode" of the file being created :)

greg k-h
