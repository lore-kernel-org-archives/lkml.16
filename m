Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC7E1B3929;
	Mon, 14 Apr 2025 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744648740; cv=none; b=oHoAkXLYcspOB9bCO2pMpDSxQJ6OViMQN/BunEM0dMOP5H+HFk5a/WPDWTT0XGRVXnTUsdt3xBtqTjZbCRJjAIcXsKAVqrLU5t4K2Gh9HhavWpZlhRMlxEa+kUqpIcE2P7Ke4TnjNuSD5FJ1eARbDyioSgV/vNj0jJD+ySiG6N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744648740; c=relaxed/simple;
	bh=/0cVtE8Q3MLwLuUw/RkYfhOGTI/fmx+tmu0Sq46Ejxg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R/bkq0qeaeVXosHswkVjeJdFh4DWBUNdbDaiwPbFuoQMf1TqeHp/W5PmLXp3LnwOIYLFEE1WfRoJORFww8+LbkdIonBCSSfxs6JUlmTc2b6nEYvAOCgxxOwJwoy0i08UyTes1VqLWgSCimLifBclJeTmGe7MkckMCv6QMdsqMK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=A1ZSgSe/; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="A1ZSgSe/"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8891041062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1744648737; bh=2UkZ8GQ5xYZ4ajvmGKXu1/uFI0khvnYs9HAESy83j9w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=A1ZSgSe/is/LTtUgJrR+wv/LSt2BU15GyFhPfdUVTs0eoC5QFu2aco7uDjhBn/vSk
	 VsmW+25ZddEvORxLgLT0Tsxic0NByNja4dD9/pmd0v4R7Peye0Tkn3er8/FLvqW+yG
	 Tg+3yWBcaUGiUAcamHrVocM0yi3Cscgg47zGB7JHKf11PdoGQHq3nmvPvdZ/YrPkp7
	 fJr6hX/VlH/3DULdGNazPuWTVJMN//PwavqS7GwiOniUMdLP/QI/S/vKWw42zeB7+C
	 7i1V4TE/ygb6P2vX9uJ8oyRqcRiIvD51W0PgXLbq29GTWQwWNIoZ97VEIMDff40jm3
	 rWH727+g/x3Jw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8891041062;
	Mon, 14 Apr 2025 16:38:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>,
 rdunlap@infradead.org, rbrasga@uci.edu, kevinpaul468@gmail.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org
Subject: Re: [PATCH] Added usb_string function to a namespace
In-Reply-To: <20250405165116.147958-1-kevinpaul468@gmail.com>
References: <20250405165116.147958-1-kevinpaul468@gmail.com>
Date: Mon, 14 Apr 2025 10:38:56 -0600
Message-ID: <87ecxuaean.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Kevin Paul Reddy Janagari <kevinpaul468@gmail.com> writes:

> with reference to WARNING:
> Duplicate C declaration, also defined at driver-api/usb/gadget:804
> There is a function usb_string in the file message.c,
> there is also a struct usb_string in the kernel api headers.
> The docs is unable to index the function as the index is occupied by struct
> This fix adds messgae.c to the usb_core namespace (in docs) hence providing
> usb_sting a unique index usb_core.usb_string()
>
> Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
> ---
>  Documentation/driver-api/usb/usb.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
> index 89f9c37bb979..976fb4221062 100644
> --- a/Documentation/driver-api/usb/usb.rst
> +++ b/Documentation/driver-api/usb/usb.rst
> @@ -161,6 +161,7 @@ rely on 64bit DMA to eliminate another kind of bounce buffer.
>  .. kernel-doc:: drivers/usb/core/urb.c
>     :export:
>  
> +.. c:namespace:: usb_core
>  .. kernel-doc:: drivers/usb/core/message.c
>     :export:

I hate this sort of workaround ... but so be it.  Someday maybe it won't
be needed...

Applied, thanks,

jon
