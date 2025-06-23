Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2DA2A1C9
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673074; cv=none; b=XWjWs1c/fJg+ID8QUeejRZfq7hgPGRWsQAcSNBkrn1YSeWdburNk8i8rYddeg3ecko5Bw0glPipLjhQgwZehWBUO/zHG01B3ZcTqS2N1y2d3UFcmAq7cmG28qijokXM+3lGHqGMLFyDNUW/1/Mv3wHFMeoTfWCmsS/MYr0rnNcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673074; c=relaxed/simple;
	bh=JQDW2gTsoLVK187JuY0wEWiF6jBFSRBP7iPLXBKcrBk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hvRJedT+nxUwZ83TXUS2hXIqlphFzH7nTLBRMikv4kgSqyJmy1iRbd7VR4voPuI1c7Att872SstQn6SZyY5TCYSlLkz5EU1EUYkB67giFzOdoipPkVXWcwQDD0qxZ5r7C6FPE6s9hiezFImBIfV7cIDfcyqDku0/k1QmW2iobOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Hi/ggJub; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Hi/ggJub"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4e575db1aso189470f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750673071; x=1751277871; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q72uVLN6Dd/lEgG34G+gl19V3OHTLM7bT/jbIRgpIbI=;
        b=Hi/ggJub9mtTLPb6UUgm9Vo42fb7WIis5vUo0kXcUjBHUkbFxRTD/vhqYcPpUnhy+o
         wTr3QviXRYrpVLK2XD08TuOEe+zK+K5FSahT89tah/UT52xMQBV/RJVNX66q70gKbgEU
         J9QMW0XFECw191RawhilpSlavFToBKgxTs+f5mrvK5twmrNfkLZ6IXlPgB3Y+0Zx5O2X
         FeSCTvlU6haoQVGfe/lKHXLoPnMbpm9gSMnFVS9jC7NeDSZzd9CSkHNn33lZPhBpZ3QF
         +jBPidHflxTiYZJZ0OiMw8yQPySeQ3OdmDNsVwk4NNk9kQS7znPBt8EO5uNs0qhBIqqQ
         Vozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750673071; x=1751277871;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q72uVLN6Dd/lEgG34G+gl19V3OHTLM7bT/jbIRgpIbI=;
        b=vDf0uDDCWVMR4h6lkZCx4tJ9oVB/AdgQfevEUOKdyr7tmSeEichI3ZgONCUEFuOkD3
         wuLXfdaEWMmAmIVR9olus79E1rI70IIC2hjE45wdHsJUKxbeM8oIGGh2mRqLbBVJQs6G
         QaqCl5QCd/1nL16n/cLo3w6AthKkwdVIXCjvj2Xnr/68tsvMNL94UqLZkiquFBg6Xm6W
         o92LPncjJLVIeJGHqJZ6I/W5aX5LQypVK6Lhfw6H43mSbE2QSF4mXwuhyxN9NyOl/aVd
         dtXP3wF84n4DxcDYWaJSF2IWDcvK+/ELIX7m+uonDpW+57BRzLXHauGZv/8TNMueYgOp
         wdOA==
X-Forwarded-Encrypted: i=1; AJvYcCXg6DZDGI8UeJi/KJ4MqdB8c01TmzRxppY3az5CBdL4aWzIK/SqJb7jVa1L8fw2Tk8na0unNPrwceCM2xs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMbvplDkCig/wK8U/hXnTE1j9AVnAqNap3J9SgziOPiEwlTED/
	cJ5c4llHlQ92FJFsl89gz1ZnKFO94wE8o3Cwbv+bQdv26v3wilKazlxxyBf2H9adKdeNB3RjgkY
	UMWTn/LY=
X-Gm-Gg: ASbGnctfHCysbsS8WSGWUYqRu+ZG5SsYru4cMtThC6gx9WS+s8YLncpSKgMhDbAlhsw
	8Mx7sxvf/FO/CO7f1NAVNIiumHC2gKxCQLTQG2oNAAX+i25wOlbEr1fCo5LjBMT5M+jdMVjkIhZ
	YIYlGx5rU/3ucFl9c5q1iZMlckRESKcLREUxWmiJqFSEtIll9B3rjxB7/XzimUQnyxFJz+kWcoT
	BGY1aQ4Com6GMVWAJPEa8C/ypi/4Xnz8zvFFWAMTxa09EjcleBR+7qdR2rsWrDB7e2mLu0YllJ0
	N5hqlc6shlFN3sat0sM5OEPxOIji4K3BmmHckkUMjTtauovuI4DlfxYL8AomstD8Rio=
X-Google-Smtp-Source: AGHT+IFs2pQCa+3bKTkdor2w3FPfdSYUbedMYRtHjGttAZlhUfRN/r/Qxtzp7NLRxL4SrXakOUW0PA==
X-Received: by 2002:a05:6000:24c8:b0:3a4:e193:e6e7 with SMTP id ffacd0b85a97d-3a6d12e995amr3291773f8f.5.1750673071422;
        Mon, 23 Jun 2025 03:04:31 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8947:973b:de:93b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f19f9esm9077130f8f.39.2025.06.23.03.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:04:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Jun 2025 12:04:30 +0200
Message-Id: <DATTT5U64J4L.3UTDRVT2YP7GT@ventanamicro.com>
Subject: Re: [External] Re: [PATCH] RISC-V: KVM: Delegate illegal
 instruction fault
Cc: <anup@brainfault.org>, <atish.patra@linux.dev>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Xu Lu" <luxu.kernel@bytedance.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
 <CAPYmKFvcnDJWXAUEX8oY6seQrgwKiZjDqrJ_R2rJ4kWq7RQUSg@mail.gmail.com>
In-Reply-To: <CAPYmKFvcnDJWXAUEX8oY6seQrgwKiZjDqrJ_R2rJ4kWq7RQUSg@mail.gmail.com>

2025-06-22T18:11:49+08:00, Xu Lu <luxu.kernel@bytedance.com>:
> Hi Radim,
>
> On Fri, Jun 20, 2025 at 8:04=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrc=
mar@ventanamicro.com> wrote:
>>
>> 2025-06-20T17:17:20+08:00, Xu Lu <luxu.kernel@bytedance.com>:
>> > Delegate illegal instruction fault to VS mode in default to avoid such
>> > exceptions being trapped to HS and redirected back to VS.
>> >
>> > Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
>> > ---
>> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/as=
m/kvm_host.h
>> > @@ -48,6 +48,7 @@
>> > +                                      BIT(EXC_INST_ILLEGAL)    | \
>>
>> You should also remove the dead code in kvm_riscv_vcpu_exit.
>
> I only want to delegate it by default. And KVM may still want to
> delegate different exceptions for different VMs like what it does for
> EXC_BREAKPOINT.

(I think we could easily reintroduce the code if KVM wants to do that in
 the future.  I also think that it's bad that this patch is doing an
 observable change without userspace involvement -- the counting of KVM
 SBI PMU events, but others will probably disagree with me on this.)

>                 So maybe it is better to reserve these codes?

Possibly, the current is acceptable if you have considered the
implications on PMU events.

>> And why not delegate the others as well?
>> (EXC_LOAD_MISALIGNED, EXC_STORE_MISALIGNED, EXC_LOAD_ACCESS,
>>  EXC_STORE_ACCESS, and EXC_INST_ACCESS.)
>
> Thanks for the reminder. I will have a test and resend the patch if it wo=
rks.

The misaligned exceptions are already being worked on, so don't waste
your time on them, sorry.
