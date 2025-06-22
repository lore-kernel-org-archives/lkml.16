Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A6514A62B;
	Sun, 22 Jun 2025 18:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750617852; cv=none; b=kv79bsvSOe8qDSg5lB/kL3UT2OYEvf9ZDj9EtU2jtAg4906trQtTXkqzJwDNFWfRTUwrgYp9T4W2s6UaZymRpK9NAkee/8bm+Y/ltSmtJe5mMrn6N4Q6xVWa5TdPXc0ljoWaiX9ZzNr/hYGtk3h+gFx0yojbLH4F5/AtyylTRbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750617852; c=relaxed/simple;
	bh=jQPMbjL3fFFGkQL8I+x5O/PvFKVwP7m5RVQT4xh0ld8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bo19sU00zMcgX/iggUNkTFoz/OYla4draN+qDBHEx0JrWGrM65VS1K5ASqkXXz/nEYjEGqqkgypGjJZnZUdGUxHK/ipO68CfQkQhmR0KxssHOGDpzOj4+Xm0Ro9SF2S4JxWrZeN0ZCWcd3D/VW/2GxmnPju5OLuXApaqvgh0w2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=FAWSSrtr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="FAWSSrtr"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 27EFE41AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750617849; bh=xCaxUsriRbQpVDTX0sL0HK9i8FWV8424VECT54piz+4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FAWSSrtrwgcAl0g9Vx65LWJaiJAOoACdTinV4E2tivSqXzpUZUQr8bHqk/UPFicok
	 2235P+zBbi3u70iJ6KvOhC6j0KXF8ff2rOs9zJD4l6lrgzb8PwZC1ZGnRbTnjjGBwK
	 hx5l2zKQZA+133b33FXoPEh+OhNdq4Mtpf90CjrOkgcWoP7jkd2RTfTjWnQou6JLEy
	 4vpF4pZVY8D02qhUAe3irln+/pLh1toxQh/1OI+ZbHzQWmK6RHfBoxalXCddvSfIxp
	 cDvIYk4N/VAOwy1BrfnmQf4OIcp7LRqQiw8eBFfOrj17cwx27WbSmxhwl+A8eVb2ON
	 NmFKGJZNIeoOA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 27EFE41AD8;
	Sun, 22 Jun 2025 18:44:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH 0/6] Some improvements for the doc build system
In-Reply-To: <20250622060015.76a0b29a@foz.lan>
References: <cover.1750406900.git.mchehab+huawei@kernel.org>
 <87ldpkdgv6.fsf@trenco.lwn.net> <20250622060015.76a0b29a@foz.lan>
Date: Sun, 22 Jun 2025 12:44:08 -0600
Message-ID: <874iw7boqv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Em Sat, 21 Jun 2025 13:39:09 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
>
>> OK, I've applied it, but ... someday, I think the test_doc_build tool
>> should be properly documented and put somewhere under tools/testing.
>
> I added a better documentation for the tool at the v2.
>
> With regards to move to tools, I'm not certain about it as I can see
> advantages and disadvantages. 
>
> Creating a new directory to have just one tool on it seems overkill
> to me. Also, it is easier to type "scripts/..." than 
> "tools/testing/build/..." :-)
>
> There is another aspect: while doing conf.py and Documentation/Makefile
> cleanup, I noticed that there are still lots of hacks inside them,
> that are there from the early days when we adopted Sphinx. Perhaps
> it could make sense to move part of the logic there to this new
> build tool, which could, for instance, replace the logic inside
> scripts/sphinx-pre-install and get rid of some magic at the Makefile
> like the one which handles SPHINXDIRS.
>
> So, at least for now, I would prefer to keep it under scripts.

I pretty strongly disagree ... scripts/ is a dumping ground, nobody
really knows what all that stuff there is, nobody is responsible for it.
Something under tools/ would be more evident as to its purpose and
maintainership.  We could maybe just do tools/docs/ and move things like
sphinx-pre-install there as well...

Anyway, I won't try to hold up this work based on that, but now you know
how I feel...:)

jon
