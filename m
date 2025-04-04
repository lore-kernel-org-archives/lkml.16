Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDB01BD03F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759839; cv=none; b=g4hK7UsxAuxBXsvQFfKH1l88DcgekKxQLDHt6nciAQv96SOeibZj6OROvRS2yF9qV0WJnX6i/GRzkkMAYdPmeh2XKsKNUg58GTzXOPajtZ73yK06fHZbCEptnD13VQa6IS51mK6rM4U/rYZH5Thw3yCztFB7HD26LkqkwrQz3Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759839; c=relaxed/simple;
	bh=gs6BYFKPAuzF3jSpGA/1o8oE0e3axYaV/4bz7oTP6R0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwuFeSl6ydF4UPSuGqh/Kt/qM8t9s/rYjdbBmyxrb0M6lkyQEd28sT3LgP6i6opFTywVV9nT3RE1Hxw8jq1/5sv87kn9wScmOPpyd6lpnozYLliyOuFNLhy37zpyaWu5vnax+G7VumfjJzxfaP2cLoYqU+4DztOiwecGck/UxJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IbB7VJ41; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IbB7VJ41"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743759836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5LaF4fLKdOoeQDKaY7hXS1quRtfkLxfRHiyT+rlQy2g=;
	b=IbB7VJ41ZKAy5ppVbscEpCUL/zEUvSMcmqbylldhvexuUo87I1GYzuZ4aPNw2ROexMGNYv
	cJ6S89+8PgjJQmBIe+DTNTYcplqyaRNJE3RnBhJ77hTw00B78Mful48UkUw6QWx3KvNvlX
	U3C16VTyR2z5x+LuHmEfssS8RV1UBRs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-r4WowEdyPG6o4E6XIw4xOg-1; Fri, 04 Apr 2025 05:43:55 -0400
X-MC-Unique: r4WowEdyPG6o4E6XIw4xOg-1
X-Mimecast-MFC-AGG-ID: r4WowEdyPG6o4E6XIw4xOg_1743759834
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22412127fd7so13614915ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 02:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743759834; x=1744364634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5LaF4fLKdOoeQDKaY7hXS1quRtfkLxfRHiyT+rlQy2g=;
        b=Iq7K//sm73NKO/YtXeGYXsgwgpbQJIiyQBT1m2ZytKn1TNWQac2lilZjeNPrVfmmG1
         Gmg/Djx/8bFkg287SSy5Z8iOZi1eYo1pXBD+0efob2RTYn2CpL6xrcyqGeX+dPWHM/Oq
         ZDmmL41KrYPXHUaqIItcYoyzYBdGbwm3lCKvEJq27GT8EOtODqK3QdXC+NKTneamC0Be
         XIHvi1lbDTpbIcFs/QQWZPm5QwPyjlUmEJJq0za+wzf641ujWaQq88jofDCHCE6/vOQh
         1DOfztyTTDHIAH59Aa0qFMSOJucOZqpA5vFIs6JAU7iqkwBDh0LZ+dYlBPXG6oK01p0I
         1ePQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6T3YSiI1mz3WvnZrN0itiJZES/AUHfQucI4p62xYQnTHaCSCz0MTi/43llVVKiiw2rqqPtwu/bdBDruI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWznegLdnlujgGlXDi8Z44QseK3Ezqis+Ra7f3Y+uiqC38HaBS
	le8kC8Jj7JgUP0kgcjKNA2fNinAEuS6+8CyOHwosoVCkYUufhDsoZuAfdiOqPqbY7UOSplSzYI4
	Dp4aYXKXZt6pfvAPdvOOP91YOh+oy7MfzHVrFIpnFIvUklZFjq5WXWbAQWalHmA==
X-Gm-Gg: ASbGncsPFuXQJqhgrf482OhIirP/xHEIYPQig/6qJP1vanrppXif2MUsN3g4s3frp2r
	wRAeZwVxutALSqZd/zy49Kt/jKvIr1YeYlhNMa17MYyZLJt33JmzXwwyzCdelIVSqtMHURk3Qqf
	dU+GKY9APQU5flQB7nXy833vydZtpq6w3+mN7RLZJqAP+gqSutPH2dlSrMJfvLNeTryddUAOES4
	j2fAW0ZywdS/alo1xWm5LYF+FyXL3N02dz1z3Ur4Nkk4lMo+TZY1ddjvEHvGG0UkGg0bgicxwhX
	8YfhDxEMl2sPdGO4
X-Received: by 2002:a17:903:984:b0:224:26f2:97d7 with SMTP id d9443c01a7336-22a8a858c08mr28139085ad.8.1743759834305;
        Fri, 04 Apr 2025 02:43:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUx0Z6zWUCBv1/NMM1+pM2iQHnpatpXR0YFs7rxLdYZ2x3JRlrJOf72BDecGIzF3n/Ror1Lw==
X-Received: by 2002:a17:903:984:b0:224:26f2:97d7 with SMTP id d9443c01a7336-22a8a858c08mr28138985ad.8.1743759834002;
        Fri, 04 Apr 2025 02:43:54 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c016asm28098675ad.62.2025.04.04.02.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 02:43:53 -0700 (PDT)
Message-ID: <77ab4f8c-4c5c-456f-a108-153a49dedcbe@redhat.com>
Date: Fri, 4 Apr 2025 19:43:45 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: rppt@kernel.org, steven.price@arm.com, suzuki.poulose@arm.com,
 tianyaxiong@kylinos.cn, ardb@kernel.org, david@redhat.com,
 ryan.roberts@arm.com, urezki@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250403052844.61818-1-dev.jain@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250403052844.61818-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/25 3:28 PM, Dev Jain wrote:
> arm64 uses apply_to_page_range to change permissions for kernel vmalloc mappings,
> which does not support changing permissions for block mappings. This function
> will change permissions until it encounters a block mapping, and will bail
> out with a warning. Since there are no reports of this triggering, it
> implies that there are currently no cases of code doing a vmalloc_huge()
> followed by partial permission change. But this is a footgun waiting to
> go off, so let's detect it early and avoid the possibility of permissions
> in an intermediate state. So,  explicitly disallow changing permissions
> for VM_ALLOW_HUGE_VMAP mappings.
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> v1->v2:
>   - Improve changelog, keep mention of page mappings in comment
> 
>   arch/arm64/mm/pageattr.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

