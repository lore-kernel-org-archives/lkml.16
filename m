Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4957612D758;
	Mon, 21 Apr 2025 17:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745257334; cv=none; b=FRhnPQbDG4Di/Fd4ea7okeRdTPPWQG++Jj7IQ87N14SgAGIjeGD1JkBwl6fuvMLuNp3uAAmBeOc3kVphJ3D/af1QAOuK0EYx9fpUfCfTqZotb2/J3psUwGGziX3F/MIRDE27uyD3Wx2Sm41Vpno/9pFGuMF6P3JsV/b0Amka4uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745257334; c=relaxed/simple;
	bh=Tcp+W4GOivE/alIkfZcFBn1KNwLFI8yqmnIUl936MWI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=axGq+kcadEsseL0hoI9zOLCYh9jqK5L3GzXbnO0FYiXJnnewtWGxqcWhw5RfM3mOQGrsDzSb1vVLGhM1r8uIGVFlU+pORudSvxiAraoE7sZUKGVCqP64mC8fEhtjD93WGnNSV7Tg9HUvJZfx0jdeSW9RNprXKHZqXGh7TQE2fBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=L3RzMhZH; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="L3RzMhZH"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 40DDB41060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1745257330; bh=kbs5fOEIqoMuSmTCb/0c14ohUB+eNd5Yd+A6QZOfyOk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=L3RzMhZHaFDKZlO8k+JjVnArK6TtC0YGfjyzq6aaYlZonkUMEzHH/Ip84Rn5gsFkf
	 NHuwFjn87dhvG55P5W5ykb7WQwyKndvhOJ58ohkc2b6EFkvKS9qSM0Eu6Wpx5fysDL
	 CM6sXZI7fSo+7j6WUN630LYZ14otSz9BxBFATrzlqY2W+P1D/o2uD+0YfGt11Sf1s9
	 x1zrhPsHEqsHiv3tHYfkUqXCuiPdk3fxsF2FCXBA5WZjxV01u+3HBw6YYpq9GSGpU7
	 YHHoqvOz1dG0E6hqR7zv5VGsbash7+yySGS4XRjEpaWOPFKLAt9X8HV8G9vVVC0lgM
	 DODH7dPyk12AA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 40DDB41060;
	Mon, 21 Apr 2025 17:42:10 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Improve Sphinx kerneldoc extension
In-Reply-To: <cover.1744685912.git.mchehab+huawei@kernel.org>
References: <cover.1744685912.git.mchehab+huawei@kernel.org>
Date: Mon, 21 Apr 2025 11:42:09 -0600
Message-ID: <87jz7dxvgu.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> As promised, this series improves the Sphinx kerneldoc extension making it using the
> kernel-doc.py classes directly if available.
>
> The script still supports excecuting kernel-doc via shell, and, in verbose mode, it will
> show the command line arguments to run kernel-doc manually, even when the Python
> classes are used. The idea is that the command line verbose will help to eventually
> debug issues if one needs to run kernel-doc.py manually. 
>
> On other words, after this series, if one does:
>
> 	make htmldocs KERNELDOC=scripts/kernel-doc.py
>
> Or, simply (as internally KERNELDOC is set to scripts/kernel-doc.py):
>
> 	make htmldocs
>
> It will use the Python classes instead of running a subprocess.
>
> If one uses, instead:
>
> 	make htmldocs KERNELDOC=scripts/kernel-doc
> or:
> 	make htmldocs KERNELDOC=scripts/kernel-doc.pl
>
> As the file extension doesn't end with .py, it will excecute the Python or the Perl
> version of kernel-doc via a subprocess.
>
> On this version, I opted to re-create the Python objects for every single kernel-doc
> line, so no caches from past runs are used. I'm working on a version that will cache
> results, but it is currently causing some regressions. So, let's do the changes
> step-by-step, applying first this improvement patch series.
>
> PS.: the first patches on this series are addressing some some bugs and one
> improvement that I noticed while debugging the patch changing kerneldoc
> Sphinx extension.
>
> Mauro Carvalho Chehab (4):
>   scripts/lib/kdoc/kdoc_files.py: don't try to join None
>   scripts/lib/kdoc/kdoc_parser.py: move states to a separate class
>   scripts:kdoc_files.py: use glob for export_file seek
>   docs: sphinx: kerneldoc: Use python class if available
>
>  Documentation/sphinx/kerneldoc.py | 138 ++++++++++++++++++++++++++++--
>  scripts/lib/kdoc/kdoc_files.py    |  11 ++-
>  scripts/lib/kdoc/kdoc_parser.py   | 119 ++++++++++++++------------
>  3 files changed, 200 insertions(+), 68 deletions(-)

I've applied the series.

I do note that the default "make htmldocs" build time is reliably slower
than with KERNELDOC=scripts/kernel-doc, I'd be curious to understand
why.

        External kdoc:  170s
        w/classes:	186s

jon
