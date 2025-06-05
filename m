Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99811C4A20
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749121392; cv=none; b=WYeaGEZ6XHG353lYfU9PyOt+fFJGksHY1tCPHnEGJGZhDTc0wkP8Zkvyh5743Wbn1T3X5Xgr68arx7e/vAg4TAii9VoufRNrlNazdA03d2qmDoLFydpAwksUwFbnqoNzrh+WM31M9aXjVwsbvyuVIANlSIuvGYIHt8utX65+J8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749121392; c=relaxed/simple;
	bh=5iVRkX4FSgcRxi/CvcNtolFKz6k8kFco9qX1fh/s/lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=seYRyTx9kC6HlMBISkmiwEb0X75ACcJkXxv6kY9/AjGykNz8EGZ4wsNm5nVVBr5t+d7izewq0iOlU1jEHo8/eWXXTVdajIfbDVpLAqgbuz/AoaABRR4QuxsJC3av3W4C0RkK/QAfnEpn/beWNEfT/VzH2+RvktymMdlTCSQghHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dzdshbXj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dzdshbXj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749121388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/iNd4rCLMH3G4cLnw5oDzeODmTZrxz5jMOWbyZxDPY=;
	b=dzdshbXjt3sGQGV3Lf+qmca1TrfhZVrz1M5HIttP52QM99WVdY1ECP+bBoDbMcjGSYZA0R
	C3AGLFxUiYxJ2NNd+XN8n8aIrCrZnvhvBctAaO68Q/87Zr6p73/SKQkLVhwKttenhuKyQb
	WZvxfnaM7fcrYLwJxUKlpM4OGTbhyHw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-W7lq1EafMlmoRRv7FlC15A-1; Thu, 05 Jun 2025 07:03:07 -0400
X-MC-Unique: W7lq1EafMlmoRRv7FlC15A-1
X-Mimecast-MFC-AGG-ID: W7lq1EafMlmoRRv7FlC15A_1749121386
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a52cb5684dso202359f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 04:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749121386; x=1749726186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/iNd4rCLMH3G4cLnw5oDzeODmTZrxz5jMOWbyZxDPY=;
        b=Y2JskQGNpLNi7JH16vLqb2kBud2fiAPC9z/0GZijSAcQ7rQB4k376/+6su0v4jok9+
         936pExOKPBlCPVWqpwRgcZ+omTMf7OT8dhT3Xc1Z2H6CeAX6sio3jP1F6yZLqXN0jA7i
         UYQ9JQ81txT4huF8jz3t0sDC02QykNZ5kabixs+L7FP8a4Z3s44MMiefhC4CHeEQ34BL
         SJXczYlhIDuhmZa3Rqd2BvbrHvtFy4e1vTSJm7ms3jS3SLxD3mJ4tdGma59BIXxjwIGL
         AINiDsdE14KfQVbqXODvWvIMbK9ZpjPUH5HZVGTvuSyVu6Zk42WK1uVsgB0CMFh8XTNP
         Uc8A==
X-Forwarded-Encrypted: i=1; AJvYcCXAk/y89GTgdor9JktykhT3PjQSQOXeuK+QvKSz+fAZp32uQMr8nQk+fQCs1nAvfAaTQ2VyxPb9wtmCG5k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0iQrIR//txPbw3N3D9rILsvmYkZJzSLlEplciIFnieTUWOTvk
	7HLQCbEvtznjClH+K5sE5P+kWRZBQPFI0rXcYtl9N23VgioB56bws8PLM/D4BQMQkysRk7waWtY
	UIF0IxymVlcSyGvSJk+vEnQb2UNmPNFA5GB14rK+JX5zgaiIj3ftFLTePaZrWqw+zHw==
X-Gm-Gg: ASbGncu7WjZHiNMO14+v5CJYPJtzzhiuMmD79UiulRJh/x8gaUNfmmbsR87sFw2tWuQ
	scoPAX+GDVZXCXhT/YEgZOKOGEEIC8oh/MehYpc4LbqD3cZM0HC1iE/7aOmIvpRvAGFEraIT43Y
	krOVT35pxhFPRzz01VLugi3H9zIICJNSbZRWnEjFRdqCz2OXRwIPhK6KIcHVhTdhLcWi23UvYQZ
	cy9l+Pcr+MqhqXcZtab3cdMAukoZoMuxW09B3m1Z4XxAENip/jwfxcu/tiYRWpC9pMgOgOi7iyX
	KBHUQBY/nGE/iEy1FCQ=
X-Received: by 2002:a05:6000:4387:b0:3a5:2949:6c24 with SMTP id ffacd0b85a97d-3a529496f56mr1757622f8f.51.1749121384703;
        Thu, 05 Jun 2025 04:03:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdGUXYZXrNIrCyhAh0tp1ScDeHW0FOJjHuHj6Po7K6huTF1gR9wGCaSTi+dFD3HnrC0pmIFw==
X-Received: by 2002:a05:6000:4387:b0:3a5:2949:6c24 with SMTP id ffacd0b85a97d-3a529496f56mr1757543f8f.51.1749121383960;
        Thu, 05 Jun 2025 04:03:03 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cced:ed10::f39? ([2a0d:3341:cced:ed10::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20995275e9.23.2025.06.05.04.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 04:03:03 -0700 (PDT)
Message-ID: <dd087fdf-5d6c-4015-bed3-29760002f859@redhat.com>
Date: Thu, 5 Jun 2025 13:03:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] virtio-net: drop the multi-buffer XDP packet in
 zerocopy
To: Bui Quang Minh <minhquangbui99@gmail.com>, netdev@vger.kernel.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, stable@vger.kernel.org
References: <20250603150613.83802-1-minhquangbui99@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250603150613.83802-1-minhquangbui99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/25 5:06 PM, Bui Quang Minh wrote:
> In virtio-net, we have not yet supported multi-buffer XDP packet in
> zerocopy mode when there is a binding XDP program. However, in that
> case, when receiving multi-buffer XDP packet, we skip the XDP program
> and return XDP_PASS. As a result, the packet is passed to normal network
> stack which is an incorrect behavior. 

Why? AFAICS the multi-buffer mode depends on features negotiation, which
is not controlled by the VM user.

Let's suppose the user wants to attach an XDP program to do some per
packet stats accounting. That suddenly would cause drop packets
depending on conditions not controlled by the (guest) user. It looks
wrong to me.

XDP_ABORTED looks like a better choice.

/P

