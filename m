Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F26E1DFE12
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263316; cv=none; b=UmibtQ+nRQscV8DW9IGKBw0oSSlXp8v8tydBREmNyjB0P51kRnagKKsJAjsJZKgphk1oFg+ZZlA/0T28jzypFwolK6KQzHfNlret4hFcWJyJiDWTX1tBqt9xHThDbJQNeoFDYLcK1MChdGf5aUfguxzx0eKfL9XTAceggUHKuxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263316; c=relaxed/simple;
	bh=B7ug52vPyNHb8w0pYavpaolp51SYJco0zPo1gWUACmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SuRiWWGdGr8TT1l/vCbqyiPdJH6uDRG69iWygpUULUahP5dCEB985GDe+FRQUaWOCei+JJ5ZQ/RfWsLyQUYqbv8+8aqg4Y0HvnlzRP3BzSKm8BKkaPZfaYG1VcdJNNfVJsxMqRrDokRr6W7S+G1P+s+u9UpoywiHy2rnca8x2IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dUKucwSL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dUKucwSL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748263313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=S/ETi802qf64YaxZQVEnQEIF2B/+4bz5j9A/TOJclzg=;
	b=dUKucwSL+DcJhyx3TMeNnwLbGlDL7kVzrMYGsm/oPU8p8gv3VYJ1qnrwl7Y4vCtxgDrgPu
	uKklKjB5KqwK0m+IApBF/u0vHCahuGgxMr5vgLBn2GZS6jed3KpGjE7kryMz7CNgHNeznC
	P/2dgzlYTxxgafgS2Y4CZzJLn/3uz9I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-RiwtrYy6P4qiIBjQuIW96g-1; Mon, 26 May 2025 08:41:52 -0400
X-MC-Unique: RiwtrYy6P4qiIBjQuIW96g-1
X-Mimecast-MFC-AGG-ID: RiwtrYy6P4qiIBjQuIW96g_1748263311
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4d8983eecso425791f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748263311; x=1748868111;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S/ETi802qf64YaxZQVEnQEIF2B/+4bz5j9A/TOJclzg=;
        b=kSYz7EUoMhRMHFYxclYV9CbQnrMnyHQfMWPPMymzsXQ9dY5waenpdXUJrbMqloagdN
         3LXeGLEERa9XdBEbLg9ehbpEA5x0IqVYDmtGLfr4kLg+dLYfmaFj3OGYJNqZmDQpYlM5
         8ufe8yNNa8nRsMpXEs0J5lnFF910853JhEJKMfTRfj+Uh6lM1aCt7BTdTxkZoN7/4xQy
         iH01e6TWU9lqmuGmonK/6FqPZ0S9tjg8kJlvrLOzSf/huCrRhKuk/zM5ax7Cu3y04CHf
         p7pRgTHTK1ftvh7fupHR8CujpSqzuk2flR8ZrAk3SU3vAE2rZvHFwqxVUpr2V9MV7c62
         MwPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYs67Dcct3eI/DXY5PSnOdFP4BSCNQVKPb+jpZC7NMCH+UwEkNaUPuU8pYM7gw2SfbqVsnmB7UR20c3Yw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCWX4rTcplLgzUeL3T43Sn+tgmd/SajWPF8HzQC0PiDrjO/IfW
	IIeMNwWwO6Xb/hJ2hY7/8+iZiX6Heb/1+Ccutwrpro/cAF5ttKefELz1p9bCs/NOgdPJ6ydkHMV
	xsQGYUnKwQI1gqk3TmgkMVH4FBEECy3oyhhVBT4JPKqpO8Wx5xJT0j+Hqm7wsvVJiKA==
X-Gm-Gg: ASbGncvbIBEwpoy2p+q00aeJey+QclFfqKYxFRsOx/I05Gw1lEHn5cw6BUjiLShnfkI
	tcm80B0ALy+40kpFqdWKToIpL5OV0cxkMD3hRQ9TsXsXl0KOju+jC9BVr+ROyklbpRUOV9FNfxW
	kRbvbd7/sG2d7p9nGsHhhZAghw0+nATohr5ie3ZMd2iHgHrJ9Pzff4EvC2xKOL+coWvR/AV0d4f
	xb6AWyRfFRvtH4J0XnlldpR6dJc9WoU/DZpfTddMa5HCgJcA6qhxkN1HKi+5SDZGOww3uJNJS14
	YCuNfoN/RB5d16EBlPkB0qFDkcnc4c/Nc16Rymyc+BEmDfAk7uthGpmmaXn140UOjOjpGWqyLWf
	9TSHxGHhN7Yd1YLZ0xHuXHZlPqPLhutzfac1Rzfk=
X-Received: by 2002:a05:6000:3112:b0:3a4:d79a:359f with SMTP id ffacd0b85a97d-3a4d79a3787mr3996861f8f.14.1748263311356;
        Mon, 26 May 2025 05:41:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/16mi/MASs2oP8FT7hHWDKlwpnwRqmfhtUxX7Vi9qRJuvn5j7Ix99uQiBZkMJx3GVNB/I7A==
X-Received: by 2002:a05:6000:3112:b0:3a4:d79a:359f with SMTP id ffacd0b85a97d-3a4d79a3787mr3996842f8f.14.1748263310889;
        Mon, 26 May 2025 05:41:50 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:6500:e1c1:8216:4c25:efe4? (p200300d82f196500e1c182164c25efe4.dip0.t-ipconnect.de. [2003:d8:2f19:6500:e1c1:8216:4c25:efe4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d652e8b9sm4125796f8f.34.2025.05.26.05.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 05:41:50 -0700 (PDT)
Message-ID: <d405ba61-0002-4663-8ab7-ab728049d8a3@redhat.com>
Date: Mon, 26 May 2025 14:41:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: fix kernel NULL pointer dereference when
 replacing free hugetlb folios
To: yangge1116@126.com, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 21cnbao@gmail.com, baolin.wang@linux.alibaba.com, muchun.song@linux.dev,
 osalvador@suse.de, liuzixing@hygon.cn
References: <1747884137-26685-1-git-send-email-yangge1116@126.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1747884137-26685-1-git-send-email-yangge1116@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.05.25 05:22, yangge1116@126.com wrote:
> From: Ge Yang <yangge1116@126.com>
> 
> A kernel crash was observed when replacing free hugetlb folios:
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000028
> PGD 0 P4D 0
> Oops: Oops: 0000 [#1] SMP NOPTI
> CPU: 28 UID: 0 PID: 29639 Comm: test_cma.sh Tainted 6.15.0-rc6-zp #41 PREEMPT(voluntary)
> RIP: 0010:alloc_and_dissolve_hugetlb_folio+0x1d/0x1f0
> RSP: 0018:ffffc9000b30fa90 EFLAGS: 00010286
> RAX: 0000000000000000 RBX: 0000000000342cca RCX: ffffea0043000000
> RDX: ffffc9000b30fb08 RSI: ffffea0043000000 RDI: 0000000000000000
> RBP: ffffc9000b30fb20 R08: 0000000000001000 R09: 0000000000000000
> R10: ffff88886f92eb00 R11: 0000000000000000 R12: ffffea0043000000
> R13: 0000000000000000 R14: 00000000010c0200 R15: 0000000000000004
> FS:  00007fcda5f14740(0000) GS:ffff8888ec1d8000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000028 CR3: 0000000391402000 CR4: 0000000000350ef0
> Call Trace:
> <TASK>
>   replace_free_hugepage_folios+0xb6/0x100
>   alloc_contig_range_noprof+0x18a/0x590
>   ? srso_return_thunk+0x5/0x5f
>   ? down_read+0x12/0xa0
>   ? srso_return_thunk+0x5/0x5f
>   cma_range_alloc.constprop.0+0x131/0x290
>   __cma_alloc+0xcf/0x2c0
>   cma_alloc_write+0x43/0xb0
>   simple_attr_write_xsigned.constprop.0.isra.0+0xb2/0x110
>   debugfs_attr_write+0x46/0x70
>   full_proxy_write+0x62/0xa0
>   vfs_write+0xf8/0x420
>   ? srso_return_thunk+0x5/0x5f
>   ? filp_flush+0x86/0xa0
>   ? srso_return_thunk+0x5/0x5f
>   ? filp_close+0x1f/0x30
>   ? srso_return_thunk+0x5/0x5f
>   ? do_dup2+0xaf/0x160
>   ? srso_return_thunk+0x5/0x5f
>   ksys_write+0x65/0xe0
>   do_syscall_64+0x64/0x170
>   entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> There is a potential race between __update_and_free_hugetlb_folio()
> and replace_free_hugepage_folios():
> 
> CPU1                              CPU2
> __update_and_free_hugetlb_folio   replace_free_hugepage_folios
>                                      folio_test_hugetlb(folio)
>                                      -- It's still hugetlb folio.
> 
>    __folio_clear_hugetlb(folio)
>    hugetlb_free_folio(folio)
>                                      h = folio_hstate(folio)
>                                      -- Here, h is NULL pointer
> 
> When the above race condition occurs, folio_hstate(folio) returns
> NULL, and subsequent access to this NULL pointer will cause the
> system to crash. To resolve this issue, execute folio_hstate(folio)
> under the protection of the hugetlb_lock lock, ensuring that
> folio_hstate(folio) does not return NULL.
> 
> Fixes: 04f13d241b8b ("mm: replace free hugepage folios after migration")
> Signed-off-by: Ge Yang <yangge1116@126.com>
> Cc: <stable@vger.kernel.org>
> ---
>   mm/hugetlb.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 3d3ca6b..6c2e007 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -2924,12 +2924,20 @@ int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
>   
>   	while (start_pfn < end_pfn) {
>   		folio = pfn_folio(start_pfn);
> +
> +		/*
> +		 * The folio might have been dissolved from under our feet, so make sure
> +		 * to carefully check the state under the lock.
> +		 */
> +		spin_lock_irq(&hugetlb_lock);
>   		if (folio_test_hugetlb(folio)) {
>   			h = folio_hstate(folio);
>   		} else {
> +			spin_unlock_irq(&hugetlb_lock);
>   			start_pfn++;
>   			continue;
>   		}
> +		spin_unlock_irq(&hugetlb_lock);

As mentioned elsewhere, this will grab the hugetlb_lock for each and 
every pfn in the range if there are no hugetlb folios (common case).

That should certainly *not* be done.

In case we see !folio_test_hugetlb(), we should just move on.

-- 
Cheers,

David / dhildenb

