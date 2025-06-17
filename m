Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52FD2222AC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750157322; cv=none; b=hAaJwhaRn5ZYT6xHvRMbCDQij1senXRg4PxSTBV0F6BjoD5fgr3cgxWuc8ZAyqCUL6+g3HmQBdZydnjs31YhO1qPYHmU6EzmZFLxZIeQw2x9WAqa23r1bvL5ql1d3K7GbNyijkXiIiHq6hzYj6wkqYtIXTfPT91Wo3XylQTIUFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750157322; c=relaxed/simple;
	bh=Uv8u54/dC2qUxCCPlrrZoR3WhX/sE1cmjIy197Ir6Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvrED0pq7tmullEf12EDSIohhKgW670bPJwo8O7rNaHvuA9oMf2/UhN498Se6udtxUKjbAUvb83jM7nbgGVnLrm03tb6ei9d+2C/XzvUo7VAcXJj5ehx8NVsqREkzEeYOXQ0lf4P4m1DsiT4yg2b1nirvSOPlB2V12FfuOwSz7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QG4jMwWM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QG4jMwWM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750157319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t2YBkEzjOitxxT/YcZa7j0ioGPzZFcycwy5hGGacFEY=;
	b=QG4jMwWMZhylagqYRaBxTXIzwD9SD/YvrEI0dMMYVT8AQtOCNtJ2nFfIGDhr17EJim7imM
	YOaCJxvX+1YZjNdbJw2k2SG3dLP0suAe9ImjoqcBfbnWn1X1bmojTRb+nDchhNO3LWPL87
	GMzby0vltcXRIFavzmG6DIcVQL06N4Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-d-24CFiOMQeqGqt3qLT1tA-1; Tue, 17 Jun 2025 06:48:38 -0400
X-MC-Unique: d-24CFiOMQeqGqt3qLT1tA-1
X-Mimecast-MFC-AGG-ID: d-24CFiOMQeqGqt3qLT1tA_1750157317
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450eaae2934so45293915e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 03:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750157317; x=1750762117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2YBkEzjOitxxT/YcZa7j0ioGPzZFcycwy5hGGacFEY=;
        b=SDdfujT/kwawwmyjMzvPZaXwyAMeln/RJ/4AlaLGD9v3nP5B3+NsYPsMVctWbWftrL
         58HBQ78iA8EgHJTGwyWTvhm0AYbp3oay1/sdWij/CBdahMhTRPNFDJq0jub5SAciukdQ
         pWx1SR0eFiYEvW8x+xNRPZ9neTTJDAzsAAd6YuBYIInX3rx+dxqhBODODFXURSd9Wu4S
         2vPyxltnznO1VujbXluogDTLNlV6hhr4cdiGsK3EB110yKjS4dC5dD19P3FvR+KlhNEA
         OSCIR4ZBc1rmfofvjMqmFCDln17OJrp/OGKUZfNh3ml/yebliGc9wq4sDhcA5/vjQDk0
         F/DA==
X-Forwarded-Encrypted: i=1; AJvYcCUSZn4XRLzvcKRTGCuI8bFnijHaK7XS+521Ritrwl1IBBkkXDfkjYwrecPZym9S2pqdZ7En72YvV0s+h/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSObLe2YsO5ZufqHCKYUtWQb4mu3eIdqo9zsJ3KdDU6+tJMZgw
	VoAIZMH/5BlQ7M3Kwv1UfbtDZr3mINl3dYDBQpWsoUpCXS1ofeBHii09NAJzwsysJ4/fPZdKLC1
	uXN6b9GI3T6sl54tjwvWQQXAUIUXXZCZh0n+2cimVTRtBMwDBxfFIixKCc+apRbNSJA==
X-Gm-Gg: ASbGncveJgcN6il0lAvrHSLk0n5Wu2bBS438Qc3KX1xlnfqvuLh2VNPsY7VPGfbL6CG
	DP7loKiZ51oFkXXQrEdGMwfxJSehe344WuTRayC3mW6Cn8CmR3aMqBImvQJsHAdVCMwc7BX6j3s
	K0VH/NCtMaM1YQdHW5wIUJl7ScXcCCs3hYKnq6wVHBKGLxAzNW9te73i9RyftqR01sF9z9CuABn
	ckVI2VGyuRb3quAGBvjERm0buH2k7t88YrYx76ppWzZCiv3pllUIA+YlBdJBjIpSZ0EWNfN6lZ5
	NPisNG66QnFtBECdad/eu0tUsLlg/I5k6uJC0BHjtLwmClNzAlwtqdK3cbSa/QugZ7mvCA==
X-Received: by 2002:a05:600c:1ca1:b0:450:d3c6:84d8 with SMTP id 5b1f17b1804b1-4533ca837cdmr118077775e9.14.1750157317122;
        Tue, 17 Jun 2025 03:48:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF64g5YbFrucDdVgEXvbRk3CRluTsbwbsvTzZThEArUCifITIf4s1E3i56aauW0c+Cn+BJWRQ==
X-Received: by 2002:a05:600c:1ca1:b0:450:d3c6:84d8 with SMTP id 5b1f17b1804b1-4533ca837cdmr118077535e9.14.1750157316721;
        Tue, 17 Jun 2025 03:48:36 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2448:cb10:3ac6:72af:52e3:719a? ([2a0d:3344:2448:cb10:3ac6:72af:52e3:719a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2354fbsm169530345e9.15.2025.06.17.03.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 03:48:36 -0700 (PDT)
Message-ID: <54d712a2-31a7-4801-aa65-53746edda117@redhat.com>
Date: Tue, 17 Jun 2025 12:48:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/2] tcp_metrics: use ssthresh value from dst if there
 is no metrics
To: Petr Tesarik <ptesarik@suse.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 "open list:NETWORKING [TCP]" <netdev@vger.kernel.org>
Cc: David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250613102012.724405-1-ptesarik@suse.com>
 <20250613102012.724405-3-ptesarik@suse.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250613102012.724405-3-ptesarik@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/13/25 12:20 PM, Petr Tesarik wrote:
> @@ -537,6 +537,9 @@ void tcp_init_metrics(struct sock *sk)
>  
>  		inet_csk(sk)->icsk_rto = TCP_TIMEOUT_FALLBACK;
>  	}
> +
> +	if (tp->snd_ssthresh > tp->snd_cwnd_clamp)
> +		tp->snd_ssthresh = tp->snd_cwnd_clamp;

I don't think we can do this unconditionally, as other parts of the TCP
stack check explicitly for TCP_INFINITE_SSTHRESH.

/P

