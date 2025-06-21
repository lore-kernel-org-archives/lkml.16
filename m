Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144F1211F;
	Sat, 21 Jun 2025 20:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750537121; cv=none; b=opNcB6vr+xLPmHIVitqQ6Z9APgYYJxWzWSLpqMfChuN+vecQQ5mMAApDlEVOtWDFdiVehd8urIuEUAwAt2DjVand2wxCrXq3J+VAnOcnhugl0BHqWboMQdlxSLz/1SY8K15XYIo06xG9apzXOlFkozzPlNhGPGMuTpIgX3lTCYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750537121; c=relaxed/simple;
	bh=Z5yBkZPUkTmc6b9q30hhd0CNnywxZLpa/TewjSCJj6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DaNVBJYaq010HR4niCduwDvG4h3moaldKvipR6yYWAPyWdFcjCWsvYnP5h6YSxwGCm0LdinjQ9SnGPhUorPpnJelWQz05ZGGZcvZhk75A5o4epEe6DZN6pfcm1QW3UUIYrHor6o1gfcmUc8GoqPuGakhECQRfAAOA9zN6SsbyiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=YoGUgVqB; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="YoGUgVqB"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 402E641F2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750537119; bh=45V+0FDkHCFlBIvDaUXHo+6ddq7ONnjr0UHFpIaEi/s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YoGUgVqBN5+cx8jkmfBQ1pSe2HNCjvLRZG7HnRfgUnTmooandGqL//bVa+ZhdlnfV
	 FuAPRAXIfM+NmG+D9r7o2/KWOkF0LEL1JSktsqruJWmZgVwF9BrFy1lfeN9jLXFU7e
	 YanT/V/gZtnoxtj09ftRULYEQH8XP+Bsxain6I2GlqDylnJJwHnPEbbLxtPx07FQQd
	 wpQmUh4bAXEFjCpWFYnZKZP+tQSD1XLsxFdp16zi8GlyZlry3uWP/B+5v9KEV+lSo/
	 WqTPmmeuj7rXb3n0lnKDH156gR9hx9FdX2QrQ7/N2KH54IA+f4T2P277ClbgY7qEUJ
	 jzrHdt/P1AWsg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 402E641F2F;
	Sat, 21 Jun 2025 20:18:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Salvatore Bonaccorso <carnil@debian.org>, Christian Brauner
 <brauner@kernel.org>
Cc: Luca Boccassi <luca.boccassi@gmail.com>, Oleg Nesterov
 <oleg@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Salvatore Bonaccorso <carnil@debian.org>
Subject: Re: [PATCH] Documentation/sysctl: coredump: add %F for pidfd number
In-Reply-To: <20250612060204.1159734-1-carnil@debian.org>
References: <20250612060204.1159734-1-carnil@debian.org>
Date: Sat, 21 Jun 2025 14:18:38 -0600
Message-ID: <87y0tkc0gx.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Salvatore Bonaccorso <carnil@debian.org> writes:

> In commit b5325b2a270f ("coredump: hand a pidfd to the usermode coredump
> helper") a new core_pattern specifier, %F, was added to provide a pidfs
> to the usermode helper process referring to the crashed process.
>
> Update the documentation to include the new core_pattern specifier.
>
> Link: https://github.com/systemd/systemd/pull/37125
> Link: https://lwn.net/Articles/1024160/
> Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

> FWIW, I was not sure if I should add a 'Fixes: b5325b2a270f
> ("coredump: hand a pidfd to the usermode coredump helper") to make
> sure that it get backported as well to the series where a backport of
> b5325b2a270f landed.

A Fixes tag is not sufficient to ensure that a patch is backported to
previous kernels - you must CC stable@vger.kernel.org to be sure.  In
this case, it's a documentation tweak for a 6.16 change, so I don't
think there is a lot of urgency here.

Thanks,

jon
