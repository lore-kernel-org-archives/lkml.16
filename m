Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A4526B2A3;
	Mon, 19 May 2025 11:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654860; cv=none; b=um0KbU7H5c1dAhvpFhmcJCqRjYAmNEMXd55Ih6iEdbE+3HZFsDJLCHfnNzEgsqdr9UvSYsnwVx1Sg/hqeJqnlDpsTtc2H0CQx8XcS52wXzvwA4fjXIFTBISEWympS2N0KCGATT+lzJ4TF19bosfn/hcHTIZqzFE4N5TrHrdQC0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654860; c=relaxed/simple;
	bh=LM84ppQ9Hg02rY5UNCGCTjxb3PjzmksqWSwV5wkfBRU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tnyXBMvpkrYB2mnXwWj4nxEAVw75DV2oxPCvsIwt6qdJBCEzHsJQAl7Y8TNHxwlLi9HN0uQ2eJQk/CBAGkSB3Dtt9XlvT4QhTsm2ptHB5bgdkOXTA80tQb92tchrzlgF/pSSxPjnyCspoidFj8lB0xEM6vDd+SmpR3Nv6mooid4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=e4DkHtP1; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="e4DkHtP1"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B14FD41086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747654858; bh=Z6Bxy9uoNLh7c/QDDh1HyXpjukuWj/JEVnqjK+01yu0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=e4DkHtP1D8bzrSrvP8n9sn/9OlbRnU4vMxGAgGudPzXUsBSG932QRLUdLEht4WMCt
	 ceo2MjzYkbYbcr6mJO4V14/2Gp6SKeSrCEGxRWq3IfGl+ajoybVdsU0pGucxaGu7bl
	 ropk27x594qshfC9C37ZmqDAWx4vysSMtuuropuy1Fp5ku9qigoI00Vd6WMlrGfiQ2
	 SngK3relCRGNWL/dbBPn4DzI0wTug06r0B3dH0GX96sb7weck2vqygbWslVzm1dLBv
	 K7QYR1S/mOwDl7NCfNFunxgIGpZAWLphhmWdsRiQBL57NOp7iYWX7K/n3sx4L80cFI
	 Pw3MJKLZsoIkw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B14FD41086;
	Mon, 19 May 2025 11:40:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: rujra <braker.noob.kernel@gmail.com>, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation : kernel-hacking : hacking.rst : fixed
 spelling mistake
In-Reply-To: <CAG+54DZ4YqBfqkvCWBWSZWE0LGmcs0GdE2_HiSB8JUsau3OvOw@mail.gmail.com>
References: <CAG+54DZ4YqBfqkvCWBWSZWE0LGmcs0GdE2_HiSB8JUsau3OvOw@mail.gmail.com>
Date: Mon, 19 May 2025 05:40:54 -0600
Message-ID: <87jz6ckeux.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

rujra <braker.noob.kernel@gmail.com> writes:

> fixed spelling mistake
> LOG :
> ----------------------------------------
> Documentation/kernel-hacking/hacking.rst
> ----------------------------------------
> WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> +.. _kernel_hacking_hack:
>
> CHECK: 'compatability' may be misspelled - perhaps 'compatibility'?
> +     * Sun people can't spell worth damn. "compatability" indeed.
>                                             ^^^^^^^^^^^^^
>
> total: 0 errors, 1 warnings, 1 checks, 830 lines checked
> -----------------------------------------------------------------
> as first patch for documentation.

This information is not particularly useful; a changelog should say what
you have done and why.

> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
> ---
>  Documentation/kernel-hacking/hacking.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/kernel-hacking/hacking.rst
> b/Documentation/kernel-hacking/hacking.rst
> index 0042776a9e17..22b880add846 100644
> --- a/Documentation/kernel-hacking/hacking.rst
> +++ b/Documentation/kernel-hacking/hacking.rst
> @@ -794,7 +794,7 @@ Some favorites from browsing the source. Feel free
> to add to this list.
>  ``arch/sparc/kernel/head.S:``::
>
>      /*
> -     * Sun people can't spell worth damn. "compatability" indeed.
> +     * Sun people can't spell worth damn. "compatibility" indeed.
>       * At least we *know* we can't spell, and use a spell-checker.
>       */

The misspelling here is entirely the point of the comment - fixing it is
exactly the wrong thing to do.  (Whether we need all of this material at
all is a different question...)

Thanks,

jon
