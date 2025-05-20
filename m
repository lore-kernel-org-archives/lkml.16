Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87082175D53;
	Tue, 20 May 2025 05:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747718972; cv=none; b=a6TadnFjM+4oZ9mwq8n9In+A76W6CDw+wC/k1z6x6OveENhaRHNquXFTyQ3eUXT2g0clwjjstedHkMBAODX9qgkWOAhPHWAMvhNqPMH4WHLBPDbOiwzmDgwrUfoaemzNY4s0i91ohBkYJTQANxDYI0n2IDvSQ4B3H4fX+O9JO7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747718972; c=relaxed/simple;
	bh=DVsu2Y2hWXGHe9RVnQiDNeXn9UsIdvyoAfdK2Av5qhE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NIfHVsYW++hrQCh6YZ7RaFlHTbpXTyrsG0O+1MOwy68qZwTXzyTDEILqyHQVGmIi1Z/1scf6F05j9bARpeWjNOqKJVC/yBezw5wNCBvHwTqgIKMRpqAMGM/qo1V7QE509na8uIuHA3vMzFqicNQsV5cCl6agUyYmQ76JvoDE8XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eC9qsNcU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eC9qsNcU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C5CC4CEEA;
	Tue, 20 May 2025 05:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747718972;
	bh=DVsu2Y2hWXGHe9RVnQiDNeXn9UsIdvyoAfdK2Av5qhE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eC9qsNcU7/EBvw18oLOTiD+EsrHHIePWeyVudBwVnyB6FD1w0njN6zTazSTm7dZ8o
	 U/qYr1a1VxD71L3aOYtIVFeWa3dSP2hTQwC4Ucl2qk1DlOsgBP1UhJ244wWsTeGKyW
	 0XfQcsYX2ZpElsSWnx+Mbx09BoqtNqo3rIyq8BcEoe9rLSeBX8WEILotiCgxpbzj+Z
	 RoKZh/q4A01BFkyDkmbbuvCzKKkZFPy/cqs1glFJUhfoJ+8y0jElKqBqMMfR9USnd7
	 xwYcoISVMB+ysjTee4/dqy2NdU/69hD2bDFwd9yLH5d3r3+qxEdQ3XoxiDod3VT+Es
	 f/qCX12TE2gTQ==
Date: Tue, 20 May 2025 07:29:28 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: doc-guide: clarify latest theme usage
Message-ID: <20250520072921.588589cb@foz.lan>
In-Reply-To: <20250519223613.37277-1-rdunlap@infradead.org>
References: <20250519223613.37277-1-rdunlap@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 19 May 2025 15:36:13 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> We have been using the Alabaster theme as the default theme since
> Sept. 2022.
> 
> Keep the information on the RTD theme around in case someone wants to
> try it with the DOCS_THEME environment variable.
> 
> Fixes: 26d797ffc1c0 ("docs: update sphinx.rst to reflect the default theme change")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  Documentation/doc-guide/sphinx.rst |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> --- linux-next-20250516.orig/Documentation/doc-guide/sphinx.rst
> +++ linux-next-20250516/Documentation/doc-guide/sphinx.rst
> @@ -42,12 +42,6 @@ with your distributions. In order to do
>  Sphinx inside a virtual environment, using ``virtualenv-3``
>  or ``virtualenv``, depending on how your distribution packaged Python 3.
>  
> -.. note::
> -
> -   #) It is recommended to use the RTD theme for html output. Depending
> -      on the Sphinx version, it should be installed separately,
> -      with ``pip install sphinx_rtd_theme``.
> -
>  In summary, if you want to install the latest version of Sphinx, you
>  should do::
>  
> @@ -162,6 +156,12 @@ By default, the "Alabaster" theme is use
>  this theme is bundled with Sphinx and need not be installed separately.
>  The Sphinx theme can be overridden by using the ``DOCS_THEME`` make variable.
>  
> +.. note::
> +
> +   Some people might prefer to use the RTD theme for html output.
> +   Depending on the Sphinx version, it should be installed separately,
> +   with ``pip install sphinx_rtd_theme``.
> +
>  There is another make variable ``SPHINXDIRS``, which is useful when test
>  building a subset of documentation.  For example, you can build documents
>  under ``Documentation/doc-guide`` by running



Thanks,
Mauro
