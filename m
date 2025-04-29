Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D461E204C07
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937292; cv=none; b=YkTdo0buC5NTWvSU8L9I51/6p6l4ztP1FKdaf29SsF9fdvYMgmDUTW8TS06+z/LA2P/H+g4Vyz9pVdpMTAOJJiWYZJHlnnoRxbMzd463mItj0wSRyRDAhtwyhA8aQ5llqlCj/NGoLfPEkvlkZ8juwP922d3sR79IYAjp8i+5NtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937292; c=relaxed/simple;
	bh=YdB7dBR3mSJ9UcQ4R3swc/maH0yTg2jV4PcEQ24xDQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B7Itei38oiEaZXy7JaoRLeCGgNRYqFc52U92QAE7SbM5caNY8q6L1MWyEEDGdbvgwAlHGnwWEGnMOPhujyLPAW23JmfxLd4dmq621aQ29r8opUHiGqS53EyR2jNtmlW0OU8E9iUkeHd82iPulBJOWUfvdwfJskJT5cn0oVN1pZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=etcDz7JQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="etcDz7JQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745937289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fBCQ7yC4DZE+Brh4t/wNH1fz7LCB0Tusx2dGusJqi60=;
	b=etcDz7JQcxASr818JR3UxlOVWGDJ5Dwa7nCFieb8vSXCEfeM2jRhhPmOns88ybs2BCogHD
	ObFEtS8/9/AFzURh9NUl/xgvItpVOn8jS9FYTT+RSTU16Hq+VlZngSpG4Ik245Y/pHXzjf
	I7vfvParOOWaKZT6Scd+Vm6+4iDW+U8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-_XssBuS_PlqSd8d2n3FJPw-1; Tue, 29 Apr 2025 10:34:47 -0400
X-MC-Unique: _XssBuS_PlqSd8d2n3FJPw-1
X-Mimecast-MFC-AGG-ID: _XssBuS_PlqSd8d2n3FJPw_1745937286
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-440667e7f92so30181435e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937286; x=1746542086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBCQ7yC4DZE+Brh4t/wNH1fz7LCB0Tusx2dGusJqi60=;
        b=LSoHLq6ggZigCKbN1PWkB+ew1QdC+0zZ8VZFIxqXdku9ZCyuOXSMOHlCykkzeSv5ws
         Md67s5a0VOz3H0FegR+tlMuM8QXsTlC9qK/WlsatHsBlpDLfkBQrDoWZFTv2ga6RCArV
         dCWOPjPJ2xAer+PPYzGLr5Rqkv/X9BT4FkKfUFkjzWZ1RlWiDRQ81hDLJISNMr+Zcuor
         ZPLtN7jOYDn1sdMy3vGD4IAq4QVwJ/2oI5ahsOvp4rvPWbCSs5Jei/Biw+QfEs+BQcsY
         tjoASrxttRqPZgxh5EzVGw8vg3DIKiGMXf6Us+JK4Ae4xpnxeq/X5nct+T21D2baCZoi
         UGXg==
X-Forwarded-Encrypted: i=1; AJvYcCUlaJtcGPhmIcckD+zMMLCfGPKDfb29+8ZhaJy3QJ6wg+rfuRNHgcGb70spEwJvUb7X5WwIB2PGxeAEI+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8OXJFfFlEPzM4s7MIxik9qOrLLY43neSsG7b4Pi/14cgj86V9
	FX6wPKFPpHlcGyR38UkKHIYsRWTQvG7XIzbMIDDv46pBrvJLPd/XDd7NSLnthqxLE9MIoNMdH8X
	/tv96BR9NkX4LX3Wkntgdxz2++uz/CLBVffzMyA8jjksIjS4FVwLVl1sctDNSxg==
X-Gm-Gg: ASbGnct01BZ5yCwVeZXsIbw3YTCi4ftMYhSZlAlOwrGSpS2klrSq7fy7IocXG/x59V7
	82FWRawiF+YAJcajVO79ZYM+o8nggtd4XBJyLM68JERiRY39pxPISx3uGkWJrASSE0myWKsMppZ
	w9MK/QKRPfaFqBkoV766Jz3vvFY7Z2wESLy6FnKXTsjEqbyOO5OqRDv/TpPzv9uJglrF9GA3feV
	QOCU08tBLDLqLHIO+8o28EopLWt67MS+Z6Kn0Xj/rrXnfoKjGrCkoRsVdi7k2qpJv9Ei2meN2/l
	5i3nbnXF0cbbPYylbAc=
X-Received: by 2002:a05:600c:1e0e:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-441ac88acb9mr28922565e9.25.1745937286070;
        Tue, 29 Apr 2025 07:34:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzFC7JTH1cCKfCoD0KtL/PJnk0rLhxxGRVYh+6Vv8ZU7rmNtMiOe/2tPKSMhGhjoS8cjz9Pw==
X-Received: by 2002:a05:600c:1e0e:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-441ac88acb9mr28922245e9.25.1745937285632;
        Tue, 29 Apr 2025 07:34:45 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2726:1910::f39? ([2a0d:3344:2726:1910::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a0692a22sm177630795e9.2.2025.04.29.07.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 07:34:45 -0700 (PDT)
Message-ID: <06953a63-7309-40d4-b515-ffc56e751559@redhat.com>
Date: Tue, 29 Apr 2025 16:34:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: call inet_twsk_put() on TIMEWAIT sockets It is
 possible for a pointer of type struct inet_timewait_sock to be returned from
 the functions __inet_lookup_established() and __inet6_lookup_established().
 This can cause a crash when the returned pointer is of type struct
 inet_timewait_sock and sock_put() is called on it. The following is a crash
 call stack that shows sk->sk_wmem_alloc being accessed in sk_free() during
 the call to sock_put() on a struct inet_timewait_sock pointer. To avoid this
 issue, use inet_twsk_put() instead of sock_put() when sk->sk_state is
 TCP_TIME_WAIT.
To: Shiming Cheng <shiming.cheng@mediatek.com>, edumazet@google.com,
 davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, horms@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Jibin Zhang <jibin.zhang@mediatek.com>
References: <20250425073120.28195-1-shiming.cheng@mediatek.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250425073120.28195-1-shiming.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/25/25 9:31 AM, Shiming Cheng wrote:
> From: Jibin Zhang <jibin.zhang@mediatek.com>
> 
> mrdump.ko        ipanic() + 120
> vmlinux          notifier_call_chain(nr_to_call=-1, nr_calls=0) + 132
> vmlinux          atomic_notifier_call_chain(val=0) + 56
> vmlinux          panic() + 344
> vmlinux          add_taint() + 164
> vmlinux          end_report() + 136
> vmlinux          kasan_report(size=0) + 236
> vmlinux          report_tag_fault() + 16
> vmlinux          do_tag_recovery() + 16
> vmlinux          __do_kernel_fault() + 88
> vmlinux          do_bad_area() + 28
> vmlinux          do_tag_check_fault() + 60
> vmlinux          do_mem_abort() + 80
> vmlinux          el1_abort() + 56
> vmlinux          el1h_64_sync_handler() + 124
> vmlinux        > 0xFFFFFFC080011294()
> vmlinux          __lse_atomic_fetch_add_release(v=0xF2FFFF82A896087C)
> vmlinux          __lse_atomic_fetch_sub_release(v=0xF2FFFF82A896087C)
> vmlinux          arch_atomic_fetch_sub_release(i=1, v=0xF2FFFF82A896087C)
> + 8
> vmlinux          raw_atomic_fetch_sub_release(i=1, v=0xF2FFFF82A896087C)
> + 8
> vmlinux          atomic_fetch_sub_release(i=1, v=0xF2FFFF82A896087C) + 8
> vmlinux          __refcount_sub_and_test(i=1, r=0xF2FFFF82A896087C,
> oldp=0) + 8
> vmlinux          __refcount_dec_and_test(r=0xF2FFFF82A896087C, oldp=0) + 8
> vmlinux          refcount_dec_and_test(r=0xF2FFFF82A896087C) + 8
> vmlinux          sk_free(sk=0xF2FFFF82A8960700) + 28
> vmlinux          sock_put() + 48
> vmlinux          tcp6_check_fraglist_gro() + 236
> vmlinux          tcp6_gro_receive() + 624
> vmlinux          ipv6_gro_receive() + 912
> vmlinux          dev_gro_receive() + 1116
> vmlinux          napi_gro_receive() + 196
> ccmni.ko         ccmni_rx_callback() + 208
> ccmni.ko         ccmni_queue_recv_skb() + 388
> ccci_dpmaif.ko   dpmaif_rxq_push_thread() + 1088
> vmlinux          kthread() + 268
> vmlinux          0xFFFFFFC08001F30C()

Part of the commit message landed inside the patch subject, the stack
trace should be decoded, the patch should target the 'net' tree and
include a suitable fixes tag.

Please have an accurate read at the process documentation under:

Documentation/process/

and especially to Documentation/process/maintainer-netdev.rst before the
next submission.

> 
> Signed-off-by: Jibin Zhang <jibin.zhang@mediatek.com>
> ---
>  net/ipv4/tcp_offload.c   | 8 ++++++--
>  net/ipv6/tcpv6_offload.c | 8 ++++++--
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
> index 2308665b51c5..95d7cbf6a2b5 100644
> --- a/net/ipv4/tcp_offload.c
> +++ b/net/ipv4/tcp_offload.c
> @@ -431,8 +431,12 @@ static void tcp4_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
>  				       iph->daddr, ntohs(th->dest),
>  				       iif, sdif);
>  	NAPI_GRO_CB(skb)->is_flist = !sk;
> -	if (sk)
> -		sock_put(sk);
> +	if (sk) {
> +		if (sk->sk_state == TCP_TIME_WAIT)
> +			inet_twsk_put(inet_twsk(sk));
> +		else
> +			sock_put(sk);

You can simply use sock_gen_put() instead

/P

