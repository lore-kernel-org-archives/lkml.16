Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC2B17741
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751012530; cv=none; b=TaM/IvRsLjOBaK0HE6zcTUm4gaX3JfU2+q72QCPTmmOu7ov9AcW3fIwBCqlS/49YxZxNb7/m/g1pMq3puiJAQ+MQY51qVqGmLMF2zfw9zp2l7xTxyJWR5kmOzj6IMKCe2En13SkCBJbiTEyaZWq/UGM1BPGGQAHX1YyRACEuhQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751012530; c=relaxed/simple;
	bh=7L7gnA+PMqOvFzB9aOAb6Z3I8wPBf+AMV/Vnk3gf7KU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3FlHW5k5krbOn3y0y4LLwvkrD1DVJiY4s3z9kiLJlz9XUdHy6p9v/3E5Fh6QqK8GBJuiUHD5titSm83KoydceOp+AFEnOtgF5urA6bG6NNPztirsyia3sb3YUv+qTE71q0/BjUIhSZyohKyIwuzufEgsjadNTC+6BjlcE4qyZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MudI3ybf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MudI3ybf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751012528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zdhaPmsWFArhsXFsISpX5ZipUl19a5SM0RfIr3emwGI=;
	b=MudI3ybf3p4McbsDctHqXeaIJ08OchAbiBrufYnX9pFVH0rzQ8YLUVwDNrbWNeXH4fJnxj
	UO/XUTUIxBhtZ58TnvDEbRlwm9qcWQ2WX1W0Tlqta05Khm69iL5o8x8IDmBS00SOQkDd/m
	/RQnpYAyksEQNpGFbBOQBRqwtEDm01E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-_NPqL7NhPzy1lXTEnemzpw-1; Fri, 27 Jun 2025 04:22:05 -0400
X-MC-Unique: _NPqL7NhPzy1lXTEnemzpw-1
X-Mimecast-MFC-AGG-ID: _NPqL7NhPzy1lXTEnemzpw_1751012524
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a56b3dee17so1470308f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751012524; x=1751617324;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zdhaPmsWFArhsXFsISpX5ZipUl19a5SM0RfIr3emwGI=;
        b=KYTEIBsH81dNEhmrh6WKPJJv+gXaF4J9dqLpiEn8cxoxblc2fgFz2uP68Ylf3nHH24
         Um3G4ooEuTBBMcExZtKA3aMmk/UfXwauMq490ilOsDZt3yhG5U4rHZiT7bKLHsYI3pWT
         a0DdQWPNAkqWSS+2G9njeUMm3mCSNzorfegJj1aqt/II8UW12Io2jvNsJW9wXNynqFJt
         fQN5QPMiHV4/tZDSmyFYMAu0wVBHOCdhnZlGOOI7mXh4tKmajE2hWIvXC+tMgNGBjju8
         qJyryiX0MrUBu4t6uMeXhxSjcAkfciVEM6ZhZ0IWR1uyFpxyXk/UKAENmwrovKiWpFqy
         Mwrg==
X-Forwarded-Encrypted: i=1; AJvYcCVtvsXAK684osefLewvZzZ0vgfS2V6n9hxEmNaEvSNlYAD6yp622Ol5xyRZMoa1GnYOee8OHUGTaaWSXLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUXavtxdfqjvzZ747Pg7B9B9Pe/INEhCreAgj4OAaRb0S5FGDg
	RpiEZtyTbeiGQarIzK5m34tjyx3BeI6/cW6aIUAa3OsrGHgz8Q6swpVol2WxYb81o2rIa/xD0OV
	EsOkX6xJw+4OWEvfhEiJMqQ0AgX84dVRvgQ6Ph24T5g93EDpbHx41yPJGYhHBcfqC
X-Gm-Gg: ASbGncsSP/cP7ZuHaFiFP/VQmi0+6Eds+RhB2PxGSASLohYabp7/DiCuKVHt2wV4XUR
	OTZtoH3W/wbd2P6oyebtLwHGDtxVHJ9lP07MWl/UtpHVW4Y2PgvQ4iUqFjdcYFydJPsdqmsy9Wp
	8FOR88GsXwE66NRcch13mFz7YfUWysjBOrJ64j3abZyW7e8nSrJTfwpDzSmSH7i/FjMXWqoP9qI
	qDzijY/0qxxWXaK9EMa6YTy00k2N/iVdlf40OYwxgVwNUCxOHLK2EB2u5Wl0FelpTc6Xev5k6ET
	Kec0gieFwuoVSml9OzB9Jl6w+EHzvOGiV0Z5vo0hu1XuIrxeRV4=
X-Received: by 2002:adf:9cc9:0:b0:3a5:271e:c684 with SMTP id ffacd0b85a97d-3a6f3153609mr4583316f8f.24.1751012523788;
        Fri, 27 Jun 2025 01:22:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE6kxl77BfW2oseBFkSC1JtOT5bepuvfPux+euP6AbKgN4iSeaZr6ihXIz7XSCpkAgQOS7Lw==
X-Received: by 2002:adf:9cc9:0:b0:3a5:271e:c684 with SMTP id ffacd0b85a97d-3a6f3153609mr4583297f8f.24.1751012523368;
        Fri, 27 Jun 2025 01:22:03 -0700 (PDT)
Received: from [192.168.1.108] (ip73.213-181-144.pegonet.sk. [213.181.144.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52b9esm2024043f8f.61.2025.06.27.01.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 01:22:02 -0700 (PDT)
Message-ID: <bdca5369-57dd-4db4-82db-a2622d26c550@redhat.com>
Date: Fri, 27 Jun 2025 10:22:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the bpf-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>
Cc: bpf <bpf@vger.kernel.org>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250627174759.3a435f86@canb.auug.org.au>
From: Viktor Malik <vmalik@redhat.com>
Content-Language: en-US
In-Reply-To: <20250627174759.3a435f86@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/27/25 09:47, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the bpf-next tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> kernel/bpf/helpers.c:3465: warning: expecting prototype for bpf_strlen(). Prototype was for bpf_strnlen() instead
> kernel/bpf/helpers.c:3557: warning: expecting prototype for strcspn(). Prototype was for bpf_strcspn() instead
> 
> Introduced by commit
> 
>   e91370550f1f ("bpf: Add kfuncs for read-only string operations")

Oh, good catch, thanks for the report.

Just sent a fix to bpf-next [1].

Viktor

[1]
https://lore.kernel.org/bpf/20250627082001.237606-1-vmalik@redhat.com/T/#u

