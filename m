Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D847319EEC2;
	Mon,  9 Jun 2025 21:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749504056; cv=none; b=dnYzwMe5zqrEiRxW35kFamalcUUs2Ygxwh76tPNKkytgQt/Y0Hrf2qlhS2C4vZUtaNrf9/k2k2yzpNyl6FgfikWAmp0O8y32HxTii+FFjxCovOwjmQjT3uTuhKYuoobzEnaNMbBU5i+SBJIT7cuwRFhDlydbPKLUT6GtDdnZykc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749504056; c=relaxed/simple;
	bh=pKhKXgCrktYuaRbEqFnERsFKR8Ry6NrACeO93JvdLyU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=vDtVIUybK/tfCH+o59DOQqa6lclQodNbBVKtkJDDF0jI/48SzxJj28/I1pFo/jB8APRoFp5Ct8bjFtP7X8wytbtM2l1UONxg69Fhmt/AmtKgkNM2AD5pRwl4Obi78CQfflodysx/jUWjzmgMwi/AqNlNCUkrvcage0+1kPUuJRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NS/+bit1; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NS/+bit1"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0CEE741AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749504054; bh=+dhQ/0wrqPN8lw+Kdpp59M0xtPc7zzPfhdluoj3zkT4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NS/+bit1E4/cx0odv0+xq2LtfwImttrTiGcTWcfBizuTYnHRPKKUuuE1+/PVvnXZe
	 /rVjDMmcwTEF7MrNtTp681QBMrBq4ke+W375I/2pb594D+zmNNw5CjLRCZdvRnRZUZ
	 FJJZiC9owjSre8Am3sdDKvB9HhSJjjCZ5L6W0JNWxzN8L41//x3JCikndQHNVpuq+E
	 l6CXw8AKN9UCBCUWBQPw5PCmoctWFD7ua4vZifAEBLwCMvFyPcl/mxz186oC4LNHSx
	 L65Edotwa8WtKaZfW4ZC/NRrHeB2R8jt6IeUlwKnGVGERK2G8ZwCaSX8/NAlQXUdER
	 jXx59O9osfh4Q==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0CEE741AA1;
	Mon,  9 Jun 2025 21:20:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 2/2] docs: document linked lists
In-Reply-To: <20250520-linked-list-docs-v1-2-db74f7449785@collabora.com>
References: <20250520-linked-list-docs-v1-0-db74f7449785@collabora.com>
 <20250520-linked-list-docs-v1-2-db74f7449785@collabora.com>
Date: Mon, 09 Jun 2025 15:20:53 -0600
Message-ID: <87v7p48vd6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Nicolas Frattaroli <nicolas.frattaroli@collabora.com> writes:

> The kernel contains various generic data structures that should ideally
> not be reinvented. However, it often fails to document the usage of
> these in the in-tree kernel documentation beyond just a listing of
> header symbols in the very lengthy kernel-api docs page. This is fine
> for things that have simple invocations, but occasionally things devolve
> into several layers of concatenating macros, which are subpar for humans
> to parse.
>
> Begin making a small impact by adding some rudimentary example-driven
> documentation for the linked list type. It's far from exhaustive, as
> many list modification functions are currently not mentioned. However,
> it covers the basics and directs readers towards further documentation
> should they be interested in concurrency.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  Documentation/core-api/index.rst |   1 +
>  Documentation/core-api/list.rst  | 390 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 391 insertions(+)

So I'm only now getting around to a belated look at this.  I like it
overall, but I do have a couple of comments:

- Is there any way to talk you into replacing all of the graphviz
  diagrams with ascii art in literal blocks?  All the dot stuff makes
  for pretty HTML, but is entirely unreadable for people looking at the
  plain-text docs.

- All of the kerneldoc stuff for list.h is currently pulled into
  kernel-api.rst.  Should we perhaps move it over here?

Thanks,

jon
