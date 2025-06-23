Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F399AD51
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666190; cv=none; b=K5Zdjyzhu3n8aPxVHukYyJpJ0bNlAIfBuje2izHS0bXsA8cG18UfahQV8bMjJxXXrnYmQn80UnMlJbysOCbGurgjhBSQIFuNyXoLgm3g2mYP8dy1HifMgUYq3ROLQO4atgl6RuRHRBUVFPUnc/scpdBEjLMXRFCMSpnI7G4fDVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666190; c=relaxed/simple;
	bh=0yMGnrPd5ZqhsjAB8urReSlL1tD3LiTLVK8tC2OU5bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GW5OK1DGd8FSSdoUv7KUtDY8li+WoiNmovCwYMT5BmKZgoaG2KFTDOoTTx3EHP+LErmZjYmKhKFmncEKw4CCD0eFbloc2eEkj0VOTazAwt6XkTfR2/00ZuMEo4Qq4x1M34FnAbmmlMLbNPWRpvcUXUIYyvHPkdSMzBWBZoyzyKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h3PKdooL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h3PKdooL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750666188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZoLkNCOIuM5JEq5J9oMA6vdOX/Go0Smb3Cqjl+UXzmI=;
	b=h3PKdooLWExd8pAu8E2XspGHjCRzADjkOsxqb7QnXXQ3gT+PEln7ODpJQpjmUPvtThUI3/
	DgJRJjImSJ7tm82wsmRUTc+65AUqSOP9kaBdHDXe5ov0yopdhXdIsjIqpKs8xaSUTM3gtS
	wxKTStPhmKocsYpytxLHifU/788IFRw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-DF320_daM3ylAnbJL-yyMQ-1; Mon, 23 Jun 2025 04:09:46 -0400
X-MC-Unique: DF320_daM3ylAnbJL-yyMQ-1
X-Mimecast-MFC-AGG-ID: DF320_daM3ylAnbJL-yyMQ_1750666185
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a578958000so1301529f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666185; x=1751270985;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZoLkNCOIuM5JEq5J9oMA6vdOX/Go0Smb3Cqjl+UXzmI=;
        b=wY9JR6aMDkFxca48wlX/NqRcY3nJC/KdhraJJOGP8385vatRiRaxDBBtGlcyN+ZGK0
         QReMPN3O6V0Yx8DZgRslQM8hnrb3BHKteOgzMyXk/8HewOC+YsCeLGd4yoNNJxKoVFF9
         ietGbJyDveMR9pnhnyRCtX+zbmyQ8/GXUl/8PZDhXbck8LExl16ptmn1SSk3erc2XL6Y
         AkJahaWfeoYdlysPkEgM3rN65OXVf11IFfRDNWdr9oz3Rdz/lNJwAXr6ofYDfz3XbKR5
         ZOFJk24S23ZhnGieRstCdv/SDZlO22EX/7dSgB13cxqj2itQ2Ve9kWeJ4lWMFJn9Athy
         XRtw==
X-Forwarded-Encrypted: i=1; AJvYcCU8YvmJoNwnLOXUokWhRuyEh55jmCySuUFYgo/qwx3eUtHPVu0qqEnENelev64M/E2PsZqsrEJh66ibSsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4PKduAudLUGl3/oxKiywPHLqdu/2EG2JCnNxcmOt1bHkjYLZT
	4mEXTlH3v22O1gZfU2vyvaQVFQRifu8K/sLKKoQqa1QJbF9VHBkgR11JZ8ueuqQhDkfdZQ0y+WQ
	61pD+8hVxZgNGn7L6GP7NboJc2EOUPoqLU/Q54M+u3GzS80kIVl363OkNq7YxJRt70Q==
X-Gm-Gg: ASbGncuuvNYcEll16A0K9fszdyWb2GodTjv8CVTaOIc9ZompyOX9ZE+xhvTV5W8pn9b
	/R3u7RYbhLRx8l183D5xNN+FN16X9AItKV6E30Rl/uNJlqZw6vfezG861BeSGpKeMkzEohvRpVC
	jkxc8AnMLsmYSxiuhCrs5iSoasFIk12ZAgvSCWxrrY/3Hfm4QE9Tt1z1UA1NCFDVyIirVnBRHJt
	JRaj6nZ6Mr8R5JZpY1SL11ZYe2j/fpGPJTn42V1MDJf0hUWUZNYlwexoqLsHhCHI5PW2uyEiJ56
	Gh0uDNqI7Cql8XffvVLfQEeWPLjSagixikbB4aaXd3oZ1m5OC1fX+eBZA6Zn+NCdwX0xHN0+Gzc
	HRnDTrtyeH8b5YviFQQAzmhIMGet9PwybtMS8yDo3iMXd9wUPNg==
X-Received: by 2002:a05:6000:4618:b0:3a4:f918:9db9 with SMTP id ffacd0b85a97d-3a6d12d52d0mr8203109f8f.32.1750666185358;
        Mon, 23 Jun 2025 01:09:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE5NMbzGns4Ud1DK8X95jr6pyg7YsHTa6Knp0H71wmbZQUUlCQ20bRY4JdQU2MDB76jFyjdw==
X-Received: by 2002:a05:6000:4618:b0:3a4:f918:9db9 with SMTP id ffacd0b85a97d-3a6d12d52d0mr8203084f8f.32.1750666184934;
        Mon, 23 Jun 2025 01:09:44 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536470903asm103919615e9.40.2025.06.23.01.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:09:44 -0700 (PDT)
Message-ID: <aac5662d-b764-426c-a763-79053ecea1a5@redhat.com>
Date: Mon, 23 Jun 2025 10:09:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: unexport globally copy_to_kernel_nofault
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, andreyknvl@gmail.com
Cc: akpm@linux-foundation.org, arnd@arndb.de, dvyukov@google.com,
 elver@google.com, glider@google.com, hch@infradead.org,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, ryabinin.a.a@gmail.com, vincenzo.frascino@arm.com
References: <CA+fCnZeb4eKAf18U7YQEUvS1GVJdC1+gn3PSAS2b4_hnkf8xaw@mail.gmail.com>
 <20250622141142.79332-1-snovitoll@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250622141142.79332-1-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22.06.25 16:11, Sabyrzhan Tasbolatov wrote:
> `copy_to_kernel_nofault()` is an internal helper which should not be
> visible to loadable modules – exporting it would give exploit code a
> cheap oracle to probe kernel addresses.  Instead, keep the helper
> un-exported and compile the kunit case that exercises it only when
> `mm/kasan/kasan_test.o` is linked into vmlinux.
> 
> Fixes: ca79a00bb9a8 ("kasan: migrate copy_user_test to kunit")
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Suggested-by: Marco Elver <elver@google.com>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

