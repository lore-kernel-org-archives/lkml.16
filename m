Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA811E3DDE
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747191405; cv=none; b=mvje0C1XaTNM6xs+i6cBUSavilX0zKzgCiZZhv9iyEZ2yCq77YiLAm9h6OUVzGDqDsSvEysQ9D79+MNrntan37Dy24SKFX8wRZ6WiEIsH3ZCbWX/d+6RUVmb+GhJoaxPJeFyzhosH8joBK6oQ5anUwPCgimKWaReTUZZ9gAMZuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747191405; c=relaxed/simple;
	bh=WNR4rmQkhH8cm0akBIJCGQqd7MFZmY4eLBIbdJ2nubI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eN2byCvDWvibQFICmq9xfkbcT5Zwq/NN9YDNzhAT/15nv21BMewHCGX1fc50dqev4dSQJ17ewcunL1dDLkaKA1NMEIQYicyvyaNCKFbBlMCM85bPPF/mVo4p3Uuimpr4BdmZXgOMoLrYmJtGOJXB7vGffQlaa4LguObnbvAXlZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kEa68+Od; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kEa68+Od"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22e45088d6eso79983675ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 19:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747191403; x=1747796203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F9C+Xfq4U1Sljo7NIsOF4pguHHrktMroZsBvAXTxAIs=;
        b=kEa68+Od/vLgs71V2VkauixWyys5n6R8bRXBpX8mpdFhKm5vt1/xaeS9KgC5Q/kADV
         yrcxq+zoiNlS0+aNla3lQuJFE3gD8MdzVnjV52CQVSmDcANlOlHyjP8DdU56xviNA7Nz
         MgB4Q3HA5gB+oitqFVwJQxbxoBEZfjOH5ce4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747191403; x=1747796203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9C+Xfq4U1Sljo7NIsOF4pguHHrktMroZsBvAXTxAIs=;
        b=X4IYwMUnIPbDK7gOoErd1lKUZ3BUmBxGveQd2lOuzcTdnrdGaAPsenPSpLKzTcleun
         Ypl/dQtTkAcJ0rqleQ2a/5skwiVrNHQOrt9WWGgn2nR+/8YCH9+7LzHeMvu+IlqHpP1H
         YxKr2RIZkAogyI9eSs2/MMp5RxtzwYUAlYMjMzQ90lt8tfQ+d5BJkyqK6RCtk2dJVeCv
         0cDsWSL2268Bk2zF8z+9yxPcGU5YY5OKW13M/GXRgfDTyyBNgTPlqGq2SE1gAQZkRMto
         PWgF17A5AMkOS78GO/y9hpYxuX8xzjj0Hx3fWO3qQlHHqcKWx8MnPny93hdyc/zkzuTE
         DGig==
X-Forwarded-Encrypted: i=1; AJvYcCVtOUzLJgTy0RqB4Iq1OxuS1mXaXDM3jbv3S9vES/E8iDU+CoHbQCmcxBMtu7Fm4f1nOGf1tBYSeKVgGg0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6h00Bm2IxAdprBuRuop3GKHnMMrgY6Al3bAGA84lyUB7kTFwt
	ZjEVnqJ+X+00jL9j19hvSCMfXlXF5ELVZfoPbj6LjNP5yc2HRZcX87HqicQKRQ==
X-Gm-Gg: ASbGncsEgAQw5jV1cA5zpLGpzqD7+vTadsQDnxuXNZ+3E3QYpGeFtE0MXB9DLM4KF2W
	lBh089+wj7SWto7sAes3IL/bNmo2C7yq+UNbIPFmqf5UXoF+1g3OqVVRXSSr5WiyGRcG6gboJkb
	OKavMggXQ5ndQPAHlsCr1EviuP3bkHAKbqNsstmkCZR9uXCV/HbWE/kbA9rXNNk7N4qvWAaKugc
	s0hzhdwSPcOWmheUQ/vA2z7WdCv8sxweJrQFLPbe+dNI6ymUU7AwqJ+7Lo7hK9Faf6INcHL3vSA
	0Q6ZStkWvFEyUNfg2m+i4fh9V6OJtfKsRvJFFikZrf7gHEEtT9x0UxU=
X-Google-Smtp-Source: AGHT+IHnt33PDOVeLKARfjA2RPfGeUvnWZ//Ehfi8/1HIv7yVrwZo8C+ZG2kmgKAOeQXjGIAxPqvaA==
X-Received: by 2002:a17:902:e5c5:b0:223:f408:c3dc with SMTP id d9443c01a7336-231980bbf7bmr23676735ad.9.1747191403196;
        Tue, 13 May 2025 19:56:43 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:d415:5e1d:3550:1855])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c38sm88444045ad.119.2025.05.13.19.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 19:56:42 -0700 (PDT)
Date: Wed, 14 May 2025 11:56:38 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Zaslonko Mikhail <zaslonko@linux.ibm.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCHv7 10/24] zram: add zlib compression backend support
Message-ID: <jejqy2tqaasir7vtu633ns3nybrzxvjlpebfavxnmq7inq2shz@egfzio3p2wgt>
References: <20240902105656.1383858-1-senozhatsky@chromium.org>
 <20240902105656.1383858-11-senozhatsky@chromium.org>
 <6046d139-2a46-4824-bdfc-687750c1ee5b@linux.ibm.com>
 <gekqwhcpombpm2u3b4xl7zladuyzbxybeq5wcwt47k7tsgo4bh@rfrxaeqwzypi>
 <df805c0e-bf25-4cf6-9601-aac594fa0f45@linux.ibm.com>
 <uaxb7sbvrg3eqn2sp66sg77urjzr7jwi2m2bwigvj5n5cta2xu@qsks2da3zrha>
 <3bd33a06-f8e2-4901-ada1-e970d18afcd4@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bd33a06-f8e2-4901-ada1-e970d18afcd4@linux.ibm.com>

On (25/05/13 14:58), Zaslonko Mikhail wrote:
> On 13.05.2025 07:41, Sergey Senozhatsky wrote:
> > Sorry for the delay,
> > 
> > On (25/05/09 17:18), Zaslonko Mikhail wrote:
> >>> When zram transitioned from Crypto API (scomp) to custom compression
> >>> API I picked the CryptoAPI deflate DEFLATE_DEF_WINBITS value:
> >>>
> >>> crypto/deflate.c: DEFLATE_DEF_WINBITS	11
> >>>
> >>> which is then passed to zlib_deflateInit2() and zlib_inflateInit2().
> >>>
> >>>> I tried to build the kernel with DEFLATE_DEF_WINBITS set to 15 and
> >>>> verified that s390 hardware deflate acceleration works for zram devices
> >>>> with a deflate compression.
> >>>
> >>> If we define it as 15 on non-s390 machines, will there be any
> >>> consequences?  Increased memory usage?  By how much?
> >>
> >> On s390, setting windowBits to 15 would lead to zlib workarea size
> >> increased by 120K (0x24dc8 -> 0x42dc8) per compression stream,
> >> i.e. per online CPU. 
> >> On non-s390 machine, that impact will be about 115K per stream. 
> >> Increasing window size should improve deflate compression,
> >> although the compression speed might be affected. Couldn't find any
> >> relevant zlib benchmarks though.
> >>
> >> Not sure what other consequences might there be for zram. Do you see any?
> > 
> > The increased per-CPU memory usage is the only thing I can think of.
> > I guess for zram we could turn this into a run-time parameter, but for
> > Crypto API compile-time is the only option, I guess.
> 
> With 'run-time parameter' you mean adding 'windowBits' as another deflate compression
> algorithm parameter for zram? Guess we could do this, using default value of 15 then.

I sent a simple patch set [1] that adds deflate.winbits parameter
support, so that it can be configured at runtime.  E.g.:

	echo "priority=1 deflate.winbits=15" > /sys/block/zram0/algorithm_params

Please take a look.

> > Can you send a patch series (for zram and Crypto API) that sets
> > windowBits to 15?
> 
> I can do it for zram. Not sure if Crypto should be changed as well. Or is it
> supposed to have the same compression defaults as zram?

Crypto API uses a hard-coded value of -11, which wouldn't work in your
case.  However, if you don't use crypto API (e.g. zswap) in your setup
then it probably doesn't need to be patched.  Cc-ed Herbert from the
crypto API side, just in case.

[1] https://lore.kernel.org/linux-kernel/20250514024825.1745489-1-senozhatsky@chromium.org
