Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C876122D7B0
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 10:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748947855; cv=none; b=e38uv0+LdqXdy+SffhnRUMxOhoplv8yCCidEMAEOELRBVqBEiNr1KyGCJ9wsjWtOjtZLo9fwgelAxv3pNNcXTtsmz3wk6CTS+OYs9pSPMYGD59+t0mf04NRAPV4UK/1bL2NtSIrtDjzmwPm7jYFIg0lPsEhoFUH1+Jd6F9TgxhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748947855; c=relaxed/simple;
	bh=pP732qkBtLWc1YarRschcEvEOBGT5QCpzr6OZsyMpXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XlQT3SIvtW2cyKeaOp7u8bkYz8xXROtrBlBZPc0LDSWf78jDeSMDWeOzDsO8ciswPyd1T/puwEmHwlqYrAlyhPYEc2Yk3ZG/MijG9aSxnEpi3NySyw2KlFU+u6DfXYuzIOo9sK2sj8ym4jEUtHm6vsRrZZN8KZVDiw1i+Usp5OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WfMDLrC9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WfMDLrC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748947852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n0+40Yg0Yos7RVqiMwJQqOocRWrul7ar29oZFeXB2SU=;
	b=WfMDLrC9Qs6S04He4s/U50A7bOnHn75xMNjWAWOS0YJrpR8ENd8IlKGlUvJLCA93pYRD5F
	sVLQnGA5gdm/YZOKfKAZjprvDJgv7BeIL+2mP8sLIBzEoeg5Tk6RC8tJvCNMdphKVhc17/
	IubJ6atTGqUwQpwBoQfoaCl6FDs2imI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-7jtv0d05PqesevrDoOldlQ-1; Tue, 03 Jun 2025 06:50:51 -0400
X-MC-Unique: 7jtv0d05PqesevrDoOldlQ-1
X-Mimecast-MFC-AGG-ID: 7jtv0d05PqesevrDoOldlQ_1748947850
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451e24dfe1dso9089135e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 03:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748947850; x=1749552650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n0+40Yg0Yos7RVqiMwJQqOocRWrul7ar29oZFeXB2SU=;
        b=NfNeE1vb3TqPRUfif6v+uR3TNxS9DZkNxM+Nswc03kPsQ/W6lEg7OF9WzaMO/04beC
         ypdNy/B3rGBVlxcAN+alceuUoQCz7y8rdNZPR7nLHQYs4I03ukmjUDXi2Nsv1hr95qhj
         YKCVFa82prIH6itm5uA6gyByGYzQV2IwEGoHe38JyVe9ZGKdvJXMdpQ/e5tgvntLa5xQ
         lQ1EjFbale4VrI+xwtejQ3TKv5uxAV41Q8uJm6NBPVBTyni7wmMAW/deTbZe4zwr/bte
         fhaksaF6RI8qxN2fABXBnLQirwsk22QGIfjb0hq0WD48GqMqyz1akE3T7uWkt0z26Kb7
         Ha2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsS099cHF/8CzVU9gnpHwjQqDu9BdQK21r+gRXQKRaspDpZ+MUDKkOGpumGHvAVv+lWmDgggBCUKJi7XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1lPxo8VhxFBacPquO8l86mxMb9Ttu1APu4KHIMtTrs6Ia6Xjd
	JvXr9wZbfShV/GCLUpKTNTXv6OuYWPrpU0xqrfcF4m0qPd4Y+su2RMgTl4meikwhRji0GhfHNtD
	+xvdpqYlcTqEMtkBB8cOvyUAqbBwOox6KgeMqRQ3mGtBO0a4+AOCOvjKA19HA0LyFSg==
X-Gm-Gg: ASbGncvlBr+dMZRsdwBFUnEblkztTedT/3c7K1RLSKArew7h/fdvLN9jZIVZA8Ac2JK
	orwuXWpLOULwse6cfJ+s3mLJ066Rlr+ALe6/41C90o5jeW4r5fTSy6nZno9DbWPvHt9gmcykTrF
	YrJ+rYdTb+Yh2ptn6LFb08SqFMFcuKHgHsC0KREL3UfEQ56hihkckS+JgqhQcHIdOXrUuiKT322
	Js7OGJsUTpCtIY17U/Vcg+pPMRoT/XSN7+AQvUZU/NOBrZ4FguKxrKKl4abIQ701tQY9bBmjR2/
	Dd8iVDCQU/FaRxGNMnqfzJafIqJipqZkYM72gUX2bE+XNFrdeQvESyLj
X-Received: by 2002:a05:600c:3b10:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-450d885e485mr167351785e9.17.1748947850294;
        Tue, 03 Jun 2025 03:50:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtGECdKa1RWIrVSs41cY4rfCiCynHGO3J9EwYlEtBcnGInHb9ONotRvfoR7OrR5T/NIAl9cQ==
X-Received: by 2002:a05:600c:3b10:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-450d885e485mr167351265e9.17.1748947849868;
        Tue, 03 Jun 2025 03:50:49 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cc2d:3210:4b21:7487:446:42ea? ([2a0d:3341:cc2d:3210:4b21:7487:446:42ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d80065e0sm163577265e9.29.2025.06.03.03.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 03:50:49 -0700 (PDT)
Message-ID: <b8d181e9-d818-4cf4-b470-a54b6df763a4@redhat.com>
Date: Tue, 3 Jun 2025 12:50:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gve: add missing NULL check for
 gve_alloc_pending_packet() in TX DQO
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, Bailey Forrest <bcf@google.com>,
 Eric Dumazet <edumazet@google.com>
Cc: Mina Almasry <almasrymina@google.com>, joshwash@google.com,
 willemb@google.com, pkaligineedi@google.com, kuba@kernel.org,
 jeroendb@google.com, hramamurthy@google.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 darren.kenny@oracle.com
References: <20250601193428.3388418-1-alok.a.tiwari@oracle.com>
 <CAHS8izOqWWdsEheAFSwOtzPM98ZudP7gKZMECWUhcU1NCLnwHA@mail.gmail.com>
 <cc05cbf5-0b59-4442-9585-9658d67f9059@oracle.com>
 <bf4f1e06-f692-43bf-9261-30585a1427d7@oracle.com>
 <CANn89iJS9UNvotxXx7f920-OnxLnJ2CjWSUtvaioOMqGKNJdRg@mail.gmail.com>
 <CANH7hM5O7aq=bMybUqgMf5MxgAZm29RvCTO_oSOfAn1efZnKhg@mail.gmail.com>
 <abb065ab-1923-4154-8b79-f47a86a3d30e@oracle.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <abb065ab-1923-4154-8b79-f47a86a3d30e@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/25 11:03 AM, ALOK TIWARI wrote:
> On 03-06-2025 00:54, Bailey Forrest wrote:
>> I think this patch isn't needed. gve_tx_add_skb_dqo() is only called
>> after checking gve_maybe_stop_tx_dqo(), which checks that
>> gve_alloc_pending_packet() will not return NULL.
> 
> Thank you for the clarification,
> 
> Even so, I felt it could be a bit misleading for developers and tools. 
> But if you believe the patch isn't required,I completely understand.
> In that case, I kindly request you to provide your NACK on the [PATCH 
> net v2] mail thread for formal tracking,
> so that other developers can also be aware of the reasoning and 
> understand the context.

IMHO it's indeed confusing that the same condition is checked in
gve_alloc_pending_packet() and ignored by gve_tx_add_skb_dqo().

Even gve_alloc_pending_packet() is only called after the
gve_maybe_stop_tx_dqo().

Either always ignore the NULL condition it in both places (possibly with
a comment) or always check it.

/P

