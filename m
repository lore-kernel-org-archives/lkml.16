Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25CE26ACC
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747279967; cv=none; b=oDHZCL/JovJcgsrbv0gUvDr33K2FZjff1/bAOR4WiKCbI28bIS51D8Orx5qHy7jkPey3UBAorCDbDIFIV2aMmiQvOQLsuk3eXxDjZTnDr60gnOEHtsGFV6RfjzLS0AQJP5rIBiL1dQ9Jru/GBpj59Q9CBhVUD01zGiIB/UEnxBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747279967; c=relaxed/simple;
	bh=xlE1BjnH8LiVbYaaPBOKpa01JoxrxoQuUPgfJgxIwxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzjcPlcR2ighLP28X6eQ6Xlkdg0L/nswBBh8VkOMAtf7Vg7DP8K7HqLUQShuW3/xMdicMgctoFkCsC5TZJnqep7JQ0l4BD4grw+MR6iMVH8gMctDskGg9iWyHN6j99+2eVFhjywhs6xVp9Sf5RKJ835IkqGhGyhzzr3oWcTiHVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fMul68mP; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fMul68mP"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-741b3e37a1eso502566b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747279965; x=1747884765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1g/suZwDMtwCwOejPygUimT1SDv6FRw8jhecB+9KAkU=;
        b=fMul68mPsYuM1nrmEDkBnmekXs/3LQHfzxHDUZ9CgLyF5pvDMKNtbulQwNHGWCQuvy
         tagua7/93yE3r6BWISrFw9UzkpONh8a2nUWsY8DuyhaGbvlKw0anYgfptAHMvYqY21Bd
         EM2AD+WP3s6pjrCwhYXRsHq6W3p09mOPa2KuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747279965; x=1747884765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1g/suZwDMtwCwOejPygUimT1SDv6FRw8jhecB+9KAkU=;
        b=gYVWXI9ubqHyG9/pDn8pCyGPP2sGTQ1alHvvVEvHwAHj509iER/9cqS7HS/AN6o52Y
         DPIvsRB8qvhzQqyDuwucwgALQoaU2cvSoDlfCbileJze1bMJ79dkHG644LODnT5XqOVp
         uRE/xkOKH/2A4wcsctBrPu1SMIfEtHvoq1WMBbtsEa9dqC0cRBMmvuLcN8BC3CF0AtLC
         +H9xSKYZCLb9bWtMsU3qRWLz1BFuNAkLZ9UFY7V6JDcEN92KxLJSt1VRk2IqpVdj8oUl
         KdOT8dGUBZTUOL1ULRMIrZMSXKIraysr8gxmVj85XrfFTyF9xYDzkpRObamHSbyx6Trl
         XO5w==
X-Forwarded-Encrypted: i=1; AJvYcCW5uOjC/e+34ICT19hl7uUTkcDlLBwMK26cRnscjLFJsPX3uX0AL+ddhBupNB9RonhUCJidHZ8TOaequeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuS0ZeqCJ77B2BXHIXO9GIQrGVAs9ogaVDPYTMW2+h0MpcdBYs
	kLdjc5y6vr246eHB4Jw2yNSEmKeQqilFVuFJFoshldHn6LftNyeLODrKcFy6+Q==
X-Gm-Gg: ASbGnctSm5IkEwxeVlLVqBemKuFB0pI6DHASJGumOGg/Wyc4FXfkbU/3w/g7A2hXZab
	2axfm3RqcPymnyEeW+bdOFa2uymRiTj+H6lSk745E8fNJgvSJg0DZBzZQVztibG0pVy/zhkC+dp
	5D+7PEM5kKtg6Lkz2i26IEYR8VGNevGARb+ER8+nlwKY+7miUKSIY01Ear2QnyuwzLU0csasF1T
	hycCcZqBTUR9XCc+85FF8kDa0JJuIIT+zQOl73UpKqncusbDoP9Wl7aGcO6ZTOZjLN6v83AHbCy
	Gk9CmCVmQ6lPMyrFU0Gq6rgDQPZlW+SxgWddjkb/InQlPjTJBtzabY0=
X-Google-Smtp-Source: AGHT+IFMDL27J4Xfo5AX374nk2UIjh5s2nm/2nbFAWtcSmHlepcaluh1TqSJym39cx/9MwWz+2EWuQ==
X-Received: by 2002:a05:6a20:6a0c:b0:1f5:7b6f:f8e8 with SMTP id adf61e73a8af0-215ff08594dmr9177059637.6.1747279964958;
        Wed, 14 May 2025 20:32:44 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:291c:c511:a135:fe23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234af2c287sm8231325a12.41.2025.05.14.20.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 20:32:44 -0700 (PDT)
Date: Thu, 15 May 2025 12:32:39 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Zaslonko Mikhail <zaslonko@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Heiko Carstens <hca@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 2/2] zram: support deflate-specific params
Message-ID: <qddzdpkjsi6plu7jih5vau3xq5kjucnocoeoz7ewqbrzoiwgt6@zio43bbj5r2z>
References: <20250514024825.1745489-1-senozhatsky@chromium.org>
 <20250514024825.1745489-3-senozhatsky@chromium.org>
 <bec7391c-e40d-4633-a2d0-881eb6d18f19@linux.ibm.com>
 <ystv6cvrdllh64eqkislh47a3bnx5d2lk42ox4eiuuubioin6u@gmt5pwbkwiz3>
 <aCVcsB-M9cKdq8d4@gondor.apana.org.au>
 <2bnnkkwhqor73ls7dvsxlt57tp2u3xf2o27opkveuqwgh3xf2j@5kzgq4eej3cw>
 <aCVeeWCawIETqkfG@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCVeeWCawIETqkfG@gondor.apana.org.au>

On (25/05/15 11:24), Herbert Xu wrote:
> On Thu, May 15, 2025 at 12:19:25PM +0900, Sergey Senozhatsky wrote:
> >
> > OK, so do we want to limit user-space and permit only "raw deflate"
> > winbits values. that is only negative ones (either explicitly or
> > implicitly (by negating the value before zlib API calls))?
> 
> I would suggest that we stick with the zlib values, but filter
> out the ones that we don't support/use currently.  If you've already
> exported this to user-space then obviously you'll need to decide
> on how to maintain compatibility but that should be specific to
> zram.

This is not exported yet.

I lean toward not filtering/limiting anything and just permit
what include/linux/zlib.h promises [1].  Would that be OK for
Crypto API?

[1]
----

     The windowBits parameter is the base two logarithm of the maximum window
   size (the size of the history buffer).  It should be in the range 8..15 for
   this version of the library. The default value is 15 if inflateInit is used
   instead. windowBits must be greater than or equal to the windowBits value
   provided to deflateInit2() while compressing, or it must be equal to 15 if
   deflateInit2() was not used. If a compressed stream with a larger window
   size is given as input, inflate() will return with the error code
   Z_DATA_ERROR instead of trying to allocate a larger window.

     windowBits can also be -8..-15 for raw inflate. In this case, -windowBits
   determines the window size. inflate() will then process raw deflate data,
   not looking for a zlib or gzip header, not generating a check value, and not
   looking for any check values for comparison at the end of the stream. This
   is for use with other formats that use the deflate compressed data format
   such as zip.  Those formats provide their own check values. If a custom
   format is developed using the raw deflate format for compressed data, it is
   recommended that a check value such as an adler32 or a crc32 be applied to
   the uncompressed data as is done in the zlib, gzip, and zip formats.  For
   most applications, the zlib format should be used as is. Note that comments
   above on the use in deflateInit2() applies to the magnitude of windowBits.

     windowBits can also be greater than 15 for optional gzip decoding. Add
   32 to windowBits to enable zlib and gzip decoding with automatic header
   detection, or add 16 to decode only the gzip format (the zlib format will
   return a Z_DATA_ERROR).  If a gzip stream is being decoded, strm->adler is
   a crc32 instead of an adler32.
