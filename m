Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A071EB18D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311859; cv=none; b=IT0LuMoeQr6CwZGWP3YhWoBRlFuO98lZbF0pYGEM/fpDAIcefl4kKkrB3Agb2Rn2HCf5tH4k1hZZMr74+7/IaOTkmNZ/+oIgaf/gMSczatBRjhXei5R21xLfKuNpdeDynHA93Zbo5Hx9mJ3/4lNBllNYATAxtBT0uOtjsYRH4oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311859; c=relaxed/simple;
	bh=+atzbhAHV1f9Wv/Kw6i6ZiYY1iV9OhFyFOHKc8ka8hE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VsJmWaEzKwD5xmVRqzebbHp6STpYI683NskhiYnOLrST7wgLZS4iWFa8sDJgi6TKJpGD7PTs0kc1CgMvByYq2hkWZpWgen2F20RH+6wofjKAWh3VB7DNo6GOL6ltjAGGA0cUBX1GMJm89oDqTuCv1siBg6tU89m/nvsE8rAdjA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eQJlCdWF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQJlCdWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745311856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6B0LE94KC5PXbnkSxAJBuF6mPjoINd0OvYmnZ/4jZ9w=;
	b=eQJlCdWFi9uGr+5wPJzfGr+LryGUfVU/cqc1TMHsVxp1PGny+EeUtNXz3rpALtCI1lnkYD
	GCeb1XiiKqNO3nLmo5O/oeIlW8J7ozDgV1cUP/HkXtJwc98RuDK7s2PzND3v2t8Q8tUWFx
	qlOximxv/ECbU6uOcWKs4KU4RhJPXIo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-R8CTbI_RMqi4nMx3hYmcew-1; Tue, 22 Apr 2025 04:50:54 -0400
X-MC-Unique: R8CTbI_RMqi4nMx3hYmcew-1
X-Mimecast-MFC-AGG-ID: R8CTbI_RMqi4nMx3hYmcew_1745311854
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso19861435e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745311853; x=1745916653;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6B0LE94KC5PXbnkSxAJBuF6mPjoINd0OvYmnZ/4jZ9w=;
        b=rZTPQKEbXskeTUIqS1/KNPTx+BA3ZnI2nUWRj79P8ytna5v2omEZ043XdhNd5fPeAJ
         N3b9T5p4ZKv317xsEzz2jcDFcfO/sH69jexJFuRnDJJbZ4NChJNuW+J4UnQ1lmzW1T+9
         kiWLmFQwLQsZLTWyo7w1BwnkMWNKhLP+itXzYxh0ziOYblzUrF8zcxZIXQd804vnEZj0
         oIRwdyBGjv1fxkdniApVdKQsAcDEwhiBoQKIErzKsQ+uSL5+LJ+AaCo0j9C0UP1wiD5+
         jVmZ09yRC8JAZp0MEYubde8E9Sqr2MXKaNdN2ZrJLlXHbbzDQWcucjpByttB6/CmILQW
         9+VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY2PQjqzf52kZFjVf9eE1ahSblAN4NPek2Pyt8LEt6lf5x9PEefgZ4j2Tus7LzB3Kw6Ge7lC2NJknD9aM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvNWk8LQtX4gDf317FcdBbk0HZcV3dDM5wWtGYC+R1OW7bpsgq
	5tyZ7SbVc7BJgezLFYr/5gvET1GCsB24FqgkR7zUtO1j/+lZy7hZGCOjstrer7o9Id3hAzxpGW7
	uOF9YUNdARBUi5gHL6KCzpA7AnNEPmyCmNV0WiQWGhOfGy3oQkss8Ld69Ebq5bw==
X-Gm-Gg: ASbGncu0JdR8Iog9IJV0kvJ3VgZtzfbuUjiH9W0EFFtfLtGe4e6uz0wWtFNtuUOS99j
	2VqcLaNrxKMBQe2Hu1PR9pJDpGX2DtG/evMPYM7/RxpIUM1aeVZ4nmPKRuxEW39UjWmTW3VPeaY
	DF5le3UtVT0T9hh7xRwvF+mbHG8SQUJKwiWruVqA2wQySDJGtSKVXRlqytvVOyVvr3SkbcfNIhu
	1Pd7BGCCFd4CFQwb7Y9QcwKbroWP//pk/UwvCM1wDyHK8qj7992XwZVHK4IuycDQy+ykW8jOGel
	ztUvQu2r18v//PendcsGR6PvoWVnJ8EDa/uBR6byRwttyoyzD/G2J+k7ZBgzI7Celsq6O6JICp8
	eILWZWDUKu8chxHuKge/Gv2ADLVEsAQh8TYe4
X-Received: by 2002:a05:600c:43d4:b0:440:67d4:ec70 with SMTP id 5b1f17b1804b1-44069732095mr105475245e9.8.1745311853737;
        Tue, 22 Apr 2025 01:50:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErrlYgPNYzWiUSwUsrRMkQshINw0ncY3n66rzLogtJXIgGnykHWr1MaVD74WgN8IrHO1zFKA==
X-Received: by 2002:a05:600c:43d4:b0:440:67d4:ec70 with SMTP id 5b1f17b1804b1-44069732095mr105474995e9.8.1745311853405;
        Tue, 22 Apr 2025 01:50:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c731:8700:3969:7786:322:9641? (p200300cbc73187003969778603229641.dip0.t-ipconnect.de. [2003:cb:c731:8700:3969:7786:322:9641])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49313asm14453525f8f.75.2025.04.22.01.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 01:50:52 -0700 (PDT)
Message-ID: <5c9b5466-399f-4a35-bc7e-dde9e7e2640a@redhat.com>
Date: Tue, 22 Apr 2025 10:50:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mm/hugetlb: Refactor unmap_ref_private() to take
 folio instead of page
To: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org
Cc: mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Fan Ni <fan.ni@samsung.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>
References: <20250418170834.248318-2-nifan.cxl@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250418170834.248318-2-nifan.cxl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.04.25 18:57, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function unmap_ref_private() has only user, which passes in
> &folio->page. Let it take folio directly.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> ---
> v2:
> Picked up Reviewed-by tags;
> 
> v1:
> https://lore.kernel.org/linux-mm/aAHUluy7T32ZlYg7@debian/T/#mbf9f3e8b49497755b414e1887b2376b3902ffb76
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

