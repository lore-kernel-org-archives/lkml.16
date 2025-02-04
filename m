Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F282153DC;
	Tue,  4 Feb 2025 16:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738687235; cv=none; b=BSEL8XSYdDhJ9AxIBRyA/j32nhYhV2S/n2Yp/CDDHV++qn+FiaVrnR4jqgVlnbZE6qQeiO1rVyWd1VONBjFxB+j/2oujejJwR3D90GsNg2BbVXd1LAznLc9tmqnELNmZUBcIad3HDRy8gd3qyGegJSa4auj1uSItCqaJyukeAZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738687235; c=relaxed/simple;
	bh=yBVTtCAVbrag4UCw1n71e8nX3giOSwswsmnLhEI005I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Tun/Qt2slP5Fjr928eOyhIVnbzseTGl70ku3MVMfEXLzyCVJiJl/mBYAzezfLjQykMap9mwjjdb8U3f5iHXobTxwmcE7qAWTTWeo1BKEhfLV5zGGUP+9xgZKGdyUPGqUvQUpygGbQ0nbv2CnvYqk44geYMJ5vBS2w9Bxa2H1DIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=W3pksF1E; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="W3pksF1E"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B1928404FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738687231; bh=814JZKK0hHBQeEM7ynRHTA8BlgLw+Dyd79Aln/7ewUU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=W3pksF1EcN5Szp+iub+wkmSIWsTRlMfHxsB0/DWCvV/Kpvwc+jGNttpuvEYpZTmEP
	 pXG+vh8sAebbdr3QmEe+Ltcw4aHRNN7QeODUlY1+P35FS/o4SwXkjQTCDhZMmWvljy
	 iIHzGUZn1NAXR2QXTkd9Hp5H+N8hU/SyqIDxg1oWvRBSl/oID1TYyoSb83u34wa4zZ
	 Kc/I0NqjqcX6OpmjrTi2SEe6eHbDJzkRUq2RaxvjbBYnPjpaEJ7CCMvDUbmtRm4rBJ
	 US5pS/1ye8bKmnNzmsRl4IE8zvCLh8Mz8juEyBx3quTcMMYGCpvbkXCL6oV4lecTal
	 dQxH3vMgtSUig==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B1928404FA;
	Tue,  4 Feb 2025 16:40:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: I Hsin Cheng <richard120310@gmail.com>, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, I Hsin Cheng
 <richard120310@gmail.com>
Subject: Re: [PATCH] mm: pgtable: Fix grammar error
In-Reply-To: <20250204093326.206007-1-richard120310@gmail.com>
References: <20250204093326.206007-1-richard120310@gmail.com>
Date: Tue, 04 Feb 2025 09:40:30 -0700
Message-ID: <877c65hddt.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

I Hsin Cheng <richard120310@gmail.com> writes:

> Fix "due high contention" to "due to high contention".
>
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>  Documentation/mm/split_page_table_lock.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
> index e4f6972eb..ced47a23e 100644
> --- a/Documentation/mm/split_page_table_lock.rst
> +++ b/Documentation/mm/split_page_table_lock.rst
> @@ -4,7 +4,7 @@ Split page table lock
>  
>  Originally, mm->page_table_lock spinlock protected all page tables of the
>  mm_struct. But this approach leads to poor page fault scalability of
> -multi-threaded applications due high contention on the lock. To improve
> +multi-threaded applications due to high contention on the lock. To improve
>  scalability, split page table lock was introduced.

Applied, thanks.

jon
