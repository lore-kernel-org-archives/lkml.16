Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE4B264A7C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593007; cv=none; b=ayharq9b0qrx3gW1zX5AbMpBHGm6YN8r/jFA29TLnjOKubfPoUSrDa7fDjLORLmUr2rlF6u3X4LO22ln014S0uej0DbyXTgHcom+qk3uI+r7PuHgxn4i1WkK/7TWEVMDqS/X3eYCNbR+LgEara8NiRPLUjBCeHW7KTsyjDdYMdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593007; c=relaxed/simple;
	bh=lAzkbZRsiYkiAFt594FQ0xW8AjZBW060MmReVLZSPEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=avkWqnwG+01x6QnEPAVQPKHSdy+iire46MJRJnuegyJmtmf0JCZ99jDytPmDzlnjFhl9hvsjDeXI1DT9CALzbXXmCzDF4BVpApmK4mipz6tlsn9juTORgL9EjMTveyjdC8cgK7K/dgZu9KCo6dlKr3iT6kOSx48bngR/Nptjkog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Q5FmwdCP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Q5FmwdCP"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-236377f00easo16846265ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749593005; x=1750197805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CiAybgJTvUHDDHI0zOr7gnQJrjAwYePwjmyhAIO9NUc=;
        b=Q5FmwdCPIB7iYeFN13TCbC1Nhv+q+y+Ccn3o54uV/9r00OOTtv9PPtiNPNSDTANKVi
         t00lgGZnwEjb9s8vFqwEtPVyeMASvnBvzTVsRjIeKxEI7vfgpkkIUm6vDs98bhhVk7rV
         vw/5IE0WUCBTBCWUeINqb1qXqpa4oOP3LST/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593005; x=1750197805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CiAybgJTvUHDDHI0zOr7gnQJrjAwYePwjmyhAIO9NUc=;
        b=kcxIlXEjgjjZNSxRAkyCiFood8ksSH82FoVsYxh66AF8ioJjLs9fkU72CpISk7QKbP
         afpBSY1D7aYe/gCQyHGsIuaMFXLUOfJ7+RS1BnxiG1PrG9XKPDYwnxkedzPVfrjZLUsi
         LQu3CzpC3KmqMOO16TcNfI4RkMBfvev/G+IqKwZrc2htLo/IstWSJzcWXA82hGwN9eHV
         itFYiRPmBkyRt7Uz2Vzz/ZD6cSHQTWcGSZqjDQsYdNW+d/wpNxUfSjoBTf439b41C+L5
         //o4IUR0dNxz7qmip8Szq33g3Gc1wnO+VTVvgqMILJH1Rk1N8lPJOphN+4dAT50haq8q
         hAnA==
X-Forwarded-Encrypted: i=1; AJvYcCUfRXkPPwyLDTn5nJDw1wo/bm8C9pHYuhIfuj+k2a+icEg3DoLHz/m0/iBxNo6gApIFs9Qc7bYBjQw4hjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvNzRhbQnkKtMdso/O4wS2FXWoff2juhiaOuHtkCcjUev1b44+
	w/KpN1lH1BD7+FIhvjOdkFX7q2o53WJtzTg49mYr90zArbO+cJbZ1sq5MALRCieKeA==
X-Gm-Gg: ASbGncsMu33Fxt9IsPlH5dHPNZBIDZu+XKBE+NMOF//OU/nTdBoEpoGkk74IGLk1xp3
	wt9nCSSZ3G3ZKYyFCMJ1qZATQuY1qb/Dm+B25Rg+oMdH25KFn5vRTgBz8QiBmNqvQy8AkbyTgrq
	1l+q4WTy+4un7YGR9JnLoA8WhG0sEj10MrYwQmf/v+KAzU4co076U1dDE38VVgxrvCun2nceHIZ
	voiq3uxjYtp2cSZ6glmvinzMDT7KnxrEa9pxVuApZG9qsYwo4VN8JWvyVj9lWwtQYCaNR83b5b1
	hhZCGHCI9eTatw9ieJXdZk/vL3SINRnkpO7L1uJ9RPO/0mTd36Mxg57ZhBmGohKrelmzghMVvwu
	8w+rWj3oAzcjXRVHC+C6dP3NqTmOVSLybq38gz9A=
X-Google-Smtp-Source: AGHT+IHTZUfe9NgQX4fBB9+qXz05x3tkcD4vBuXAHP7YeCeJw7eNzZ9CYK40gUkuN3RyfnzZ7PjnFw==
X-Received: by 2002:a17:903:41cf:b0:235:a9b:21e0 with SMTP id d9443c01a7336-2364255bc96mr6670475ad.0.1749593004825;
        Tue, 10 Jun 2025 15:03:24 -0700 (PDT)
Received: from [10.69.66.4] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034065edsm75206445ad.185.2025.06.10.15.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 15:03:24 -0700 (PDT)
Message-ID: <21c6abaf-b208-4cc0-874f-42bceed5c1b7@broadcom.com>
Date: Tue, 10 Jun 2025 15:03:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: bcmasp: Utilize napi_complete_done()
 return value
To: Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:BROADCOM ASP 2.0 ETHERNET DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20250610173835.2244404-1-florian.fainelli@broadcom.com>
 <20250610173835.2244404-2-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20250610173835.2244404-2-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/10/25 10:38 AM, Florian Fainelli wrote:
> Make use of the return value from napi_complete_done(). This allows
> users to use the gro_flush_timeout and napi_defer_hard_irqs sysfs
> attributes for configuring software interrupt coalescing.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Justin Chen <justin.chen@broadcom.com>

