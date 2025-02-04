Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A7A1EEA29;
	Tue,  4 Feb 2025 17:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738689845; cv=none; b=buc6sPPLi1GEr2mP+4HhFTS8eQkK6cMKZTjI0eBvGkX3NeD+UfyNhIttTROWvcqiN6uOU4VA9gNp1pniuCz8np8k5/YK2UNcWHdJYC5l/DX12Yd0nFye6xe1kvzm35aGlyOFTKFQbutPzldunnKqOS+grouuz2aisfWDG7cFPxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738689845; c=relaxed/simple;
	bh=39pInEh3q1IFmEaa8nOwD01qC77XLpVyeRi7YSRYlBc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZF1IFb6v/H74DBxd6zgLj9yWPMlXPKH4w9mtt8VT/YcV+NA6jYoHsz/KSW40QmBJD5oP6xSQ2YLoqVBbENWoEaOqM+++RXEDmVu6/ztt2CTHAZf3amhXzzPXN4hsDqlNy976HjCYodJdkN+x+j9UPvIMWVUuMfhHM/gn3pexnvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=eprqBJis; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="eprqBJis"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EA0DD404FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738689841; bh=sp98JhHT/AP4kteBpfNZ7Fqv6VXyNGJmMYxsIur+xP4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eprqBJisfclCjO9+qOnXjFXpEQ/5zBFN1E8+fCbsJLATaOkFKx9jTzMdnZruvL589
	 3hqQw+JbzNs8bFZfLX1EpuBQtEgCbiqp89QmaGiQYgHyrlKiLS1kstslXhxjU6Lb57
	 ASXOgs/eimMeSPzUYkV1HqZRvXsDwwguZTA5smsgNUqvEsQ4Sobkaaeuc6Gx0pdEwV
	 9cF5u6ujbYjdXmF91ARUd5IIQcNfgFh/v9FZjxk02NiSGRDXaTEp+hku39p+5LBh9U
	 7IdymOIKDKaT66fuuPJTeiptPF9366uDdUws+kNVwdKPkVanq96Gw11PjBQxygc9sk
	 Eb0BMTd9nuL+g==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EA0DD404FA;
	Tue,  4 Feb 2025 17:24:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Vegard
 Nossum <vegard.nossum@oracle.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC 2/6] docs: extensions: don't use utf-8 syntax for
 descriptions
In-Reply-To: <c9e7d86efa4614e970f5cb42540ee0791d6a7118.1738166451.git.mchehab+huawei@kernel.org>
References: <cover.1738166451.git.mchehab+huawei@kernel.org>
 <c9e7d86efa4614e970f5cb42540ee0791d6a7118.1738166451.git.mchehab+huawei@kernel.org>
Date: Tue, 04 Feb 2025 10:24:00 -0700
Message-ID: <87v7tpei8f.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> None of the descriptions at the Sphinx extensions are using
> non-ascii characters, so no need to place them under u"""
> notation.
>
> Also, according with:
> 	https://docs.python.org/3/deprecations/pending-removal-in-3.16.html
>
> the 'u' format code is scheduled to be removed in Python 3.16.
>
> So, let's just use """.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

...plus it's all utf8 by default anyway.  I'm kind of surprised we have
these, I guess they must be a Python 2 holdover.

jon
