Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B689324166F
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132884; cv=none; b=ahrGCtpjPMki250UBIdcCPipWsz6HS87ZvIqUUY1CvvXpzieLuFYVAFDuJoWJ11tLLqwcWiOE00JsZ0CY6AWOXEaA9e3pBdKh9hAHvzvdfve1WuBAw1ZE6PwQ8+jSfoqBbeSUxQvlrX5oUs9s4wyp+VOADBqlFHUn3e/JIt8QlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132884; c=relaxed/simple;
	bh=CzXbJtVm+kfPx2wU0kxbzltwOiI2Rq/axwGhJhgRpjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/sBHLtHf6Re+pmbfX6kODYMuTXNqqM+SEYhYqo7XpgqyYImHHWxR6p4KIPW3u3Hd/lzo9VC9IDyEXVn1PInIJ/o/vWtEXtAtZooYme0HTnoR7ETgGd8Q9f6vzBw1uNUQ9aQSxUGGw9LgT/NkAr+U/tgSga5ZIRwcPA6AgE4TAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PFgnNLWy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PFgnNLWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747132881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJeKw16z9gukuPHYO36IGk1ktHWHQEMVdMrmzMhOzO8=;
	b=PFgnNLWyssieO4x89SMSobbUJg7XI1qfODespef5o+BCa/1ivi1iRV6EZfoBn3Hfo8Tbji
	Lck6tGU1ZaGwyRNaPmQSBbbd21StQDcOaF529yyAiyvLev+Skw0P+LD545DJB3xTHl/MZf
	F2s1oFSyQ9a+PRDQdyByQBIWn00TzKg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88--y0mEtlJN3qVuTkJmtJdPA-1; Tue, 13 May 2025 06:41:20 -0400
X-MC-Unique: -y0mEtlJN3qVuTkJmtJdPA-1
X-Mimecast-MFC-AGG-ID: -y0mEtlJN3qVuTkJmtJdPA_1747132880
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so32985535e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747132879; x=1747737679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJeKw16z9gukuPHYO36IGk1ktHWHQEMVdMrmzMhOzO8=;
        b=tKRvkDAcQC/PTDjOUSulrsayxNvM2qWxyaHAaIVuHC34DH2pu/V0HzmesxRF6ysMX7
         ysPz/eYGIY42HUGWL4j0sQvQvUyOtGJM1dQpwxGaUbNemo5XeR/34gt3OiJiWhsOriV3
         xPmSVBbgXeX9jTQr1hjoW2zT21n0l6MoX6RLbT3aHJrEUarWYa7wFeUE7dZJXvarItz0
         vBc+c3b0Vl2bNtKmddxJRZnhxuo09ert8seWGR+X6La8cqdiX/SUqmeOKYvt2r/UM666
         ILEgu2iJDmqSsh1DoyzIOIaUOUyoE5IfmswHn8qT2Uik5sRWHsn8YwbsD3fKJgPJUvrk
         1D+w==
X-Gm-Message-State: AOJu0YzuV3RDLCzfWhVC5XX1ZGNc1v0zH4XHuUG1ThYH6U0ZfXU8I+WE
	8QWQU5vA3BupfGCJiO2MRlbGI7Uu02yGA1ybAMR0A5HO9Wu7jKOUBGVlZpDSu2/+jNNi8E7dutE
	XFlq9Nd/s79d+7emF2vVI1HBWvGkv96q/TlbNspnCTPHUGBf+1zrWlydgT6unEFjR/m7xpHu1
X-Gm-Gg: ASbGncthjVY08TuIySa6t99GxkfpiLhbATyzLRjKcBZj4d0TQXVpAxiWuci03gfVFcZ
	nAIcVpi7YoMOp0YFEHiosYMfwNjh4KWlR/b+3QTxTBwSmAfrEUx814tEmBhOmnALfe1ZDkjyD6Q
	SJQu1xGvAIz3IczqhCcywsiF5iIPdC6Cfa2Fd7cL3ZYaVFjky+Gep3mBsK76iMIh/7Y9YzRq6q4
	MCuFF+vPBzBlsZYIYw4aD9T8340J2HIF5l4mPWqT9n0ivRl7QkcLUCGI/kvppIVgnow/uvrNnOP
	/kYXNrcw1djARM3FYeU=
X-Received: by 2002:a05:600c:46c3:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-442d6d0a9f6mr139315925e9.4.1747132879363;
        Tue, 13 May 2025 03:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl4gdyqUK+UhO8XqkYELW23efHSZ7ANt+SKdLL7x2md+luIlfmn/ndhYYAarVKcIiNK0vd+Q==
X-Received: by 2002:a05:600c:46c3:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-442d6d0a9f6mr139315655e9.4.1747132878948;
        Tue, 13 May 2025 03:41:18 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cc59:6510::f39? ([2a0d:3341:cc59:6510::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm15609566f8f.22.2025.05.13.03.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:41:18 -0700 (PDT)
Message-ID: <8d1206d1-1b62-48a4-a304-23e13c1316a3@redhat.com>
Date: Tue, 13 May 2025 12:41:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] vsock/test: check also expected errno on
 sigpipe test
To: Stefano Garzarella <sgarzare@redhat.com>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev
References: <20250508142005.135857-1-sgarzare@redhat.com>
 <20250508142005.135857-3-sgarzare@redhat.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250508142005.135857-3-sgarzare@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/25 4:20 PM, Stefano Garzarella wrote:
> diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
> index 7de870dee1cf..533d9463a297 100644
> --- a/tools/testing/vsock/vsock_test.c
> +++ b/tools/testing/vsock/vsock_test.c
> @@ -1074,9 +1074,13 @@ static void test_stream_check_sigpipe(int fd)
>  	do {
>  		res = send(fd, "A", 1, 0);
>  		timeout_check("send");
> -	} while (res != -1);
> +	} while (res != -1 && errno == EINTR);

I'm low on coffee, but should the above condition be:

		res != -1 || errno == EINTR

instead?

Same thing below.

/P

