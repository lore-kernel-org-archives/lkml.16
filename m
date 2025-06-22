Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45361DAC92;
	Sun, 22 Jun 2025 11:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750592781; cv=none; b=TNwqKnj0WE5u2nzJ+ongk88R0l6qkNJUIS3+XQ5btgOpo8O8gTlFfiVnlg7E92xRZwmZiZRjNMUM3M7ZN907VzwtpNkcTVxyzyhWvgjOOKMjxUvQrBNp33gev4VpeFBmYzoazIdKokE6EMbKUAGeTKXUxV9KG6jtj9tkumkIqFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750592781; c=relaxed/simple;
	bh=Wc1qutNuQd7KPD2md75WNoiJ9w0pQyDi6rihBPlLFwI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qbyqHPfqLI795dWslXReA35t6rPd4/IE8GdDqBZZJnWFNJyYkYXGweXOw2Iq7rARfmWTOEMxI3GP/glGL6b5LOitlwU8EulI6ifC468VjGYi9IYdIuqV0Zdg03NVftJ1Jv8sg6QKwh4f2BLQxQWxlODjpcz9ebn7B1Q7EJ9bF00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6+Nw9MX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6+Nw9MX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608CAC4CEE3;
	Sun, 22 Jun 2025 11:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750592781;
	bh=Wc1qutNuQd7KPD2md75WNoiJ9w0pQyDi6rihBPlLFwI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=B6+Nw9MXue634SFTKrqldSJWlR1+aDKiCmWP9px3jGQ2xyzjLDUdSgBTpUTToNcVe
	 GSsjxd+cq7U0YWeVO8Xc1Tf0JSmbBSiyxX7NNnNdd4SJ2N8iwdNFPMsCWZhAxbQv6G
	 gSfu64M4sSJ7Gwo6QGMAMx4GJg5PamfJr9ClOT7FITHhjvcL3ZkyzdS9Na4NpY7lCi
	 avdspCIEWdR6pIY6ZjL50S6mYO4H8hfj4OYDhxhnY3dw+jFQy5Goahzsxtu6z7XH1D
	 14t1/Vnd1763cwta8XRAH1+FmtZyCmHj+AfgBbWOaV1cjRkxu97g74LLNNTs5vzH9b
	 lpiWHkOtGBy0A==
Date: Sun, 22 Jun 2025 13:46:17 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 1/9] docs: kdoc: Make body_with_blank_line parsing more
 flexible
Message-ID: <20250622134617.06038722@foz.lan>
In-Reply-To: <20250621203512.223189-2-corbet@lwn.net>
References: <20250621203512.223189-1-corbet@lwn.net>
	<20250621203512.223189-2-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 21 Jun 2025 14:35:04 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> The regex in the BODY_WITH_BLANK_LINE case was looking for lines starting
> with " * ", where exactly one space was allowed before the following text.
> There are many kerneldoc comments where the authors have put multiple
> spaces instead, leading to mis-formatting of the documentation.
> Specifically, in this case, the description portion is associated with the
> last of the parameters.
> 
> Allow multiple spaces in this context.
> 
> See, for example, synchronize_hardirq() and how its documentation is
> formatted before and after the change.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  scripts/lib/kdoc/kdoc_parser.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 42b2e0936b72..c46e1b6a7d4b 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1309,7 +1309,7 @@ class KernelDoc:
>          """
>  
>          if self.state == state.BODY_WITH_BLANK_LINE:
> -            r = KernRe(r"\s*\*\s?\S")
> +            r = KernRe(r"\s*\*\s*\S")
>              if r.match(line):
>                  self.dump_section()
>                  self.entry.section = SECTION_DEFAULT

I was a little bit afraid that this might be causing regressions,
but after checking the output, it looks ok. 

So:

Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Tested-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>


Thanks,
Mauro
