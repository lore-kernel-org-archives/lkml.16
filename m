Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AB8A32
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748275303; cv=none; b=lvVFimDkZl1UpW+dsT5AqApFJv4xG7s0QtAXbId2R9ECoU7OQ/U2MvQYd7WYMzIMmz5+xQFfsAQ9um91/JWI2xw/9tAwu7Z1ROJkOjRL3uvjr6fclEy5Y4ONMwgr9b2JQStUrNTD6hSy37MchYNzuYbXc2Wlpi8/ryA6DRlRo1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748275303; c=relaxed/simple;
	bh=FTqaI7t8RxcXrVZU9VUNxiCBtuV0no5S+yCRZG/CB3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtRwBNVLZavCCT9fiA7uU1mm9RpES6e0KXzbw18bHZyMeDpOS7IvCLxsfNuXnWklQqLy+JFJZgpgIGQy++IUd3iUmOWq+zoS/F/Oq7rQyVaJ4rbYZyS5lzZLxQ+gBF92iuE5RLT7NpMpAD+aHHQGfztTirPHTRHnZ16FngKDPoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MCxvVceT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MCxvVceT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748275301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WT8Ho/edJj/b07n6d4X1kH3ehVgioTniu78IFWGtIt8=;
	b=MCxvVceTxItb/1iyvqqP3kdHVuDx+q5JHEOUTRSU9Zp+3+R6Szta573mG3Mypvlj+/9e1w
	nYyGDo0eLHZuazTv5be7IUy62M3pPm5dFUQ+8zYWvrvkWNgcM/BeuwTSvJNNOLLUNxif2o
	9MnR2Ix3gXw0gKRQuqMxKYmuJRcVYW0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-Y83yq1dYN0W8jMNXqshHcA-1; Mon, 26 May 2025 12:01:39 -0400
X-MC-Unique: Y83yq1dYN0W8jMNXqshHcA-1
X-Mimecast-MFC-AGG-ID: Y83yq1dYN0W8jMNXqshHcA_1748275298
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442ffaa7dbeso17839765e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748275298; x=1748880098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WT8Ho/edJj/b07n6d4X1kH3ehVgioTniu78IFWGtIt8=;
        b=wvVSX5//Vr3/d/ACBkfMBb7zYY9K0P/yMB7QwOH3ReUgPm59D1GUu6SVGCKELC2LX5
         9LBnT9sXTEDJrAcuWdc6a9XkGvLtCWjG5Btn90Iu5SpAxqFzpb2c+XBu+1OvCLhk+fEu
         it7KzleS8Vjy/uHR/VdH07AFpJfJiMLVYxint/pA8GoQo+/7LnVHEARhTO8JsWu/lLS/
         xfPHo6V/cfbX0UL9yNjMMZvxDnMV0vDntHzqpXRm+T/HH1OP35Ypfz8OFYGpFT1MXsi/
         BidGc6NThl0/6EfHS3c0xQwmo1gVH6rTnI8XHO1UmNn0W/ZombJyUUwg/4BzhhWxB5vY
         R/Cw==
X-Gm-Message-State: AOJu0YzTKGlApycLPD09c8SZGcSw7o4K3LWCSL58a2TgZLi9DLOk1uGu
	NfTvNQbEOAcdh1Y84QwAp3ZiYwbU0tnpWV8T/6Yw6YAVXjHB8SeLLfc+0sAMgFXpusbFbA/Mjjh
	rKONWdgMxfheWmEiTTG8TaNCZmgTfNR56KcJe2lxzK6dIJR4h7N1AQfIqgGpsvO51WA==
X-Gm-Gg: ASbGncuIvktqYzYs/oWQVS7JJecQSjc8j20MmShKgfqtqq/lWm2DR4xgu8xpfoH5wyf
	DzZhsHwDZvgkJIgl2oaDC2PJKDWvGoAouI6uXvUyrNyzX/y/x3bjayOivA6In2MIoEmdn2BLG9d
	Y6ANSYOL1063KB70cxI4x/CakdAaXrakZfR5iJi0DRslUwBiq6XJz5xeS56xLlWW770nqgMHPfE
	U44xRBv6GywYNX3zpEUhx6WRDU9eesjr8/oi7jDq2T8pv4PdqeJV5Re4Jelry0VwDiMzChVC50B
	x6IxUgVkuXEDVZBTE68=
X-Received: by 2002:a05:600c:1c27:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-44c92f21e2amr65777585e9.20.1748275298232;
        Mon, 26 May 2025 09:01:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+50k3T5CMDiIgdqAVfAROx0cJKvW/edB5JJA880McrxNIY+zCPmgbCIcKfpwxoGKBgbrzcg==
X-Received: by 2002:a05:600c:1c27:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-44c92f21e2amr65777155e9.20.1748275297711;
        Mon, 26 May 2025 09:01:37 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2728:e810::f39? ([2a0d:3344:2728:e810::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm236658915e9.27.2025.05.26.09.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 09:01:37 -0700 (PDT)
Message-ID: <18051f57-37c7-4994-8859-d0c41ef6fb7d@redhat.com>
Date: Mon, 26 May 2025 18:01:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] selftests: nettest: Fix typo in log and error
 messages for clarity
To: Alok Tiwari <alok.a.tiwari@oracle.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, darren.kenny@oracle.com
References: <20250526151636.1485230-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250526151636.1485230-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/26/25 5:16 PM, Alok Tiwari wrote:
> This patch corrects several logging and error message typos in nettest.c:
> - Corrects function name in log messages "setsockopt" -> "getsockopt".
> - Closes missing parentheses in "setsockopt(IPV6_FREEBIND)".
> - Replaces misleading error text ("Invalid port") with the correct
>   description ("Invalid prefix length").
> - remove Redundant wording like "status from status" and clarifies
>   context in IPC error messages.
> 
> These changes improve readability and aid in debugging test output.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
> Resending: Previous email used incorrect address for David S. Miller

You should have waited the 24h grace period before resending:

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/maintainer-netdev.rst#L15

---
## Form letter - net-next-closed

The merge window for v6.16 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations. We are
currently accepting bug fixes only.

Please repost when net-next reopens after June 8th.

RFC patches sent for review only are obviously welcome at any time.


