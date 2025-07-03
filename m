Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A0B2D6614
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534754; cv=none; b=pHQ83gy3/DwOVSKBvi+ZrQEDFpUyDrvUpmxcPECx8Ymz7HA8aqfb+2K0WgdHGQ85WwiW2zWCfrSizsdT+6Sufup7zgyjigEvd6foBS9gan+ejKIS/bnJkwKH8/9sNBR6lmbdfJ24PEiSlNSGQJgAv4KFitpAzIq7TYU5lV9/bK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534754; c=relaxed/simple;
	bh=STzWJep7C0ueCylwebeqomoBi53CDoyHXyyg3q6vros=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KNcaVXR83qbY2I8ozjH9rKvNAqFcNCIu9Tz8dwxgngZckeuE4kMG7U9SYR/xhBkykY2vKya1u8CN/4NMOnW8V/UKKkKe1qcKmWenhhhnu94fBgO3VnQ/Ba0+FGMInxMFC2PkF6IL/l7yEVwnK/DflWQfRcW6wViQ0NtGAfR/Gk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aIPgo60Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aIPgo60Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751534752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NmUFP/5otJp7Yva7rirEL2lRiqI/PxhyfiBWQUHadCI=;
	b=aIPgo60Yx1rUEP7wrBc57yg3ki75N3xHe+5dmEIYGa71+TANiHnUPsLEHt7NZaHd0mFs2I
	86pJTwveZex9LQ06bSikcYQk1Ntz9QhNwccIW+nhnrGxqG2+p7NVbUbSRnvl1EtGQ+YZBk
	FgpR9P1A78Er4D60dLYXf6sgOKgl6JU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-fw6LsnVBOvaf6pReASmZbg-1; Thu, 03 Jul 2025 05:25:50 -0400
X-MC-Unique: fw6LsnVBOvaf6pReASmZbg-1
X-Mimecast-MFC-AGG-ID: fw6LsnVBOvaf6pReASmZbg_1751534749
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d30992bcso34618475e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751534749; x=1752139549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NmUFP/5otJp7Yva7rirEL2lRiqI/PxhyfiBWQUHadCI=;
        b=bcfFpGLiajcVy8IQot9JoW4hI3sKjtqV9uHeUu4uSUiLGqzaU21C84t+21YHp/+bGj
         7XfX4/lDR5KYFIhETdlOmMBbSwFv5wrq+3sMVXnEYA3xkcb259gMvL3wj8AF4aJIU7Wg
         pvEb9OA4IURurPhGTJpfQmHZZHqU5PUe9jz79vMmdgtIY7QzHu+xRRt1Lz06pHk1nftM
         KE+E32Un36DQO7QVbNz+ZyyDhJpSerTYSr8JIqvWpcptVtjYoFOAdJvoIrscQZluO50p
         AeRJ6cObCh8LngmrMGwWcUxqmnQ5/ACwnb/acGuq6XgtFpkzOYB8nU3rQNiWucp50wat
         f5lg==
X-Forwarded-Encrypted: i=1; AJvYcCXTfLrwkJex8gWgVZUqD8ofLjdPdUMvyQImCogc7vihE4FXJM30o7snqG7BN5AP8ggvgpm8w4Whchq8tb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE+J8ytBu7cpToZ48glKzxxpfZZOyPOIrzpONE03StmhSw1SF6
	T5cjzMlpahpgvL/Nj4HIuom7gwM9UcTfnqloWCs4Kxl4FFH/eTzowHGhQ8GaHfvMcvh1auQkW5S
	ld6hyQdbXexhXgDfx/vPBJVCoHm+nAhdEGQRqJTsZoy7/DypNs03i9aGhdjQ1hDfcTw==
X-Gm-Gg: ASbGncvKyUYMMCt9vhtLTcY1tg2xWF9uA8mq9iPBKEVBu148HchHx3gRJkBXBeErD8D
	GmE9Pc/eaXa74pIDRF9xcfvBGvfngq8jYCpBsukKaZ6/XadnZqxr6S8TFky5gja2/SlQqQLZV1n
	hEZqGHC0woU59V0eqt9oy773uBFPZN5ZTGnZdUR1QcKx5iUZGMIcdRYjlD+vhhmcuktAEH2+7fA
	GdOnjzlKM/Jg+45Spr5pOr8QSSGyeGUCD9r6bL3RYxlGSlbbntGqnIMUp+NdYMiHT/4bDP8ylzL
	OH1y7pcZzUfFC8uUcg4J7LccNyc3neSuz/tAJdy/8WDFrHEwyRIDMP7nJz/XSBYOEUM=
X-Received: by 2002:a05:600c:608a:b0:453:8f6:6383 with SMTP id 5b1f17b1804b1-454a36e996cmr71174355e9.15.1751534749315;
        Thu, 03 Jul 2025 02:25:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEihb3DB580vG3swYDdikiInjReCzKhZiPBvQTN0giVHizEK3OOIkuH4ihxHrIuTcVlib7I/A==
X-Received: by 2002:a05:600c:608a:b0:453:8f6:6383 with SMTP id 5b1f17b1804b1-454a36e996cmr71173955e9.15.1751534748907;
        Thu, 03 Jul 2025 02:25:48 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314? ([2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9969058sm21577325e9.3.2025.07.03.02.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 02:25:48 -0700 (PDT)
Message-ID: <869be9b5-846a-478a-b90f-5e9068387601@redhat.com>
Date: Thu, 3 Jul 2025 11:25:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/2] virtio-net: xsk: rx: move the xdp->data
 adjustment to buf_to_xdp()
To: Jason Wang <jasowang@redhat.com>,
 Bui Quang Minh <minhquangbui99@gmail.com>
Cc: netdev@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org
References: <20250630151315.86722-1-minhquangbui99@gmail.com>
 <20250630151315.86722-3-minhquangbui99@gmail.com>
 <CACGkMEtv+v3JozrNLvOYapE6uyYuaxpDn88PeMH1X4LcuSQfjw@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEtv+v3JozrNLvOYapE6uyYuaxpDn88PeMH1X4LcuSQfjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/1/25 4:23 AM, Jason Wang wrote:
> On Mon, Jun 30, 2025 at 11:13 PM Bui Quang Minh
> <minhquangbui99@gmail.com> wrote:
>>
>> This commit does not do any functional changes. It moves xdp->data
>> adjustment for buffer other than first buffer to buf_to_xdp() helper so
>> that the xdp_buff adjustment does not scatter over different functions.
> 
> So I think this should go for net-next not net.

Please, re-submit this patch only for net-next after that the first one
will land there.

Thanks,

Paolo

