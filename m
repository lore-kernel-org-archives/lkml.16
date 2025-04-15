Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183C628F538
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713854; cv=none; b=VSAumaPA2N1rEfoUj75x8cLFyGbQUkqbGogHlJTZJEg5JfPn04xpbqdLSTMzQBdETMHjw40P5mTYxRdUUBaZ9avE+pJztPaoO04WyYK/7XVW6qsPCOq4AFSa9Yy4UPj/5pzzs86VkwknE+A+xzNgCkaMuUUhbtOQ9dg3iWeztTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713854; c=relaxed/simple;
	bh=AcnrBHHdCeMTP+XyRkMFzaV10++l5FRsKlYChijICJo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXU2H8JolfUsiezxgm2uXIskscoq2DxDcnfRbuS14gaHqfduXsUDA2oE+dl3z8aJD3SiDD3a8MhunSHbJeIzFoD2HjpLAPzq0F8R5eSFP9chqqp5VInjrqKjRP1YR+EiDzTzI7uERbmnCBcCFoKtL5wbdH/q9zWUQO8Tcb0v4+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyqywR19; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyqywR19"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so50473771fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744713850; x=1745318650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrLvFpuHTSAZbRxj4a3Ca45pKQLXAVqNxC9uOeGwapU=;
        b=fyqywR194/ljQI2EsRUFzmggVpD5fRsv3DO0fPLrEDw4A0mfbziN6tsgqnHJhKdB8h
         U3rYO29cYVvgJ/N3Wdl2GRxfeUglaQGEu7YkugGkDCGf1BJUXgUoFqrVMSEAyPiBf1cB
         wyuBoW6uT1cY/NMAh6M/R6bkygUIyJNA3MIMQLUBWbdIhujN2PGMHLI071hC7OYUIKbU
         ZeoNMAn83hwshgZybdRb7cP+sdsRMbA/DKfPid9pLQu5Aphm8wvxuxcODPl2kWLI58TR
         yL72LlRXXXUBv3DWSIKbUcap3CwfXkzNNRSohyxqpmZ86Xan4plxDYp99S0ScLJl19jj
         x4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713850; x=1745318650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrLvFpuHTSAZbRxj4a3Ca45pKQLXAVqNxC9uOeGwapU=;
        b=b9p6nxFZ301rtVXOC1Gru6L6PLfHF3SS8R+02/+iSQnfZ4N/qBz9WVm7xCXQUYhTDp
         qnwErMXekX0mxwBSh1usFMQJjsB1lTQcKCfldIJYEq+Mf6yWV5l9F9+xKc6QjNopEFdI
         MvQI/mI29rnCN1KfKsuoIvGwa9v4iEzBCwgsJ8b0V/Bv1zDFaF0Pjkjb0RqQxb/gx9b5
         X0dT+4xy0yUzsVNKdge1SGkQLFgKpofg5z2n/0+tbN5X/90Vod+XxvFeygl4K/JoOyZu
         Dh77sq523sD5ycgW2b9ru/A4GVIV67bzCzJ9vFeC9k7oBfNBH9vI+Kmim76l9qdEhB4m
         uREA==
X-Forwarded-Encrypted: i=1; AJvYcCUijdGmP6sL8iohHljMdQRiCm/AwZyD5d8zxXBFTgZoXTT9N7lg5Bwg3xE/dMEg6wLdnLsgfTCCjMJUsbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLDCIHE6D6QZ7Jff++we2zi1V9JBrXzcY5GuL1w/XWL3+KEWdQ
	JQnk6sqtJFTVCuDO/+zB5nc9A/TnvBq6R5Yv/AiitKWvgbsedIeS
X-Gm-Gg: ASbGnctr93GUqbYAQKEZl3inwDX4qAK7J8pBwYsz0uh3bMfNJ1ynl/bI1IK28OYNp2m
	C7w/IWlsWjx3o0aNf3nDdVceFj2HiCwtKoqNZ/keU3foxcVJcGu/0+ETm94rILG5kIHtaqkFbvs
	UbnVs3wLYhorg/J7A+sMyuzUku5WmYKd0d3q1AY1KrHbbBUoPccdjarPAWaFGTi8XckmgPc66BM
	yWRmifm91WLMA93wyU7oLiTl2qfPM6CeHZC5ehWf1n/8+c7xZIPTZwBeAV53rj7qenYnZkvuznV
	pez+pwkYDYfOyuHVtuSAfnvFKykmdL1p3XU9fixShtHXUwOTicPQJLywrF7hszTAbykq
X-Google-Smtp-Source: AGHT+IEq/npw1FKWrK84Hcg467AIj49xSaKauOvtLI8LfcqRE1zz7NBCC2GkNPBmA5sg5WHHTC0CfA==
X-Received: by 2002:a05:651c:210d:b0:30a:4428:dea9 with SMTP id 38308e7fff4ca-31049a807e3mr51421781fa.30.1744713849631;
        Tue, 15 Apr 2025 03:44:09 -0700 (PDT)
Received: from pc636 (host-90-233-217-52.mobileonline.telia.com. [90.233.217.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f84f1sm20090601fa.102.2025.04.15.03.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:44:09 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 15 Apr 2025 12:44:06 +0200
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, urezki@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] mm/vmalloc: optimize function vm_unmap_aliases()
Message-ID: <Z_44dmh7zGKzAdsb@pc636>
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-5-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415023952.27850-5-bhe@redhat.com>

On Tue, Apr 15, 2025 at 10:39:51AM +0800, Baoquan He wrote:
> Remove unneeded local variables and replace them with values.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/vmalloc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index bf735c890878..3f38a232663b 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2930,10 +2930,7 @@ static void _vm_unmap_aliases(unsigned long start, unsigned long end, int flush)
>   */
>  void vm_unmap_aliases(void)
>  {
> -	unsigned long start = ULONG_MAX, end = 0;
> -	int flush = 0;
> -
> -	_vm_unmap_aliases(start, end, flush);
> +	_vm_unmap_aliases(ULONG_MAX, 0, 0);
>  }
>  EXPORT_SYMBOL_GPL(vm_unmap_aliases);
>  
> -- 
> 2.41.0
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

Makes sense!

--
Uladzislau Rezki
