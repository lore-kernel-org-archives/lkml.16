Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DB1276050
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223428; cv=none; b=oHwPJuxKpzUagxa3bk0T5+A4AGm17lccW2DbkAMt65eh/Me3maFl4ep+lZ1RabZuAda3EghgYoGzPalccPAU7NA9amgkaT4G65l8XqsMEBPi2jV+/gx6zbhVH9w2YnhGUQL7T0nRVO2BBcfrPETz4CzKT6Bv48BV083qcImSYOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223428; c=relaxed/simple;
	bh=04rOBKhcjCW+RhY80oosYuyxIou3ZD3wjiMDthrhvGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkFHh40uJaSGLrFTDqcIz3JPFKYezRUkLslnFBmmXIRBccNS24AxKue3xiu0jaVxcDMYBgy9giHS9o3DQhPTX3n3jbI2WuxdfpiI4eD+vr/RD32XBnoJk3RMTE/O1EbiBmH5zFfv392Gzc0GrmH2peY7RtalD5xnJuDTXijGfok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=tZG1ZEsx; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="tZG1ZEsx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1744223415;
	bh=04rOBKhcjCW+RhY80oosYuyxIou3ZD3wjiMDthrhvGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZG1ZEsxUrf4+rAZp8doWpyR1PQEGNCEIOqbl1O+t91BttcODgHFItV5yNduylvl1
	 Wy6SHxjHA+ICCc9wllC7518RkpgpFLn9/YdeUKH/pqO2DJpVxBNU4OcrwRHnNOFZLr
	 1wv7TrSvZeEEgzH2SAx1MPbNOnAtOCBKMPJSL+Ag=
Date: Wed, 9 Apr 2025 20:30:14 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jemmy Wong <jemmywong512@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fix mismatched parentheses
Message-ID: <bb44ee43-b08f-4a4a-bdde-dda785756680@t-8ch.de>
References: <20250409181934.5589-1-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409181934.5589-1-jemmywong512@gmail.com>

Hi Jemmy,

good catch and thanks for your patch!
There are some small formal issues with it, though.
Could you fix those and send a v2?

The patch subject should start with "tools/nolibc: ", and could be a bit
more specific: "fix mismatched parenthesis in minor()"

(more below)

On 2025-04-10 02:19:34+0800, Jemmy Wong wrote:
> Corrects an imbalance where opening parentheses exceed closing ones.

Use imperative language: "Correct an ..."

As this is a bugfix, a Fixes tag would be great.
In this case:

Fixes: eba6d00d38e7 ("tools/nolibc/types: move makedev to types.h and make it a macro")

> Signed-off-by: Jemmy Wong <Jemmywong512@gmail.com>
> 
> ---
>  tools/include/nolibc/types.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
> index b26a5d0c417c..b57e054cca82 100644
> --- a/tools/include/nolibc/types.h
> +++ b/tools/include/nolibc/types.h
> @@ -201,7 +201,7 @@ struct stat {
>  /* WARNING, it only deals with the 4096 first majors and 256 first minors */
>  #define makedev(major, minor) ((dev_t)((((major) & 0xfff) << 8) | ((minor) & 0xff)))
>  #define major(dev) ((unsigned int)(((dev) >> 8) & 0xfff))
> -#define minor(dev) ((unsigned int)(((dev) & 0xff))
> +#define minor(dev) ((unsigned int)(((dev) & 0xff)))
>  
>  #ifndef offsetof
>  #define offsetof(TYPE, FIELD) ((size_t) &((TYPE *)0)->FIELD)


Thomas
