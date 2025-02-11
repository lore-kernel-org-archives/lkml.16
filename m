Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF24320F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286957; cv=none; b=baI1g89WIwDVCXvn/C7jYOsSOwvvz5blSUzBcA3E/2t/a8a7ogEBRjbpCcJ2aKHDcQen0VPnNDrF+9c77EoBvAA6KcgejiYnjmQlnaD7adDRAkHtbE4hmXqO3UfwjwcajIzdP145dApc/pN4e9STU+qKA4//x/tKySq43aKzbrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286957; c=relaxed/simple;
	bh=KeSjVyxC378vIebmlOXDosxbH7gBV1+OIaTapdkL0bE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JhtVT8Km2bhnRc/cPr4xYVMD4kRGjRVVfJqChEhEBjmHMnUvDsvIBfiz6JQz/96LOcyWSRmDVraB7SJXw8vi2FGNskEr8XncCcKnNqoEF4wOlbrt09BD/tJ5IM2D1G4jnL1KTEEvnau11ZCsTCFGOV1JotKvMwpMt9UnbVLbUUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bHEaCPZ9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bHEaCPZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739286954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vcZFl+XoEs/dghf3uEIry8icUOGSqnCy6XVALuOaGnU=;
	b=bHEaCPZ9qPtGqihxG/YY3XX4SAwitwDr68NUde0k0UTssiTN6Dhva6nRLNQY5AqkJ7Q50F
	VvTksBr8cqaojvk3fQQZCUUbrTdIETPtyuT6qpv+0G/427eI+n/Gw964HuSQ2GxNCG1Qyx
	iRz1Mx+3n/viFDqUhldCXD9N1Ql+zVw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-1Q-a3jdhOcKPN_lhln8JvA-1; Tue, 11 Feb 2025 10:15:53 -0500
X-MC-Unique: 1Q-a3jdhOcKPN_lhln8JvA-1
X-Mimecast-MFC-AGG-ID: 1Q-a3jdhOcKPN_lhln8JvA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38ddee833e0so1278665f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739286952; x=1739891752;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vcZFl+XoEs/dghf3uEIry8icUOGSqnCy6XVALuOaGnU=;
        b=K0i/WbtKjgWhcByLjPwIlQjGTMQg5kH9jVAaqO59Ut8ySrPBLOkqBqm+GkGruyd5wH
         2J4iaF3luD9mwR5JcQg0trwGyH6NMu5Sl9ylk06mmyMYaS86LZg7DBqYhqjPxqWhaPKC
         h/gkxkmPbPLLQ1Qb3LjWCtjkuq7NSzaphmDZ4x/Z9U32CBaSlfM6ISTwr0ZlrUSISV/b
         AbXvSh9dynJ4r0KLHcA+iTtMRo1DeuXTzmecG+0dA3BowjlUXoeOiziRVzKIpfl7mxg2
         Ubkc9oGuIdyeT/xNJKY39foc3lu0xOYlDpB/R0JLOngO0yv0c2Tc5yml09QKNkY4zE9u
         0sNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkXm6ivv3KMawaGIPNJYKGsex/kRQbM1VRk8MHUKUhTfn3htI+XakluxQTvhZ4eLMmMX/ECEigy3wgLaM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8FkRLG6J+f0Ngk15GkkhAsLWL6Z15wM2AxNquOkMpRTqP0Dtl
	dKjf5gj0vOKklNpftl/cvdqOYS7eyjYvHo3xNRcev3MxgQlFVnFA8frvaT3JbEX39WdJAlrW2Mr
	D/qGvQRuWG50ys8Ewjv87zvsWH7hAqdLDZA25NvYRa6vsp/m8l3IuvR8YKr/gPg==
X-Gm-Gg: ASbGncvCGcz4ecPpUIkBTLAYcvMGg4jVCguSkulgv/CjaNpdEv/dRc320vkoHvpiLMN
	O+LWb7AH6qps/YWqLfIwBc4qnzJEUqzd+SnOrkDwN4zmlx9VlyncRZZegFjpad/zJO9nBvsnqnt
	kvckef5wh5TF3Oiq0P3+aoZScU9EPE4eLo0uD23LfqPPXs1QpwEWJ7aAOGIYLLdZubUTlXTPoCW
	+xZfs8OBecAJrIdfuISLI+M6vGGVDl28XnUANhaKY2nCQYS/mOYLz/m8lRhhOQr4qWiAjT+aecF
	Q9qDJgWys2x9/ks1xCCpSLYgci7tDrJ911JMqDukSIq+Vg==
X-Received: by 2002:a5d:64ef:0:b0:38d:d8f7:8f75 with SMTP id ffacd0b85a97d-38de43c6f4amr3244449f8f.17.1739286951907;
        Tue, 11 Feb 2025 07:15:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJGdLzc2sv/P6Epb2uXZ3yNlkN4TOHSQBAQ07wlVTkmwOw4VNiOon9jasl9oK7oa5/CYw/fQ==
X-Received: by 2002:a5d:64ef:0:b0:38d:d8f7:8f75 with SMTP id ffacd0b85a97d-38de43c6f4amr3244421f8f.17.1739286951570;
        Tue, 11 Feb 2025 07:15:51 -0800 (PST)
Received: from ?IPV6:2a01:599:929:885b:12c0:a824:1abd:41c4? ([2a01:599:929:885b:12c0:a824:1abd:41c4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db1150csm215908075e9.39.2025.02.11.07.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 07:15:50 -0800 (PST)
Message-ID: <40036244-644a-42e0-a5e4-4838a98b1cbc@redhat.com>
Date: Tue, 11 Feb 2025 16:15:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/4] mm: page_owner: use new iteration API
To: Luiz Capitulino <luizcap@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, yuzhao@google.com
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, muchun.song@linux.dev,
 lcapitulino@gmail.com
References: <cover.1737754625.git.luizcap@redhat.com>
 <712c1e058c58ba0d4c407089fbcc45c55ceb8efc.1737754625.git.luizcap@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <712c1e058c58ba0d4c407089fbcc45c55ceb8efc.1737754625.git.luizcap@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.01.25 22:37, Luiz Capitulino wrote:
> The page_ext_next() function assumes that page extension objects for a
> page order allocation always reside in the same memory section, which
> may not be true and could lead to crashes. Use the page_ext_iter API
> instead.
> 
> Fixes: e98337d11bbd ("mm/contig_alloc: support __GFP_COMP")
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> ---

[...]

>   void __folio_copy_owner(struct folio *newfolio, struct folio *old)
> @@ -364,24 +376,26 @@ void __folio_copy_owner(struct folio *newfolio, struct folio *old)
>   	int i;
>   	struct page_ext *old_ext;
>   	struct page_ext *new_ext;
> +	struct page_ext_iter old_iter;
> +	struct page_ext_iter new_iter;
>   	struct page_owner *old_page_owner;
>   	struct page_owner *new_page_owner;
>   	depot_stack_handle_t migrate_handle;
>   
> -	old_ext = page_ext_get(&old->page);
> +	old_ext = page_ext_iter_begin(&old_iter, &old->page);
>   	if (unlikely(!old_ext))
>   		return;
>   
> -	new_ext = page_ext_get(&newfolio->page);
> +	new_ext = page_ext_iter_begin(&new_iter, &newfolio->page);
>   	if (unlikely(!new_ext)) {
> -		page_ext_put(old_ext);
> +		page_ext_iter_end(&old_iter);
>   		return;
>   	}
>   
>   	old_page_owner = get_page_owner(old_ext);
>   	new_page_owner = get_page_owner(new_ext);
>   	migrate_handle = new_page_owner->handle;
> -	__update_page_owner_handle(new_ext, old_page_owner->handle,
> +	__update_page_owner_handle(&new_iter, old_page_owner->handle,
>   				   old_page_owner->order, old_page_owner->gfp_mask,
>   				   old_page_owner->last_migrate_reason,
>   				   old_page_owner->ts_nsec, old_page_owner->pid,
> @@ -390,8 +404,13 @@ void __folio_copy_owner(struct folio *newfolio, struct folio *old)
>   	 * Do not proactively clear PAGE_EXT_OWNER{_ALLOCATED} bits as the folio
>   	 * will be freed after migration. Keep them until then as they may be
>   	 * useful.
> +	 *
> +	 * Note that we need to re-grab the page_ext iterator since
> +	 * __update_page_owner_handle changed it.
>   	 */
> -	__update_page_owner_free_handle(new_ext, 0, old_page_owner->order,
> +	page_ext_iter_end(&new_iter);
> +	page_ext_iter_begin(&new_iter, &newfolio->page);

So a page_ext_iter_reset() could be helpful, that wouldn't drop the RCU 
lock. With that, we could probably also drop the comment.

> +	__update_page_owner_free_handle(&new_iter, 0, old_page_owner->order,
>   					old_page_owner->free_pid,
>   					old_page_owner->free_tgid,
>   					old_page_owner->free_ts_nsec);
> @@ -402,12 +421,12 @@ void __folio_copy_owner(struct folio *newfolio, struct folio *old)
>   	 */
>   	for (i = 0; i < (1 << new_page_owner->order); i++) {
>   		old_page_owner->handle = migrate_handle;
> -		old_ext = page_ext_next(old_ext);
> +		old_ext = page_ext_iter_next(&old_iter);
>   		old_page_owner = get_page_owner(old_ext);
>   	}
>   
> -	page_ext_put(new_ext);
> -	page_ext_put(old_ext);
> +	page_ext_iter_end(&new_iter);
> +	page_ext_iter_end(&old_iter);

In general, we should look into implementing the iterator without 
temporarily dropping the RCU lock I think.

Nothing jumped at me from a quick glimpse, but yes, this usage is not 
that easy.

-- 
Cheers,

David / dhildenb

