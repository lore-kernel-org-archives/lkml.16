Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA20211A3D
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127533; cv=none; b=To58/E4AFH4UsZlKHDfKvqJDEucCGZpmhrLndqoD74tSU8j6R45HwIszkxoc7bRUbWgnUv6/8T2jv0ZCywP4bAEQkDDGW8tl9mkCqvjmUS/xgwZxDJ3fPhpbA6K6x5Lsu7DW3zvo8MdUUN/It3kgaRvFvkgMC4e7K7EBP/25naI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127533; c=relaxed/simple;
	bh=WDlpFsWbDcfzZLGnp/d3QNExJHb0unwOgNVXbvwod6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQLXpS7EYJbNoWVYFLhavMD+7f3tQ9gJSUpgU640drIy/DBYq+OL2AVvhsgeVUQJ6g56wetuSHryu4f4u5FV/c4PFtosrkYxeZ91xzdSEE1PgUJAxaIp2AOCvMdNc/dsGa7f1jK2q3KNoUGo7a+m3RoKiHMxJzb2ZMLMN59n2IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CACUYGAj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CACUYGAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747127531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSKXGvXgaIuXifWFUaLvMDff9Ik6twAKIvR+Y496sQE=;
	b=CACUYGAjsm56aOJwv6UP3RGQM2dzjQ896IV1q1FoIdH1qXZEiZiFqZgbtWDAzIbsNo6lGp
	TajrgtCE+ZyKdzUmVwWMVA4JzWokwTFOKNf4R/IAA5wd9FHrRG6LmmDkz/B3hsWJafUY6a
	hYAGkAN7e7HLHb1rS8bQfpftAUK7yoc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-w89IxfyzMoydtReI_xCJVw-1; Tue, 13 May 2025 05:12:09 -0400
X-MC-Unique: w89IxfyzMoydtReI_xCJVw-1
X-Mimecast-MFC-AGG-ID: w89IxfyzMoydtReI_xCJVw_1747127528
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-442cdf07ad9so22222745e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127527; x=1747732327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSKXGvXgaIuXifWFUaLvMDff9Ik6twAKIvR+Y496sQE=;
        b=m1jDEZqSu2Uxrw3ShccwOhFm+U/m5+HN19TM1kFIzep5dPyBIc/s7cuXr/R+wyahyf
         CGFgiwBtN5xf1+HhTpv/pzOUqGGjVNRJ2muBTP/PmSHsN0+E4OJ1QpM6v1wjqLkUAlCw
         XC/5mWQr4M/snZ3laddAD+CaNuDyNrpPaNyUvRRXyw3L215TIoN/88NQbOn3/MH5YwSY
         vRYAJg68Xe04prbldUqHV+aISzcP6K2KzldwtGw7AiwNKiayxzI4TMSy8Q5JSoMmVnBo
         jY8GRAmWGNE91k5Ye8GgoXRWuoS8SoV1j128QYTOCRU0cHK6xtnmE5XLXz0e2JofC+ud
         1E+g==
X-Forwarded-Encrypted: i=1; AJvYcCUf0t0epVUxDOOH+xNdXHpvCv3BqOPzDCmz8lzBZCstCO0bkW3RQeM/DYFhfxMnMBfXj+UUCfkmyVxbXnA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+3NficveiKlTGLvzyGR+9IqNuCgm6+5UdotGZgjrxFT+3+TVT
	mYGQEQSmoZRywc+XmD+eYe5pANy/xWyO5hBKuQ3oZelwngEc1WVztIs6R7oYGXlhXKweleMTHUa
	f97sP9DFi73qR82RH0SouYdZLCqxvzszMgTEyqtN6nONA1RCCDvUuysVfhNXuzg==
X-Gm-Gg: ASbGncvN7QCHWPc3cBPpPiKeRd3UB92XayxBgXXo2ZPEHla/5WVLmRxO5jer06MV65K
	hqHzdAV2SkQzfWR+ETDvW1/awhNMhKEK7/eNGyvyBwD6B6PwYlXvneRsDnqw4lR46Uxwj6IrDYn
	9HanA5RlUrvfdUkw4OibbUGjdbRPKiqPGmwBqw0E2vLYBL86qytXd7j9x/A1h/uoFUk1xwpWPL1
	iOmgXiRf1GXTPEJa1Wv/iyEkFBNQYgkYMD2I9SJJezpUNKlSXmSRgkCK30ZDw+CxIJNekwcTGE6
	mXlrLMznHyrLQhSSZWQ=
X-Received: by 2002:a05:600c:4454:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-442d6d44aa7mr175599765e9.10.1747127527659;
        Tue, 13 May 2025 02:12:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7UByCIdv1fV6GeTCbxFUgA3MTskc+HSiE9ez+aliKyTiJ4Fv/7gBQk/cE3vpwwsDlBoiWaw==
X-Received: by 2002:a05:600c:4454:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-442d6d44aa7mr175599485e9.10.1747127527311;
        Tue, 13 May 2025 02:12:07 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cc59:6510::f39? ([2a0d:3341:cc59:6510::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ea367102sm36670345e9.3.2025.05.13.02.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 02:12:06 -0700 (PDT)
Message-ID: <085a78fc-acfc-4a86-9dbf-18795ad68b4c@redhat.com>
Date: Tue, 13 May 2025 11:12:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 4/9] net: devmem: Implement TX path
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 io-uring@vger.kernel.org, virtualization@lists.linux.dev,
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn
 <willemb@google.com>, Jens Axboe <axboe@kernel.dk>,
 Pavel Begunkov <asml.silence@gmail.com>, David Ahern <dsahern@kernel.org>,
 Neal Cardwell <ncardwell@google.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>,
 sdf@fomichev.me, dw@davidwei.uk, Jamal Hadi Salim <jhs@mojatatu.com>,
 Victor Nogueira <victor@mojatatu.com>, Pedro Tammela
 <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>
References: <20250508004830.4100853-1-almasrymina@google.com>
 <20250508004830.4100853-5-almasrymina@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250508004830.4100853-5-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/25 2:48 AM, Mina Almasry wrote:
> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> index 86c427f166367..0ae265d39184e 100644
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@ -1059,6 +1059,7 @@ int tcp_sendmsg_fastopen(struct sock *sk, struct msghdr *msg, int *copied,
>  
>  int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
>  {
> +	struct net_devmem_dmabuf_binding *binding = NULL;
>  	struct tcp_sock *tp = tcp_sk(sk);
>  	struct ubuf_info *uarg = NULL;
>  	struct sk_buff *skb;
> @@ -1066,11 +1067,23 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
>  	int flags, err, copied = 0;
>  	int mss_now = 0, size_goal, copied_syn = 0;
>  	int process_backlog = 0;
> +	bool sockc_valid = true;
>  	int zc = 0;
>  	long timeo;
>  
>  	flags = msg->msg_flags;
>  
> +	sockc = (struct sockcm_cookie){ .tsflags = READ_ONCE(sk->sk_tsflags) };
> +	if (msg->msg_controllen) {
> +		err = sock_cmsg_send(sk, msg, &sockc);
> +		if (unlikely(err))
> +			/* Don't return error until MSG_FASTOPEN has been
> +			 * processed; that may succeed even if the cmsg is
> +			 * invalid.
> +			 */
> +			sockc_valid = false;

It occurred to me a bit too late that this chunk of code could be
cleaned-up a bit using a 'sockc_err' variable to store the
sock_cmsg_send() return code instead of the 'sockc_valid' bool. It
should avoid a conditional here and in the later error check.

(just to mention a possible follow-up! no need to repost!)

Thanks,

Paolo

