Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938FA1EEA5A
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 02:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746068114; cv=none; b=mm8hdOte6jX7UerBtOF1G+tDS29fa8ed3JwEwzhqjkd6r2MtS5jiStK5+HVianfFDrFaVObyfWBdQLk8fNOeEK2UC0xjARQQytd8oVTnkoFEsbPCW9/CKfIdxxW3cdHy1dj8vS25ENJmiKSQ39SV8NgB/o09mPqXF4e/9HiYdDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746068114; c=relaxed/simple;
	bh=E58/Ir3nEphDsEt/8roe/A0l6EH+/+K6JbtT6e73W70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XREKB6DVZlKDuafJcNosVIGRw+uxyOWZiWZM26T3Ih/aHuHO0wHUB2/Hpna2TaRdHbaeu+m4blcaifuOyc9LrDdj8R2HGOdcAPBpkRb+s3sSOg6kB4Pp1zJ8sZFDJZaJWFJh9fqbSKLAr7kc0/a5v0T91NkHYUFC4FVlDnZOAwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LgKxJBlV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LgKxJBlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O0f0P0r46I4wQ1N14Wr4dQIPr/ky0+9o8c+Aikg6Uic=;
	b=LgKxJBlVJEzOSMcyBt3gOG1eYBY3oWbjf9b55cBqgfly6gqec6XPDppZ8GOB62fA4i2i2j
	maqRDc9tjcD/ejF8TI7KSUHD/J4ThTHpWrgogK/2AqEkBSc6FfRUtHgXARXXOqEHBd4f09
	eQ4n6x+hLhw4218IbC9PWyAl4cf4h+A=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-Y01ElmUSOqy60Mi7jY0Cng-1; Wed, 30 Apr 2025 22:55:09 -0400
X-MC-Unique: Y01ElmUSOqy60Mi7jY0Cng-1
X-Mimecast-MFC-AGG-ID: Y01ElmUSOqy60Mi7jY0Cng_1746068109
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-739764217ecso526335b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 19:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068109; x=1746672909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0f0P0r46I4wQ1N14Wr4dQIPr/ky0+9o8c+Aikg6Uic=;
        b=e8Y32VitDDzcinOMnTIqv59W5p+Uzbk/jmOUZp5RvhldpWEzbmE8lvzhjSfsIbdPY4
         dTvosugujdFY76tFxN8FsXvLZOGb6Je5o/O2LHlGF4bVYXyM10dwUayEWhr33mKQxmst
         GpNRSxgX2ItaWUfBh1t1nOKBV2etbLxSnYOzPZ6ZchL2JRv86xNeITcM6sqDINa50npf
         LCs3w+Zh061jq7gqHPMLJJEDZreQYRQFlz16FcYZO6DalR+4Ke5O4ZarZYJg9K7T3ayR
         UjhA5OfMSIcpT1mLG4uP7HWqicjXI5tFJ+iMxvi+BqeB4vafg5eviMCLJZti++e21AXj
         WahQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg7psvv2vUX01DvDFrYM8GdsN7KjB1FtCGJtLArHuX2072E2Z+lqHrELOmHoFiiOaqyoL6zgRgYEyFbzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS2mepZARk4oGfZkX7dvFOax1B2ek0iVKt6PBAEmiLu0okyN2E
	nka7fCX6AsSNz9H7n3RSs7WnQyM7a9+3B+AQjpjdZMlPSYWi4wqrVUETBk4uZVbdToMlZl+TExv
	slKIvXzpuP0bvOzhp+HtMFpeNQ+CjAtkVcK823agRJ0X1bEG3OF3EsRCP1XxQjw==
X-Gm-Gg: ASbGncvR8h1tVk8JhhBhtNWbM/KBeid3CfpxM8GM1WDmJq2dMxTjSN5cTTOnuqRvY/L
	tdEdZtCw/vHHoWGKnIGzhOIWu8++v/XN+IamMsJZtRHVF1gEieNpzBaMTCtsV+/NvN3loGVWhae
	rHBgBuHGUPhuwsogvI6eA+H5w+/kzFl2F3+IkeDIMKhFUK/Q1t2tNwnf2rs5cJlcWDAK9RoVg8J
	JWPSm8F2wfRxSAB53sYQpcs5NshZFxyubNAJh4pgaMSvKngpW9vpFU6hSClYdtLvdotWvg9DzDI
	0eUZ7RWlXxWx
X-Received: by 2002:a05:6a00:35c8:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-7404927930fmr1396633b3a.0.1746068108745;
        Wed, 30 Apr 2025 19:55:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFylzKnp6diohi3udmCDZ47tP/kvpo9wyUKWLV/9Fl+cS6PnVhqYmglGK+RzeWLQDfWNo9YJQ==
X-Received: by 2002:a05:6a00:35c8:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-7404927930fmr1396611b3a.0.1746068108438;
        Wed, 30 Apr 2025 19:55:08 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a60016sm2536538b3a.133.2025.04.30.19.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 19:55:07 -0700 (PDT)
Message-ID: <770205d5-8c08-497d-b862-1be4852ae665@redhat.com>
Date: Thu, 1 May 2025 12:54:59 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 22/43] KVM: arm64: Validate register access for a Realm
 VM
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-23-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-23-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:41 PM, Steven Price wrote:
> The RMM only allows setting the GPRS (x0-x30) and PC for a realm
> guest. Check this in kvm_arm_set_reg() so that the VMM can receive a
> suitable error return if other registers are written to.
> 
> The RMM makes similar restrictions for reading of the guest's registers
> (this is *confidential* compute after all), however we don't impose the
> restriction here. This allows the VMM to read (stale) values from the
> registers which might be useful to read back the initial values even if
> the RMM doesn't provide the latest version. For migration of a realm VM,
> a new interface will be needed so that the VMM can receive an
> (encrypted) blob of the VM's state.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v5:
>   * Upper GPRS can be set as part of a HOST_CALL return, so fix up the
>     test to allow them.
> ---
>   arch/arm64/kvm/guest.c | 40 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

