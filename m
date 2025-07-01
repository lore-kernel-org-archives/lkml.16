Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F61826AD9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352140; cv=none; b=O+nu+h/aSNC6EenhIfUZatFuKd/joQ7vA99leXP2mKaci/HWk4M1d0fOCYdsd9W+mSFGO6J9IjukbKY07MOu2tnMRuEW119kgsPMDwSahfhgUnKnaaRJKR+v+BaD/i8LpHkFtTpxwwD0wbGrYvz8mB5PS3vrbqQGkPRq7h/cM24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352140; c=relaxed/simple;
	bh=K3Al7D1G7wePfIr0haOB5cZ0BREvvGzr3BvThBzFKuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZcwrlorWBELqVmL6LbmvfheFNY92SE/770SiLRkbGte+1PKv8H63cFwms+iXAOOBAe7QyotVh+d8UkC/b5ybx33+4vhn1hlKX/MnG5+oSlLp68QCfi9WTTvC3wrPyXeK2WXq3yDZQotXVrPQFJwiiIgCCtIdRyVLfdSFLEkMJ50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tet3ugo9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tet3ugo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751352138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nh2uVd7pRoUTCK6irPkfWlzRluxl2PTNeAPLCnx0f8I=;
	b=Tet3ugo9UlS1WJGm4LsW3g+HFDbcQpOWxsHKguD91f7ASiluLY04umERmV9EeOLxVpQQ9q
	R20u0dLQFiDxyRDoORk39PbYEGf669nP18Om3HYYNwXW6MGyezu3kvFy8hc8akPJCTdp8d
	O17Jh9g82wSH5UREIAbx2a+ppxWBzjQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-8NKMPyC1OrGJR3TZfkbtGQ-1; Tue, 01 Jul 2025 02:42:17 -0400
X-MC-Unique: 8NKMPyC1OrGJR3TZfkbtGQ-1
X-Mimecast-MFC-AGG-ID: 8NKMPyC1OrGJR3TZfkbtGQ_1751352136
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2354ba59eb6so48933335ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352134; x=1751956934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nh2uVd7pRoUTCK6irPkfWlzRluxl2PTNeAPLCnx0f8I=;
        b=btiIf7x61z4wUc28ijZie0F8qUP7GVgNWVSKwLMuIHQEGilDeePRG7WsfYkmYhNtUq
         6JEtXlmlsX7hmsWTZM33VHVK26Ug9w9OMnIBBpk8VaEvsJGvD0npbLEi6Iz0uyx4yo4W
         JXAr7+tt5zxnXy3GGHWiKl2VzXtq7sxJYIsCTJvdcB+OzVoJVY3RXyj422cjeRvC6Koz
         XKmKupcPRFCQSLfBu4XNDcKGK1CJSxNBJZJ5KPybVYmxh3mBxoofcy09FrUFDnWZlDde
         ck6znFrvXqgZtKISil/7Czkr7oLW64qaTcMuTYyleMKTLJTNKhywbzQ/F+HqfSshPOAv
         Jnfg==
X-Forwarded-Encrypted: i=1; AJvYcCUQhljdUeHUVSU1ykZ0AYS+YLXp9zky7S+oqF6wMgPq+Ro/iaCiWEwzkHf+fljiBPhBwdgwaLXR/x/KPSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiDRh1qrcMVGKEwAlohgB/W7Jp3v4JaV5LSbLDV8NMQkvvf935
	bFb7wMyFdstn0XrD1WRqBifCtFIK7y9se7EdNSuPajjWQl1TRJehXAeroZMXY3aKuzvZesS5sGp
	WAZ1Pt8a6sNCf380l6KVx4PleZ1DDbu/RspkJzRS36ZkCpmpWbeIQoAcdbnccOTgTEyfNX4+Avy
	pS
X-Gm-Gg: ASbGncv+RYMZkPSYNhlum4lhsFlwGtsKwsyGdDfHQPNpCC2QJRBxSKjKohNcLtNGIMt
	s2OVHYRtNDaVgUn7z0mBSXxgm/922QWNOrQtHSd23AkaT8Gk070xxvfwPUMLqgRnybr7g2YxizR
	N8IrQud877w3F/NbRQ6zem7o5DgY0NCjb6WkXbFI1ql1mTSuPuiO/alUHkjVFJZv6YSgfemsnpx
	yPZ+e4hjuN0lrq7hTyhzqahzfJuNjF8IzAQbWrrItXVzTAMZojN5dB0Ode2eNY5Gi3KZQ4aQ4yj
	83OVRmR/6yf++zVzXlGw82WWhO4UmSueeQYEut/dlsj5TfUvJ4BLIpS7ZOfShA==
X-Received: by 2002:a17:903:1aab:b0:235:eefe:68f4 with SMTP id d9443c01a7336-23ac46066bcmr278419875ad.29.1751352134047;
        Mon, 30 Jun 2025 23:42:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl2aE+m8eiWUtPLXKvS7q68VAQ4UGGYsv/Yl574znsMqgsWf8nwxSoY/4U5XcisW0xX3aQWQ==
X-Received: by 2002:a17:903:1aab:b0:235:eefe:68f4 with SMTP id d9443c01a7336-23ac46066bcmr278419475ad.29.1751352133719;
        Mon, 30 Jun 2025 23:42:13 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c689bsm97301335ad.224.2025.06.30.23.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 23:42:10 -0700 (PDT)
Message-ID: <5d520f90-f49d-4926-bc04-80979531aa11@redhat.com>
Date: Tue, 1 Jul 2025 16:42:01 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/43] KVM: arm64: Support timers in realm RECs
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-15-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250611104844.245235-15-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/25 8:48 PM, Steven Price wrote:
> The RMM keeps track of the timer while the realm REC is running, but on
> exit to the normal world KVM is responsible for handling the timers.
> 
> The RMM doesn't provide a mechanism to set the counter offset, so don't
> expose KVM_CAP_COUNTER_OFFSET for a realm VM.
> 
> A later patch adds the support for propagating the timer values from the
> exit data structure and calling kvm_realm_timers_update().
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Hide KVM_CAP_COUNTER_OFFSET for realm guests.
> ---
>   arch/arm64/kvm/arch_timer.c  | 48 +++++++++++++++++++++++++++++++++---
>   arch/arm64/kvm/arm.c         |  2 +-
>   include/kvm/arm_arch_timer.h |  2 ++
>   3 files changed, 47 insertions(+), 5 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

