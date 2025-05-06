Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92A92627E5
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523478; cv=none; b=pB625w/v7xXDTl6MNNQGEORD0mbI78mghHHlGupF/M3f/hU024l0j8tTlF+ILITLukpU2cVUrWg8noFOkUcYH8/pYf41oFgCQ89FfcTSiZ6cAKtPEL48VGXArbIH0DWAdzGZnnr9vrhWDoc+Y2B/nY7nHvHcWVw7qecWKyBpY5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523478; c=relaxed/simple;
	bh=2t2VKBmII81tNpczrynIzE6p9Fd1SV59q4ZmxbtvEpY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=PLMKqgpBOUhCSycf1YWWlob2mqdOPlU050YvQa6wbGTA23PNGIcRNEqtibQCYnyYHq25OrGUW3rxPM5L9eCTFWVYJJVJ9egdFWw2gMfBf2t3MeWokdgVtoiNTIjVRlwz/TjvKn8ffHO2ZrNoIWWYjgdpEZLwH7sl2dxH5c8QGDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=jTqIdkp6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="jTqIdkp6"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-441c0d42233so3187715e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746523475; x=1747128275; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtrK30WSclX8+CsTIEESOGs2XijMelv6Z+mtcK6WgL8=;
        b=jTqIdkp63McyCtFJbzaxKFT1Cq1Fp94Xr1soPQmsJ1VZxuiQj9IUQQg5oovEx++LWO
         t0YXZrAREdJX928dz3XRpiAgmrJukwV6MHxKw4IFvs6OYlLl2WnAapasu6vkg4GwtqGk
         5keOFlXAQJS5fSLRmUER8ddvygvPWdagIVRSQ8okuFL/Hu2m7uXLEFkn2YzU7IIinAPx
         JM4wNk8yPqgecHsIH0KGRvN1ggiq3PZyydjMRCT/L0QsQaohW0jISRp/jbs+aHST/OzA
         O21KZJqeXD8kBiJ6VS/Hdn3Ct/C170o9t5g8A19z5JNCT4subcXxkDULkkUuSv1DgSV1
         klnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523475; x=1747128275;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mtrK30WSclX8+CsTIEESOGs2XijMelv6Z+mtcK6WgL8=;
        b=XY13keSgTGJMr/dvd82aoGGqL+JP2T4E8kDQMpNnc8cpzc4vziD4IMfNrjeGdivIsO
         DizGeCvQ2cjWK+PNtniS8EzQbdcp4jBUGTQRUm+QIfVJ1NFgUJEl1+DAivSFWkI7ZZ09
         K4zXDphjD/TypfHhVDrklwpsDoy/nye6q9l/PgrSWVe1l/CK7I6lf9vEqiZHC4AGuSPb
         Uc1855oG4veiO5TjZacE4XpLX+lTvou3XwdWl++gnINBseeimfXf5B7YpsMkMttgYD+r
         bjvvi43L0RNJm2N93tf9gRQlJJSWjE4RLu1NwYdoiHlPXc5hjrLgRBPmyiXOSM3g2Ipa
         Usdg==
X-Forwarded-Encrypted: i=1; AJvYcCVJx9EEYnToRdokoiNQ0PHVjf+iUNIsPzLTOlewSKN/Adrithj3u41uf8OgrxihSZiXIDpp/fBV136lW6I=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyhd/FZ09RPu+Gv8CL+Ms/Ppq7UlaLRBp9EogQ8pSWSQbpM+Xe
	y/0hE9thTCQL5myQnisX7ojkb2Yd6kJKLwiTWoDNRdh4hkeZ1GB/q/VJxcTHqug=
X-Gm-Gg: ASbGnctfCSA/k6dUNeJKcn3kt8OjWxIFz131sa6L8VZUbPLY98lJlzcanQu5w0r1w12
	rgCoI+ok1JczOH+W/nVTEpBC89iebM1Nd6qNasrWZ3oKj0Aw3xTdTzhpEQaCFiksDecn+Re669+
	tUC168thuIF+9P/wELaywzJP6TTsTVlUdflqwuYNiIKTR/Kqk+yawmT6wH8kCbdNx/MCV5ZeuMG
	wdy60uIYtHrG9NiPiFlz2hkY2cIs6yl6FZXR/p74xr+lhtlo4FHQDmdDfor8esqY+gus/AhciIy
	5RbGIiCm/ozpqIPf/9MqVJd+matfcw3gOiUH01UyGbBT4rX4
X-Google-Smtp-Source: AGHT+IHZgaRK6ml9AWyse65POBkzHsZ8Ut+BjX7oVJ10RpUOC/PC4jjz2MMApvtA5diNrjCKmwAdmg==
X-Received: by 2002:a7b:ca59:0:b0:441:d244:1463 with SMTP id 5b1f17b1804b1-441d2441701mr2017735e9.0.1746523474923;
        Tue, 06 May 2025 02:24:34 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:d5f0:7802:c94b:10f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8992b4csm165890855e9.0.2025.05.06.02.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:24:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 May 2025 11:24:33 +0200
Message-Id: <D9OYWFEXSA55.OUUXFPIGGBZV@ventanamicro.com>
Subject: Re: [PATCH 0/5] Enable hstateen bits lazily for the KVM RISC-V
 Guests
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atishp@rivosinc.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>

2025-05-05T14:39:25-07:00, Atish Patra <atishp@rivosinc.com>:
> This series adds support for enabling hstateen bits lazily at runtime
> instead of statically at bootime. The boot time enabling happens for
> all the guests if the required extensions are present in the host and/or
> guest. That may not be necessary if the guest never exercise that
> feature. We can enable the hstateen bits that controls the access lazily
> upon first access. This providers KVM more granular control of which
> feature is enabled in the guest at runtime.
>
> Currently, the following hstateen bits are supported to control the acces=
s
> from VS mode.
>
> 1. BIT(58): IMSIC     : STOPEI and IMSIC guest interrupt file
> 2. BIT(59): AIA       : SIPH/SIEH/STOPI
> 3. BIT(60): AIA_ISEL  : Indirect csr access via siselect/sireg
> 4. BIT(62): HSENVCFG  : SENVCFG access
> 5. BIT(63): SSTATEEN0 : SSTATEEN0 access
>
> KVM already support trap/enabling of BIT(58) and BIT(60) in order
> to support sw version of the guest interrupt file.

I don't think KVM toggles the hstateen bits at runtime, because that
would mean there is a bug even in current KVM.

>                                                    This series extends
> those to enable to correpsonding hstateen bits in PATCH1. The remaining
> patches adds lazy enabling support of the other bits.

The ISA has a peculiar design for hstateen/sstateen interaction:

  For every bit in an hstateen CSR that is zero (whether read-only zero
  or set to zero), the same bit appears as read-only zero in sstateen
  when accessed in VS-mode.

This means we must clear bit 63 in hstateen and trap on sstateen
accesses if any of the sstateen bits are not supposed to be read-only 0
to the guest while the hypervisor wants to have them as 0.

Thanks.
