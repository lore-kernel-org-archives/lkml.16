Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9490E25634;
	Mon,  7 Apr 2025 22:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744065273; cv=none; b=a1U7LDyrsg5YzAt9fw4JYtOnnC0MiRibfa7wqJRQY0lpMh1l4SnOb9gUDCD+Q7aMn9IrVMXPwvlzHPol9XV/gGp3NiCmKEjo6R/4BgE7O94vxCtiBWMcR5n/GgNKHB5LhFTmCYYP+1zT2O2ysNy3mzO9P+uwGDIddSRxE4E2YcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744065273; c=relaxed/simple;
	bh=ydxIA35KhH/ZuDw3ixf2ib8GSTzeXrx6f8UC9cnihaA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lJ1RbxyF94lXqHkYVg+26d1+4be7XDKp9wCgp3X9g0ORUn+X8dyM3284E4mzdOJ2N1S1sRmZgIs8CZyQF/H5KhPJSrjzrOheKfV9VTUQLOQ++FmNivQXpKGDd6ZMd+7kwTXlXy9iv32dMFULhGP5n7GBzYj4eHiNj4JUaW3hVtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=BOnWwVYc; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="BOnWwVYc"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6F43841064
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1744065265; bh=JzeuFYx8bRUL18EBdqHZZvwkSE7Jtg6GRB+nzjSQ86A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BOnWwVYcaEeHnOZk0W9gBW02N0oYJkSqIFAnQezyqbOLliRAB5MDo5/TIVd9SetcF
	 XQBj4WRV2Y4lGs/1JGbZy2Fl3I8ccCUjdKQwiORx0uWq/m9V7HC35HbXWuBvB/Fs0L
	 J8mhJWXquWlZYiq4KHU955FzlzUW6Do0O0wDKT3UTnoe8m5cJmzjY4jqKH7JH+Ekma
	 5qFoyfyf4Arb05003XgDQF0fYYu4dUCkNot+U/JvS4Dw/olp7TNtWWPvZgEFSzQKgn
	 YJDlouDjGknol0K5gGAnZ6/rMoMGMpjSHv7y/UZxkl6uuT2oWxogUU11KAi6qZuODd
	 lp7fwmrdEaZFw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6F43841064;
	Mon,  7 Apr 2025 22:34:25 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sean Anderson <sean.anderson@linux.dev>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH] scripts: kernel-doc: fix parsing function-like typedefs
 (again)
In-Reply-To: <20250407222134.2280553-1-sean.anderson@linux.dev>
References: <20250407222134.2280553-1-sean.anderson@linux.dev>
Date: Mon, 07 Apr 2025 16:34:24 -0600
Message-ID: <87h62z8utr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sean Anderson <sean.anderson@linux.dev> writes:

> Typedefs like
>
>     typedef struct phylink_pcs *(*pcs_xlate_t)(const u64 *args);
>
> have a typedef_type that ends with a * and therefore has no word
> boundary. Add an extra clause for the final group of the typedef_type so
> we only require a word boundary if we match a word.
>
> Fixes: 7d2c6b1edf79 ("scripts: kernel-doc: fix parsing function-like typedefs")
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
>
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index af6cf408b96d..5db23cbf4eb2 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1325,7 +1325,7 @@ sub dump_enum($$) {
>      }
>  }
>  
> -my $typedef_type = qr { ((?:\s+[\w\*]+\b){1,8})\s* }x;
> +my $typedef_type = qr { ((?:\s+[\w\*]+\b){0,7}\s+(?:\w+\b|\*+))\s* }x;
>  my $typedef_ident = qr { \*?\s*(\w\S+)\s* }x;
>  my $typedef_args = qr { \s*\((.*)\); }x;

This seems like a worth fix but ... we're kind of hoping to replace that
script entirely in 6.16.

Mauro, do you have a series for me along those lines?  It seems like
time to put that in if we're going to do it.  Then maybe this fix could
be adapted on top?

Thanks,

jon
