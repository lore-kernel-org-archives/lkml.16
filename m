Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FD5264FBA
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747045541; cv=none; b=RlQq4Q+annm1moVYhd8oAq+VQuBodN3M6OCmi0KaJvz1CS2OekS54iiu1WMY/7p9GfNBlAi6Ptx6EDGiigawFgxFglQ3zvRYulTw4Po4oL1Zsh7bd2M26gojpGUdHnScgGZDwWpujH8GBGPOZ765M5mQQSaiEe2LnLWLg4eFCvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747045541; c=relaxed/simple;
	bh=8Hfs24IMPIMD+rfu+wmgpuAN32C2jG/+yYit3T83DYk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=GaHeZ8EnK7Z8s5y8a6vco+l/+xCzwsCVDgjuswV6ZlbOTPc77XQtZ5t4C5Ls3g4wk/AeeCP7dSoM4a71tsQLBQ0EDpL/1EbT5DyB8jVfCmtUUXHdnJ5Fd3Y9iStSyaWG3iq+Ydj4eLL9wStoK7iu1AtQIoBSURNeNYmzxYjnbM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=DmD+fuzo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="DmD+fuzo"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so5087765e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 03:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747045537; x=1747650337; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVYDNzGl1HhtRbOLlZqbNyW/2ZNd9jQ043iVsCWK1J0=;
        b=DmD+fuzoYUA8DWqIkG4vt7cMfY7uOVpqN1FmAnvGz1RGHFoHRZ/sutTWGs2yzKd9On
         hF/a/ZZEGrKPQ5PmO51+bGDwlDVZNGcMJwI0QQCJU1cvDujkIGY9Zi2spcKGocvqf63O
         4CJ4uCt4bM0dxLcQG2b6D7e2rfzqHt0PgO0T5hfeibkHivKrwy3DxgSJXAhFiZpr722I
         Z4TcW3qMMgsOZ9HPDbMWBKfSISVm1Fcn5YkjBlM0MA/3XN/Qd4KWcc4AojMFAcsNwMyY
         teKQhlqirUCn5DUXwiU4EIvJtK695e3GRiyo2FLaINFRy+g8YqVcb6xq8sOdfa95CRPn
         WcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747045537; x=1747650337;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fVYDNzGl1HhtRbOLlZqbNyW/2ZNd9jQ043iVsCWK1J0=;
        b=e9bBEs4/d5V5bOmXGSYsbwS86xNehpzvCR/rqlNfTzGohAn1A2NlhD4uqGJfy2Gqdq
         RfOrquBNfA9eVG3y1n3HT5PMG8ugc2NclQotaMmwgY6Hn9+53ncg/u7pLpYvleGdwnhI
         EXIUnz1IOLU7KLItOzRwlq+3CCB9gNJ/H2l95b/+nzLJYyjrymTHz4n+dWG7zjAM0Qs5
         U8A6XtfaAsOeprj8tI9dt/8CPUdtxUbKatPAX3KNpuSsBZ2AgJzumuEDFbp7vMdq6NwR
         BkRjKuJ/cSjLmkvY/NMgJP/XDvhKAnNpSvMDq+EflvAHsI2SbncnRiAisUIzzcB+Wkic
         5DTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVQaZEdIYbuYddheB9Gl6+V5lm/Jj9I/al0p/qWQjaZYbJ5OmXnENILJpKShMmN9Y6JwTeHlD5mN6a/no=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvpE07Df3NnqdzO2zxBXIqt5dIemHq4bFK8E8P3MGden3TAVPh
	2Wew80n4yw1yS6ocjdZn/l6vHsa5ew1x88VsQtd12e0+2DNu1iby3+J+/qig0Hc=
X-Gm-Gg: ASbGnctpxUqJF0KM44ShHJpN43Tm90XQo4JvLeCAIvByZtE44X81/0PMwQqvqp1tuYh
	4kiszNOwGccEJnFr24hjhgZPNLvtDlQo61yW2HZuZvf9OT2ydJjv69Q5+jwaVpP3GOMFiz89tjB
	v9qMk6wdA+EIviuyf4Gse9TiSD8Q8AgDQvfyhf7g7NNYrYegY/QP8c2s9gPXunkp2qsOwZgYd9x
	KNf3kobMJltzKDPMniYv1mEUKCvcBWQUjT0Vqq95S0pZo2xGKYUL7bGlcY8fH2NzSYk7XVF7g2Q
	uEKOofMcKA0UcxJxcTmtGnS3wKH/cOcjVR01M+OSmdwmC/kJDt8Hgoxb578=
X-Google-Smtp-Source: AGHT+IGcTuM+dMRNAzDc5kg0U48s/ErTHPCpW1AeG6d0g+VQ2rWI9+vdhUQrqpzvxyWDNYPzIqhOmg==
X-Received: by 2002:a05:600c:4ec7:b0:439:9fde:da76 with SMTP id 5b1f17b1804b1-442d6c39b14mr38970815e9.0.1747045537283;
        Mon, 12 May 2025 03:25:37 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:6b5b:8def:fde9:86fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d76b7fd6sm74327145e9.0.2025.05.12.03.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 03:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 May 2025 12:25:36 +0200
Message-Id: <D9U3YFOPMSEF.15BJIA8CET3RT@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 4/5] RISC-V: KVM: Enable envcfg and sstateen bits lazily
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>, "Anup Patel"
 <anup@brainfault.org>, "Atish Patra" <atishp@atishpatra.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Alexandre Ghiti" <alex@ghiti.fr>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com> <20250505-kvm_lazy_enable_stateen-v1-4-3bfc4008373c@rivosinc.com> <D9QTFAE7R84D.2V08QTHORJTAH@ventanamicro.com> <1da6648a-251b-456b-9ddd-a7ffa95a5125@linux.dev>
In-Reply-To: <1da6648a-251b-456b-9ddd-a7ffa95a5125@linux.dev>

2025-05-09T15:38:55-07:00, Atish Patra <atish.patra@linux.dev>:
> On 5/8/25 6:32 AM, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
>> 2025-05-05T14:39:29-07:00, Atish Patra <atishp@rivosinc.com>:
>>> SENVCFG and SSTATEEN CSRs are controlled by HSENVCFG(62) and
>>> SSTATEEN0(63) bits in hstateen. Enable them lazily at runtime
>>> instead of bootime.
>>>
>>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>> ---
>>> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
>>> @@ -256,9 +256,37 @@ int kvm_riscv_vcpu_hstateen_lazy_enable(struct kvm=
_vcpu *vcpu, unsigned int csr_
>>>   	return KVM_INSN_CONTINUE_SAME_SEPC;
>>>   }
>>>  =20
>>> +static int kvm_riscv_vcpu_hstateen_enable_senvcfg(struct kvm_vcpu *vcp=
u,
>>> +						  unsigned int csr_num,
>>> +						  unsigned long *val,
>>> +						  unsigned long new_val,
>>> +						  unsigned long wr_mask)
>>> +{
>>> +	return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_=
HSENVCFG);
>>> +}
>> Basically the same comments as for [1/5]:
>>
>> Why don't we want to set the ENVCFG bit (62) unconditionally?
>>
>> It would save us the trap on first access.  We don't get anything from
>> the trap, so it looks like a net negative to me.
>
> We want to lazy enablement is to make sure that hypervisor is aware of=20
> the what features
> guest is using. We don't want to necessarily enable the architecture=20
> states for the guest if guest doesn't need it.
>
> We need lazy enablement for CTR like features anyways. This will align=20
> all the the features controlled
> by stateen in the same manner. The cost is just a single trap at the=20
> boot time.
>
> IMO, it's fair trade off.

Yeah, as long as we are doing something with the information from the
trap.
