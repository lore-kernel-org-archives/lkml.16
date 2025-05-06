Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3014A26F44A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 10:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526087; cv=none; b=bBMI/oIMqPtT0ifWqh/6Q0xx7aGB9e3/MU++AF+x4xyEoemq53S5IzGJxmxtoQSeka4fb5JljdrQvuTGkrG4t1BlrkuBv4XK0C+Pe3bmyVwBJBCiJ7JjIrE4kmsKnnwnkF+WcL189qHYZ5vML+FlEMYMRwpUlwow96XfImzZB4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526087; c=relaxed/simple;
	bh=Wz6GfcLllA8wXtKZftbfMGr8twZTF0gIGI34vcXnxvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rw/RE8MmUAVaA/dFZrkKPQuOm3vNZhz82jMQSZRNuoZmvSgXaULZ4b9kSmBSNK8cxPt5obUswEcMPRuu76jyTJoV7T6dJ/9ZqyLxTlN69lUQ7i7EL0D39lSMms6BJTHhU76t/Mwd4nr06SQOQ4rvLncurMmJGLOdnNyERe3e+F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fVCYukBZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fVCYukBZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746526085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2KtQkNqGsM537amwwqhIUa++uqwpFX6sC1hurxsMCHI=;
	b=fVCYukBZAHcpNHxC5l7aWX7MxV7r3Xaqfu8pedC+lsO3H0/OpjrnAl5l8/gjAw8U2qLuI9
	ePCuOYmoJ5+qi/qWOtI+FzqEraPlzMHJCxxzZV8z0FBZDCPNv9z+r+xPAloQQVyRzT8fWU
	GMFahnY1ok+YbT7zeWqEHFMRRtnEzXg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-D3fBi45ZNxWqoqPMV7Efuw-1; Tue, 06 May 2025 06:08:04 -0400
X-MC-Unique: D3fBi45ZNxWqoqPMV7Efuw-1
X-Mimecast-MFC-AGG-ID: D3fBi45ZNxWqoqPMV7Efuw_1746526083
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso31798515e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 03:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746526083; x=1747130883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KtQkNqGsM537amwwqhIUa++uqwpFX6sC1hurxsMCHI=;
        b=dScZ4AEf3B1AUH0g2DX1hpNf7ACYUiUdAQwoX7evN95vglnMWZuP3PTgn5Ku7L3uOm
         7Qke+sgRAFG/ZNWcodl7enSM9WTg2E4szuXTq30uy06Zu2+hglJm7hmpO48p2qFxWdlr
         IPRbfyW4IswwdoXmrlBRcssCx6UGHr2SFWQ1Z8JkC8Q69Y1/02VIiBWVY4cTTzcggBpP
         T0T0zh6hKRXB34kmQnVhP7gHIjLL8VUV6Fz9P64d6B3jKMvY8QlSl4TsMpOAsHbj/7m8
         63n2wGQJVFM7OzkZx8vLrFXJ6jdr83M6eMvtGcr27EV2OkM6EG09sx83LiJyaUhTaWwX
         l4zg==
X-Forwarded-Encrypted: i=1; AJvYcCV2YA/rsyUy3ETmv+Fyu5RT1405opULyJLN0ZKLUpkFTkvgbbB0t7JoS6lXky/HXp9LPBXN7ioZL0uxiFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxH1xCRfQj2S9g0JVhgfpQkWCLiCX8R4oR3w3Gmj5dcvHQ2J4M
	tGM9u0xYBEGenxWyFzcYgihTmS8N83ziiPgP3lSGYWVQi54qg7qMesg9z6D9Xz3XZmOx3/DSmp3
	8n1Nv6mi/pFxGJIfhvix/HHEHVYqHy0galHBQd6RB5L4tkYU7TuyTpHDP8qalMw==
X-Gm-Gg: ASbGncvtTwqjKSh2rOfx2uE+kscUvhGaiCNotOZdLE7LSqZxPxfu9jaYZM+BH2JK5vr
	5YiHqjIH5JEk3PSEsDelgBXMar5X4Xo0i8pbblYPokzBlRnVqwm5/Q2zeCCid/cvt5JRpnrMtor
	uWxrl9qpMpzgT+WHnVE8aip6+cQv2nXKbJKRcp/CMccj8JTqaVvNa55EwDjXbWLek/dwduaQeo1
	saAuzBqZOAysyMqsyz6Txg2eAsD30Qa+OkybH8RmcgFc4CyK8jwrPZObiiob6PNztxYHhanmlqk
	5+3KPME6k3NJthqTNN+qY2po0bL6pFn8Ik1xdK+/9ZleWIg01zTI3qpUXXA=
X-Received: by 2002:a05:600c:5304:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-441bbea0afbmr153287325e9.4.1746526082878;
        Tue, 06 May 2025 03:08:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhc03MBzoZWgjKorEMXR128n+knjgaDZEvqQTT3kpgSCz4Z047896lj5XIARk7un2ADQgeHA==
X-Received: by 2002:a05:600c:5304:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-441bbea0afbmr153286675e9.4.1746526082521;
        Tue, 06 May 2025 03:08:02 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2706:e010:b099:aac6:4e70:6198? ([2a0d:3344:2706:e010:b099:aac6:4e70:6198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aecb60sm207881215e9.11.2025.05.06.03.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 03:08:01 -0700 (PDT)
Message-ID: <19f4f38b-9962-41d6-97b7-e254db3c6dee@redhat.com>
Date: Tue, 6 May 2025 12:07:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 03/11] net: ti: prueth: Adds PRUETH HW and SW
 configuration
To: Parvathi Pudi <parvathi@couthit.com>, danishanwar@ti.com,
 rogerq@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, tony@atomide.com,
 richardcochran@gmail.com, glaroque@baylibre.com, schnelle@linux.ibm.com,
 m-karicheri2@ti.com, s.hauer@pengutronix.de, rdunlap@infradead.org,
 diogo.ivo@siemens.com, basharath@couthit.com, horms@kernel.org,
 jacob.e.keller@intel.com, m-malladi@ti.com, javier.carrasco.cruz@gmail.com,
 afd@ti.com, s-anna@ti.com
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pratheesh@ti.com,
 prajith@ti.com, vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
 krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
References: <20250503121107.1973888-1-parvathi@couthit.com>
 <20250503121107.1973888-4-parvathi@couthit.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250503121107.1973888-4-parvathi@couthit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/3/25 2:10 PM, Parvathi Pudi wrote:
> +static int icssm_prueth_emac_config(struct prueth_emac *emac)
> +{
> +	struct prueth *prueth = emac->prueth;
> +
> +	/* PRU needs local shared RAM address for C28 */
> +	u32 sharedramaddr = ICSS_LOCAL_SHARED_RAM;
> +
> +	/* PRU needs real global OCMC address for C30*/
> +	u32 ocmcaddr = (u32)prueth->mem[PRUETH_MEM_OCMC].pa;
> +	void __iomem *dram_base;
> +	void __iomem *mac_addr;
> +	void __iomem *dram;

Minor nit: please respect the reverse christmas tree order above.

/P

