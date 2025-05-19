Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB87A27701C
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657542; cv=none; b=VDago32XmWxFNVBGjNpPMVg0BCvXvhx3UJSVMUfzyXwnaxIhhuvV5MCHWq7OK0RHGPnNpKxZBaSmpazPyToWOMzqM6pmJ/m3CNAg+thdithaQbMS1rwV1gnWkhkBQPfl49I9hJBhczUfy5x1OIGaHKBqoQncuKyPJ6RBExiWq/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657542; c=relaxed/simple;
	bh=UVMu7q/OWhagwnpQvr8VA3KbUOVlB7q/qERrJlFh/e0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Knq4wWMd+XKvtwJFdC6+lWnHi4Xun6qsQbDbTDhyZGueEj2GgY05rLSAFhbraic19g5JHl4OWCLVLyhbG/jqfrdpwEymvT1kN0fMO6V6qExo49C3ocRRuKxcg4y5CfANXCBxW4K9uPE9PH4VcJk9kFO//+Q/ZHI4r7SGiD0mIvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=F+styEMs; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="F+styEMs"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a365bc0af8so280399f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 05:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747657539; x=1748262339; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYOuWvhD2IrISJ7Y8B2LTWIZ7qteHjlohGpX67eP4RQ=;
        b=F+styEMswkviQeGy3AzZ1xxt6qOdTeskT0vzdjeOYy9OOgZOSKw/CaIzL6kwuEBFo2
         BoSQENOpA2UNXfROOjLRJmzALbJws6fpzFAh1dLfCcPjNNTngfQj8mWdHnJD4Z4a4L2x
         cW53d9mabzM+cXpvEWCpvQGQWm5HUTUUtrQXZcnSRiJ/XoYYeTQ88CE6pPKbcvDsfwPm
         WUTba1GtANQwP1WSAbpz1tvO/idaTyPkHIbKa821amUyd60vxt6hDJ0Hk4Mk/FKKpnRm
         rpt87prvle/QhbRnNt6b+Vp3RwTiD0IVKoSqBdxaIgpcUs3r9yGTj/XQ1xTbbWo7R6bx
         S9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747657539; x=1748262339;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dYOuWvhD2IrISJ7Y8B2LTWIZ7qteHjlohGpX67eP4RQ=;
        b=w5vNx8XH0eGfLGEsqpqkuwSFbhYu/UITuJy29rcYIVb0Gd3fNIfXxHhD/UZko/wyAv
         MsztAY311i9MN85ct8BQE7hQOjMkhLnejYRFanC8SmAcnsaP+6AQtQC6qHZV1gtLO32a
         9LqAYT8uYY965h+ZkhUlNSdbHjNW4PsUVry96u49fAIwNUKvIU/EECCKDiMzIvXfYF1U
         fasEGfnQAT6VhfG3yv3WuUERXhB5OH2q0oH6n46itDnleoC7I33wzI6TTyUI6wRH0XsA
         p3kpQy3o9xMxKSpmrF7GhYvRnlzg+sFFSLTFotdxUB4zOyE2gUiHb1eIY/QxSjzm8tc3
         3Oiw==
X-Forwarded-Encrypted: i=1; AJvYcCW+DisklkVZHP53b8/E+yco4/ZQ6OyBUO5BJygXtnbSWU2ygueW/jqDMnLusgC1DsyJgZVYIDh3wYXdfH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmEkFBB4gtK7riBzD9xKAhTJjQIrW7/ZYD0/ZVNJx0/NFfA02/
	0zMERsNZ8/W2LLEHpgr3bYCVls5u4nezisVJNeoVNvzQAtgNtTqxWmmJxirQaU4CIkU=
X-Gm-Gg: ASbGncuh5bAMGZpS9r6phZMHK2n3zpx4fDqo3v/HyR97hUWTmVI6tS7xd0+hHhBpG1e
	iBaykwfWR08JRVL2d5tIF5zhBo6wpfJRtOMMA2aHSXp4w8sysRsSuWdYNKes8GkQSAYiHSNQ4U+
	/2xeJhj32TgKxXl7YMwAahBD0oORZStndyRA5FYLW31ZnMPwt/912VkmHh05U2yeA20wv9bckDn
	yRdzCELLX5pcODDMT1fU4Bpx4ouRcTDrkvN2z6i1FqBZ2MxnC8lRTq7r4QLsCGJAJAsrWyzI6vw
	zCCuudTk1H0/GvxsDLc8U77IsEKl6HwUFspU7/MnAs4b5QD09NN5uxBeV0s=
X-Google-Smtp-Source: AGHT+IGD0SGS0rGbL2ckKskUyJdOJSyzovDYQ2VXjwxG5bR2UNb0kyCq4qlYyH1RbivwrICgl0vwjQ==
X-Received: by 2002:a5d:5888:0:b0:3a3:7351:6f39 with SMTP id ffacd0b85a97d-3a373517245mr709772f8f.15.1747657539155;
        Mon, 19 May 2025 05:25:39 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:29b7:4911:a29c:2135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f33804d9sm209160935e9.12.2025.05.19.05.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 05:25:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 14:25:36 +0200
Message-Id: <DA04W4PO99EJ.1XWOAUMZV4BXG@ventanamicro.com>
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones" <ajones@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
 <20250515143723.2450630-5-rkrcmar@ventanamicro.com>
 <CAAhSdy1Z43xRC7tGS21-5rcX7uMeuWCHhABSuqNzELbp26aj0Q@mail.gmail.com>
In-Reply-To: <CAAhSdy1Z43xRC7tGS21-5rcX7uMeuWCHhABSuqNzELbp26aj0Q@mail.gmail.com>

2025-05-16T17:55:05+05:30, Anup Patel <anup@brainfault.org>:
> On Thu, May 15, 2025 at 8:22=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrc=
mar@ventanamicro.com> wrote:
>>
>> Add a toggleable VM capability to reset the VCPU from userspace by
>> setting MP_STATE_INIT_RECEIVED through IOCTL.
>>
>> Reset through a mp_state to avoid adding a new IOCTL.
>> Do not reset on a transition from STOPPED to RUNNABLE, because it's
>> better to avoid side effects that would complicate userspace adoption.
>> The MP_STATE_INIT_RECEIVED is not a permanent mp_state -- IOCTL resets
>> the VCPU while preserving the original mp_state -- because we wouldn't
>> gain much from having a new state it in the rest of KVM, but it's a very
>> non-standard use of the IOCTL.
>>
>> Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com>
>> ---
>> If we want a permanent mp_state, I think that MP_STATE_UNINITIALIZED
>> would be reasonable.  KVM could reset on transition to any other state.
>
> Yes, MP_STATE_UNINITIALIZED looks better. I also suggest
> that VCPU should be reset when set_mpstate() is called with
> MP_STATE_UNINITIALIZED and the current state is
> MP_STATE_STOPPED.

That would result in two resets (stopped -> uninitialized -> *), unless
we changed the logic.

Would you prefer to reset on transition to the new permanent mp_state?
MP_STATE_INIT_RECEIVED seems a more fitting name for the state, then.

Thanks.
