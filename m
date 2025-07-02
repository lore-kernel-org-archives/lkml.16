Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B425B182B7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 00:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751416926; cv=none; b=VvVzjNojB92lGA+IphT1biwKd7G4kuhyi5um8RY+DQqmL2D+4RMZrbt/6BdQZPqnkhEWpCtfBi0oTOlZFkCs0v30RSB51wrVF1ZYj10vDfX+L9ylmJqS9vw8OIa6T1Ya206lUwhKacrPg5yi9kx2WqCYwTxRopiRmjBsUFvb6jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751416926; c=relaxed/simple;
	bh=gQML4Nlb+6BLGU4vZy0wmRSFYntLR4PR2oVZTdDZp88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/ny0c0zr8AlwoCu+Mpg0xQIe+MNyIj9251FURUdgUmXprfcCQOqy7fnCEz7kTtUySGvjp8lJbjN2G1O7jVwz18ZDk9bE4Bo9WBi2tkHe0MsJT+qYD8lrWLcqOv0BhDrm4oZYTxNxFiahnZnjxQ/6aG88oeKIVUd5OldLgSWCsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LVr41hJl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LVr41hJl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751416923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IS6DmHZ/EPn9vNNwu1p5P0DKnu56R5jJnANztZV8U2U=;
	b=LVr41hJlXdHYqVf84FWe+ijCk9mCDfSr4AZbhs/QYypsT+mXRrpXP0/DUurCl1IxZ3AakU
	eC2hdOejEtH3CVAL/HVG7d5PBQMcTE4hp3iOGSzU05Dl6gIN1sG3Bjs3/N++A259pXNVsb
	7mqCAqdpmsOWpX5Ea7IzFb/kHMc8NmA=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-A82m2b3zOLq9P6sXZbXS2g-1; Tue, 01 Jul 2025 20:42:02 -0400
X-MC-Unique: A82m2b3zOLq9P6sXZbXS2g-1
X-Mimecast-MFC-AGG-ID: A82m2b3zOLq9P6sXZbXS2g_1751416922
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235196dfc50so54936295ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 17:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751416921; x=1752021721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IS6DmHZ/EPn9vNNwu1p5P0DKnu56R5jJnANztZV8U2U=;
        b=SacMPU/3T2t3aW8XKxrMbIdHpT22NDcS+99ou4Y/AA9ln1NIOHAUv+tsKoMctu7oqi
         6yQpkN2HLwz2Wp0l8ggozq7nEEyOvOwmt7++x5Fc76seVATAmOMyD33U+awniS2zmyZN
         XStXeguifYsgMDhUxyApnifj900OEoJERasLnwn7sfBIfuy4APXqiz+Opx65KlpQYa9c
         yzvp9G7rvc6sqs3p2SIZ6OYQgpXHMTfXbq5itFZePA4c+TizJfeDWCVwGE4EGx9tZyuG
         q8c326/BFmmaUFhB4QhzuVvaphRhmhujV6mtBd6fxiIrbafHhXNQBmq5XyThOrmZgYCM
         LkTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6KSr2/ZXie68M/uD7/qcWKJ+4hcFMWhXUzYodMd4TEgEanLH8jNmPo9deNs5lJC6T15twRjMYFigK0oc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSNS7Bn25ZeN6uPd4do+4koRvt0ii84Mw/4MQL7TxrRMkfucMo
	iA0SYjhZCCs/ueChSYQPBxbgq6kSVhARhkXZPxyVpkdAMr4sRQ39n+WslwFeVThAR/mddj928Cu
	Kaww5O52dLQMdECiwN+hkbgEmnu5KRc21zPTwSB6rHfhHgcrEgJM5SovFqSzETSmUBA==
X-Gm-Gg: ASbGnctnX3QnMceFEKVvSxWvKFgAluRqxjD1pXByaeiKg5dxYxo+R1WCR+LNXoY4Wux
	7dYQp4tcmTeIYs02IiQNJ9L05MFyxV7AajspNaXWA0VCaN9SSUkvbAa+RY7o7A+3lf+tgnPvHuj
	09b6SV9JKXSK23an6l/LBhBg9bfOVxd2il2IDaGO91i4hdelptQV9xdix/mbjusXpjcOEjHFgKM
	iefKc8VMDPjkR/xJZr/GToem2Cppzp02rk8oFtX7HM7N6e0g1cTy6flT9HBQ4jJhQjFTRRi2tFa
	g75ccsoen3lF6GMrbavOLl+TsCEqB2KmRIJves/WB8ojUkSxbZOlrn4hctJ/WA==
X-Received: by 2002:a17:902:e809:b0:21f:5063:d3ca with SMTP id d9443c01a7336-23c6e81e812mr10087965ad.16.1751416921637;
        Tue, 01 Jul 2025 17:42:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLaYwVOFkrc3uXeDo3lLBdt2ODjpAZgoQY+FVxCUbATRGn8q8nteuTtaLiNL9kfSpsCG8Ldw==
X-Received: by 2002:a17:902:e809:b0:21f:5063:d3ca with SMTP id d9443c01a7336-23c6e81e812mr10087595ad.16.1751416921150;
        Tue, 01 Jul 2025 17:42:01 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31c2252sm11480507a12.49.2025.07.01.17.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 17:42:00 -0700 (PDT)
Message-ID: <d092bb97-d552-49f2-ab93-bb2bd7809c3f@redhat.com>
Date: Wed, 2 Jul 2025 10:41:50 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/43] arm64: RME: Handle realm enter/exit
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
 <20250611104844.245235-17-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250611104844.245235-17-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/25 8:48 PM, Steven Price wrote:
> Entering a realm is done using a SMC call to the RMM. On exit the
> exit-codes need to be handled slightly differently to the normal KVM
> path so define our own functions for realm enter/exit and hook them
> in if the guest is a realm guest.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v8:
>   * Introduce kvm_rec_pre_enter() called before entering an atomic
>     section to handle operations that might require memory allocation
>     (specifically completing a RIPAS change introduced in a later patch).
>   * Updates to align with upstream changes to hpfar_el2 which now (ab)uses
>     HPFAR_EL2_NS as a valid flag.
>   * Fix exit reason when racing with PSCI shutdown to return
>     KVM_EXIT_SHUTDOWN rather than KVM_EXIT_UNKNOWN.
> Changes since v7:
>   * A return of 0 from kvm_handle_sys_reg() doesn't mean the register has
>     been read (although that can never happen in the current code). Tidy
>     up the condition to handle any future refactoring.
> Changes since v6:
>   * Use vcpu_err() rather than pr_err/kvm_err when there is an associated
>     vcpu to the error.
>   * Return -EFAULT for KVM_EXIT_MEMORY_FAULT as per the documentation for
>     this exit type.
>   * Split code handling a RIPAS change triggered by the guest to the
>     following patch.
> Changes since v5:
>   * For a RIPAS_CHANGE request from the guest perform the actual RIPAS
>     change on next entry rather than immediately on the exit. This allows
>     the VMM to 'reject' a RIPAS change by refusing to continue
>     scheduling.
> Changes since v4:
>   * Rename handle_rme_exit() to handle_rec_exit()
>   * Move the loop to copy registers into the REC enter structure from the
>     to rec_exit_handlers callbacks to kvm_rec_enter(). This fixes a bug
>     where the handler exits to user space and user space wants to modify
>     the GPRS.
>   * Some code rearrangement in rec_exit_ripas_change().
> Changes since v2:
>   * realm_set_ipa_state() now provides an output parameter for the
>     top_iap that was changed. Use this to signal the VMM with the correct
>     range that has been transitioned.
>   * Adapt to previous patch changes.
> ---
>   arch/arm64/include/asm/kvm_rme.h |   4 +
>   arch/arm64/kvm/Makefile          |   2 +-
>   arch/arm64/kvm/arm.c             |  22 +++-
>   arch/arm64/kvm/rme-exit.c        | 178 +++++++++++++++++++++++++++++++
>   arch/arm64/kvm/rme.c             |  38 +++++++
>   5 files changed, 239 insertions(+), 5 deletions(-)
>   create mode 100644 arch/arm64/kvm/rme-exit.c
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

