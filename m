Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3C34B1E53
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747278885; cv=none; b=BInWODLgJdOlL5VmOqAx42bsFwP3oLnxVhXC1rZELZn/8ynfhHfakz3UA1zdrBITUctqxPJmCeFmWF3yi1pRy5aq6Ftx1oWAF8V2VA3NvZ0jN8b0rjdzVhZXb7WYn4/vyZYrelvS+IFzn11/nGyZckWnS+8CSkInC8+1+n6+jts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747278885; c=relaxed/simple;
	bh=IOCEFRz0rLxPthSJBokv3GTefbVPTwP9IFDjIuQRQC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6c0/WkNIccNuit+QdWB/g7QT7xE/2CcW0onKWnhSiII/3fSELlRJ57bPz2fzlNglUoDv3gqjJpxF3zigIeRtKO4mmdpz6YnLDq91jeLZiv2gASy0ovkGh9efeJ9buNtRU9RBc76Z44eWGS67pihM3F/pryfHNGBTfHHxDspMzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lXHoYaFz; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lXHoYaFz"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2302d90c7f7so5603725ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747278883; x=1747883683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ke+ZFg39oEAH9MFkUYY9Zn5xmk5/KryZdAYwMes8gXc=;
        b=lXHoYaFzYo7avMLezUDgv6Vz/nHxwheVEPd5qQdGlSHug4LCLpJo5MfhWnQPRsgERX
         CXRf9r+CyQ9sSSoYqSI28NDuowizHhQcodSEiNd4YFgEGK70KBJZb5WCBA9qsqsLuvju
         93ihlOyCfPHYcMecJCPZ24n6KsJLBGTZVz1jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747278883; x=1747883683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ke+ZFg39oEAH9MFkUYY9Zn5xmk5/KryZdAYwMes8gXc=;
        b=tlI0S/VqgyazerQAwBw9OppYmheAa8T2ijnuV5y2VyVbGa/W0mP2Tvm9j2fj0bGAdn
         WrkFGBLSWaklsH6wYpIpDBYke63qJt4y//yCCxu9JORN+v78EngHECLyGQ3ojKmFFHPz
         DDNllzYqcdTKwex8xbaI36x8GkJhXMM7gN8gTG/nkeFiZ692za7G8WgutxEdZSmsV8xn
         bPqz07h6U+hB8mCwJwmsAVF1c5koy40IKTFeUN1nhCxGQUVlyHodWUlihhJDTN2tRE8m
         OqhcdTMegMewLMHhc2v4/e1LXNol/jTIooP2FsASWX4PfsLR9+vDCHLlfq1wmIYBQAUG
         4jJA==
X-Forwarded-Encrypted: i=1; AJvYcCXNItQnheF60hYhVuwN8En+HK1o9jSXArWzpKIqCoDQ93/OhWM/bDScnqOTh0tM71A4cKuwZSZ1flMXNBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YywZVN77a7jxvzIvdIF3WAyvGHfpy2V7XPXsvvWUh/M1zD6aGL1
	BDYFdhAuPBhkjOYPRddbpC9wtWzB3uSWl7RuA4DvRif5TSYwQ8RMeoWCP4EY9g==
X-Gm-Gg: ASbGncvYqcmEielg31Iv9u2/qGrvp05ryEZkVTzpzeb5q2jWQQFN/R+gNrG1ueI4qxU
	CNIECcR5Zml3/FKh3P5fxoqbeefhEuDfVmIrbX6qKUJJfSb5mECoZ/y7HJxVFn5AlPkHljK5Xc7
	QgOgEd4bWh7OUm3tFNx9gtw46/U8ZcfSlIDzVGXWTOqGqHiW303HH57meEkTV57EIRM4iTnfFxf
	HpSRLOhgjCfqm/IGEbMgd5qAPOwfh/ZlyYOtKB2pQg4soYl/ZEbUJaxNrlcoLccw1vqmqX90JJw
	C+2UuPRd5iK59s38IHr4T94ndn0OZD2AhiMuoksxvBoJtAvDEE5bkwQ=
X-Google-Smtp-Source: AGHT+IEkz3t/NsqU/U2zVJ4a5qJQjuW6PX05CnNCXqcsl+p+DgfP5vaPCqGJ1JhYCgvLJSX+Hrulzw==
X-Received: by 2002:a17:903:2350:b0:223:536d:f67b with SMTP id d9443c01a7336-231981a2dd1mr94079155ad.38.1747278883582;
        Wed, 14 May 2025 20:14:43 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:291c:c511:a135:fe23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7555026sm105355925ad.54.2025.05.14.20.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 20:14:43 -0700 (PDT)
Date: Thu, 15 May 2025 12:14:38 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Zaslonko Mikhail <zaslonko@linux.ibm.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Heiko Carstens <hca@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 2/2] zram: support deflate-specific params
Message-ID: <ystv6cvrdllh64eqkislh47a3bnx5d2lk42ox4eiuuubioin6u@gmt5pwbkwiz3>
References: <20250514024825.1745489-1-senozhatsky@chromium.org>
 <20250514024825.1745489-3-senozhatsky@chromium.org>
 <bec7391c-e40d-4633-a2d0-881eb6d18f19@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bec7391c-e40d-4633-a2d0-881eb6d18f19@linux.ibm.com>

Cc-ing Herbert

On (25/05/14 12:58), Zaslonko Mikhail wrote:
> Looks good to me.
> 
> Just a minor comment. If we intend to use raw deflate only, like we do now (no zlib header or
> trailer for the compressed data), we should probably change deflate.winbits to unsigned and
> pass '-deflate.winbits' to zlib_deflateInit2().

Yeah, so in zram we can use only raw deflate (we decompress only what we
have compressed earlier and the data never leaves the device.)  But in case
of Crypto API I actually don't know, added Herbert to the Cc.

> Also, here is another patch suggestion from my side on top of this one. 
> Let me know what you think.
> 
> ---8<---
> 
> zram: Utilize s390 hardware deflate acceleration for zram
> 
> Utilize s390 hardware deflate acceleration for zram deflate compression
> by default when the facility is available.
> 
> Signed-off-by: Mikhail Zaslonko <zaslonko@linux.ibm.com>
> 
> diff --git a/drivers/block/zram/backend_deflate.c b/drivers/block/zram/backend_deflate.c
> index b75016e0e654..5bfc57522e3a 100644
> --- a/drivers/block/zram/backend_deflate.c
> +++ b/drivers/block/zram/backend_deflate.c
> @@ -22,10 +22,23 @@ static void deflate_release_params(struct zcomp_params *params)
> 
>  static int deflate_setup_params(struct zcomp_params *params)
>  {
> -       if (params->level == ZCOMP_PARAM_NOT_SET)
> -               params->level = Z_DEFAULT_COMPRESSION;
> -       if (params->deflate.winbits == ZCOMP_PARAM_NOT_SET)
> -               params->deflate.winbits = DEFLATE_DEF_WINBITS;
> +       /*
> +        * In case of s390 zlib hardware support available,
> +        * use maximum window size and level one as default compression
> +        * parameters in order to utilize hardware deflate acceleration.
> +        */
> +       if (params->level == ZCOMP_PARAM_NOT_SET) {
> +               if (zlib_deflate_dfltcc_enabled())
> +                       params->level = Z_BEST_SPEED;
> +               else
> +                       params->level = Z_DEFAULT_COMPRESSION;
> +       }
> +       if (params->deflate.winbits == ZCOMP_PARAM_NOT_SET) {
> +               if (zlib_deflate_dfltcc_enabled())
> +                       params->deflate.winbits = -MAX_WBITS;
> +               else
> +                       params->deflate.winbits = DEFLATE_DEF_WINBITS;
> +       }

I'm not sure if we want this much of s390 specific code in the generic
zram/Crypto API code.  Both of these params can be configured by user-space
via the algorithm_params device attribute.
