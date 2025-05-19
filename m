Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24743F9D2;
	Mon, 19 May 2025 14:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747666776; cv=none; b=dnKOldbScWxygX/5S2Y541Nh4R7bkmsD0/huzUn0FkKKGq8EsovWHel1IDZlOTNMzm7ErtXJY9zbYiY2iv96J9Pf6MJYnLJuqbqxOQ0B/qgx+FF3chr1fVcKVN9VwnXwycQYRbKgR/nzaerWHytAlh3atSOK+8QIXnljIhY6FKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747666776; c=relaxed/simple;
	bh=LlINlnvjkPrNwRHqI0nwGTekbcuufu1HgbzTRAhzUbY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ippFdmtY4/haL3ykLV8lX2yLI5F446ZFwKj28Ljb2lWATABIvFXRCUkw1TFXrA6WZMsD74s+lImVwBanIddaE0VKqTCXqYZpKu2zNEo/IeD/O+CPVF+UCZhac9a2UgAiWnWN7Oxql7htS+xNKcDCzxUGKlbvRDIEiBXAmQ04XqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=BC5MN+Tv; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="BC5MN+Tv"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EA1FD41086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747666774; bh=+rX5+eunrT2/Z/JqYzLSRdS/nAoA5hDjcDv7ReJ+phc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BC5MN+TvAPKphNSf29MF+MCPM2Fuqns7MMGVFRi1YCn08eO2Oucwn6AXYqto2hvXr
	 ANqicqrNEGDnTZDLuPtQX9GxnUk0+ZiUUJGO6/0gdumyFS93rQgxje5HnpwHSVzsNj
	 Of5jxXj+yDRn0iQWoCJFRr28dSvxqhAFFS1B7ZR3+upWTHZ8tjd7TPKYcvPg9IwMHe
	 56abe+fJ0aF+3zDvIEhPfs3BBiQIucBjCa008Gn9hOwmrZAkAWTnoSJoW89WWirtZf
	 wylnTRwEPsxkcM83spIDoWIdH4oFN76c6infWRxgRnJWuDMajJA0CxTQfBvvouGsp4
	 q+MEVQKzxsf3A==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EA1FD41086;
	Mon, 19 May 2025 14:59:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Donnellan
 <ajd@linux.ibm.com>, Frederic Barrat <fbarrat@linux.ibm.com>, Bagas
 Sanjaya <bagasdotme@gmail.com>, Ming Lei <ming.lei@redhat.com>, Lukas
 Bulwahn <lukas.bulwahn@redhat.com>, Alyssa Ross <hi@alyssa.is>, Beau
 Belgrave <beaub@linux.microsoft.com>, Nuno Das Neves
 <nunodasneves@linux.microsoft.com>, Eric Biggers <ebiggers@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v2] Documentation: ioctl-number: Update table intro
In-Reply-To: <20250508005838.8381-2-bagasdotme@gmail.com>
References: <20250508005838.8381-2-bagasdotme@gmail.com>
Date: Mon, 19 May 2025 08:59:29 -0600
Message-ID: <87y0usir3i.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Introduction paragraph to the ioctl numbers table states that only
> ioctls in up to ancient Linux kernel version (v2.6.31) for x86 arch are
> listed. This is inaccurate as the table also lists ioctls from non-x86
> archs and the kernel is continously developed (currently in v6.x).
>
> Update the paragraph accordingly.
>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
> Changes since v1 [1]:
>   - Do not mention kernel version (Lukas)
>
> [1]: https://lore.kernel.org/linux-doc/20250507055145.23345-2-bagasdotme@gmail.com/
>
>  Documentation/userspace-api/ioctl/ioctl-number.rst | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied, thanks.

jon
