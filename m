Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8BA1FDE39
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749113688; cv=none; b=Dc6WgKdwlFUyem3BhK7415EhnBcbTHK9I4Vq/wlAW4IU9PDn5NWZO+yZa0qaGK59p9aT7c8wNBXSgOGKD7t6aIttT6jwSHv+nG49YVMeJ5+CNszCLUbqwPEG3ywEh/669pNdf8eYBQaHB3zS5VQK909JDTfDfRFURb/pV1DoYzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749113688; c=relaxed/simple;
	bh=CutlBU7+XyMLmKNvb0wnN0r3s8d0HV5seP8S9U9U9tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t9sQ7z03BMtEsTRBDWw9m49MbZWYI5BMnetINOy6mllnZ9DOgqaXZTN4o7vk4ce+LzKChFuPaRViKnFM5mOhtEuvMsbBekmbV6jDh4qVbRw2BPEDwMUEoIdWEeCdpBDZkAWXezJ5YcoTvDgs79dNgTIMTsLyeMl/8FSrgQsvXhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QnUBl2jM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QnUBl2jM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749113685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/1IdWtLBve9hm0KYciT3eHF1BQ7n8lnOyCfBkDNIA0=;
	b=QnUBl2jMyq0S9F+2AN6+ZSNoykPDlAu/hLHicr1/zROVzUkrKyEdCZozvs1/jnG2AeEyKh
	5TTG+ezSIej4lQI0NkPIs4u7MyQdeBXDIW3ps+kuqc2GHzDRnqeKLQhe7K7JmaTMUkhOOq
	N+ZdYblJEwHBeQfcV2W9r73SEACMeXQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-_jOIKQiXPWqZ0vPyCPvnKg-1; Thu, 05 Jun 2025 04:54:43 -0400
X-MC-Unique: _jOIKQiXPWqZ0vPyCPvnKg-1
X-Mimecast-MFC-AGG-ID: _jOIKQiXPWqZ0vPyCPvnKg_1749113683
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a37a0d1005so538717f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 01:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749113682; x=1749718482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/1IdWtLBve9hm0KYciT3eHF1BQ7n8lnOyCfBkDNIA0=;
        b=GI4hJLn+q8QQVW30EZi8iD8MDK8nAr/JDa2skkZONAy/PZkEb4Hc4tkzXd6LZ0NX/5
         kukCqn67q3jxXFyOShsSeHS31ux/WLc+kPWQ1Of3t0Xp8CrbsrKZjFaqNoM6XUCs2y/J
         PKlk03kd7yhgidgu2C2dFs60uJQVHvMg7id9SbS5r9U6eN7ga0nMSDUIileylRpUwgcd
         7NEyIDREkwjr1/JgCyaE4FJc8GOolvu1XbnbZHdW8bgSkkLifed7Qk/w1ZPcyUKRynaS
         DNJLIz+4OJ3KO5vtZ9vzFTBQlS8TsXgo8xiyg9G4pZyr/cOQwBUXiI3JTVQAWeXrwVG2
         1bSA==
X-Forwarded-Encrypted: i=1; AJvYcCWrIsHblTHB1h8EQAWhn047VYUHEHpB31Hn1sSyNLsAXR4TNzOWGxBO/wcBqPNOca5i6IkXlS7WjhHN5Es=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZGKz3x8KrJkR5NIUnZ6EATxMAypRhwtgsoIrq6JyCrOC6DVqX
	hbgWXOvWIfjrd9jPiPCl3z6LiTO94zt+cWYseD93NMvuJpK13yolo9kCeOclq6LMywELwmIrss9
	Z7KUanP3EA3ppSUAcbZWgdlp7V2Msz4mHvTY2CLxwswA8MjzZpPwRc9GkNfYDR6YYtw==
X-Gm-Gg: ASbGncvyT+p8sKPNoRZNOndq/tPya1QO1iqJaKm2JXJvT6UjN6HNE2a3fOCLR/OR3Wr
	r+oM200eBNtn5ZX1jLekQs8QiaC9fLf1PfdqKqcQHp3exMUAAbwwBLe9YbdNHdu+wOU6insIXuf
	Mx50MPe8jPqFmYJEvy0JuG5AjAfTprZyn6OqFJCi6b/UVbT6anU5SNOR6yW628gX2tA9GcgLKyi
	ExoivSBy4f37raNCDvXM9tPrjYP3Kdv0OMbCVAq8rQZMIVtPbe85X52QdnmXdtDq3CPJSBeK29W
	WNzCXCEFjPqgB9h5Gl4=
X-Received: by 2002:a05:6000:26d2:b0:3a4:fc37:70f5 with SMTP id ffacd0b85a97d-3a51d97663dmr4530780f8f.58.1749113682476;
        Thu, 05 Jun 2025 01:54:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIiaKoOIdST0XEVw8SQI0Y3T3+F7x/gjWPQu2MM9OBRTBKQnLlGajPNWHulbuCo2aRANA5ug==
X-Received: by 2002:a05:6000:26d2:b0:3a4:fc37:70f5 with SMTP id ffacd0b85a97d-3a51d97663dmr4530760f8f.58.1749113682057;
        Thu, 05 Jun 2025 01:54:42 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cced:ed10::f39? ([2a0d:3341:cced:ed10::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5247363a9sm2820852f8f.24.2025.06.05.01.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 01:54:41 -0700 (PDT)
Message-ID: <efeeaa50-cf61-4b4f-a2f0-bf15a1dfbaf3@redhat.com>
Date: Thu, 5 Jun 2025 10:54:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: dsa: b53: fix untagged traffic sent via cpu
 tagged with VID 0
To: Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250602194914.1011890-1-jonas.gorski@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250602194914.1011890-1-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/2/25 9:49 PM, Jonas Gorski wrote:
> When Linux sends out untagged traffic from a port, it will enter the CPU
> port without any VLAN tag, even if the port is a member of a vlan
> filtering bridge with a PVID egress untagged VLAN.
> 
> This makes the CPU port's PVID take effect, and the PVID's VLAN
> table entry controls if the packet will be tagged on egress.
> 
> Since commit 45e9d59d3950 ("net: dsa: b53: do not allow to configure
> VLAN 0") we remove bridged ports from VLAN 0 when joining or leaving a
> VLAN aware bridge. But we also clear the untagged bit, causing untagged
> traffic from the controller to become tagged with VID 0 (and priority
> 0).
> 
> Fix this by not touching the untagged map of VLAN 0. Additionally,
> always keep the CPU port as a member, as the untag map is only effective
> as long as there is at least one member, and we would remove it when
> bridging all ports and leaving no standalone ports.
> 
> Since Linux (and the switch) treats VLAN 0 tagged traffic like untagged,
> the actual impact of this is rather low, but this also prevented earlier
> detection of the issue.
> 
> Fixes: 45e9d59d3950 ("net: dsa: b53: do not allow to configure VLAN 0")
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
> My favourite kind of fix, just deleting code :-)
> 
>  drivers/net/dsa/b53/b53_common.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
> index 132683ed3abe..6eac09a267d0 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -2051,9 +2051,6 @@ int b53_br_join(struct dsa_switch *ds, int port, struct dsa_bridge bridge,
>  
>  		b53_get_vlan_entry(dev, pvid, vl);
>  		vl->members &= ~BIT(port);
> -		if (vl->members == BIT(cpu_port))
> -			vl->members &= ~BIT(cpu_port);
> -		vl->untag = vl->members;
>  		b53_set_vlan_entry(dev, pvid, vl);
>  	}
>  
> @@ -2132,8 +2129,7 @@ void b53_br_leave(struct dsa_switch *ds, int port, struct dsa_bridge bridge)
>  		}
>  
>  		b53_get_vlan_entry(dev, pvid, vl);
> -		vl->members |= BIT(port) | BIT(cpu_port);
> -		vl->untag |= BIT(port) | BIT(cpu_port);
> +		vl->members |= BIT(port);
>  		b53_set_vlan_entry(dev, pvid, vl);
>  	}
>  }

Makes sense to, but it could use an explicit ack from Florian...

/P

