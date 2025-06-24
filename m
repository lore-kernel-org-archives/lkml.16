Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A63829AB1D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769643; cv=none; b=rbgkcvvuuwoQ6PYQ//groc3FTtk5phmJgB1t5stxsAyqDaMiCKofqih+cXoLRFFpSUXDMnri97+e0L6jQvb1uaVNCMRoE95J7832zPdhNH6s83iZbMtnmZWybQGEaPBqE+8bUhFNyKobRhgpU52v/WZfL4VQAaK4AglefSagliU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769643; c=relaxed/simple;
	bh=2kOE0t10Ys08qMax53uN1Ij++jJiV3VlExemldFQM8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cjk2xACbEcBCld0CSdbe87JoS6vTL+jo2gGdPuNX7+bIws2PC6ywlr1SjHESpe05aIZuqMUJeHcsIvmDAVQMJGsfYYJDpMxeLZyjaDqtEQXYplk14UGmNoZw6xA8/MCHKWgWaFk8mK0vrhwcP3ILkyMZ2cbr/2VOAB/iePXn7G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UmQVu5Hq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UmQVu5Hq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750769640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T1zTpwcC335IMGuNVVSMsviTgOOTgO+DQI5xktWwQcI=;
	b=UmQVu5HqnY6DnVKVatuvmHBBsERCTrUiqBDjAUBB9a6bkSyxkrrqxUfziLMqZ7LV0syaw2
	FaSK0gLbMiV8L7TMa4Tm/7+p3BQvg9PDdL0/bPxWgmibK1+MHptoZj6SIcrwGKwkNXukRK
	Qz51IkDDoIHSCjcu5O6yiqhIHtVIP7c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-hsBg3HWbMgy7Dawq0V79Hg-1; Tue, 24 Jun 2025 08:53:59 -0400
X-MC-Unique: hsBg3HWbMgy7Dawq0V79Hg-1
X-Mimecast-MFC-AGG-ID: hsBg3HWbMgy7Dawq0V79Hg_1750769638
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450db029f2aso2066495e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769638; x=1751374438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1zTpwcC335IMGuNVVSMsviTgOOTgO+DQI5xktWwQcI=;
        b=eG09JYvWQq39SgJI+weHVVG8NaYy7ISLoeeclDK7aGuOU5nG38kkLgFvqqGlszXgYX
         nbv8RQoH3m4kuCDDNZ4J04t/Dxju9cHDNMS26SBUNF5V5oaKnpK7Wnvbxz1qOyRvDzK1
         ZOmu4y86IgSD9cUzy3bk6g4AE9ZOuZu22psESDTJ2g65Rl7joMb3/eWSWWJfCO24vUFi
         wfmvKmQMaYgk/Ve9Lr3ihb1TgiiDSIJw416mfi9tlr/25j/r0BU5+PasHXKduPqvuJvM
         5O9XxZBrB0YxRlxqGnGuj/eQSM2zhC7Bo/o/rV6T+v50EhpCtYLJjMMTSzZPIMldst1+
         nEHg==
X-Forwarded-Encrypted: i=1; AJvYcCV4W5axx7l7KqK+fW9UmF89+ElZ8M02gWY/tLNNdwgNeRhLPw7tOJQVxV07Asi+JufJfusLRYFzhTZxrF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG8c/BjQeDPo1+g671P4JRmhuqAbsL4Fc67fEmZBvW95zH7fui
	P8T5PbG3wgF2iEMVfcUzUDpbXhspCfcTC4pZggQwf9F0FwNCjs7vjs8ajhkW1blXlaBRtpdtSBL
	OUVY4zp++7QJ/egRfXZX0XPnGdto11Fp6PvXuLmXheS1CGk77uN1qit+NPlPPaSEjfQ==
X-Gm-Gg: ASbGncuu4QAFCG/g8iddYr9z4jt5uZgf331rxd+Tbkvgp844XYKs0p4d6opsZPF5AM+
	UhZWCoJ6XL4orUNgtx094auPp0ZXeGKwG/2EFa7R0XnmSE8094Vr0kOgeZahYzcV9JmAZMkp7iZ
	JKhlJrtURr7XZzyvfohOTKtWyeq7CF40DGQYueEwkHp0zbIovTxgA5iC8joHHaevhqwxkQ/TABu
	UqXP69XZePKxjRkliKh+oJg7iJ45cWhMBIOmMFidQ1pJJv5aqq04lVAF00GXtAOZGDXmg3pTkg9
	KmTO4inRBbphQJPuSy0xwgVgNcfv5A==
X-Received: by 2002:a05:600c:b8a:b0:450:d4a6:799e with SMTP id 5b1f17b1804b1-453658bac1fmr127799415e9.20.1750769638134;
        Tue, 24 Jun 2025 05:53:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY7lMZVaWFiRWIPG8b3cMXMdvCcNTK8MZjjGLVmokK+tCuYyoVQ5c/x3K3fImoxj9zLjbwsw==
X-Received: by 2002:a05:600c:b8a:b0:450:d4a6:799e with SMTP id 5b1f17b1804b1-453658bac1fmr127799095e9.20.1750769637706;
        Tue, 24 Jun 2025 05:53:57 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646dc761sm139345745e9.17.2025.06.24.05.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:53:57 -0700 (PDT)
Message-ID: <fb0f1e3c-2229-4860-b46a-b99f6dbfdfe6@redhat.com>
Date: Tue, 24 Jun 2025 14:53:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5] docs: net: sysctl documentation cleanup
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, corbet@lwn.net,
 davem@davemloft.net, edumazet@google.com, horms@kernel.org, kuba@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 skhan@linuxfoundation.com, jacob.e.keller@intel.com,
 alok.a.tiwari@oracle.com, bagasdotme@gmail.com
References: <20250622090720.190673-1-abdelrahmanfekry375@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250622090720.190673-1-abdelrahmanfekry375@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/25 11:07 AM, Abdelrahman Fekry wrote:
> @@ -593,10 +629,16 @@ tcp_min_rtt_wlen - INTEGER
>  	Default: 300
>  
>  tcp_moderate_rcvbuf - BOOLEAN
> -	If set, TCP performs receive buffer auto-tuning, attempting to
> +	If enabled, TCP performs receive buffer auto-tuning, attempting to
>  	automatically size the buffer (no greater than tcp_rmem[2]) to
> -	match the size required by the path for full throughput.  Enabled by
> -	default.
> +	match the size required by the path for full throughput.
> +
> +	Possible values:
> +
> +	- 0 (disabled)
> +	- 1 (enabled)
> +
> +	Default: 0 (disabled)

This uncorrectly changes the default value: should be 1.

>  icmp_echo_ignore_broadcasts - BOOLEAN
> -	If set non-zero, then the kernel will ignore all ICMP ECHO and
> +	If enabled, then the kernel will ignore all ICMP ECHO and
>  	TIMESTAMP requests sent to it via broadcast/multicast.
>  
> -	Default: 1
> +	Possible values:
> +
> +	- 0 (disabled)
> +	- 1 (enabled)
> +
> +	Default: 0 (disabled)

Same here.

/P

