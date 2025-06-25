Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369BDBA42;
	Wed, 25 Jun 2025 20:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882741; cv=none; b=pP2cNdlv7Rhbk9Bc+8pwftmkuBjJFVERvf7URqYj/BQDMbtF/HCWLRNCZVXEnzbZfiTsDhhV3dMT8LrBNkLhprPAFRihgUnS3CzpOOOvBIZ2q/UfbhSJUevWtW7UPnrTJRYkIHf76uIyG3PEBEjZjH72GUxPN/cPh2Cmv04Hb5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882741; c=relaxed/simple;
	bh=X8y57/DSW13hsUqIu35etDFyp3CqHDXuhzGZsw7USn8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KYiv44k12xpylyupczzq9RyQrzzJkNx7Qou5gB3AwC4fif6oI2Hl3z63WLrLSLlwfu9RrCK5EuYsoGZ7fa/66AvqQRPtDs5FInaQkx7MvmiuuE90ildg95/anztlKR6f2eOoZB4q8F22v1zgzbtoLnjaCvKv22VNLXDOgH+lOOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a51YSCHQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a51YSCHQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25B0C4CEEA;
	Wed, 25 Jun 2025 20:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750882740;
	bh=X8y57/DSW13hsUqIu35etDFyp3CqHDXuhzGZsw7USn8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a51YSCHQhHhdIMc516ezsCyhdueG+iqHxYodRZwY89LIUGcy2x/jFe0i9V4yaheZl
	 Y7fDhgPPVr28mjujzOSvTvmEbx/nYxo79ZhyWjcbetxXEnmKgv3y03HZAQg6k+CoW7
	 RnIO66fwWygKitmSCM7NwMn87aTDVlTizmrs9/CLt1J6/Hnw0pqRPRoJiUlp3oAm7I
	 Te+UM8oOLOe2pzxhtUL1AMc6w5Duu7MAGf/Xn0RrCc2zrtp2tolTY04I8NdeNwp7rS
	 anMcbNah+UKFyaTgUlGcDUMnLQc4JsdGLlda2aAFbwb4NAGTI5ZAHRG4I3ELBlFpAM
	 A4wxB5OI4g8Dw==
Date: Wed, 25 Jun 2025 22:18:56 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Akira Yokosawa <akiyks@gmail.com>, linux-kernel@vger.kernel.org, Linux
 Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 15/15] docs: conf.py: Check Sphinx and docutils
 version
Message-ID: <20250625221856.326e5ce6@foz.lan>
In-Reply-To: <875xgjacr2.fsf@trenco.lwn.net>
References: <cover.1750571906.git.mchehab+huawei@kernel.org>
	<972673b0a5bf5537d47780d6f8e70ae45456e751.1750571906.git.mchehab+huawei@kernel.org>
	<c05dd5dc-1e30-4a2c-80dc-70e8b62cc681@gmail.com>
	<87v7ona3z7.fsf@trenco.lwn.net>
	<20250622235052.05804137@foz.lan>
	<875xgjacr2.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 25 Jun 2025 12:37:37 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Em Sun, 22 Jun 2025 14:58:04 -0600
> > Jonathan Corbet <corbet@lwn.net> escreveu:
> >  
> >> Akira Yokosawa <akiyks@gmail.com> writes:
> >>   
> >> > On Sun, 22 Jun 2025 08:02:44 +0200, Mauro Carvalho Chehab wrote:    
> >> >> As reported by Akira, there were incompatibility issues with
> >> >> Sphinx and docutils with docutils 0.19. There's already
> >> >> a fix for it, but, as there are incompatibility issues with
> >> >> different versions, better to add a check to verify if the
> >> >> combination is supported/tested.
> >> >>     
> >> >
> >> > I've been skeptical of adding such checks in conf.py.    
> >> 
> >> I have to kind of agree with this concern.  We have managed without this
> >> complexity so far.  It looks like we could always be behind on
> >> maintaining it going forward.  Do we *really* need this one?  
> >
> > IMO having a check is interesting, as the dependency between
> > Sphinx and docutils is high. Yet, with the testing script, this may
> > not be needed, provided that we run it to check if changes at Sphinx
> > extensions won't cause regressions. Still, the dependency check
> > at test_doc_build.py is not complete.
> >
> > Anyway, if you prefer, don't pick this one. We can revisit it later
> > when needed.  
> 
> I've left it out for now, but applied the rest of the series.  Keep it
> around, we may yet decide we need it...

Ok, I placed on my scratch tree on github, on a separate branch:
	https://github.com/mchehab/linux/commits/check_sphinx_at_conf_py/

The patch is here:
	https://github.com/mchehab/linux/commit/178f37fce4aa16592b0c0b567ea0ffca744c3af5

(I'm documenting here just in case we forget and need it again ;-) )

Regards,
Mauro



> 
> Thanks,
> 
> jon



Thanks,
Mauro
