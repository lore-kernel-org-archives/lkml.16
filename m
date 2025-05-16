Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34DE44C77;
	Fri, 16 May 2025 13:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747402563; cv=none; b=V8Cz0O6qfa/M+RWVvOuO8yJBNabzfavO0KxKQozThPQycjjtXiHszKy7+dL42ANLWpvXh1AvXCGCj0U/YXNoVFoba69Ln/SFr1bbkMuZpIdb0y9FEvR9SMyIdw4W+ScH64vQXpKLtNq1/PjoMSY/yHENxLWhc0nDk+wS8sX96bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747402563; c=relaxed/simple;
	bh=Wu4UYb7lOXgJ9cCW4w9aorjz/8JJbWYUC1DNkB48hJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7A+SdnudvVCmfp7Zd8GpcpR+zQjJNTyx2Fn8z+FHqnqoX+Cq0jSU55qGLdc6ZtFcb0Lm+2z3uihY+ldPUpRg1SNCWFqYhXEXGCm9IwnJbvj0c2SDse78Y2GWku08/8JlOYi/z90R7xLPK8CdKzqaXzkDlhSwgtR9XcUhCtmV2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tvqUjJbB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tvqUjJbB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32724C4CEE4;
	Fri, 16 May 2025 13:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747402563;
	bh=Wu4UYb7lOXgJ9cCW4w9aorjz/8JJbWYUC1DNkB48hJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvqUjJbBpCBHnrB+fbIIp3FHlaE+OpNrKywarn0+2zIaQcRS3kOF7Ndn1Nhy6UVtn
	 6eNfeC9SjNo8C0GeoeQ+33/ehBNuuy+Z9XtPOtpYKTCQtsnoAwxwjvz+55U2DceW+z
	 9kOKYCu1EN2aVznvSTw74BNScnPaWLT3rtLiSAvDEklTwBZT0GUA/TTkUI0UuzTGCi
	 nICtrbxdjgZZ48c7pbXw8lBQHTEgtQA/urlIr6AtuiBgT0LydmPW6EzPO5FWnRI31y
	 jQ5xvGz9cjysDCo79VcfAi2C5cnUsjI6FUuVAjQ6pqCZ4vb9NfDXbsPex1eYOyMK81
	 MVyHHsdJe7m5Q==
Date: Fri, 16 May 2025 15:35:57 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	John Hubbard <jhubbard@nvidia.com>, Timur Tabi <timur@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add basic ELF sections parser
Message-ID: <aCc_PSOPkLWTcTru@pollux>
References: <20250515-elf-v1-1-4b53745453c0@nvidia.com>
 <2025051543-override-rockiness-3ead@gregkh>
 <D9WLFTPRB9FJ.OL6I760HKALZ@nvidia.com>
 <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com>
 <2025051532-gentleman-reset-58f2@gregkh>
 <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
 <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>
 <2025051647-urology-think-b8e0@gregkh>
 <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com>

On Fri, May 16, 2025 at 10:26:10PM +0900, Alexandre Courbot wrote:
> On Fri May 16, 2025 at 10:15 PM JST, Greg KH wrote:
> > On Thu, May 15, 2025 at 12:17:00PM -0700, John Hubbard wrote:
> >> On 5/15/25 7:30 AM, Timur Tabi wrote:
> >> > On Thu, May 15, 2025 at 6:43 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >> >>> Or if ELF is the problem, I don't mind introducing a WAD loader. ;)
> >> >>
> >> >> The "problem" I'm not understanding is why does the kernel have to do
> >> >> any of this parsing at all?
> >> > 
> >> > Nova will need to parse ELF headers in order to properly load and boot
> >> > Nvidia firmware images.  Nouveau does this already:
> >> > 
> >> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c#n2931
> >> 
> >> Hi Greg!
> >> 
> >> Nouveau influenced us heavily here, because having firmware that we
> >> can post once, and use everywhere (Nouveau and Nova), is very attractive.
> >> 
> >> Alex and Timur discuss other details that explain why the standard 
> >> user-space approach is less simple and clean than it might appear at
> >> first glance, but I wanted to emphasize that the firmware re-use point
> >> a little bit, too.
> >> 
> >> Oh, and also: the ELF images are going to remain extremely simple,
> >> because there is nothing now (nor can I see anything in the future)
> >> that would drive anyone to do complicated things. For example, if
> >> there is some exotic new thing in the future, it could be put into
> >> its own firmware image if necessary--because we understand that
> >> this parser here is intended to be a simple subset of ELF, and
> >> left alone really.
> >
> > Ok, then why not just bury this down in the driver that is going to
> > actually use it?  This patch series was adding it to ALL kernels, if you
> > need/want it or not, and as such would be seen as a generic way to
> > handle all ELF images.  But as that's not the case here, just copy what
> > you did in the existing C driver and make it private to your code, so
> > that no one else has to worry about accidentally thinking it would also
> > work for their code :)
> 
> Keeping this local to nova-core is perfectly fine if you think this is
> more acceptable. AFAIK there are no other users for it at the moment.

I'm not quite on board with that.

I think we should either we get to the conclusion that the desire of parsing (at
least part of) the firmware ELF is valid in the kernel and make it generic
infrastructure, or conclude that there really isn't a reasonable technical
reason to do that.

Please let's work out the exact technical reasons for doing this in the kernel,
such that we can either conclude one or the other.

> > And I still think that having the kernel do this is a mistake, firmware
> > should always just be a "pass through" otherwise you open yourself up to
> > all sorts of complexity and vulnerabilities in the kernel, both of which
> > is generally not a good idea.
> 
> I agree on principle, but I cannot think of a way to avoid doing this in
> the kernel without making things overly complex. We're happy to consider
> alternatives though, if they exist.
