Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D177535963
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234792; cv=none; b=IrGkdK3nXxVcwGxk/5Q3+/SfwLjTCPEwNdwFWXTF4qz7af6HDO5B+r0Lgf1LL9ID8dibuoIpf+As2CTVqGCgg5eBUNwuaIrYoajJbGdmTVQVUblSqhcceunpvwrD9mptqI6nh8dk/y/wnV5VvsJouiD6cqtqL79Va5BgBtppRbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234792; c=relaxed/simple;
	bh=67ZZJJ82Wk90GNJd8QSrc+JbZU5JNJ5yO23A1/kqh4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBytfP9jRHHYpLd5W7fpcnOUkfpGBjRR3D4DC2XopRTUpk7CvAXfmDEduwdPUmaIB1+2/lJXDYXmZ147u27VER3INrLZHu7UP3ztz5eFyHwjcR39MIMyA6cb/SB3rNeXn9r4UuWz7FJTiNBOhlS6QnY/ic5rxRcHdTVVoa1yK8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P5aoW9CM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P5aoW9CM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750234789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FjBsfSR47PaVfWXC658Z7wh/Dh+hU3oJf9IYVsvV9rc=;
	b=P5aoW9CMS6PK9RAutxCn1JkGY/HYE67GURFcVQ599SZYtFO0ktMwfbAZm5fXC8D2TPxDCS
	Q18Y+P8/Ti0Y3/4ft8QZp7n80ciIsMMi+nRRc4T9vIMzOexD72xNRceu38+xH3ThVeQSht
	NNjE7pyTSXKvcQTYzz+f/FeFjsA1aws=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-RT4PSPeEOhmXNFuHiRa4RA-1; Wed, 18 Jun 2025 04:19:48 -0400
X-MC-Unique: RT4PSPeEOhmXNFuHiRa4RA-1
X-Mimecast-MFC-AGG-ID: RT4PSPeEOhmXNFuHiRa4RA_1750234787
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f8fd1847so2401745f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750234787; x=1750839587;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FjBsfSR47PaVfWXC658Z7wh/Dh+hU3oJf9IYVsvV9rc=;
        b=KQfV+uYH8uKo2Skf3lj4MZMzptUisgOMq4KlVfHjCi4NJ+H01qyw1wMWO+A4UWJHKL
         apwN8LIpZ1B1D+l/giskxL+zEKeBVtMNR3mtqH57Wdb0GdV30808BjmWqXS0iSuR21eM
         ysPwhnbBvG9crBww8+glCv82t5fB/WlkycZuFVwzAUFyWegQ5GtUofa0Pb8Gy/6BS8D5
         BHd/4AhYglTSncEIbcw4tFALA8arPATWijHWgCsh+1nc55vN4IkGZgsr9i8UDqVgjRgr
         lH0sbfgVr8NXatGC/3QXdvUCOdjkkq3jf5MgWpEXEjfTdKOo5lunBmpiBH2z06k/JB2i
         rVnw==
X-Forwarded-Encrypted: i=1; AJvYcCWmsj6h+KrvTnpn0o0Ghag8EvAGlQy98E/182nbis7D7HXm9/T5uJEKPNQ0oBHobD9LP73Mq1eyQtCfitI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5tUFrOdgowcPXQwVADbHevdrdRwQvY6hu11o/a19Ynr+gBL38
	zPbLc4sQuBZtUKfT16wlMvX4csehc4180LeXJiGmMxN0NJQPVG+NEiUZpbDkPTMSLFBvp9G6V4Z
	Ay3vGXDDCBYz68FoO/b7u2Y7hbaJt47kmjQLzeyTI1u5YXPndY7jpry6Khmr3F8S4MA==
X-Gm-Gg: ASbGncuBzNIxBxTrggQI0Us7nCMublJBTjumnKLw45SldxO3hg41Jz5i6M7UfdjUJnc
	XLWrFdNkber7lSD8bWFj7/TEKL/sQv6XpWv6nAxGOraNUDR52n754RHHdSVjKNwtcKeTGnAv3R+
	OKYbdXZNRZvZ84HoOnGPb+tcAv/gbkFXZZhvv9Uni8YtPdNfHdzJ0OC7Bc2j3S1QTvhfAWWuQaP
	BRI1kF3kEkiIk3dyNoMI8RlgasiOGzRQFv7oURC0cq3PHmXET1c0yzLlqEpubyzTzKP7Sx5huqa
	QeTkkhTOnzOdIgLZWBPz4wBt1JcJk2ROzmRlP1wjf7EHNB/ijAxX26V1MGh7lKZaUToSwzXr/fU
	XuJ1SEYf6ILyoDzjml4tEt5JmxL9fS2BbNx/f0ka5rwXxCs0=
X-Received: by 2002:a05:6000:4025:b0:3a4:e844:745d with SMTP id ffacd0b85a97d-3a572e6a1e9mr12811277f8f.56.1750234787151;
        Wed, 18 Jun 2025 01:19:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY1tDl74kcAwH1a9FR3dYqibY/bkXjfovH5qw8EmP36klN2OOkd+XZIZxkrXuB5cvDxO4iWA==
X-Received: by 2002:a05:6000:4025:b0:3a4:e844:745d with SMTP id ffacd0b85a97d-3a572e6a1e9mr12811250f8f.56.1750234786808;
        Wed, 18 Jun 2025 01:19:46 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:2400:4052:3b5:fff9:4ed0? (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a72cd3sm16313774f8f.32.2025.06.18.01.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 01:19:46 -0700 (PDT)
Message-ID: <1eceff0f-4df8-4716-8e3c-e2cb9e142511@redhat.com>
Date: Wed, 18 Jun 2025 10:19:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250618041235.1716143-2-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> +	case 'p':
> +		if (fmt[1] == 't' && fmt[2] == 'e') {
> +			pte_t *pte = (pte_t *)ptr;
> +
> +			spec.field_width = 10;
> +			spec.precision = 8;
> +			spec.base = 16;
> +			spec.flags = SPECIAL | SMALL | ZEROPAD;
> +			if (sizeof(pte_t) == sizeof(u64)) {
> +				u64 val = pte_val(*pte);
> +
> +				return number(buf, end, val, spec);
> +			}
> +			WARN_ONCE(1, "Non standard pte_t\n");

What about 32bit with 32bit pte_t?

-- 
Cheers,

David / dhildenb

