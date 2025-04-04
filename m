Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B198E15FA7B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743794178; cv=none; b=akitcTQQp0WWMXyEG+NQahJm1eQQ1PTBtQweMVHrVhEWQm5y0DMvYyGfz8d8iBM8AEn6yb2byp8Vd6u89ylW6pej6U462AeHdbaZrZY9FxqcN8+NHQ8BXESNqVqm2gsL79V5YsKEbl8h1iR5z9E9BWRI2OUwUOsmJ5CJ0TAG8hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743794178; c=relaxed/simple;
	bh=4jDpcbc+n3StlJ/igRvfdtaJfpXsjzsOP8rxVbWqNQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iURfhiOdlZC0ZB0tIFfbzr7rXE8LaPgQQgFbr4k9R3BKsRCO/+waVY9hvl4bayRzB8Eift5igd2/5VDS+fXHRLNxe6LlexlordyXEFYs2twI72sTsY4zoBnCGf9uxh7cPIrW7pk38oRECsv0GLINj4DIVBRwNyf9kfIlXShreRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VF5H4iPL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VF5H4iPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743794175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4PpR+tac16PtwrzOBM/O7GPHt+8dLRoSGWTrWNH4DHg=;
	b=VF5H4iPLfhFOZeqGV2Oj8c5mvX6fxI4a9ycbTgg/9XAKB48Ff885Xz1PKcLuQ+wuA17f8l
	WcZ14cqQScFkipj+90JBuGmyqjtz1Ifl5zWipbSMekFzrmNMSFU8ycNpMd3GO3fMoEPYBc
	qQrkCxYqIVJVjv6Tou1JLBxm01R+sbE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-HUaOomp9N-m8l7iPkxsGWg-1; Fri, 04 Apr 2025 15:16:14 -0400
X-MC-Unique: HUaOomp9N-m8l7iPkxsGWg-1
X-Mimecast-MFC-AGG-ID: HUaOomp9N-m8l7iPkxsGWg_1743794173
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so12858345e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743794173; x=1744398973;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4PpR+tac16PtwrzOBM/O7GPHt+8dLRoSGWTrWNH4DHg=;
        b=Blrg/UnPEWvlACBYgtPudVx1V2NIB2QK+zk5VKWzLFmwuEZAR32By0P4i3b7iw/qNB
         TiRBUXfpEvDsuTIywAjxaS4TL6WOLaOSzW0WJ3adjUB9rfpJS191xyq4eAzTM54dqhRA
         Udcsx64Hb/e+7mi4Z1USrlgwTXEUMqQWGAN995apcZ/veufTNK4ioTYHUZn8yaaoYCic
         XJU0NYKFsxlrDXR8HhUQxAXWotlOVYu/B5GpEk13vWKPtUilNI+s2A3NrG0OyKXcEiOI
         J8ykQwZ0GAzTnpabur+0eiTcEULOTGv/HCCkJhhaKbJ+PRcEK1q/tkNyLpRrNLYXz+RI
         negg==
X-Gm-Message-State: AOJu0YyOD+qikgCljvfJTNWKrBLkZjRS9oRc3Rv+h9djIff+hUvrJC+D
	r3B8vJEsMYE3/C7p79uF6WjFUyyxZDnjvbLzq2qWwC96KHnkhixzBcletHBuIJ5J85FA7MNFdGk
	XeL7NIyImcZdIPOuNnD1yTI2g4IwQctYwz2uPXJCal5Ufu7/KltnRdPl3njNq3Q==
X-Gm-Gg: ASbGncsNR/bChdrEBCIeFd0kn0F2rr4bTVmx5P4kXYdMfLIZymLFa3ty0srlGMaIH5x
	/to19FDA/8UXxSjDwPD11lfN+l24ZOB9oMw48DszJJngFWqWp8cFirkidryS2iohM5NVo8ujAtc
	Fltt/76i3nAE6AZ2FIMHm0NyjnQqwYPuWzInNLPLcMVDOMFM041paXV8jQ0EgcEt0zgBYVDzPsS
	b5TlHn7p7H7SbtNNKbBnXUzgHqlSC6BJE32yxa8N/uOPv4YB7bN2hgMy8ok1cJ9t/croQrK5HGv
	iBiTrjWFKj2jgwlTIfUt6jNvtLtU80zps7kMAFxfdqN1ZLAdBY3K3950gdFADVlGwZCN9MQ+eZd
	JkIzOk6l7iDUlOPOMVzCwEov9GEWk9qzIofUg4iA4iVs=
X-Received: by 2002:a05:600c:3109:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-43ecf57edb7mr49105505e9.0.1743794172969;
        Fri, 04 Apr 2025 12:16:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH05fYflvrVwvhMukX75WUDcgwXtJWZ9HyjyIeSGiNXu+yaUN2WxYLK1syGo/EXt1y/isBObA==
X-Received: by 2002:a05:600c:3109:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-43ecf57edb7mr49105295e9.0.1743794172623;
        Fri, 04 Apr 2025 12:16:12 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71b:7900:8752:fae3:f9c9:a07e? (p200300cbc71b79008752fae3f9c9a07e.dip0.t-ipconnect.de. [2003:cb:c71b:7900:8752:fae3:f9c9:a07e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm56794595e9.23.2025.04.04.12.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 12:16:11 -0700 (PDT)
Message-ID: <f4924ad4-c70b-4999-b595-01c488607189@redhat.com>
Date: Fri, 4 Apr 2025 21:16:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: update THP admin guide about non-tmpfs
 filesystem support
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org,
 Bagas Sanjaya <bagasdotme@gmail.com>, da.gomez@kernel.org,
 mcgrof@kernel.org, gost.dev@samsung.com, linux-doc@vger.kernel.org,
 Pankaj Raghav <p.raghav@samsung.com>
References: <20250404140657.29285-1-kernel@pankajraghav.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250404140657.29285-1-kernel@pankajraghav.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.04.25 16:06, Pankaj Raghav (Samsung) wrote:
> From: Pankaj Raghav <p.raghav@samsung.com>
> 
> THP support for non-tmpfs filesystem has been around for some time now.
> Update the admin guide to reflect it.
> 
> While we are at it, move FilePmdMapped to previous paragraph for clarity,
> and clarify ShmemPmdMapped & ShmemHugePage.
> 
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---

BTW, we should go over the whole document and bring it up to date. 
Interestingly, it starts with

"Performance critical computing applications dealing with large memory
working sets are already running on top of libhugetlbfs and in turn
hugetlbfs. Transparent HugePage Support (THP) is an alternative mean of
using huge pages for the backing of virtual memory with huge pages
that supports the automatic promotion and demotion of page sizes and
without the shortcomings of hugetlbfs.

Currently THP only works for anonymous memory mappings and tmpfs/shmem.
But in the future it can expand to other filesystems."

-- 
Cheers,

David / dhildenb

