Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E542ECEA1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 17:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750182089; cv=none; b=sJoFEWtU4L2nYJ9FVdxPH9cRe/XhSpV+fZF/Ya6SADzGZ2G+tnH64zhIgtzch+xWH/MUbnMqjZbRvfyMY4tdsa5Zlmu2h3OmfEgmFVcPmTPxxVqyc1g91fDqnwwPUabMXieknTpVtXo9A754tfGF6gx+SMZo8TTRUiuUYR5Ppa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750182089; c=relaxed/simple;
	bh=0nKA79uo7OfVEgwUs0N4jvvIGuSz7zE/vtykEecVcwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rtdun3KJ8LYSQ0V6DLRshVekWKESsoTJExjO9TYnyCZpFomtGc9Q3Su+/W7dmLOUXDTyWFn/gTvqzq3znplIV24YLpkyHkHCyzMiM1xn8vNDrLG7BuZfsJvfqKWNGjhjWsF43Vi/L9pZBwW9M4mQqTtKzRMJkD1nBgn9TQWgmB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HhNzf8Ct; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HhNzf8Ct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750182086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fv1qQfmXFoIHduZdlR+zVT7hLHkOsNLBBLotBjXv1yc=;
	b=HhNzf8CtLVi+A2Se3lHG0C6zN5VyyhycENwvvbzBy+t3RCk5Z8gvYMZghVhX8PbNZBK9mu
	HZzA8YqI5Y6DaAN5dMwuEcf7vrxxXPZUB3GRnKqe8ZCEs7WigRCbhpbT4TZL7dNLrxLbkP
	2vFtk6po0Cd4Ti396AXnzaPO76PVMPY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-QO1CD7KYNputaZV4NFuIrQ-1; Tue, 17 Jun 2025 13:41:24 -0400
X-MC-Unique: QO1CD7KYNputaZV4NFuIrQ-1
X-Mimecast-MFC-AGG-ID: QO1CD7KYNputaZV4NFuIrQ_1750182084
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f3796779so4122402f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750182083; x=1750786883;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fv1qQfmXFoIHduZdlR+zVT7hLHkOsNLBBLotBjXv1yc=;
        b=d321phcWUn9AcYVyHGEmySpNkD6f4PO94BC8nDsSF9lRT61+WerSsboFIoTOCnSUOW
         eOE0br+zMhV224QyZ63/U5Vb3RCeQPujTnFJfx9w88CcJdA77w+PLiune2w5PW9AJi7V
         LTem5U0t7fwkzqg6Hka0oRoQ4aUXnvQ+oG1kUq71amuDbTxUDUDXK92MrK6Ya8co/JSe
         3LK9toX4Dk/1DPVYDDkfW3ZyprogT62t289dQREnwzOS9wykk7n0ejn9mGMZgOfKvgmk
         FBKWQdAW7YYJwkh2vKO0kKWtBTV/u+v8pJoNjQjbGd9N0X0vbdeTWYP/O2CL4THH8M0/
         fc+A==
X-Forwarded-Encrypted: i=1; AJvYcCVGQz/8znOj3rzlD1qQYp0VcmLwRcNy34oVF0CXOeUFbclU/xuCc7fHLutFA6J6zoozNorY3txtSLK2rbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIDnouzhOYvD0M/B0GLPM+hGmIoVjsiUjRWd9jA/NqVsgNwUT2
	Qhu8iAAT2brVh2i5vD5HB5+EA2xQ1kKTOKIN3iE1X4yM1Lh2lAhc1KpHRgnm41be0FPTMjw2ekR
	/7tjN1yC3yDuizL7CIXYc+FHQTbP/pgeDowi40olYAmFpJrFVpx+nBUsoO1OU+t7LVQ==
X-Gm-Gg: ASbGncsWv2NHGRUoEu4FPpFk/JiXDxELtPzyvYqe5GvZUUaeRT56PP87Fw8Kb1NGuxw
	yW8N01sI2LyoAawrUlyYVrx6uxiKWZ6Joy3i9KGXjs+DU4lpn2HOIHYuCzllhgOuuktrwwfIXtl
	JADlG4jxzv2FYZ5ZpGsZ9lkRg6NWw4qx5b3OvBXVPOltbGe3O5sONTJrl8awljT4777Z4jxieJl
	oKFWSzjHLkAEt1fwafsngQHiT7/wpAeDQ6moJCb0AnOtYljB7BIYhQzZkbDU4llVS7eU6k5OcRD
	YGgqza0V9DRwsZbA0ivxyX1v+IBH9sizDleSZFrVDJS6wFcWcj7oVg==
X-Received: by 2002:a05:6000:40dd:b0:3a4:f430:2547 with SMTP id ffacd0b85a97d-3a572398da4mr11547539f8f.6.1750182083610;
        Tue, 17 Jun 2025 10:41:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAhkKtRMqkapaaqZvGdipAWU6I+TBGQ+IbnzPmRWN7DyxbPCMjP0mPfslm8IYPyCNLZwdV+A==
X-Received: by 2002:a05:6000:40dd:b0:3a4:f430:2547 with SMTP id ffacd0b85a97d-3a572398da4mr11547519f8f.6.1750182083261;
        Tue, 17 Jun 2025 10:41:23 -0700 (PDT)
Received: from [192.168.3.141] (p57a1a266.dip0.t-ipconnect.de. [87.161.162.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1c27sm181330855e9.15.2025.06.17.10.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 10:41:22 -0700 (PDT)
Message-ID: <3ee441ed-7f24-4038-8b5f-96ac9b49daae@redhat.com>
Date: Tue, 17 Jun 2025 19:41:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add stray rmap file to mm rmap section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Rik van Riel <riel@surriel.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250617165142.173716-1-lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250617165142.173716-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.06.25 18:51, Lorenzo Stoakes wrote:
> page_vma_mapped_walk() is used to traverse page tables from a VMA, used by
> rmap logic once the reverse mapping has been traversed to the VMA level.
> 
> It is also used by other users (migration, damon, etc.) but is primarily
> used by the reverse mapping and is a key part of its logic, so it seems
> appropriate to place it here.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 08045f9efadd..5010e91e8e75 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15888,6 +15888,7 @@ R:	Harry Yoo <harry.yoo@oracle.com>
>   L:	linux-mm@kvack.org
>   S:	Maintained
>   F:	include/linux/rmap.h
> +F:	mm/page_vma_mapped.c
>   F:	mm/rmap.c
>   
>   MEMORY MANAGEMENT - SECRETMEM

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

