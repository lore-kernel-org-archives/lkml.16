Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37AAEEBA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749837622; cv=none; b=NHlIcdd29z4cyqrukKA/SBYvhgqjY81QV3QvAzK+gPKzgTTBg87/Ixc/RD+ms3dlEFhW9X8MygVltJWqTa5pGzYi78x4fKtxYMbwgAIlhoNtAp32WVdbQYPm+E1o5gZ7zv674fkOaNHpCWWx7mwkL0z0u3CLq2j6s925xwdNUO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749837622; c=relaxed/simple;
	bh=d/oVTXsnKugsuOGjJtUGceEMllHBI7H44e+eSlRJBrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sq7AMcqoecDtbf7TZLehwz4e0ixV/b4shjzH88amR3ucxZSiMej2nngNLm8ZWH9CQwZnJI6pbQImiMF5Irbts1YSH9Av+5132wRP2voFMNS4SfKiK6IYNZYsBNeeUOqmx2SjTeEQXUfkVv5dt8oOoZ3Ys4fOFpr+8fEJux+Nw1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H5Ha3C38; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H5Ha3C38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749837618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2aIKNMIdIuo1UCAdxylRa1DqGXWwEsMVAaI0AuMZvVs=;
	b=H5Ha3C38ExuvTGw2F7Y/6l1iDvCCgeOwCjS6PH+L5Ys7Y/TGKMTRFGTIAjcQAh+znANLZD
	NbE5hnT+4wASRXv4vUn8WVf8Ixx3n+fC14mn1NnWKQmbwgR/5N4QRWlXyXbtn+/hlKWeh4
	Fvrg1Q9vpVDmXupf3gmCbdu6Ab6ACgk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-GkZGRCxNNce1xTatW_hA5Q-1; Fri, 13 Jun 2025 14:00:17 -0400
X-MC-Unique: GkZGRCxNNce1xTatW_hA5Q-1
X-Mimecast-MFC-AGG-ID: GkZGRCxNNce1xTatW_hA5Q_1749837616
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45311704d22so16202325e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749837616; x=1750442416;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2aIKNMIdIuo1UCAdxylRa1DqGXWwEsMVAaI0AuMZvVs=;
        b=o/s8V1u0kuVqmkyt1gLKqN0Vwf0XpYzWLxUpmUBsqzzjXV5YX73NQWDIJitLHCRznl
         s7u+lFFBaLLPBKdMktv/MXvZcLAD65YStaA8LOGke38wjmyVKJSC0ZHDz4R+VH/mRc89
         yE/Jy20tvEClfJjPQdci/pFcL7AaDdjQQ4VYU7ZDOh74kg9TAccnmfqdiPQHsddgzXFF
         aDYaif9/ubfxQavgnUTyio4bSSij7lu1dm8JuLA1h8R0gwnUSgAzVaZypIIJKiUFrbZk
         VA8IQV6BnvQn2i2WTqRaK20uJQUt4douJC6XCgrvvlN5tEfBDFuo/Jgvj/bqXj+5DvjI
         YHvw==
X-Forwarded-Encrypted: i=1; AJvYcCV3UbBsV/zDm33jVKt1UqiRSEVtIz1J37/Sk4CmGGyhykIcgznS1ar+kxSGLNXb3Gs1ZVHWdBNUcOUD1K4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxibhwql6WzTm1rebtDlEY/lePG7TSMDrmbCHU/MGVqnszN+T/S
	3jR7YFY6L6KIHS86KzjovN3NqdaB1KB/nbaIfs5x3jZeEKuTOxI/2XoG4t5XYncPr7Yz2uhxE+v
	PwriG16wof4YMm0hUs/MsipiHVRaLeLLZEC2wWRDYhna2PN4iMvlqZNJXsm4EnzXJ3w==
X-Gm-Gg: ASbGnctfLU4+m+PRPYiEaY5NLVDwocxSUNLMUK6mtYE7K1Zbts21xJqPVI0vyX8xUYU
	YdOyahVheJic+e5ThCx6+GXrx6AKpRVi8sKX2dw3lN6roJLT5e3z+4kOW3oeDfsQqbNxLrmsPfE
	+ExdZmop/WJlrdYcDObkmu8Jk/MhIFrZFVffZGSy3WeYXlE/AFrAbZLDP6XmOGcVp1/6NMbAPRS
	dfZtlzuiBOwUXwj2scvtPD83+RdZHeo0FoYE876U3X0f1DEgbS8VTpExx7BYT2KRyfGo5QWnC3j
	kwjmCQKwO6Ph3h8OfvwOpauB8cxobqsoij4d6lZzopmwzD9xJBseVZ2DDvPX4BYYGRPJQIwXoqM
	7Y6c9GfRY3Tm7e18Cya5Cdg13HIdx9oaYlIBYcynjeEV663vc/w==
X-Received: by 2002:a05:600c:3e17:b0:448:e8c0:c778 with SMTP id 5b1f17b1804b1-4533cb4948bmr4746195e9.22.1749837616018;
        Fri, 13 Jun 2025 11:00:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvbMEemipJF0MHDHTjrDKPJbj60ZNEib57qRrY66hYJiTMjPfY9MiRRAWvY1wgI/IveevRyg==
X-Received: by 2002:a05:600c:3e17:b0:448:e8c0:c778 with SMTP id 5b1f17b1804b1-4533cb4948bmr4745995e9.22.1749837615611;
        Fri, 13 Jun 2025 11:00:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4? (p200300d82f1a37002982b5f7a04e4cb4.dip0.t-ipconnect.de. [2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a73966sm3051956f8f.34.2025.06.13.11.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 11:00:15 -0700 (PDT)
Message-ID: <a3860fb3-bd98-4e7f-b246-c92ecff1181b@redhat.com>
Date: Fri, 13 Jun 2025 20:00:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] mm: Deduplicate mm_get_unmapped_area()
To: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kvm@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 Nico Pache <npache@redhat.com>
References: <20250613134111.469884-1-peterx@redhat.com>
 <20250613134111.469884-2-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250613134111.469884-2-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.06.25 15:41, Peter Xu wrote:
> Essentially it sets vm_flags==0 for mm_get_unmapped_area_vmflags().  Use
> the helper instead to dedup the lines.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

