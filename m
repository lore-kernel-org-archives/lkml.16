Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324DE25C71F;
	Wed, 21 May 2025 10:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823301; cv=none; b=qO9WWn8GNTNlZOryKt8Duw6fLlARenH4TPTE/UQ+/NZIpHw3ijPXtoYIA5/nTJ7Hj3ik+BjGTc4dflPMVqzM9ZMgTQDb0rh6uMEUYo5zq4YRykhZGXlTxMJIUcPknGpboE/TR9ZkNIH0byqaa5ShGI+bFwTy+Eb9ZvTeQoFvr/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823301; c=relaxed/simple;
	bh=+b5wisJAut+hU0zRdAguhp2vQL9rL3QPh5LieBHvr1A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RyQO0SiqZ/d3KCSADE8YPEPiu6D8+wZk2Z//XQ65BIQdlU9s1ejpAZPaMcIQwkxSiOIcUSHuOb9nxceFD5+bpCZ7wqbP046eGRcWdQpePCaHYyNxN4ezdfXfwMD0ihYLZXMVZb5xnuMlZMC/FnDV9/+9yf0junac0Xcnmk5p3Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pO9FmomT; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pO9FmomT"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DA6A541A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747823296; bh=/HOgoEuDftBola8QtS0fRmGZYzDxz5CSSMNf98lwlYA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pO9FmomT0M4NqBILByQi4XhOxEp40liea/8YRjwYfnUICuOK8keHGxFCygPNQcLQ+
	 EBvDUhwQ6ieoIDgLJ3RQC744MWHl3fxDWmzD0sWSh+JvZu30sGnnOHygCn4wPTIIOZ
	 KPxN46D4qq5ri8o4uteuFWw5yorIrxBoJ3LKghUKo8qRNNz9FL86odg8edFJioCj6p
	 1rgUdR/3mizzG9ih5zGFwkw4Mjnz6Qj/X3gmzbXsZ95gMugkVembe1k1ZjZ5uqLjrd
	 j6kslvcnTdtTvp0Tr5mDFaIzFzMo+mQ89/wbgxXQY3ZYdwu8FVRP8bIuGNtziIAHOs
	 cufvLG2RBvaAA==
Received: from localhost (unknown [93.187.88.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DA6A541A9E;
	Wed, 21 May 2025 10:28:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: doc-guide: clarify latest theme usage
In-Reply-To: <20250519223613.37277-1-rdunlap@infradead.org>
References: <20250519223613.37277-1-rdunlap@infradead.org>
Date: Wed, 21 May 2025 04:28:12 -0600
Message-ID: <87v7pufebn.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> We have been using the Alabaster theme as the default theme since
> Sept. 2022.
>
> Keep the information on the RTD theme around in case someone wants to
> try it with the DOCS_THEME environment variable.
>
> Fixes: 26d797ffc1c0 ("docs: update sphinx.rst to reflect the default theme change")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  Documentation/doc-guide/sphinx.rst |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

jon
