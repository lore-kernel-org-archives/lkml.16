Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296BD233127
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568216; cv=none; b=iAQgrT6udxhzJQIuMYTbzkwnync2G+7xyRlchZlav1Jd4v4MW4rKgJjZv5Yd8BCQSig5lM9QhI1ceSsn5E9hz/iOa/8HTgzqbYsZGiZv6/rOg8pnaXa38TNvtaAIcMVZOli6iuxq4RdeyObQRq8id5hSs9i1qKw31rnVUEtsMLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568216; c=relaxed/simple;
	bh=IbpJPb9vsSjzqw08iTAzFoD2sHMwzBfAqjJkykKhTEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DGi08VMB2F/oNV7Pr8m+5S+QxGaoas7bmTSEHTpzWNZPQmISiYboOJc4zOf6wd8rNMkcA0L7mDITg/KQowgd8bkD+8fbFqin5Q4STQbHWLVMLEgSWBxw1+hRfyrgaQnVFRcKK1Lt0ovT3mZeSeTm/IuCMPmwsQi2TxBaacsN1jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ezozIelU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ezozIelU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745568213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a3Otik6gK0RcNslFwTd2xyrqyLP7qFeCDFnCNuESl90=;
	b=ezozIelUbcHIIwPET3r9/WxJMpMFUrmL+1P6OZ9PV9/fUFcsyDo9iuTjjnnWpVJR2JLj44
	an99V0FGvCfE9n5iRl5UBWufccXk0F6kUY6tuD1Cy8iXqwuHfedIU0hZjMROeWDmzzd3Hr
	Rz11u9jEGN+Hso0RfUvtSHprbP/6RMA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-r4c0UlorOO69GsXHaxPDog-1; Fri, 25 Apr 2025 04:03:30 -0400
X-MC-Unique: r4c0UlorOO69GsXHaxPDog-1
X-Mimecast-MFC-AGG-ID: r4c0UlorOO69GsXHaxPDog_1745568209
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39131851046so635556f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568209; x=1746173009;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a3Otik6gK0RcNslFwTd2xyrqyLP7qFeCDFnCNuESl90=;
        b=heFJ2JqsWE54BMD5RWtO0Nqz5kE0Lh81zLR7/puRW5AzFSvHZ8Ot8YavD8h56Vhwv8
         Y1V8uWU1h/2/WNi23SZ+FztJKBJWtcQ44m8K8jsZkNEem8IipR/PXHXDCKgKlm8izciE
         U/DoqmRSBDJDCugRUF7EOU2fxZWWl7rgV2XO6gqN3m6FFWVIMcuWt7PndcjBDh4wiV0y
         SoOuU28kd5VP+QZxicVHxIhNTQhcAQ79/nI/OB44lvpRRMKp+4GgJ+V04EHSXscB1pgz
         2FWUuzNr9Snm/zEM4j/OK1nnyK3bN5WXDhuy+gevwds6Y4qUSOi9sU1sLQlGrMzlOecN
         Xcng==
X-Forwarded-Encrypted: i=1; AJvYcCU/7n4WeRcHf5wt9g1ehgJgK9fWjVbkaWfBC8DmMhJQPDBcjxpS4NNzW7QVbGDq1EkK1RvlRFU2hDN1A5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyInNbmf0n9d6Kt5fxF/OfIt8TSR7f2tqPidTCsTG65S8bE5l7v
	M59LcOgq+cik9C+HarpZHwPx5Y3NjWMQc++75VBDlz06oT24tJ+5flyvfBjJ59yZuggPEwFmrII
	8y/fN/e1WUvepyk07KBV14jvB8X4i9ZXBzKHR9/MQvjQBx7v368v5hAsCgCW8bQ==
X-Gm-Gg: ASbGncvOcjeJFIZ8gaQ1pkdq9Wryln6Iu46S35t1+finw7ezj73t93DPAVDJnQb+FG0
	IDdUvnWccPkmlJ4n2BR/8MmSVFEB8i8iyvOsJBkMZylznVlw2a/oHQZLUqQ1UJ3PO5y7wtVzSrh
	k/I8FdKn/ZRHKEYmqZjsk/LYH5IvOKFXiggIyLNQXIqwOjh/rLZIL9WNQZ+QB2E8fwPGjnqjNgO
	U/YKOoZWR1zbKmXbEeXHC2ku/xGKK/589F2WFjU8SAlxQALL1ynDtxdyVXMSJ+Vd7rkpcZpBbta
	J0/7zr8NQjYlatjwS3OIeMNeTjPApuaEJIir1PPJmCOnvPVSSjzSvvk1wtqUZkKF1RwlTR735L9
	erxYqej1q21QkMhxeWn3cZq3SnCM7YihdFfQR
X-Received: by 2002:a05:6000:4203:b0:39c:2665:2bfc with SMTP id ffacd0b85a97d-3a074f4930amr991863f8f.52.1745568209120;
        Fri, 25 Apr 2025 01:03:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx/ydU1RtruzsGAW2KbtTzdqxOIIONNsJ5IurkwA8JcGy3lVUwmiUk3S5lCGZ6N+oHyV/VtQ==
X-Received: by 2002:a05:6000:4203:b0:39c:2665:2bfc with SMTP id ffacd0b85a97d-3a074f4930amr991830f8f.52.1745568208690;
        Fri, 25 Apr 2025 01:03:28 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70f:6900:6c56:80f8:c14:6d2a? (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de. [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbede5sm1565941f8f.49.2025.04.25.01.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 01:03:27 -0700 (PDT)
Message-ID: <58b94343-5953-49f6-bf09-a3ace906ef46@redhat.com>
Date: Fri, 25 Apr 2025 10:03:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/memory: fix mapcount / refcount sanity check for mTHP
 reuse
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
References: <20250425074325.61833-1-ryncsn@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250425074325.61833-1-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.04.25 09:43, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> The following WARNING was triggered during swap stress test with
> mTHP enabled:
> 
> [ 6609.335758] ------------[ cut here ]------------
> [ 6609.337758] WARNING: CPU: 82 PID: 755116 at mm/memory.c:3794 do_wp_page+0x1084/0x10e0
> [ 6609.340922] Modules linked in: zram virtiofs
> [ 6609.342699] CPU: 82 UID: 0 PID: 755116 Comm: sh Kdump: loaded Not tainted 6.15.0-rc1+ #1429 PREEMPT(voluntary)
> [ 6609.347620] Hardware name: Red Hat KVM/RHEL-AV, BIOS 0.0.0 02/06/2015
> [ 6609.349909] RIP: 0010:do_wp_page+0x1084/0x10e0
> [ 6609.351532] Code: ff ff 48 c7 c6 80 ba 49 82 4c 89 ef e8 95 fd fe ff 0f 0b bd f5 ff ff ff e9 43 fb ff ff 41 83 a9 bc 12 00 00 01 e9 5c fb ff ff <0f> 0b e9 a6 fc ff ff 65 ff 00 f0 48 0f b
> a 6d 00 1f 0f 83 82 fc ff
> [ 6609.357959] RSP: 0000:ffffc90002273d40 EFLAGS: 00010287
> [ 6609.359915] RAX: 000000000000000f RBX: 0000000000000000 RCX: 000fffffffe00000
> [ 6609.362606] RDX: 0000000000000010 RSI: 000055a119ac1000 RDI: ffffea000ae6ec00
> [ 6609.365143] RBP: ffffea000ae6ec68 R08: 84000002b9bb1025 R09: 000055a119ab6000
> [ 6609.367569] R10: ffff8881caa2ad80 R11: 0000000000000000 R12: ffff8881caa2ad80
> [ 6609.370255] R13: ffffea000ae6ec00 R14: 000055a119ac1c9c R15: ffffc90002273dd8
> [ 6609.373007] FS:  00007f08e467f740(0000) GS:ffff88a07c214000(0000) knlGS:0000000000000000
> [ 6609.375999] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 6609.377946] CR2: 000055a119ac1c9c CR3: 00000001adfd6005 CR4: 0000000000770eb0
> [ 6609.380376] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [ 6609.382853] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [ 6609.385216] PKRU: 55555554
> [ 6609.386141] Call Trace:
> [ 6609.387017]  <TASK>
> [ 6609.387718]  ? ___pte_offset_map+0x1b/0x110
> [ 6609.389056]  __handle_mm_fault+0xa51/0xf00
> [ 6609.390363]  ? exc_page_fault+0x6a/0x140
> [ 6609.391629]  handle_mm_fault+0x13d/0x360
> [ 6609.392856]  do_user_addr_fault+0x2f2/0x7f0
> [ 6609.394160]  ? sigprocmask+0x77/0xa0
> [ 6609.395375]  exc_page_fault+0x6a/0x140
> [ 6609.396735]  asm_exc_page_fault+0x26/0x30
> [ 6609.398224] RIP: 0033:0x55a1050bc18b
> [ 6609.399567] Code: 8b 3f 4d 85 ff 74 40 41 39 5f 18 75 f2 49 8b 7f 08 44 38 27 75 e9 4c 89 c6 4c 89 45 c8 e8 bd 83 fa ff 4c 8b 45 c8 85 c0 75 d5 <41> 83 47 1c 01 48 83 c4 28 4c 89 f8 5b 4
> 1 5c 41 5d 41 5e 41 5f 5d
> [ 6609.405971] RSP: 002b:00007ffcf5f37d90 EFLAGS: 00010246
> [ 6609.407737] RAX: 0000000000000000 RBX: 00000000182768fa RCX: 0000000000000000
> [ 6609.410151] RDX: 00000000000000fa RSI: 000055a105175c7b RDI: 000055a119ac1c60
> [ 6609.412606] RBP: 00007ffcf5f37de0 R08: 000055a105175c7b R09: 0000000000000000
> [ 6609.414998] R10: 000000004d2dfb5a R11: 0000000000000246 R12: 0000000000000050
> [ 6609.417193] R13: 00000000000000fa R14: 000055a119abaf60 R15: 000055a119ac1c80
> [ 6609.419268]  </TASK>
> [ 6609.419928] ---[ end trace 0000000000000000 ]---
> 
> The WARN_ON here is simply incorrect. The refcount here must be at least
> the mapcount, not the opposite. Each mapcount must have a corresponding
> refcount, but the refcount may increase if other components grab the
> folio, which is acceptable. Meanwhile, having a mapcount larger than
> refcount is a real problem.
> 
> So fix the WARN_ON condition.
> 
> Fixes: 1da190f4d0a6 ("mm: Copy-on-Write (COW) reuse support for PTE-mapped THP")
> Reported-by: Kairui Song <kasong@tencent.com>
> Closes: https://lore.kernel.org/all/CAMgjq7D+ea3eg9gRCVvRnto3Sv3_H3WVhupX4e=k8T5QAfBHbw@mail.gmail.com/
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>   mm/memory.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 424420349bd3..f18266b5a0a9 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3789,7 +3789,7 @@ static bool __wp_can_reuse_large_anon_folio(struct folio *folio,
>   
>   	/* Stabilize the mapcount vs. refcount and recheck. */
>   	folio_lock_large_mapcount(folio);
> -	VM_WARN_ON_ONCE(folio_large_mapcount(folio) < folio_ref_count(folio));
> +	VM_WARN_ON_ONCE_FOLIO(folio_large_mapcount(folio) > folio_ref_count(folio), folio);
>   
>   	if (folio_test_large_maybe_mapped_shared(folio))
>   		goto unlock;

Thanks for testing and fixing!

... fortunately I only got the sanity check wrong :)

Acked-by: David Hildenbrand <david@redhat.com>
-- 
Cheers,

David / dhildenb

