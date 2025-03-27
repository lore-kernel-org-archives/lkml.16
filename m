Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41151C6FF7;
	Thu, 27 Mar 2025 16:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093404; cv=none; b=E5+zMJ5jR/mnPf8XhoM3/Hd+xUn3V/cFHG5pvKiwtLkvDGDi4dm9jPsPAx514qUR9XO84nIQP1x/WS+fEh8g+ovUXVFtSU5JD+/7FvbWfeBWobjU60xduYfvgHQqkTFGfW0yMkp34p0HE2GI8J+vWpCJyCsoofd4ICEc103ei5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093404; c=relaxed/simple;
	bh=j0mMLvorA5XFvhHSz10MFJydR5oBrtz6w9zAXJHNFsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOChzSB3Njr9n7fzyAOHoU407gZTpgPD+EZhiBHmNg2UU51HKwVyyQ5Pe93TKF9eTB+TivrJDSlpmsi2H4KHlZkxYdyeAD4HHXxF6qMoous8URBqCsaEVRe8OjNhPxl53qq8IlVzWUejBmgLEGzofxxouD/5xnSjip5U8KKLKfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6lqXrCh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6lqXrCh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA33C4CEDD;
	Thu, 27 Mar 2025 16:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743093403;
	bh=j0mMLvorA5XFvhHSz10MFJydR5oBrtz6w9zAXJHNFsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I6lqXrChwblssdZ4Vt36W0FP54PtCwjSaiM/LNvRHeYLfZkhnAr1N7RKLNJXIpuJo
	 irlDhbvqiRw1bbFSdpkI11Fwt8EogyrXaSfOnOpHlC7AJ5sl9ORutFW8/NC1TgGKmE
	 83PNSpzeCP7eg0EdN+PzSdkZAdcvHRaOrLdSrv+EKJ/VzDX7QPeY6EvwQmg0cLd47i
	 wCppq4aJUs60bfhsLxG5GLP+RH3hBqZmRuJK0SzPozwN0du36aikVByEHgeiJrc3bQ
	 bkQodkBxmEDjo/pel/HFMlM9MZbZY2zM10RLFraJrnXeEb7qdOtVOmqdwQvKnGhH5O
	 pNWkDR4TYFfpA==
Date: Thu, 27 Mar 2025 09:36:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org, David Binderman <dcb314@hotmail.com>
Subject: Re: [PATCH] arm64/crc-t10dif: fix use of out-of-scope array in
 crc_t10dif_arch()
Message-ID: <20250327163641.GA1425@sol.localdomain>
References: <20250326200918.125743-1-ebiggers@kernel.org>
 <CAMj1kXHCJQ4-KAPpWFA-rqjogbebUP8Y=NKrdEB1ZmSbKG3bdg@mail.gmail.com>
 <CAMj1kXHzonmwoji49sCSJ__0ZwhfqBDVxBPJsgywbTTZ2Q=hBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHzonmwoji49sCSJ__0ZwhfqBDVxBPJsgywbTTZ2Q=hBw@mail.gmail.com>

On Thu, Mar 27, 2025 at 09:28:51AM +0100, Ard Biesheuvel wrote:
> On Thu, 27 Mar 2025 at 09:15, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Wed, 26 Mar 2025 at 21:09, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > From: Eric Biggers <ebiggers@google.com>
> > >
> > > Fix a silly bug where an array was used outside of its scope.
> > >
> >
> > Yeah - mea culpa.
> >
> 
> Ehmm - tua culpa, actually :-)

Yep, your original code was correct and I messed it up.

- Eric
