Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C49342A96
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 08:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748938745; cv=none; b=gNXswUGksV8q2W24J4sp84a6PNeeoAeRwsrXUFBDxoSa1tT5ZZEn1SGPrNnKCws7+ZRbef0rIkpdovouPCISVaYC77CRLAzgK4UNpcr6UnsSi64R1htL5s2yJ/17+boY0+vMnYA2aYJXkRJ1rXxvR6EK2igsjoB+6QisuJDdar8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748938745; c=relaxed/simple;
	bh=OGlsd1kCiQhTkZBlgIak8v9rv+EKOwBMcl5ptB5aqr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkovHMBCh2O1nZ7P9va1H4xWerO4JX7SDPT+X7e5pzePJ/B+JpBbQ6oAnSzE8UFFXd76oE66UsiZtseJ+4z3FOZy2HMcvUsBOORk5aMuJtOtVjJifnYhWm0M2UbJkV5fBAo1d4vQMpSxlZlLF5nn7clliMcwHksVf9rPvlR9c1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XCXsKZt1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XCXsKZt1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748938742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OGlsd1kCiQhTkZBlgIak8v9rv+EKOwBMcl5ptB5aqr0=;
	b=XCXsKZt1Lq6jLLvp6UaDMxMc1AwY02JlfZRHt5BtP9RZZiOIPDHqEX6zJwgc0nEp73HZKB
	c0A1GBaFQ2nV6Y+asfxS8MSZXBqhttj7sdIEqrparNpbnN/UtIczoszEOZD7Iw5jsgFi9S
	tFhpq2iPfpn2SAt0P3+7bs8I826KjEA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-oXiUklXiMPOlqGniGcCt8g-1; Tue, 03 Jun 2025 04:19:01 -0400
X-MC-Unique: oXiUklXiMPOlqGniGcCt8g-1
X-Mimecast-MFC-AGG-ID: oXiUklXiMPOlqGniGcCt8g_1748938740
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so2391435f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 01:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748938740; x=1749543540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OGlsd1kCiQhTkZBlgIak8v9rv+EKOwBMcl5ptB5aqr0=;
        b=gWy7sgJDHo6R4SkMDC/KeXVbBAxDLu5eEuOqJFlogFofeH4BYIP4Y11F+c33qQ7XJ0
         oD59QMb+DiVP835Yfd2wMTYNiw6QJO039VVfXW5NMjkc97oN+RxKOkBZEVtiS2Sz176R
         yt2fHEtXMntjo6T/8dpebU2v9E9IL1R8XCDoBVSGVSax7ouJj8YlJK9yXaaiwbTWzoQB
         o2bmvzdIOVTwBS1lkPlDqRe4COXxLp/sX2F4r24RD1LpCXQgmAU8icjWgzbPG1f5C4r+
         C7VW7jxzySc6/cPymFO4XKqweyw+g9OfoiSsqv+6Hyu4cbVkNqwynwSRHC6fPIhrcUbh
         D9IA==
X-Forwarded-Encrypted: i=1; AJvYcCVfJq2jMIfqz0l5EmfJ8Gn200DwZH9KT3MrviHxpNzk0NANM2fW+0TCZ3/oI6JJq04qBpN2Eug4GPJwch8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcyTgxxIrQIp8TrUYe8qse64ejVeMTu9r4GE1D0KqkBz7E+u61
	R/uJrJ431oneLgh+PmgxtZFxeZU/BCupm1g8h8XVKjerL7QHgiGDRJ30JKQBAO/TW/kwtyDSn2k
	nLlR9I9ajtqmoc5jbj+A0+06O7uc3rjG1KI+b3iDtTxCs2U0lYHW/Fl68hzLmw5wsng==
X-Gm-Gg: ASbGncu+G6F2dsPWiMhZk8jFn77OzGQ/vwRX2/8gVdE7g3O/3Ct1xcLEjJ/z6HEMRwY
	DBpoPZP27JbuudMqvCV58Qr3G1kXwAsRkfrhKwBo7dqnAbGX2tSBzQSeAe8CMdw3Fzdzq6H9O6V
	quTKvROlOPT3u+rADkvMmQGWmbKKGd/JreOAgr1orO2w8uaelfRoN9Z3Zw88kyWZxYw0Ikb6nJm
	N/ELiF1POZOvuC0ROYKupvEuS4TfYR/7UVFSSvmE4vYdsdrLV9xzC8iaYRV8Dm+ZJSukfmPxvuZ
	8OIaF8fzEhPQbX2eQ1KYlwVeSAIRCa1mf5c7R3TO/CDZ9rG6qRUal/N1
X-Received: by 2002:a05:6000:230b:b0:3a4:ef47:99d0 with SMTP id ffacd0b85a97d-3a4f7a64251mr13220922f8f.27.1748938740220;
        Tue, 03 Jun 2025 01:19:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUfadbp/PLXy3tAU2yIoE7CN2SdcmUB1sLgD/yyO9/LHvTHncHp1k/sONJWjZJYXD98Egarg==
X-Received: by 2002:a05:6000:230b:b0:3a4:ef47:99d0 with SMTP id ffacd0b85a97d-3a4f7a64251mr13220896f8f.27.1748938739820;
        Tue, 03 Jun 2025 01:18:59 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cc2d:3210:4b21:7487:446:42ea? ([2a0d:3341:cc2d:3210:4b21:7487:446:42ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fc1a84sm154592205e9.35.2025.06.03.01.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 01:18:59 -0700 (PDT)
Message-ID: <440438c8-8cef-4114-9d5a-3a80faa5fcd2@redhat.com>
Date: Tue, 3 Jun 2025 10:18:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] macsec: MACsec SCI assignment for ES = 0
To: Carlos Fernandez <carlos.fernandez@technica-engineering.de>
Cc: Sabrina Dubroca <sd@queasysnail.net>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250529124455.2761783-1-carlos.fernandez@technica-engineering.de>
 <20250603080618.1727268-1-carlos.fernandez@technica-engineering.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250603080618.1727268-1-carlos.fernandez@technica-engineering.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/25 10:06 AM, Carlos Fernandez wrote:
> I'll ammend the patch and send it to net-next instead.

While at it:
- please include the changelog comprising a reference (URL) to the prior
discussion after the tag area and a '---' separator
- please include the patch revision in the subj prefix (v5 AFAICS)
- consider extracting the active sci lookup logic in a separate helper,
will probably simplify the code and will reduce the indentation.

Thanks,

Paolo

