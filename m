Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB7C1E8323
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495011; cv=none; b=mPZKqYrHTySroEs91vchgfwmiRHDwTCclskeiYcbExbsYDjtmJHc24CUCUiJ0b/cMsvROqyoPKwo6snuNqowX+n0T4gpjw+fNgnjf8lQaGHvNNAoUnJkh2o1KI1fhfBYZKwkpctntPVboY+grJH4sQpJClWSP+o8GF2sNgZoGCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495011; c=relaxed/simple;
	bh=k5dZttip+n21PpYIqfzd2VLD1HK85pPZRsiGjRHJFZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ujf/dUCheLg56FOLVWMP/br/MGbpF//xJGDzu85Oh3WwGfqCXfvJob24qqXpaJx87A/ah1OpUKO0OWHFa1fJv/PrrJD+Bs1W7yg1JN+pd+PgO/Eq6fY4PqoilJ0O9Ctcd4nMZUZLejCZCvu8TjSFmMDrgGvdXdjv3/zPSMBGJvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ViaAy1Cl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ViaAy1Cl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743495008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4ocXdQPdARRMqahA+z2tu+ROw9TYwR3/5BWBkQ9LqBA=;
	b=ViaAy1ClFTG0GdWpdEJPboRilyzLBCFagj9ZIlQsQH1N2WCTRLUh4qC41sPDL/nvgPgVWn
	kKai89j3i/csPBaNXIRAy49QO7XEVKNDyCISUHO8fI6uNcijy2UwLTS/UDbCakbS6bLRHW
	8sxn6itREwl+vTNsRpKyc+6iO/G0t9Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-Y9SKEHuZPlOuifaWkjKJmA-1; Tue, 01 Apr 2025 04:10:07 -0400
X-MC-Unique: Y9SKEHuZPlOuifaWkjKJmA-1
X-Mimecast-MFC-AGG-ID: Y9SKEHuZPlOuifaWkjKJmA_1743495006
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so38159185e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743495006; x=1744099806;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4ocXdQPdARRMqahA+z2tu+ROw9TYwR3/5BWBkQ9LqBA=;
        b=pzzh2v+iJmpIqNrdWKR6+gqrdKKhBEprzZL76Q+aca7AZS/5B4BvhmMxlp/aKlr6K1
         6soSIy+iKdUEZHdcBMazCuUoQZnYsHUADlRRIP44BeEsSqSgiBTirl9L3Io0KYb3SDrH
         qTt8UaNw3SyCN/9uRcBddPZxyG9M+YfEQNF6xVQEffI0u+yp8ZIsFnkeREJDZFwOOsdO
         msJBrHldyUXjokVcJnV8/s1XJAzpW0Bq9TqoLk9oBPh++Pxf17a8p/Z96qlS8kn9ZKsV
         aWIUrE6m47Rr4YLgGEQvbD50MjAGIBr7OQ+ctuIZpbn12nrxvlvuYXF4QWd7S439WR68
         4uhw==
X-Forwarded-Encrypted: i=1; AJvYcCUy/JELe1gkwxh/WLJUAKI2sEa7/Ji0Fg4GcAs46e9CdU/MHygP5iBQZxr7PJwc/I7hlujNY5vgskzgri4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4eaL23C0Dp7uWhKRc9f6ZsR2b/aj+XHijj17BUibKvtc2Dww6
	CeVOjcI1hAzt+VF+u2NLljmpR+LfRPptBVSkx5b3PcfzZoaO0E/zPqnXg9L2Z9nE/Svv09P1yFa
	RTDXsYHiBH2rgHSPohzQgxB3yxZRCHgvtsW3eOPcitlTzVb1LxNfIURSuPo5fNQ==
X-Gm-Gg: ASbGncufvJC+6MjoIqwgoM/+PIZb+gQJ3zW7FxRkg87O8d+j40CS7dGTTK83RJhlmHh
	KMFAdYVEAVC0SqVqzaDMUzsbmEIEVoRnbHMZQgCizp+Vuj4cVPaKa3FPAxzd6d8pSniSXY+lvy/
	JWUEYpYfAYWbfdi8dU2j3HN5Ai6VDLo628+9IK9eia4QziV0pEwppS658enpz5ykVDE8vIcXYUN
	Dammj+nAnHy01ZqGar0jd8HKIsH61YACIzcPuBc3VRXVJ7zf/DN5j6qsQtnHJW1Z3VeayWGYCz/
	D0S1V2qooWoZJl80xaWSOaVcwW0ZYsH5Je4rvHPsu5GpTVAjkQWuqxiN9XR7WFtBLH4FcCB9HNT
	pO4dTQxMzyfTF0/mjVOnyrRjhODvRG01Gkg0sBiaZ
X-Received: by 2002:a05:6000:420a:b0:391:952:c728 with SMTP id ffacd0b85a97d-39c120cc8e3mr8577124f8f.4.1743495005725;
        Tue, 01 Apr 2025 01:10:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq96cU4XRBsswMtSfl1ZOg4pF0nNEn5dqfdMKDHEXMtWmWyp6en+f7vxfNgkKKtP1f6uOojg==
X-Received: by 2002:a05:6000:420a:b0:391:952:c728 with SMTP id ffacd0b85a97d-39c120cc8e3mr8577102f8f.4.1743495005371;
        Tue, 01 Apr 2025 01:10:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:4d00:6ac5:30d:1611:918f? (p200300cbc7074d006ac5030d1611918f.dip0.t-ipconnect.de. [2003:cb:c707:4d00:6ac5:30d:1611:918f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcd03adsm147401165e9.21.2025.04.01.01.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 01:10:04 -0700 (PDT)
Message-ID: <a1f69754-776f-47eb-980e-8a12991f4865@redhat.com>
Date: Tue, 1 Apr 2025 10:10:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] mm/gup: fix wrongly calculated returned value in
 fault_in_safe_writeable()
To: Baoquan He <bhe@redhat.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-2-bhe@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250331081327.256412-2-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.03.25 10:13, Baoquan He wrote:
> Not like fault_in_readable() or fault_in_writeable(), in
> fault_in_safe_writeable() local variable 'start' is increased page
> by page to loop till the whole address range is handled. However,
> it mistakenly calcalates the size of handled range with 'uaddr - start'.
> 
> Fix it here.

Fixes: ? Do we know of user-visible effects?

> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
> v1->v2:
> - Fix a patch log typo caused by copy-and-paste error. Thanks
>    to Yanjun.
> 
>   mm/gup.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 855ab860f88b..73777b1de679 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2207,8 +2207,8 @@ size_t fault_in_safe_writeable(const char __user *uaddr, size_t size)
>   	} while (start != end);
>   	mmap_read_unlock(mm);
>   
> -	if (size > (unsigned long)uaddr - start)
> -		return size - ((unsigned long)uaddr - start);
> +	if (size > start - (unsigned long)uaddr)
> +		return size - (start - (unsigned long)uaddr);
>   	return 0;
>   }
>   EXPORT_SYMBOL(fault_in_safe_writeable);

Can we instead just use the uaddr and start variables like in 
fault_in_readable?

That is, turn "start" into a const and adjust uaddr instead.

(maybe we should also handle the types of these variables similar to as 
in fault_in_readable)

-- 
Cheers,

David / dhildenb

