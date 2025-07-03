Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B910212CDAE;
	Thu,  3 Jul 2025 22:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581910; cv=none; b=GFLFom7sW/ZAbqek+zEmMYb9FMNvL52uKlKuafoCoJzEJpHm+4tHSzxe3kBJs535q9PBBM1ilrwDvaeIvQjovFVBqeVG8S+jRW+oeI7O89QjjbtwlzE08mxTs1rQsCkDZo9cmr3RP3sOBYpbu/bL4OF3bf7EM4wfOvjNTia1f2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581910; c=relaxed/simple;
	bh=RT7t295FlKOrPNoH6LQ75vKX31pjU2YkRqlCReUBDfM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YcarfUCMjRZjNgc5CIMqrYL5PXnF7qa5a/ouJY3HP4ma3MoVnnyA1donNMq+0GIsnurvLPXtUZLI2SGo5sxE9hFHuYhI+d8EcQst7M+hf/PbOrd13E0ZZqOd0hnKzuLioAz+n4+92/ZUKLoIbOIclJ5fEuXwpxMSF2taT/yxTOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDkIHD1I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDkIHD1I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA77C4CEE3;
	Thu,  3 Jul 2025 22:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751581910;
	bh=RT7t295FlKOrPNoH6LQ75vKX31pjU2YkRqlCReUBDfM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bDkIHD1IIyLMDLoAgJI9M3qGj3x6UY+sxxU/xwRlARberCdlmGD/gpa2LxfvmS0V8
	 S1I3T+PMCgc3hRcy2jyjzbnkw0pY/m5IPuuyYhlhqlvJ8TM0pkIEIEgip3VLtVf2wm
	 ZAw7KUt/NEqGyOesQka9baIR6c7EO5c7g9XbYVniech/9Qqc26bkS+07upFcK0WFAq
	 jfmYWw4Fb3ySIXlZcQzHW01I6w7XuXhHzva4tYdPo1zpuxMmoF3QJd7ZqIcVAz9OWT
	 x3KHSDTkctTd9ZS73Bk1CwEpZMZNGmasjT+ecf7qufecD9CskPBQQmUVt9pPT/dma9
	 NsMNFnIgttYzg==
Date: Fri, 4 Jul 2025 00:31:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH v2 2/7] docs: kdoc: micro-optimize KernRe
Message-ID: <20250704003146.118f5799@foz.lan>
In-Reply-To: <20250703184403.274408-3-corbet@lwn.net>
References: <20250703184403.274408-1-corbet@lwn.net>
	<20250703184403.274408-3-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu,  3 Jul 2025 12:43:58 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Rework _add_regex() to avoid doing the lookup twice for the (hopefully
> common) cache-hit case.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  scripts/lib/kdoc/kdoc_re.py | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_re.py b/scripts/lib/kdoc/kdoc_re.py
> index e81695b273bf..612223e1e723 100644
> --- a/scripts/lib/kdoc/kdoc_re.py
> +++ b/scripts/lib/kdoc/kdoc_re.py
> @@ -29,12 +29,9 @@ class KernRe:
>          """
>          Adds a new regex or re-use it from the cache.
>          """
> -
> -        if string in re_cache:
> -            self.regex = re_cache[string]
> -        else:
> +        self.regex = re_cache.get(string, None)

With get, None is default...

> +        if not self.regex:
>              self.regex = re.compile(string, flags=flags)

... yet, as you're using get, better to code it as:

	self.regex = re_cache.get(string, re.compile(string, flags=flags))

> -
>              if self.cache:
>                  re_cache[string] = self.regex
>  



Thanks,
Mauro
