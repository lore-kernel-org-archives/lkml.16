Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D867307482
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750781333; cv=none; b=KPOtooSw3Hd6xABG1myHn+onoDpT8DXtWRSMrF/v1j9O3WwLN78BMEcEPKhaYxLPqa1l6nOguwNnZ1dM8XiOQt3bxfmi0u660IasOmtMsUZICRXnmrSmsTv4rjnEwMAv4bH1EFMcK1WuGyVH2gTam36TsvKDSMatXnWwFReo390=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750781333; c=relaxed/simple;
	bh=FHd2sb7X1KnMiTkFvomFX2j5X/HR7YHKbCz5mptOfPw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tl8OPcRrSf8uhhemD/pBrnGVcqLRd4qz9Cu5tsU06eA/v3oKw5emYsW5e4XPVKS4GOlPBdhBB56mXXWlJvm89BFx/GkWpTQYhk+oMfhK/paW8smPUUUSCbugUWrLHbOJa47gbPtPvSD+9nSrAJ2gFi5Ncy6g2aYP9BTdmBVVuWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=GsWpsWZz; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="GsWpsWZz"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ade30256175so983339366b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1750781329; x=1751386129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WY8CeVnLl9pE8ZwyaPrNepgc1WZAVINyiA3X1eItW5M=;
        b=GsWpsWZzs69Pg70rgj9TLuZlOZ3ig2AY9sBVJlb7hOEdieQbd4/v7pR5StqALdhIJ6
         4UZk8ZLth3+dkZ2yTpt1ud5QcyPmPsuILunOvirqf6S/ck3KpnTlfSazcyQ2owpuS66h
         XWiWQcY6nq5iiN+krn1lenxSYKME6UFuAFQNSUPkm4dG7Zj3rp9jKry6qi9GHOnx++Fe
         SJQ0+ZviDTqLkCQ/CiVntToIKc18L1p6mi8ZUHLn7xEZicQL/MB9I8hzT7+OWs2Uge5d
         BAZC2cQAdsCwPRkeMu2/+Lcns5FuIqUAgMuGqXQc4wqpWp4UY6tpqzC+aABk9355TAsk
         cYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781329; x=1751386129;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WY8CeVnLl9pE8ZwyaPrNepgc1WZAVINyiA3X1eItW5M=;
        b=XQ3PX7bKTJpCCXz+gAD2+ODBPXkSdDXYFIOzd2QPZihu3DqA6oCIN6Z3AhrxR23kuF
         1gccSyKOyErNjfzdvPa8q0jSiW0Kp5kcTE+B+lXuA9LYI6lqvflSApGlgokhzv56EKMB
         pLnR2NO6gdVKN7o05Lw7HlI7m8FP7tW/2MfFHBwYM4TxNZVsK+vVove/GdOjcefpFh3B
         0PkaJroNsURnbIkTJROyzPPsXc/7JbzlyjjxkKM31a4asoLtLXFRMrROEg1vhEIVeTi9
         iqmbOOLAOC/nuN9rvXyBr8qJbVEoLYIYMpBSKHPmm1PC2ppXLfVDS92XwEsQjZ2V6eBl
         6GEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9fdmUPYZQF6Ghuc1ppPQ4O8ikjpOanyGixiNdWhY0Ok3D1Tt54URJwyZX0N+wvrpJNl7ABjv31y1TvdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYvrpO1sdnVkvHWIzjrsDhjnLBdUQtTSHLiRbkgra1HOcHMEyA
	uVNhREjfV3Gypd0urxWNDFY0sJf7zgJI0NuaP/gKSnmnXxXi6Drp+iPAQ/abrCrLCw==
X-Gm-Gg: ASbGncvlxY5YUlXfprp+CrSxfV/Z7c3sU2qWuC6zBIuci3jnv4kkgTKnxaXkZ/IglJd
	yr2pU0FTBRTt8CCti8yOy9dVVFSYj0YuBpeRCzOQ00d119Yz6tLOnbIqrcDcwsDF2WouYuGCcMN
	fzjS/S8zePwlWFW9NEJMxY2JDGAzL3ETV1M+69dW4rx5k9YlijZWhYpb3qUl9Vu+zLHv8WxGP0B
	ZsBgLJ+V+ywiHTEVoCW+LrSip42ObFcr84zVm1RYnLTrA04Q2DHTIHb8cU7DWXFg3YC1FVf9V0K
	S155r0Hr3XWB5yBc8snbi3wu0QWvC8hLY9ZrVAyYwyRq/t72Fh7I4G0B65gmEAsR
X-Google-Smtp-Source: AGHT+IH2pH0T6i3mZs7TAt1UWsCRfOAa+jl9+T0R72UNW3AbWhpd89UJ/JuJJF5f5GKRJDyujV2Y+w==
X-Received: by 2002:a17:907:9809:b0:ad8:9c97:c2eb with SMTP id a640c23a62f3a-ae0579c1161mr1750959466b.19.1750781328829;
        Tue, 24 Jun 2025 09:08:48 -0700 (PDT)
Received: from [192.168.0.114] ([91.196.212.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e7f949sm896228366b.34.2025.06.24.09.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 09:08:48 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <b4a3ddf4-c03f-426d-868a-f6e75cda179a@jacekk.info>
Date: Tue, 24 Jun 2025 18:08:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] e1000e: ignore factory-default checksum value on
 TGP platform
To: Simon Horman <horms@kernel.org>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <fe064a2c-31d6-4671-ba30-198d121782d0@jacekk.info>
 <b7856437-2c74-4e01-affa-3bbc57ce6c51@jacekk.info>
 <20250624095313.GB8266@horms.kernel.org>
 <cca5cdd3-79b3-483d-9967-8a134dd23219@jacekk.info>
 <20250624160304.GB5265@horms.kernel.org>
Content-Language: en-US
In-Reply-To: <20250624160304.GB5265@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>>> +	if (hw->mac.type == e1000_pch_tgp && checksum == 
>>>> (u16)NVM_SUM_FACTORY_DEFAULT) {
>>> 
>>> I see that a similar cast is applied to NVM_SUM. But why? If 
>>> it's not necessary then I would advocate dropping it.
>> 
>> It's like that since the beginning of git history, tracing back to
>> e1000(...)
>> 
>> I'd really prefer to keep it as-is here for a moment, since 
>> similar constructs are not only here, and then clean them up 
>> separately.
> 
> Ok. But can we look into cleaning this up as a follow-up?

Sure, I'll prepare the patch and send it once this series is applied.

-- 
Best regards,
   Jacek Kowalski
