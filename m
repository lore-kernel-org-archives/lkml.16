Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2565D1F12F1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743505295; cv=none; b=Wwdm1uY/sNyuPUZmw9qmiABrFpTOZPUhZZE3GtRKYn9um2Hu0UTP1kaL34S/CfhwJnumPM7Yz8xFLJxOcv+RA+iR1Y6RKn4dyJHV5XB9+Deilf5b6VfQkgh1E9YiE0qrm1w5ogDxpZwqgWQY/E58MLRZCQs9BTQw5hCsBLmcKXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743505295; c=relaxed/simple;
	bh=ivqGICVxLEozQGBTawILTTXP7Nl7eMNQhKWIstBNXQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aa8/MU7iJuV69YSeelidSCdagdE7PXUcV7396YSRFyUxPsU5CdjwMei6HgzTItIRH8g4ZG8nmGKtAcfo0ME+iNjNRsrB7iq0cQoTtLiDFEvGOlGdCh6H9F06/j3PlrVXaLVRBq1IDIUXCTECG2jzNuCbC9gO5r6B640GBNRTti4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IBbzpgRe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IBbzpgRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743505291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bjr/CuUIuzeRdMkmnmhYE65i0HIy2EZrxJ55nmXT618=;
	b=IBbzpgRedFdIdy4BUBF2gVd44npUZteaDYOZOalu5GD7jq/Dl3vh12W25F1H9jtohNCXXC
	Hc7qfFaNvg1/zAMn4CbsvFtHWbgTNskK6Wyvq0VzXB1bXCZgUwf1O4Nmf6Isw1dt+tGjSa
	VZz45Ksd/pz6dn7yehPjgj1BrEB6pEA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-SsBmxlKoMeGJ_3Wq45ngvg-1; Tue, 01 Apr 2025 07:01:29 -0400
X-MC-Unique: SsBmxlKoMeGJ_3Wq45ngvg-1
X-Mimecast-MFC-AGG-ID: SsBmxlKoMeGJ_3Wq45ngvg_1743505289
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so33214385e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 04:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743505288; x=1744110088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bjr/CuUIuzeRdMkmnmhYE65i0HIy2EZrxJ55nmXT618=;
        b=bWntLrAtsw7DrfeVsm59BhjN5sufn2LJVshNLDZ7ARXAHqkx+dbP8nkAiEjauZPJiV
         QT92itoWeD31zje/T8KwpJjRm0DkTT1brxgutFSNnf0XSumUh6ZY12ytMgk4BEJu9Z6u
         m49vDg5FdszW49NiMcq49/lq3HD6h6vgI4jIb1+2PBr2wFRBuwAGYES12M5DwhNj488N
         tZy7OwVO01JTuWo6a+38yM28FSAd7GGduuBD6iThAEcU1/BjDDTfwG2x2NKSCjY61Ucz
         U65B0Np11LH4cigoL3TC6OONWhwjoZo9WJAkL3k3BvpJlMq7+nrTIFncwYLo4TfiBLNa
         9m/w==
X-Forwarded-Encrypted: i=1; AJvYcCWcVJcnslLbUGXJJRD52sonLerfyV1a6s0vX5nyUeyniyhGHvEfaMBsNOPWYAqYYvZRFqltqZ9h9ekGvdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQYYrNxF1LBlrNYQcnlfAbu65gHcdLFdr86dwA9RYnH8TtpGEx
	lc/FqzCV8oIdiSzM2lsVvoyFLi5cuNkFyPhFpEcEFS9A70JuELjq8Mw4pVCMLHh7r3feaTRiTK+
	sJ3u9jAfnV6pivTu5E7y0ZrLECLnUG658dUD3TpgH9zYFkFWl75lIVXrrljB5AA==
X-Gm-Gg: ASbGncsFZDlE5bGLuHHSeIDhnnEPfRL/pFcCoAQX669BPBjvG0tYxeV2C1J162GRv/l
	5kQSEs2I4/GFxlNNz9fvRhYJJSQIKK66kMzI5bsaFLgyBUqYcLqw0gZObcfn6vesxpVf86BFVKt
	AGa9CFDKkrzINkaNLCslsBo6M7TDqJiXsC09jJiToNvVBYoXaliOoz5E5IfEB4l1O05xiNaJvBb
	3UP+kiitW1LF0XeVUH1e+dJuVcSlPXoNHIXRTq9PQilPk2lzAvZHKaAQlxSrETri64qumeY4Dig
	WpZh/ehHjNnKNG3CtYGgIINW2cY0fok2sodoSTtcaPLwkw==
X-Received: by 2002:a05:600c:310c:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-43db6228049mr92536635e9.12.1743505288643;
        Tue, 01 Apr 2025 04:01:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWR6oGgrBc9yh+EIWLu0f/Rl10wsiQ6GwZIk1/Jim/OUEtWye5DYg+AcOZjj2bj4OhsRKyqw==
X-Received: by 2002:a05:600c:310c:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-43db6228049mr92536285e9.12.1743505288311;
        Tue, 01 Apr 2025 04:01:28 -0700 (PDT)
Received: from [192.168.88.253] (146-241-68-231.dyn.eolo.it. [146.241.68.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efdffdsm194280015e9.18.2025.04.01.04.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 04:01:27 -0700 (PDT)
Message-ID: <37f86471-5abc-4f04-954e-c6fb5f2b653a@redhat.com>
Date: Tue, 1 Apr 2025 13:01:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net/smc: fix general protection fault in
 __smc_diag_dump
To: Wang Liang <wangliang74@huawei.com>, wenjia@linux.ibm.com,
 jaka@linux.ibm.com, alibuda@linux.alibaba.com, tonylu@linux.alibaba.com,
 guwen@linux.alibaba.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, horms@kernel.org, ubraun@linux.vnet.ibm.com
Cc: yuehaibing@huawei.com, zhangchangzhong@huawei.com,
 linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250331081003.1503211-1-wangliang74@huawei.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250331081003.1503211-1-wangliang74@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/31/25 10:10 AM, Wang Liang wrote:
> diff --git a/net/smc/af_smc.c b/net/smc/af_smc.c
> index 3e6cb35baf25..454801188514 100644
> --- a/net/smc/af_smc.c
> +++ b/net/smc/af_smc.c
> @@ -371,6 +371,7 @@ void smc_sk_init(struct net *net, struct sock *sk, int protocol)
>  	sk->sk_protocol = protocol;
>  	WRITE_ONCE(sk->sk_sndbuf, 2 * READ_ONCE(net->smc.sysctl_wmem));
>  	WRITE_ONCE(sk->sk_rcvbuf, 2 * READ_ONCE(net->smc.sysctl_rmem));
> +	smc->clcsock = NULL;
>  	INIT_WORK(&smc->tcp_listen_work, smc_tcp_listen_work);
>  	INIT_WORK(&smc->connect_work, smc_connect_work);
>  	INIT_DELAYED_WORK(&smc->conn.tx_work, smc_tx_work);

The syzkaller report has a few reproducers, have you tested this? AFAICS
the smc socket is already zeroed on allocation by sk_alloc().

/P

