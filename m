Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915834B1E51;
	Thu, 15 May 2025 07:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747295119; cv=none; b=Mhbf5kfKbkpVOjkrMdG/9lVmBDXxLiJaUYMzXXzokJVaGngxgbzgfmHukmYJE5+h0/AxHfoZeMAuudYLm6Fv3vFdGYXIZCOS4gdV9eEMwTR3blU47YLQHj0NYc31mCDbGjkeSiyuw7HBLHGeFh+/gTh5tUbZqgFPBq1XujM9KiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747295119; c=relaxed/simple;
	bh=Mwfoa7pfou8cfJ+qwk62V37KTgsEWtdPzhvEfUlY/Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUiNXqKG3fyl3yERjwsQx1i9q5Cigyl9Ig1eZAcDXpuLY4ZP8H/q6R49E2t/jEDBrWMn29WhbKZmAQMs7ej6eVh0/xf/Ot4E2Ta4x5pRn8ygA033JC18+j7CYpGCBVSErETBDFb/VEZ6tO83lkPxCC9wSU+QJfyV+aFXcaz+6Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qDv9fMGz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qDv9fMGz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47109C4CEE9;
	Thu, 15 May 2025 07:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747295119;
	bh=Mwfoa7pfou8cfJ+qwk62V37KTgsEWtdPzhvEfUlY/Uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDv9fMGzsx9fPQslRlieJe7hWbVdtoh0zhfZ2SgMN0q9iQPgRNoeqzEhbAkVIpMh7
	 GZ9N438yDg3iIeKlMK9sctvzn06ylEZbUOL6immLnjvrgx4tMEYnoq9a5x17qUg787
	 hr9Bmo0BLnnh6ZjCju8jYtW4QrDQoLUqSN1yyJGA=
Date: Thu, 15 May 2025 09:43:30 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"tmgross@umich.edu" <tmgross@umich.edu>,
	"benno.lossin@proton.me" <benno.lossin@proton.me>,
	"gary@garyguo.net" <gary@garyguo.net>,
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>,
	"lossin@kernel.org" <lossin@kernel.org>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"samitolvanen@google.com" <samitolvanen@google.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
Message-ID: <2025051540-snowsuit-manhole-7858@gregkh>
References: <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux>
 <D9VSJTPCSNXV.1LCXKGKVDGP96@kernel.org>
 <CAGSQo00Pj0qF90712K7xACNEvr2e0q=98b8-0VUcXLD5V+oDhg@mail.gmail.com>
 <aCUVuXO_jORqlxwr@pollux>
 <CAGSQo02nP8MT8q-_gQwjUGFNSyiW2AKOQ3V4yy9jofDzjc0SpA@mail.gmail.com>
 <CAGSQo017FgGmStYxLX7JeqV+AcMUMjmnxF6KBesFhc31BieBbw@mail.gmail.com>
 <d61e11e2d99659cf13d0e20f56afe319720d03b7.camel@nvidia.com>
 <CAGSQo02-vYG-hkP2VXBVX9Lp8+=gxkyKh7TAYkAYhpiz6gj54w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo02-vYG-hkP2VXBVX9Lp8+=gxkyKh7TAYkAYhpiz6gj54w@mail.gmail.com>

On Wed, May 14, 2025 at 03:42:46PM -0700, Matthew Maurer wrote:
> On Wed, May 14, 2025 at 3:40 PM Timur Tabi <ttabi@nvidia.com> wrote:
> >
> > On Wed, 2025-05-14 at 15:32 -0700, Matthew Maurer wrote:
> > > One further possibility here, which we'd need Greg to weigh in on - we
> > > could add a method to the debugfs API intended for Rust usage which
> > > specifically releases a directory or file *without* releasing any
> > > nested elements. This would mean we could get rid of all the lifetimes
> > > on directory and file handles.
> >
> > I had a conversation with Greg about this topic just the other week.
> >
> > https://lore.kernel.org/linux-doc/20250429173958.3973958-1-ttabi@nvidia.com/
> >
> > There are two versions of debugfs_remove:
> >
> > void debugfs_remove(struct dentry *dentry);
> > #define debugfs_remove_recursive debugfs_remove
> >
> > Unfortunately, the direction that we've been going is to get rid of debugfs_remove_recursive() and
> > have drivers only call debugfs_remove().
> >
> > What would solve your problem is doing the opposite: making debugfs_remove() be non-recursive and
> > require drivers to call debugfs_remove_recursive() if that's what they really want.
> >
> > Maybe we need debugfs_remove_single()?
> >
> 
> Yes, having access to `debugfs_remove_single()`, if it has the
> properties I would expect (namely that the kernel objects for
> inaccessible directories continue to exist, they're just not reachable
> through the VFS) would allow this design. It's not obvious to me if
> it's the design we want, but it would enable that design.

Ick, no, we got rid of debugfs_remove() only removing a single dentry a
while ago as it was causing problems.  Let's not go back to that at all.

This shouldn't be all that complex, it's supposed to be simple to use
and reason about.  If you create a directory, you can "own" it until you
drop the reference and then it, and all files/subdirs will then be
removed.  I like that logic much better than what we are stuck with in C
where we can create a directory but then be forced to remember to look
it up later to remove it when finished.

Ideally we can migrate the C code to be more like the rust api in the
future as that should be easier to deal with over time by driver
authors.

thanks,

greg k-h
