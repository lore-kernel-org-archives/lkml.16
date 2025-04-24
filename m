Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2CE5BAF0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745492669; cv=none; b=YFVbOedvJVTFToy6Serj/sHkdi+TSpcfXTAHU9qZc5OFd1oxJb5aPDe2MRSjJwQDqMunDI+eFe/lm3aX2PX4KcQ3CZ7Ko8gZktbs1jnD7ZzjCQxJ5+6ye5qmrzM6s6UYFHNBWKcXlLpp74M6PxRULUMlBlZKVtvKB8qhzV2epWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745492669; c=relaxed/simple;
	bh=2U/DZ98nyb43Zevabrjr+i1gak+2K8H1G+KpXSGgK/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SbXYSQ3DVc0pWbxp2nXs1pJPDxyQo8qFNe3TgSi6UibVYWEucP98EAW/Haat0XyyMWFcWRmo18MHnupL+QZkgffH/sGdoX1STqUmNFxDZjlZLvBp1BDkeWHv1nbsCpLasZLz8yVB1FUxml50vZepmGndtDmXm78m4lWNWv88Jmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aZDGJhD4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aZDGJhD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745492666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lyu9hNwObLGr+KhrEDmYPVh+6IL5Ud0sbGGYl34RVrU=;
	b=aZDGJhD4KS797PojGlOJkuvFgocIG5jA5LHTwhkhuz/hHtrkN1MZVm6pKQJn327XHsN0BN
	cF9TvhRY1I6QaFXWfSgmUmAwJDd1bM52QdTrcb/oXcip7G6G3gpUdNg0yXbo+GJd1cO5RA
	5VdfQPpJhrTqfPxqwxDsHZL3BoyF+cY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-3hzp5OXQO32unmFFKsuryg-1; Thu, 24 Apr 2025 07:04:25 -0400
X-MC-Unique: 3hzp5OXQO32unmFFKsuryg-1
X-Mimecast-MFC-AGG-ID: 3hzp5OXQO32unmFFKsuryg_1745492664
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-391492acb59so413032f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745492664; x=1746097464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lyu9hNwObLGr+KhrEDmYPVh+6IL5Ud0sbGGYl34RVrU=;
        b=f8paPxvPmY7I5H66YTKFbbqKxbEw2irU4qkq4MKCSbRQVqNsq0tNBNU7y8TBTRVwH+
         cfmU+od0EIaDBU739lTgzotX0rbwCSSEpD7wUduo3FWMpLqX567D9JKLn7At3RF1y/sc
         fcp/IAEhSRXjecS8jXXHy9e3Bq3ezelLvgeWU+Xcv7qvUAz1vUu7Pcn4BpCSf4YjQ1gP
         qgfoeziCHbvVcPFrd5Iyoc+ZgdsVLlIoJg4sHlQ7zA9p5nLFMe36WWd8Z3GxjtBvZorD
         u8tBLm6PYJ6H4GcEH0+byps/BRMI2obCRj+LPXyXjzl29eYPiqjWL6OP0N7J+waCAzRE
         Mq+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmI/CiinGTxYsxegKlQmGYqIZsMX2H8xZxUt9OUJPgH6e1EqKp9pSOWcv9a9P19JxrBFUrjW+kX51+zvk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Cl2ulYpEwRE+Hvgb9i/VGIjB+2Tc6zJ/QE6+TwoH+1/paxlm
	EOfM8M1kHFxNa7jvwg7Adpm/gEmxl8mr//js/EwhdHnCTFNS6HfFsS1avV8TXDPyPqy+TrQe2Nu
	wJQc8PHw9l1JJ+GnhaQmxH6bAPt2+w+C1bABED8PALkCAg+117RrC8GbMfu7nyg==
X-Gm-Gg: ASbGnctRaHMPqc/wvQBbZgoWgEsTGgYiiscFKrWhCmS8PCg5gp3RKu5BQELlDr0KkGf
	XS2lCjRuGfPf5+oHHnKjMLIkzkzG1+jd6sGPiwyia1t7DTBgvCbFHc4cUPCN52alrsIDciDIp+/
	PLGV5KcsKvkxC8Bi5Qp4euHMxM4XtsBqtHWkKZpoa2w7W7m3HGr/l3bmZ2MVY3K7BF9ZtsCS05R
	MLWGov5HfyzzAhfNa4UMVUUnF22HxG2+3aLFElEaVOJIcy89MP1whGQd05A/QKHyEQTvqwmvycU
	Xtbevs6Rhy/amepJYtFbF621LD1f4EtitX/vk8g=
X-Received: by 2002:a5d:47ab:0:b0:39e:faf8:feef with SMTP id ffacd0b85a97d-3a06cfab965mr1636781f8f.56.1745492663903;
        Thu, 24 Apr 2025 04:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHolj4jAkXWZgjgiY9g67zZ4iSrWcvdEryaUkNLkRqtxvRgz/PM71yD5V2etIdvFtP43ygB4A==
X-Received: by 2002:a5d:47ab:0:b0:39e:faf8:feef with SMTP id ffacd0b85a97d-3a06cfab965mr1636744f8f.56.1745492663418;
        Thu, 24 Apr 2025 04:04:23 -0700 (PDT)
Received: from [192.168.88.253] (146-241-7-183.dyn.eolo.it. [146.241.7.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4ae0b8sm1735217f8f.32.2025.04.24.04.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 04:04:23 -0700 (PDT)
Message-ID: <4e7227ef-a1d6-409f-a21b-5b1f26cf52b7@redhat.com>
Date: Thu, 24 Apr 2025 13:04:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] net: fully namespace net.core.{r,w}mem_{default,max}
 sysctls
To: Danny Lin <danny@orbstack.dev>, Matteo Croce <teknoraver@meta.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250418070037.33971-1-danny@orbstack.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250418070037.33971-1-danny@orbstack.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/18/25 9:00 AM, Danny Lin wrote:
> This builds on commit 19249c0724f2 ("net: make net.core.{r,w}mem_{default,max} namespaced")
> by adding support for writing the sysctls from within net namespaces,
> rather than only reading the values that were set in init_net. These are
> relatively commonly-used sysctls, so programs may try to set them without
> knowing that they're in a container. It can be surprising for such attempts
> to fail with EACCES.
> 
> Unlike other net sysctls that were converted to namespaced ones, many
> systems have a sysctl.conf (or other configs) that globally write to
> net.core.rmem_default on boot and expect the value to propagate to
> containers, and programs running in containers may depend on the increased
> buffer sizes in order to work properly. This means that namespacing the
> sysctls and using the kernel default values in each new netns would break
> existing workloads.
> 
> As a compromise, inherit the initial net.core.*mem_* values from the
> current process' netns when creating a new netns. This is not standard
> behavior for most netns sysctls, but it avoids breaking existing workloads.

AFAICS leveraging the above and any protocol without memory accounting
(e.g. UDP for tx) child netns could use an "unlimited" amount of kernel
memory. I'm wondering if it would be safer to limit, for child netns,
the maximum value to the corresponding initns one.

/P

