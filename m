Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC43D1E1C3F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865049; cv=none; b=ObE3OwFRPHdJsxX2Wzl6AMq3nkyeR2LYbvUAUdAJE0GYJeHjPfm278SMZYZB3kU3otNglzBpI+Mliq70/aA9L+CYJ3RJ+tqrn9zWK4HU25sgVFSpo5CF5MEDnEwd60tdA4y3p7meCB7GS9XyqtwCTikjcjxiZjz6TKvGL5a034A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865049; c=relaxed/simple;
	bh=I6IeYO4TSfvQuhXS4NPCRD+et3o1QqT+kn7ua9848WY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1HPbQm/7D8vkhgBOF2RNbH2PxW/m3Vc1GGBmy1/M2JjO64OVxSBOb4uSJ8MNDG0hE4Oz2OxkMawr99w/P1IBwL6F/kkRon88qVFk5kL4LDzjF2MLpPwj/869iWIW3W9s7EXzDhV5tlJcEYEF6Il/JfhPggReR4H7F3FM011u3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oo1nLmhu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oo1nLmhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750865046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=j9zzTIzKhG7VUl5IjQWUl80M1deKwcxBPVTbGm/9TuY=;
	b=Oo1nLmhux/UWB5Oh/m3aXyC5wf2gXdKv3tJyC2eN1FUIG0ESUaBi6GM7bs7AKBBJKUtSuu
	Blo48g6/lKwVcRKpD9xRXxo+qfpF7LMrWtGfWXQpf+DmUSPPvZOpXYUhPogMP5cPGevS89
	pQyjdBwSRdowRtFbETElsqwvpQSeFa8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-ldzX8nDONV6Esa30bc458Q-1; Wed, 25 Jun 2025 11:24:05 -0400
X-MC-Unique: ldzX8nDONV6Esa30bc458Q-1
X-Mimecast-MFC-AGG-ID: ldzX8nDONV6Esa30bc458Q_1750865044
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4530c186394so29762225e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865044; x=1751469844;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j9zzTIzKhG7VUl5IjQWUl80M1deKwcxBPVTbGm/9TuY=;
        b=UeCX+mqrjUnUsxSkWUoGIxxCtpTlvwW1vKDQ7CmMATZsjg9zAQ3p/LlPclNa0tWtOE
         v7ZSXgByj/MsXoTsLjuIRpcJJb1uc/1t7s1ofM2/WixjvKG3PrO/xyFiWAo1trOVYsBB
         3pIG1UFNlN+y+uRdMITn7MwW23oLxItQ7W41QcGo0jr8R27JcYobagyUu33b0uowj8Ac
         IHIY1S6lVV8Qpmp3eMovgRrNS7hzOFnYUe31aSTj6T6Tj0a07eHtPqHuqPDPpwBUy6HV
         OurLLyDXigWj2jRJrpsbux99N1EasihBxoJatIWk5ie9UDuuESPxLj+wL8L0mWDlAJBT
         w+7A==
X-Forwarded-Encrypted: i=1; AJvYcCWirWo4jMgEudw+Zpq8OJDtc+3xnJLqdwSkD9zvv5A4J/lYXOZK1vhEfZsUlDpcFVVNeSgSoCxqJkW6kLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxapCVFNx8ylH3iXZrPVYVPSxIgfNNEoYwu8aAb3L9l6iWCTUpo
	x5sHcdJQqKRLT/j4V/UIzgAGy73g3UXBQJZgwPRMieJeDQug5uHpJe6Pyzt6CF1lOqX7aKuucNp
	RzZyFRdNGTzjFofvFTDGjnsQqkFQDgyl1SIJmEBbYPyyks9YmncKwPaOodemaJtDxTA==
X-Gm-Gg: ASbGncvCFATDlUjor6TqKnNMw142QaAjzXe/grLjQA7/1YYQ2H5OzEkPJ/qeoyvobyA
	jDN1BUbaQx92kpyh7K2wqKeTrw9A6PB0rrMa0hdMK8tSRM9JpyZwan4Sfe+rYRo35yQKOw6Xlf4
	UGJZNMvNe+xCjP5jqRk3/ShClHMTLbZZEfduotYfPO1U+4Le9PmXHENrWLKDqgTdO7gRi04Jyvz
	+T8vDDqMfZOvHe3ndy4gBxn2s/g9oiFC8qIPc93JLdTWbMR05VouCnTGfncrr4xzPbpoX7UC/dR
	5GTzYMfPfKX7UlqETMYPmAm1QooHJaryrDFGZL8v15pGEQWEl9OI+sWyzxa1mEkKkKfJlPzr/wz
	PsgCP7UWdcJUmOGOQPJurxRFAc1R9JnUt/a1F8pLk4Nkz
X-Received: by 2002:a05:600c:a31b:b0:450:d07e:ee14 with SMTP id 5b1f17b1804b1-45382830ademr26473415e9.17.1750865043999;
        Wed, 25 Jun 2025 08:24:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK5Wspjs/KgJM3ipOlt6CRZQ41vK3S8wKqPJvNzw8lA5JimIHK7x0qy7jz6uvnDpM8gRbr0Q==
X-Received: by 2002:a05:600c:a31b:b0:450:d07e:ee14 with SMTP id 5b1f17b1804b1-45382830ademr26473165e9.17.1750865043578;
        Wed, 25 Jun 2025 08:24:03 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e810977esm4860550f8f.83.2025.06.25.08.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:24:03 -0700 (PDT)
Message-ID: <2db18566-f864-44f4-bd0b-baa7cc4bebea@redhat.com>
Date: Wed, 25 Jun 2025 17:24:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm,memory_hotplug: set failure reason in offline_pages()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Harry Yoo <harry.yoo@oracle.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <685c1428.050a0220.346d5e.eafa@mx.google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <685c1428.050a0220.346d5e.eafa@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 17:22, Dan Carpenter wrote:
> The "reason" variable is uninitialized on this error path.  It's supposed
> to explain why the function failed.
> 
> Fixes: e4e2806b639c ("mm,memory_hotplug: implement numa node notifier")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   mm/memory_hotplug.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 4d864b4fb891..e954f81b55a0 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1977,8 +1977,10 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>   		node_arg.nid = node;
>   		ret = node_notify(NODE_REMOVING_LAST_MEMORY, &node_arg);
>   		ret = notifier_to_errno(ret);
> -		if (ret)
> +		if (ret) {
> +			reason = "nr_pages more than present_pages";

"node notifier failure"

With that

Acked-by: David Hildenbrand <david@redhat.com>

(likely should be squashed because the commit it might not be stable yet)

-- 
Cheers,

David / dhildenb

