Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892F51E50E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 12:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748954549; cv=none; b=JbW+HCwrfohO68Frle9QQKuwrPLBMV230y7rPZ0h69QWYAZSLN0QTcqjrSTOdyBmLqzDJ0Nq17NQytyjvubMAOTz8a5tIZ9+bPUFF1ikRmcxv5Eu6DI+rpZw9gxQ+cXgAjIUC4DsvqyI+nXAyQii+V9YDpOhheDrRcB4pi+nFS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748954549; c=relaxed/simple;
	bh=Wi0bQXD9iEyqKKdWx4k+lzCN8Qu5VXnygUi6A9NfCqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEuRbXQXbL98NDaW2G8kncdcxhSylz2n/PiSibDCqrNKl0SVkNlCQ+Jl7CMx0YNtc7y52IT88PwhoTptfteMyH6NihKtmSn271THMie2BhVarfyd+ZsbLX0CNKkIjrBRx4/bkvfDuVhCKEY37OJbbDZDZbXFTJCfC5J2pQj69+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6mm+Goj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6mm+Goj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DDBC4CEED;
	Tue,  3 Jun 2025 12:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748954549;
	bh=Wi0bQXD9iEyqKKdWx4k+lzCN8Qu5VXnygUi6A9NfCqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E6mm+GojNvd/FE0Z95zzcva8wD32vwj1c7GEQ/C/2pgj0mKgHjaHxFknvgFG/RCF3
	 cPtSy9nohvVBBkTW3UV/1IUP92VUGByozS3RS0ErlPDHVcFiFnAwkzZfycHWzcoIUn
	 4lZg/b/bqBABcFH77wFsKSquRQyiGG3kwLyIulOdDzOrDETCJ70JniO4sDCw8XMpTF
	 RVDU1W1kibyLVC1krN3y1oZEQIWLdpxwcWtl59WJME+4aam7Pb0ktYc5dK4qm1SVbV
	 yG/HGvbcOv/nvRAJpGOOZd0KXXnGHwNf8oWKxWEVUsapyCeSKXzRq8Gf0sl5lv85xI
	 kzBrx0XvwzcJA==
Date: Tue, 3 Jun 2025 14:42:23 +0200
From: Christian Brauner <brauner@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	Eric Biggers <ebiggers@kernel.org>, Ingo Saitz <ingo@hannover.ccc.de>, 
	kernel test robot <oliver.sang@intel.com>, Marco Elver <elver@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
Message-ID: <20250603-einnahmen-redefreiheit-df3db181d8b6@brauner>
References: <202505310759.3A40AD051@keescook>
 <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
 <156567EE-E5BB-43C4-B5A6-439D83FF387D@kernel.org>
 <CAHk-=wjktqa94u_=++YX7XxUr57iLAs1GqtHPOY-o-N0z7wyeA@mail.gmail.com>
 <202505312300.95D7D917@keescook>
 <20250601-pony-of-imaginary-chaos-eaa59e@lemur>
 <CAHk-=wgcQdD0UzMJrNhQuYAC2wgGtfrCry_iokswaEE5j7W9YA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wgcQdD0UzMJrNhQuYAC2wgGtfrCry_iokswaEE5j7W9YA@mail.gmail.com>

On Sun, Jun 01, 2025 at 10:12:02AM -0700, Linus Torvalds wrote:
> On Sun, 1 Jun 2025 at 07:40, Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > On Sun, Jun 01, 2025 at 12:42:14AM -0700, Kees Cook wrote:
> > > Okay, reproducing the "b4 trailers" steps:
> > > ...
> > > ### Try to update 8c2bb7d12601 with the Acked-by from the list...
> > > $ b4 trailers -u https://lore.kernel.org/all/CANpmjNPpyJn++DVZmO89ms_HkJ0OvQzkps0GjCFbWkk0F+_8Xg@mail.gmail.com
> > > Finding code-review trailers for 39 commits...
> >
> > Yeah, this is danger territory, because you're asking to update a random
> > commit in the tree history.
> 
> So the *real* danger territory is lying about committer information.
> That's the thing that *no* standard too should ever do, and what made
> me so upset.
> 
> Konstantin, can you please fix b4 to never *ever* rewrite a commit
> that has different committer information than the current user?
> 
> I don't think this is about "39 commits down". This is apparently b4
> just doing plain bad things, adn it would be bad even if it was only
> rewriting the top-most commit.
> 
> Setting authorship to somebody else is normal and expected: "author"
> is about giving credit.
> 
> But setting *committer* information to somebody else is not about
> giving credit, it's about lying. Tools that do that are broken tools.
> 
> I'm also not clear on why apparently the script tries to retain
> committer dates. That's also just plain lying.

Fwiw, this has happened to me with b4 multiple times before so I've
stopped using b4 trailers -u. Whenever I do end up using it I look at
the base that I was using to make sure that only things got rewritten
that I expected to be rewritten (b4 is excellent though).

The last time this happened was when I did the struct kmem_cache_args
rework a few months back. Vlastimil and I ended up sharing a common base
and then he complained that something was off with our shared trees. He
later emailed me and we figured out that it was the b4 trailers thing
again iirc.

I do test-merges before I send stuff out and that's usually how I catch
stuff like that.

But for a while I was really confused how trees I had somehow ended up
being rewritten and it took a little to figure out that it was the
trailer auto updating which caused it.
