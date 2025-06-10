Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABBC288C37
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593039; cv=none; b=OOqA+9gwii77m+fiwwLDlp7dvLXJ6a4hlaT+WQ/pbdEqsWv6aBucgMpKQexN7GcIndEx+ZKpHV93OPxBDpxnTWBvO/SQ22bebqsMNKFPtSC2NViMr0dyiRd0mp5FaJsjZbo8iqnIcsPb5XHKe6vf0ITjOyXT6jk6O5H/+xKcBPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593039; c=relaxed/simple;
	bh=AQuSBUl4POx87aC0pz2dJ7RudtiNWawkc/IXHTTTSDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B1bGM4++SkBjQffkfUa/sSJ/h+/FPM8YjLVEg9IsN0fB4Y2F/T2/wi6u5tkeSkMujq0TjOoM0qS/uOPqqbs+A0ha5zBtXx6fwyOweuCAMxGTsQRV3q/Au9KomHoadt8pf8mgzD+6ZzqzQn2oOjFd8PBysQ2D6vNf/gS7/g8QiS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Y/HS4efw; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Y/HS4efw"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747fba9f962so292470b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749593037; x=1750197837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2HKAV4+QmX8qJ/5iVivDCfl+K8vVhwbVWIjZHILmwUw=;
        b=Y/HS4efwsydpSzsBiCpBA2XRLSTV9mK2bmDXxdkFjk2NZB61wWPNGdcM6NCpzm3WQ/
         +GhelhmUGq7+jN40iM8ReXhhhBCHP9hKMKhem6KM+07zJJCK0MVk1bEkm5mUCs/536HV
         /8n9oRhXPiToLvMPFEhnxHXmdLAgpDb+OV6G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593037; x=1750197837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2HKAV4+QmX8qJ/5iVivDCfl+K8vVhwbVWIjZHILmwUw=;
        b=hZb3wPHD/H3qZA8kkwYeALmMzTYCjqsjTIlGUftFNIjTx91A/0iX+JYfSizlB0gmNQ
         oRUingnJRXJesIqAguIGD1HQArxunZLr0XhnLzXFDys6jGoJyR3bRL+KN6vTO/PQTt2Z
         GAiwOctMZS/U8a6h/79nFKLeuuqtiDKEoSbTtxxP6syZZpkNBoXzz7PKsGj00EqJ6IIT
         jeYC0JDNAcb9IZNzcEikEXfUP5T6gf/Run2yT7B8abTdO4d6fItHrClsbDluT3Kej8yR
         pjQVlTWUmogs9b/96bEt3EkjPrY7dcaB7WRCiBaIRU/03C2jvGtYHhBsuCFAt0yEhh3Z
         XF7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgn0Ylhk+j+Z5tsjn8HPqqGdivzzshS9BBWfRX6TbijPbDj6tCAU4vsgFnrGHZIPy1UWRdGKVpaCIeF+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWosake/hx4TTIEER/bKbZjg8fyt6GIOBxUYfYJKfUgtu54kMW
	aULB/w8UUMUP4TfkssqgbtWTYFuu4YjECBY9L3IEfDyo6WhksAH3tGIIi56ugOE2BQ==
X-Gm-Gg: ASbGncteLm/M+s4gmB4crPDiGEmo7GgAca6hU1+Wg67I2ZZaEQPMPp3lmQ+3pk3RX+P
	7raw6fQeMSPKvUVh0oL5yoRh0Kz80BJ02nrz4Wl7odIcLmKwi1ova0odIDLHOEugR8DeJOz/GZp
	3zELVy69vN+s+LXbd0DmhoiHGj1Ej8cGr97/R1ItotLKEL0WPWg/2m1hBvYSKOhKJSWAhA1vXRH
	Jbae0BA1hspg/miAGoTcqznpd0ucfGJvw5NalyApP9WS1ttxSsgUHnQH9OLD7nVLZ0rr10Ltv6T
	YmSvl63HGTl2aICcS7uLbnGgfbRpcdKVE5OQMeIDPK6n7r12tUyulTn0BuBTGWMJJd0HO6yv/96
	CEHdHq+CIaBHdqtASRH7y6DCVVfck
X-Google-Smtp-Source: AGHT+IEIXuOZsMuSoYb7hNyiQAFPY8BACk5AsaFz6nHTA8M6q+uL6HODxkPFfsAfvjEVf9+iPCaqeA==
X-Received: by 2002:a05:6a00:2d26:b0:73d:fdd9:a55 with SMTP id d2e1a72fcca58-7486d351d34mr1345772b3a.8.1749593036803;
        Tue, 10 Jun 2025 15:03:56 -0700 (PDT)
Received: from [10.69.66.4] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083abcsm8220869b3a.92.2025.06.10.15.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 15:03:56 -0700 (PDT)
Message-ID: <5de9e799-bc01-4fa2-8b99-1e54c7007963@broadcom.com>
Date: Tue, 10 Jun 2025 15:03:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net: bcmasp: enable GRO software interrupt
 coalescing by default
To: Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:BROADCOM ASP 2.0 ETHERNET DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20250610173835.2244404-1-florian.fainelli@broadcom.com>
 <20250610173835.2244404-3-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20250610173835.2244404-3-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/10/25 10:38 AM, Florian Fainelli wrote:
> Utilize netdev_sw_irq_coalesce_default_on() to provide conservative
> default settings for GRO software interrupt coalescing.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Justin Chen <justin.chen@broadcom.com>
