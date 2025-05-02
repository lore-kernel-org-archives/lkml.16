Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C0D288DA;
	Fri,  2 May 2025 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169531; cv=none; b=VbwjlFTjORPoLuw4lbPk/NJvS5gb+gG66qltXmQ8WREHoeRxbAaEtPEkl5uHMUS5MBt/d7KNDTuGRbeb74+2Rpl5eAy58bzAoEAJ6gWsSESMQzi53Z9jkyp506xddYX7CU4DcOea+L1CbmS+y8nkL3546PuIe2x6+d90AGxHxOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169531; c=relaxed/simple;
	bh=V3jMJ1SJUjcVBzpFKa3pz9R2psqAgrGCVbgxjjgpROU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9+Tx9fU88U6iBqov6GMxmUXF1sXrwhSPuTawd9RFZcF6LDAcbkK/RgATmROBwEHlb3IdMa9b9aWNTMkBmyeV3zZHzfEVIWDUGDCgYtTMsSNoHW1gAgD6IyIoQ28YuvfvhTqx5uROpxA4hy6JOyyeZ3VF0vMgbu4DiLtzAYaLgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsEoVJCy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsEoVJCy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF62C4CEE4;
	Fri,  2 May 2025 07:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746169530;
	bh=V3jMJ1SJUjcVBzpFKa3pz9R2psqAgrGCVbgxjjgpROU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GsEoVJCyW0geuMNcxQ2vyYWd5mBPM5b8KRjYKEbuzrErj4fwVkoSWmzwXZ5YDxYPB
	 B+oYfvSX26wNRADfQHwiRbRghWbZUhpdgnE2mMv0NmfUO0E0aNksDQFfBAvBM6RY4Q
	 ZZQGdNnngz244M7ZiqbRjELUizaHlOhwLv1ZyY5wb7PgH+IvxPDnL1NrhZmXKteKod
	 r4K9woK8llzlY7tB3kCgnPe+g0+0MqASFtibc6FI5Z++v1+M2m5+jKWPHXOBHTK53S
	 VhL5WQSSxCD6FAi8OonBxYHplL57a0LcHr1uaFAqMEZsh2Ka1yawLtQ3JVHEv8P3Hh
	 VLdqgvwAwDCNA==
Date: Fri, 2 May 2025 09:05:25 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/4] rust: debugfs: Bind DebugFS directory creation
Message-ID: <aBRutTMBtq-uCnii@pollux>
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
 <20250501-debugfs-rust-v3-1-850869fab672@google.com>
 <aBRoNKjB063QhGZo@pollux>
 <2025050230-browsing-backstab-8de9@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025050230-browsing-backstab-8de9@gregkh>

On Fri, May 02, 2025 at 09:00:07AM +0200, Greg Kroah-Hartman wrote:
> On Fri, May 02, 2025 at 08:37:40AM +0200, Danilo Krummrich wrote:
> > On Thu, May 01, 2025 at 10:47:41PM +0000, Matthew Maurer wrote:
> > > +/// Handle to a DebugFS directory that will stay alive after leaving scope.
> > > +#[repr(transparent)]
> > > +pub struct SubDir(ManuallyDrop<Dir>);
> > 
> > I think it's not very intuitive if the default is that a SubDir still exists
> > after it has been dropped. I think your first approach being explicit about this
> > with keep() consuming the SubDir was much better; please keep this approach.
> 
> Wait, let's step back.  Why do we care about the difference between a
> "subdir" and a "dir"?  They both are the same thing, and how do you
> describe a subdir of a subdir?  :)

We care about the difference, because Dir originally had keep() which drops the
Dir instance without actually removing it. For subdirs this is fine, since
they'll be cleaned up when the parent is removed.

However, we don't want users to be able to call keep() on the directory that has
been created first, since if that's done we loose our root anchor to ever free
the tree, which almost always would be a bug.

Please also see [1] and subsequent replies.

A subdir of a subdir would still be a SubDir.

[1] https://lore.kernel.org/lkml/aBNKEewhCP8jRIZL@pollux/
