Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EDE43AB7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745991744; cv=none; b=Ezprrx+qDsCOf8Y9c9m7vTC20NbVdJUeyr31rdLQ1Zjm2M+fsQglloSfPcm8MoheGja26hJC1AfJZDQCuiWA03QOpgzR158RLrXAd2fdUd7Od5hJ8vUDIzkHsP13nOZd/WX37cVu7TYksFMH6N4JZgwPFb/hy8/Y6H4wlb/cZfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745991744; c=relaxed/simple;
	bh=kQ/EbrrxqEhr5fwZayWRqCdok/5KGxi81DpciRkA6xY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+wQgwCh3e6yqInYl3AITP/a4Ix+HHh3aJsHMr703cSsP8bp6qctRitdbkrCpPzSZKsgmjtUPo603NsumbP7KnBg7spLX9bVjKTrhqSgPFf6QNNJWnGGh5kmeD/N18Fz3O72PEdc1cNo7+dYIKtDKGcSiwhPoyD/Sq0mWAqNolU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b3fS+7XQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b3fS+7XQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745991742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7I5yDc+vjNEcqE9R+YmZ5CGoORcg69x/77QunGRnchU=;
	b=b3fS+7XQbxWhi6tAPv6STZv8CgwJ8wfpHCn1Xk5Q0s6PrH5YHkRlvjQePn8P6mKIQpp7y8
	TpAEScS3P1r/mHXUOGRBGhKtmADEeF9bezrZaNToCZi8zMQHZJtAbV49+lhhd2mO1NBjSG
	UNUM3SzSp/9heJRK4RWOUT0xE8W60BU=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-N_b-yZkIOXmqqmDMQX5dbg-1; Wed, 30 Apr 2025 01:42:20 -0400
X-MC-Unique: N_b-yZkIOXmqqmDMQX5dbg-1
X-Mimecast-MFC-AGG-ID: N_b-yZkIOXmqqmDMQX5dbg_1745991739
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3011bee1751so5976171a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745991739; x=1746596539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7I5yDc+vjNEcqE9R+YmZ5CGoORcg69x/77QunGRnchU=;
        b=ib7HlNNK43wRo2QNggQPvE5Jl44YscXv6PAg1IDryAURsprdZVhfAaCh/c1ium2G2o
         lnj7uiOL2z2DW55IRfTHPL6kWjpBsUh2fO8WZMZRAYqJaKgc2msV3YkMJhVp+9iwL32X
         Fb7H+mIAvuiC3FsrOyCr9a6KqwdnIlUrSxzpRDc+3yoAkZNfiNjDFNzVqyPNElux/C+s
         RQUO0GPF1j/zcnH9E1WRhabNBbNJOtESQfRXWJfaeX589MF85RBvaCuUFTB8DIUXVSlk
         WgdeJukdmxsF+D1beEAyiHEvjqf2d9Vv2ksZPykG00ZcqM7nB9RIbsAv8AkIfLwYl/GZ
         IIhw==
X-Forwarded-Encrypted: i=1; AJvYcCW1+kozBEB1kGaaa2z5OZkFsX7ikL2OGVjSpI1//46mLnSMpQookxIUY+8KUgeVUjEvO+P6Myc5Qv/wQA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEVFiQwCcnv6Fy6dhQISeksZ/ka0jdHnZsYVSorIb0LsO0RGs6
	FvduEizbVTRxoxGT2doQbRH/JAgyFoxRKrvxQgVuYTloe+y1bv3a6WlQSY1Sy3yRCB08Crq0Qa8
	GPvGyYaJvTDU3ZQkPpj0xXfk3dDpXARDPRf+cP+fAOGMd9leS3R1aWWvoDQKHdQ==
X-Gm-Gg: ASbGnctNXfF4BY/h437puFXEPHgFgHnxYkWp5PvTXQrsYWaH4Vf8c+4bQeGYt8RQ21E
	QZXxIHaOSkDvMDSCXqCaklg7WyXqWGkI3laNnIdtljT5jrdciRy5im49WIvSYoF3wmSZaRfTGVR
	tvHsdLj7Q82fGtqwh+cGbN+NLAHRqQjilLnBu9N1zrCI7OXv+s6IVqNVj0Tru5zNs19tFkW4QEu
	J1HMUEiwZfqNpYVfUvET8omlQcGJCokdDsF7QdaFEtNtKc4RC0n6EZU/vRiO8Wa0KfUt0uNtAhJ
	71vgVfMR4L58
X-Received: by 2002:a17:90b:3d84:b0:309:f5c6:4c5c with SMTP id 98e67ed59e1d1-30a34450c14mr2039777a91.25.1745991739020;
        Tue, 29 Apr 2025 22:42:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/2rRziMqV7exhtrwhKlwQtmufkCV9nFsAwejZ6czk2oG8bIJh878e13vez0tndZIUCamZFg==
X-Received: by 2002:a17:90b:3d84:b0:309:f5c6:4c5c with SMTP id 98e67ed59e1d1-30a34450c14mr2039752a91.25.1745991738750;
        Tue, 29 Apr 2025 22:42:18 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a60882sm624669a91.45.2025.04.29.22.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 22:42:18 -0700 (PDT)
Message-ID: <a045f5a3-d637-45b0-b109-394e8ad0f409@redhat.com>
Date: Wed, 30 Apr 2025 15:42:09 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/43] kvm: arm64: Don't expose debug capabilities for
 realm guests
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-9-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-9-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:41 PM, Steven Price wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> RMM v1.0 provides no mechanism for the host to perform debug operations
> on the guest. So don't expose KVM_CAP_SET_GUEST_DEBUG and report 0
> breakpoints and 0 watch points.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Remove the helper functions and inline the kvm_is_realm() check with
>     a ternary operator.
>   * Rewrite the commit message to explain this patch.
> ---
>   arch/arm64/kvm/arm.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

