Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBCD2E11AE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749837823; cv=none; b=sFzEM3IHK67t2xz5+YfZriP4V8C/CdKuHwldL96yHDxMOYR+gDR4RAQITKLkcOcgMOZl7CKwRudIqOqU19Jrofp/Z/0OmrT52fGZUCC/Maq5Pb4rM/Te5r+0ncKf2jiC3RcN1sEjcx09627P6vwO96klxKJIYqbONpOxYuaLSFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749837823; c=relaxed/simple;
	bh=lUzYWX0lBAeEtAaFZUQ6oIlkXeRiV8SIm+Ni8yl0P0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KmEce4SEGsDJxaeeNuIyGhG4mqHJSF9gKC1vHwbPTN1Xyn14Uci/cVGSdx5vS5Tgrl0lk6sxOnEMXcyA81rnUhMBptbkbRBt3vqVZI3ObREwVtXVCz3YPWc5xYiqoxlFbYpqqXRoaN+Qq0iuHIW7RCBxji5dewxn1ct+rWMx0zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F6OUZes/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F6OUZes/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749837820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=79I1KegLonJWLXA6E4oFESSeqtDoq+GzCz9tCBGcgug=;
	b=F6OUZes/3cZneHOCTK7xEl3Hg9G1zLkS/B3OcgS/96wZ5UcKiIKoSPuJ7Gj3kQ6L+1Ruz3
	4t3XmO75EC1OeK1kR6+EnDYdvMG8Q4GdulRhmx1gcHKkScYNsqdYGrCzo2d3UWI9LpDXPi
	yTFLqkgKRnY8Ea+z747BT7egl1gZfO4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-IiVJ9cZxO5upw338-gcmgw-1; Fri, 13 Jun 2025 14:03:36 -0400
X-MC-Unique: IiVJ9cZxO5upw338-gcmgw-1
X-Mimecast-MFC-AGG-ID: IiVJ9cZxO5upw338-gcmgw_1749837815
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a503f28b09so1530344f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749837815; x=1750442615;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=79I1KegLonJWLXA6E4oFESSeqtDoq+GzCz9tCBGcgug=;
        b=llN86sS6yUlpWlYB9c6tBen8uUmxiOHe+CWHqf+qgWJ4gc5ICnS2m4orXpo9fFRjOz
         K1I3k04EbshneNid6JDA6u9mFdG3v5hjOg/t89RWH+s9MoZfM+9iNPC/pshCybOO8FpI
         qr4Zl00INq5+xrl5QJUrlelojMc5to6RcPa5s+yQXgbUv/Bj5wt1T0IqimOGrMHRbb6I
         R8HL7p4iG/Qczn/3i79zTceaHMfM7MVclw5PT5kWRvYROxI7LolG31WskLjtl9IUkWB5
         lHWPrzViHL+erAGqp+ABmchlDdMyQaT8XivMF07My8mWjpeuxmpzIDiW05snCoXU3BKU
         iNJw==
X-Forwarded-Encrypted: i=1; AJvYcCX6O/NIexOsxXVgXIVQP88ITF9mK2LjeN0U4MCYB4RcE0I+GOl1UZ7FVM2KGcBxD0qoO9l1cRO29jUTzU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBVOEvzoxj9WcSf2HfYPrkkjBoJrALwx9TqaNGB9CvkVBKYztF
	g2c5gRaDQa2eM8pPwPLZ/F/qq7TFZeyAy1bs+8G+ouphyH9ywCFMo/X8947yUTbjzbnbyXqyJSA
	NfDnZbFeUZQ5FiowXlwzF0x5Xq04Mx/ljFOiMVf6V+8x4KFsMOZ9u4wOZxK4VlUM67BHUjwshA9
	Tp
X-Gm-Gg: ASbGncuTFjIDGj6flFdrx9VXPwjiGhVM4HOGgq7qyUFyvOARYxSVo9I7EnO3SCY7DPD
	c32j1XIMl+f0uW9PvNOermjeXVu4hbFs2Edr82gyMZ8H8potkhCv1s8x7S0bb3PKI4CXXaqM9FL
	hkSmhTthG3noC/SeOJDZxiiTsaIszYCkwtjXVVBqGPWnBtaiTbZqMaSjy+5Fiv3KMG9E2tQjG5y
	hHjmY/V/SaJrKETeNhR777atFMvwKyLXMmTkqEw5b1h4zzh+JNMBke2dviESvXxp+2nUSYKgtss
	4KzHFyCyR64feKZGqMulim0Yj5AUyoNHF4ThuIElx1l9/qbJd5gLoMVFppvO8hwyYQ62GHraTN2
	tX5FKtnvvuC81pVfqS5hOm2b+bxElb2Hak1sKUCwprqZCK4cRiA==
X-Received: by 2002:a05:6000:2388:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3a56d821c74mr2112096f8f.15.1749837814812;
        Fri, 13 Jun 2025 11:03:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIHhTBNt9jXJgHdybTrkLcIGOh9GI1Gf9Iq/2M2YgSQjLOHfZjHQiIlPOGen1z+iahVsRtJA==
X-Received: by 2002:a05:6000:2388:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3a56d821c74mr2112063f8f.15.1749837814452;
        Fri, 13 Jun 2025 11:03:34 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4? (p200300d82f1a37002982b5f7a04e4cb4.dip0.t-ipconnect.de. [2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b09148sm3100825f8f.58.2025.06.13.11.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 11:03:33 -0700 (PDT)
Message-ID: <a47f33d3-fe50-4e4e-871b-bddc99a27264@redhat.com>
Date: Fri, 13 Jun 2025 20:03:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] vfio: Introduce vfio_device_ops.get_unmapped_area
 hook
To: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kvm@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 Nico Pache <npache@redhat.com>
References: <20250613134111.469884-1-peterx@redhat.com>
 <20250613134111.469884-5-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250613134111.469884-5-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.06.25 15:41, Peter Xu wrote:
> Add a hook to vfio_device_ops to allow sub-modules provide virtual
> addresses for an mmap() request.
> 
> Note that the fallback will be mm_get_unmapped_area(), which should
> maintain the old behavior of generic VA allocation (__get_unmapped_area).
> It's a bit unfortunate that is needed, as the current get_unmapped_area()
> file ops cannot support a retval which fallbacks to the default.  So that
> is needed both here and whenever sub-module will opt-in with its own.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

