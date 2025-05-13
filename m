Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F66A21FF43
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132664; cv=none; b=VeJ4Ks5PMfc2GPyz+p3Pu2jO/xUnptdKbiRQs7NF7/Yvm6SAEm8eO98nMlCpnEVY/ylzYqEYyQX0oh3XRb8+5wbLCcT3X+vMZNBv2cb+xSSaphd0JWyO2EWqm8tzvIymkQytubVQoiVfUnlRZjNdnJdABGID3u+iGDoTqFl0ewg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132664; c=relaxed/simple;
	bh=0+JAfIVe5TbD+BsWH6Y1qq0GakoctBjfNN1l+27aN4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJiSNmdXCR38HK3OUN4Dp2hEJWxOBx+5ln08aHFzVNygKKFMNCGkEtGcyVIPHdz7BpKi1byQ4UaTFPSlL/YSGHbWny5kafk6ZzSNszz9ug+QBdNU4aBTVX9lEK6J3PtJZlkhHrZN1KXS26SohgrE3BFyrfUbXkZrZ4v+X64HtZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZM+ag/Nm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZM+ag/Nm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747132661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/1ycin1YMkPuCF1ATge++M1JYdrKUEG5Nak7RYdhw00=;
	b=ZM+ag/NmtuXmRX+dPL+lGfXOYow2SQaJT8dfMUKmGqfOhVDUH6oKIA9DVSwiUFAf3r5rTc
	njE/N4Z8ZzcTdiOhmQJXhH7AOy5/IihK4ew92K17/WT/HKdIMX8BAWHoY6hSPeZFthePeF
	oLLjkq8FI3has6IKfbD/bHSH5neIWq0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-KJcZUgh2Na-RFTjLrFMcMQ-1; Tue, 13 May 2025 06:37:40 -0400
X-MC-Unique: KJcZUgh2Na-RFTjLrFMcMQ-1
X-Mimecast-MFC-AGG-ID: KJcZUgh2Na-RFTjLrFMcMQ_1747132659
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so24017105e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747132659; x=1747737459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/1ycin1YMkPuCF1ATge++M1JYdrKUEG5Nak7RYdhw00=;
        b=lpyZEk7gQxigMMaUPX/k/xlSpYJurT1CCo9OFzTSzO7nUKVLkGPSXdBKUkkSHg4Xyb
         8itkul106NtI6/Fog+WbHLE0RQtA0RRO42hqQRW8nSm3pgDW5pkd3TCvKFSaojD93dxN
         pTkePImjX9nq8YIKvjTTbY4bUXCL0B6i7EkFti4bkOvgKgjFertRay8FEKg3B8eOCCYp
         CJMIXio/oZMUKccCygRuMtgYfbWldz9iW/bQheQ0zy1b0DzZ95XkyZM8SUTjVO394D9r
         3MDMdSZ0k4skpqYR+VHtcD9DtiFQWUTp1pgt8fT+45DXBGYAp8q6D6GCni+aM6HA6GT1
         yfQA==
X-Gm-Message-State: AOJu0YzYw8206StSYn/aEr9xybLv1L6AGwWprZEpBhhyavRILW9/uy4E
	rWJX9NK3Wj7vDwncBlXAyH5CNnF+F2MivF7oNcHOAPYhSW+iL2Vjsv+xn8BPwi3lhhh5HrEv5mG
	wpQva/N+Il5Ju5NwydHyq4GpFsC//dwratAz6LghTrCk4rqPrjGNS4EEbOdiWug==
X-Gm-Gg: ASbGncs3hCc4w1Vc/dKkyLbu7jhzcvBTXd6scu7EzrTP6eUp2Fu5GM/J8TvQTOchpHw
	GszY0YDO1tusuTATH90x24pUJp7DvM/10wyVCV+MjhFtSsYWA+kPAdGDaGoXDNaISmPRW4yJlbc
	WmtV+5cdoGWyDU1R19ve+L5MDhlfZES36mIxRF/U9y8D4+nC7VCOn8dVrnJoA+gXDTRby53T+nP
	D5H2z/6t7siijzZKwkXnTuEAc9uhW9VHPNPQ99FavxfVu0ZiyYjJ/R9ZUCQdhihFoM7knc1oPQo
	xeBDi5ahog/ovPVsvms=
X-Received: by 2002:a05:600c:3587:b0:43c:f050:fee8 with SMTP id 5b1f17b1804b1-442d6dd1bf8mr109922415e9.20.1747132658790;
        Tue, 13 May 2025 03:37:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpVnwLwL3h3SPRt/DvwKMVIkUz/KDgEEw1efsbBAEpQpKw5oFdKDXUjHqlKxtD7LGNGPpLOw==
X-Received: by 2002:a05:600c:3587:b0:43c:f050:fee8 with SMTP id 5b1f17b1804b1-442d6dd1bf8mr109922275e9.20.1747132658404;
        Tue, 13 May 2025 03:37:38 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cc59:6510::f39? ([2a0d:3341:cc59:6510::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ea45c209sm37449475e9.17.2025.05.13.03.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:37:38 -0700 (PDT)
Message-ID: <2c5581b9-c0a4-4620-ac82-0a98abfd4d0d@redhat.com>
Date: Tue, 13 May 2025 12:37:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] vsock/test: retry send() to avoid occasional
 failure in sigpipe test
To: Stefano Garzarella <sgarzare@redhat.com>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev
References: <20250508142005.135857-1-sgarzare@redhat.com>
 <20250508142005.135857-2-sgarzare@redhat.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250508142005.135857-2-sgarzare@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/25 4:20 PM, Stefano Garzarella wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> 
> When the other peer calls shutdown(SHUT_RD), there is a chance that
> the send() call could occur before the message carrying the close
> information arrives over the transport. In such cases, the send()
> might still succeed. To avoid this race, let's retry the send() call
> a few times, ensuring the test is more reliable.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  tools/testing/vsock/vsock_test.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
> index d0f6d253ac72..7de870dee1cf 100644
> --- a/tools/testing/vsock/vsock_test.c
> +++ b/tools/testing/vsock/vsock_test.c
> @@ -1064,11 +1064,18 @@ static void test_stream_check_sigpipe(int fd)
>  
>  	have_sigpipe = 0;
>  
> -	res = send(fd, "A", 1, 0);
> -	if (res != -1) {
> -		fprintf(stderr, "expected send(2) failure, got %zi\n", res);
> -		exit(EXIT_FAILURE);
> -	}
> +	/* When the other peer calls shutdown(SHUT_RD), there is a chance that
> +	 * the send() call could occur before the message carrying the close
> +	 * information arrives over the transport. In such cases, the send()
> +	 * might still succeed. To avoid this race, let's retry the send() call
> +	 * a few times, ensuring the test is more reliable.
> +	 */
> +	timeout_begin(TIMEOUT);
> +	do {
> +		res = send(fd, "A", 1, 0);
> +		timeout_check("send");
> +	} while (res != -1);

AFAICS the above could spin on send() for up to 10s, I would say
considerably more than 'a few times' ;)

In practice that could cause side effect on the timing of other
concurrent tests (due to one CPU being 100% used for a while).

What if the peer rcvbuf fills-up: will the send fail? That could cause
false-negative.

I *think* it should be better to insert a short sleep in the loop.

/P

