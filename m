Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314E21CAA6C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746698531; cv=none; b=Ia87J7u8XemP2As/yPsPb7rQYwZma+hPWhwyQkd21ZYwR0/1FnWg9csp9gRs+8U/+2woSEXoq/78vPOQRlw/d3dYvnmNQyQ/1fJZFuu7yHhRtzIXuR/DuRC4FtPEBOAGggiGLEp4QnF33uLvnFe8QB+h7r/w4bDVFPjGQARr0LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746698531; c=relaxed/simple;
	bh=dD3XhLv3aLEgd9xznXybGYKnL30+PEHqHxV9/ZWuREQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Gjg776GxZVfl5pw8vRPlQVit7h9QiaaFUWc5USWw3wmbCkd0b2Ng/2ENn5lnDoGtMjNiv7VQXy8CfyyH3iDVzdtOrV1AnQuN9K9Qs/4ZfFsMxebkZtQ+uMI4EirdS46EJWbWdyiPxTxxgg1E9rtC0BOWfaTiUfwx5pMiwRllPAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=OGKZ9AvX; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="OGKZ9AvX"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a0b1808864so37838f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746698528; x=1747303328; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBoYS0wz++EQw8/z3GxgW1EZr6KbY89jyHXnVjV8trs=;
        b=OGKZ9AvXSCzPjBXsG0vy+i7kKicv94Ap26LZwjqrfS3n66x76yARcfYEIxpaY3l7Ux
         jdDfhhluyw9f21EijLdI7mM/tGAbyIHL/g/kFmKGtl7U1tkt9r6xaEL+QKSPp4EuRCU0
         ILWH+EwwH72PCEWam5B8nl9cUZ8j42vSuoxjjlzQa71eluP0BNecal7Cqnnqpml7GKfq
         srckRmiZuEiAciHAUWnBQ+B+eV3CsKt9Aenj+Jo8K8eWVpMLToIW87SclAlb20ggM3EY
         wCYSny06qk41PQnpKx3vxicu9v1b1GEHeWmBGXTO5NwxCkMVM+6SiJoGgENKEXPI9VrB
         TH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746698528; x=1747303328;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WBoYS0wz++EQw8/z3GxgW1EZr6KbY89jyHXnVjV8trs=;
        b=OWE7Rc3Fh5OE5iyqsx+bw22Fkk0tLjhL9+0qRUo6cnTJo7bPRMosAIZw5Uuh3BraT+
         GqIwgjHQ/QTT8O9RnKpmCxZbB9vDTdxxWXJNsTSPloLV6F/Wk9TgfkeZDDT6ausHFe1e
         zH/iYiwFvfIGPYApPdsJBqRDl0YtjgAECv4gqzVnE2vemrs3BTYmgSX/NQ8b7+p5o2Ds
         LTtPAK4ik2xQ4RTTMPWPiJ+yOGOar1Ln3TRYeDHqX4QaBbFXvlwE4wtxc/efnapbaGx2
         5mKYCVuUe36FG/3TIut0LlajYvW1IJRTIn4gegNKE7WrVBSLQxx4STKbi97y+niJFRdu
         K9zA==
X-Forwarded-Encrypted: i=1; AJvYcCUSWNFSXJXbg7sAbr3nyYpIfIfjZ+2qIVkocodXhqJ+7XCvYkfs+VaKV1rvmprTrOZHbm3F65f3AQcElUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFnL3806MPVP8rURczybULPEkasy43Lo4uTzDpx+82NPpDq3R6
	WZiZLK6FoYkuciCUH+TVygol7r38s6O2K4GMQnzJ/8nBkLo64aojAunhTNAB9NM=
X-Gm-Gg: ASbGncuZfntugqgYiycbyOk1I0x2acJOGIbzrJcBdKJtp9cbmXgmJqB1qG0H8HLXlpG
	XPVwOvWwRVibxwNRwgoOxf4TvsdsWmdgmK67YnU9AANKC7ajopNFA56xarRu4GTb/jW1G7lkjB9
	ndTEUhXxNr+v5L1t8RTdwMo7o0RuMZ281AudM/06RKXoti+JSQFpthUEmHm4FUcpf0TDv9Ja9oD
	0nxoAQpBMmI+o5HemdcbdQClBmTQUQPnFFsTU4bRFM5+j6KjBhXBG60WkKAj5iKAaHgZJCfSwEz
	aNSJ58IlG9tMiL5iE5z/5jYWtvlWtbZNA5cleH8s3isA2dLoEOnFg2KqROA=
X-Google-Smtp-Source: AGHT+IHUaQx/Mee6s3Ke3xU/t61RV8r367qD/26lQfVX2YZuAy0gm6pedVbgXrEeJfa8XZl3movr0A==
X-Received: by 2002:a05:600c:1c97:b0:43d:301b:5508 with SMTP id 5b1f17b1804b1-441d44bc487mr21958065e9.2.1746698528415;
        Thu, 08 May 2025 03:02:08 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:a451:a252:64ea:9a0e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7caasm20004897f8f.54.2025.05.08.03.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 03:02:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 May 2025 12:02:07 +0200
Message-Id: <D9QOY9TMQXSX.2VOEKVRCXKOO1@ventanamicro.com>
Subject: Re: [PATCH 3/5] KVM: RISC-V: remove unnecessary SBI reset state
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Mayuresh Chitale" <mchitale@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-6-rkrcmar@ventanamicro.com>
 <CAAhSdy3y0-hz59Nrqvvhp=+cWJe1s50K7EpuZmKBqfy-XQFd1Q@mail.gmail.com>
In-Reply-To: <CAAhSdy3y0-hz59Nrqvvhp=+cWJe1s50K7EpuZmKBqfy-XQFd1Q@mail.gmail.com>

2025-05-08T11:48:00+05:30, Anup Patel <anup@brainfault.org>:
> On Thu, Apr 3, 2025 at 5:02=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcm=
ar@ventanamicro.com> wrote:
>>
>> The SBI reset state has only two variables -- pc and a1.
>> The rest is known, so keep only the necessary information.
>>
>> The reset structures make sense if we want userspace to control the
>> reset state (which we do), but I'd still remove them now and reintroduce
>> with the userspace interface later -- we could probably have just a
>> single reset state per VM, instead of a reset state for each VCPU.
>>
>> Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com>
>
> Queued this patch for Linux-6.16

[5/5] was already applied, which means that [3/5] would be nicer with

  memset(&vcpu->arch.smstateen_csr, 0, sizeof(vcpu->arch.smstateen_csr));

in the new function (kvm_riscv_vcpu_context_reset) where we memset(0)
the other csr context.

Should I add a patch to do that in v2?

Thanks.
