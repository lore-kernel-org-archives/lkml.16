Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352221A256E;
	Thu,  5 Jun 2025 19:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151137; cv=none; b=XYAzjt4N2kSrIKcEmpdEtyS7y3WYrFDcAUR1/UnLyD0QlV1B3j8e+4kIBFK4q/WGsPsxBZ/00Qg8vxbPNq/TPo7y3DtXuJslrMLEEHzJOcayJ/siUic5v2OBsBVdTgnl1eXhk2rMdPBpCDHBVldN5FeR2wEwrVoois+AaYO5eMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151137; c=relaxed/simple;
	bh=eSyuKAVK2IwxgWXjyYfs2E403Khaf+iN3zExgA0EP+A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fw/gPryieJVQqLIWEtw82KYy4bDKwTeGG5GFQfpyDyZAe1eNVIzAVds4VgD8I2zA5MPrF17ecpLIVC0hrgDSA7lC2DrGUwFuEiY7P7jBUJzN+BHOjSAnMdLfwg8MKusX/ZRiIEpxQxM7MQG1O8XjQZOE3ASBQ8Qc89VJ6AldYFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cyzIT9cX; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cyzIT9cX"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 34BF041ED3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749151131; bh=rO1b4U8Ixi/UxftGLfQBQnl6N9lHEgpRm+gY6TlaxpM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cyzIT9cXXwkiWvSrogePTxcx3szoGcJdxD/q9uT8F2kLgng1PO8Fe8krFZKUpRkUg
	 SnwehqRKY0E5BQKf4rgaQDax4u4of/idzWOzETsQA6zxxaEDYrKDIfuxuSW/cd3yIe
	 S+nMtZVXUBtHeCsWJeBjQBq985qqM+ugw1nNWdxLtc3yvDjrmILyZihgojEl5V7g/W
	 IPf0TuBL0tCTgIUCAEGeL06Q1SmrhJeqWKgYeT+6mGsRhJPsJz9zNoXRatEI3c/LnO
	 1MXbT2VAFJRupjBQnn2aHIUy27+jO+XItVSzSMe0ervcuS2eiBWNr8g1s7RSbcbhSK
	 8pGqF4G8uhs8Q==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 34BF041ED3;
	Thu,  5 Jun 2025 19:18:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Matthew Wilcox <willy@infradead.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] scripts/kernel-doc: drop "_noprof" on function prototypes
In-Reply-To: <aEHq_Jy3hPQIzaO-@casper.infradead.org>
References: <20240326054149.2121-1-rdunlap@infradead.org>
 <aEHq_Jy3hPQIzaO-@casper.infradead.org>
Date: Thu, 05 Jun 2025 13:18:50 -0600
Message-ID: <875xhaf145.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Matthew Wilcox <willy@infradead.org> writes:

> On Mon, Mar 25, 2024 at 10:41:49PM -0700, Randy Dunlap wrote:
>> Memory profiling introduces macros as hooks for function-level
>> allocation profiling[1]. Memory allocation functions that are profiled
>> are named like xyz_alloc() for API access to the function. xyz_alloc()
>> then calls xyz_alloc_noprof() to do the allocation work.
>> 
>> The kernel-doc comments for the memory allocation functions are
>> introduced with the xyz_alloc() function names but the function
>> implementations are the xyz_alloc_noprof() names.
>> This causes kernel-doc warnings for mismatched documentation and
>> function prototype names.
>> By dropping the "_noprof" part of the function name, the kernel-doc
>> function name matches the function prototype name, so the warnings
>> are resolved.
>
> This turns out not to be enough.  For example, krealloc() is
> currently undocumented.  This is because we match the function name
> in EXPORT_SYMBOL() against the function name in the comment, and they
> don't match.  This patch restores the documentation, although only
> for the python version of kernel-doc, and I'm pretty sure there's a
> better way to do it (eg building it into the export_symbol* regexes).
> I can turn this into a proper patch if this is the way to go, but for
> now it's just to illustrate the problem.

FWIW, I have no problem with leaving the perl version behind, I expect
we'll drop it in 6.17.

We see other variants of this problem out there, where we want to
document foo(), but that's really just a macro calling _foo(), where the
real code is.

I wonder if we could add some sort of a marker to the kerneldoc comment
saying "we are documenting foo(), but do you checks against _foo()"
instead?  That would be more general than trying to keep a list of
suffixes to hack off.

I'll try to ponder on this...

(Meanwhile I don't object to your fix as a short-term workaround)

jon

> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 062453eefc7a..bdfa698d5570 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1176,11 +1176,15 @@ class KernelDoc:
>
>          if export_symbol.search(line):
>              symbol = export_symbol.group(2)
> +            # See alloc_tags.h
> +            symbol = symbol.removesuffix('_noprof')
>              function_set.add(symbol)
>              return
>
>          if export_symbol_ns.search(line):
>              symbol = export_symbol_ns.group(2)
> +            # See alloc_tags.h
> +            symbol = symbol.removesuffix('_noprof')
>              function_set.add(symbol)
>
>      def process_normal(self, ln, line):
