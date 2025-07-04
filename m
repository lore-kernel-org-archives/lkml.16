Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7107A1F428C;
	Fri,  4 Jul 2025 06:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751608904; cv=none; b=EzaZZO7g7F61RdbyKNOv7JnsOMOD0sICnb9pQpsVLg7J6nkIyKSi8Xn0KUQspM+UCfRTJiPyqtbUEAC9dnLfbB3ZXN7BaVB60hk2Rr/BA2Szyhy8UuOccRv0YHofY8Xuem+0bJhjY00b34HVCLASF9xLiqK0iBHTzGRJa4LXBK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751608904; c=relaxed/simple;
	bh=8L+w/x4+lUxiVcvjA1Xhfe7qLoUdZufPJdOvLP7J7WE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HrwXZh0HAbYMga7Mtg4iPQHJaTcyatv6YjIG2sHpr2Rdxs5+ILt9FtcWmj7hBR0kRwD2Stl36gY1wwLeQFFDo0asfLx5+LH5lwsY7yt5vM1op6iC6fQynixgUWy8r1NgmlrNJFG1CdtI4NSkz5UYF/8mH1Qe36Xz+bFvCal9mWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzWx8bgI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzWx8bgI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BD8C4CEE3;
	Fri,  4 Jul 2025 06:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751608904;
	bh=8L+w/x4+lUxiVcvjA1Xhfe7qLoUdZufPJdOvLP7J7WE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HzWx8bgIJ57pRHsLycp+sDNEp6NdMw0wvrAPSybM+ljnlxxwCE04BQe/A5Q4AtM4N
	 oPveP7Vq54J6P28Y1f03UvNo+9rIvWYu+D0q4v0CVxNzxWlk7Uoyxv4wpTA8sv8lsB
	 rJrZ63h0cfCYGlJoVBXBON7zUDbVj+ZwbGZb+ct3xjUAEdK3g4ebiJIjnaVh5MKBkc
	 1KZWroegd0GO6cGknAzigL3d66a5QPby1EDaluu4Xi4vHvXUoUdU12OOndkv8lOVz2
	 qhFEEDF/3Dmh/pWEk/7H9QHyZkOONcuGN06Qh1uqlyynranbvPJ0QzN/XLRcHOX1x/
	 wCSCLZGBtDq+A==
Date: Fri, 4 Jul 2025 08:01:40 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH v2 2/7] docs: kdoc: micro-optimize KernRe
Message-ID: <20250704080140.136b0b38@foz.lan>
In-Reply-To: <87ms9kkfb2.fsf@trenco.lwn.net>
References: <20250703184403.274408-1-corbet@lwn.net>
	<20250703184403.274408-3-corbet@lwn.net>
	<20250704003146.118f5799@foz.lan>
	<87ms9kkfb2.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 03 Jul 2025 17:47:13 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Em Thu,  3 Jul 2025 12:43:58 -0600
> > Jonathan Corbet <corbet@lwn.net> escreveu:
> >  
> >> Rework _add_regex() to avoid doing the lookup twice for the (hopefully
> >> common) cache-hit case.
> >> 
> >> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> >> ---
> >>  scripts/lib/kdoc/kdoc_re.py | 7 ++-----
> >>  1 file changed, 2 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/scripts/lib/kdoc/kdoc_re.py b/scripts/lib/kdoc/kdoc_re.py
> >> index e81695b273bf..612223e1e723 100644
> >> --- a/scripts/lib/kdoc/kdoc_re.py
> >> +++ b/scripts/lib/kdoc/kdoc_re.py
> >> @@ -29,12 +29,9 @@ class KernRe:
> >>          """
> >>          Adds a new regex or re-use it from the cache.
> >>          """
> >> -
> >> -        if string in re_cache:
> >> -            self.regex = re_cache[string]
> >> -        else:
> >> +        self.regex = re_cache.get(string, None)  
> >
> > With get, None is default...
> >  
> >> +        if not self.regex:
> >>              self.regex = re.compile(string, flags=flags)  
> >
> > ... yet, as you're using get, better to code it as:
> >
> > 	self.regex = re_cache.get(string, re.compile(string, flags=flags))  
> 
> ...but that will recompile the regex each time, defeating the purpose of
> the cache, no?

No. It should do exactly like the previous code:

- if re_cache[string] exists, it returns it. 
- Otherwise, it returns re.compile(string, flags=flags).

https://www.w3schools.com/python/ref_dictionary_get.asp


Thanks,
Mauro
