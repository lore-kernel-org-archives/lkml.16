Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BD01D5CE5;
	Thu,  3 Jul 2025 18:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751566829; cv=none; b=O4Tc1U7iAavXGU0Mqp7oIoxuk7izsxkyGx4VCOJ5Xp20gYJs7/vqA1JB8Ei++XGDLDV+gK7VNF+SjgYQ1b8WgK7D4ApvWBxGKG4xdozfKhKplFvFnqNFQ+/HNsXGQWEw8MDE72KhYQ1TUZkHfZ1TrdgHgVZGmMNIaxKnUF3clQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751566829; c=relaxed/simple;
	bh=Ua+1AeFdIFCOxgZeS7TcKUgTo2Qefe/L0zIXwQpMVlg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Wjmp2TNV051hAtS2Y6HgMNDblVAEm0iaHqItJX+6j33GSwZinLPb0Gre7ZsnE3mUn2jKzZ5nw5ax+TE3TP6QafdY7zsdHlSXPZlamW503pAgqIMxFLqSb0TOUwwaR6kxt+putCLaiZCa9LiDhqAZxZ/Zl+OIEOGYWuo6JEOnV78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=N6UTUuBT; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="N6UTUuBT"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 124DE406FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751566827; bh=k+STB9EFsTzbp5+ikejbo8ErbMRgevfWBB4ZzFJvj7k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=N6UTUuBTZiYWCKrYjFEwMncBetae1sEQMxolsqtD+vOgYdglX+2x8u/RA5toDzUxM
	 EJyS+bhTpZIwG2h9M9+pJ6/rllvKfiamunrnofBnwp4d3sRswmQqRXS5Dcy2ToN/Vv
	 0Dg3sDQ5ITEoDA5D1Xim4k8rapKE6EOMAQxu8trZzorkqKO0xSJcOTs3EJNfsU7wsi
	 bdSmxOQBjFmSevka4qQy9dr0N7evK43vlXbCd0Q5LWRuZwH5KRCGuYdlqOpdAAktn6
	 r0j9ksBOTzprWhCi/9kr2M05U56Yqr1XVGHhD/fjj/5bi39VuyjtKRVaAdaXz0xPiX
	 EHMUJaqybu8Cw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 124DE406FA;
	Thu,  3 Jul 2025 18:20:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH 0/7] Further kernel-doc tweakery
In-Reply-To: <e675d05d-0d81-47cc-b431-641b5b8c57b8@gmail.com>
References: <20250701205730.146687-1-corbet@lwn.net>
 <e675d05d-0d81-47cc-b431-641b5b8c57b8@gmail.com>
Date: Thu, 03 Jul 2025 12:20:26 -0600
Message-ID: <87zfdljfv9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> Hi Jon,
>
> On Tue,  1 Jul 2025 14:57:23 -0600, Jonathan Corbet wrote:
>> This is a set of miscellaneous improvements, finishing my pass over the
>> first parsing pass and getting into the second ("dump_*") pass.
>> 
>> Jonathan Corbet (7):
>>   docs: kdoc: don't reinvent string.strip()
>>   docs: kdoc: micro-optimize KernRe
>>   docs: kdoc: remove the brcount floor in process_proto_type()
>>   docs: kdoc: rework type prototype parsing
>>   docs: kdoc: some tweaks to process_proto_function()
>>   docs: kdoc: Remove a Python 2 comment
>>   docs: kdoc: pretty up dump_enum()
>> 
>>  Documentation/sphinx/kerneldoc.py |   2 -
>>  scripts/lib/kdoc/kdoc_parser.py   | 150 +++++++++++++++---------------
>>  scripts/lib/kdoc/kdoc_re.py       |   6 +-
>>  3 files changed, 79 insertions(+), 79 deletions(-)
>> 
>
> I just applied this set and got the error of:
>
> ---------------------------------------------------------------
>   File "/<srcdir>/scripts/lib/kdoc/kdoc_parser.py", line 881
>     	    else:
>     ^
> TabError: inconsistent use of tabs and spaces in indentation
> ---------------------------------------------------------------
>
> I didn't look into individual patches, assuming it should be an easy fix
> for you.
>
> I guess it'd be better to test (and hopefully to review) other pending
> series from you and Mauro ...

Yes, sorry, I ran into that after sending ... I have no idea which weird
last-second edit introduced that error.  It worked before, honest...

I'll go ahead and send a new series shortly.

Thanks for testing!

jon
