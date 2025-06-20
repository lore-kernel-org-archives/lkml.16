Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B444E2EA145
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750435798; cv=none; b=W/+uL6BIYZ1TTyuhG2ALm9fRF177O5oAw5nIPb6JyReoN5NqdhRhKR/YHa8JNG06KwA1xfxuZSExDDs1kWMi+2yDPrdteZRRLpqmxHXzIKNZaN2FSZN0NYBE1c2uL00vuHNzrnQRNFdqYanapJ0cS9gx7x2h+BQsXq/XLJwE2ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750435798; c=relaxed/simple;
	bh=iFVVi4SD0YvwzNNEJrKdCVViwyMiH30A2N4p5nVGGjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tf4mrxE6VpNJeXIDKKUmIpNL0X/bTty1Y43gSEbtM4LCGqs1Oz2okGbWHwf/oOcnm4MdEL3IdYnP/k6bTzoEzfbAx+CQJSszFbrhLTX3dHD3Io42nNCJ6XoMPfUlG7ILfj7x5cQqZwwsz2k7vSIQMAcxZblNHZXp16DKAuCLF0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=T7RuoPuV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="T7RuoPuV"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450ddb35583so2835045e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1750435794; x=1751040594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4MHwIvFZs7vEBdlpudmn2AZHeZK/CymJMOEvq5wOqyA=;
        b=T7RuoPuVjaxRpgRyQu1hsJWWFe6uvyzcuRISNElaE165hCzrTUK7enTxuRPv/fj3Oj
         WgnxzhnreYd2qEkHB857IoqhsZqPrDmwG3paAUyq4A8D31plJW1nbUS8h60eAPL4M1Xz
         v7Q3mZyNFp+aTj8PLV9WG//KfkH/t0Nqm4KTEKoeaCZau3XgErpnca1S1fe9Ttw6/mvQ
         eer6p2Wn+O5HjVSwuNfGZaulBeFiYoy7w8WBqrGKJNisuUzl9cf4DVlKEudCKt6uGNu4
         Sa90y3lYgRefn6ivuOdeT4rUSo1Z24mcI3AOeOzlzSJEJrcoF/B5n97VMQI/2eZoPSvH
         i70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750435794; x=1751040594;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MHwIvFZs7vEBdlpudmn2AZHeZK/CymJMOEvq5wOqyA=;
        b=Y3haPuApBJeSdc8wM5qvRIhSUqk1YM33Y40tF6OTaxMvwKh/evNLzuJsfMf4hVj5G3
         2Kapnz/GKA5StxmO2KxLiDL9UgQ6/M1x9EnDO+Vvq0YB6D5//56CIxYawyO9nRDw8ngT
         bwUsoaLtrD2ddA+zEz6/pMknQCO57/eMGtU1tDYUJuN41sVqS+AvVJ15whORQyY8PS1x
         I/FYPxHD/4whqzS5sA4tDiRCHn+PGrJBZ4lCgQFn0/qrkOObWFuDLGIcllTYLYK0W82/
         suhZPz4euk2ns1K2XGkNx03MZ64E92xyY5tJkC3x2ViFZnjSWdV6aWoCVsIiK9olXTSU
         JsUg==
X-Forwarded-Encrypted: i=1; AJvYcCVA5T+FbD9VydN49YlJmDzrObNynXXefQXnzDtba+1Qgt37R4fKJD4LRG5AOBYaKBj4WuzL0vwvVNkeiNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzztKSwjtopRhcJt66LC4lk6bLwsc6UBvCxHPu7umBzyz68n1yo
	wn5RwRHEnWwWvU3oBunvhpM5Ik5pyjtscMW81yILB2uCGMGwSNq1jR3YpndV+S6Ztt0=
X-Gm-Gg: ASbGnctam3Wvoz00fg6ofo0uvFWi/f42A9EZaZQxHTvnMgl07iHTVcf0ejibZGPxeTC
	4TuFpQagJslXclDgHatzrhvyMzmERd2hKC9IpW0FHNLtCuOTXZDCjzRN9GkJbTOg1+s4tTSQxdi
	4kO7A9RBIR8NcPO1IBxoM57vri5jma28q/IhuApGuTpbSshZKTEeAECYmx7/cPmWGmIlOUjw03j
	9PVGdn4R1ojAm7y90o8+LZ3Mov2RmCJzGLYbhCSitAeG/Ketm5NG0i/zb78+XtMEDjbadZrXx8n
	fQJ/HcaTVZ+WDVZHI9HbdmyTQZy5WI+rgkqfXAmnb7LmRyyTijGx/PFKuftx56gyY2+uNshhHr8
	VVRy9NEBONwwJ3qFsZuyjLF+M2MaLbtrZM8ja
X-Google-Smtp-Source: AGHT+IFN8t0bmdeFCNJpnI3GNp5nOCRtp+46NKWjbqyGgAS4qJRFmSf3Ir+Qksns73qPm7zaAQsYsg==
X-Received: by 2002:a05:600c:1385:b0:453:6124:e70e with SMTP id 5b1f17b1804b1-453659ce97emr14835945e9.9.1750435793789;
        Fri, 20 Jun 2025 09:09:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:607e:36cd:ae85:b10? ([2a01:e0a:b41:c160:607e:36cd:ae85:b10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb672sm30205755e9.6.2025.06.20.09.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 09:09:53 -0700 (PDT)
Message-ID: <d429f28f-f515-405d-b490-9b60e5f95070@6wind.com>
Date: Fri, 20 Jun 2025 18:09:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [RFC PATCH] ipv6: enable per-interface forwarding
To: Gabriel Goller <g.goller@proxmox.com>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250620152813.1617783-1-g.goller@proxmox.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20250620152813.1617783-1-g.goller@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 20/06/2025 à 17:28, Gabriel Goller a écrit :
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
> This patch modifies the forwarding logic to check both the global
> forwarding flag AND the per-interface forwarding flag. Packets are
You cannot change this, it will break existing setups.

> forwarded if either the global setting (conf.all.forwarding) OR the
> interface-specific setting (conf.<interface>.forwarding) is enabled.
> This allows enabling forwarding on individual interfaces without
> setting the global option.
> 
> This change won't allow a `Router`-state interface without forwarding
> capabilities anymore, but (with my limited knowledge) I don't think that
> should be a problem?
> 
> This is quite an impacting change, so I don't really expect this to get
> merged. I'm more interested in hearing your feedback and if something
> like this would even be considered?
The only way I see for this is probably to introduce a new sysctl, say
net.ipv6.conf.<iface>.fwd_per_iface (there is probably a better name).
When the user set net.ipv6.conf.all.forwarding to 0, the kernel should reset all
existing net.ipv6.conf.<iface>.fwd_per_iface entries to keep the backward compat.


Regards,
Nicolas
