Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBD120EB;
	Fri,  4 Jul 2025 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641188; cv=none; b=d5m0dBzUewI5/r0GG9CMzlVc++dDiP+wnz6laP/5SB4s2YI4zJy+rlykNQ7f8iftasY+XxsDQukfsDWo0ABsMcIlfCQfQhzhl24s+TY5qkN7xAbmfdoMdeEbpicUw8mfKm93tQ0uTzXtTVxnMa6eH7D4+6+u23ehtPNA0LWD/iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641188; c=relaxed/simple;
	bh=SbQps3Lqq4Ao3UcX5KMW6+EQLx+pBd68WWZFR3kGQkY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NXAydniOPOG2ugS9gJ5RA5HBiiJciorCaWstGmMIKVaXs7vEJXdH22BLYo3wvJE4bYStftAD8EuMklHjPrsI9ItmUjB2XzXw65Ns/PjoSVUJb3v45lPz1Kl2bt0WMHg7m8wMclotPV7tPMgvmdeV/5divKCkc7lJ/WiYujFOKmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ZB/QmCSO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ZB/QmCSO"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 44030406FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751641186; bh=PJWohgyx6ekDulgSfjlkhWK+EgaA0rVbdyJLP0+k1BQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZB/QmCSOhf4UEJ5N/Avo8x8VL1uHAqWTtaDqaUMzyz70HHbv+RMtIqlV0MyZvIkx3
	 NI03P7P0NAUIGhWbYs1MUxnwgrVlwCu1EuppUePZCf9/O0QdhwwzzTNd7HXS1kXvC3
	 SAYDYqAjGuvFeJQ8ImRFBHWxwSThFMVzCJAJfDtMX1TiCAzB8DdQ/+YtOjf2GZQQKz
	 gYIp5uDajyVtudBXKo2LTBrc2P7KjDUen7WmVteg5M2QIbJgqXmHuUy2zwboUnM6sq
	 u8jMFXfvw+Lrp+GrgZ2+TzQLLiV5MKwrzbPTZY0OAAERIeSKBvc+VxfkJntRlYv62S
	 j3j488gOt8s+Q==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 44030406FA;
	Fri,  4 Jul 2025 14:59:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH v2 2/7] docs: kdoc: micro-optimize KernRe
In-Reply-To: <20250704080140.136b0b38@foz.lan>
References: <20250703184403.274408-1-corbet@lwn.net>
 <20250703184403.274408-3-corbet@lwn.net> <20250704003146.118f5799@foz.lan>
 <87ms9kkfb2.fsf@trenco.lwn.net> <20250704080140.136b0b38@foz.lan>
Date: Fri, 04 Jul 2025 08:59:45 -0600
Message-ID: <87a55kj926.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Em Thu, 03 Jul 2025 17:47:13 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
>
>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>> 
>> > Em Thu,  3 Jul 2025 12:43:58 -0600
>> > Jonathan Corbet <corbet@lwn.net> escreveu:
>> >  
>> >> Rework _add_regex() to avoid doing the lookup twice for the (hopefully
>> >> common) cache-hit case.
>> >> 
>> >> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
>> >> ---
>> >>  scripts/lib/kdoc/kdoc_re.py | 7 ++-----
>> >>  1 file changed, 2 insertions(+), 5 deletions(-)
>> >> 
>> >> diff --git a/scripts/lib/kdoc/kdoc_re.py b/scripts/lib/kdoc/kdoc_re.py
>> >> index e81695b273bf..612223e1e723 100644
>> >> --- a/scripts/lib/kdoc/kdoc_re.py
>> >> +++ b/scripts/lib/kdoc/kdoc_re.py
>> >> @@ -29,12 +29,9 @@ class KernRe:
>> >>          """
>> >>          Adds a new regex or re-use it from the cache.
>> >>          """
>> >> -
>> >> -        if string in re_cache:
>> >> -            self.regex = re_cache[string]
>> >> -        else:
>> >> +        self.regex = re_cache.get(string, None)  
>> >
>> > With get, None is default...
>> >  
>> >> +        if not self.regex:
>> >>              self.regex = re.compile(string, flags=flags)  
>> >
>> > ... yet, as you're using get, better to code it as:
>> >
>> > 	self.regex = re_cache.get(string, re.compile(string, flags=flags))  
>> 
>> ...but that will recompile the regex each time, defeating the purpose of
>> the cache, no?
>
> No. It should do exactly like the previous code:
>
> - if re_cache[string] exists, it returns it. 
> - Otherwise, it returns re.compile(string, flags=flags).
>
> https://www.w3schools.com/python/ref_dictionary_get.asp

The re.compile() call is evaluated before the call to get() - just like
it would be in C.  This is easy enough to prove to yourself in the REPL
if you doubt me...

Thanks,

jon
