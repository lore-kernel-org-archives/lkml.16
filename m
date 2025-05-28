Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EC8228C8D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748413480; cv=none; b=JKFkcWL/YM3uDSWCiNB4JlH4UQi2p6QPrL0wz9gjZLWYrWAtVEfGp4JRV3ZWYvDfV6+Cyrb7gsN+ae/WGt/F4UHlzhclLXlkJ5f/9/HTe4gv+DQ0L2P7QOccaYmIkHeAd7n5wbZROBDp+nHlNGSsl+f8sddQaHYYyIEa+55Xlaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748413480; c=relaxed/simple;
	bh=kTVvThaepVpjwYf+NroDpxcy/+LSdRi3RXkZGjHWijU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djk49R1LrvPV5NcDx5OJho6EbMudnqWVpyQjbEHq3wVlc4sXZ3Scx+JEOk+EyBMr4LSHgnhVoSaPXOEmHCo8lnQGEjMH789dNl65T3sRXra2/uZSkwP6vACE7i5dFJAW1ycuPb1yVxYOGe4qBbEfM2I+nheBh3oRr2Lk0S9QADE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hmuwslO4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hmuwslO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748413477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=754vc2wjDI7HXePVLvdpk2rAWv3hYor0wtSkoWf1dhE=;
	b=hmuwslO4a9x3F2dgw0eA35ahYmukZzd5RPbbRwQncZaAYflfFhmmi7OCUJ8PkdjNm0LclT
	AKUQ8JwmlaBiWlCDONdVWERM6G7CR+9nZEcf+QZ9kgQdRc8p3JVJEeL5FrF8AgVH+OEIio
	DLdhBzhz6PpsfjO3DPawAaM9XZiKLoQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359--l_xsyrbMV6SytR5-mnt8A-1; Wed, 28 May 2025 02:24:35 -0400
X-MC-Unique: -l_xsyrbMV6SytR5-mnt8A-1
X-Mimecast-MFC-AGG-ID: -l_xsyrbMV6SytR5-mnt8A_1748413475
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so25697095e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 23:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748413475; x=1749018275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=754vc2wjDI7HXePVLvdpk2rAWv3hYor0wtSkoWf1dhE=;
        b=l9rrfZIR3KT1ic0iQbLB+M4syvyUsJIXObfMbkfR3LMUsJAn7vTVnYYBrcZe3bnfQr
         mdM4g/4PxR9GwJgr/mDZ/ViEDRn+3iWdV2mf6bz0S5jxZf2St84ZqzQlNlKf817EoIFc
         VdTvcJRM7DIwqUMFImvaxGlHyhApNd0NTZYngynw0ajo5padh8dzakZPmamiKW+RMSvL
         BY5m9gnKavBF5wW1YQkh0gKyziLeOsEIhxu7+uF8SqwRLdKV/f10FthSOzIssJTpa+jd
         C+dk1wqId/E3FodhJEaJRHe1YgiYQJFz7dAdDc7NmcpXNPJDliS78j+ogTP8Zy6nfeNp
         AlCw==
X-Forwarded-Encrypted: i=1; AJvYcCV9aY+dj+ZNp5mJU6DTHTJoJXS/7/sBwLzQ9u4gLvKXQIUxlQMkO+gp+AhsktunKZRARErUyfIuyDkwDnE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/DCouP4OTG8aTkeaERWgcyhSwmUtjGVf3nluM0UW+H1Uyi6iU
	5i025/4jFBYjLdHrop2EdkVtVmnS9RiFRz1PH2qgcjnS9NoZhEP/0B8bTHYprvJx4slugDipImL
	d7CX4S5OhAWGMtS0x5lnj/OCnM1GupUAD+AtNeKF2MTfzYb6kecAq0s5+Cr32ONGBfA==
X-Gm-Gg: ASbGncvGGDXA0f66UPHFYLYv2oi2Bl2dy6U0zvZdvM92wdoNqsAwmi7Tjj90d1Ew0JQ
	NBUUUx2rpV09xvOF8gjNpraiwvqDEZEv5Cw9aryLMKnTYChbkM7Avbi+MMd3NLmVOvp9zkxivmR
	+8I+H64z7qzxvOw6C4gNFYcvsfoC5SK6VeaR8W3aKb+/5aoSehwbeC6aFcgUoKyihzWrfyjZEGP
	I59RPwvXZ8Q/qDb7dkU0angS4Y9SGqDQSoe6jmHgkkdY1w7hnXKbyB4KJf46DS+ZG4s/vxgKFxt
	b3Hl8lkgWmFLkKBkbmgoNUovaCktDz6ImmbO4rQebhUnaBYGkt5cEfxech8=
X-Received: by 2002:a05:600c:5395:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-44c90a7d192mr145123935e9.0.1748413474625;
        Tue, 27 May 2025 23:24:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTGyxwzn4y7CuSci4QeX+QzVGzuRFKJU+ecJ07NbBvlyTkZlPDD/iB7UoMAp4+3o8jBBb6bw==
X-Received: by 2002:a05:600c:5395:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-44c90a7d192mr145123695e9.0.1748413474243;
        Tue, 27 May 2025 23:24:34 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2728:e810:827d:a191:aa5f:ba2f? ([2a0d:3344:2728:e810:827d:a191:aa5f:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4507254b82esm7053935e9.9.2025.05.27.23.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 23:24:33 -0700 (PDT)
Message-ID: <7974cae6-d4d9-41cc-bc71-ffbc9ce6e593@redhat.com>
Date: Wed, 28 May 2025 08:24:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] virtio: Fixes for TX ring sizing and resize error
 reporting
To: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: netdev@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, linux-kernel@vger.kernel.org
References: <20250521092236.661410-1-lvivier@redhat.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250521092236.661410-1-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/25 11:22 AM, Laurent Vivier wrote:
> This patch series contains two fixes and a cleanup for the virtio subsystem.
> 
> The first patch fixes an error reporting bug in virtio_ring's
> virtqueue_resize() function. Previously, errors from internal resize
> helpers could be masked if the subsequent re-enabling of the virtqueue
> succeeded. This patch restores the correct error propagation, ensuring that
> callers of virtqueue_resize() are properly informed of underlying resize
> failures.
> 
> The second patch does a cleanup of the use of '2+MAX_SKB_FRAGS'
> 
> The third patch addresses a reliability issue in virtio_net where the TX
> ring size could be configured too small, potentially leading to
> persistently stopped queues and degraded performance. It enforces a
> minimum TX ring size to ensure there's always enough space for at least one
> maximally-fragmented packet plus an additional slot.

@Michael: it's not clear to me if you prefer take this series via your
tree or if it should go via net. Please LMK, thanks!

Paolo

