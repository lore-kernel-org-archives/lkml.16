Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1211DE89B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873946; cv=none; b=JJpPU4PbREYoG8vNb3hXN1jEPFotSq6sFJm8wgDR+EWyaRjwvrNU/Hh7fBvLAJPRQIR77FJjDixY5zeCGUBgrc4dwGT8GC0Y50fD0/zrV3SvkT4Gc3R3OQkJhPB5B21ndHwr+3JvDRAgbAKIT33TVW27sE2CAFY7PsZp3Yf8aLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873946; c=relaxed/simple;
	bh=tY/DIk2rzj7OpRJyN1f+M/77PeLyklmL5pXwGb0RQiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqCkoBoIPPgPBao4msrjFdCIGuIQRXSKsu0X8jwk8NwT0MTZBG6MJNFO48MY2JQUslbQ18aPgG9bKvos5/3m/gd7+ZaDP5Pih9HdERFtlxnNb/gDLvbsyhQFYwGtyhkD9+JMecGpm/LTrSafz3VsX95v8BHK8r00QUww3YDUYjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gsvWsQMZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gsvWsQMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744873943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RS87iO4jmfjt13fRTdwJjBQzE4yIkbYOnPPbfZ4bwRA=;
	b=gsvWsQMZcDUAqxWiP1Wx6lXOouDBxcKmBdpF/1rhJDboVzgBv7yXc/tNqFsp57UTkCce+M
	+YNc6KcYNpNbGTgBiplcEohjiI34l59UBORL2iKYB0tk5FkljxYnYnOszXe6n2vQVfbbhh
	D/5HaeCMeD3fSlK7nI2oNNdNNmkKx5I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-inovwHQ_NxOCj9at8A5IvA-1; Thu, 17 Apr 2025 03:12:21 -0400
X-MC-Unique: inovwHQ_NxOCj9at8A5IvA-1
X-Mimecast-MFC-AGG-ID: inovwHQ_NxOCj9at8A5IvA_1744873940
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3912e4e2033so181234f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744873940; x=1745478740;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RS87iO4jmfjt13fRTdwJjBQzE4yIkbYOnPPbfZ4bwRA=;
        b=eriTyESrNlvjQBR4y3WpiWd4lfM4QfHC/ym9apnYVZgHOtDJwaOGOpIaZCp9IGgL4I
         X5R4pfbhlswb/FWa4SvQ+twCqYgGcmvvQqXM2sYS0Sbox6zmtvgyXMPXzm+gqKzqHqQX
         4J9lBsGMMpO3SJ+6yoZR7fj7uHrIjz6N9OpSp2cCdHxkk1i5JDHTfAJF2uEPyOeSVvhb
         kq2Miurs9RBnWhMqDI9ihaHSEbd42ANPenbdkNi0TEylBaSt6AybQLTt17zfUJ+8ti4a
         MmQSKidXLM3zpnrLrv+Tcu9BSBgwV9GhTgmgn5AAxYy337aMS41l54didzUh/4rjC1Pa
         wdRA==
X-Forwarded-Encrypted: i=1; AJvYcCXbRWvj+g+OEbUJ/40gcNxjX9Sn0If91O8F47dmpdsdSPPrd78cOteBxnUhUowx09y+TYiTspXIQKzxe8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuOBMY4yNSGydzohyt0fFhcwe9CzEN/s0Y0podWFC7qRB3Omzz
	MCwYCfv2fB2btWOorgNO0rViUd0ikBDWCa0AqLCIgXy1xWWOFw/WRehJZ6T9u5yfaLfLlodeI1y
	b3H+N59A0NBjWYYGO6emuuKNpV77IIDHQq7tpV79yB7lPh0Jj386fVzA4NfHs5Q==
X-Gm-Gg: ASbGncvGmsPLg/qVlETNLIX1i903jy933k38px67tJGMbS+J6OxIcJrOyl1JHfTFJbF
	YNMuytbX82+OCNG1Mk+3ydqLMrNyMT1JMxQC2bRFiqhhON+3urMYQmJ0YJhJ+Rasr9mMasy08Lp
	+cZXMt6ZeJi9md50sBQ4n+YJU8k6nnJpuXb1EFw1xjC3Snsz5KO8oD569kJCbs1BDVuq+P5+Olf
	UB37nJq2b/0zXdKxPcYJAkK7RPggUkVv2k+V+N4qvFjHfv7EZqyRYcdgQa4YSaRN3ayReeUpT1u
	hMfP6Yo4wDjrwhKyRC5df4NBw76EtZ3MWnZfq+2QoKTK2G2VnDJd1RJPTD2+KtSRAiFFQFqGdCG
	TRz6H5RO8wFSL3TSPYGkt+z4txUNBy+VtDkH9zp8=
X-Received: by 2002:a5d:64ef:0:b0:39c:30d8:f104 with SMTP id ffacd0b85a97d-39ee5b132f7mr3851742f8f.6.1744873940046;
        Thu, 17 Apr 2025 00:12:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkzP25I+9dronHGl5AxgAxlFz8k24329bxCBjViqDkpRbnKh4svhpFKfbn/WpzKU6KDTAyFA==
X-Received: by 2002:a5d:64ef:0:b0:39c:30d8:f104 with SMTP id ffacd0b85a97d-39ee5b132f7mr3851719f8f.6.1744873939699;
        Thu, 17 Apr 2025 00:12:19 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:2700:abf9:4eac:588c:adab? (p200300cbc7062700abf94eac588cadab.dip0.t-ipconnect.de. [2003:cb:c706:2700:abf9:4eac:588c:adab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f62sm18853738f8f.5.2025.04.17.00.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 00:12:19 -0700 (PDT)
Message-ID: <1eb021d5-3472-4a47-8a3f-d5bae83b8391@redhat.com>
Date: Thu, 17 Apr 2025 09:12:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stable 6.1] mm: Fix is_zero_page() usage in
 try_grab_page()
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Salvatore Bonaccorso <carnil@debian.org>, Milan Broz
 <gmazyland@gmail.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Sasha Levin <sashal@kernel.org>
References: <20250416202441.3911142-1-alex.williamson@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250416202441.3911142-1-alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.04.25 22:24, Alex Williamson wrote:
> The backport of upstream commit c8070b787519 ("mm: Don't pin ZERO_PAGE
> in pin_user_pages()") into v6.1.130 noted below in Fixes does not
> account for commit 0f0892356fa1 ("mm: allow multiple error returns in
> try_grab_page()"), which changed the return value of try_grab_page()
> from bool to int.  Therefore returning 0, success in the upstream
> version, becomes an error here.  Fix the return value.
> 
> Fixes: 476c1dfefab8 ("mm: Don't pin ZERO_PAGE in pin_user_pages()")
> Link: https://lore.kernel.org/all/Z_6uhLQjJ7SSzI13@eldamar.lan
> Reported-by: Salvatore Bonaccorso <carnil@debian.org>
> Reported-by: Milan Broz <gmazyland@gmail.com>
> Cc: stable@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: Sasha Levin <sashal@kernel.org>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
>   mm/gup.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index b1daaa9d89aa..76a2b0943e2d 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -232,7 +232,7 @@ bool __must_check try_grab_page(struct page *page, unsigned int flags)
>   		 * and it is used in a *lot* of places.
>   		 */
>   		if (is_zero_page(page))
> -			return 0;
> +			return true;
>   
>   		/*
>   		 * Similar to try_grab_folio(): be sure to *also*

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

