Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902D31F09B0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486149; cv=none; b=qR26dQB/QmI765MaXWfOMZj3Tgr+3/epPzMX3nn8D1iwhmEw4lFAT+ihNwJza5WbsXX17Bd0WBcAORgVru+PsG9bUgU7DKSN5pvdvGTif4gUwkgi6Waa/cwb4Af1acfzvr5qDlG6Sz5dNcUYu1s0NQpqOLSRcC1rsiduFRyKzdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486149; c=relaxed/simple;
	bh=4PPawEHJO0RzXIkSTztsBVavys1JxXqDXM5aGgonoaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pr8v5sot2Z5xU0n5QtXkSgjCZbgfgjB3RHc2r2TXPIm7sXDTlrDbxSZASPXGkH0TqaSHymzqXilAXKo994vBa0+8zjZwp9APnPdgvI1plXxBJs5s2HQ0yJNratKEAlDSdzPWG/MeSK0SkpPvEDWmO1kL1aIBBLHYBS2r7vnwv44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=byWvjK39; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="byWvjK39"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745486146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nan/dGsgD9S78SkEaYqX3b7ONqNlN/LPIyKNn62zAqQ=;
	b=byWvjK39U73Mvaxo+K12loQQfbnnBabqMwWI9DpDIN8fWS75r94ltm8fZ/eq7Ep9NWrONc
	zBwm1C3oDOUvTXraDkVvj7Ea5t6XbNYP9PvFdYFSRUkKdNoe2K0m4lku6m6+IYgZo8m5Nx
	NeQ5pFwz7ytRegR+SqRRQRe4CtnjuIw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-sDacDV8oPTiFSDMgXi26XA-1; Thu, 24 Apr 2025 05:15:44 -0400
X-MC-Unique: sDacDV8oPTiFSDMgXi26XA-1
X-Mimecast-MFC-AGG-ID: sDacDV8oPTiFSDMgXi26XA_1745486144
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso4091415e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745486143; x=1746090943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nan/dGsgD9S78SkEaYqX3b7ONqNlN/LPIyKNn62zAqQ=;
        b=dcgo3DatY4r8sNzu548m1j1rwWr2FzmRYmn2x+MIqAmm69R4M7ZbwqLNDZvjnvVlSq
         ngMTqZ/rpQNdBfQSx4U/QeImzw9qg+Xrf3iDobaHPP4D8MzFHo/aITSFOgFsgwg4Ao8F
         2PZswGy5gMMXjfHg+Kiv5Qq65WXowAsoOAphLk5IyOofaj+4hX/KxEpmYZErcENfS+1E
         2d8jKX7sjWdFGATo/g2gLa4jRsdJSEOt0/1kSQVUBX21EovnM5yk05Tx1qOqQ85S+ACR
         Pjm72jHoo7SnmFd09/2Qmcpu7ODNlawJJRhqXbYysEcCnVfzRxyHWf0gQ0VNEE/Ar9ft
         QXsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJW0w6CTZseL8Nm09hWBqAzW8mZYR+xJE+RGBgepgJC7JWwI3s4adyBcTKvXPgqHW//QA2l0uYo0fujdk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuo5vt74Ymyn4EhnMl9qfxfMicrzZvF4+MncwZVRT9qtvdXttI
	ZyCIihOpurtQHWEq1CLpN7zOwjLpZMPFX3FZBaohm/WEIg0xMTdpyTo7iPsJrfI9PmVewVAJZAu
	2YwXNe7j3jOhJ6ctSmbc9dYc0ci5oTLtV3vdnVHjyXGgenORdLHdjE8e1h8yoCg==
X-Gm-Gg: ASbGncsgRLJx7mcat/MRel+eeY3JcRtmthPovCxjycqbiGH7Qm27rZGXSnkFnrYQh0z
	KblMXrX35LV7UZZuxrU6qNT+keQDBOxBwE8FaAOsqTy3/u7gDXLz2uXRDl5J0mlr8OeXC6SjibI
	8xwkqZVmbchysqHPTXPx5LLAMETMiHfu3gjPcE995UHkfNIGmTN/ep/JqVSeyH98edsojVbQHJC
	suiyoReE9CIsWjZBnz3OSdGOfXhzlC7iQgYrOrFalKz+AirOUbmCbTqLCnsX1mJ2ot2Hvmmbxj3
	igcDo6e0+GeFmYgAqJdNKhOTWlqi5is3/uk8NUI=
X-Received: by 2002:a05:600c:19cc:b0:43d:45a:8fca with SMTP id 5b1f17b1804b1-4409bda8921mr17007295e9.30.1745486143542;
        Thu, 24 Apr 2025 02:15:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/CKaXSwE795wZUKbdy/SE0/+hp8SxgM4T+j4EpSsDG0YNbGbvkOkUHo0Iq1UkKPXD7k+EEQ==
X-Received: by 2002:a05:600c:19cc:b0:43d:45a:8fca with SMTP id 5b1f17b1804b1-4409bda8921mr17007005e9.30.1745486143230;
        Thu, 24 Apr 2025 02:15:43 -0700 (PDT)
Received: from [192.168.88.253] (146-241-7-183.dyn.eolo.it. [146.241.7.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d1e1abcsm13060505e9.0.2025.04.24.02.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 02:15:42 -0700 (PDT)
Message-ID: <cf0d5622-9b35-4a33-8680-2501d61f3cdf@redhat.com>
Date: Thu, 24 Apr 2025 11:15:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: dsa: fix VLAN 0 filter imbalance when toggling
 filtering
To: Jonas Gorski <jonas.gorski@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250422184913.20155-1-jonas.gorski@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250422184913.20155-1-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/22/25 8:49 PM, Jonas Gorski wrote:
> When a net device has NETIF_F_HW_VLAN_CTAG_FILTER set, the 8021q code
> will add VLAN 0 when enabling the device, and remove it on disabling it
> again.
> 
> But since we are changing NETIF_F_HW_VLAN_CTAG_FILTER during runtime in
> dsa_user_manage_vlan_filtering(), user ports that are already enabled
> may end up with no VLAN 0 configured, or VLAN 0 left configured.

Why this is a problem specifically for dsa and not a generic one? others
devices allow flipping the NETIF_F_HW_VLAN_CTAG_FILTER feature at runtime.

AFAICS dsa_user_manage_vlan_filtering() is currently missing a call to
netdev_update_features(), why is that not sufficient nor necessary?

Thanks,

Paolo

