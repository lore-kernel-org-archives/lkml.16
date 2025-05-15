Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298B31F463C;
	Thu, 15 May 2025 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320982; cv=none; b=TCVFagKirrN9Rs6OFEzR51IMGViCbn4gEvAMbgQFbkc6OCGfj4d3L1Bm9UuZfv+Mr5ZBbV9PL2g0Ds/NZVUXHjZqUZQ+DWpnNUbRl9Jrrhtao/vckF/Jdhsxp5FUgcZzgkiF/FAnDnXaSScbBN327/qmU92MZHCM/13ZjRxN9pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320982; c=relaxed/simple;
	bh=Qm0m/hotLW+VdK6WWoX74xsrInhbyz9pPd69ng1kBM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZsQw4QsqBftkUvI0tM9rxaBfCdaulsYVJ/o48R1lpF3oendQ0wig5SnhES4W3gG+o+dz2BmN9CLctdYZhmHkszyKfCwCXWQv8M+u+6ULUo6ODCzOR34VPsFq2h5NK5EEtk55e47jUlKjXDAhyr2VXXiIkYtMqM+iCTyvqLmII8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hspj6D5h; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hspj6D5h"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so12521705e9.3;
        Thu, 15 May 2025 07:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747320979; x=1747925779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i00DZSigj4HO3cEyoE/GqwcF01iYA3ZyYRpABBl2Q3E=;
        b=Hspj6D5h2YI5XjlnVbs2o4znmlFynLsMP/pm0LRZsvrz8ZtyMCOxrqvQAMrWpZ8gEo
         xDbaRJQlVjGnYh0i3Xl9dk0aCoJHKvdfULJhm1r63mFFaFZpUjV9cktjHBimc8ifQ3bL
         3J2vMV6fhTLaiS4PxnngdZ10efSNWsqIlSB9dLRK0++0STFOUpjWDxtino57Nk5SY7Mr
         q8CAX4ksx6iudhTyTJkgZomFlhgBszukA8tRfrknrtpZElwfjPvVuDRH9pyZ/69H8nMn
         +CCh61Kbl4ZqYGDKgBKA086UO0Uj/iwLSIkuYYXopZjuEfF/Qhn74lQFT3/OyomvQToY
         0r6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747320979; x=1747925779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i00DZSigj4HO3cEyoE/GqwcF01iYA3ZyYRpABBl2Q3E=;
        b=n2mWgnNLoH1/LkP3O+A4fV3+pjuirmdeRF02bAFUd0k1F8Cm94P42P1d+kc3X45ivO
         oHS79cRsKV2j6DRuk4nqpLVkNZ6tcXRKwXkA+IlBFaFtzqS529yD2QdfFahQ4K4/IgnU
         T/R3/C7epTFu3cmFindZ6nNx+X9N7joYXibQE+bCLjNye2PU/Rp27/qeypq4aji1AfYO
         6TLRoZ09uCFubJRhIcce1k4/R4AMeqgWBUDxy4zBMRO7g9t11NzU/11tstoGY8VvWGmW
         FCSSXS9jBGYQNEYVASnatcUIYs85s4zQ0GccWuFXhfRzlqG4WXgRA9YBkg78lPYzhKMd
         Oyhg==
X-Forwarded-Encrypted: i=1; AJvYcCWG8U/ZSSZbNAqxNoTjopIYVirEBBhxnrbGq0DsUQ5eVt0YMLMGdOuPRI8zMDx5riiMfhTb7JyBpXfqIpLs@vger.kernel.org, AJvYcCXhdYE0gB8ltJoox/iS13PdA2HM2S0Xv2ffA0Xk9R18ozUVicVfjKn4QWC/3O5eBThOGsIRCEabbus=@vger.kernel.org
X-Gm-Message-State: AOJu0YwanJAgvtRPB5BgcPUikvPBTDF3XNsjNgSCQIM9MRsSBq1HLVQ5
	Xzlw77x9iaq5ErQzIGz4ZD0HUBYBI0ABULnXztwiSOaccQVG8MIDTlan
X-Gm-Gg: ASbGncvI5lWxq+CV3AKVw9+fcuXkY1gxvnQenjZQCy8BFCjfdL4FQAjpL+eenwjwS8F
	mGS0+2mkJD1PmDsbI/THBABMiWlNDd7h1XRCWZZSnWxhJoh5NZdPY7iJTXOwN3dbNjW3y5bs0UX
	MgBDANnRmUzgMeoviviy14VSxbZzpraxLAtPZtNKrmj1i8jEl8Hw0yxxLNNUvkqYSCNhHUoI7tF
	nsSu3xliHNahtRgD3UyaCkVkbJXqyT0YOKUL7YQsQaTgWzdjCNRGYbA54r+u3tJxq6Z1KDBXQ/d
	wulrLjtLLwp+sTpI7z4mK+8cW2YFkGKmbtu9csZqAZOzVY9CXlWdcLQDlJt1M28GdCgAhRdCFi/
	oyW4pRXU60reZmvZehKU6q0COm4M+J62FseEn3kwTXZoKtFo=
X-Google-Smtp-Source: AGHT+IGhM2toVCyVqFIfoU5wU2HqYy+Ro6Hr5E+jedD8Qvx7CEfurv/u22tCaMeOjI9rTOnTUhf5wg==
X-Received: by 2002:a05:6000:438a:b0:39c:2669:d7f4 with SMTP id ffacd0b85a97d-3a35c845f15mr61588f8f.43.1747320979137;
        Thu, 15 May 2025 07:56:19 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:b211:ad00:1096:2c00:b223:9747? ([2a01:4b00:b211:ad00:1096:2c00:b223:9747])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a355e03404sm1734114f8f.40.2025.05.15.07.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 07:56:18 -0700 (PDT)
Message-ID: <47603579-4d42-4617-8386-6656341c8d56@gmail.com>
Date: Thu, 15 May 2025 15:56:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
To: David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <2d30bcce-6f80-468f-945d-b63eff726db5@redhat.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <2d30bcce-6f80-468f-945d-b63eff726db5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15/05/2025 15:44, David Hildenbrand wrote:
> On 15.05.25 16:40, Lorenzo Stoakes wrote:
>> Overall I feel this series should _DEFINITELY_ be an RFC. This is pretty
>> outlandish stuff and needs discussion.
>>
>> You're basically making it so /sys/kernel/mm/transparent_hugepage/enabled =
>> never is completely ignored and overridden.
> 
> I thought I made it very clear during earlier discussions that never means never.
> 

Yes never means never, this is only implementing your suggestion in the original series.
If the policy is set to never, hugepage_global_always and hugepage_global_enabled will
evaluate to false and we wont get a hugepage.

