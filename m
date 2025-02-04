Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FBF203710;
	Tue,  4 Feb 2025 21:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738703282; cv=none; b=RSMzFX9IKbYFAiYH6pcU2Rg2yfcYVATtXQfJaNR0QpZWofT7AShfQ1C7XXn88Ylcn94TPYIhXcbwVR6ajdfOd33qh0eGj+7kpvxdnr0jKmCF7ddO1CzoiddzkcxzCoJ9Z44gyNP+q6MIwPfmkTqycWlMMD17+ulnSNvzAUJhs7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738703282; c=relaxed/simple;
	bh=rcaNZChfd2ZD9HBStRHvsVmpa1eIpRh3TeQHU/UJrV4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gu0XmAHRlbGNfiUjFD2y8jmjtFeylxgC/8KFV3iRYummjiik0cZMM6zD5XSqWU+6AcKo7OZzkGCesUTWuVObrlt9mQRTwqQJj4FR8bOlxBcA0gvyQtzZKdmGvuzImJxnT9BsaALtgIka1v35zKajPOxdZt/eZhD6klI09Zl0zaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C624392009C; Tue,  4 Feb 2025 22:07:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C01D792009B;
	Tue,  4 Feb 2025 21:07:56 +0000 (GMT)
Date: Tue, 4 Feb 2025 21:07:56 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Julian Vetter <julian@outer-limits.org>
cc: Arnd Bergmann <arnd@arndb.de>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Matt Turner <mattst88@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
    Linus Walleij <linus.walleij@linaro.org>, 
    Al Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alpha: Remove IO memcpy and memset
In-Reply-To: <20250203141800.69126-1-julian@outer-limits.org>
Message-ID: <alpine.DEB.2.21.2502042056540.41663@angie.orcam.me.uk>
References: <20250203141800.69126-1-julian@outer-limits.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Feb 2025, Julian Vetter wrote:

> Recently a new IO memcpy and memset was added in libs/iomem_copy.c. So,
                                                      ^
 This has to be lib/iomem_copy.c.

> remove the alpha specific implementations and use the one from the lib.

 You're dropping the memory barriers, which the generic code doesn't have, 
so should we agree to switch to the generic version it has to be confirmed 
what the right course of action is:

1. Use wrapper calls with memory barriers.

2. Add memory barriers to generic code.

3. Conclude that dropping is correct and adjust the callers where 
   applicable.

4. Something else maybe.

See below for the actual places.

> diff --git a/arch/alpha/kernel/io.c b/arch/alpha/kernel/io.c
> index c28035d6d1e6..0d24a6ad682c 100644
> --- a/arch/alpha/kernel/io.c
> +++ b/arch/alpha/kernel/io.c
> @@ -476,177 +476,6 @@ void outsl(unsigned long port, const void *src, unsigned long count)
>  EXPORT_SYMBOL(iowrite32_rep);
>  EXPORT_SYMBOL(outsl);
>  
> -
> -/*
> - * Copy data from IO memory space to "real" memory space.
> - * This needs to be optimized.
> - */
> -void memcpy_fromio(void *to, const volatile void __iomem *from, long count)
> -{
[...]
> -	while (count > 0) {
> -		*(u8 *) to = __raw_readb(from);
> -		count--;
> -		to++;
> -		from++;
> -	}
> -	mb();

 Here...

> -void memcpy_toio(volatile void __iomem *to, const void *from, long count)
> -{
[...]
> -	while (count > 0) {
> -		__raw_writeb(*(const u8 *) from, to);
> -		count--;
> -		to++;
> -		from++;
> -	}
> -	mb();

... here...

> -void _memset_c_io(volatile void __iomem *to, unsigned long c, long count)
> -{
[...]
> -	/* And finally, one last byte.. */
> -	if (count) {
> -		__raw_writeb(c, to);
> -	}
> -	mb();

... and here.

  Maciej
