Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EC51A5BA0
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748250035; cv=none; b=Rp/LtaHsBvVkVCYH3spPEfBt/9W54ESF2yV2YfoYgZ5+vHQHHXHbs9/+FcrBxPVMEFicFVbGNKhGWUCZyTbQnmAgLkBdj3J8Fu73HNs8NckZ1OjfUPR5W6U8/OkK0+KjEYT2K9op5rB3X8szScIlSOw7Zy7p/hApMl1RcDL2RUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748250035; c=relaxed/simple;
	bh=Px13KBn3Ab4PML/y+5ws+0a8JDTrznN8pyXvkr61Wiw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=YixF/s4OK6IM6F24ntjmB7rb71SG1CyiWxT90yuHCyDhObnTVSDuEaKF2kzvh/yJ2IAB4HqKXYzmx8y764EEWHrJFai129fEDZXFj05zICKaWo4oMDtsc2MtfjikcP587gi1S0i3oP3NGx+Zlj/K+qmzOaSj5Mw9po6PdS3e89U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Sbb7dCGT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Sbb7dCGT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so3731815e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748250032; x=1748854832; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Px13KBn3Ab4PML/y+5ws+0a8JDTrznN8pyXvkr61Wiw=;
        b=Sbb7dCGTWb0+9jCPO0UczcwQrSEdVCPZbh/9trsg8Rvu70wtnJ9JMDa7l8m8yfJf9v
         F6zS5U0OSI9MJZg35+FV8D8iwImU5cit8q+w3LHMU3aFyZ+4qmb+4FELhSt+kdGDSRCt
         3dpa59pk/IZfhejmGyool2zm8w8Exn++hnfdrC+kOpKvX0ANo/c7EL8+dXkpS8rAvhS/
         pIhNd08H9B0KvUOOiWogBXmMPp/UcfeddH5lhm5q7CrDOGHvGyY4U9LdGg+BHLD3OAag
         VI+96BJrlcQ2m3mJM1GuuFlR+50S14fQpgIKVTJkEQ7VCw99K7Mm0XNBmop3dkFOeNeI
         DBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748250032; x=1748854832;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Px13KBn3Ab4PML/y+5ws+0a8JDTrznN8pyXvkr61Wiw=;
        b=c20rjV6NePR6oTzJNbcmsfJGELqL11FmWkXv/YfxCvfjZppbTRssxOI+2/Drp74JA0
         PMgy8Ce5IMkEbuBoqVSwdzYDj8dJfxiY0AtX6F2fsaIxKrKdliWdvSfWX5J3c0Hd8cOB
         yrvd8APLwlCP3+ZLATYUQzktyTRYR3QJmdK90y5GraVUAd/f3U7zscr/YewNkPOHGDEc
         txcz88jUGbh1e3bOnszW71CidviM662zamMVG1MnoO8X/LqMskRTlqw7OLQSrVktmuUH
         AGoZXLkNcPD6mXZMfq9NySO/lCkMxT+tcnY5y1cK0iy5t47/dDTxrRHKDXQUoIkbjCaj
         nUwA==
X-Forwarded-Encrypted: i=1; AJvYcCX/3cjgq57wE5Sot4TQ3tAoHRonBjVpPG8UtWxQsKauJNAsiXppEymyYuFaM7mbiarM6nQQ6++n+aonJpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsLagnLIXNaavMNAsQhX3VfLZP2Ilvegkwwjvp3WeL+P90A9uU
	2hAxpb22Wrgfw3+VMKYxicx7L+7+wilJtXJzepq/vWvZY/jVJtBrrr5KbknMlLHqt0k=
X-Gm-Gg: ASbGncu0AgChzOxuEObLtK/yI3JdLEFLrlPmDdLAlRnSFnNJ8af9onv2RRvtICzQHh0
	VXCHREmBUh+6ohSliqppGs0vn/g0cMUWDpi/BbUBSzSdTLlcn+tud9bvAE9l5bN0OR0DYOqoOIR
	wt+qz6oxkqWK2D9bA3y2Z3BgfB7Iqtf5D23pX53bt4INyvFVpSN2Kv2lRl9UDwY4BfDlNkTKwj8
	tPHdkIhIgO7xlh8MYX4mm85UmebI2ydpuBoBd2Vo2nlISt81OgUmNtIUOLuH8LXipa1PZLyDBFJ
	gPJMFAAZN9rJA3ktTfntBTMS+ZBsy70Dpvr/5/aliVyU1RDyKENyh9eN6nc=
X-Google-Smtp-Source: AGHT+IF/tn9b6UQhPJeT+xCpvDd/FmqeY7qs1H9ffakgmE7eWhdvKQVPuHh5QupMD48NcHbdDQ76XQ==
X-Received: by 2002:a05:600c:1547:b0:439:9909:c785 with SMTP id 5b1f17b1804b1-44c935dd918mr24933285e9.7.1748250031502;
        Mon, 26 May 2025 02:00:31 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b85a:a7d4:fa4e:bb11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd94f1sm235682295e9.35.2025.05.26.02.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:00:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 11:00:30 +0200
Message-Id: <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version
 to 3.0
Cc: <linux-riscv@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Palmer Dabbelt" <palmer@rivosinc.com>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>, "Anup Patel"
 <anup@brainfault.org>, "Will Deacon" <will@kernel.org>, "Mark Rutland"
 <mark.rutland@arm.com>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Mayuresh Chitale"
 <mchitale@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
In-Reply-To: <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>

2025-05-23T10:16:11-07:00, Atish Patra <atish.patra@linux.dev>:
> On 5/23/25 6:31 AM, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
>> 2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
>>> Upgrade the SBI version to v3.0 so that corresponding features
>>> can be enabled in the guest.
>>>
>>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>> ---
>>> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include=
/asm/kvm_vcpu_sbi.h
>>> -#define KVM_SBI_VERSION_MAJOR 2
>>> +#define KVM_SBI_VERSION_MAJOR 3
>> I think it's time to add versioning to KVM SBI implementation.
>> Userspace should be able to select the desired SBI version and KVM would
>> tell the guest that newer features are not supported.
>
> We can achieve that through onereg interface by disabling individual SBI=
=20
> extensions.
> We can extend the existing onereg interface to disable a specific SBI=20
> version directly
> instead of individual ones to save those IOCTL as well.

Yes, I am all in favor of letting userspace provide all values in the
BASE extension.
