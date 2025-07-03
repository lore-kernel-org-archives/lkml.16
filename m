Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6470D2CCC1;
	Thu,  3 Jul 2025 23:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751586443; cv=none; b=kdpLMulTVyI1qCTnUx/UZw60Znswmif8NktIpfYH7usDG1dV0Ht/h0Ig8gHDVCBkslmq/s8mnnHvxtnj3ORZe3sqw25GFfccMBZBOURRjJl1zjOoX8DuI2ZikbiFdYOtbyUMThKSwBjpen4tHi9B0yLkmK6kxrM0hEfJagdB1Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751586443; c=relaxed/simple;
	bh=VVMkzyjz0mfdIDPozpytox8OIczjDMUbiH5K+U00u1M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KHiUafzfuSV8HNO046Ec6rf6y+4CR3HuLthQv3sCZzJFvOX8sAlnmzTQFgwB2CNBGQ1mN0MJvfcrQidU2HTyaG4s3mw2VjCINLsAeYIQAhzIxY3LK0wqPbLvIfISjeyHSfgGRpJsf+RvUyMJaZN3zgZj9Qeo0kUO0cKN2MXmlM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bBfXErIA; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bBfXErIA"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 99C40406FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751586434; bh=jjrkXzfZ3M2tWF+2Oo3lVlQVLY411HZ2WGPa1DpPJ4Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bBfXErIALEsWbKqJY52UF/5viTiHwIaTT7ueLe6Qhlt02Fwp8U0CoE1aZHQ1bHUSV
	 +zTj7Nm6lch/zRqKwgzxrXbL3pttYykHK5aYYEGEh6hOEAybBKbvUV3vSby+RPPz89
	 5KJmUY0xPEVRqDbjIEAzmtGxWaLrG/acNuK27Rd1OiLOD9XtEWhNVDF2tanYRBhQet
	 gRgvaLHd7iIEWW7omW9Uft8PrMdirPbkf3I+w3PkBJlL8YfFeUn7nm5TyyLPR0vF54
	 zNuZGY4/lSeltzas281t+4Trr//YjmyRs7e+UbAmBaGQV8nkUPR6SZ88WSrT5hJjD1
	 STzY5Hq9iQDGg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 99C40406FC;
	Thu,  3 Jul 2025 23:47:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH v2 2/7] docs: kdoc: micro-optimize KernRe
In-Reply-To: <20250704003146.118f5799@foz.lan>
References: <20250703184403.274408-1-corbet@lwn.net>
 <20250703184403.274408-3-corbet@lwn.net> <20250704003146.118f5799@foz.lan>
Date: Thu, 03 Jul 2025 17:47:13 -0600
Message-ID: <87ms9kkfb2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Em Thu,  3 Jul 2025 12:43:58 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
>
>> Rework _add_regex() to avoid doing the lookup twice for the (hopefully
>> common) cache-hit case.
>> 
>> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
>> ---
>>  scripts/lib/kdoc/kdoc_re.py | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>> 
>> diff --git a/scripts/lib/kdoc/kdoc_re.py b/scripts/lib/kdoc/kdoc_re.py
>> index e81695b273bf..612223e1e723 100644
>> --- a/scripts/lib/kdoc/kdoc_re.py
>> +++ b/scripts/lib/kdoc/kdoc_re.py
>> @@ -29,12 +29,9 @@ class KernRe:
>>          """
>>          Adds a new regex or re-use it from the cache.
>>          """
>> -
>> -        if string in re_cache:
>> -            self.regex = re_cache[string]
>> -        else:
>> +        self.regex = re_cache.get(string, None)
>
> With get, None is default...
>
>> +        if not self.regex:
>>              self.regex = re.compile(string, flags=flags)
>
> ... yet, as you're using get, better to code it as:
>
> 	self.regex = re_cache.get(string, re.compile(string, flags=flags))

...but that will recompile the regex each time, defeating the purpose of
the cache, no?

Thanks,

jon
