Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793EC19AD70
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 11:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748603388; cv=none; b=YFdjkeReohjtQPDCM02uqC3px36erxHFw4O25Q4r9UnJlegNoUp5xPbkHV0z3ZLb0wRK+ftD6zFTvuLqvpKjV5IietcUisc+aRdbBx4tzK+/Mef+fDH9h5KHITOvigPkzsivmcBsFjGjIhKVc+u33iOXOngVbfY7nLitWFsh96Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748603388; c=relaxed/simple;
	bh=or/cFM9w3xIlM9jzAAD47M+TFLTk+EUJQ2P/TRJDHnI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=gXLLj5EPXGUp8JPV5PDE9Zc6BKokHg3Wx+QiDoeC/3/cQ6RQEXfDw/DF2I8YvAsLEvroGsnmly6SFjT34pi3TZcyFZeYV9Jv4RVU3omdKnomFi7oBGdpDp2rP3iLQp4Am+4ro9wjMmSu7fC3g3D9O6PEXqfmDKXvs+DYvCIWgkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=a5KKOTlm; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="a5KKOTlm"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4e6a0c274so236178f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748603385; x=1749208185; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKHlHU74s9id5ECnlxromIqBTzfUbM5l+HheDzzqFcg=;
        b=a5KKOTlm8lrvJCvoAepNsW3t3q2KNwi5cWQTG+qGawkks7iWwDjfblbRcvnee5eex4
         FZ3SCMRvIUjqwaUvP1RGL/zbOpNTFjq7V0ADheLDIydQKTyxn1RoAgYCUNZj3tyatQ+/
         CZl/MaXmHT7K85xstZC3JVbYEJ5jBRhS7jMTyZlABVBVwnD+JBlqfJ6pj+zyVcLQmw0u
         9ZjLuq9wZaJiP3ogOxftwAFeOuHSGioevRjJGMr1iQPmNRyveL62VB2zI2YRw9s57JAK
         HgHw9Ewjiq7zOSS5ZS7+ILicRtCBDS2iKUKyYNjSdDYIeANMqF8OYy/aAVma9q5ggZef
         fOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603385; x=1749208185;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nKHlHU74s9id5ECnlxromIqBTzfUbM5l+HheDzzqFcg=;
        b=pPaEmkC7WEFheNCwu3zZ2y+n9qqHLcZJJzd3ZfLrdD650MRtSeTHe4WPs23j97zhxv
         eKyBciSnKbQ3xBWvh5gyf6v6kIv+PzeYZJBaw66TbzjqfqaJJxtHwwr5e4Flmobc+jR5
         KvYuuTidMvtzmYmb2uetURhM7W1PBP8yYtl+BwI4lZrUdPFtEYN5vH5ZoyHEUmRHEmCQ
         He52qtFAWnJmbP4GbUd3C+NDHaSSnun2p6cSkHQYRSU8B55fLxN8VrpaxjmYIkjt6dUL
         fdzPlmntll4meArFsIWxAV03CFx52X6YqSZWNvxTQ8kz7Ua8r3FmtXmzkKFiF9BXm9x1
         Hl8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzRun8DqptovZpYHRiv0h65HY1i3XojaIasIfeqelZC2ALKswUWDukniTbQlvpTBWtqzqvgWr58x5wEEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZeU0074+xDEARYER4u67+5FluoYSxVFJ+LeLkZL3vlQpHcN61
	ftFHjfa1nsUP4aejNCmFwi8aG2xBvbSEthMaJdxtLpe00trO/Wi0YLUG4hJ4r/fKmnI=
X-Gm-Gg: ASbGnctWauPWrQYfVRuGi0A8sE/dm5GgZUAn2K5njybb/ic1UT0HtuR2sEv2cF6wEcH
	4T6/wD1ctTo0urhoWWhTMYpK4xEuQq8LVS5yetlqYzj18p5Ykf8WFEmyEOje/KIvFye6L4ODbId
	QzCIfu/tiqEWO8JOsExMMUd+0s3M9zoTAYwtxkORD1VUKSvhotS0AOcFX4jk0wdb2R4L4u12hFX
	/1ut/4aOyDDiLDdpD562AD3v9s2xVRxNsFjx7XHAJkId1JM677Jn4Vywz+CX0YIJfYCSvpgJhdS
	HfP45ePbGjqqoSh1AcNpoHROFROeCAUaf4kX6kfb/saRuip4pUg1uoueOUU=
X-Google-Smtp-Source: AGHT+IHWlRXsHj8fy3YljEwKBbucuDh540moRSz1XXe7HUhMOymhGLaK6eZjYnDZtJV/6QwPDY4NXA==
X-Received: by 2002:a05:6000:228a:b0:3a4:dbdf:7152 with SMTP id ffacd0b85a97d-3a4f7ab6c2fmr730169f8f.14.1748603384676;
        Fri, 30 May 2025 04:09:44 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:23dc:ac4e:5f79:355b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972c1sm4593368f8f.68.2025.05.30.04.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:09:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 13:09:43 +0200
Message-Id: <DA9G60UI0ZLC.1KIWBXCTX0427@ventanamicro.com>
To: "Atish Patra" <atish.patra@linux.dev>, "Andrew Jones"
 <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version
 to 3.0
Cc: "Anup Patel" <anup@brainfault.org>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Mayuresh Chitale" <mchitale@ventanamicro.com>,
 <linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
 <20250528-ff9f6120de39c3e4eefc5365@orel>
 <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
 <DA8KL716NTCA.2QJX4EW2OI6AL@ventanamicro.com>
 <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev>
In-Reply-To: <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev>

2025-05-29T11:44:38-07:00, Atish Patra <atish.patra@linux.dev>:
> On 5/29/25 3:24 AM, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
>> I originally gave up on the idea, but I feel kinda bad for Drew now, so
>> trying again:
>
> I am sorry if some of my replies came across in the wrong way. That was=
=20
> never
> the intention.

I didn't mean to accuse you, my apologies.  I agree with Drew's
positions, so to expand on a question that wasn't touched in his mail:

>> Even if userspace wants SBI for the M-mode interface, security minded
> This is probably a 3rd one ? Why we want M-mode interface in the user=20
> space ?

It is about turning KVM into an ISA accelerator.

A guest thinks it is running in S/HS-mode.
The ecall instruction traps to M-mode.  RISC-V H extension doesn't
accelerate M-mode, so we have to emulate the trap in software.

The ISA doesn't say that M-mode means SBI.  We try really hard to have
SBI on all RISC-V, but I think KVM is taking it a bit too far.

We can discuss how best to describe SBI, so userspace can choose to
accelerate the M-mode in KVM, but I think that the ability to emulate
M-mode in userspace should be provided.
