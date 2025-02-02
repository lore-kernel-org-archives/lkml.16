Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73C91D5159
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 07:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738480385; cv=none; b=VK7DRSuAD5eXMbZDDee7r6J08WMOwT9pnY4F1QSrl3ZJ967cMpX6AjjcMuJRfJtAJx5eXypTPKD2d238kjG64Q2zL6Tv9/QySXysE1KMVI1BL/wz9ebVawXxpY9PET3Jx6rQhKchtmDmViITH5zYQ0lYc2m2o46aNmxsLTOaKgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738480385; c=relaxed/simple;
	bh=CXPd9+3PCf0ABtxW27kGa+FmX6LrCMM7KEngRhxn1qQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDrGn2oPi1ICpw2lkVlXVvlNgze2ncQJkElxXt6Xr/sJevH6Q5Jb/W1gYP5UWefsggH/fdsa5Gg5T+5qlwYdkxwUavwWojV/iNrcqglI1W3Adz0SvPVu6WuzoKCXXl8QDgoPd2QISH2IYJEfHH7RigTxj52I+cLyUmVmDQlkseo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U2d7k3T2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U2d7k3T2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738480382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Akyo3JQj2YPzoJhRHm4ECXXW4B+Mshy1bBF/6XTbeo=;
	b=U2d7k3T2aJwu4M/ZZKnDjcvTzYHDYgvxhU+6yOR9kJq4EEjGBB2FagY7GyK9zMx4J/nP4y
	sy5mtSpfOujXnC3Zj/MwaBdwsWh4ruRnKM+fV2YS2YY5U+p7wa1FZwkZ20gDjPWY83gK6s
	DfaBMt8udM5CIPO35GgZrR2NZnhWlXk=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-srgB4rl4OCGjcZy8uKAMmQ-1; Sun, 02 Feb 2025 02:12:58 -0500
X-MC-Unique: srgB4rl4OCGjcZy8uKAMmQ-1
X-Mimecast-MFC-AGG-ID: srgB4rl4OCGjcZy8uKAMmQ
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2161d5b3eb5so65136105ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 23:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738480377; x=1739085177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Akyo3JQj2YPzoJhRHm4ECXXW4B+Mshy1bBF/6XTbeo=;
        b=qS73AlnaAEUOY6/ypRwMIUjS5I4mdRFhXy9u69nKKK2EWKP153dUkHECDSY49MNUFC
         qiWK2j5Ymal+JOajwZbo28eUNWa5rIXUKTAAwVsJL55DyTVX1sHwMd60iQK+0VElEZdB
         f0fAxZlM+a22LjfhuZZ28T4MUiGBKYUH1kOQn/0+tNobnmJKiuQyRnA3qrncnGEzfoDg
         VjionRuqZGtWdvNcnS7mFFJL79HKZNDSHuHGceXww/Wi66jCrvGzJSDBuMbOkhvtpakG
         a0Z3JgEsonwDRqd9/1VTPA05CBQQ45bCDkkJZ+HXZIrsGScqI7YR4XGzCwpRyW41Fgf9
         WqUg==
X-Forwarded-Encrypted: i=1; AJvYcCXVLUoyJc+MbLIREdhp5UkHaUxzkGaWsUTA+gbzeaq89m9vyQX2JsXtsfbNOKJaH9YjSlIx3G6h2B/EWkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlSEDWTn8XleaPfpm+lJ6jiIrhC+3nJTN3ZO9z2Mx8MbI/J4OG
	XZ+sCY0Fcoc8M/X4hCKdSUc2hYVd5fiu1VpNdIZoFNX7YKarGvc1xEu48VhNYzfv4YlNb0RVoFB
	idehhaLF2/2PLyE4w5BcU+VjJawtOKprJdAY/EhrOWiVIyOxXmNwp3RRub6P9wg==
X-Gm-Gg: ASbGncut+JdHnqHiljIs4KF/EmyX/dQeXchrFPmRELg1ziF/ScZ9TC4TYC24dIzUube
	uftkfKpQxvyBtOYYsRn8ADQ8h6oQueef0gv8uyyhODBUsT+CGWx/RbT8a2wLgBP+hCnTHs/ujGL
	Ao9UoRYuwuVAKeqZLNCJ90Od+NGyNI9MnIqkaKK8CpUnam4sgGF5S6MZT1Twjg0Hu+LSBZA84g3
	CyTV72+gRW45U7JDP6fvbGm2wdsXyoXkuS5wSM/RBZ/41ogkPI1Iv8yu70sPtdvsGz/0bQPNwRD
	ia/NKQ==
X-Received: by 2002:a17:903:110c:b0:216:1ad2:1d5 with SMTP id d9443c01a7336-21dd7deebd1mr265357285ad.41.1738480376990;
        Sat, 01 Feb 2025 23:12:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEbEpN4KQNQWRi1soSDL1v4OtYLgM2DYDPCY0eEgB/YujTFWmFABLlbkBOcGlGdKwPsn62yg==
X-Received: by 2002:a17:903:110c:b0:216:1ad2:1d5 with SMTP id d9443c01a7336-21dd7deebd1mr265357095ad.41.1738480376627;
        Sat, 01 Feb 2025 23:12:56 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5f1sm54843395ad.130.2025.02.01.23.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 23:12:56 -0800 (PST)
Message-ID: <f339729a-00a8-40b5-af05-f0f019579e5e@redhat.com>
Date: Sun, 2 Feb 2025 17:12:48 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 30/43] arm64: rme: Prevent Device mappings for Realms
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
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-31-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-31-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 1:55 AM, Steven Price wrote:
> Physical device assignment is not yet supported by the RMM, so it
> doesn't make much sense to allow device mappings within the realm.
> Prevent them when the guest is a realm.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes from v5:
>   * Also prevent accesses in user_mem_abort()
> ---
>   arch/arm64/kvm/mmu.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9ede143ccef1..cef7c3dcbf99 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1149,6 +1149,10 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
>   	if (is_protected_kvm_enabled())
>   		return -EPERM;
>   
> +	/* We don't support mapping special pages into a Realm */
> +	if (kvm_is_realm(kvm))
> +		return -EINVAL;
> +

		return -EPERM;

>   	size += offset_in_page(guest_ipa);
>   	guest_ipa &= PAGE_MASK;
>   
> @@ -1725,6 +1729,14 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	if (exec_fault && device)
>   		return -ENOEXEC;
>   
> +	/*
> +	 * Don't allow device accesses to protected memory as we don't (yet)
> +	 * support protected devices.
> +	 */
> +	if (device && kvm_is_realm(kvm) &&
> +	    kvm_gpa_from_fault(kvm, fault_ipa) == fault_ipa)
> +		return -EINVAL;
> +

s/kvm_is_realm/vcpu_is_rec

I don't understand the check very well. What I understood is mem_abort() is called
only when kvm_gpa_from_fault(kvm, fault_ipa) != fault_ipa, meaning only the page
faults in the shared address space is handled by mem_abort(). So I guess we perhaps
need something like below.

	if (vcpu_is_rec(vcpu) && device)
		return -EPERM;

kvm_handle_guest_abort
   kvm_slot_can_be_private
     private_memslot_fault	// page fault in the private space is handled here
   io_mem_abort			// MMIO emulation is handled here
   user_mem_abort                // page fault in the shared space is handled here

>   	/*
>   	 * Potentially reduce shadow S2 permissions to match the guest's own
>   	 * S2. For exec faults, we'd only reach this point if the guest

Thanks,
Gavin

