Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BE2DDBB
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 02:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738462300; cv=none; b=LEDN9mP+jk6g+A7f6zeDB7Fki+MYpPJN+0zlkrnRJyYOLzs4NZHcMB3jOtXE6ZAKEfiOq6XWmBvXdlTz4bTIkwqS6f+1oNwvxblZc3omeZOSDyVaXitRCTRIG7IyyAeUk4/8bdJCP7i/ecT6iV4nozxBqLwKfRGLFy555hgUeNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738462300; c=relaxed/simple;
	bh=f/Xz711tH686KIYj8B5uhbPaXR1gbd0LuSh4loqolqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cGS0HLHe60eUNYyz1V2PT1FfVkGp3hYuhZ7hjAW9khylJ9TVg44YsgkBBgg3ous7y+kchtF+IZIGn5M5fIZwvTIIDslRcay53hV5TJDoQr73ivcU8iHMYoBgW2bLpblcpA/IocMoj002EotpdtZRcd/+QJZ2tD7QOqZJHmBd5hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ay7Z8cun; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ay7Z8cun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738462297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jz0tT2FTFLvNvj61SDsLmOkHBQ46Tt26HSOtiuLa6z4=;
	b=Ay7Z8cuniJy2H7KL4tHWi/1++8tOtG9gplccW3L/xEI+N12N6BeqxNbasXKXMbXusqMwDX
	a0LXg0Xlp9YowmrjkpHlDyzlqm6xTETSFMh6qC7ofw3aFN6IgMcawbPSkbAXBWLYDCgCeD
	VLFaKPORJ49YlhFWngl8uCSbuFXv/28=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-MPQP06fRMEOcU0az4K0r8A-1; Sat, 01 Feb 2025 21:11:36 -0500
X-MC-Unique: MPQP06fRMEOcU0az4K0r8A-1
X-Mimecast-MFC-AGG-ID: MPQP06fRMEOcU0az4K0r8A
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2166e907b5eso57125105ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 18:11:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738462295; x=1739067095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jz0tT2FTFLvNvj61SDsLmOkHBQ46Tt26HSOtiuLa6z4=;
        b=LsYJ/nH0pBhNUKsyXwAP2m2c0geHqfTfaR1LyJfRNOmvCk6/q4GPiz5xdQ6ejlS/0n
         CI6yLn4bFQXw4NYLO51JYu9qg1uedyAQAiNwbTnm/p9dXT6fCQXrXbNWObHiUpz8oVQo
         cdrs9ZOzItXAgdT6u8VPex7G8SSxTtFGs+e/tI1E+pJ/3NiPgMlZkh7y+vrh+2/xZi2j
         2+yjAnjtQaTrwhxwBSJL61T2sjSFAQ2yB3frvpSEIT2tzczcTDwXPm3Cg7Kg1rfsg41v
         CulJ7CEVcc2axVCkCeKnUDlwJDe1k1Nx5VWCfnqjEL7uN0dRAy036q/Vb43BrnX+lHsl
         2m4g==
X-Forwarded-Encrypted: i=1; AJvYcCX903JSWJSTLHqqkKSbpQnGu8vAEv8U3Ti/k3njFxHdQ/+CeYQRlX140bTL1bS5MYj34cwaob6JWgz7NEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4puwFCo+Pal5tBKNFj468RCX0vr/xvDsFx9BUChRO6BFgyJA9
	e/dbI9weNpEmw/KMNEBAU/3nmOqyrgjtcKqhrpfqBjhLOWe+jLy6tdsr5Y28I59eDKhQxs0zyB2
	pBlRfuKFfdXdf13GHJVzuzaWvWbeqCyr9ov0oHGIc/KGhL3+hImznE58RZIccNQ==
X-Gm-Gg: ASbGncuyccP5/wlSdgOvs1MYfzt4bIAFJ+epw3ncjz1lhzfWlk1UFVLXatMi4/uh3uI
	oqeUkMXtWHWzhnonMpsUpx58opX5QqARfl/hoJK5fOWprq8m6cwSZoeSG19cP/IlxtFiVQ7ulhf
	b1xaGx0E4WNdYiILyccP2dAPKOmDRH05RI2U2QVXWof52YduLVNBBYdoIJfaThd3JIgYDVl43Jf
	FUz+fB3obGPHUpYJ+dtrXQkJt+3HaX8hPN7L0I1KgWseWdrZT2Dv5ahS3QrSapfst4Ly2OLN4Jn
	gsGT7Q==
X-Received: by 2002:a17:902:ec90:b0:21c:15b3:e3a8 with SMTP id d9443c01a7336-21dd7db9401mr253960225ad.37.1738462295049;
        Sat, 01 Feb 2025 18:11:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEznBpra764QOyQOK6CFRr1iAthLIwu66BAhbI5avSF//jD31IMMeDXBhhitA9mMZwWv411Bw==
X-Received: by 2002:a17:902:ec90:b0:21c:15b3:e3a8 with SMTP id d9443c01a7336-21dd7db9401mr253959935ad.37.1738462294746;
        Sat, 01 Feb 2025 18:11:34 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21ee2bae0a5sm24864345ad.19.2025.02.01.18.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 18:11:34 -0800 (PST)
Message-ID: <8606c5b1-075e-43c8-a58e-bfd5b90f3dcb@redhat.com>
Date: Sun, 2 Feb 2025 12:11:26 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 24/43] KVM: arm64: WARN on injected undef exceptions
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
 <20241212155610.76522-25-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-25-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 1:55 AM, Steven Price wrote:
> The RMM doesn't allow injection of a undefined exception into a realm
> guest. Add a WARN to catch if this ever happens.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/inject_fault.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
> index 611867b81ac2..705463058ce0 100644
> --- a/arch/arm64/kvm/inject_fault.c
> +++ b/arch/arm64/kvm/inject_fault.c
> @@ -226,6 +226,8 @@ void kvm_inject_size_fault(struct kvm_vcpu *vcpu)
>    */
>   void kvm_inject_undefined(struct kvm_vcpu *vcpu)
>   {
> +	if (vcpu_is_rec(vcpu))
> +		WARN(1, "Cannot inject undefined exception into REC. Continuing with unknown behaviour");

May be more compact with:

	WARN(vcpu_is_rec(vcpu), "Unexpected undefined exception injection to REC");

>   	if (vcpu_el1_is_32bit(vcpu))
>   		inject_undef32(vcpu);
>   	else

Thanks,
Gavin

