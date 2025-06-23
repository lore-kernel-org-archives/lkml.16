Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C819205AB8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665899; cv=none; b=nvh5vIKs4B9zWGiooa5LPIFVNWNC7E6waIQ9QDb+CtzcH2Vc4QRIp2hessAeGc4AxN/7B+7oSGQfyVnDSajjJVrlhPwybVe1WTNhZPyw9dzuTEtIMFLccoLPf/scEYMwU9NjQtbxzGWC35TJcku6qHLlKhL6oF7ajklLuOBMw7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665899; c=relaxed/simple;
	bh=G1w0adoxO+ajxlGkY1rIijF7bO7HKR5s4V4mGepiLAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fqvzZ8jEJBeKVcHPknHNv2181FVnssFzeN1GAnopebMjA7B+bfdKDPfMjjhIB6kDy+3s+CdPrQGD/bgi6VfofiQnTybpal0HtHGouhi/rDHncslIluq7ndMIcWcmkaGi3cGuJa/ltcsyvgnch0+P6MsOHBC4XzJtjVXb8XLccZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hlIr0+xG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hlIr0+xG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23633a6ac50so53045325ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750665897; x=1751270697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4vmYNde3494s1oZAkDWHVWSrNdQuXQcEtL0WwaKvH1w=;
        b=hlIr0+xGB14mwjiEXA1GHSOqonDemjrupW/YtxymfiQuoHKBs13aFZNwFSuIz+wYO2
         9UDbsuw5/rxifbu4pD04jD3VXm1UyxqaQw8f/REsRRPqFEQDlAg/WH0gS9MXfnbIn6sv
         Y1tvmZQ/Qa3V6d9mRJ04yJolXqaOeZJ8mragNHy0c0CQknPCdKTWGqZpYodPD4vwEZsj
         wXjohd06RXos8QZM71VsBImA/OKRY7opwiVO6xR4Zphj0HTDCzC9N6VivNesaflLCsnG
         qhyRLuBFN2n7qj+27IBQV1VUvBpJ171FXM7cc0ujx2U6lGuWJoYTvRfEHa6uzqEJXEMb
         W8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665897; x=1751270697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vmYNde3494s1oZAkDWHVWSrNdQuXQcEtL0WwaKvH1w=;
        b=fHXdZvlvwXL08g2AVs9xd3b9TG7/0amyrBv+rgSjWFxRGgiilqCjDxxiE7NMWCY2WZ
         B4rMvNaKvt2HjjYsffGOQrG0yD9HWudFRavAlYams6doBlOgA3DW7dNV89kEG7DjZCov
         T4KZI7bBMZ9GXI/65atlVi+xUeps27zdMisX7trxJbn36wwEQbttWSBQx4tkfGUtSMh1
         VqwLBbpdDLlpvM7JrSg8+pl4vD2dUGCHSe3I7/KeoPQTUnGGUZUqFMnHSdBHa32P0Kc8
         EuWUW2yzRooaCHOsneBN9HNIAnOTUZPHGXybyQUZMC9Xv13o1Un1b5LKFo5nb4wXCQNh
         iybg==
X-Forwarded-Encrypted: i=1; AJvYcCVpqGd3o12mIwfUyVds9I1dXsJTP7qzJKxys6Di9/D6dr7k17roKiLTTK8Z0zJ+XiD5wMHnPJeUPOE/JH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwONlYLYDO6/9OqyNvbaQGTFJXM4aAcGr4N7yF3sQptSfhPmMX8
	nKiUyADq0FCbb1t3zkluwOWMaUU/+EyauHlggAZGwt9nHVydfyQh2FN1ozwq9IThAkw=
X-Gm-Gg: ASbGnctopzqDuLUJGl/sXufa3CFTQ84be2lXRW4oMjwUp7C7G9ra/1ae0ZLfnRD4sOi
	oUjpjLwKYIOp7MJ5rcQbJT7nFXzRrmDatH7rejYy12M0xFB1uqjPDgDyXMD63B3vIKdZlBaFT5S
	+0l/APR10DqDx+We0RFKJ6pZ8jen+/0b0YZ6fpa9JVeOcvtNdX6lFZ85Evr3Cuk5bn6YeaE4oIJ
	MxE2Rs6E6WHqtrFwR/dCfRdeS3clo3fpeZpx5hhV2uegdkEacSpdaXSMcq6ymziu0BUi0N1QKh4
	2Ssm0MJp2JgVkYm5yXV9g12sy/wbI+RTbsx5Zl/Sz0XH87IGbcoKCqBzQkmy5mBHrrsSL4EErJI
	KGWxaPttVKd1OSZ6YxSycZFbbB8JWBnA=
X-Google-Smtp-Source: AGHT+IGAu8sRN9d6YginLzXnR26SBrwXTWtMoIeqalY4gdd+wB4xJaqi8iWblIrCKepqAoQGghGYIw==
X-Received: by 2002:a17:903:4b30:b0:234:8c3d:2912 with SMTP id d9443c01a7336-237d96b6361mr175973175ad.11.1750665897172;
        Mon, 23 Jun 2025 01:04:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d867f8d0sm78007835ad.175.2025.06.23.01.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:04:56 -0700 (PDT)
Message-ID: <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
Date: Mon, 23 Jun 2025 10:04:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Xu Lu <luxu.kernel@bytedance.com>, anup@brainfault.org,
 atish.patra@linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20/06/2025 14:04, Radim Krčmář wrote:
> 2025-06-20T17:17:20+08:00, Xu Lu <luxu.kernel@bytedance.com>:
>> Delegate illegal instruction fault to VS mode in default to avoid such
>> exceptions being trapped to HS and redirected back to VS.
>>
>> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
>> ---
>> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
>> @@ -48,6 +48,7 @@
>> +					 BIT(EXC_INST_ILLEGAL)    | \
> 
> You should also remove the dead code in kvm_riscv_vcpu_exit.
> 
> And why not delegate the others as well?
> (EXC_LOAD_MISALIGNED, EXC_STORE_MISALIGNED, EXC_LOAD_ACCESS,
>  EXC_STORE_ACCESS, and EXC_INST_ACCESS.)

Currently, OpenSBI does not delegate misaligned exception by default and
handles misaligned access by itself, this is (partially) why we added
the FWFT SBI extension to request such delegation. Since some supervisor
software expect that default, they do not have code to handle misaligned
accesses emulation. So they should not be delegated by default.

Thanks,

Clément

> 
> Thanks.
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

