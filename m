Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06053C26;
	Sun, 22 Jun 2025 04:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750564819; cv=none; b=AvaNm4WyWM13Vx0Hs5w2Ge1NEm7hCJ/qToChlMkvCt1g5YOA7FTBKRzkstcFwvCnEft8smS6xVnzyj01k/6anIuWTV9wICAwjXFi1pFXgyZVXLThXjoC+rPRueW7CzHVrw6Dae1eXYfIvfFYCtiYapP1o4aAmQLs5xO6w+9lzeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750564819; c=relaxed/simple;
	bh=Bj5tCFlLrpYqI7xI3syHC6TdfXakVcWYHZXiRLdax1k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kLSRkL+fnkYO2QhAo8FzymIrvyYBSgKk1vI1XLCXmYdI2pDA/PR5cesN4M9GAStqgFQEJKjwNFoTNOusrc8Rsjm8HFtu3cNVya3aZMsYViKvN0Wnarc3413FZ47Y50Vh845dKAd84qTmlA4KmMUpUmOwJ8+gTAWyKsB4Fnn4/FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QreCmsV4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QreCmsV4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67FDFC4CEE3;
	Sun, 22 Jun 2025 04:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750564819;
	bh=Bj5tCFlLrpYqI7xI3syHC6TdfXakVcWYHZXiRLdax1k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QreCmsV4RpO/7R2mOWg9L7GInDAZVyq7lJ0ZgCqzvs9qHtngJyUtBgRwgr2JhxvaI
	 8KndVqIGzB4nqjeVN8tLmftpKNjfD0mdGU8nOsbO4iHxbo00Q87K6rm3OFlC1jYJ3A
	 xZ2Wl5zaGAeA0NT97d/8dKATFkvPe3N5dFrMuLuGMEVgWS8s8SGekEDo7isHyHr5kH
	 NWYSMuI2uQmi1KzgUxUYkQJMzPfYFHcYmnxJ4xephN+n5s3HHx9Dfsa+7KmX+fC36v
	 LA+c7PzKtFQ4E7TsA8hb7g4qWgxnLnY7V/4EGsNdfUr6ycTBZH2+pbUQgEczaf3MDM
	 wv6+uF/Hlj4xA==
Date: Sun, 22 Jun 2025 06:00:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH 0/6] Some improvements for the doc build system
Message-ID: <20250622060015.76a0b29a@foz.lan>
In-Reply-To: <87ldpkdgv6.fsf@trenco.lwn.net>
References: <cover.1750406900.git.mchehab+huawei@kernel.org>
	<87ldpkdgv6.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 21 Jun 2025 13:39:09 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Hi Jon,
> >
> > This series contain some patches from my parser-yaml one that
> > aren't directly related to it. It basically addresses some issues
> > at the build system. It also adds a script that I wrote with the
> > purpose of checking backward problems when building against
> > older toolchains.
> >
> > IMO, the best is to merge and apply it before the YAML series.  
> 
> OK, I've applied it, but ... someday, I think the test_doc_build tool
> should be properly documented and put somewhere under tools/testing.

I added a better documentation for the tool at the v2.

With regards to move to tools, I'm not certain about it as I can see
advantages and disadvantages. 

Creating a new directory to have just one tool on it seems overkill
to me. Also, it is easier to type "scripts/..." than 
"tools/testing/build/..." :-)

There is another aspect: while doing conf.py and Documentation/Makefile
cleanup, I noticed that there are still lots of hacks inside them,
that are there from the early days when we adopted Sphinx. Perhaps
it could make sense to move part of the logic there to this new
build tool, which could, for instance, replace the logic inside
scripts/sphinx-pre-install and get rid of some magic at the Makefile
like the one which handles SPHINXDIRS.

So, at least for now, I would prefer to keep it under scripts.

Thanks,
Mauro
