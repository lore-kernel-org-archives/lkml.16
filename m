Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A65E3D69
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751247243; cv=none; b=mYPVrOc8343L/EX2bWJ4QP+NwtFDOjQKWNvCP1O2egxjWWuUz+XckkTUukyjCOBI8+x/OpXhGhMM1tHn+PSs9BT8n3xpwEc7efmbGG3+XnhjgXibxqb/v+lYYm421444+crBjKpCSuhHGx9foKEpONXAuFIyKvgO7nYdBQno7eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751247243; c=relaxed/simple;
	bh=6nAfLZx13Q1mwv8CbiWJljUl+G20BHIgCgzHvQKt4MA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t+gfcB5/AApwYEk57vvXlq7MoIYzFbrx2w6BSVbM6tfu8agomYxpuvQsTb3KmijPGMrHUmYSQiXJXzzB019HXiJZZNFTSbyIrM2K13ARms2OzV/bP3J/pyOi+tikcE0TIx+YVb6pZtmuQTcGpqRuEM8GtdC3Rp0EqvpC9oHnBsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oah/tWjH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oah/tWjH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751247239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iNWNGWaV1C7Rc5It4RVCgRxPXuXUM3HIwMrohqVBiKw=;
	b=Oah/tWjHgg8+uOJsRMcsYAgTQZAFXw3GwZqHm+0ITxttoRfUxMk4SQI8FHEZq2gExIAZPU
	v7M2CTeCWEH+0cMJWohUOpvQUrUydYoe3lCtrhwYa/lYxXbDGvChwvXxlu3659IwcSVOnM
	ljYjyx3Tnsr6s6ROGCXOcMi0wp7rb5M=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-wvDZwGCdPgGKzOOo0IRQ6g-1; Sun, 29 Jun 2025 21:33:58 -0400
X-MC-Unique: wvDZwGCdPgGKzOOo0IRQ6g-1
X-Mimecast-MFC-AGG-ID: wvDZwGCdPgGKzOOo0IRQ6g_1751247237
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235196dfc50so33102025ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 18:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751247237; x=1751852037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iNWNGWaV1C7Rc5It4RVCgRxPXuXUM3HIwMrohqVBiKw=;
        b=lPHcNi/GFdeQ1SanB00jdKWfhTmAD5VKRGyUFfNt5s3xuF1QXH0iN3v36qIbpJMene
         lxXaGCJgIVzuIEr98KKK9w++N5zbGJN5BZBqJBuW9ZWhYuCg4Aoz1dDQVjVldFRXxhw1
         BK3xS6PE8PKkyfxwtAkiF9+DgG99CnAmOAZQ6KPOGErG0uf1pS8T0kbnoQ1ciEPEzeI9
         /rdxfOQCDlll99YzYbtJQDBjBuaGdf5VlRM79DtRafphXCaGcrDuNbtMgN7taO6ae4Ul
         C3Kh+toftTzeSWYrJxm8iIHMkU+50jHVxoxQlf8PPcZEEqmjBP9IARdndh3UPTPmXh3e
         qaWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX39FUyZoDCPt0LV0n0H3/Lup7AkZIkWbA21Ox6i/r1ZygS3FvWSppRr6bnVkmGuDgBfragUSvzXkym25E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCGjOeTvGNp6+X9amsLQcBOVK36C2rXLbQfk/w5G1QW+2kWRHs
	Odo972zwjif5orcXyfxki1mK5ljxNzUKQn6nl3iTBx1izqOmSaad2cyztd/BwXge2yzh+WsuqJM
	73OxfHHwF486ehPyjWsy460WiMKn8ZGnytuyp+ghwIToCwUOMCWiXMrnWajbBfhOWqg==
X-Gm-Gg: ASbGnctx1QlSBSVNWyaCixTzED7zwlHNz/bh+2POo1vLUo4KcIyiKzkFkzqxDC0bp4T
	U9Eo9PAlQngkY2j4EpRTJZcwkutFJ2+mfd1WlbzTbglhqBRHs+NgVHq20sRl9ouOy7zYosfDO/c
	tFN+yly76oxfp+By2wprcUgI6s5q46dUrG/TvWEW8WRXpKo0F0exg18xwL0dT6sSZLk+jXhIZng
	fAcc0xdcvF3OW8QDfn+vI23cuHR9BF3XO7js4IWehmx6uVcUkcJQABr5hxY4KF0ZtTRu6ZhzYJ0
	mOizrZ9nRoz2NnVAunNTDKdbhO+YJoLUDIOnD+MKHzQnkwdWXKW8Llucf/u0pA==
X-Received: by 2002:a17:902:b786:b0:215:b1e3:c051 with SMTP id d9443c01a7336-23ac4ed658dmr113110225ad.11.1751247236943;
        Sun, 29 Jun 2025 18:33:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0UzeTes1Wws6mWimwk3D6DY1DWDUcvAN9WVyT3V3qmR+5QMOP2u9XGuIdy+7b5HGR6wUmhA==
X-Received: by 2002:a17:902:b786:b0:215:b1e3:c051 with SMTP id d9443c01a7336-23ac4ed658dmr113110035ad.11.1751247236581;
        Sun, 29 Jun 2025 18:33:56 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c4b23sm67946215ad.214.2025.06.29.18.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 18:33:55 -0700 (PDT)
Message-ID: <20f82d80-58a8-432e-8a9e-40196bbb6cda@redhat.com>
Date: Mon, 30 Jun 2025 11:33:50 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: realm: ioremap: Allow mapping memory as
 encrypted
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, sami.mujawar@arm.com,
 aneesh.kumar@kernel.org, steven.price@arm.com, linux-kernel@vger.kernel.org,
 sudeep.holla@arm.com
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
 <20250613111153.1548928-2-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250613111153.1548928-2-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/25 9:11 PM, Suzuki K Poulose wrote:
> For ioremap(), so far we only checked if it was a device (RIPAS_DEV) to choose
> an encrypted vs decrypted mapping. However, we may have firmware reserved memory
> regions exposed to the OS (e.g., EFI Coco Secret Securityfs, ACPI CCEL).
> We need to make sure that anything that is RIPAS_RAM (i.e., Guest
> protected memory with RMM guarantees) are also mapped as encrypted.
> 
> Rephrasing the above, anything that is not RIPAS_EMPTY is guaranteed to be
> protected by the RMM. Thus we choose encrypted mapping for anything that is not
> RIPAS_EMPTY. While at it, rename the helper function
> 
>    __arm64_is_protected_mmio => arm64_rsi_is_protected
> 
> to clearly indicate that this not an arm64 generic helper, but something to do
> with Realms.
> 
> Cc: Sami Mujawar <sami.mujawar@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/io.h  |  2 +-
>   arch/arm64/include/asm/rsi.h |  2 +-
>   arch/arm64/kernel/rsi.c      | 26 ++++++++++++++++++++++----
>   3 files changed, 24 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

