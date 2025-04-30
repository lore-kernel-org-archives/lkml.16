Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2197A1DE3C7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745992068; cv=none; b=pk9gD4+MvuhOThcYG2wdA+NuvSeSHI9Nswqmc6wxYSUdvKvn5yH/LlbpbWIk6G7u0PNGB5me7DTKumAQVPsZfzk5nMlvFCnHARs4WZwwkIFtWQopksEMUELgh0Q+3vHAYGH4wTZ9dGGfklQ4wzQwlRXGYbFWgvWQx0+NvXwuTm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745992068; c=relaxed/simple;
	bh=0Gj8CKa062ZMAoAEd5s2NoFzkcBqpVYig5/ML9jfLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z7NJBb9rXvnJW4rzYsYRNuXUm/K/ma/ZMAJz1pbLHpkIc+G3Cv7IrX+GXkxnQ3hLdrbah9aEfhuHeGEREer3NN0+X8P8PVwYYzbwPo5t7QPZ0KQLyqEaxHv8e2rMLzjp5AVBiftEuHTFQrlVy9hAolLr7q+i/SYahDOUeQ1am/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MZfcM14+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MZfcM14+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745992066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=979akrJcal7eXFEBBeKgkEGR2Z+cXNr2mNqqWnT1LPM=;
	b=MZfcM14+GevW7kuzA1pJWw9/A3EUlA+nBgsuuQbNk9HFI040FMneLMbQkg7DqQKCFpbtrj
	fn2FHI013qWjzsWq3/m9NsV9SNu+OBeeij+rNq49cgNfwtfkdx2cj+SORj0sduPIPebkK2
	3QqiqEeR0lyCC8E2kUtJF8PNISi/oHs=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-YuQJTzEHPFiKNHHALQp5JA-1; Wed, 30 Apr 2025 01:47:43 -0400
X-MC-Unique: YuQJTzEHPFiKNHHALQp5JA-1
X-Mimecast-MFC-AGG-ID: YuQJTzEHPFiKNHHALQp5JA_1745992062
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b16837f1874so3588504a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745992062; x=1746596862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=979akrJcal7eXFEBBeKgkEGR2Z+cXNr2mNqqWnT1LPM=;
        b=ND0lHiKKdFIArKSEC2OEbV8GubrtFEmyFSWLqctLkbd1hRKKiy3vHM/hEir87CJhr7
         BOLk0VAA3G3gPLgXJJ5ad8OxBGpHMjPFQ//kuc5KHyKW0iDfgCSlbfdTV1jAby1L9bTu
         0xvcjSMDsaOYydixE0wB1Gm/hL7x8TQyV+luW8/jWls3leKl+bAb7Z0ga5Jz+JvFvWO0
         n/Ru3TiOWn+LAmVXttHUlMe3JV9eDPpBNfNXX2v1MUG+462Nv39B5iOlH1gHWE0xqexr
         iM8PnAiOUnU9A0k6KSGST3bQ40uz5zHLkOCpTslKBa6ClvGTd1d0sNZJBv4+fTkLYzX1
         Fr4A==
X-Forwarded-Encrypted: i=1; AJvYcCVDBKOG42d45j7+Uc9ZlbGUxM3LS/kOh8bWshOOd74h8T5+6blXKvr6NfX0upMCtoRAnpXbkNz2FrJ7eyY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg4EpDKIt59HqrLlOQ7DWhGN7Jv5tKn9TBxRmaP3tH6yI6Zo2t
	VsM0r5D0dVB/Nk84b94w7VQIZVLsjcvGsOsXl2znwluxnopoSHQtvgLvKcDpMw/3tf9DS9cOW+C
	YXQUCLuyKk3JWj/hvUG4zzX4ZdgfKL3mVN8ZmGdhfrWkjoQ+Jf5JuhLm4PSJhJg==
X-Gm-Gg: ASbGnct5fW+aGvG5wv0UVTA0x9tImJas5X/eWeRjBsb1Nv6+LAGIiDlNBPOBfTodxJD
	x4dtoUnVXLGKVhRDT/MT/i+H6HAXUcH3xsqH/wJzT8DbZzxoBAhRE6JjG8GubUQB4MV9PtvRKt0
	aPOwNA/hqaDOtSRYIpNLECpldnDzAlcDRGoFvO+A2xWUPlfZzgDopZ79KEwUQbDNUh8a+YXlMIW
	/3iRKn56gKPH97nH339TN7yqCiBsg0yp4XyC3ygAR/Dr1/jY6ZBjHm7rqQLFETG6IvaOzshgT3D
	pdpEirfb9et8
X-Received: by 2002:a05:6a20:6f0a:b0:203:de5e:798c with SMTP id adf61e73a8af0-20a87758d04mr2491493637.18.1745992062572;
        Tue, 29 Apr 2025 22:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2yvTT56xhp4nevnnTnhdd5Vxurc2bkepUSfMbuUK1rX9UIiG+hWa401GgVAzKuOXYEii5qQ==
X-Received: by 2002:a05:6a20:6f0a:b0:203:de5e:798c with SMTP id adf61e73a8af0-20a87758d04mr2491475637.18.1745992062247;
        Tue, 29 Apr 2025 22:47:42 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a3100dsm787733b3a.90.2025.04.29.22.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 22:47:41 -0700 (PDT)
Message-ID: <9c998d71-0368-4f93-ab37-7933bec9b419@redhat.com>
Date: Wed, 30 Apr 2025 15:47:33 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/43] KVM: arm64: Allow passing machine type in KVM
 creation
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
 <20250416134208.383984-10-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-10-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:41 PM, Steven Price wrote:
> Previously machine type was used purely for specifying the physical
> address size of the guest. Reserve the higher bits to specify an ARM
> specific machine type and declare a new type 'KVM_VM_TYPE_ARM_REALM'
> used to create a realm guest.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Add some documentation explaining the new machine type.
> Changes since v6:
>   * Make the check for kvm_rme_is_available more visible and report an
>     error code of -EPERM (instead of -EINVAL) to make it explicit that
>     the kernel supports RME, but the platform doesn't.
> ---
>   Documentation/virt/kvm/api.rst | 16 ++++++++++++++--
>   arch/arm64/kvm/arm.c           | 15 +++++++++++++++
>   arch/arm64/kvm/mmu.c           |  3 ---
>   include/uapi/linux/kvm.h       | 19 +++++++++++++++----
>   4 files changed, 44 insertions(+), 9 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

