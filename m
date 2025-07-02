Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD52114F90
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 00:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751417068; cv=none; b=nAG5kci/InM3bUjSc2RPJ8sMEXp/jvZReCLRmT190n+u67TYVmXlfYJyihWpsrolO/j39sGDij+DCBwFtvNH+I77BwK45BuhKZhsgP+qu1Z500QlPl7qEUnK7SUjh8t982ZOwkxAqkII//+2v78XkWN7AnquL/KLSoAty0/PLrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751417068; c=relaxed/simple;
	bh=GMM9Xc4S93NZsBFQxZ/Narp+exl6rKh0KT3abCEuCg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X58M5iZLFNGm/LsXA2G08bQr2PBjF7UTA/on/HxMjspQU1Jfy+4OqLHIaL8stcLQkU61bNM1a4TdDKJjdq4Er1FpAe8C6Ft5mgHki4BC0ir+HJetObgqJHsBkSv0s7JymO9fD58IzLME/7YnjFVT7ujsU9MpApTBXG6NtWNH+Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JWlQHYhm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JWlQHYhm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751417065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WE68W0bXQaTpxl/iIASF1f+Xh1LT+vGRhkdJSNq736g=;
	b=JWlQHYhmNIADWjwlmqrAXB3rlavuGQXzFuKTfEESbej8eaf/PQlt31vC5i2c8BH2zf+jJ7
	FiB8AQ/SDh1NAr5pHDd3OGukYbvi8+OgKeAo9I0zcTNwA2dEVUnZNwnFk5sfv1t1Y0zNmb
	BhObrJQ34prpbogWUzTUyBXlAZeIfNc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-OjGtB950MWSTE0X8nfmv-w-1; Tue, 01 Jul 2025 20:44:23 -0400
X-MC-Unique: OjGtB950MWSTE0X8nfmv-w-1
X-Mimecast-MFC-AGG-ID: OjGtB950MWSTE0X8nfmv-w_1751417062
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235eefe6a8fso45382455ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 17:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751417062; x=1752021862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WE68W0bXQaTpxl/iIASF1f+Xh1LT+vGRhkdJSNq736g=;
        b=GSwAakRSeRs61mlca4dG5Rfnux2uAKh1RtjOVRlhvZ16dnTGDO+W13XdR7ecsKnuZ1
         vrjf5WEiHM+ysDa0v+2TnvphgTGX9HDnC04fnd1ibGlRKbylJCm47AYJGD8YHFCl24Bi
         m939g5/frNBEZHTerUDXEH1CDE2Bz/XAee4Dn3V0ZChD4oPmxxvDFtFRBdadZn1pnZgb
         UoICRWA2yVfgvP/diQhBZ0zZ+HCp14Ox3Rgx9VualN9NQrXMUWZM9AFVRE7qV9+ypbUV
         yz16CnTRsJ551RFa3UTGpDRytP0Qj366ccRWqninuT78X2juLBig1E+RAjVlapUHxiVO
         7j2A==
X-Forwarded-Encrypted: i=1; AJvYcCUh3QWfSd64UqTF8yUascQI3v/xwYYHPj+DBrF06sHu8GlAszsVC2c0W/17ALU5CIRXq5NYD9nAeF+gWuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGnp1Excw75EtXcrtB6mWCOTVi/UG3Q1PKDey6iw4eOj5eQBKh
	/mOvF9Ekz6GFEGe1vXF6Ix/pFKnSoGQe6HusqZDjn+BJMPelJX+NgQG2HY+b2+m8I5RMX6CaUNd
	59gvDKErsq4g8fZ8KMfRzSlZsIl/CFDqS6/PgaNVIkU+D2FvBFknKKbdx+cWiiBbzHg==
X-Gm-Gg: ASbGnct86bYMeoYC4QsH31rD7Yrnl5gntVUYwUvHIasYGlAoxepc6jrOWBW4as0l5LP
	zYHeyL46mmay+waUttlKDbZtrdKXNLU2skQmamX/UmrtuxXsOAf80CeQLHFCY4o30drqG/+UCx2
	NDsdwgsQitDQsL5Ead7lSj0HeVSrTrD81+bqDvZSGjFh7hSRJqsG81K6CZzgzYp1wGLd9P2oDkb
	64pmfcpadjI12ASPKHku8eBPcrR4dSGmYM/OH6mWsIggwZGCUzFzrdbztPO3D6s486UqiMTnK4P
	+Yc2oHTN9Fb3ccU0CrhaRaXAQ9MhGThxA8pndsmY9u0Asi8/Kse7FU0HVMCF4g==
X-Received: by 2002:a17:902:f644:b0:234:ef42:5d75 with SMTP id d9443c01a7336-23c6e583731mr8506485ad.20.1751417062328;
        Tue, 01 Jul 2025 17:44:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8Xe02tQUQpMvQ7JmZ6r+aJbfGWHLqnMc6SvZ+9EXS76Rb9Lau8L3Ze+pH8UDez4MEnO2doA==
X-Received: by 2002:a17:902:f644:b0:234:ef42:5d75 with SMTP id d9443c01a7336-23c6e583731mr8506155ad.20.1751417061963;
        Tue, 01 Jul 2025 17:44:21 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b871csm114358215ad.187.2025.07.01.17.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 17:44:21 -0700 (PDT)
Message-ID: <5eef96b4-2a33-4d52-a68a-323709beee5b@redhat.com>
Date: Wed, 2 Jul 2025 10:44:12 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 17/43] arm64: RME: Handle RMI_EXIT_RIPAS_CHANGE
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
 <20250611104844.245235-18-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250611104844.245235-18-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/25 8:48 PM, Steven Price wrote:
> The guest can request that a region of it's protected address space is
> switched between RIPAS_RAM and RIPAS_EMPTY (and back) using
> RSI_IPA_STATE_SET. This causes a guest exit with the
> RMI_EXIT_RIPAS_CHANGE code. We treat this as a request to convert a
> protected region to unprotected (or back), exiting to the VMM to make
> the necessary changes to the guest_memfd and memslot mappings. On the
> next entry the RIPAS changes are committed by making RMI_RTT_SET_RIPAS
> calls.
> 
> The VMM may wish to reject the RIPAS change requested by the guest. For
> now it can only do with by no longer scheduling the VCPU as we don't
> currently have a usecase for returning that rejection to the guest, but
> by postponing the RMI_RTT_SET_RIPAS changes to entry we leave the door
> open for adding a new ioctl in the future for this purpose.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v8:
>   * Make use of ripas_change() from a previous patch to implement
>     realm_set_ipa_state().
>   * Update exit.ripas_base after a RIPAS change so that, if instead of
>     entering the guest we exit to user space, we don't attempt to repeat
>     the RIPAS change (triggering an error from the RMM).
> Changes since v7:
>   * Rework the loop in realm_set_ipa_state() to make it clear when the
>     'next' output value of rmi_rtt_set_ripas() is used.
> New patch for v7: The code was previously split awkwardly between two
> other patches.
> ---
>   arch/arm64/kvm/rme.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

