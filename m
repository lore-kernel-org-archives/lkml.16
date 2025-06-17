Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA222EA16E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175492; cv=none; b=p6pj6LZNhX6D8s5Kx93X5OnEP2F5xPd8JErpupnjFdaKcM3IQ/4xtmoLxOXVGsYD9UL+gj9mKBKzQo3HDFgNv9bLU2UNXF+rELUQDOovvt3h770lMP1eUmAh5NttKIlYkS1YCmMehaKBZZwPfAioWmyqV2cCZN2sJvPv/z0y/Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175492; c=relaxed/simple;
	bh=9zfK/zqhAL7je8O8EQpc/An6yGl+ONA+RetA0G3iRGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B69wubL4nfoeULkzVxIm/ox2m3AGJVRVltzt3TMaiB/YSngGt0svcsiDX77tLWGx4QrVv4OVSI7DBA1ZxMPTVk1fMGoyksNBZBBs/Uz70eY7u4T+9d3fMcWPuQJLEmLnfdQXdpB0TyxFvRQYr3typhLmjQsHLHYxQCv5iXZdeD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WsYUEpJ4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WsYUEpJ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750175490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=q0+ckg97IhIdb9K0jYRzCnazhUKXUoBtd5hH+qAmIhc=;
	b=WsYUEpJ4+0GQ3RXqi7WZ5Qt+IwlRbjsorDvlztA6lkf42KrZhrDLtBIecC4BKZckHU1E12
	jIwrK8PavEiighi00bm9dRwtMrM9WSCNSL53n8vO4pkR4iqUj9BuYKRhsn/pubxs8VRJq5
	SDZfiKinNyiN7gYU6/j/odtrXPoFOzE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-HFBR6hHMNEWHU8Vq8cbkJg-1; Tue, 17 Jun 2025 11:51:28 -0400
X-MC-Unique: HFBR6hHMNEWHU8Vq8cbkJg-1
X-Mimecast-MFC-AGG-ID: HFBR6hHMNEWHU8Vq8cbkJg_1750175487
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a523ce0bb2so2992267f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175487; x=1750780287;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q0+ckg97IhIdb9K0jYRzCnazhUKXUoBtd5hH+qAmIhc=;
        b=OWAnkjlxV4dOkQzremEXjL+TvmvnhyYuhpqXkPgDRCjlBFELzSo+T4e2lHFaooUBfy
         FmJJBCFyKa/9AxLGNCwfWjZADDhws/KE+vvlSyalWJDPIdBA7X6pVi4HrUG1WJyUgWnS
         Xi5QCKTrBnY6UhPU+FIYSSL7i3IoLdufis3Lh7rpdjy6bUrwighlXAf6IQJYDrSlOMkG
         XlHYBpH0CW6vzKVPOJyl76awT1olvklO04N/vJDSUYsWf6x1w1Vo7V8vTKqhZkeTjdyj
         G+6EHjAh0oI/YzLtZx1TeZz6BitvCgRxiPGxzkfgomrqdMt9amnItfMjNKXfD5PDQPFt
         Q71w==
X-Forwarded-Encrypted: i=1; AJvYcCX1R2SMdJQk4GHhPH9dztXtLRMSicJbeQuQegM5tsT1QCvnwQK5wEukY3fkJ48KQfgDde+wHUZEEPsK3SU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrgSZwCTGxiV9llrkTGEjpM0P/ocLRRiTe47W33nI9oxlx+NBB
	wBtVbZu1Dphey3u5YgxsxbwTgb7k07VuaxVR8BnNGihKdG8s/JESPgjTQvJR+HF+YoFdfh3b1ef
	bgijsGl/aiJOvOe2yuiK45zPmNuimTIvlOV0VAFz9qIhXQan6Pg+qlnwhB2cR9W2S/5AvKCjzfJ
	Ee
X-Gm-Gg: ASbGncuCgS8VJfNGpqp6Ti9JX+qsUM0nIfKASs4bDg/MnGgt5xoGI4OuoYuAmk0ahJO
	uKVvq5KMzXxvg/FoBklsPk7m8Qo/VQqa3qTCgthQ47XSAltLDCV53hFmam6RZzp0ytVaVdNXOBJ
	qfWgQDjLrUOkFeeluSSE0XcjE/QmHUI9UnOO8tScg/vTTCRR6Inr+/oT9eIxm9rUylExqiZ3xOE
	11lP27nfyDlsDCnvb94MF+h2q+RqNfLsa+dwB9MPWxrLyCidSQJ4olVd9gE5tCXWF7mXH1lbEc5
	nDpH4tzj9vGHyNFQdubFvJxfjmwZgTdGxrjSz4HovFKD0rERhYMv/wRr//yRKsX3tQ0ElCDNbY6
	3TQQk2pFU49R7J4utmxwK+f/W4I/YtiAbiNmdoPjixKqpmtI=
X-Received: by 2002:a05:6000:71a:b0:3a5:27ba:47c7 with SMTP id ffacd0b85a97d-3a572e2df96mr10823048f8f.48.1750175486750;
        Tue, 17 Jun 2025 08:51:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfZtAxDUDJcz8UcC88+12q8AZmkhtghVQ7mOMmlLwW33EI/Z8t0v0CbEF778AAbbjZ38KHJA==
X-Received: by 2002:a05:6000:71a:b0:3a5:27ba:47c7 with SMTP id ffacd0b85a97d-3a572e2df96mr10823027f8f.48.1750175486376;
        Tue, 17 Jun 2025 08:51:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b70d77sm14481676f8f.94.2025.06.17.08.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 08:51:26 -0700 (PDT)
Message-ID: <4d4760da-b51a-44a3-85e0-45106925b601@redhat.com>
Date: Tue, 17 Jun 2025 17:51:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm/ksm: Rename ksm_merging_pages to
 ksm_process_sharing
To: Longlong Xia <xialonglong@kylinos.cn>, akpm@linux-foundation.org,
 xu.xin16@zte.com.cn
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250604031758.4150209-1-xialonglong@kylinos.cn>
 <20250604031758.4150209-3-xialonglong@kylinos.cn>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250604031758.4150209-3-xialonglong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.06.25 05:17, Longlong Xia wrote:
> Renamed ksm_merging_pages to ksm_process_sharing to better
> reflect its role in representing the number of sharing pages
> for each process.
> 

Isn't this possibly breaking user space?


-- 
Cheers,

David / dhildenb

