Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB899126BF7;
	Tue, 13 May 2025 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154070; cv=none; b=FrcDe4E3i1Ic17Re2ACKCdL++Il3mx3M8MjeanWbY30g/I8l4+P3GAx4LFUrutjps23IJyeagoGrHBdjIOArBzBxrEdedIhwR1SUnvcyAyEe7OFH2SwcaK+Zqva3tEaiBzIq/t8yF93rMY6GDxP9DFgmH4B5nkLZKZYCpnHYLJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154070; c=relaxed/simple;
	bh=J6kUo0TnqtmYRJDJzmYIDRMEGGma9cxhZveycS1W0+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TlFNjmXi8g5v5icXnpmjk4evjdXh4bnZ96wA8Map+sDZajEw4KGX4BkCKRj1Pn5agYEqn9IvtEuicc5DkHvuwxSCHCJXqDYP0CgeEeTeMPGSvBeAEyq6JbOGP4zNhcX6ZfeMClu92kxAldoQF41OuUtpeg/ja8SOND7cuNvCnLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qhb5xrF4; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qhb5xrF4"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8EEF841086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747154062; bh=k0Gf3XhZLNWahCbpVInSPfr3HmHEAcs+CEs7roMgVVs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qhb5xrF4vKb/jrBZDeZBTLi6lov9cupPzSyPIdXQr6iAi6DpOj8ORcV3ilsOgTN8U
	 c5rC07L/k/D+uBF7Drefz+g4SVhPHGhFfmv/qQg46jznhhyT7qAhVQPEG0oSCYKq6m
	 lRUonCphnylNu7yN9CTRvWB1JTXAaNJzgis8nlvlWBF7bWFxxwh6IHhSR8y27qTM5t
	 3wBJl71wUK9v858kh6YZytZHsrtPpgyZCdYEc3m17SSEnIp8RXfIcjTTqRfO/30Ma9
	 896DX406rs/nntnHisbzMdjTfLBlWsTbV+gkZASB9VXZehhHm528wxwQzGaejW/sUG
	 naure94b4LA9Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8EEF841086;
	Tue, 13 May 2025 16:34:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: rujra <braker.noob.kernel@gmail.com>, skhan@linuxfoundation.org
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] TASK :Linux Kernel Bug Fixing: Fixing Warning/Spelling
 checks on the rst file
In-Reply-To: <CAG+54Db5eJVogCLKr3y5W02-Ksn7ChTpzz+UJaeoXJxA_V-QtQ@mail.gmail.com>
References: <CAG+54Db5eJVogCLKr3y5W02-Ksn7ChTpzz+UJaeoXJxA_V-QtQ@mail.gmail.com>
Date: Tue, 13 May 2025 10:34:18 -0600
Message-ID: <87ecwspj05.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thank you for working to improve our documentation!

A few things...

rujra <braker.noob.kernel@gmail.com> writes:

> TASK : Documentation Task

This line doesn't belong in the changelog.

> removed warnings and added "SPDX-License-Identifier: GPL-2.0"
> in starting of the file , also instead of using re-use , have used
> reuse.

"also" in a changelog suggests you are doing more than one thing, which
is a sign that a patch needs to be broken up.

> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
> <rujrabhatt3@gmail.com>

What's this line?

> ---
>  Documentation/process/adding-syscalls.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/process/adding-syscalls.rst
> b/Documentation/process/adding-syscalls.rst
> index 906c47f1a9e5..17652610450d 100644
> --- a/Documentation/process/adding-syscalls.rst
> +++ b/Documentation/process/adding-syscalls.rst
> @@ -1,4 +1,4 @@
> -
> +.. SPDX-License-Identifier: GPL-2.0

We want SPDX lines in our documentation files, but we have to be very
careful about adding them.  Do you know that the author of this document
meant to contribute it under that license?  They probably did, but it's
not something we can make guesses about.

>  .. _addsyscalls:
>
>  Adding a New System Call
> @@ -117,7 +117,7 @@ then the flags argument should include a value
> that is equivalent to setting
>  the timing window between ``xyzzy()`` and calling
>  ``fcntl(fd, F_SETFD, FD_CLOEXEC)``, where an unexpected ``fork()`` and
>  ``execve()`` in another thread could leak a descriptor to
> -the exec'ed program. (However, resist the temptation to re-use the actual value
> +the exec'ed program. (However, resist the temptation to reuse the actual value
>  of the ``O_CLOEXEC`` constant, as it is architecture-specific and is part of a

As a typo goes, that's pretty minor.  When the other stuff is addressed
I can apply this change as a first patch, but would suggest looking for
more substantive problems to solve thereafter.

Thanks,

jon
