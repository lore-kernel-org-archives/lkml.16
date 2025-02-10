Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FC825B661;
	Mon, 10 Feb 2025 17:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739209752; cv=none; b=Uc0hdc09YLI1yOTX3+xuwD8eCxIvJfl1+4HDPjrKzPliLclfaJW5ES8c0mVQRvNzDJS4Ke+C4thl3usmpMI5vTRaHcFpbQFZDdWZIKfFLGVORkvEQka1eMI/7Rtut1qwCQH9qC9wL+OSNlXzTVjdvf7fnQbkCEta5lycH562L9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739209752; c=relaxed/simple;
	bh=r/ErqC1VjnkWQHiB8w1XvG3t29glOpGfSaKHA8XX5ok=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WKCDdJq6wU7sB1aOOhbAZ8L6xnqwmycmTZJf2y+QOeg0OExemCXqnkmpXML2IvCNM9g1NbCebV05KlYTyElEhnsznAPz4/AYl8kpZYsPTkvCGlk/wYD4Nx4QMuSHXkrBonV/1bYY5MrDljtxHO2c2L2sRlI68AP+nTHvcHioAxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SHaWU9PG; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SHaWU9PG"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C85F4411A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739209750; bh=r/ErqC1VjnkWQHiB8w1XvG3t29glOpGfSaKHA8XX5ok=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SHaWU9PGWq1FH1U5hZ+zOyoxvcnXGQB+uSVU8GnHxN82LlIyA9glZMNj8qgnuHJ8c
	 hm8/mNTadVtVxqAnErXcO1q3nqDZe4oQbPe/ViYL4b1TtjmOeVQaRivmmxPAJCUii7
	 +iTT3I2rfHvhTo1TS0YoPkznpxhdu16C/s8BO+RVCwatf36Fm4wXwxRYxvaALClAib
	 R5foKIQTQTL7DQMayLWNuaJFLXvaDC3dBS2XI4bnwT2Y5fC67XOlw6wDZv/GBldBzF
	 ZSGET3b3hw133SDPm72GNmNWsEr99Dv8Y3lTUU0zHdlZ5HCg4uyuP7gl+MtOAoWtBg
	 MurxnpXAhRh+A==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C85F4411A7;
	Mon, 10 Feb 2025 17:49:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Armin <armin.mahdilou@gmail.com>
Cc: shuah@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Armin <Armin.Mahdilou@gmail.com>
Subject: Re: [PATCH] Documentation: proofreading Documentation
In-Reply-To: <20250210041800.357393-1-Armin.Mahdilou@gmail.com>
References: <20250210041800.357393-1-Armin.Mahdilou@gmail.com>
Date: Mon, 10 Feb 2025 10:49:08 -0700
Message-ID: <87bjv91yi3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Armin <armin.mahdilou@gmail.com> writes:

> Fixed some spelling issues in documentations.
>
> Signed-off-by: Armin <Armin.Mahdilou@gmail.com>

Could I please get a version of this with your full name in the SOB?
Otherwise the patch seems fine.

Thanks,

jon
