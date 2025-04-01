Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E6A1F0E2B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 10:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743502637; cv=none; b=bpgOawtBeP7H6Rsl2CS56eNsxGDU0I8E0Wx3Au31Ic/HAAWj1mQjBisa5NPHx3rWZRXBe3pvDrb3A4Tw7RxtFOITFHgdy0OhJfYBAOPb2WLJrVD65sEKWNf74+lUSJSPHVllHF6dvMj1xIKG2H2a4ZX45Z5zyUjojRs6iQqMM3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743502637; c=relaxed/simple;
	bh=J9sN/SCpQdOsJ/VsXznV8BFQbWuLunif5HeENL/lal0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qbqSYEBjMpX/Kz5hbFab6pD+vRYCNH00dyg3lxWk1JWe3LoTN+EzmYTbIjtmQVga0UZ/UZJmPF9MECfO7e9Q1CmQAzn2PBJd5X3khQFEaWcXa4TCp2rftJrREvixYLWrFAffxQOgVuyCUiCThEipDNAQv9oT1pneK51yoXwh9Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WCbuOpaW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WCbuOpaW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743502633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dPRFAnxaBhDNBUGsyHUsSaTq1XZo6xJwhW3PBzPYlGI=;
	b=WCbuOpaWsoT/uZMAh7yL2HGcxQv6GaqeC77UNoIgzt5wAld8uzp+tmsuFQFem/OGfb60UE
	Iuc7b5Nk4nd53MvFdKNQC1BLd9yIIBzdSO4YaLrHIs084VfvcYnYi0rEN2GBpqtGU49wKr
	IQrCuTnx+WOKwv+EdBUoyO2UiN68YEk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-ECZYO--oM9Oig4-5ZyQ29g-1; Tue, 01 Apr 2025 06:17:12 -0400
X-MC-Unique: ECZYO--oM9Oig4-5ZyQ29g-1
X-Mimecast-MFC-AGG-ID: ECZYO--oM9Oig4-5ZyQ29g_1743502631
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-438e180821aso24468575e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 03:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743502631; x=1744107431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPRFAnxaBhDNBUGsyHUsSaTq1XZo6xJwhW3PBzPYlGI=;
        b=O9conthMX8SJzIxIrK1ytp4AcOj16X4h6ZNsIjDaBULtc1grVgwTRFNcEiji27VS00
         f/wr0nJCYdRze724hPMy5EmWN160DGVgNfqqqW8XfP0orCFPAnBN+9kDa+4q25JVwUo+
         2AKU4iMCQOxYp2QDHKYOd0AhChaO5tEXfkI53JHsF6Lw3sbhb7OFZ8Ey1WGhlWJQ0x8a
         X2ZsW3OXl6X7Vb/4kfaFzBNbRpawi5lhVe2IVYNbfjyPiUqbVolfdD4XiOLrGcmNiYbV
         7beHkE6Fbnkz9l05yJ3hA0y8qVZfSdqcsBLdi3bg+xB91NJ/UDxP6Nr46SfXmMnEoq+z
         FJvw==
X-Forwarded-Encrypted: i=1; AJvYcCUAaMlntYMrWY/Sy6XO7jAmnFKJaDYr1LFE/YSqocwAgQQypu58egBv/ovGtPXo+vw9+ty7FcIS0Q1cM8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG+V//+bfNMHMLx0ndmV2HBSEzx6Od5RugFZSwWz+W6ZyWyoKt
	26rxltobFPMRIJz6WsFXsDjoJDkjDuHfufkcwrpEmo6gHmmzHzjZ1p2jLvLejUkDFm9UWeQ6UCD
	v7SwFevTrbpn8D5I1Z1d0tfJaUqmckbVHiwCyVDW/qfiMjPu6bENTJVH1gfQHbQ==
X-Gm-Gg: ASbGncs6cdFFzqiKrCRW60DrVUtB9sK1qvjsVp0TTespSXMLkzNcfPrZCDxXGzoON4Q
	EFtdVppcWtXyjbE5gGZgQ/15peSuSnI4cEhqco2Dj3BtI3A0AVHZRQ4YJ+gV7sc5lPrncHZoY0t
	o1d4R2A/sEl2kKIyWoVE9XBzTJ/MYcHCFtZN4mm0PkZW1acrxI6GlisftBTR/G7PpcZdlavqksQ
	5OrFAuWD8mgbE+g1KvT+L4yNEVyLOugoEpKZ7KfIjVBDOJaGPgM9QMHKkreCApBQop5P5zOSDMR
	/GtIlGX/EGvL+lOlv95oJmNYproRrfgScR09vsBg9m70Uw==
X-Received: by 2002:a05:600c:4747:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43db62b71abmr84549115e9.19.1743502631324;
        Tue, 01 Apr 2025 03:17:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+h2Z3PH+SSY1KJMU4wf66Mik4RO7KuA+9WwmoDxB0EW9Tc9oa0yAr71Cu5UVVcpJzNz98eg==
X-Received: by 2002:a05:600c:4747:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43db62b71abmr84548975e9.19.1743502630967;
        Tue, 01 Apr 2025 03:17:10 -0700 (PDT)
Received: from [192.168.88.253] (146-241-68-231.dyn.eolo.it. [146.241.68.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8314b6dbsm198004085e9.36.2025.04.01.03.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 03:17:10 -0700 (PDT)
Message-ID: <2a4f2c24-62a8-4627-88c0-776c0e005163@redhat.com>
Date: Tue, 1 Apr 2025 12:17:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] netlabel: Fix NULL pointer exception caused by CALIPSO
 on IPv4 sockets
To: Debin Zhu <mowenroot@163.com>, paul@paul-moore.com
Cc: 1985755126@qq.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <CAHC9VhRvrOCqBT-2xRF5zrkeDN3EvShUggOF=Uh47TXFc5Uu1w@mail.gmail.com>
 <20250330104039.31595-1-mowenroot@163.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250330104039.31595-1-mowenroot@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/25 12:40 PM, Debin Zhu wrote:
> Vulnerability Description:
> 
> 	From Linux Kernel v4.0 to the latest version, 
> 	a type confusion issue exists in the `netlbl_conn_setattr` 
> 	function (`net/netlabel/netlabel_kapi.c`) within SELinux, 
> 	which can lead to a local DoS attack.
> 
> 	When calling `netlbl_conn_setattr`, 
> 	`addr->sa_family` is used to determine the function behavior. 
> 	If `sk` is an IPv4 socket, 
> 	but the `connect` function is called with an IPv6 address, 
> 	the function `calipso_sock_setattr()` is triggered. 
> 	Inside this function, the following code is executed:
> 
> 	sk_fullsock(__sk) ? inet_sk(__sk)->pinet6 : NULL;
> 
> 	Since `sk` is an IPv4 socket, `pinet6` is `NULL`, 
> 	leading to a null pointer dereference and triggering a DoS attack.
> 
> <TASK>
> calipso_sock_setattr+0x4f/0x80 net/netlabel/netlabel_calipso.c:557
> netlbl_conn_setattr+0x12a/0x390 net/netlabel/netlabel_kapi.c:1152
> selinux_netlbl_socket_connect_helper 
> selinux_netlbl_socket_connect_locked+0xf5/0x1d0 
> selinux_netlbl_socket_connect+0x22/0x40 security/selinux/netlabel.c:611
> selinux_socket_connect+0x60/0x80 security/selinux/hooks.c:4923
> security_socket_connect+0x71/0xb0 security/security.c:2260
> __sys_connect_file+0xa4/0x190 net/socket.c:2007
> __sys_connect+0x145/0x170 net/socket.c:2028
> __do_sys_connect net/socket.c:2038 [inline]
> __se_sys_connect net/socket.c:2035 [inline]
> __x64_sys_connect+0x6e/0xb0 net/socket.c:2035
> do_syscall_x64 arch/x86/entry/common.c:51 
> 
> Affected Versions:
> 
> - Linux 4.0 - Latest Linux Kernel version
> 
> Reproduction Steps:
> 
> 	Use the `netlabelctl` tool and 
> 	run the following commands to trigger the vulnerability:
> 
> 	netlabelctl map del default
> 	netlabelctl cipsov4 add pass doi:8 tags:1
> 	netlabelctl map add default address:192.168.1.0/24 protocol:cipsov4,8
> 	netlabelctl calipso add pass doi:7
> 	netlabelctl map add default address:2001:db8::1/32 protocol:calipso,7
> 
> Then, execute the following PoC code:
> 
> 	int sockfd = socket(AF_INET, SOCK_STREAM, 0);
> 
> 	struct sockaddr_in6 server_addr = {0};
> 	server_addr.sin6_family = AF_INET6;     
> 	server_addr.sin6_port = htons(8080);    
> 
> 	const char *ipv6_str = "2001:db8::1";    
> 	inet_pton(AF_INET6, ipv6_str, &server_addr.sin6_addr);
> 
> 	connect(sockfd, (struct sockaddr*)&server_addr, sizeof(server_addr));
> 
> Suggested Fix:
> 
> 	When using an IPv4 address on an IPv6 UDP/datagram socket, 
> 	the operation will invoke the IPv4 datagram code through 
> 	the IPv6 datagram code and execute successfully. 
> 	It is necessary to check whether the `pinet6` pointer 
> 	returned by `inet6_sk()` is NULL; otherwise, 
> 	unexpected issues may occur.

The fix makes sense to me, but the commit message could use a
significant rewrite, avoiding the formatting and 'splitting' it in
several 'sections' with 'headers'.

The 'Affected Versions:' info is irrelevant, instead please include a
suitable 'Fixes:' tag, like:

Fixes: ceba1832b1b2 ("calipso: Set the calipso socket label to match the
secattr.")

and Paul's ack.

Thanks,

Paolo

