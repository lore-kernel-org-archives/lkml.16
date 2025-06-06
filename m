Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F7B7FD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749196738; cv=none; b=bNau+tG1ici3miqZM7+Y1OQJiWjmY7XityVfA2p/tWratzECW1sSQwVhhtf6vswT9YMA2va0YUWqQ9j/eSCJhs28M938X7tXdZ+i+qCf8TXElykIafcdq9MufwlnZkBKyfRv1ecYNMkQqVVa7ej5C/k/y3ZRMdJPDbBoB2ASkRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749196738; c=relaxed/simple;
	bh=amiwHsARR88tHQuXprMoDecdmjojEM10Utx3fmly10E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EVMzCdcMM/ZsdREotc8p9Sd8LsqHTa8dgcCAvVMfSvvKwjLefkgci1EjtDs8/UuHZtZDeWLy8+CO1NdPao3xYZsQ4mE/w0wiZDnGgO8gS7nTeggWutwMHDGC9C86wy+z/ZdueinhUOH2QAnfLVEO4/BmRBYg+8CMJ7HlXoY9zEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-j0Dp8AWKMFWMJ-3aExRNwA-1; Fri, 06 Jun 2025 03:58:50 -0400
X-MC-Unique: j0Dp8AWKMFWMJ-3aExRNwA-1
X-Mimecast-MFC-AGG-ID: j0Dp8AWKMFWMJ-3aExRNwA_1749196727
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450cb902173so9890245e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 00:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749196727; x=1749801527;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rT+6EOEZOyjryWL73lnRtwCrh7JgiqBpVgBnHHhLL2M=;
        b=MfrH32D/vPRxhlVjTIAgfN0IGKMyJvlX97HQDOGpADcEIfItxrzNXXMvRBH5bpl3hn
         x14QVnf2mGUA4NoU0pqjWo5yBHsoDKhxs/j8P9XQkoPw/rXAX3lpmb3WQquihxCwx7wT
         A95pbXHJGLKlNVCpxNP1y4mu27a4AEM3Cu5yxrVJAh4ab2ENAJ3rd9321Ab4eWuhVXiQ
         0XapnRIfjF4fmRLgBvjNT2zULhJ9hgm4KGYjH407VbfJpGdzDoZKc+pyyjkTK/bQUGfE
         qeRDeHoLORvtxXLDb3JF11ry/ks6L4uTQme934ZzfcZak9TIKgP4fDx1JhYRFqb5kUq5
         FKwg==
X-Forwarded-Encrypted: i=1; AJvYcCUYyblq97S1C1hWosc0gJ0KgGLkBcEgA5sIHxjbWWZgCin0iGHZQVt8Z19Fk8QM6CuAjhShMcBDqcOWfM4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Iye82g9MkaWlLuV9mtjV/UWMmnneRsNEL8g5fQrTQi1M7qe8
	y7hY2hNBYxJo9jcisJVM/ODwMr0O4cGiVfPg4YVs8jm0TJrS0wahvHX7Zhd/7+4XX/s5APXewNq
	j+lgyFM0DZCk7hKKiMMdRIuzhlHnxZLjmTRolgE/cRz8kIOfO4WeDQFIiK/dOWEHxsQ==
X-Gm-Gg: ASbGncvpMzl9ODg6AGy/J1sdrR6awwbWLPMMVAiiYEGvC++a4VviY2nDxhTZZ6U657z
	ma5Nd/d+ic1MLXvLhB1wc70/No0QQ2I+b95BMlHrXoBurhGarL9cZCGWF7X5ZcXYswcNoBAJ9TB
	GQb7hpf/VZJ/nEKkBfQ+hrRkTjj9wxEpr1AX6PGVv6PwCLxBnSQ5uf2q1RUwgaRQzs3MpFJbVEb
	Gt/Hektb6LJyaiB8onSww8/MnqRuefXM/1WQoxqUaelcH5CnJBHnnVVZl4QUQb5MvKLxOKCrLH+
	9yCjSufNPnqDtpVELhj5I8sFtBp3njLnUrQrV/+E0NM=
X-Received: by 2002:a05:600c:3513:b0:450:cabc:a6c6 with SMTP id 5b1f17b1804b1-4520159f6fdmr22511205e9.15.1749196727039;
        Fri, 06 Jun 2025 00:58:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBpu/aX9JVdtPj2ilODNwEhj9UPbOV+IqXXilwZgYYw6kZ4KLLRjVEysvaRXHTSemDq8Paow==
X-Received: by 2002:a05:600c:3513:b0:450:cabc:a6c6 with SMTP id 5b1f17b1804b1-4520159f6fdmr22510995e9.15.1749196726654;
        Fri, 06 Jun 2025 00:58:46 -0700 (PDT)
Received: from [192.168.3.141] (p57a1a6a5.dip0.t-ipconnect.de. [87.161.166.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de01sm1156559f8f.11.2025.06.06.00.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 00:58:46 -0700 (PDT)
Message-ID: <6f0ee0d4-60a9-4453-a08e-2353b234dac1@redhat.com>
Date: Fri, 6 Jun 2025 09:58:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] gup: optimize longterm pin_user_pages() for large
 folio
To: lizhe.67@bytedance.com
Cc: akpm@linux-foundation.org, dev.jain@arm.com, jgg@ziepe.ca,
 jhubbard@nvidia.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 muchun.song@linux.dev, peterx@redhat.com
References: <8b68e7f0-46b8-4814-99a2-02f0044cda9c@redhat.com>
 <20250606073727.82993-1-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250606073727.82993-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.06.25 09:37, lizhe.67@bytedance.com wrote:
> On Fri, 6 Jun 2025 10:37:42 +0800, david@redhat.com wrote:
> 
>>>     * Returns the number of collected folios. Return value is always >= 0.
>>>     */
>>> @@ -2324,16 +2349,12 @@ static void collect_longterm_unpinnable_folios(
>>>    		struct list_head *movable_folio_list,
>>>    		struct pages_or_folios *pofs)
>>>    {
>>> -	struct folio *prev_folio = NULL;
>>>    	bool drain_allow = true;
>>> -	unsigned long i;
>>> -
>>> -	for (i = 0; i < pofs->nr_entries; i++) {
>>> -		struct folio *folio = pofs_get_folio(pofs, i);
>>> +	struct folio *folio;
>>> +	long i = 0;
>>>    
>>> -		if (folio == prev_folio)
>>> -			continue;
>>> -		prev_folio = folio;
>>> +	for (folio = pofs_get_folio(pofs, i); folio;
>>> +		 folio = pofs_next_folio(folio, pofs, &i)) {
>>
>> Nit: indentation is still off?
> 
> In my editor (vim with ts=4), after applying this patch, the folio on
> this line would be positioned directly below the folio on the previous
> line.

Documentation/process/coding-style.rst

"Tabs are 8 characters"

:)

Good choice on using vim. This is what I have in my .vimrc regarding tabs

set tabstop=8
set shiftwidth=8
set noexpandtab

set smartindent
set cindent

-- 
Cheers,

David / dhildenb

