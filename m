Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D8C24E4A9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585928; cv=none; b=rqcz/yM/Eh6L3QD2ARr3bEv4AlBEkpYEm3UrfuuVD5oqKuxqZUGK8ztF7V36xnZItfCrInHTkTh5jislSJyKEQmbCgsfibR4AjFMacoz9YVjkE85LP7aI8xjFEV0YaX80mHOElxy2L60Hpaw1OP2Rm3v0sKp8bzOU0gapXaPf1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585928; c=relaxed/simple;
	bh=SQaMsIpmceh9GBOkpwc7cGJxTk83W4BErBldzfCX5q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RH3Wrcy9mxAtcLvNOzwr5RwyxL3CQEG1jA8F5pv7gzo2EcgvYiY2W65HuSv64MKSQKQRmpxgRqLHjHkHkN3wIh8DJ1hqowX8pSFSpS4OjMT+e3FUrrQuu8XN5IAk1rBI5a1hUhh+Rv68exxTq+iUavSJZ1FQ4Tn/4QOS1W7FadM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=CU0sm/jT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="CU0sm/jT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso9845175e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745585925; x=1746190725; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h32MpWGnGgpxDT6AyOuIJQcbaczCBtPKdaZ9N2BrcSA=;
        b=CU0sm/jTELdeVxD8TqEGVIVHXGqQWyC5E9PIOa2Q2qjXy266rYWjz1jdCSZ0O5QJ/M
         LP3dNgzCi1NqLNjkxgguOigaEwIUaU/vmeekyUGrVTU0sjXDOcE+crVp9PYT8msnxt2W
         ip0yvKDGdbEAqqB/PtO38ZLWV9QB86Lo+PjGEbsesjPb7QvEsvz0+kWFW+9cYh/p2q76
         IQeXa5eym8MzIzG/O7aKjKTzB6vISDLXXBZk0LZk2PlrgWoAY1lhZKqzJ0PebK8dRnn8
         XYeNc4tyIick3/DHxcScxvXsVTGF53Sqe33KSWQYl/rxY5xWj6qVa7xAIJTx8TJt2nbY
         KCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585925; x=1746190725;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h32MpWGnGgpxDT6AyOuIJQcbaczCBtPKdaZ9N2BrcSA=;
        b=cx8GjwO7twOkKPxygvpQhxf7NZX13iYbUvbPW5Rfk5axNpFdCScKtdhT5PuiCWAXB1
         vr0J53t0icdJEEMOmJp2YCXlSEUr6RqYKNvCaVugLtqPaR6RXkRVsYDnoPi+g1KJWagF
         Q++ap2A7H6Btdz9/AKt/KdeY0rrGW/GOOQrieF3iHBEnyLd/62lH7uETVFhEwutlLEj9
         5m8E9GJF/0qOZd4P9MogQf0bKL70370IC5pD6n1s7ozZ0KTQkaUwhtUCZl8zlGesk2Cs
         mikm1ddY85yEpWU3p5aO3DOHTuSlaJ6iHlggD1ZJUEXryo5hB+J9mfccOAJyecj4RPTw
         E4QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFYiiDi4/ggv2g1QKMrhQfjinG/lAxye90NUcEsyDGhjOl5ZcpJnNLMHOWmoFrhWKae5co+CEm3VAXpGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBkVOFyft8LzcICx+3Ga3mRlDrBHfJX8SDsd4Jo+LX6JuJBCvq
	eeWKR0+TmwefWJuqd0Kz27WzuUWFNZeUu0Kul42WB/84UY4899rot2aD+iZ0Ecg=
X-Gm-Gg: ASbGncuBHRq8fanOPS8Zu6bulIL0v41jOW5O530V6XaSV4v4jhe4weQaOa5fIC1tNEp
	M2VvVD/Lxmkxfpo2QyQ3Upltl5+DbG3HIRpdbygO1JT1SKAKrUvBDjTpODopxmN+U5Doz7+jFaE
	9Djev6fudNMtn1Nug8a7uRGbeuOGY9uf8PNYsT7lSUHaIfFkHa4N/9QY1Od5/hMmBj0sSTJUfbu
	Q2EPWXayS6XuwNpkQEwmypfHMdHdTYcQeHXSOtd3ygVr7Bjx2rDnR2pRkXGCexwLhIumQGwKi0q
	kM8+ajAV07k4yujGFHjgug4auesp
X-Google-Smtp-Source: AGHT+IH1o3+pe6w45uhSEWnsxZ3kyB6TJbP2MLFTmjrjISo8GMvqrB42OloPKpF+TK2iDyjwzSvPYQ==
X-Received: by 2002:a05:600c:1e0b:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-440a65e2c51mr21114245e9.9.1745585924890;
        Fri, 25 Apr 2025 05:58:44 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5369cc1sm23902615e9.32.2025.04.25.05.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:58:43 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:58:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: Re: [PATCH 2/5] KVM: RISC-V: refactor sbi reset request
Message-ID: <20250425-65f6d6913f9f621dbc8c4479@orel>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-5-rkrcmar@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403112522.1566629-5-rkrcmar@ventanamicro.com>

On Thu, Apr 03, 2025 at 01:25:21PM +0200, Radim Krčmář wrote:
> The same code is used twice and SBI reset sets only two variables.
> 
> Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  2 ++
>  arch/riscv/kvm/vcpu_sbi.c             | 12 ++++++++++++
>  arch/riscv/kvm/vcpu_sbi_hsm.c         | 13 +------------
>  arch/riscv/kvm/vcpu_sbi_system.c      | 10 +---------
>  4 files changed, 16 insertions(+), 21 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
