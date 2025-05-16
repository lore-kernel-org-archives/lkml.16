Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E7A233715
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747390354; cv=none; b=kkKj8TLNd4kH67KmfJm/KrCtzm8tEzQpT7jF6bjCOKE2tUV4tZXL2ZvtcG261orH2vGygxWamKqAX9Ix4gpJdOJvqwpZ6PwRkTQ3aiNf0HaKY6vyhIbyjdHUlRKPGyzNcvCl1k3q70CFTOYno9KTiney3fBYT65X130TT7fJO3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747390354; c=relaxed/simple;
	bh=EpuPAzQ+d1tOk/6umcYIVBsz9HFmXyb7/Dvu+WrdcYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTuLxZJYNzfbiLO/FzSd03z3zN6ksb6Jn9q9IaJp1duom84bNx08boWBmA110C/7KkZlV0ayhFQIz2FpfRT4KuZsWpArUYEcUkeTurM0O+gm9jZuFqKl3zyNhCuUuwDV/m7B8wUmb+G8ka9+v7dhLF92UWZbOW9F6slTv+AP2q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HO//VwC5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HO//VwC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747390351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EkasRa5Pu2fO21jkuVHfz8uIAEIKEfNxMoCN0WluX4Q=;
	b=HO//VwC5DVt+tiR3mJGp928nkY8lBqybKyHpRW1ogxGtBHaQGiPauJwRzXmFzxOHJJ2ESE
	SkD4aa6oCS+tt0j9aB8v2uBY263N5TDer4rFDlwXXOhYHhmygiHqEDcmUshJ175xiHyHVU
	rB5+zAuEbe2cbUMB7Wi/y2uirn0g19Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-nd_GkrAaP_uO1oFV1HvUOQ-1; Fri, 16 May 2025 06:12:30 -0400
X-MC-Unique: nd_GkrAaP_uO1oFV1HvUOQ-1
X-Mimecast-MFC-AGG-ID: nd_GkrAaP_uO1oFV1HvUOQ_1747390349
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ea256f039so15565435e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747390349; x=1747995149;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EkasRa5Pu2fO21jkuVHfz8uIAEIKEfNxMoCN0WluX4Q=;
        b=fI+FyQh8hxZA/3MYB43YW9Zct1r/LceLHh1wMqfgf4Ov1L+TvC+WMbi+w/NJ2eLL57
         jROL75/+i6KjHOM+fwErHPVl6yZf6BHPpVB11bUiS7ilHf/gOXsZUSCeOAAgqWLCGk2R
         KdMrFR3uHM0vz4OAPxN6Yw3GWS87Bfox9ucbu9uiZv/qw7nFKlMdLyb6LTkvUK4t2GlT
         IVm14lF1cWNhW9O5E6VHXk9+OElj7QK1L+bv7+LFQCzn51HF69Ev6rRbukKtPI/Wyzqv
         FagF+8KNTLZkMWp7eRushIsIAWmbmUbal9iIIs9Zyq4PLv16sGy20nl7Lw2tfLvl/atD
         +tlw==
X-Forwarded-Encrypted: i=1; AJvYcCW1MXl6MUUkg5oA8fvhVoa+XeQywLRWo6Y+WtBtBOS+VNxFrJxQ52DJNk514iRLfR7CHKJbCkft8QGsogY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUi/9kMq5LfoaQoAZtY38f1dDv87OxtwUVP5/MXZsi/3OxZd3f
	Z7v7h/hA/hkq9XAnJqsCMyiZIwzt24VjgNr/uDZEpusQoGjNc9c04+SgqwmKVCFviOq915E4VyX
	XLgnLh8Md5CUnU0ooBZuIWXOObhT04YVANeqMtYQpo6nBRP6fNPfVa9tkydJprj35AQ==
X-Gm-Gg: ASbGncs6GEWFdEI4HXFX/ESoIXuSDcRP5hEOgRhyKpVV8Ui5qyViENDXgTIuu3Jm1SK
	4dtv8KMiuCU/XPpIjdIgEEAUEl8uOb0/Oroso+3lfhOCvXn2IRUlA9Wafb6fUkS7kmxpm4Vcvar
	Etj8p03lBYhcGWmvPyfz/9+4JdQof7G+jwpTcbn6eomR6xc0tbOLckV9zoxZaMMD+nK7PvRAPU+
	PvGbE16CJIxJLCWdgFQ5jR0Z0h5zIVfD8K14Enffjbxb+gVpZnWW0kbWxI8VOYW8dEhLyMRUBd/
	d4abgb2y78FShlHtCybLopO7I1rHiESmKWVIJXbTXMSoDuRp6nh2Ps8joUIEQX0F8HXOnYSm6nb
	DKSuuDDx03Ay9vVPACPN2vMDIgKFZvJqAIjzBVbg=
X-Received: by 2002:a05:600c:3c9b:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-442fd5a1e4cmr27903805e9.0.1747390348896;
        Fri, 16 May 2025 03:12:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwZCQ9dC6f81oGCBZ3ShcxdI7vy1GL2bgYoSUOa/epYKuujCLoPaBY8jcJSKZsbz7z8M7I/Q==
X-Received: by 2002:a05:600c:3c9b:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-442fd5a1e4cmr27903295e9.0.1747390348445;
        Fri, 16 May 2025 03:12:28 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f47:4700:e6f9:f453:9ece:7602? (p200300d82f474700e6f9f4539ece7602.dip0.t-ipconnect.de. [2003:d8:2f47:4700:e6f9:f453:9ece:7602])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d310sm2400207f8f.17.2025.05.16.03.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 03:12:27 -0700 (PDT)
Message-ID: <a3072d7f-235e-4224-9867-4cebb66ca4fb@redhat.com>
Date: Fri, 16 May 2025 12:12:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] driver/base: Optimize memory block registration to
 reduce boot time
To: Mike Rapoport <rppt@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador
 <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>
References: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
 <56cb2494-56ba-4895-9dd1-23243c2eecdb@redhat.com>
 <aCcOx34j5mgiwfcx@kernel.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aCcOx34j5mgiwfcx@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

>> We'd have to be smart about memory blocks that fall into multiple regions,
>> but it should be a corner case and doable.
> 
> This is a corner case that should be handled regardless of the loop order.
> And I don't think it's handled today at all.
> 
> If we have a block that crosses node boundaries, current implementation of
> register_mem_block_under_node_early() will register it under the first
> node.

At least upstream behavior should be that it would be linked under all 
nodes. At least that's what I remember :)

>   
>> OTOH, we usually don't expect having a lot of regions, so iterating over
>> them is probably not a big bottleneck? Anyhow, just wanted to raise it.
> 
> There would be at least a region per node and having
> 
> for_each_online_node()
> 	for_each_mem_region()
> 
> makes the loop O(n²) for no good reason.

Yes, that's why I mentioned it. If we have many nodes it might 
definitely be relevant.

-- 
Cheers,

David / dhildenb

