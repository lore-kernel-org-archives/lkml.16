Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9911D78F4C
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 20:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744574976; cv=none; b=KNeWNbA6KYgwuz8cHgqtGFugoiGbXw98axXk3zjis7S0cH6KDnIchW0PTGbPAXdFOkZVNteJolGRtF2NSWrHpeX6rZOaeHP9LZa3vr8F0//3u3XJ6OF4YktwVWoxIy62G5tDHnDL7dEInx2PWpS/IIQ/CGvNTZFLDi/d6rV/12U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744574976; c=relaxed/simple;
	bh=XpCVrQ3b8tX99TR9K8zuVxctWa/+aOTJuTrdy/x32Cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nw96t7pXXItIg5vXsD8qNaNLW7UhDts28lCsN/l2gEjV4qPNziZvyXye6fmHi/iQjB0YZmL+pUFy1Dhs89YdmBzOKcTzpnj4rJ5IwF3XfJh3AFl3CnY0+McmDoWOyQ6hAAUPqF75LzIIGz3shoTGJp6sAhiLQ+AKm/NH8Y+w0cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rqv7WeFv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rqv7WeFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744574973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=31dW4hhoE6rQzohYOFQKu+yIo7zhpk3yfsTJqJ61yIk=;
	b=Rqv7WeFvwXVGFWncyARoUoAIhv7ECi6NVGzOV7WvSSEo7hseOuJ0BkDmJlUcQzQDL7k9mg
	e2KDl8FroRQtVd2oJc+Ap34Wm3MMyoIF1fKJBFIP/tFgT9iv3SwaTBinjCZUh4skWjNQrZ
	CvbXocch2g2RprSV1Gmz0amTHIuiCXE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-lSxXGT1ZNWycPk-2BC9_XQ-1; Sun, 13 Apr 2025 16:09:31 -0400
X-MC-Unique: lSxXGT1ZNWycPk-2BC9_XQ-1
X-Mimecast-MFC-AGG-ID: lSxXGT1ZNWycPk-2BC9_XQ_1744574971
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3913aea90b4so1441719f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 13:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744574970; x=1745179770;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=31dW4hhoE6rQzohYOFQKu+yIo7zhpk3yfsTJqJ61yIk=;
        b=b5K3JIaEB9rZThLZVULaJU543UZok2gy/g5PxzMpMR8ohUK0gMG6bCtS0xJitP7Zdi
         CuPjWRQsgoHzc6UEAujSD8A6RktmteckNV9pEo/rKzKDLzgKIzK4S3W9pnNogp5xNPWu
         Lufu+n9ISO1z2WLC2WyyzPZpzLVICiZ/n5sxZLgse+f189x67K6HgF1OVLTV9uC69qoB
         NxoVoRLRbfoIlxbGg9t1lbfia8cvMEI8ewyfsIj7Qh2jY/PmyqU/jhaewRWr/YzzoYwL
         XoxVNTzf0fGwcTLzumCOneRKPaPoYej/+s705iWIIM6ASo2nINeHVjWB0bOk0Lcfp0o8
         I4Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWxBlL9N9rZjrI8ugyPfBWhU3EDbTynqs/1BzI40Ndt844X1SSpj3tfzUUZmwQvtckR5phtBJBf6DgKIXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIJ+tMSs0aDakIlm/lwZ8AYn6LXusEZhYPIHZtvTvpLJ+Esz0l
	uy1zH7ItrN+Oqh+lhusHDNunaAjKZMXrWHKBSEF9QnC1MrF87gtCgN549lqRIkOp2a6dM19BH8P
	QR/K2sP8RUY/Lo+pWe64BsJsE4v8lUCpKUxj77ardVfcGi/TcaWuQXDLby1XPWw==
X-Gm-Gg: ASbGncv/9fLSCf777sy0e0cYolgVrqwtwLCz9iRY+RZHlzFoQnTWnyVFaPy07hueYxJ
	3PUyhGULG+o7wHMZh2O6qdlRPICMmQUBYllTyyf42lDfIYiVqEpKlbtU4B6cJx4m8Oh5pPzTGoe
	iBtNK/oIDgXmsaLc2kV8qeptbBA0gLkgDJRLirZzCkSlK5Rio3qh2Onbl87K4G4hixM7AYmR6KI
	y/gKCetRG/RI8gKHO7GmgBskKEhLNyyxagMSE01/0vvfEx7picBwbTEJ/LZ1AhB5jKNcr6EcI9K
	gJSwa1A0KRUlTsvX+WcudCuk9At6xxGtuuFnch5ZQmZnNw0N6MPDe2ZJkfW5bsocR1st6Wr63jj
	OxgY/V0LFmNRkRxez1aG8CrZfBpjfnghbMDjC7/w=
X-Received: by 2002:a05:6000:22c1:b0:391:3d97:bd33 with SMTP id ffacd0b85a97d-39ea51f506emr7749397f8f.13.1744574970647;
        Sun, 13 Apr 2025 13:09:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf5y8Urm27uqHtUYFYgEjadABoT249/CjidrtT4w8oUCDaLSsP7Fzxka+tkR6nzr7xf5LIIg==
X-Received: by 2002:a05:6000:22c1:b0:391:3d97:bd33 with SMTP id ffacd0b85a97d-39ea51f506emr7749387f8f.13.1744574970198;
        Sun, 13 Apr 2025 13:09:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cc72sm9013629f8f.67.2025.04.13.13.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 13:09:29 -0700 (PDT)
Message-ID: <35a93c36-6e97-4b33-aae5-efd1c907518a@redhat.com>
Date: Sun, 13 Apr 2025 22:09:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] mm/gup: clean up codes in fault_in_xxx() functions
To: Baoquan He <bhe@redhat.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, osalvador@suse.de, yanjun.zhu@linux.dev,
 linux-kernel@vger.kernel.org
References: <20250410035717.473207-1-bhe@redhat.com>
 <20250410035717.473207-5-bhe@redhat.com> <Z/sbv3EmLXWgEE7+@MiWiFi-R3L-srv>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z/sbv3EmLXWgEE7+@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.04.25 04:04, Baoquan He wrote:
> The code style in fault_in_readable() and fault_in_writable() is a
> little inconsistent with fault_in_safe_writeable(). In fault_in_readable()
> and fault_in_writable(), it uses 'uaddr' passed in as loop cursor. While
> in fault_in_safe_writeable(), local variable 'start' is used as loop
> cursor. This may mislead people when reading code or making change in
> these codes.
> 
> Here define explicit loop cursor and use for loop to simplify codes in
> these three functions. These cleanup can make them be consistent in
> code style and improve readability.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---

Hopefully we don't introduce anything unexpected ... do we have some 
unit test that could make use feel better, especially regarding end < start?

If not, could we add one based on some feature that ends up calling at 
least one of these functions?

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

