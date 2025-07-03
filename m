Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDE9239E6B;
	Thu,  3 Jul 2025 22:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581975; cv=none; b=Lqk/+60X9uS+e0m4ovgBAN9OsSjNwpEzvhGKTDAUhyIX3im2VCXDS6iz94xxZHZST34o8FdkUZei2MGYzLFqZ+36A9JlzVHjGW3m5B3MjQrlM1HpytKqNH4T3lrfXATKgeaMLw2hyjwMiJzRAx3zWnKtAEzl1JUF+HbqJs9bu1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581975; c=relaxed/simple;
	bh=+1wx07gN5OfooWmYzorC7Slu3Z/5IsovZI2Woew1vkU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E3R2Hna0bDF2XZNgPF6Ko+5EkN4omXRz9cqGQOSkl65fgTddfd3aYlNzjP5poQ3pJYUBA44T3DdZrM4tRN6F2Tz0km268KFbqPnbJBesHB5dzs3n9ir7j2LST3zN1EKsYecPSYS6MrIcd5sRgDWrpbCuw7KXIsSe/Ury9G3u8lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEZHQm7N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEZHQm7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81BEC4CEE3;
	Thu,  3 Jul 2025 22:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751581974;
	bh=+1wx07gN5OfooWmYzorC7Slu3Z/5IsovZI2Woew1vkU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QEZHQm7NNnv/EfQSW33a9YTMrY4F3sVQy7pZd1djbmcKAoFzzyJrKGxYJKA10bzpV
	 dvfQ8O/85NKa7RpFpqcnRHET0R7GMiozUTWOPM2D/2oMBbTYCMS/qvqyLlykj8lts7
	 7GQba1i99epEivV1EdtgzpLSRgRtZKqmriOsCzbR8+tf1zQze/5aF3zY8ZX6q3zoAz
	 oG664uTTYMm+MmJErD/wLrLO8T+su1kdo42U2P6xbskl9sUoXqllPHLwjzNfHm3PeH
	 IIjybcS8tzNEjAhTEMBl1Z4nfDnF0f5sbSxXLQ0wI7n0ZnVqLb8jkQUmzvOFOqNdlU
	 NTavsBxJSmW4w==
Date: Fri, 4 Jul 2025 00:32:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH v2 2/7] docs: kdoc: micro-optimize KernRe
Message-ID: <20250704003251.1858ce60@foz.lan>
In-Reply-To: <20250704003146.118f5799@foz.lan>
References: <20250703184403.274408-1-corbet@lwn.net>
	<20250703184403.274408-3-corbet@lwn.net>
	<20250704003146.118f5799@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 4 Jul 2025 00:31:46 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Thu,  3 Jul 2025 12:43:58 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
> 
> > Rework _add_regex() to avoid doing the lookup twice for the (hopefully
> > common) cache-hit case.
> > 
> > Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> > ---
> >  scripts/lib/kdoc/kdoc_re.py | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> > 
> > diff --git a/scripts/lib/kdoc/kdoc_re.py b/scripts/lib/kdoc/kdoc_re.py
> > index e81695b273bf..612223e1e723 100644
> > --- a/scripts/lib/kdoc/kdoc_re.py
> > +++ b/scripts/lib/kdoc/kdoc_re.py
> > @@ -29,12 +29,9 @@ class KernRe:
> >          """
> >          Adds a new regex or re-use it from the cache.
> >          """
> > -
> > -        if string in re_cache:
> > -            self.regex = re_cache[string]
> > -        else:
> > +        self.regex = re_cache.get(string, None)
> 
> With get, None is default...
> 
> > +        if not self.regex:
> >              self.regex = re.compile(string, flags=flags)
> 
> ... yet, as you're using get, better to code it as:
> 
> 	self.regex = re_cache.get(string, re.compile(string, flags=flags))

For got to mention: with or without that:

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> 
> > -
> >              if self.cache:
> >                  re_cache[string] = self.regex
> >  
> 
> 
> 
> Thanks,
> Mauro



Thanks,
Mauro
