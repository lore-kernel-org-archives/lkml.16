Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8B03C17;
	Wed, 25 Jun 2025 18:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877180; cv=none; b=byX1+2A/SYqwgUoFL5/UzxsiiuC6hBnI33Ng5BuQzL4bzwPaLf0NIZZ0L5gt+pyZDZ8AmmB8ULE7oieQx0SQXGcjYa91P1ybYE/BFsCuRiMNUaeazRRNCdWx1DVbiUJq83/GwtTlaig6lSC0SET6Si+a1EWBA0FjvlK9bWBwT9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877180; c=relaxed/simple;
	bh=uVviAtRfpdR06P23FEonTnJRlmAhLFO/9/W9bEAnrIE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IqHzQqHll81eKjynajBP6VPMME2iAFxqxaPYWRxO6Owuupw8y965kMzcIieBMQEORifeftg5ICKvWOl0tgEiIsU4MOKXouMWbW9DEsWNCe4l62Qlw5nmEeEmA/fbg0bW4V1HM2SbeMy2pG3bzqtZG22Tr5wAjB6jNvkamAyheek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=YdVYBgY0; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="YdVYBgY0"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F1A0040AB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750877177; bh=XzNsCL2q22eTD4gHfpyQb3neIRXObn5xId6yyyIKSUk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YdVYBgY0loiFSXPjyumv9wa52PptPDIlnBm/b63X73CsX4IO+0+YuYcjwhfACppGv
	 o0qHM/t4trIk57cZK5FBxI1QerdF9OZ/X46wpH2rB2vP9f5NXXIwvHXnpxTncTPbQe
	 JvmoI4h2dxXSSTCTJlkKxgtH63RIRKOz0mr+FTcDDnQiqEkNJnUAAY9wAGUCuwIK6E
	 kWH0PaZzt106WRHX6dOSc7e5+ZpOFDB0cSGTdpxo6cQXnwQliEXz/BPfC5+iNboW/r
	 MYs3uGJTUejAFQv9wh8j9WJOYVo4fvP25hRHpU04hFb7xeOPCUr9YpMRS7ef6pONnc
	 jzSubKJt0olTw==
Received: from localhost (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F1A0040AB1;
	Wed, 25 Jun 2025 18:46:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Federico Vaga
 <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, Carlos
 Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang
 Mu <dzm91@hust.edu.cn>, Thomas Gleixner <tglx@linutronix.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Stanislav Fomichev
 <sdf@google.com>, David Vernet <void@manifault.com>, Miguel Ojeda
 <ojeda@kernel.org>, James Seo <james@equiv.tech>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH RFC] Documentation: typography refresh
In-Reply-To: <20250619042318.17325-2-bagasdotme@gmail.com>
References: <20250619042318.17325-2-bagasdotme@gmail.com>
Date: Wed, 25 Jun 2025 12:46:16 -0600
Message-ID: <87wm8z8xs7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> At present, kernel documentation uses system serif font for body text.
> Some people, however, objected to it and instead prefer that the
> typography choice must be legible, consistent, and accessible (after
> all, the audience ranges developers peeking into kernel internals to
> ordinary users that skimmed through Documentation/admin-guide/).

So I have not seen the objections from "some people"; can you point to
them, please?

> To tackle the problem, follow Wikimedia's typography refresh [1].
> For the font choices, instead of using web fonts as in previous
> attempt [2], use:
>
>   * Linux Libertine, Georgia, Times for serif (used in h1 and h2
>     headings)
>   * system font for sans-serif and monospace
>
> This allows for more readability and consistency without sacrificing
> page load times and bandwidth, as the font choices is most likely
> already available on many platforms.

I am open to style changes to make the docs more readable, but I am far
from convinced that this is it.  Mixing font styles in that way will not
be universally popular, the claim of "more readability" is
unsubstantiated, and "consistency" seems out of place when you're making
the fonts deliberately inconsistent...?

jon
