Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2CC1F7904
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751266303; cv=none; b=IkZ9WfAqJZXpPGta2jeWluaKnEwOrciZ1xd4sD9eiQfQRsgoIcsMdPnTDRg1CXIFv/L65LPEOp2Kxi2DfkW4PCXOkge6NfXiw+ZCib3FZRd1z4ZU061WHFYph36ecpKqb57dsgjdVm0Xh4kQgOUsMFezIsWb7x8Xm9RdyRBqlXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751266303; c=relaxed/simple;
	bh=1j/BOe6+uj6Rz+5EFQPn/l2EbhGasamVZqKuVWNilXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HN8GOGc7y7UTUmx+0GG5qp4Oo0jBTDnAbq2k6ijuDaYKbOQX9xavFFAApOBgkrgAb2jNieqpF/aM6pd1WzdCbC3ihBv3SzXf3Oml6XkYaOf65hTC4iNkw+A/fdDERulvppnqsUPCOdcja3TrQvWAZV5VNuszFtzHWV10stJmsus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XL12VkNx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XL12VkNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751266301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=14L4bSmzMK+Na24jtHZlikcuCB46GClv+lCWBOsYn3k=;
	b=XL12VkNxRj85syYOQHSpKb9ocN7rCtq1D0rKSh1cOaBoMY14rglkWKs/CqfMeSAb0pa7sJ
	njGphRe9YeCXsq2JKXXNBhilGNedRMq210b4SkjkCpKbd5muDeZZmC6Pj/yFxq/rXRXu5N
	8EE75N8vzmzBPZIVSAkYYGDJUY9HnOM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-dHvYnZqjMLWfZNR8JWTLtA-1; Mon, 30 Jun 2025 02:51:39 -0400
X-MC-Unique: dHvYnZqjMLWfZNR8JWTLtA-1
X-Mimecast-MFC-AGG-ID: dHvYnZqjMLWfZNR8JWTLtA_1751266298
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d244bfabso14367865e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 23:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751266298; x=1751871098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=14L4bSmzMK+Na24jtHZlikcuCB46GClv+lCWBOsYn3k=;
        b=Xy5707Xje4N5fPRVRQlLfBSMKjkCM82nB6PO2ENb3hiNl7R/xeL31Q986bXr0xbTV+
         zT2wUiq8vYekjPmtEvplRo2znYInmXS1gBztDXuZo+mfWw5sZ5DFBkYxFu4vASEBnQXS
         yyvTRd26coF7QEPq6ULAdhA9KAAC+MCI63x+bBrRnm3RQzf6V/8IU9xz+fiExqwtPl3O
         XfHP4UJlcUrt5PP7eRFhysySgd6hFw3NPH+GnXQ2IeP+ZVd5u2KWwE1xrkupTWflOUms
         9xR54jBCF4voDNTkLdqfIDllE6YoOM1nZuZ9nLMyS/PXsJ/Du/c8tZG3QGgK0oCCRMne
         vT8w==
X-Forwarded-Encrypted: i=1; AJvYcCWgRqOAAQvN+NsYbHvdhBIPwz2m4ubE94Q8clXaYLjIYNG4p+PWK1P1Cf1Qj4RN3M7SOz5WWsnJM1ryJPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTw2fbHMcBaxWHG2ZCok6FCqIrYu/TYeNjIZrLHdmMF4onCsQl
	XtAWwZ0mX11OqROxNfjAShzIzKRcg5DZi7UHnoCdkPrcNEqe6c/oQRAYZ950KUrSZpL24NDaFx8
	FbjpPWw+O3POQS7qjNtKxWXo3zbljCXrZa2iecj3sG+B3OUJR4EHnDQAFPmu47tGDQA==
X-Gm-Gg: ASbGncuwgu+dokiqWG8+L4ODjmpiOVqKamcH++xzTGywVPo42db+uNPigzyyXBEwQ41
	LuFmPXadbS98sAmZLfh3+hySGdIbREiPJ9ajnbo90daobktOoL7l7/ORBmxjcY26yx0JgBTxrj0
	SJLJJb+jYrNYIlXD2HMOSiry7OKZDtO5rWrMCkfwOS97xDQuND8hN23mjq6O8phbtLTm1XDThuL
	pcdLAL6Y0YRVoK8XRlT+O64iPmOh3scIGBRZ8+5lzg3wx1ZHjGFPL9ACA2E+sl0RUHQiqtsi3R/
	9peZlQOCOhO59Ad7591qqScpy9sR7vNTbbKrtVXWZdNfQv7ya2j9o4QKR3Z/S+QgvUUyvw==
X-Received: by 2002:a05:600c:3e8e:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-4538ee5ce0cmr113844435e9.8.1751266298034;
        Sun, 29 Jun 2025 23:51:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8OzcnlTDoCi5GaakFcUjFo98VZ0Lu6zkZMiLKUwkNiF4+gQI+xZELrNOEu2y/m9jGEUvL0Q==
X-Received: by 2002:a05:600c:3e8e:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-4538ee5ce0cmr113844085e9.8.1751266297611;
        Sun, 29 Jun 2025 23:51:37 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:247b:5810:4909:7796:7ec9:5af2? ([2a0d:3344:247b:5810:4909:7796:7ec9:5af2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3aba76e40c0sm5286272f8f.59.2025.06.29.23.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 23:51:37 -0700 (PDT)
Message-ID: <83640113-ae18-4d5a-945a-44eef600d42e@redhat.com>
Date: Mon, 30 Jun 2025 08:51:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: syztest
To: Arnaud Lecomte <contact@arnaud-lcm.com>,
 syzbot+827ae2bfb3a3529333e9@syzkaller.appspotmail.com
Cc: agordeev@linux.ibm.com, alibuda@linux.alibaba.com, davem@davemloft.net,
 edumazet@google.com, guwen@linux.alibaba.com, horms@kernel.org,
 jaka@linux.ibm.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 tonylu@linux.alibaba.com, wenjia@linux.ibm.com
References: <67eaf9b8.050a0220.3c3d88.004a.GAE@google.com>
 <20250629132933.33599-1-contact@arnaud-lcm.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250629132933.33599-1-contact@arnaud-lcm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/29/25 3:29 PM, Arnaud Lecomte wrote:
> #syz test
> 
> --- a/net/smc/af_smc.c
> +++ b/net/smc/af_smc.c
> @@ -123,11 +123,14 @@ static struct sock *smc_tcp_syn_recv_sock(const struct sock *sk,
>  					  struct request_sock *req_unhash,
>  					  bool *own_req)
>  {
> +        read_lock_bh(&((struct sock *)sk)->sk_callback_lock);
>  	struct smc_sock *smc;
>  	struct sock *child;
> -
>  	smc = smc_clcsock_user_data(sk);
>  
> +	if (!smc)
> +		goto drop;
> +
>  	if (READ_ONCE(sk->sk_ack_backlog) + atomic_read(&smc->queued_smc_hs) >
>  				sk->sk_max_ack_backlog)
>  		goto drop;
> @@ -148,9 +151,11 @@ static struct sock *smc_tcp_syn_recv_sock(const struct sock *sk,
>  		if (inet_csk(child)->icsk_af_ops == inet_csk(sk)->icsk_af_ops)
>  			inet_csk(child)->icsk_af_ops = smc->ori_af_ops;
>  	}
> +	read_unlock_bh(&((struct sock *)sk)->sk_callback_lock);
>  	return child;
>  
>  drop:
> +	read_unlock_bh(&((struct sock *)sk)->sk_callback_lock);
>  	dst_release(dst);
>  	tcp_listendrop(sk);
>  	return NULL;
> @@ -2613,7 +2618,7 @@ int smc_listen(struct socket *sock, int backlog)
>  	int rc;
>  
>  	smc = smc_sk(sk);
> -	lock_sock(sk);
> +	lock_sock(sock->sk);
>  
>  	rc = -EINVAL;
>  	if ((sk->sk_state != SMC_INIT && sk->sk_state != SMC_LISTEN) ||

Please stop cc-ing netdev and other kernel ML with this tests. You
should keep just the syzkaller related MLs and a very restricted list of
individuals (i.e. no maintainers).

Thanks,

Paolo

