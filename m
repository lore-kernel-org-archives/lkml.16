Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6F215442A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751637722; cv=none; b=Q7B3ZHlve3Ryce9/K0ywOCDGvfqCb4cnQOUkDp2n99GgdoXvRmPP3sfZszczEG1hr5038qZCDUd8oeyYODHNbp/bqewmkoKduk03B9MtlqxDH7AGjjp5plB7MdT0XCW6M9/1vyP9DklwPEwS5VlnNp/Z6EKYDMWUokAesQ7NzNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751637722; c=relaxed/simple;
	bh=VXgjLGFQZY5smlzhnXRitJLgxLrq2V8G8Kv45++grJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U/0M0uUyXwiETwQBx6hsn8r9qtNIoyzMA/kyrFQz6mYnCpuXRWmRNjGiZVXHh/jxFkT8IFugglv+YG2lARXR6zfqrj9SDRg2kZrox5nRETkrzClWwNTdSIWULWJeosf4/1OZemhGPYgHH2L4U3cpjgf5jEeJd8q5UtRalXPSCbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZE6e/Jgg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZE6e/Jgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751637720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sDJUJsvrMWlhp5h/eTlo7zQDDwQebZVC/hQFX5FKCvs=;
	b=ZE6e/Jgg4nwdeKm+taUaqzvK6K8h5J8zZlj7oQwflMsjoz7BoPc/K+Fd1lXHThjOD1jvj6
	i2a4oFCyprla9SPWyLbZIWGumglKy0DntvJ6CE18u3SSEAZ8n/f/ePl4p0LxpvF2rMAWrR
	SoykErGZW4LxIEZkOU3ETOKZKp/Eqpw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-7JlqFIaXNz2RZ3MSAMY36g-1; Fri, 04 Jul 2025 10:01:59 -0400
X-MC-Unique: 7JlqFIaXNz2RZ3MSAMY36g-1
X-Mimecast-MFC-AGG-ID: 7JlqFIaXNz2RZ3MSAMY36g_1751637718
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4eb6fcd88so602486f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751637718; x=1752242518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sDJUJsvrMWlhp5h/eTlo7zQDDwQebZVC/hQFX5FKCvs=;
        b=TsVbHXTqO0tikoKznXi2hH0UBXoR2lo5aG/jKtuSH8vE88PF/3frn8IvT1CgTgaahs
         aqK3NRo3rr5Ui5YgojrMNCib2R88MjrA8HJI6XPeDbKDZ3NZ30QY1jxrUga+V6+SaGjo
         lfrSVPGVOygo6jWrZAXQVTXT1goS1Pj5c30cdTYuOeNeNKYl1RhVoS9wMubpsNdYhIpm
         ctBN6nMmLznJTCQNMtkuegXG3zSCzTlbg+71F9ZPtCGXWY8jG5WfNk+5FNLHlIO0HPY+
         HEs9mS3JOJSnH/V7qbsffwHgG006DcEucKESfZuJYxyErZnGAbS3Az7nLtEL9zh/JOBq
         +2SA==
X-Forwarded-Encrypted: i=1; AJvYcCWXN5lFMoQ+OGoFcuxl+8MlA9sMgLztT8BKP7Io3z2tlrk7kwbAA+fBp4swXyP2FnHGMS6XABVCKkVtMJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhll8vuBTtgXJMjg83eUOO4JjfT1qVY8iUPTrrln1fAgnE5XbF
	eg5CbqzpKKCg0jWTYy0ctxghzySmBDdYE9o6yqvhyUr1HImGqefKIK6vqd4JkARm+j3ypSpVfy4
	MMTxSEgMieZpwBxhyzFvG5O/08bdGqjLF0OovLoJcMhpD3FeGNeU1vjRffuxEYJSuwg==
X-Gm-Gg: ASbGncsmyl94tXWf9X3NMxwDzvUpLZKVEERjQW/GsVF+1Pbpv7C10l3nqJ8cnlx9LMM
	Vl7QHkNE/Gx/F/MgMi7kDg86WBT1crzehpAV95Ys21pIkozHv86D8AS7VVPQzzT6ZX8yOiLNXU9
	ldt6dhnwr6+ybDbkUZ93HARkRdxLVGd2ENFguDDtHRvyyYh4PFIiQSfHn3y/cIZdH9VBlSc46gM
	5Kl6lp884I8t5szBTuXB1WMqbmiRxk8UojHLSZ22sXhG22i9n6u4Rpnoi3pHzNSygriSajo6lPF
	xJmORgt13wSw8k2MQvKRMJnKGkU8qUBiyAz8xkbuDQY4tXQdQPRwL8fxT2qLpkneWx4=
X-Received: by 2002:a05:6000:4612:b0:3a4:dd8e:e16d with SMTP id ffacd0b85a97d-3b49700aa4fmr2018067f8f.15.1751637716846;
        Fri, 04 Jul 2025 07:01:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEZW1CkQQkIbScRXkuM03LBvtJ1trRwGa4hPNLBM5cZZYDNsHlb9LNsTd5kzICSts2krWbzA==
X-Received: by 2002:a05:6000:4612:b0:3a4:dd8e:e16d with SMTP id ffacd0b85a97d-3b49700aa4fmr2017961f8f.15.1751637715879;
        Fri, 04 Jul 2025 07:01:55 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314? ([2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1698f54sm27228875e9.33.2025.07.04.07.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 07:01:55 -0700 (PDT)
Message-ID: <51c73a40-fd3d-40d3-b6a1-f0b15ce98239@redhat.com>
Date: Fri, 4 Jul 2025 16:01:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net/sched: Prevent notify to parent who unsupport class
 ops
To: Lizhi Xu <lizhi.xu@windriver.com>,
 syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org,
 jhs@mojatatu.com, jiri@resnulli.us, kuba@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, xiyou.wangcong@gmail.com
References: <686764a5.a00a0220.c7b3.0013.GAE@google.com>
 <20250704080421.4046239-1-lizhi.xu@windriver.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250704080421.4046239-1-lizhi.xu@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/4/25 10:04 AM, Lizhi Xu wrote:
> If the parent qdisc does not support class operations then exit notify.
> 
> In addition, the validity of the cl value is judged before executing the
> notify. Similarly, the notify is exited when the address represented by
> its value is invalid.
> 
> Reported-by: syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=1261670bbdefc5485a06
> Tested-by: syzbot+1261670bbdefc5485a06@syzkaller.appspotmail.com
> Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> ---
>  net/sched/sch_api.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/net/sched/sch_api.c b/net/sched/sch_api.c
> index d8a33486c51..53fd63af14d 100644
> --- a/net/sched/sch_api.c
> +++ b/net/sched/sch_api.c
> @@ -803,12 +803,13 @@ void qdisc_tree_reduce_backlog(struct Qdisc *sch, int n, int len)
>  			break;
>  		}
>  		cops = sch->ops->cl_ops;
> -		if (notify && cops->qlen_notify) {
> +		if (cops && notify && cops->qlen_notify) {
>  			/* Note that qlen_notify must be idempotent as it may get called
>  			 * multiple times.
>  			 */
>  			cl = cops->find(sch, parentid);
> -			cops->qlen_notify(sch, cl);
> +			if (virt_addr_valid(cl))
> +				cops->qlen_notify(sch, cl);

The above causes build failures in arm64 builds:

  ../net/sched/sch_api.c: In function ‘qdisc_tree_reduce_backlog’:
  ../arch/arm64/include/asm/memory.h:424:66: error: passing argument 1
of ‘virt_to_pfn’ makes pointer from integer without a cast
[-Wint-conversion]
    424 |         __is_lm_address(__addr) &&
pfn_is_map_memory(virt_to_pfn(__addr));      \

/P

