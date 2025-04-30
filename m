Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFB5145A03
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746049771; cv=none; b=cHqNln4AwalFd4/U9LGxoPo4BalawIkL5cCFi4NBsFVCq5GEa7EXRSjePy8EwToVr8PxDQtOcnAqirE2gV5Uzb3ggM4zIBJOGGxShN5VZ1v45jGiysX4C+hC2kuKheJMzGh2by74bRIjZ28ZGy1tpEMBY5SEaFr5G4IMUeSy45o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746049771; c=relaxed/simple;
	bh=Nj9Be2PgsROYbn7hYBB4zJhNRYdIk/I+kBA615PYTFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPFdwRv9ZV4ll0DhtaDlIXIiiI1XxptM3ygwC4Qs6nvXTcDGMaJkdkReN9DZ4dQ5ZSNaD+XHwdIe9ABCvKmgo3DJM29vapVuVVY4IazV52V2EHJXLayUmn7zU/YJGRWnsNuqWV2NjwJh2FdBmq7phm3Tx4fBjp0ZSk7LswQxxqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X4aGwKpX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X4aGwKpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746049768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=T7/P2eHxVjPJoDuuG0iv5Uz560VChzz0yK3nOkTrqLs=;
	b=X4aGwKpXIzOCYop3FJrG68tuF/O5um/NYAPu+xX8hnyifNDL5W4+TcHAYVZwmnxOIgl8+N
	hnjEu6Pslr3TOLDFj1HbwXc1g4CfzeoNIwPfuMpwxzbNipPbpjKoxcrMf4qB3qVT/GjI5N
	E79trvvholZvH4Nnn4mBuJ84qGZ0tww=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-xzNc8fDVNd29DEfXTezybw-1; Wed, 30 Apr 2025 17:49:27 -0400
X-MC-Unique: xzNc8fDVNd29DEfXTezybw-1
X-Mimecast-MFC-AGG-ID: xzNc8fDVNd29DEfXTezybw_1746049766
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso1422325e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746049766; x=1746654566;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7/P2eHxVjPJoDuuG0iv5Uz560VChzz0yK3nOkTrqLs=;
        b=pswcWJp0V1SS57kouDyKI4JPwaNczQ8GnlZmxgm8skVAdYzmPa5rXEIyKSykUwgsZ9
         lLcbDiV3h3VPjavMOhhCvL+MVqbhZ2nTjqt9Y+iRp95kuj4q7tY2pZ44Xr2i4eXzxYiU
         0QGJ87050zbrQnNrFwdNTyjkYIDHnuT2igvS7j8Slog/Yr1X+HicI0uTZP9DOt9uk51S
         7W/bwSk+D0AFk6rq30lqCM0LG/fkYYyuVA9DncCpY038uPQ0UF1Yd1veZLfLZoB5QphF
         l9fsW1SVCf6xu7vaxAF1nNsLAGpxUh3lg412ghtipoa3U0sK2mp/917Bp/1aYLipMz3O
         7Hgw==
X-Gm-Message-State: AOJu0YzRPEV0QIG132SZ+xnwasLfeLXV2GczAbeRqX9jUZJFtTrg53MS
	FdQ/fzRc0DmlitAcKeAMZ+bshjX85brCg+3BlzX13Q2VEX4uodsbP5LoH8cpFOQ3vLEyyIT2syE
	OVeK/MaP23mdzKTm/+QE5YChBaSTT6OjyQjHGcKlWfz/ri1BL5HTj6U8UegRfsQ==
X-Gm-Gg: ASbGncsggmGUrZyt/eHy6bxcgUNVwY87FQMpqd9Cwx3BIxOl8+w0vkGSrJSRlZGx5Pm
	q6SvEVPjl1r+7htE/U/1c6Y1mWiN9DLNN0t+PW5PSmNhwejnabwFfSQyFzdpiPYBa92olsI6G3Y
	ZfeCjzMBhfykJpRWQ4VMzYs7Z/XKKSnlDbcbag17cxpBhh4pRH83vKEnjUnZ6sBFCcsT32Ue4oq
	njycylBq+0N77336raiBZ2c8PmNbU9zUfunkyFyjtz0+geLO6o1hLRxSIlc96GV2cFPHtUnaLTa
	39nBazOEFgufHWyjeJ2YwVf7uiGtzso+m6g7XEGoxKp1UQ7g3aCBBKwu7y5TXsiZEznHTbK67i8
	UpGerHJcT0GCXnjKNPhAjQrghWAK2hOkmq4XX8dU=
X-Received: by 2002:a05:600c:548d:b0:43c:e467:d6ce with SMTP id 5b1f17b1804b1-441b64ed8a8mr6725735e9.4.1746049765786;
        Wed, 30 Apr 2025 14:49:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt9JBUiNWwgOJYDw+GzMvBWT5lb5OsJ0qyzMpdTG+PNR54fN5u3esIfDPXV2lqLC6bUSVbLQ==
X-Received: by 2002:a05:600c:548d:b0:43c:e467:d6ce with SMTP id 5b1f17b1804b1-441b64ed8a8mr6725595e9.4.1746049765463;
        Wed, 30 Apr 2025 14:49:25 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:a500:7f54:d66b:cf40:8ee9? (p200300cbc745a5007f54d66bcf408ee9.dip0.t-ipconnect.de. [2003:cb:c745:a500:7f54:d66b:cf40:8ee9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b3ae0c19sm29651625e9.24.2025.04.30.14.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 14:49:24 -0700 (PDT)
Message-ID: <55736622-b0fa-4ec6-ba47-09fa5c34c6c5@redhat.com>
Date: Wed, 30 Apr 2025 23:49:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm/gup: Remove page_folio() in memfd_pin_folios()
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Andrew Morton <akpm@linux-foundation.org>
References: <20250430010059.892632-1-vishal.moola@gmail.com>
 <20250430010059.892632-3-vishal.moola@gmail.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250430010059.892632-3-vishal.moola@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.04.25 03:00, Vishal Moola (Oracle) wrote:
> We can get the folio directly from the folio batch, so remove the
> unnecessary page_folio() call.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>   mm/gup.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 1fb8f3b9a493..795fd94f379d 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -3640,7 +3640,7 @@ long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
>   			}
>   
>   			for (i = 0; i < nr_found; i++) {
> -				folio = page_folio(&fbatch.folios[i]->page);
> +				folio = fbatch.folios[i];
>   
>   				if (try_grab_folio(folio, 1, FOLL_PIN)) {
>   					folio_batch_release(&fbatch);

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

