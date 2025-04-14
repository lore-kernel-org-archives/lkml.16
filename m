Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7C727F73F;
	Mon, 14 Apr 2025 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646889; cv=none; b=Lbok7ExX6NfDZLbBfHf1pT7RlwNejFiTS/oFzTFr0TRKizw1turWx/arnCTwHktvCrSwkt3T6+06b3h7m8+bfvx8JPjYzM1FB+e37V105Kk/xOY8Un+oNS30rjhAat0j0n3Zj3YukGgwyRee4M+0UbpRF0ZsWgH7d3/sAIH7MJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646889; c=relaxed/simple;
	bh=PRpY+agLkWyBvh1af0VEzBvhk3aT3+lcuUVs1u2vK7I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h+Bbw4zcaTjIR3x2gjRLxQGKxxHk6wwuWFkPHXDG5qnuZK55q2fVYnZeAoAXPfn4fbMXzOJhxLCauZ60v6blwSOrJ8Au0HYuFpbvfdLyS4q5hDv4gqurEVpxtOfnWjdyQLXZMkL4rDcqbShEhzv8AVJKGkXMpSaxDt32rJSRRF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VQh/xwYe; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VQh/xwYe"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7239241062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1744646886; bh=KI+oMMPgtiQyrbdQASrneFg3V0A09gQXLMJo2WqFXD0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VQh/xwYe2sYB4y4nNhZczXz7l61paJYX7GDod2KBt+l1nq0c/Bp3nHwRHLgc7sFxu
	 v3i30ecOKKwFxQZUc2XginuInMXJcf7YLY6NBulpWNVeQD08xPMaerC/f+Rh/1YPW3
	 LZ3ALeMm7MiMehWLd5FbgzWJL+DBlPRxlXz3PXGm+gM/1NmeQ214WdHkzg2nppPyxy
	 yVWEg9BsH8qRkv9fNAfle1JAmbwq+L+wm/dQFJXOJLebgl8n8eD2HklY5MQY7XLlb3
	 0bkWYsDNL/xUn1pmTIsp9zPZ62KGs0zmsQIb6hXy0cqVPKutiFvh85GyLS+Y5meox1
	 ly/kOgTAipAIg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7239241062;
	Mon, 14 Apr 2025 16:08:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?=
 <nfraprado@collabora.com>
Subject: Re: [PATCH v2] docs: automarkup: Move common logic to add and
 resolve xref to helper
In-Reply-To: <20250408-automarkup-resolve-xref-helper-v2-1-e0a9b8fc7fdd@collabora.com>
References: <20250408-automarkup-resolve-xref-helper-v2-1-e0a9b8fc7fdd@collabora.com>
Date: Mon, 14 Apr 2025 10:08:05 -0600
Message-ID: <87a58ibuai.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> writes:

> Several of the markup functions contain the same code, calling into
> sphinx's pending_xref and resolve_xref functions to add and resolve a
> cross-reference, with only a few of the parameters changed (domain,
> reference type, markup content). Move this logic to its own function and
> reuse it in the markup functions.
>
> No functional change.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Changes in v2:
> - Moved repeated "Go through the dance..." comment to the helper
> - Dropped "Return the xref if we got it..." comment as the helper
>   returns None in case of failure
> - Link to v1: https://lore.kernel.org/r/20250407-automarkup-resolve-xref-=
helper-v1-1-9cac06ad580f@collabora.com
> ---
>  Documentation/sphinx/automarkup.py | 97 ++++++++++----------------------=
------
>  1 file changed, 24 insertions(+), 73 deletions(-)

Applied, thanks.

jon
