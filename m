Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA7272639
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747676498; cv=none; b=hEmh826pDodcpgQRyOoOVXQrRXgjG7OhDOr9xVbrc2vEqruD8iUsGl7CXRQEKkvocvhLC93Q75kJP1RH3EWdj9U4Q0Ygjp/sYXsV1N7Fo2FIRAQ5SDYfYoHza5gQ7jElf6RUOPjo/OMWCOspABgCnrHmoX0zCB8fmXxGIir6mtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747676498; c=relaxed/simple;
	bh=ptXpc8hmOruMolxiRX92NsOTJN9PQURGvKBFh9IxnpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QwOjUROWWbUeSsZ5U0VrJR+5YKkBT7D8si9rufXj7owc8CFgWziunKEHzJgW6kFy9ARPGufT9vaIixe/RTwwAZ7HZSMnjLeStqHDszh1IRkI55VNzYLOoSUlBKwiyJwv2TrtX94TOY6hjjVi8n3Edpe9KTbS7rQe7BdM8QNMjJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nes24DKy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nes24DKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747676495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wMM+2s7qRrI63vS75vOPvvwet4wpZHCqIEycJ3tkwcQ=;
	b=Nes24DKyjadkBUumiLO5d6nfMeS3ahcfmtXRzFlhfaVtGG9Ri89K3ITQA5qosnLBOi22ec
	4Fa1fEYk4QDLngsdDwdijY4HPc3hXKTFz2V+5R7qYtoyIa0QJrKOQFXzuvLLy5qazXUqMn
	ujXqaDNbe7qkYB7rOa+DmOVo9qyuqZM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-od7CWH9aNUWLnIuXVwdcnQ-1; Mon, 19 May 2025 13:41:32 -0400
X-MC-Unique: od7CWH9aNUWLnIuXVwdcnQ-1
X-Mimecast-MFC-AGG-ID: od7CWH9aNUWLnIuXVwdcnQ_1747676490
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-442f4a3851fso42154765e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676490; x=1748281290;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wMM+2s7qRrI63vS75vOPvvwet4wpZHCqIEycJ3tkwcQ=;
        b=t/DAQcYgy9FR7bF5poHalanlmkbH1yNChLcXn+o4m4bSXpmA7S9teqApkkgFXAgEue
         rV4DqAS6hPugnUHx3hdRqnFVKEObqPhipnpEdwWKp1Ry7klpj2z3W7IXvyov34czfQTr
         M/AOpfZCEoi3ylLPojGzG3KWCrhGJJ6+gZLGl5k4FMoP8QjOwoyno9J9NMgfjZ4aqmsv
         7iPMExL2voh8aa6K9dsdKDXyza9qg2efEnoVQzZwX5WHAdV3ZpGIs6dzKD4wuRDGl55G
         gRCqLChSdkIr6/RO9a9CQ7XemmtINQvXQ90WAKVAv8+z+U7z2DNPdOfNbelmCF1ArT3b
         +oaA==
X-Forwarded-Encrypted: i=1; AJvYcCWQF9/IEEvIeu/uhtuwivfxQhpbEikj/i85QKzI9FqsiifqfHrBO3JtirPwTFCozNSoiDNdArT1cK6ItaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRIGp5qAC4vSXnktTCz/m5KYk99KRc5eoraZt/BpX2vR4UgKb7
	xhLwsHd7n4D+hQ+kcBCuZod5Oo/LKhl8MZpPZOU/hSALI+9WIgjFHvyMvU46uNJWnUlaZH+a2hi
	Z/6wfUPFI/CqlmkgcNGguXwyJcZxqExeYgbAJ2YUqlObiXRW13Kl5kizHko8k3k3zAw==
X-Gm-Gg: ASbGncts4r/Ax4qCEjAd9F/YeE1jSgJJ2fvnbVix0szFo3jOzlvejyh7oSysetHyz8W
	YlwoAU7fIzqhvbdjWKXvrMKu8AaDiT/4afPTl7veuddRf9pkxkdiZUqc6sMtjTvd9Xv10irg1s7
	rLuRTgSZYu3dEXCzTQ7O5TFY7tTaNIvUHkdO87HFDxvNSwd5M3n8WhDtZIGkzdAL9DymXyKs7sh
	F+Ve0VuRjOfTw66bzW8AjyZvDlgacvCZUmICTqdJqn+DHyDNslRbKh15CIqDxHucXn3K4aY/Zm+
	cQOkSq6QnCe8fjNUoIZSLPhE13d2VYL238iRJNhuYekZIlcFo4cuUZ4pBdikXO3V7Zv95XxmXdo
	OBH2vID5Imy7+0xuwEhiTPBFdXcJTxjCD0At+es4=
X-Received: by 2002:a05:600c:890b:b0:442:ffaa:6681 with SMTP id 5b1f17b1804b1-442ffaa6b6fmr81952195e9.28.1747676490441;
        Mon, 19 May 2025 10:41:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWnl7TcWfLB3Pa4DO8nxRC3zmwg6w26E4L7l3KlQwq71GfgWS4BKAiZ5l2yF+Mtm8mxarnwQ==
X-Received: by 2002:a05:600c:890b:b0:442:ffaa:6681 with SMTP id 5b1f17b1804b1-442ffaa6b6fmr81951945e9.28.1747676490062;
        Mon, 19 May 2025 10:41:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:3a00:5662:26b3:3e5d:438e? (p200300d82f3c3a00566226b33e5d438e.dip0.t-ipconnect.de. [2003:d8:2f3c:3a00:5662:26b3:3e5d:438e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8ab839esm177926295e9.17.2025.05.19.10.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 10:41:29 -0700 (PDT)
Message-ID: <0306ba4f-e0fe-47df-8ffc-4439c01745b2@redhat.com>
Date: Mon, 19 May 2025 19:41:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] mm: ksm: refer to special VMAs via VM_SPECIAL in
 ksm_compatible()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <cover.1747431920.git.lorenzo.stoakes@oracle.com>
 <ec973573540c6871683ee763d291b74bd851990f.1747431920.git.lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ec973573540c6871683ee763d291b74bd851990f.1747431920.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.05.25 10:51, Lorenzo Stoakes wrote:
> There's no need to spell out all the special cases, also doing it this way
> makes it absolutely clear that we preclude unmergeable VMAs in general, and
> puts the other excluded flags in stark and clear contrast.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   mm/ksm.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 08d486f188ff..d0c763abd499 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -679,9 +679,8 @@ static int break_ksm(struct vm_area_struct *vma, unsigned long addr, bool lock_v
>   
>   static bool ksm_compatible(const struct file *file, vm_flags_t vm_flags)
>   {
> -	if (vm_flags & (VM_SHARED   | VM_MAYSHARE   | VM_PFNMAP  |
> -			VM_IO       | VM_DONTEXPAND | VM_HUGETLB |
> -			VM_MIXEDMAP | VM_DROPPABLE))
> +	if (vm_flags & (VM_SHARED  | VM_MAYSHARE | VM_SPECIAL |
> +			VM_HUGETLB | VM_DROPPABLE))
>   		return false;		/* just ignore the advice */

Stumbled over that recently myself ... (grepping for VM_SPECIAL does not 
return many results)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

