Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022C428D8D3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 11:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749036816; cv=none; b=WBRpd805zPfnn9V9ULkYRX0Zv4Z1HDpcPMzZ1ysKv4z06/R+35iT0iUrX3aUnL7h9SXPysOHgtxwGn+76FNJZlfCeQtt8nwy2niWbE3si4VjksGZCmVzFkNdwyttiQ4P8uvGNFVmdbos+faEtE+Pvv/UR584DBiARanKnBsUjNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749036816; c=relaxed/simple;
	bh=ytUoKNC2WjKJEBNR5HZseYC55Rn/6amOPcLFGvmFVzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4XxtXU26rYOF57L6kienh0jiT+lQObZqNPoeJnFIh/4ODIGfaafXZMHWDXufFqs1HhVIPxp0UL8kX+V/jMR/Trk2H/obWTHSXiM0CZJFCtXuql979lzmQpzbwlk0aLA/+KRuNwH60jO7gEWsejI+UWVGqWJ982KX5zPebI34kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=idg5KZnk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="idg5KZnk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749036812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MyQt2johQWtxMYuAwwY/HHR2S0j1U3CDI1ooJIdEYRU=;
	b=idg5KZnkbJ2UvgbOL0ZUPKLZPK4GOscdsuGcTM9scVpP1pnRdnHBj+Jbg/SLX1/yzrbrHU
	b9/Duy0N4BRr4JZk42UTIudlXdP+xis7AFRV4F1nTqNG6VSiN/ZzerWOlQfGMTDPRQMyyR
	F6GkwFX2kVUyQnI4L70auTL3++xLkTQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-hjJSICH3MK6IQLuuFrXc3A-1; Wed, 04 Jun 2025 07:33:31 -0400
X-MC-Unique: hjJSICH3MK6IQLuuFrXc3A-1
X-Mimecast-MFC-AGG-ID: hjJSICH3MK6IQLuuFrXc3A_1749036810
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d290d542so37099235e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 04:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749036810; x=1749641610;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MyQt2johQWtxMYuAwwY/HHR2S0j1U3CDI1ooJIdEYRU=;
        b=lX52nodqz+MspQ0hl7GNEYlHJzcAS/Z4X5/IWqZhCVj2XPA1+9FnTRMWOcECuHMnMm
         ChWKu1Qtj2FjVLq5G7gTK5TXsQiB5mfd/mNeeSUsec5QHAKv3zzmfn78/zbWnxFXhNSh
         KDM6qLy55TqOrqi2F8OY3ZJcXbDkWidOzfw+9H2e8s6TsRS0EmwBB4AraHSvwtN/6CKX
         3AQY8pisqj3q6vKIORWrCpV6s5fetj81lMW34ZBzjJ0rQ9tVYAPy+Zomq+7yOfgZIsdV
         +BcqqBkl9KWEHYcAOopxOgwtVjqlOb0QWfprgz4h/H5EhmMuizBAq8eW7stAPo/2utJf
         /syQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfHEEwPlGE8eBHKh/agMFWGOH8QbLmdDlurCoFQ8ycXLmSt/2Jno1G59TvNtYXxKhuIjE93y7d2MxXig8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqzMnhLvmaUZ/tOM7vEYQv+t01/XogZViAsvyf+zrcbXa7OWiN
	hrtQopE9YZ+ewp8au0HyiA7mleP1+YOE8G0tT75dRbzpvPxyyNUnNNxzbLAok/nw2T12DzcLqxa
	zvkrTmqD9WYRT3au3g+VD6u9m0G4t25NCJLZ6FjOFjuQXvk36II2HLtbWgIUbHp2oGQ==
X-Gm-Gg: ASbGncvIyKj3Mh/+x9vLLE6ji8/Ty47vxyhLXdpPYh7pUzmpmSpHCAAWRgPn0TT+7wF
	AeY7tHCYNSlVQn2UBXVX+gRwGAfE+LoqobIfHyJRKrryK4Mnnbcb7RdA70GzYmwQmoR1pPwpXlX
	EONeHfxJ0t/ZHmFkwY8GwPTLku2SLSKB9b00md+gpGP0Fiy5q0CgZRAiM+RrKEE+/2VqU/tXQUc
	mA2VKUnP5xRb8ZcDPL9NmzOoPGjHT/29z9vhKHU/+rPSIaVO2sq42lA8m2w9PCLKK3OLQHXWols
	ttFuu8M2K85ClLEhNTUYzgwrngocN8PnfR/f3uMs23cyZuhbnaLeem/o20EOYhYAlLO8pKl/Uq7
	DeDAFvLmg0wVRATh54a8mOKNYJXhbtrapp0elUB4=
X-Received: by 2002:a05:600c:c1c8:20b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-451f1680284mr11866515e9.6.1749036810425;
        Wed, 04 Jun 2025 04:33:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqoVz0lYNaMYqWzIIYfW1H6uv753TnaSi4WlHH20770u7Q7XE9I797JmIASn0R6pSoBimJHg==
X-Received: by 2002:a05:600c:c1c8:20b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-451f1680284mr11866275e9.6.1749036810003;
        Wed, 04 Jun 2025 04:33:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b87csm21787067f8f.12.2025.06.04.04.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 04:33:29 -0700 (PDT)
Message-ID: <34584ae6-473d-4cf8-923c-3a8e7f16e8ad@redhat.com>
Date: Wed, 4 Jun 2025 13:33:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] mm,slub: Do not special case N_NORMAL nodes for
 slab_nodes
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250603110850.192912-1-osalvador@suse.de>
 <20250603110850.192912-2-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250603110850.192912-2-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.06.25 13:08, Oscar Salvador wrote:
> Currently, slab_mem_going_going_callback() checks whether the node has
> N_NORMAL memory in order to be set in slab_nodes.
> While it is true that gettind rid of that enforcing would mean
> ending up with movables nodes in slab_nodes, the memory waste that comes
> with that is negligible.
> 
> So stop checking for status_change_nid_normal and just use status_change_nid
> instead which works for both types of memory.
> 
> Also, once we allocate the kmem_cache_node cache  for the node in
> slab_mem_online_callback(), we never deallocate it in
> slab_mem_off_callback() when the node goes memoryless, so we can just
> get rid of it.
> 
> The side effects are that we will stop clearing the node from slab_nodes,
> and also that newly created kmem caches after node hotremove will now allocate
> their kmem_cache_node for the node(s) that was hotremoved, but these
> should be negligible.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>
Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

