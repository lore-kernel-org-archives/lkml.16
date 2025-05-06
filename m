Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3822421A427
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746519842; cv=none; b=P6Sgg+5tWGw2OYHNTwdCDVzCcpiI2T8zn/e2uiL7H0LYbhkSbdJ31XK2eswGGUlKHVxakZ18kd5R5OGQ9dZX+7VkCBRNbfyWlU+rvJPtRJ8bYwpiNJ2cVtYvRC7hGdzZV8QbS+KstdsAQBI9PfUIHZPT3//UYP9waPxoDXvq418=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746519842; c=relaxed/simple;
	bh=YKo5LO6pLekd0PspwV1qzKD1N93407Fijd5XWo/1gK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgFDgzcCVaVFiCgqoAJmbvi3K/O7dYAe4C48LHPFGURrGfm6N8EZeoy3Peh3yL6h14GekgzYHzvHbignYpLNZRdpE/KQ9O5Rml3AvjLZ2KzWrstNiTxhaFWipfEKkRmPS0H3uxgPBNf56GHBdhH9MjMy7ZGCTdnjQuxwf+ejFAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LcXUbD5M; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LcXUbD5M"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acb2faa9f55so711093966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 01:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746519838; x=1747124638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZix/g809W5Q3mpotWJmj8un0wswW4AeeUtpQyzq6Ak=;
        b=LcXUbD5MTWsPSbzcbeutGLlK3ySjX6IF8frWRrdMSwW82yfBzma+/1jeZS6om2s+Aw
         hAZZ/GVOi0ZpVlXj/R6PjYh7cgVhXZZhhdGMPHiWOWsrfxB4nNpxpX7BEHT3zW95m9IE
         ax/1OMMtSXXIOKlgCffJJFli2k27jrOBRvkR7WvAfHW02r0nSN5ytoGNZ1OiT8t4fTPV
         uMfnt31mXQNmNo2c9HV1y+sQ4JKXlCT6YgWLim14qIr2TUENWQ/0geKnvcZX0oJXAB/7
         0daGO/YmQk/e3TshZlLtEa+01rjZ1NvsQYmS6tZLPQCt28b6GwEzj+aQWt3xoIoo+r3T
         lvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746519838; x=1747124638;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZix/g809W5Q3mpotWJmj8un0wswW4AeeUtpQyzq6Ak=;
        b=ZusrS3n4UKU1XoR+UyuPfVe10E3apcAr7DFaUd0GM84PO3yj+EnqyKYgAjIPo7Lw/b
         0/T07CcSCNaJTp7jTPEmuD7tnGL7ofGcDJDkdyEgkq9NBnrfkzeOXMEAEwCcVojcF/JS
         CKvDAKbEbT/IFi/UO0xT7zn1K2LJBQrGJJgotny10ilIB0pittV730jGvAQlEW5CBEsc
         Qnv8kBY+4FOLhygdd9CEHTuJlbz6IhK6mmGsyYS6QRupw3Nz4h3MHvMLkkKLEs0VnlFY
         /ZKIsGaeEWyI5MRXFX2kRk9EtD3K47iC4hNtvHJeeHVLKAmmlrBEtqIH87geXpQrldPh
         XqYA==
X-Forwarded-Encrypted: i=1; AJvYcCVSXbtqfkxAnvoC+RwqQghFlK53hWxPI7KPjCWhcYpgEaVmhV7QwarYM13eZ+9bnNjNUi5Am3M8fabcBu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnWHpia4frqnrmg6m98wRAcqmhhIlTDwhyOoktgJCHRSLV9Qz3
	0n4itky1jXZp7rM4kJ1HGuKouO/dtTglWH3+CQgtd10V551B1plNaskUPxe7rludPhYcrgQEoEo
	K
X-Gm-Gg: ASbGncvM7QIx/G3ONyVeL2JlnO5Lb82YXh15BrpsFRQXN86ddTUA6q6y6Eten1anuBm
	qxKgE84T5XPOYG1j31DKngpBYp69nKvlAJjQNWsyLHfHqsmuYdNigsE8/isk0hfZol78Ui6h6o8
	ZOP+JvNiv9kxLe6ma4yNeDCHlbJH6Y0TI4BHktg8GFhFLw/5EIDjXA9hn7EnfLMyz1O63ffdqkB
	WonpuOhTzj6MyqLJDMWtemEK/ckq2xMioU0DUiEqisG7AzcelZVU6HcNM7SIUPjuBh8uO646fl1
	F02VQ2ilNLTvtk+CBPmCxjfKRObia+3OND0Ja1tze9FBQxUI
X-Google-Smtp-Source: AGHT+IFb3lMs+PhfN5LA4YlZhYTjMf4K5oPtH9ikMRuN1A66jK8J1b3arzinxgLgoTKob3Yyy8eMLw==
X-Received: by 2002:a17:907:60d1:b0:aca:e1ea:c5fc with SMTP id a640c23a62f3a-ad1d34c7493mr239965666b.26.1746519838441;
        Tue, 06 May 2025 01:23:58 -0700 (PDT)
Received: from [192.168.0.32] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa99f321ffsm6425287a12.49.2025.05.06.01.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 01:23:58 -0700 (PDT)
Message-ID: <5e97121b-d682-48fc-b4ec-050b2b3315a0@linaro.org>
Date: Tue, 6 May 2025 11:23:57 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pstore/zone: rewrite some comments for better
 understanding
To: kees@kernel.org
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250117084228.3218024-1-eugen.hristev@linaro.org>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20250117084228.3218024-1-eugen.hristev@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/17/25 10:42, Eugen Hristev wrote:
> Rewrite some comments to make it more clear and easier to understand.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---

Hello Kees,

Is this patch worth it, or no need to bother ?

Eugen

>  fs/pstore/zone.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
> index ceb5639a0629..5fa2fa2e7aa7 100644
> --- a/fs/pstore/zone.c
> +++ b/fs/pstore/zone.c
> @@ -214,7 +214,7 @@ static int psz_zone_write(struct pstore_zone *zone,
>  		atomic_set(&zone->buffer->datalen, wlen + off);
>  	}
>  
> -	/* avoid to damage old records */
> +	/* avoid damaging old records */
>  	if (!is_on_panic() && !atomic_read(&pstore_zone_cxt.recovered))
>  		goto dirty;
>  
> @@ -249,7 +249,7 @@ static int psz_zone_write(struct pstore_zone *zone,
>  
>  	return 0;
>  dirty:
> -	/* no need to mark dirty if going to try next zone */
> +	/* no need to mark it dirty if going to try next zone */
>  	if (wcnt == -ENOMSG)
>  		return -ENOMSG;
>  	atomic_set(&zone->dirty, true);
> @@ -378,7 +378,7 @@ static int psz_kmsg_recover_meta(struct psz_context *cxt)
>  	struct timespec64 time = { };
>  	unsigned long i;
>  	/*
> -	 * Recover may on panic, we can't allocate any memory by kmalloc.
> +	 * Recover may happen on panic, we can't allocate any memory by kmalloc.
>  	 * So, we use local array instead.
>  	 */
>  	char buffer_header[sizeof(*buf) + sizeof(*hdr)] = {0};
> @@ -856,11 +856,11 @@ static int notrace psz_record_write(struct pstore_zone *zone,
>  
>  	/**
>  	 * psz_zone_write will set datalen as start + cnt.
> -	 * It work if actual data length lesser than buffer size.
> -	 * If data length greater than buffer size, pmsg will rewrite to
> -	 * beginning of zone, which make buffer->datalen wrongly.
> +	 * It works if actual data length is lesser than buffer size.
> +	 * If data length is greater than buffer size, pmsg will rewrite to
> +	 * the beginning of the zone, which makes buffer->datalen wrong.
>  	 * So we should reset datalen as buffer size once actual data length
> -	 * greater than buffer size.
> +	 * is greater than buffer size.
>  	 */
>  	if (is_full_data) {
>  		atomic_set(&zone->buffer->datalen, zone->buffer_size);
> @@ -878,8 +878,9 @@ static int notrace psz_pstore_write(struct pstore_record *record)
>  		atomic_set(&cxt->on_panic, 1);
>  
>  	/*
> -	 * if on panic, do not write except panic records
> -	 * Fix case that panic_write prints log which wakes up console backend.
> +	 * If on panic, do not write anything except panic records.
> +	 * Fix the case when panic_write prints log that wakes up
> +	 * console backend.
>  	 */
>  	if (is_on_panic() && record->type != PSTORE_TYPE_DMESG)
>  		return -EBUSY;

