Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660BB1CD1F;
	Thu, 24 Apr 2025 00:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745455449; cv=none; b=Zc9ybV9gGQ1DUu3YiA9dQR43JTXjRywar4zu3+DZr4u7YMDPBVd/Mg/7hWm93xiiuNtIpvMN9sjy0ENZqZqIWrbJfU9A6PbXQAnU76Bapf5ZpqbrXGVV1qgs1CqSQC70rJDn7vFo2fYrTDORj6nfBDtxAZ80jGYvHnCNiGHvTYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745455449; c=relaxed/simple;
	bh=9RqTBVvafFjbkjBVSdY6jeYYwZvIr/H3q0ESUZUpBEE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G51eJIX1B/gaG2Ryfnxs3dPf35KtaaxAl1fTHFSXE2WMf7unGNxxsF8NRs2a3WNZtrGMdQgCRVji8U50+OwUyWYv70RhFECK0MmcI3HXQRS0sO49rgZmdka4ng5+y2Ks1Kx+IS0pIajwA2I1mSh3FtdCiCqQC/S8t0WFcWiv9X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTb24ePK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTb24ePK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57FEDC4CEEA;
	Thu, 24 Apr 2025 00:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745455448;
	bh=9RqTBVvafFjbkjBVSdY6jeYYwZvIr/H3q0ESUZUpBEE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YTb24ePKqA7OB68SC3BHkiV/rJR69IaSgpfyXzwBwGzwTSvm4yNuY+e8TbHTLKwZK
	 f22XqAwdfvoQHJbz4WDrRpCI5GL+S7nVrUWYXcHcF/twsMwS+0iI6pT55KKIUopox3
	 mU8RDYAlYonHIbvd4sLKlu6v+tOIbminefcraDL2YEYzGb1PJd4EedNg+XZaFo0fow
	 zr+l/k+sBwiCfXc1kZPAMYM7RZm9PDjqVecI8F1t3+OQKqvpbuT1Cz+NDJ2hBB8CBK
	 tKBgRtv5HDDHRGPzfvWCYDNqOtrEvGUHAW9tEiQVZ2qXF98WDZQbJ1gffplNsFOUqT
	 a/k2AdeDVTIjw==
Date: Thu, 24 Apr 2025 08:43:58 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Improve Sphinx kerneldoc extension
Message-ID: <20250424084358.1cfc1455@sal.lan>
In-Reply-To: <87jz7dxvgu.fsf@trenco.lwn.net>
References: <cover.1744685912.git.mchehab+huawei@kernel.org>
	<87jz7dxvgu.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 21 Apr 2025 11:42:09 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Hi Jon,
> >
> > As promised, this series improves the Sphinx kerneldoc extension making it using the
> > kernel-doc.py classes directly if available.
> >
> > The script still supports excecuting kernel-doc via shell, and, in verbose mode, it will
> > show the command line arguments to run kernel-doc manually, even when the Python
> > classes are used. The idea is that the command line verbose will help to eventually
> > debug issues if one needs to run kernel-doc.py manually. 
> >
> > On other words, after this series, if one does:
> >
> > 	make htmldocs KERNELDOC=scripts/kernel-doc.py
> >
> > Or, simply (as internally KERNELDOC is set to scripts/kernel-doc.py):
> >
> > 	make htmldocs
> >
> > It will use the Python classes instead of running a subprocess.
> >
> > If one uses, instead:
> >
> > 	make htmldocs KERNELDOC=scripts/kernel-doc
> > or:
> > 	make htmldocs KERNELDOC=scripts/kernel-doc.pl
> >
> > As the file extension doesn't end with .py, it will excecute the Python or the Perl
> > version of kernel-doc via a subprocess.
> >
> > On this version, I opted to re-create the Python objects for every single kernel-doc
> > line, so no caches from past runs are used. I'm working on a version that will cache
> > results, but it is currently causing some regressions. So, let's do the changes
> > step-by-step, applying first this improvement patch series.
> >
> > PS.: the first patches on this series are addressing some some bugs and one
> > improvement that I noticed while debugging the patch changing kerneldoc
> > Sphinx extension.
> >
> > Mauro Carvalho Chehab (4):
> >   scripts/lib/kdoc/kdoc_files.py: don't try to join None
> >   scripts/lib/kdoc/kdoc_parser.py: move states to a separate class
> >   scripts:kdoc_files.py: use glob for export_file seek
> >   docs: sphinx: kerneldoc: Use python class if available
> >
> >  Documentation/sphinx/kerneldoc.py | 138 ++++++++++++++++++++++++++++--
> >  scripts/lib/kdoc/kdoc_files.py    |  11 ++-
> >  scripts/lib/kdoc/kdoc_parser.py   | 119 ++++++++++++++------------
> >  3 files changed, 200 insertions(+), 68 deletions(-)  
> 
> I've applied the series.
> 
> I do note that the default "make htmldocs" build time is reliably slower
> than with KERNELDOC=scripts/kernel-doc, I'd be curious to understand
> why.
> 
>         External kdoc:  170s
>         w/classes:	186s

I noticed that. My guess is that this has to do with Python's big lock
(GIL). When it uses processes, there won't be any internal locks, as
kernel-doc will run independently. There is an effort for Python to get
rid of GIL, but it seems GIL-less threads won't be default on version 3.14.

-

That's said, please notice that I intend to work on some patches that
will optimize that. Right now, on some places, the same file is processed
multiple times. By using the classes, we can cache the processing results
the first time and then re-use them every time a kernel-doc tag for the
same file is found within Documentation.

This is easier said than done. I did one attempt to do that, but it ended
causing troubles. So, I'm working on a new version of it.

Regards,
Mauro
