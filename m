Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AED420012B
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748498752; cv=none; b=pWZuMZRZnAzohKstgzX7RcaOYR5sX97F9XqMmMpMHeJB2Y3GH7ZsjPUa7eR0SoeEJEJtGn9HaC+PdwbfgAeweCILWkJC4dm4u8a2MpxFtyTCD4NcCYsJwYgVj3iDRFixLWamPDT4/sUO569gDF3sxIdfN2YqBopTDq7Zg87ZQZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748498752; c=relaxed/simple;
	bh=no1aqbbZyBCpfeXzJTYYTAIz/S0TB+7xts0vma9pIFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFhL8PAWdiWOajVtPjKBRWERBwdKazNac1z3yh0emati5GF2tj6N7yi8WRa1mGSMP7eCq3r0evVEhZJT+WbuU5eYyYB54W6FtkDmJICy5+izv4q5ULBUa8YT2PxaMc1XntcGxoaJw6jTJHcxdIiGVNAvN6FRt5UKuGxCxuhnMm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T1reMGJ7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T1reMGJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748498749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=no1aqbbZyBCpfeXzJTYYTAIz/S0TB+7xts0vma9pIFc=;
	b=T1reMGJ7ncAcE97l+c7wGeJTE8jJwL7IQyQUU+qHWi9hZEYkviZX/gAL4xIPaAt36jap1f
	u5Vp/v8aB+3nLc/0HXslHYDvMv3BqEwsLf28BQWbGJ2KcWj/acv4GEggMwEMgelMzdJsRe
	e8MqaODv5DHN9PV/RygTzuG26qtMAv8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-AMNI5_n2NN-lEtsL9C8yxQ-1; Thu, 29 May 2025 02:05:47 -0400
X-MC-Unique: AMNI5_n2NN-lEtsL9C8yxQ-1
X-Mimecast-MFC-AGG-ID: AMNI5_n2NN-lEtsL9C8yxQ_1748498746
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311b0ec138eso543353a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748498746; x=1749103546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=no1aqbbZyBCpfeXzJTYYTAIz/S0TB+7xts0vma9pIFc=;
        b=OGgXHhEbTjBQns3omP5xCkx6l4RJFrw2hxQw1XWtQACjACVQAbwc46ThxLHe1SXSYE
         Z8oLcz11BPOFvmJCP65OpoP7SOajupCLxCzTrzPjr9GOmcf0FYzYnRaRSk3FvbH9Ntjz
         ibkJSAihP/eeGYM80ikCBeSnsC7ZEtYQ0prwpbOBbECj20oqqPpJUTcZnwVF60uiwOUB
         odwbmcHwXDhzpu236QWuZIvOg4NPvI0JrpRb1ZL5B+Bbt4yzHB29JUiKEWypisqvg2cC
         D5yT48zbt9OU1jTIFywDknowA3PgrB08yJVZQEZl3eNNIMBPRBJKJGCi5PEU6jmerv5W
         yT2g==
X-Forwarded-Encrypted: i=1; AJvYcCU2KHds5yShEOxB8QzA1QdRjVGo1FT3LsHxIajghGSGzcqpPvkuJWuDBQc7hq8g6upgwULqWkAEF2mWzkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS/q7HH9TKU7NBme4kxhG8/b8W9HZLFORRBoWAlpELp6h+Gy/w
	lYLN6wAIRSZ82EwywpCDKAv1MTq4rJIAUofCANi9Fcs4/3QxDPwTfoAhGfayghH90CsiTR/GbUa
	Vw4dRKWW/dd9q7HSm7WkTgtyO2mr7VWwxqweZby8cVa3yHfUWdiyO9WkO/uLTRdaz9qtJJT12az
	p08b07Kac0cEIokGQy3Oy9KxHlus++ccmyFlEzRvKr
X-Gm-Gg: ASbGncukZ6sz8c4FyJbkPPFKwc8tZJbsvDyewbnmJqljPEB4+8ZyKllQKhdf2N69eqi
	B+FhWRmg3s9oFMoIRpv70wMf88W7OY/EMaXr26Hhactkm8TNjMzumOXwiptXHa+n6Ia7vbA==
X-Received: by 2002:a17:90b:1b4b:b0:311:d670:a10e with SMTP id 98e67ed59e1d1-311e741d857mr8403828a91.18.1748498746006;
        Wed, 28 May 2025 23:05:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhKm7vTdAWm+ZVfYsKZk4PLZyQfaAbTNQNUVYnzDB+/vla96NEa/sHqud4vlifM7NPP/JX6vV0pVkRrsEa74w=
X-Received: by 2002:a17:90b:1b4b:b0:311:d670:a10e with SMTP id
 98e67ed59e1d1-311e741d857mr8403795a91.18.1748498745614; Wed, 28 May 2025
 23:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3e56c6f74002987e22f364d883cbad177cd9ad9c.1747827066.git.viresh.kumar@linaro.org>
In-Reply-To: <3e56c6f74002987e22f364d883cbad177cd9ad9c.1747827066.git.viresh.kumar@linaro.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 29 May 2025 14:05:34 +0800
X-Gm-Features: AX0GCFvm7_KOQ3_CSX-l22USsRFufClSk2dV8c7bgpa8kJcsAcwAfJSzihrbHw0
Message-ID: <CACGkMEsfgGU99_NC3NTYgyH89=6eADKPFiChVW0kZkfF1Js7NA@mail.gmail.com>
Subject: Re: [PATCH] virtio-mmio: Remove virtqueue list from mmio device
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Bill Mills <bill.mills@linaro.org>, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 7:34=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> The MMIO transport implementation creates a list of virtqueues for a
> virtio device, while the same is already available in the struct
> virtio_device.
>
> Don't create a duplicate list, and use the other one instead.
>
> While at it, fix the virtio_device_for_each_vq() macro to accept an
> argument like "&vm_dev->vdev" (which currently fails to build).
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

Btw, virtio-vdpa may need the same optimization.

Thanks

