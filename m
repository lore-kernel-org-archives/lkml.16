Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D913B1F866B
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747382889; cv=none; b=giK1s79f0hHPzZvSD6OBhlVHCuKRt7TP2oN61FetVLlirfTE/LcbGrrU5rmFLeemQGOO6S7iD9JQtRC09rEFBe6ta7X66r711BGPDOJa2bws+Z2jbTrUK7hfCaRM9tys+NxCv8/fzGTAIALkkv72jHr+AQfkdhyQAJ202X9SmMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747382889; c=relaxed/simple;
	bh=j3extryNYX99Y3axXGjKNPMgXw6fOhT5rheFwRAMaDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AgKF3SPBGTCqtyiBOvW3D2wQcUxjONymn7mL98TxXWLxmVI2oMVlnZu8aDJ8xAqXWkOnUxYCWlMrOsl8Nibg1YQBhLMgSIGBF/FDQlT26vfKDGOLOdNICBof8d8GPYt7zC4uQLv2nQDbBrBvupFRbjlaLH3u74seh9LDfMw3GMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A/tDJHAI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A/tDJHAI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747382886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zHuUJbvyNQrOm2zTFjoo7gQWM2M1MQ5Ysz72OI6O49k=;
	b=A/tDJHAIu1k3JpT77ZspqUA2QncrHjbYI5KUhz6YGEUqEVkCsYcU4oAQarZyvfaIjKqXQ5
	gUbo9POOgCWSqGYerX6BLyjDUOjvsetFHIQAtTX1nosV/Xwy94zdaG9OyK0YEG9V14t7NF
	gOuw93T8YRXoSkMqT0NGrwav6kkIMYM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-S7zna9jyMpOr-PtnUspR6Q-1; Fri, 16 May 2025 04:08:05 -0400
X-MC-Unique: S7zna9jyMpOr-PtnUspR6Q-1
X-Mimecast-MFC-AGG-ID: S7zna9jyMpOr-PtnUspR6Q_1747382884
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so10020365e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 01:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747382884; x=1747987684;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zHuUJbvyNQrOm2zTFjoo7gQWM2M1MQ5Ysz72OI6O49k=;
        b=PACGND3Jud7DhzEV09jHjdiFzJwKUN5yV4xT7ZpqpVSZqVIUFWSHw2NMle9fSxMbTe
         cq4YmOiXnIXYo1QIt9cgcCN4lFMRxIzg5n6Suqoa7yczLURh8/oZHN/ioTsILjCL+03a
         LjjN2pt3j8+sXDHqvORSP67HPhl6SlbF1KL0znGeGzGiz81HHO3RelxP6mkUz/O/+7ap
         VahxkQACVlNyWtL2yHZAkbainOQYQxmZHU2yeg2j2c1W/+Ky8rtAIXGm+Th7d13H6q+Z
         D/RA9gwC2UIf4QVwq7ipsQGqiCjaB+/cvF87zYLyrDlGt4s5g1IqDVUpYEnu4TrMoE6l
         CHKg==
X-Forwarded-Encrypted: i=1; AJvYcCXUFIK/LkIcbzdB0UmwXAQtrvSawrHasy9icJqaRnyvoDOhE2wipT9HJJ80abodFin4vB5Ff71/hoojp8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCSjSxhnJ+4XPIDhT+xoZzV9ZDXx7ZVDME4GKp5W8LFvj987Mo
	+hI9bPxlm7a7/3mu/ImNKEdDqZtMPFjLGs9JBMnjJBqgTSq7ApoCA9eiS5giQehIz7AGDQM8hWy
	pv9p65FvJr405G2N/d6SOdg3H9oxz5tZuM3a09bPU2B286/nqWmuCqVjUzca6Y0kUSg==
X-Gm-Gg: ASbGncuvU/GA/sTTxwUw0jQDHNnWkFRw3AtwDGiHe6t+B9zVSBAjmMGNZZUkdrf53Qt
	ZJFx99eTgn2X2lnOGNiJgJ54qxxcx3+VyohsQ5d9jWn1Z4XMzMxMb6WKWjy+bSF39/WqDz+ATVy
	gp3HCA2WZR8qMsgXS9l9jrllcEHNtKfYqKepLWnbkMaZi+Igoq0jk6jbklqUwYopr2W8JSgnsOL
	YbUVHgkrZ2xuUWoc08lhEPVJ7bbjsBT6yH2IfLkUS8SkAgSKsDJoOqUmnBQPhLNQeqlK/8wktID
	dvPG/erNGQ/PsHnvepmIfLH9Cc4mk6h0gi/9l5urmg2qNQ8L3AYL7fLUg48t9Fv+lDU4YHolII0
	T0eV6neogNlmYg6noYi1bQ9e9/U+/I+dlm9A3nSs=
X-Received: by 2002:a05:600c:528b:b0:43d:4e9:27f3 with SMTP id 5b1f17b1804b1-442fefee1b8mr14471965e9.9.1747382883823;
        Fri, 16 May 2025 01:08:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnRyHzg3xjRyTJ/6CojUJX48c7k8S81NAsuB8SYooxFzQtVqZx/z/z4dxA3LlaC9tmLxkWJw==
X-Received: by 2002:a05:600c:528b:b0:43d:4e9:27f3 with SMTP id 5b1f17b1804b1-442fefee1b8mr14471625e9.9.1747382883407;
        Fri, 16 May 2025 01:08:03 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f47:4700:e6f9:f453:9ece:7602? (p200300d82f474700e6f9f4539ece7602.dip0.t-ipconnect.de. [2003:d8:2f47:4700:e6f9:f453:9ece:7602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44300160fd0sm9361675e9.4.2025.05.16.01.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 01:08:02 -0700 (PDT)
Message-ID: <ab11c309-1fc3-4bf5-9fed-5cf3d9b2abf9@redhat.com>
Date: Fri, 16 May 2025 10:08:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Rename page->index to page->__folio_index
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250514181508.3019795-1-willy@infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250514181508.3019795-1-willy@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.05.25 20:15, Matthew Wilcox (Oracle) wrote:
> All users of page->index have been converted to not refer to it any more.
> Update a few pieces of documentation that were missed and prevent new
> users from appearing (or at least make them easy to grep for).
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

