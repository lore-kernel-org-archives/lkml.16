Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD7D19F120;
	Thu,  3 Jul 2025 15:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557135; cv=none; b=ktSttZNQjUOdiGNzux2q1qmTimtA8cI+SLewomay4U3MXJwohLd1HrJH3snfLtrsiEgVzge/IAAeiAI8Wi/Ge2LvGawwtPLPq7hc82kbzHKPq9aWJaQSupKaT1SOt/r+GUsT1+C7Mf5Z+i5AB4Z+56vYOFv0+rOvcRA3adiWmZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557135; c=relaxed/simple;
	bh=fSeyvKTMTas7kB2o1dc3l/M43xAcrKiHlXfr0vFcBKw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QAKoxt66T+lPE4+CZAyk1B91Sbf3e29V1/HwoYVq48rY8woU1kttQnMkBx7YSIHLpnyMq0CBMeqGvS4JwemkonIaQ2zgUN+aBY42TkSvxwu0S+qIMkhvmx3aIrgOqspGCT8qx6qfedVcxeBk9zfOJQP5RVl2qD4sOcub1gfi45I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjzYgWKr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjzYgWKr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7A2C4CEED;
	Thu,  3 Jul 2025 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751557134;
	bh=fSeyvKTMTas7kB2o1dc3l/M43xAcrKiHlXfr0vFcBKw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OjzYgWKrMeaMkYakMl/4QPu7ZEhs+Xka+8WiO6tkVKIAQpZqpVhPxf8b8buEQwBku
	 pX6pn9AXW5OlgU2Li1wqWTIN7fahiw6V6Bjk+vm45CYzSwn7Csiyw/eMP6/rMmcmnn
	 BEmK1usHFnw33/4MU4U4D23GnYgLGm34INO7SJfSZfoQGY6qalAjy2Vl7iS6DmMdWD
	 wdogAjt5OumJrcWPucWuVCVxRLQxPyFNipBWOmw0exqIuFCBBpuHTBsN1t7Pg7MD1n
	 wRL2FCS9/DMYW4wRXP3fS4Ik5xVDzvMdY5DZrCm2f4lVn+LsJ0gSJOBXR66rY6Mdg5
	 bqFa1khjHKm/g==
Date: Thu, 3 Jul 2025 17:38:48 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 2/7] docs: kdoc: micro-optimize KernRe
Message-ID: <20250703173848.721de72c@sal.lan>
In-Reply-To: <20250701205730.146687-3-corbet@lwn.net>
References: <20250701205730.146687-1-corbet@lwn.net>
	<20250701205730.146687-3-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue,  1 Jul 2025 14:57:25 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Switch KernRe::add_regex() to a try..except block to avoid looking up each
> regex twice.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  scripts/lib/kdoc/kdoc_re.py | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_re.py b/scripts/lib/kdoc/kdoc_re.py
> index e81695b273bf..a467cd2f160b 100644
> --- a/scripts/lib/kdoc/kdoc_re.py
> +++ b/scripts/lib/kdoc/kdoc_re.py
> @@ -29,12 +29,10 @@ class KernRe:
>          """
>          Adds a new regex or re-use it from the cache.
>          """
> -
> -        if string in re_cache:
> +        try:
>              self.regex = re_cache[string]
> -        else:
> +        except KeyError:
>              self.regex = re.compile(string, flags=flags)
> -

Hmm... I opted for this particular way of checking is that I
expect that check inside a hash at dict would be faster than
letting it crash then raise an exception. 

Btw, one easy way to check how much it affects performance
(if any) would be to run it in "rogue" mode with:

	$ time ./scripts/kernel-doc.py -N .

This will run kernel-doc.py for all files at the entire Kernel
tree, only reporting problems. If you want to do changes like
this that might introduce performance regressions, I suggest
running it once, just to fill disk caches, and then run it
again before/after such changes.

Anyway, I did such measurements before/after your patch.
the difference was not relevant: just one second of difference:

original code:

real	1m20,839s
user	1m19,594s
sys	0m0,998s

after your change:

real	1m21,805s
user	1m20,612s
sys	0m0,929s

I don't mind myself to be one second slower, but this is hardly
a micro-optimization ;-)

-

Disclaimer notice: one second of difference here can be due to
some other background process on this laptop.

Regards,
Mauro
