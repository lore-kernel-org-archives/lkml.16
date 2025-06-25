Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8817C267F4C;
	Wed, 25 Jun 2025 20:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882321; cv=none; b=Jh/883BZC5rGE9EcMOYMY3yuU8sv2zr7pr01yiaa7xczf1DFlIfgvC7NbFJS7g5aeR7UykZTK7L4+DMHcqM24ilZTYlGTLsMWcu9B7puIYKlOhQsg/xb6tesblGLmp+Q0sP8LcGDQ/owmwsQ6JLExWdLQ/TiHA00wlBZLVKZQRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882321; c=relaxed/simple;
	bh=Vg2kBab2RuRUYS+nh9VZPVTby+pp8O2VeLFPZnO03yc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wq2z4YD3K5Gff/Vwu8lXrXJ86K96HmCFxSa8a20NSG3XltDCrXCA5W/UPA4PGh6RygAw2vfwFDbGUmaW1/cn//vJbf+1T/EAJn/a5OHqUUqHEwrmhDP4YfG71vLBh3XPufccEGOm/u/B34Sh8iD6cTsC4Q05q5CrvKrYeYdQ4y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5QCnheH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5QCnheH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1232C4CEEA;
	Wed, 25 Jun 2025 20:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750882321;
	bh=Vg2kBab2RuRUYS+nh9VZPVTby+pp8O2VeLFPZnO03yc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q5QCnheH6qDGuNCmGWNr62UNw21hFkJqU/1ijpAzUIl5MCXDlwOrLQAPZlSctCXw/
	 fALSJcwtdys72d+ZdbHmjA2dV5f5b74vz7neJzreEVjeK99p6BZ/VZJvPQuFGhjULf
	 zNPVbjB+cj/gLGW9xLprH6pCblKWXgqeIVBr+weUlRph+4hjv+tR633yIKvO+2P2en
	 NcbXFqfmfYwnta8TNUQW/uD7hpe6XXJFbRLQWldNTOft0gw9the4T6ViQAP2gdgQ4C
	 hD5aYHTcXdmVLl70Stzq1ZhlPG4HujYcvBT2Ahe+IFBtKI1QX/D1u912FPGUep4lxE
	 QcP49WZzA+sGw==
Date: Wed, 25 Jun 2025 22:11:56 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Akira Yokosawa
 <akiyks@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: sphinx: add missing SPDX tags
Message-ID: <20250625221156.6f671e0f@foz.lan>
In-Reply-To: <871pr7acle.fsf@trenco.lwn.net>
References: <1a62226c5fe524eb87bdb80b33bc7ec880a68880.1750585188.git.mchehab+huawei@kernel.org>
	<871pr7acle.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 25 Jun 2025 12:41:01 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Several Sphinx extensions and tools are missing SPDX tags.
> > Add them.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  Documentation/sphinx/cdomain.py           | 1 +
> >  Documentation/sphinx/kernel_include.py    | 1 +
> >  Documentation/sphinx/kerneldoc.py         | 1 +
> >  Documentation/sphinx/kfigure.py           | 1 +
> >  Documentation/sphinx/load_config.py       | 1 +
> >  Documentation/sphinx/min_requirements.txt | 1 +
> >  Documentation/sphinx/parse-headers.pl     | 5 ++++-
> >  Documentation/sphinx/requirements.txt     | 1 +
> >  Documentation/sphinx/rstFlatTable.py      | 1 +
> >  9 files changed, 12 insertions(+), 1 deletion(-)  
> 
> I've applied this, but the patch led me to wonder...

Thanks!

> 
> > diff --git a/Documentation/sphinx/cdomain.py b/Documentation/sphinx/cdomain.py
> > index e8ea80d4324c..3dc285dc70f5 100644
> > --- a/Documentation/sphinx/cdomain.py
> > +++ b/Documentation/sphinx/cdomain.py
> > @@ -1,4 +1,5 @@
> >  # -*- coding: utf-8; mode: python -*-  
> 
> Do we really need these lines?  UTF8 should be the default almost
> anywhere, and Emacs understands that a .py file will require Python
> mode...

Heh, I had the same filling when I saw that. I almost dropped ;-)

perhaps we could run some linters on it and so some cleanups,
inclusing the removal of those, placing instead some copyright
notes on the top of it... well, there are already copyrights there
(and at the other Sphinx extensions). In this specific case:

"""
    cdomain
    ~~~~~~~

    Replacement for the sphinx c-domain.

    :copyright:  Copyright (C) 2016  Markus Heiser
    :license:    GPL Version 2, June 1991 see Linux/COPYING for details.

So, not sure about it. What do you think?

Thanks,
Mauro
