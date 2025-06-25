Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385DB285C9F;
	Wed, 25 Jun 2025 18:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750876661; cv=none; b=lf/r+dqa1w38SB9EfPKf+0swkk1ZoOl0Avw0S6mwQjpf4VnnMLrYFyVLKxLE64XvcSUMzjUiUZFW97+kmpiV+q8gzGlMLd38B9Su80Q52rc1hatdV4Uim+QE9qAVI/r6z6S5s+P9F3OoaXoqlbNTLiw3uCwD5tursVuMFXdy/Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750876661; c=relaxed/simple;
	bh=k2sJYG8NaOsjUJqqYSHVdnn4nS1nM6aOGXvJkILoxjw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pp27joOPnaJJ706yqIjcVFeNyPDPHK60kLgI30cVwXmKq45IEBheiKwmIEbC9o7W9SJ6XaxUFh2Xv76yywyBCuWJq1JJ03HUbfSObQs+lCUGOZaYF75f/nyhfAtWn9oYC9sAouSM7+ICNgBvDEfzs6ze3vXKkNBMYMxxNzE0888=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ZDETtbEy; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ZDETtbEy"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2579940AB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750876658; bh=+Zt8DtoRnxpBCBNrEG4Kials1Bl4NmdCHgUsjOo21Qw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZDETtbEyD1cMUt5m2zllYq8IkKPY/q5usVljq1la96Bz2WmA2iq5oPTRfTuh5fCa4
	 dpcKaN9CAU6oema7742aC6DHZBJBOEjZaWrSfl7Sf3L5E4fF7TkZi0uccUV1tw2d4U
	 uUHVJRdKvNisKi+Hm2KqsY1BBWNJrtN7xZn8ZeIDtyOQk5l/kf0B0sQ0e3Un1zm8iC
	 zu7FE8gbxc0kIEbWD3MPEA1ncLY2qwDNfYNiqpBXABLI5g4CUtkiuiwPdFh2/crzX3
	 PsRfhnnaRJV5RONkwHoTzh8xd4QfQ1IJgV58NbBPf5zw196Ps0RbVdB4jNN2TYqqJx
	 CBuXWQsSi83ZQ==
Received: from localhost (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2579940AB1;
	Wed, 25 Jun 2025 18:37:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, linux-kernel@vger.kernel.org, Linux
 Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 15/15] docs: conf.py: Check Sphinx and docutils version
In-Reply-To: <20250622235052.05804137@foz.lan>
References: <cover.1750571906.git.mchehab+huawei@kernel.org>
 <972673b0a5bf5537d47780d6f8e70ae45456e751.1750571906.git.mchehab+huawei@kernel.org>
 <c05dd5dc-1e30-4a2c-80dc-70e8b62cc681@gmail.com>
 <87v7ona3z7.fsf@trenco.lwn.net> <20250622235052.05804137@foz.lan>
Date: Wed, 25 Jun 2025 12:37:37 -0600
Message-ID: <875xgjacr2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Em Sun, 22 Jun 2025 14:58:04 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
>
>> Akira Yokosawa <akiyks@gmail.com> writes:
>> 
>> > On Sun, 22 Jun 2025 08:02:44 +0200, Mauro Carvalho Chehab wrote:  
>> >> As reported by Akira, there were incompatibility issues with
>> >> Sphinx and docutils with docutils 0.19. There's already
>> >> a fix for it, but, as there are incompatibility issues with
>> >> different versions, better to add a check to verify if the
>> >> combination is supported/tested.
>> >>   
>> >
>> > I've been skeptical of adding such checks in conf.py.  
>> 
>> I have to kind of agree with this concern.  We have managed without this
>> complexity so far.  It looks like we could always be behind on
>> maintaining it going forward.  Do we *really* need this one?
>
> IMO having a check is interesting, as the dependency between
> Sphinx and docutils is high. Yet, with the testing script, this may
> not be needed, provided that we run it to check if changes at Sphinx
> extensions won't cause regressions. Still, the dependency check
> at test_doc_build.py is not complete.
>
> Anyway, if you prefer, don't pick this one. We can revisit it later
> when needed.

I've left it out for now, but applied the rest of the series.  Keep it
around, we may yet decide we need it...

Thanks,

jon
