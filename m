Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC38C2EB1D
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 21:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748727407; cv=none; b=AGWGVlG+JhRy/LM9QKdoe66pi5bt3/SSbXF1jfRedrokjAyGFeqC9+3UBIvguewakmthDZkXbMVKjN1sFg8Q5iVGPeUPm7JwGPrubrOOCn+UTuJzuKG7LPuLQcV0IZkCDaW6Z3gyCbgmfFYPV/JWMpOzTnTu2F9b3SgG+Ehm5wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748727407; c=relaxed/simple;
	bh=hwIxOmCAKv56BpEH5YNZQKFUXWs9s/y59qGE2ADb7CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIR3i1dOLwOYf0LTz1MZIMhKN4J60AwIjUt0veD9qsIQP/cFzZq4t/Ofxh9TLHVmLmhOtIB0ZQ1QnFcgB45bmXxk/i7wqGXb4nujU0yLOGWTrJvz7Pp0WefyzMCQt4yztJxYKWjMoAq5PRJ6QPqmqYImbDBoJagpSVX67mCEOcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=ljrCHpJg; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="ljrCHpJg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iZ28ndmwT7y3JzFc7uXf7ymmAYmNx3y/DDN2G57aUJE=; b=ljrCHpJg+mKfUUZtHm3hju4Kb6
	FXk3d5Bq2kkz9NzhujVpwCtlv1m9EjQwtaNECT8buc+6nkj28N3dUODytS46bhZFiU4xVzW4SMxAp
	zZsfKMqReVu9EGpteDmsrYb5QDUUzWWfCqX2zu0uV7Gh7x1vYebjBBpS7vJEWUmnY1kt4oQ/b8C8X
	clJIIxq1/h/Z42ze3gAbrTCoC7hdY6OmNNlrq87W8EnSQLtk12BU1w5OA1D9LiqeYhfgufXHl6qJf
	WQS95KyJXy+9FhuUaPJ8sqf1rbl1vhVHrON4K6ExHXj5aMxMr8zsxgJkJfYrDVA2/2PJsTgyHdWbl
	UvXkU0eg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLTsf-0000000Btip-3W5p;
	Sat, 31 May 2025 21:36:42 +0000
Date: Sat, 31 May 2025 22:36:41 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
	Ingo Saitz <ingo@hannover.ccc.de>,
	kernel test robot <oliver.sang@intel.com>,
	Marco Elver <elver@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
Message-ID: <20250531213641.GE3574388@ZenIV>
References: <202505310759.3A40AD051@keescook>
 <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sat, May 31, 2025 at 11:20:20AM -0700, Linus Torvalds wrote:
> On Sat, 31 May 2025 at 08:00, Kees Cook <kees@kernel.org> wrote:
> >
> > Please pull this small handful of hardening fixes for v6.16-rc1.
> 
> WTF, Kees?
> 
> You seem to have actively maliciously modified your tree completely.
> 
> There are completely crazy commits in there that are entirely fake.
> 
> You have this: f8b59a0f90a2 Merge tag 'driver-core-6.16-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core
> 
> which *claims* to be from me, and committed by me, but is very much
> not. It's some garbage you have entirely made up.
> 
> Yes, there is a real commit like that, but it's has the SHA1 ID of
> 9d230d500b0e.

Interesting - looks like a large part of commit graph had been mirrored
with mergetag parts filed off; actual tree objects appear to match...
