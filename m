Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187902C324C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749135247; cv=none; b=iyGV3Zfr5Z8wZxqYwpHxnVFh/V4s8H8UXPQF3qx07oBQsf+OcyyH3APY4tOwfB+ljMffQ3DSlnbkgzeOVSanEcka+2785AEK8c5HpyQDANDh9E8iE32wA4oWWbJnLfsaNwu3R26qpA4Q8qCGq1Yz3IR0Xj8D2eTHpx2Pb1kNxV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749135247; c=relaxed/simple;
	bh=Qy50IhLDKhrnyURvva25pActo2wH9Pt+Qx7f6jYujx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MjmTuBL3215ZWndj8YqcOhTiZ7NZ6cNUf+Sa17ixY8WIeSPF1QLd8nfM0YT0HaNdvSD503yL/3eXEyghOXXdQi+HcZtjEdm2j1M1ygscpRvefUitC/0DqIKCNU4Z0w5kEGxzkmyjKtqUTgxd+HvSrIS9sm8iVxppCVfyOn2XMP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LGQlqjXO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LGQlqjXO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749135245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=c6pXh6VO6LTL/0PwCSpUGYoa+tE0rUrzmHXVe4uY+mA=;
	b=LGQlqjXOjg/+f4gsP92m/NEPboDHHCvuJId9skCeuWLNKNVmUn1lm5oWM1KcXfEcVMX7RB
	rKj/LV68MUECNJwDuCvTv2Bg7m2CB22S0ESjyXnv+jlcK7Pt1KLV0KtwdVAsJsSrMD1BZA
	9Te+1xGGZsARCMjdEeMv2xcVf+eXxec=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-aAfJ-O1fNYmsoESyAwmQug-1; Thu, 05 Jun 2025 10:54:04 -0400
X-MC-Unique: aAfJ-O1fNYmsoESyAwmQug-1
X-Mimecast-MFC-AGG-ID: aAfJ-O1fNYmsoESyAwmQug_1749135243
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4ff581df3so617920f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 07:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749135243; x=1749740043;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6pXh6VO6LTL/0PwCSpUGYoa+tE0rUrzmHXVe4uY+mA=;
        b=iA7/sv/3Tw451b9/tEUy1pYv6K0hFoLmwEutBiO9B8AbUgskVHB68nFl8AhP8Gq1sU
         aDg5P06JCVa85AJyzIXPAEAwTvlYQGyLFH2mR9Tpjhy/rIYYp9IbTrsLRMr8LqcfTUzb
         GwZND1Pf7C9BJ41nCdf3efGn+KFFKvwwig1N/dTOO15ioEeC0ONm2ZLcK7f3X3f2tcIN
         MpqjaqrirD3M2+c9nyHl1fskl2Y/lblO6AdpfJS3Y4gbsgwnQzaSS1jLVoNm1FNLRL5K
         LR8WKm/GyK/tb55hGmlLf2vRf7gt33/7f8X6vN0IMwYPxyYi26jgYbGFEYj4JmeBhrn9
         kWKA==
X-Forwarded-Encrypted: i=1; AJvYcCV4/ssyX5BqMXulS/238BDj12YD7XK6IQHoLA/5/FQJ4vV1ryPvvF9MPsNOqv1QnZammXKWGFJ2U8GUy2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaoQ41Q+70NfZLcXcaGoeVN/h9yGi6lut0HQhggqO7wcpIfC3x
	0DrE5BFgXQm9FPeJ2RODQEI6qvx4XtQCjtHji9xi1doxW0M0gVR6p7hXa6NJKg2BGcoLXBiJYu6
	WioLvw2LLVf+pZ1Llb05cIeDLTJNDY2yaorVyvu5c/rEa6ZvUbS2hinEKiHqB59Oxhg==
X-Gm-Gg: ASbGnctZnP5zfzcT+1NTLEv+RZn7M8ikipCTz7tj3ujgux25xrICZ2J0UtlSoWp+BEs
	dVzOCS6VlxTDXJbOughjF4JgHSmAHD9vjJSjkRCcLD7mL85brZIswuNYl7OVg4gstACvsIFRwsD
	pPdfk5Uy58F+VIL5FbREYGccvcb+RV3euyki+P6bbH1hQf1UYJaXd8tg/GysW1KaYiRioDgwYos
	Ngl1qpHbRw3yrW+EjjbzahXZuvBoOv0E+sNbBnoCBS6fVh3uv/JaQRMJcLPTCWpgJOqh56hb0rT
	hdLOt3/BvulPdz5E82LHJNB1Qbr6/T+VfZp1/0Kbb3HDztOh1NMrOcYh6nHcQkLI/VymSDwxLgV
	CDF+yROvR5cTNJRYo3KhbPpdwqHpTRSzAZOdf
X-Received: by 2002:a5d:588d:0:b0:3a3:7ba5:9a68 with SMTP id ffacd0b85a97d-3a526dfb97amr3289061f8f.18.1749135242777;
        Thu, 05 Jun 2025 07:54:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSDvK6EfZ7p5NifnCxlwU1uUwjGDPtWQvN2pw1B/ng0eu64TI7zcT6dUXpJ1h7iwTwaXSmJA==
X-Received: by 2002:a5d:588d:0:b0:3a3:7ba5:9a68 with SMTP id ffacd0b85a97d-3a526dfb97amr3289042f8f.18.1749135242426;
        Thu, 05 Jun 2025 07:54:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2? (p200300d82f27ec004f4d0d38ba979aa2.dip0.t-ipconnect.de. [2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a521c64d22sm4428681f8f.48.2025.06.05.07.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 07:54:02 -0700 (PDT)
Message-ID: <86386d5d-e4f2-4ef4-8483-adf198046d1b@redhat.com>
Date: Thu, 5 Jun 2025 16:54:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] mm,memory_hotplug: Remove
 status_change_nid_normal and update documentation
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250605142305.244465-1-osalvador@suse.de>
 <20250605142305.244465-3-osalvador@suse.de>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250605142305.244465-3-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.25 16:22, Oscar Salvador wrote:
> Now that the last user of status_change_nid_normal is gone, we can remove it.
> Update documentation accordingly.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> ---
>   Documentation/core-api/memory-hotplug.rst            |  3 ---
>   .../translations/zh_CN/core-api/memory-hotplug.rst   |  3 ---

I'm running into similar issues with CN-only doc, which I will happily 
let bitrot, because I will not learn a new language just so I can update 
documentation.

... I raised in the past that having CN doc in the tree is absurdly stupid.

In your case, likely removing the doc works.

>   include/linux/memory.h                               |  1 -
>   mm/memory_hotplug.c                                  | 12 ------------
>   4 files changed, 19 deletions(-)
> 

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

