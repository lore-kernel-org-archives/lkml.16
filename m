Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D42191F77;
	Fri,  9 May 2025 11:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746789467; cv=none; b=q+uNlPY68rBWQ9DTWlM70g7T5U9EK0xO0rManJWgMvRyOE4L7Fle+V6FkL9PuOBaCooMAETpj+Pa4ARk5X62MNJB8CoETYxtCBGtTV5PZLg5SsIJRmLuQC6Ti7UI3tQRX8MB7p3lcxoYaZbzfu4CDibpdVMVxeOOJh1HstHt/1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746789467; c=relaxed/simple;
	bh=5toU20lLPcHpFhmH/fo6ZfSW85f0kYgZLq6AuB/xV4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mn6qqFw4ejNlCQJwJ9i4t8ELMdOh6jHcDYk6FQ1f7QWym7Z6FVo60Q0parEnC1ZZc1HeLcTHYEbvkAUb10/tit3Fmh+4osVY5ZYakiAbwyeuUm9cuiuvbB/aSBCjLbLXBvC8VclTug6LennJMOz8O6ducOXA0CSQWFDN9vSft9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qlrnuZbr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qlrnuZbr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3774C4CEE4;
	Fri,  9 May 2025 11:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746789466;
	bh=5toU20lLPcHpFhmH/fo6ZfSW85f0kYgZLq6AuB/xV4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qlrnuZbrDdMl1LOXEWXmOYAJpjdDqAv6MQvg1k5KaG0HBW1S0JtR/iaFXWXli9wZG
	 +tUnEtTzgB0O48cwF1QBdw0uV95qWfA1eBSsKhl+PcvSO3RSFfrTBS3un5mc/Jvc3k
	 aiyBhi2jSDQC0lg6k0BalpwSnd6xgQBgOvOLsWNpASxNeaYMqDvzyPtDCpqkd827ys
	 brZD5Nd9iPZieQmAHpoycI2B5RcvLPz3KabH5McP0dT71ahCsUm796opsi8c5hHAsp
	 tRi05iqxUiofNpuc/52QY8+yyNKX7NSYrNr3r6sWd1MxOYJYrnx+EpPZwV2LGpPr5a
	 9E8lmt76Eb1Lg==
Date: Fri, 9 May 2025 13:17:39 +0200
From: Christian Brauner <brauner@kernel.org>
To: Omar Sandoval <osandov@osandov.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Sentaro Onizuka <sentaro@amazon.com>
Subject: Re: [PATCH] fs: convert mount flags to enum
Message-ID: <20250509-hebel-medizin-9e4808c9aece@brauner>
References: <20250507223402.2795029-1-stephen.s.brennan@oracle.com>
 <20250507230511.GA2023217@ZenIV>
 <aBvo_-Ee7QQtd3YU@telecaster>
 <aBvwX_QaVgBNpedP@telecaster>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aBvwX_QaVgBNpedP@telecaster>

On Wed, May 07, 2025 at 04:44:31PM -0700, Omar Sandoval wrote:
> On Wed, May 07, 2025 at 04:13:03PM -0700, Omar Sandoval wrote:
> > On Thu, May 08, 2025 at 12:05:11AM +0100, Al Viro wrote:
> > > On Wed, May 07, 2025 at 03:34:01PM -0700, Stephen Brennan wrote:
> > > > In prior kernel versions (5.8-6.8), commit 9f6c61f96f2d9 ("proc/mounts:
> > > > add cursor") introduced MNT_CURSOR, a flag used by readers from
> > > > /proc/mounts to keep their place while reading the file. Later, commit
> > > > 2eea9ce4310d8 ("mounts: keep list of mounts in an rbtree") removed this
> > > > flag and its value has since been repurposed.
> > > > 
> > > > For debuggers iterating over the list of mounts, cursors should be
> > > > skipped as they are irrelevant. Detecting whether an element is a cursor
> > > > can be difficult. Since the MNT_CURSOR flag is a preprocessor constant,
> > > > it's not present in debuginfo, and since its value is repurposed, we
> > > > cannot hard-code it. For this specific issue, cursors are possible to
> > > > detect in other ways, but ideally, we would be able to read the mount
> > > > flag definitions out of the debuginfo. For that reason, convert the
> > > > mount flags to an enum.
> > > 
> > > Just a warning - there's a bunch of pending changes in that area,
> > > so debuggers are going to be in trouble anyway.
> > > 
> > > Folks, VFS data structures do *NOT* come with any stability warranties.
> > > Especially if the object in question is not even defined in include/*/*...
> > > 
> > > _Anything_ that tries to play with these objects must be version-dependent
> > > and be ready to be broken by changes in underlying code at zero notice.
> > 
> > That's totally fine, we can deal with breakages as long as we can
> > reliably detect what version we're dealing with. We can see changed enum
> > values, renamed/removed structure members, etc., so that's why those are
> > preferable. Macros are invisible at the debug info level (since no one
> > compiles with -g3), so those are no good for us. We also avoid version
> > checks as much as possible because backports in RHEL and co. make
> > version numbers mostly meaningless.
> 
> To clarify, we avoid version _number_ checks (i.e., `if (kernel_version
> >= 6.15)`) as much as possible. "Version checks" in general are
> unavoidable, but in drgn, we try to base them on the existence of
> structure members, global variables, types, enum values, etc.

Yeah, that should be fine imho. I know that you're aware that we give no
stability guarantees but drgn is actively used by kernel developers and
that's a change we can accept without a lot of trouble for ourselves.
