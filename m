Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBC570805
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 03:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746068777; cv=none; b=mDqn5d3+/23MF5BWpfsF4jx0VaR2tYDlbNIrLwS3JQj4j/SZUZwUeH6tTEhN7+mAEwqNWj1j6BTXFkvNLZlcnrhTcOOy9Tacv+X4PSfSgxs0gaIZubmdH3UEYWYfNgfgr/nLpYkRJn9UFc8sfJGU9EnBb3swH2GJWvar9B/Tnxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746068777; c=relaxed/simple;
	bh=X/XhkrFmWidZvhk9MnMyADxxQYnJ6LlWfI1v/DRQrcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLcwrhL6aI7dqKsRUcPQYbBIsNS/RdInstn0IVNY/PQ1GYehec5uyfW8KUiGJ0O97FgNlJPYZ0dRiqoBCL0gdJmDboT9bgq/KM2NGmU0nVz7MidOAiFya0YwwbJ4SZDSkPw27U692zZqtNEjOiWB9V9EQBJdaKvdoR2plG3l3sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h8qZTEyT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h8qZTEyT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBUyB0Q8zMsFcB5UcneuetEe4xDQ4aVw4JfTOnTTULU=;
	b=h8qZTEyTzTw+YYY8eslPvuH5rrC4cuty3NrDHRkshHBZBJBjUG7jD3bCtB1m0Aliqn1rrf
	5xyqgjAbf0ueyuOSAj4RHJr2rnI2Aiinv3Zq9aUs6IWGmMzvtfbE//qbyw1AhclVMw0Zid
	ZLcvkCni2fczSvp2ee5tOjwBNGC4pOM=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-d8_LgUopMbKE3h7E-b2wKA-1; Wed, 30 Apr 2025 23:06:13 -0400
X-MC-Unique: d8_LgUopMbKE3h7E-b2wKA-1
X-Mimecast-MFC-AGG-ID: d8_LgUopMbKE3h7E-b2wKA_1746068772
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7391d68617cso1609908b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 20:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068772; x=1746673572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBUyB0Q8zMsFcB5UcneuetEe4xDQ4aVw4JfTOnTTULU=;
        b=jxqEzOw+nJyxX+BcKDo0iZBEh9/e2qS+oHw/MTFV/F6xY6WNsR3o9iYiGtdz+hOXog
         GiE/ABvf835pnm1o+0vo690OnxL3tYUKMExkn+piFP06+mc1rAcD9D64ffO+B1romXir
         YCNE+kXIEHNQT1ITpNefmQUaVlydo5O3oYRQGA4SctgPNLziUbafFTvzaOB5lmV1aSGu
         lNEAyS09OiaUQbxvg17PuU6Cotm7Iw1VrIgrqTMKWLxKfboUnaLjspJekLBv+au3dQtu
         whpTxlHIbAKZ5tiFZQHEtDp2lAyiQJ/0IN2TQjqTTqsXXMJ2/oX7hUmgcR9sGNhEhNDe
         GH9w==
X-Forwarded-Encrypted: i=1; AJvYcCUkfglDVHMfEzQdCqeYKJF3qUZXhqA5qqNCTSUgycaszwKoTt2965VZMC/fdbmeG8yob3zw18aP3iUWqZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2gC+xdN5M01gx8Qm5+zUWhNHCL3hDMSf9dQ+7CHIzptey1Xng
	Znn/YFDyBIB1ZMpX+q3GHrmNhTXV4ZbRi+zZl0vMC1IrKHDFHtWovkQ+LIGpGFtmEE5oCiZZc4b
	Z3nvl9s5dRnxAYSxH74R+RZzjr6t7QePQpXn4Kz+R8UfG5XQJbN+eTExeeHq2EA==
X-Gm-Gg: ASbGncuaCGcYAdP3i4mtWQZ7a3zwYUwgT8kP9Z+TkjMe/c3fMOP5Z6JoFd2ltgiEmu9
	TOtiazwn2IyaQJjNOV5wurhmFa2UC8xuin8+g1o6dEn26EKFJrV/hoFa9DgbpN57It9uEbuujzZ
	iho9JOqChg0nkhJimVsSlbfsJ/tdpbydmZ6MrbloBLJCrJtY/zB2OfnhYX6A6NRyvMjNoN0pnlo
	8mByXJYY6PK9d0PF2GM40WQLQXLBH86LBVK+dq7y6tJuUaM9ONwe2rUcanz0pwL1PGeUT1jKSlo
	DjH72vLD6CBH
X-Received: by 2002:a05:6a00:35c8:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-7404927930fmr1444815b3a.0.1746068772426;
        Wed, 30 Apr 2025 20:06:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqFyaQqRxd5YG/d2aF2wgTwFAOyBR0cwvIicbDZqnls7TSQ0mJMT278uEe4KH0+EWzXzgDGQ==
X-Received: by 2002:a05:6a00:35c8:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-7404927930fmr1444772b3a.0.1746068772121;
        Wed, 30 Apr 2025 20:06:12 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a600a7sm2560107b3a.130.2025.04.30.20.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 20:06:11 -0700 (PDT)
Message-ID: <8a21a392-5ae6-4d55-905a-0956f48853ba@redhat.com>
Date: Thu, 1 May 2025 13:06:02 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 43/43] KVM: arm64: Allow activating realms
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
 <20250416134208.383984-44-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-44-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:42 PM, Steven Price wrote:
> Add the ioctl to activate a realm and set the static branch to enable
> access to the realm functionality if the RMM is detected.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/rme.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

