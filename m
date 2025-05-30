Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9524A28
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 11:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748604694; cv=none; b=aDDXY/wLnQDFmDKeJf8mRKQt4ssuVXeVl8yKyLmmBN5LuXC1Y5H+fsRD73tNV50APOL5zPxEv1Q7XcldrNZq3Zzt3gCtLJrgdtx4YOeXTwBRKmAkYtHilGaJqRbAxuD6jwTfslH/gKbR6F68j6F3sg3wkdl/JYqHNVFzvAuSKY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748604694; c=relaxed/simple;
	bh=bKHnHt2ofLuC9zSbRCTp5RvbC0TJM295EwCpoNdQt5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EjOD/N1NbW4QEGWgKEldZ1tIJiXAv6IIt2w0J08X2D+Ray83hJPHs0nVmP+XA2JSjrZr8+xIv1MsdwskcwKUYk3fI52RTMfrXYHHT6Hq4+kpyJo2+OIHDnWdqGZdjbKoozopFiL3+te5FdserSdcb+qy3st9M314g2oBR3GI+U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M0J03fF5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M0J03fF5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748604691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Orz1dWpWTcwglQpXKN+jv23Chiw8dD36FoK1Cob7nM8=;
	b=M0J03fF5NaAIYbPwxFPcBSBCKKA39XKIMi3VWeKsyemAgWhKrcnZfntJW7qz1VeuyYvNN4
	zCky68p+rr4S3C0rsg+eRVfC+WbreTJh3rg/qqcOV02RKzrGBaAjEvuWwaxqWw95ak7N+v
	iTcMDO6dLZW90bHPgXgEVfd5EDCHz6s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-4mnHNoInPZStMUDMjC60PA-1; Fri, 30 May 2025 07:31:30 -0400
X-MC-Unique: 4mnHNoInPZStMUDMjC60PA-1
X-Mimecast-MFC-AGG-ID: 4mnHNoInPZStMUDMjC60PA_1748604689
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso11608165e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748604689; x=1749209489;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Orz1dWpWTcwglQpXKN+jv23Chiw8dD36FoK1Cob7nM8=;
        b=TMR9GwAUXtQvGZVoKAL2Dng4RvbAtwq0qMmZsJ35G/H4GGTUMU24MqLVUHRpGQTDiK
         IO+nfAf/vislMyT3riQr2gEd9udIPw901mY+RTpi9zX6Vc+5YIhDcu41m1wJ9nVwnU2k
         jDBWUD6jqITiqv/dVGcWVKnfIdyS6Bbizcb6r8KvCRVWy06TKKTJ0y3kungXjKDxtcQj
         lCHlCGolOqGmzemRNM3gOOTh95nsjsNs2CmhyWI7+9eLpfglhH0qA/kJDe3K0CN8OK1m
         jqdCDmgyFPfD9ZRQgFs39xbtMyhJcVd/epEhpiw3/Shh3lKjfQeg7wAAzRRRimR6T9W+
         LgdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYX4WrjWtMgApjoW1HjJdD+dgTW73AGBbRV56UGD1mi52dN8ac2u0lNTQ1A2+07I7UgFOW/RktKHMTzjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW2tIFwVEOp1jf24ITW+u+l9OiyLbWV9ivfHs5rKy1pHM7zuz4
	pYq7SSCyxMrGqP3o5uxarr4FD4FN9kZlrKq6xvix9IxNpa2AFkCtbp0wCLBQo2uiAe5VogBrkwO
	Svah3Mal8HFGeaVEPFPHoP79ANTG6d2oAzYpYgpTBpSBCTVhkQWcrHivOc7z4DciqRQ==
X-Gm-Gg: ASbGncsi+y+sXSjVECWh/7HgrE3cc4foRGKiX9LOTn36yyagX6M/yTIA9K6Y9zEQHV6
	5VMMLSQ06VmUyBIk6Cm28M22H0OqpE5uNkle77cireixQCOKKZ4lxY2YADNu1Br1NdTrKHZerjQ
	QVjkYda5Gf6QG29qiHEH6DonkNffeqoKAwFu9fphMh6MEMccGtpVyDB7Vea7hxGPnlOldUqVAgT
	w+iGRVaTd2bP3ka5BpYYHQe45W5ppJlfgzGvQenNHrQpFx5VpsVxu/IMeyiabh0ixtF5NBOHEof
	HmD6VU0khNmIyPj4yoVWKHVKZIDhWLDFAgcYk8oQ7vCpDakUvew0
X-Received: by 2002:a05:6000:3103:b0:3a4:dbac:2db6 with SMTP id ffacd0b85a97d-3a4f7a7cc6bmr2273589f8f.49.1748604688818;
        Fri, 30 May 2025 04:31:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZDnNkUdD63iYQNSW3yhDVRuYaPmbfBT7vwGZ6v3NIFmHsNuBFtcvU5wsfPEEdUS1v6VlRYQ==
X-Received: by 2002:a05:6000:3103:b0:3a4:dbac:2db6 with SMTP id ffacd0b85a97d-3a4f7a7cc6bmr2273559f8f.49.1748604688361;
        Fri, 30 May 2025 04:31:28 -0700 (PDT)
Received: from ?IPV6:2a01:599:90b:feef:9de7:67cc:305b:deed? ([2a01:599:90b:feef:9de7:67cc:305b:deed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dcc18a80sm3196965e9.38.2025.05.30.04.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 04:31:27 -0700 (PDT)
Message-ID: <a98bc945-0020-40ce-a650-47dcd0274001@redhat.com>
Date: Fri, 30 May 2025 13:31:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gup: optimize longterm pin_user_pages() for large folio
To: lizhe.67@bytedance.com, akpm@linux-foundation.org, jgg@ziepe.ca,
 jhubbard@nvidia.com, peterx@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, muchun.song@linux.dev
References: <20250530092351.32709-1-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250530092351.32709-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 11:23, lizhe.67@bytedance.com wrote:
> From: Li Zhe <lizhe.67@bytedance.com>
> 
> In the current implementation of the longterm pin_user_pages() function,
> we invoke the collect_longterm_unpinnable_folios() function. This function
> iterates through the list to check whether each folio belongs to the
> "longterm_unpinnabled" category. The folios in this list essentially
> correspond to a contiguous region of user-space addresses, with each folio
> representing a physical address in increments of PAGESIZE. If this
> user-space address range is mapped with large folio, we can optimize the
> performance of function pin_user_pages() by reducing the number of if-else
> branches and the frequency of memory accesses using READ_ONCE. This patch
> leverages this approach to achieve performance improvements.
> 
> The performance test results obtained through the gup_test tool from the
> kernel source tree are as follows. We achieve an improvement of over 75%
> for large folio with pagesize=2M. For normal page, we have only observed
> a very slight degradation in performance.
> 
> Without this patch:
> 
>      [root@localhost ~] ./gup_test -HL -m 8192 -n 512
>      TAP version 13
>      1..1
>      # PIN_LONGTERM_BENCHMARK: Time: get:13623 put:10799 us#
>      ok 1 ioctl status 0
>      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>      [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
>      TAP version 13
>      1..1
>      # PIN_LONGTERM_BENCHMARK: Time: get:129733 put:31753 us#
>      ok 1 ioctl status 0
>      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> With this patch:
> 
>      [root@localhost ~] ./gup_test -HL -m 8192 -n 512
>      TAP version 13
>      1..1
>      # PIN_LONGTERM_BENCHMARK: Time: get:3386 put:10844 us#
>      ok 1 ioctl status 0
>      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>      [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
>      TAP version 13
>      1..1
>      # PIN_LONGTERM_BENCHMARK: Time: get:131652 put:31393 us#
>      ok 1 ioctl status 0
>      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
>   mm/gup.c | 31 +++++++++++++++++++++++--------
>   1 file changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 84461d384ae2..8c11418036e2 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2317,6 +2317,25 @@ static void pofs_unpin(struct pages_or_folios *pofs)
>   		unpin_user_pages(pofs->pages, pofs->nr_entries);
>   }
>   
> +static struct folio *pofs_next_folio(struct folio *folio,
> +				struct pages_or_folios *pofs, long *index_ptr)
> +{
> +	long i = *index_ptr + 1;
> +	unsigned long nr_pages = folio_nr_pages(folio);
> +
> +	if (!pofs->has_folios)
> +		while ((i < pofs->nr_entries) &&
> +			/* Is this page part of this folio? */
> +			(folio_page_idx(folio, pofs->pages[i]) < nr_pages))

passing in a page that does not belong to the folio looks shaky and not 
future proof.

folio_page() == folio

is cleaner

-- 
Cheers,

David / dhildenb

