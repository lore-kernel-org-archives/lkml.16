Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B54326E652
	for <linux-kernel@vger.kernel.org>; Thu,  6 Mar 2025 16:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280202; cv=none; b=PMUEYqIzpGZcl+7Rx5uIqoDEf9n3f/XpecVpyn5v8MpBILIhs3OaJTtP+IAi7hrdMXwziW6rNBIvGihVzWtI1/tiYKfgleL9UbKJEY4zxTFv2Xm7aQBocyTtCOLoz8O8JE6XlXs2sHnBDh3bZftyrpGQJCxm7MrrBGSN9YNmzRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280202; c=relaxed/simple;
	bh=PjhWuJklD9JzInF0scLU9khPhj/MI70yw4moDauOVtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCiqDjNMW1lrfGu4gXZjXee8nOZ0hIaYdnFmovWtaRUMCoDCn/Mo0QHtMrgsAeMOdgLUngTY6BWzIbzwLnVUlAfIhPX1be0ptjuqFIfY1FdBWGf7WVj5w0hbowMe4M4RAszWPm2VZvy9owDJoyBePZHqix0WuPsvy513K/EyE/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=KEz1ES3z; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="KEz1ES3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1741280195;
	bh=PjhWuJklD9JzInF0scLU9khPhj/MI70yw4moDauOVtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KEz1ES3zLkG8cpJf8UKHx0HtvgT6HjW7U4ZBF3LqFuFfcqyXMgG1Gh2bLD/TlIkoE
	 KxtnI0/DCbWtilowb9KW7+hVOOlsDXr2etIB9ecJF8CLsdG3mnKcNy1b987wjMYa0a
	 JTiIuOYOnn3rudSLv1yAVoHKuGpEmSVy4KksfSQA=
Date: Thu, 6 Mar 2025 17:56:35 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Louis Taylor <louis@kragniz.eu>
Cc: Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] tools/nolibc: process open() vararg as mode_t
Message-ID: <414ed5b1-825c-4d81-8c86-d261716da64c@t-8ch.de>
References: <20250304075846.66563-1-louis@kragniz.eu>
 <20250304075846.66563-3-louis@kragniz.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250304075846.66563-3-louis@kragniz.eu>

On 2025-03-04 07:58:17+0000, Louis Taylor wrote:
> openat() uses mode_t for this, so also update open() to be consistent.
> 
> Signed-off-by: Louis Taylor <louis@kragniz.eu>

Acked-by: Thomas Weißschuh <linux@weissschuh.net>

> ---
>  tools/include/nolibc/sys.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> index a8dca5ac6542..5d8adc778575 100644
> --- a/tools/include/nolibc/sys.h
> +++ b/tools/include/nolibc/sys.h
> @@ -810,7 +810,7 @@ int open(const char *path, int flags, ...)
>  		va_list args;
>  
>  		va_start(args, flags);
> -		mode = va_arg(args, int);
> +		mode = va_arg(args, mode_t);
>  		va_end(args);
>  	}
>  
> -- 
> 2.45.2
> 
