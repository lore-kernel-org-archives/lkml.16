Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29302EF67E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949501; cv=none; b=qK5+wauyUt0DqKC8nesRxJzX3mP+Qpb2w6+geZ4ag+VDJ46zsqeVutbYNYVDxPoEPzw3t2+yYbEJqj7lVFq/X7dp9IxYzD5YDTPWToVGPsg4Xis3R2ip3CNiaFiWB7xAzwHeQ97POzQaDHaMmvqSZQoJzgff1uSoyFrZzDt7jwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949501; c=relaxed/simple;
	bh=JF07pNpobx+eiQCknDKHloi8lwhYrfONSzZq4yCierc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PcBpBWYDAe+eAoEvY6XRJPUv2wg8hqc6HyBbtI+RWL08WbkYmR4WTIdLi2rxKwCbH3o72LpZUpoApKoY1EkN961j0V3HdYTswlpwk3m5YGroU1jl6U1ICDc5jUYDK/YDCQgnxoVltly/u8BFiAJqscYevuvIQEDU8u3F6kZnNOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=NGjfB4kl; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="NGjfB4kl"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453486940fdso630825e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1750949497; x=1751554297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XCxrgMw5dH3wwRotvabG0epD5GWPSRw6BRqG3JMXTG4=;
        b=NGjfB4kl6jpcIAsJ0/Bx8XDQVMQtaf1iE+IrAQFcwiPuf+kIQawMK8UC/OvscE50dd
         x1KvUf9TBYXTdNTSkNk0IgtUKOPPLu1wY+xAl0fWp6TkwnShx7xasxBmlKJwheLeiLy6
         /q+AcF+T5UwqtvadYHVhwf5bflNvAL8/EVwoXB2rDM3jpbWA7jYBxoP++N2I+LcL5zdc
         RGFgLsNQtllkWY6DxyVrmudyWkek35dbWO7+ofsHKdiR0wc7szN45q1vflEYlOBBRLYh
         jbBmFQFH81eFPZNdEZZPNJtcA9efIK1JVJLIYvvnHn9b2FrgqzuTuUQ3hCCgJtryxUsQ
         L2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750949497; x=1751554297;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCxrgMw5dH3wwRotvabG0epD5GWPSRw6BRqG3JMXTG4=;
        b=ouy65jjARLv9qoFGENH6nyhY8fWBYxPne3yv9/Pqf+8+wCtLzTXedoKOpy1ORc3GAW
         hgV3zvcUm+nd6+HgpRctpeGoaOqV4bj+XjcpbuT0YEWwIEW5VV5fJGR+1mlDAWUtfVSU
         bdF0vtJyWZgXuuRtzjKHc3TEIvoZpR1B7o4fVAyvrUyPDCx9Lf1u64chsLMiC7Eg4uKH
         wvtrzOKjGkhdtzBx61zg/DPxfiJkYssRqm2SU34fKfEq+x7Ae44QXzCKHM2KhnFR+C58
         tCwQm5T0xQHTK8WxuRBiO5aGlEqKZ8KelGp67sB8FabakZyQQsOAgqF6M5iIUuQXqjKr
         +QXw==
X-Forwarded-Encrypted: i=1; AJvYcCVvxrq4rFodMXr3S7Kc+GsnFC9dE/PMGbKQU1NZlQaZshPK0GI2Fl2BA7ABUPmy/Kjhl5V3ci8xhFH9KBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqOBcXr7xNwJl8/ZbjokvmgVoeHNRuIW+k4ixIMW7RKEwPdhyh
	HxOiY9HhAACc/7E5s2tl/BTOXHwqGxbNXlt9/Gm4Y+d3upCgONqcGIaoUyvmrvLoOxM=
X-Gm-Gg: ASbGncuWYHADGPc8RABwOM0XIw1GCJY7OsZ6UciegSq7b7Oa68l7mGcabnzoeb8fyfR
	KS49+pJaBcKfxitqlcyrZKNMetXpNcm5WrZ+V/wLy3QT1dYNkmEFf0GYEis/VgzzqntoRqU51Px
	p9OV3PCmRwrXHtm1T0JdT2K9ir3UZzd12IyGDmbJk2hdbphIhKg2e+8tnKKX3QfuKTrohKKsKOS
	btJU4bNi5u5I/DINflkCjT3MCsC/bBy1d0pl+pjCES5qfy9F5U/hxP3wGcgOdwDzcfhkndn1/VM
	C01TK5wqpj1dzB4HXwSlSn2UIIpktv0zqRhzaVyrN2Vv5xTNeC0A8WMPSePKNV1PhlFWw/DKvau
	oXaM2kHTsxAXHR46D4t+U2ArlFbGKykVCeSLRsk0=
X-Google-Smtp-Source: AGHT+IGEqw+vHiOtazisTlthFJURpuJo0I3wC2xWaJSrVLuPouGSp44NESRPywzoYZsbj5JBnRucLA==
X-Received: by 2002:a05:600c:1f0e:b0:439:9a40:aa27 with SMTP id 5b1f17b1804b1-45381b0e6d6mr27342225e9.5.1750949496818;
        Thu, 26 Jun 2025 07:51:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:fc93:9188:755b:45d1? ([2a01:e0a:b41:c160:fc93:9188:755b:45d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad0fesm54189615e9.25.2025.06.26.07.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:51:35 -0700 (PDT)
Message-ID: <f674f8ac-8c4a-4c1c-9704-31a3116b56d6@6wind.com>
Date: Thu, 26 Jun 2025 16:51:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH] ipv6: add `do_forwarding` sysctl to enable per-interface
 forwarding
To: Gabriel Goller <g.goller@proxmox.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Ahern <dsahern@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250625142607.828873-1-g.goller@proxmox.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20250625142607.828873-1-g.goller@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Le 25/06/2025 à 16:26, Gabriel Goller a écrit :
> It is currently impossible to enable ipv6 forwarding on a per-interface
> basis like in ipv4. To enable forwarding on an ipv6 interface we need to
> enable it on all interfaces and disable it on the other interfaces using
> a netfilter rule. This is especially cumbersome if you have lots of
> interface and only want to enable forwarding on a few. According to the
> sysctl docs [0] the `net.ipv6.conf.all.forwarding` enables forwarding
> for all interfaces, while the interface-specific
> `net.ipv6.conf.<interface>.forwarding` configures the interface
> Host/Router configuration.
> 
> Introduce a new sysctl flag `do_forwarding`, which can be set on every
> interface. The ip6_forwarding function will then check if the global
> forwarding flag OR the do_forwarding flag is active and forward the
> packet. To preserver backwards-compatibility also reset the flag on all
> interfaces when setting the global forwarding flag to 0.
> 
> [0]: https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt
> 
> Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
Please, export this sysctl via a NETCONFA_DO_FORWARDING attribute also.

> ---
> 
> * I don't have any hard feelings about the naming, Nicolas Dichtel
>   proposed `fwd_per_iface` but I think `do_forwarding` is a better fit.
What about force_forwarding?

> * I'm also not sure about the reset when setting the global forwarding
>   flag; don't know if I did that right. Feedback is welcome!
It seems correct to me.

> * Thanks for the help!
Maybe you could align ipv6.all.do_forwarding on ipv4.all.forwarding, ie setting
all existing ipv6.*.do_forwarding.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/ipv4/devinet.c#n2423

Regards,
Nicolas
