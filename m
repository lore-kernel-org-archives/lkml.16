Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5382AEFD;
	Sun, 22 Jun 2025 21:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750629057; cv=none; b=WozOWstX8Ci0QjjBbgdigch5MF/XWAGyhDWDhh4mMpCpck4lfPwS0FLMm27XcRG1D8BdGo1TSrXO+WeW+TMcaf1K3Ba2G92cem6Z9ixfOCnfTLUigf0ayWf2mDf0RS2RTLr+j/fs3Bgu0kv1K/U9aI2BOUwiNbgopVnwC3JCyhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750629057; c=relaxed/simple;
	bh=frdPYxCj18DQDvdQK20a0LWeLfpgZmyklV7JLc+bVMs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WVaDaFGoyPdNk0k5v3juwZDsmjUPMGTC+QUZymrxWES8PAb0+xv/OB00CyvXdOKwN76IDogT8PT33ZuyfEIbMhshHCH1p6RQ/KFWISKNiEOzX3kJXhDaNNC7yYgm3ir0Zikyza36YwSEc6jQ5QQDj0XjVS8CsVyMoQSs4oYOpTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qQnZprVk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQnZprVk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE10AC4CEE3;
	Sun, 22 Jun 2025 21:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750629057;
	bh=frdPYxCj18DQDvdQK20a0LWeLfpgZmyklV7JLc+bVMs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qQnZprVkfOrvy+AuWmGZkh0o/Hw++L1WvPiZ+8tssbTOAmLTZj4oy9UZXj2LdI9om
	 BFOhmA67GWKuDnQehlUNZgSdNyISr+LK74zwCzYu3IfWW3T91WP66TnTYUuq8Aa+lo
	 gHocm1aCHmvg7DRx81JUlhhGngFHarNBi7h2Kt0Kf8qkRCLt7ZMR0Ih2A1SJAfVGcW
	 d3KVwtgLkAzwz5pXXsGHPMT2p51FiHIsQdEJ4QUYcFWHl4yTyGpvjYVD+1MejJhMet
	 UwksGrRUggyzVbW71WqROtagPzRMox6nbzqNHTAa6XwA3gXMTa3MbTfL1SZI8Zx7lM
	 R3wbDl/PEFtuQ==
Date: Sun, 22 Jun 2025 23:50:52 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Akira Yokosawa <akiyks@gmail.com>, linux-kernel@vger.kernel.org, Linux
 Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 15/15] docs: conf.py: Check Sphinx and docutils
 version
Message-ID: <20250622235052.05804137@foz.lan>
In-Reply-To: <87v7ona3z7.fsf@trenco.lwn.net>
References: <cover.1750571906.git.mchehab+huawei@kernel.org>
	<972673b0a5bf5537d47780d6f8e70ae45456e751.1750571906.git.mchehab+huawei@kernel.org>
	<c05dd5dc-1e30-4a2c-80dc-70e8b62cc681@gmail.com>
	<87v7ona3z7.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 22 Jun 2025 14:58:04 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Akira Yokosawa <akiyks@gmail.com> writes:
> 
> > On Sun, 22 Jun 2025 08:02:44 +0200, Mauro Carvalho Chehab wrote:  
> >> As reported by Akira, there were incompatibility issues with
> >> Sphinx and docutils with docutils 0.19. There's already
> >> a fix for it, but, as there are incompatibility issues with
> >> different versions, better to add a check to verify if the
> >> combination is supported/tested.
> >>   
> >
> > I've been skeptical of adding such checks in conf.py.  
> 
> I have to kind of agree with this concern.  We have managed without this
> complexity so far.  It looks like we could always be behind on
> maintaining it going forward.  Do we *really* need this one?

IMO having a check is interesting, as the dependency between
Sphinx and docutils is high. Yet, with the testing script, this may
not be needed, provided that we run it to check if changes at Sphinx
extensions won't cause regressions. Still, the dependency check
at test_doc_build.py is not complete.

Anyway, if you prefer, don't pick this one. We can revisit it later
when needed.

Thanks,
Mauro
