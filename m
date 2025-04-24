Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1F922424C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745492594; cv=none; b=BRuPeWNLBRftQ/tgv74cNRgbJSaVbs/tWdyZdfIExk0EFIlCBxhvkd5aGPEkMnjFZOn4PnVdxuDx58QxI9TZ0QnPrYsTJCVP5SdsISC79rENUVdZUgyI4SEFxZWtS678k9LiQCNN9ypBKW+jtoBXB6mtmB392AJy1tTEZTJnHzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745492594; c=relaxed/simple;
	bh=OnEK4+ktkuTBVd4LCgvO2/u1sSZlYN0t7X50RZpIPls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGj7SJ/AOjcU0rJxSc9IaZhwXGz69UedsWoNcuRlb93uvso3T6fv7AhYC4fxjqTBvZ+6ZePj2ER8s9vS63JhkqA9jAIgdiwkoOIFmnj/d3cxsbeHEFW++4Abfd2u1IddzBdazUMRB0S0pdl3F7uGSTz8s9YiA+o3DP5YjaBmm6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XqK3M/FA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XqK3M/FA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745492592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OB+hDp/hkN/T5Zk53qLd2kwTdWBUeriKnar6WFmgAY8=;
	b=XqK3M/FA19y+Zafg23+eyMEbbOPPf/yzrtpEFMRVYFu2O+1twQksdUjOxrI8VItvxIYtOV
	coXDSOyQR4uxH/GC6DjxuNZJeWzTeH6U8IIbx1sa8uH81buSCiqRU3v+Pgg5NW6WzrtptX
	BtD7hw66i9AisuLtsdz70ylvql3mof0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-q4h8GpbDMA2DYSjLTzZohw-1; Thu, 24 Apr 2025 07:03:10 -0400
X-MC-Unique: q4h8GpbDMA2DYSjLTzZohw-1
X-Mimecast-MFC-AGG-ID: q4h8GpbDMA2DYSjLTzZohw_1745492589
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so5423125e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745492589; x=1746097389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OB+hDp/hkN/T5Zk53qLd2kwTdWBUeriKnar6WFmgAY8=;
        b=ObrLa+4Db0FC5lOJsaWuPr8/6psBj2bi2aF6CpSQukhJN8N6mN3Gr/9nxcfnRGZyro
         JoVBFqOT9BjIKiAepQARaObzP28mnuFpIQpAZUa6r7Yd2JDaYiSuKz/sjH11J4iz/jP5
         OSeMxO+8EyYrshoHzq8lcr3SZoCF1zAAZbrO58r+TEuXMZ7dubcYIcpXPtqPeDQdo4qZ
         KPKNUAjeNEYNjkWPjt6rYdtQMNFvUyvAvqFVymF8BJpRZHRhkjvbh7TWHjPArAImRVdP
         Ikkqi6kTJu/lCGy5CC4dhJXqVO45dtIy38ojWcRA+uDaNGIT8DTuiXqvKWZ0s0rTrGvQ
         a7pg==
X-Forwarded-Encrypted: i=1; AJvYcCVUsR/9ZPVgzazQSO2z+KCd1DZmLGPZoqFNl9fAEiYS7ogZMhfBqvNvL5DF093H9ov8kJ2vo6XR/3gtsF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuwIhBOBBgqchNhkZDmlTJ9JIEYYmG4miTN3JXqCdBB7OkK8Ci
	PTkfSf3hzU/UH1tYf21UcOY1wHuKnn3IVz89icS01DYyKXI0vfQ3KheoPO9HCM5AKX6uv5I9Ye2
	v1Wj/maUYfbESJI6ifSy2tHOT0tD8nzbzitYeuI7dBmL24tNiVHQwrtC+SJRxvQ==
X-Gm-Gg: ASbGncvWRZ5isB+PF/qq6YOIHG2H36HBBVx53UBHfFw68kn2own4KjmFHumTKEl+eI6
	eZfeC7XtfycQxvM2PNupUCbbFiRh2ffkCBkTbyspAMrgTXZXr7pqqNYUXMzG+t4pue0G5x/M39w
	NBNFNTQx9/Hd3Awfky1fqwZCSQxVXHgTURWJim/xkF60e1lmZXfaaWlngpPQ2QWLBoIgysSk2TH
	LZIRYLEW6qsooU4tMmBaNSitkvTZR7EdELDOw+rGhQrfeMoSZTTdlfw/Hbj3rVFWyc3SxjFdPEV
	gqwnrw==
X-Received: by 2002:a05:600c:3516:b0:43d:1840:a13f with SMTP id 5b1f17b1804b1-4409bda6055mr16048905e9.25.1745492589464;
        Thu, 24 Apr 2025 04:03:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtu0yCr7M7AP7EC3ZZSx9xsMrsn304Zj6V6BYFUjfak8chlhsmlR6+Poqw3gaQbMFvkrartg==
X-Received: by 2002:a05:600c:3516:b0:43d:1840:a13f with SMTP id 5b1f17b1804b1-4409bda6055mr16048345e9.25.1745492588928;
        Thu, 24 Apr 2025 04:03:08 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d839711sm57806515e9.0.2025.04.24.04.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:03:08 -0700 (PDT)
Date: Thu, 24 Apr 2025 07:03:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: virtualization@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	"David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v5 0/3] virtio-net: disable delayed refill when pausing rx
Message-ID: <20250424070300-mutt-send-email-mst@kernel.org>
References: <20250424104716.40453-1-minhquangbui99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424104716.40453-1-minhquangbui99@gmail.com>

On Thu, Apr 24, 2025 at 05:47:13PM +0700, Bui Quang Minh wrote:
> Hi everyone,
> 
> This only includes the selftest for virtio-net deadlock bug. The fix
> commit has been applied already.
> 
> Link: https://lore.kernel.org/virtualization/174537302875.2111809.8543884098526067319.git-patchwork-notify@kernel.org/T/

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> Version 5 changes:
> - Refactor the selftest
> 
> Version 4 changes:
> - Add force zerocopy mode to xdp_helper
> - Make virtio_net selftest use force zerocopy mode
> - Move virtio_net selftest to drivers/net/hw
> 
> Version 3 changes:
> - Patch 1: refactor to avoid code duplication
> 
> Version 2 changes:
> - Add selftest for deadlock scenario
> 
> Thanks,
> Quang Minh.
> 
> Bui Quang Minh (3):
>   selftests: net: move xdp_helper to net/lib
>   selftests: net: add flag to force zerocopy mode in xdp_helper
>   selftests: net: add a virtio_net deadlock selftest
> 
>  tools/testing/selftests/drivers/net/Makefile  |  2 -
>  .../testing/selftests/drivers/net/hw/Makefile |  1 +
>  .../selftests/drivers/net/hw/xsk_reconfig.py  | 68 +++++++++++++++++++
>  tools/testing/selftests/drivers/net/queues.py |  4 +-
>  tools/testing/selftests/net/lib/.gitignore    |  1 +
>  tools/testing/selftests/net/lib/Makefile      |  1 +
>  .../{drivers/net => net/lib}/xdp_helper.c     | 19 +++++-
>  7 files changed, 90 insertions(+), 6 deletions(-)
>  create mode 100755 tools/testing/selftests/drivers/net/hw/xsk_reconfig.py
>  rename tools/testing/selftests/{drivers/net => net/lib}/xdp_helper.c (90%)
> 
> -- 
> 2.43.0

