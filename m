Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BA625F7B7
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925683; cv=none; b=fJYZaIziSdusu+CKKwpsZNSP65GbeOxNox3lSNCWYuA5DuV9NWhkEghPh5ry3Z4ETr8ollSQSg0s1W+h70AkVtXwP8JQeUO0DQrqUQ1lpNWQVKMjz3GQxRLJDzLfbUnldgejKSupvtDmz/SROxZlPVgomWUCZuyrKr2LKTA04Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925683; c=relaxed/simple;
	bh=/08rIo+YiIFQipyF/I7GNKbsm+GHfzZJb3t0ZxWnDeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X5RoXNBTvgYroOjFwlHqSoAsIDYFbprAU/SccWKBlB7o86oFVrZGW4oMmuGikSXFT8WKI2KyxObfu1qzn4PYbEjWnvbhQ0zp5VG8lxj34bHtO6bkFQVu8ZnsB/Bh4VCgHLGJHbFOIeU0oKipESqvn9D89/gFSUSF1DQMnz/lPGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UNBB2VLm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UNBB2VLm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750925680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FXuQnOQ4hplAF8sChY9RP0R1waUoFTXug8mZppLDacQ=;
	b=UNBB2VLmKbJFwDgNJqHqcacy8FsY/FrKnOxMZ5jJA1P4ICsWb9Tv/im9Z1jqZGeaq2URZv
	fg2FyYR6o0j6bVPNd1CAeVyK4JyL+cEJE9b417Fhei8qWRLaMFmAw86yHBSzO58B7yRLbH
	vyr7Zd9YCy+yCnxYhnHvG3aFEyom8ic=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-MPoKoxgMPa2VcfxAxuQXyQ-1; Thu, 26 Jun 2025 04:14:38 -0400
X-MC-Unique: MPoKoxgMPa2VcfxAxuQXyQ-1
X-Mimecast-MFC-AGG-ID: MPoKoxgMPa2VcfxAxuQXyQ_1750925677
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-453817323afso3941835e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750925677; x=1751530477;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXuQnOQ4hplAF8sChY9RP0R1waUoFTXug8mZppLDacQ=;
        b=vmx5WWewe1Q1Ki39+NwqHpqgu9BZyaCFJIC7If4WXDkEEfL45F79r7/sne0FKP/686
         OcXquKzrEgGCl5tblYJY1JCJGwBcgxccx/wX0tW7XOJtK9mKHFADLFsAK3HANIi/hEA/
         N2EniTO7w3ZBGFQYS3t6PqD7VdGoO8iD8jqH6YqMGRost+8wgxUzXlSTya1uAtSWTZQm
         r4OLdptu8MYh7NOu18Jiy2Kt5uM6dKbyt1FdrLtbhyEEG8X8D86OyvqA4/CKOSCzBJpl
         DaV0TW0XAILbRQap4jga2yhoNG0wrjdvJBslcea7AmmP8jOIwjwITaw/Q/myOUSWmQng
         jbew==
X-Forwarded-Encrypted: i=1; AJvYcCXk2FFChC9YKy1P8oCJhtF814dKvZedeXIUP+fSONbtNrW3XUpJstkNNSk8nSb7h3DMAV9PvAQOJcf3bnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhNCXPBkAJfESJfutjhukFTQXcaJYMCkxAH8jFqpP+oaTa5/2V
	9ZIstTd3FmeqCwuDQgHJTBXsX6JUvOVpAj/Z9AfAwraxsE1LjK4SMsHHKOa61+8+5mwl0hMROGt
	/cuiKEGdrFv7Kr/kodJ/QvH/LaHCFaiSX3H4wOK88PseuofbWNLZCfKuevGOnX3q8Kw==
X-Gm-Gg: ASbGnctKfWt3OTgLPWW9qzl6QFlelWgK58niVZZAbJ6lwq40xa5h176WjcfDJfB0PAU
	5XDJ2gE+kYjLnXrcpYvkFJUzspVPPiwPBxrlZnWNQfWWyAQiCk4+kw88ud+LGVyQL4kP5dsTW9r
	StDHNuVZQiBuow/eXWBrVNrct6WCykTJv+DciSWzsFnaz/tBezfgG5DnBB05k1bGJrxamKkMfF5
	lyB4NKQdk41KMaPQs6IEAeIco3P8EwBkxNDiv9J9uTvKN1pBD1W0r4KSBr+8QXk5TMBzMjOdwAd
	rwNcREAfeeluyRKmMcsv6egc4yfLKemHH77ii9w7jHGGRYiPPKUueo/470iPIIM6brJJbHp0Hov
	T9V6+ERRGk+ll0jean5ECrFjIcyxTsHd91qzr+LN5i0zmYf/85w==
X-Received: by 2002:a05:600c:a116:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-45382048dfemr50038795e9.15.1750925677093;
        Thu, 26 Jun 2025 01:14:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoa4CiX6ZH0gY0VYDlOsjyda9amvAhAyCgqGAshgT/W3xvpwLzg+qBbZTNDEICm9qv7cI5lQ==
X-Received: by 2002:a05:600c:a116:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-45382048dfemr50038555e9.15.1750925676680;
        Thu, 26 Jun 2025 01:14:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:2f00:8afc:23fe:3813:776c? (p200300d82f3c2f008afc23fe3813776c.dip0.t-ipconnect.de. [2003:d8:2f3c:2f00:8afc:23fe:3813:776c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a421434sm11660005e9.37.2025.06.26.01.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:14:36 -0700 (PDT)
Message-ID: <8e8058b7-9912-40c5-9bf8-571fee4d62a6@redhat.com>
Date: Thu, 26 Jun 2025 10:14:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] mm/memory.c: convert __copy_remote_vm_str() to
 folios
To: Matthew Wilcox <willy@infradead.org>,
 "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Jordan Rome <linux@jordanrome.com>, Andrew Morton <akpm@linux-foundation.org>
References: <20250625174841.1094510-1-vishal.moola@gmail.com>
 <20250625174841.1094510-2-vishal.moola@gmail.com>
 <aFw5NuCbgJOBmG97@casper.infradead.org>
 <aFy4QaXmKicMLGLR@casper.infradead.org>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFy4QaXmKicMLGLR@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.06.25 05:02, Matthew Wilcox wrote:
> On Wed, Jun 25, 2025 at 07:00:22PM +0100, Matthew Wilcox wrote:
>>> +		folio_offset = offset_in_folio(folio, addr);
>>
>> Umm.  Not sure this is safe.  A folio might be mapped misaligned, so
>> 'addr' might not give you the right offset within the folio.  I think
>> you might need to use addr - (vma->vm_pgoff << PAGE_SHIFT).  But I'd
>> defer to others here ... particularly when it comes to anonymous folios.
> 
> Sorry, this calculation is obviously wrong.  It should be something like
> the calculation in linear_page_index(), only without throwing away the
> bottom PAGE_SHIFT bits.  But that's for file VMAs only, and I'm not sure
> what should be done for anon vmas.  Possibly there is no way?

In __folio_set_anon(), we set

	folio->index = linear_page_index(vma, address);

and in __page_check_anon_rmap, we check

	VM_BUG_ON_PAGE(page_pgoff(folio, page) != linear_page_index(vma, address),

So given the VMA, addr, folio, we should be able to figure out the offset
into the folio.

... but I didn't have my second coffee yet.

-- 
Cheers,

David / dhildenb

