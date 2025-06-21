Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE47B1624E9
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 08:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750494436; cv=none; b=NS4yNHpA/RyqN1k4+7LSg0SZ59bIiTa1eV4jqLaU8UxIMCG987/Zv6hhiJZxT0RNbIj4CJgbE3UFIX4TUHlot43fRIjpwuDn969K/ELZPNOSdNwzCScPRRrtaDeL5HLJZW2h7HRJicC+KiU9fbVJ4KVbifIGcOl0Y9dlAv4CGew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750494436; c=relaxed/simple;
	bh=6HjU2hsPrztZCh50LmvQYW1VnZOsVHqFWf5Pf9ZgXAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBRXDTCji4upWSTmmTaL3iN3+uHXCV82GSH2zGPzkKG1IPIdvpXG+VllM7MsNCfC8/DebiI3S2QaoTJ3tBWjOT8mXeqC2mgvH6Riv9havKF+ZN7W6A2fqAFrJhR+5d4DIR86OHdcYWAYqQ4TE1ORemEpuoxHW+m4AmC8lARsNxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=l11zp3/Y; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="l11zp3/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1750494432; bh=6HjU2hsPrztZCh50LmvQYW1VnZOsVHqFWf5Pf9ZgXAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l11zp3/YQf6lmeEI4vZm9WvJYn+DqzaLGa4IhW7+Y1Vnu2I4Y7ZZj6MgLP3QYbQDS
	 Kn1g7RsFCw31w8zw3Sgp1/BEzwiMYzVmCXFa1HTrHZ5e5Y+OGoZc04hrTWYox0OwlG
	 /lf9v69Kb/0wAThZZfcfc/saV68aOB7FD0X61KJo=
Date: Sat, 21 Jun 2025 10:27:11 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Willy Tarreau <w@1wt.eu>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] tools/nolibc: add missing memchr() to string.h
Message-ID: <d7b81639-c53c-4186-9e30-04137576a1f1@t-8ch.de>
References: <20250620100251.9877-1-w@1wt.eu>
 <20250620100251.9877-5-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620100251.9877-5-w@1wt.eu>

On 2025-06-20 12:02:51+0200, Willy Tarreau wrote:
> Surprisingly we forgot to add this common one. It was added with a
> per-arch guard allowing to later implement it in arch-specific asm
> code like was done for a few other ones.
> 
> The test verifies that we don't search past the indicated length.
> 
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  tools/include/nolibc/string.h                | 15 +++++++++++++++
>  tools/testing/selftests/nolibc/nolibc-test.c |  2 ++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/tools/include/nolibc/string.h b/tools/include/nolibc/string.h
> index 163a17e7dd38b..4000926f44ac4 100644
> --- a/tools/include/nolibc/string.h
> +++ b/tools/include/nolibc/string.h
> @@ -93,6 +93,21 @@ void *memset(void *dst, int b, size_t len)
>  }
>  #endif /* #ifndef NOLIBC_ARCH_HAS_MEMSET */
>  
> +#ifndef NOLIBC_ARCH_HAS_MEMCHR

So far we only have added these guards when necessary,
which they aren't here. Can we drop them?

> +static __attribute__((unused))
> +void *memchr(const void *s, int c, size_t len)
> +{
> +	char *p = (char *)s;

The docs say that they are interpreted as "unsigned char".
Also, can we keep the const?

> +
> +	while (len--) {
> +		if (*p == (char)c)
> +			return p;
> +		p++;
> +	}
> +	return NULL;
> +}
> +#endif /* #ifndef NOLIBC_ARCH_HAS_MEMCHR */
> +
>  static __attribute__((unused))
>  char *strchr(const char *s, int c)
>  {

<snip>
