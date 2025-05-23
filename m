Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0890A292935
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007097; cv=none; b=XlxFiot69+0m5WoTLGHm07A7S5Juez1+5Ie71A24ZX2t70VQzlqCOKp6UqOv/Sv5GTjr+QoCT6yrEDnz2gvQ5gGI1Ru63MFqorPkJ0wYeL3rPUXGs8PHM9xHiSRsXDktwObOLRt7k/qLJ/JNsPbVgl/hGZGSjtom62u/ypq4XD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007097; c=relaxed/simple;
	bh=sE7NSB29qsmfs0sI4wgf6B6ZQGe4IKQtX92E6yxep1o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=PC4ND8w08i7XO1GBm4DHWydUHXsoSkFiiBx44uEJbUH/D8iJmRwDmeaHySArYy6FrS0rvkWq7Vyr97+ue2wvJGxL9ec5Pet4tpesHvVYp50G46XH/IbxYGElkua7buO44gGsPhSRvQh8lk2iu36E4OMgBGWiqUmGpMdT/6adiGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ZK7h21AF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ZK7h21AF"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-444582310e3so2493685e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748007094; x=1748611894; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE7NSB29qsmfs0sI4wgf6B6ZQGe4IKQtX92E6yxep1o=;
        b=ZK7h21AFzO78aJkYSkcthA2284pP35VOKEzL669JZMfZVh40cPSxwUqJhG5ck1/pYK
         QAOcm25tG82u/QQJn6TVErx1VF5wGzJELP3jhgbBK3BpqwavTWdATz9HZK+vsnbhfD5X
         NJkooyefkoA626z+ANYuH7WRO3uWWUNIjZVrCbvrvO57IMd25yzB8oElvUCqaeWqrE0Z
         sanPDBaP781coJeu2sQqWBHvP+qtl3cgfjnxWWU7mvHu6CaShC0571ZbtYdp74Clu8BN
         7/ZaJnjjJOFTxMMzy9v13Uv3YdQI9syuTOyh1+nUqbiBjhJsLBruTMHGkS3ewVSPQLwu
         QN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007094; x=1748611894;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sE7NSB29qsmfs0sI4wgf6B6ZQGe4IKQtX92E6yxep1o=;
        b=JhMUSVtfnsWOv0QMa4o/bDUrrZGNHt2ZAyqquM2Bm3GYv2/2KHw/o0jY8Pp8T8Vrio
         Zah0/T5c1q41xMoxCcFc49Zz6VgE09tMLWSmT1WRBrsA+D9/yLPLk11lf7qxHIT5CaYe
         QiKd/G3I/w2f0G0J1D10Z5jSLQlM95tC6dxAQ+hQd9cUwXl5McegaPrDLt/w07KY67fh
         490S6A8SroYziIAjE1myOMDaoA17Oqx7TFuXeovM5Y6d+il7BGswyX1bvvn1+eBxQ8p3
         yGLXEoVJL1WqZLRD9yqtbn110d8cqDQjmCMrBZd4IStoEsad4r74XVQ1cEcgZOA2ApGS
         FLKw==
X-Forwarded-Encrypted: i=1; AJvYcCV8Q9F6yHzR0seNI57ixteB1T6bDdooQqTfBZTuSj/aj0YzrJiImRrhcMJH0G6aoVuUF1WZ6IQ9pQ8oiEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjfpLXfeP55qcTDC6dN63g2TSko/Doq67OTGncU47faX007jP0
	0kqkKYpS3l99pgN+gSj4KYSruezxK/qGItsvjhRziaPNHODckXF5++A4FiAofmYTz6E=
X-Gm-Gg: ASbGncuk4GHCyq5V5n/FvKe7422iM74yXrEt4t6xj3AgTEHpYdOTo1UXJxqePfk63zE
	/+ImmuuYtcMTz8LzVnUH23ZZZeL2Y1JfgDrT06WZUo81eZhRj0a514CxAWYY613IKdoWiICfH0H
	LlbgZX/nkHzgtrHxvs2WWCQCTG6uPFIe/aRpm/7Lht4zHDDwwsj7W5f9XALk10/uLIaX4UVWuXf
	OQdYeGWZGxV9hNN1TKynEW35L0bqVofCNqg9ecJNqftHSjYcd83Gthk3z29t8tOSq+x+c2spMzR
	/UW+/Zgh8NN2HcV0bN88uxYmD/Ly8cGTn4knzbJ2K41R58FbspTB8JKHzmk=
X-Google-Smtp-Source: AGHT+IH4B5YjATsLpzFQConVuBPC8YzXe6dS/7DO0gd92eFJugpX4BslSSwZcD/zqo2WMw5EUo7NzA==
X-Received: by 2002:a05:6000:400f:b0:39c:1401:6ede with SMTP id ffacd0b85a97d-3a4c2b3a659mr992493f8f.3.1748007094151;
        Fri, 23 May 2025 06:31:34 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d005sm27248141f8f.90.2025.05.23.06.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 May 2025 15:31:32 +0200
Message-Id: <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version
 to 3.0
Cc: <linux-riscv@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Palmer Dabbelt" <palmer@rivosinc.com>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atishp@rivosinc.com>, "Anup Patel" <anup@brainfault.org>,
 "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Mayuresh Chitale" <mchitale@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>

2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
> Upgrade the SBI version to v3.0 so that corresponding features
> can be enabled in the guest.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/a=
sm/kvm_vcpu_sbi.h
> -#define KVM_SBI_VERSION_MAJOR 2
> +#define KVM_SBI_VERSION_MAJOR 3

I think it's time to add versioning to KVM SBI implementation.
Userspace should be able to select the desired SBI version and KVM would
tell the guest that newer features are not supported.

We could somewhat get away with the userspace_sbi patch I posted,
because userspace would at least be in control of the SBI version, but
it would still be incorrect without a KVM enforcement, because a
misbehaving guest could use features that should not be supported.
