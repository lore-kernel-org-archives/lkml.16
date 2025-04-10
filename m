Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90550130A54
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744271481; cv=none; b=C8SIGZOhl2ZIh19bQzPMhJayIsG2r27lbwwkf5X9jAia4gIM/wJputkkl66rxrPexKJ/CUKdcq5yfo62qnegUeJlwf7Q9eCbehQJI/fGsD+6WFIlCpFZ/GPUT8KoRx1pHuPDo7HNjj/dqjQle5yG0eWYoS2OJ+UpvVcyHF5BGN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744271481; c=relaxed/simple;
	bh=/x/sdAmlKBLB6ANTVAOUKEOQ2pYfuORpJBZOwj1Zl3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DX7/kMXLSuZEYszvhVvisRyPQ/tT2StgqTwjbt5vNL1Ek9iJ871Th3rhAR9a22anEfRes2ePk1waPHxNMgA6IIpx3Vlbijsg+YuLtSC4u8XGVs5IogBEx3Cj0jzZ6tqoIwnazr8MYwTYsIx0a7xcQC7P4/DTKFbS0KOOZIEtz4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OjeWQie/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OjeWQie/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744271478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ncwEW164eIm02E7SqERquGllFqE6R8n6rhgXWGPPjCY=;
	b=OjeWQie/ZgYydRNrJiUBNQacqD0cAxF6V7DdYYjJ4ylNn1zMUMVSsanxnZszShC0dIh2y1
	z0i0T+Y3aJPR+SoQYXyNjwYfubbgme2b1+Vt5jW2BX3HGJr2Nv8WM5vU1pbZGTgAZTtltD
	A4PodiNrAUoRGsOY4OghRGZ/GSn9Mm8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-ys0n4ArlN_CAVY5uQnjojQ-1; Thu, 10 Apr 2025 03:51:17 -0400
X-MC-Unique: ys0n4ArlN_CAVY5uQnjojQ-1
X-Mimecast-MFC-AGG-ID: ys0n4ArlN_CAVY5uQnjojQ_1744271476
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac27f00a8a5so41831566b.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744271476; x=1744876276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncwEW164eIm02E7SqERquGllFqE6R8n6rhgXWGPPjCY=;
        b=Krf4DHgXwQx0bsCL66FrTkWrUKl5bLguhTD39DR5MtiE4efS6iB/Kmbyl500hhYyCc
         n9f/+2IlQZRr+eUEI1wsJgBsL1TdTMsqGWUgXH6LuqINsNP5yXl3tK7ynZ1zCGvl0Bnu
         7HWinottad/UOjNIoO3ri04QAlfW7ldbXgW7iu005ZGw5sN3BTrzBKMxWMjq6Tl6I0eg
         cAPK+WsSEJp7Bq+mIoJGIlEoin4HSy1gC0UW/oi98TMd17FdJzHDkgnLBuPU6TXYzkxt
         bZOkd4dEJmfDDuNvXGK5EaJpGkPdXwVhhMJcqGQ/xVo2sdCoEggpmSSjvh+od5xqTpCu
         l9SQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1koXZ0OMbcXrIzwlBXwtzen8Z+wyFcBZJniOabsi61n5n+UtqDgkPW4JHq/qEbA72fMMcXvYKxrZTwkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsQcuao0PEEoiMWK/5+onkPb1RZxY+23kw+x33ADWQ2VaO8jKe
	MBM4O0Vfo8bsetaFYAKFQHVQsV7PwN36B0PEssjsbZZaJ8fzD6qjk04YxDhFt1Uffy6c8aGYria
	TbzxHibPy6Qa0mfo6pGCa7jxI5x4YmVkv3gqC2e9Rfz0H6EMstYuskewK6u8how==
X-Gm-Gg: ASbGnctP1DnLyYJ7xkhBFJ2lobBzUFUEtgHl3mmLuKttH76nBrReRmSjC7JGGqixYrz
	+v3+zhg6h16ebp+rjUUS2Y6kOoF0FQUh+hZdzfVLvkdficatcB/JHYdXsEJ0Bo+MirG43zr4Z9K
	oQ23aV58Ar5wv7+V1DNY5gE1unD4eowy9TmWFtBAHUED1ZqUdLmWJ7aHxzv8Qxv53jniOJTB+0v
	WpVbsOQWVkJOgWYphgaNpWyes9D7AbwLuk75CW/jnUDCwoF4HaQsDaAqX+NJb2sohfrWSaaTEB2
	vHLD5YTppnXZWoJ5nCvpbSwFlnNGiO89rtlNJAytduX2uC+bRxUO0DmsOqgq
X-Received: by 2002:a17:906:7956:b0:ac2:758f:9814 with SMTP id a640c23a62f3a-acac0080da0mr107851266b.23.1744271475762;
        Thu, 10 Apr 2025 00:51:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG39WP8R6g3L71aG5bOHh176hMN6GTv/0pLjw6bk7AARBM3hGYhEni5D0BkGErIWIflkTXBgw==
X-Received: by 2002:a17:906:7956:b0:ac2:758f:9814 with SMTP id a640c23a62f3a-acac0080da0mr107849166b.23.1744271475184;
        Thu, 10 Apr 2025 00:51:15 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb422asm223457566b.115.2025.04.10.00.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:51:14 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:51:09 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Purva Yeshi <purvayeshi550@gmail.com>, peterhuewe@gmx.de, jgg@ziepe.ca, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] char: tpm: tpm-buf: Fix uninitialized return values in
 read helpers
Message-ID: <t2ri7facyvtmt6rx6xwcjos7rgtyiln7cywl2gt4effgukeejc@f3ml4apdh4zs>
References: <20250409205536.210202-1-purvayeshi550@gmail.com>
 <Z_dh4tRIa6xxAWQ2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z_dh4tRIa6xxAWQ2@kernel.org>

On Thu, Apr 10, 2025 at 09:14:58AM +0300, Jarkko Sakkinen wrote:
>On Thu, Apr 10, 2025 at 02:25:36AM +0530, Purva Yeshi wrote:
>> Fix Smatch-detected error:
>> drivers/char/tpm/tpm-buf.c:208 tpm_buf_read_u8() error:
>> uninitialized symbol 'value'.
>> drivers/char/tpm/tpm-buf.c:225 tpm_buf_read_u16() error:
>> uninitialized symbol 'value'.
>> drivers/char/tpm/tpm-buf.c:242 tpm_buf_read_u32() error:
>> uninitialized symbol 'value'.
>>
>> Call tpm_buf_read() to populate value but do not check its return
>> status. If the read fails, value remains uninitialized, causing
>> undefined behavior when returned or processed.
>>
>> Initialize value to zero to ensure a defined return even if
>> tpm_buf_read() fails, avoiding undefined behavior from using
>> an uninitialized variable.
>
>How does tpm_buf_read() fail?

If TPM_BUF_BOUNDARY_ERROR is set (or we are setting it), we are 
effectively returning random stack bytes to the caller.
Could this be a problem?

If it is, maybe instead of this patch, we could set `*output` to zero in 
the error path of tpm_buf_read(). Or return an error from tpm_buf_read() 
so callers can return 0 or whatever they want.

Thanks,
Stefano

