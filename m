Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307A23D69
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286611; cv=none; b=ATW6DRw83HhR7chbwqVHlTo4H9Bm79Wxp7OyyfrDswsCrICGpVu+IHlnFotl720HXIYM1fqQidHw8t92bsg5ySDu8Iqa9T7eqk7b+GbDaOSCUAA2jh6xGiXjRKCqD4s7b7U3xNHquhshrvTQT/c3bW7D2ct414dZqoZfUyYs9fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286611; c=relaxed/simple;
	bh=rKa/BcPJfm1/xeUn14IcvjBt8CEkjCgQ7x+quK92OcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVyks8dRLw/RxqfX3UiQ523JJG3EcsEanBObWKOYLaYmIc1zUZuEor/Qsa6OzDbGA1WwBQCFaTXerBBf+SEAFYdWqF5bJiDPCVkjY/0q7t58P1JiNBDYKVeUSDB096caOadrjwN/Z7C5L0pIPSIoieikJxKcptWl90IezvTGXHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=guUgFiVj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="guUgFiVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739286609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YaIPhTTmrklH/04lzj/qTEZwP1yJfzcjlD2dlCCUNKM=;
	b=guUgFiVjVbKeILMfDY0/7F/YrGXU29O2KDTBTKO3xDASrL7cLC96jtv1Y0wb+0i/5uVLIk
	fJDOIjP6K6NV4jaA2ZQpZN5y4fiFviQ73+7LDge90mt1O8rveFDSZ/H9ertc1wjX6SAcdq
	862w6emn0VJnnrCvAgT/iL7GN6O1x+U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-L73553jYN1mro-yKJ3O1KA-1; Tue, 11 Feb 2025 10:10:05 -0500
X-MC-Unique: L73553jYN1mro-yKJ3O1KA-1
X-Mimecast-MFC-AGG-ID: L73553jYN1mro-yKJ3O1KA
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43935bcec0aso24346575e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739286604; x=1739891404;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YaIPhTTmrklH/04lzj/qTEZwP1yJfzcjlD2dlCCUNKM=;
        b=enqzzbGsEhDlM39s8FhUaAS/z7UUgaCLdLhB5kY5hqM7dnhi28ZI+QAo54iZjhic1P
         ttDA9OQU3g9m4euWV64RQCzgDHWHswnqt+iGJJEKrIPboFd2bq4cxscMkHa/iodfYsrk
         j+vhGhvU/3i43xb3K4lHRO8uFyaORuaWGy5WjyUa2EE9NwNMh27GyVFOnCgft5XbgfqD
         FQYjtQRrvOY+5B7nhBGLgCX36Cl3qp/pT0yQIZwFMy4+W1jnxngV+XZlXYd4dF5VyGaE
         0xmn/URudgbwsa90we2p24z5KoLUh53sGk4z51H7qILH3s/z/7ipJmbJ5vrd74wCNa7U
         BCaw==
X-Forwarded-Encrypted: i=1; AJvYcCWeWxsZDLH3AZ431xJgx3X/sUSQAmY9cO0OMdgqyVVgjqo1wQJ5SUDxoHuiab9xY9iOEc6zOo2lMlAIIJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yysqysq7Ozk55qlleub/n3u9NMHZdMH3u7wihKDfrm+DQIM/Ruv
	NFzbvRWPwD7Twzr9YE3QMB2VAqB4yhgKaDlOfZuuALh2f23czl3/AkdMaiubenUvSZSAl0Zc/0O
	5ALJMi3k5Q02X+PEBo50RalGi1GvjmqAwBIVihjXU9VcFj+ohv9FT60rGnStIpg==
X-Gm-Gg: ASbGncuWdfSlTrQx62sUYVgVUfjYl9iDIXq0nmwzHx8+w8X1G7EIw1FDOeDAvzPWGvD
	SesMSuKbSH+uEq8P6s3LxiIRq0anVXt8hIpFtKAbdFJaKoTh+sN+JYLYcipLV6jV5qy1l4lfAty
	DkWoQixs6L662Iu/6h8OdllZVBXGtm3EiNMPEG3MfTrgUmaaqsAbafQLVPY6qMDkq/C3BxzjZJn
	YJKXBxRjeQApREOSB6YneCa/0/xir+HV9dBAfXD/qO9Kvtkl/LyHOtsm2ibj0iuBhGOxAxPgA8h
	LTDha2JMco7NeXvfdzT/vb2ufVK9FxUJYfoQDCxH2Dzn5g==
X-Received: by 2002:a05:600c:1f0f:b0:439:553c:2a34 with SMTP id 5b1f17b1804b1-439553c2b7dmr27035315e9.4.1739286604221;
        Tue, 11 Feb 2025 07:10:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3vHRdsPYmIcwDAftHc/ANy5L0ScO29Pz99rNLpUIXl+J91GxugIdJBmcLTGbuxmSRiL8qvA==
X-Received: by 2002:a05:600c:1f0f:b0:439:553c:2a34 with SMTP id 5b1f17b1804b1-439553c2b7dmr27034745e9.4.1739286603870;
        Tue, 11 Feb 2025 07:10:03 -0800 (PST)
Received: from ?IPV6:2a01:599:929:885b:12c0:a824:1abd:41c4? ([2a01:599:929:885b:12c0:a824:1abd:41c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc3a10fffsm14215767f8f.12.2025.02.11.07.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 07:10:03 -0800 (PST)
Message-ID: <829c4d81-7693-4f41-b518-aafd6dcb4984@redhat.com>
Date: Tue, 11 Feb 2025 16:09:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/4] mm: page_table_check: use new iteration API
To: Luiz Capitulino <luizcap@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, yuzhao@google.com
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, muchun.song@linux.dev,
 lcapitulino@gmail.com
References: <cover.1737754625.git.luizcap@redhat.com>
 <1a661d3c94890df06dc82583f883ee5cc6346d75.1737754625.git.luizcap@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1a661d3c94890df06dc82583f883ee5cc6346d75.1737754625.git.luizcap@redhat.com>
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

The usage of the new API here looks straight forward here. The 
page_owner one is a bit more involved :)

-- 
Cheers,

David / dhildenb

