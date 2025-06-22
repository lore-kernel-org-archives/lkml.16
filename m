Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2FE19342F
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 10:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750587123; cv=none; b=AJf1smYJzCpQckE7jIuQwGKmvqD1Kjgr0SfCk0snY+NSihh0Juew5I2tDAtZD9lFY6QZJg+RSRQSVKUIgXqMUFHlNj5aq4mQS909FZsTKwI+ncwf6cAaPOLvHIRRWfTJP5GDFV/i2E+0+or7xLD9NghcacTv49hrUMbwJZPEn1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750587123; c=relaxed/simple;
	bh=U8KbW8H1OPS3k6Kxz+b5VWjIpb6jrU+NjTsn2OmpZ9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlTfQAa/euyaY/F9a7cCHcex3sB0klsAID8Ls1Ojk+9U8EXekdkFxU/NQwxyBZNR+LJmCkZafj0CcjjAyyt/DZUSSjWNCnoWOICdBAG65FKqc4WpZKiLmAgL+prSoY6A9xsiFFfI8TlwAu2zo026IUqooQNV2LHz+qFQv0YGtUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=T+ig0bEd; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="T+ig0bEd"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23602481460so27934515ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 03:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750587120; x=1751191920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhd7Psksfo9MLj/RnU9tn25T95OkdzIn/rvFvguRfxI=;
        b=T+ig0bEdY6Tbzg3DaGYcQetGJ5zfsIj/anjO7ZoM8Yb/tLb1+C3Hc8IniRmxK1uxBT
         A3f4YU5G/mu3E+Fc7dFurgHCqyWAM8QRck9Y+IapCLeujyHqu4O8y3CLDRW8tEIxV6Im
         2ra6xdqDICnJxcnnQGezEVLWZPEJuXQIIamlmt60wtnxOLXuSaUmw6PbquZHY2OtMpnr
         svFXa6r5OkWcTZQTZQa80ZzwXKuyn8BSarOeDDyCx3erXGMzAGYuXSXgU+ew/O96E4GH
         BjtTWOAAdHF7dN/0ZmIMLhvGAfiKVgLsOZBCwcT6iEuFQ51RzQGGXt0TJfzWvaCumcAo
         MGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750587120; x=1751191920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhd7Psksfo9MLj/RnU9tn25T95OkdzIn/rvFvguRfxI=;
        b=fTFI+pYznZXCArbnWCnX2XmhoP6hJy997Hu3KlhWfQXYg91xS3g3Rf2rsKHYwnu5BT
         IxsxO6Q1nmgpY2Ojt7w6diAYwBBULfEAf4WS1Y7ckEElUiiXr4NF24Tl1GEsc9bIs6Ev
         //BN0XPUfnfHH1kEbUc6wlDVz3mWUJ1N9OW+3oXg+bGs09FGmFkcFTkVDg9ZZH0+f7Kg
         0EyulYvLR9pKoZ6qO5i0HpXxnSKsYPwwUbY7ePrQS4dcAv9dhY2BvrGV42uWJ3A99fBq
         SH8DW8XghB8GwCVSjKdnxwO1Skxj9fKw0KbMnS4LQPXwLtddeduuqwWlOowF7YBz3eLg
         njOw==
X-Forwarded-Encrypted: i=1; AJvYcCW6qbydjLnUR6W7qSiiAsI2A3osFG4tZVp/gFX4itJ1MCJBSYkz8PvTUdSDKdcW2OOFel4cX8jzZjdZsR4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjovk9BAYslIr3zfbIqEWOJMMofDQ7NCQ1KYaI1piqOyLfsVrO
	tkKorrcJmzMVDoC/YAo2BmRCRu1kmummXtTuKHAhTYjUwDZqhCkew1ZSN0MrD89wWkM6s7BB9oo
	e9bDiGfi1e0VuypB7v13PlEVcumetQu4kTzG+NtoR6A==
X-Gm-Gg: ASbGncvcigrd5w8jmm4scKxLhxIdWSdAl7dHmr55zS9SuOOJvaWQDKa0+GVdZnnBAr/
	SQFyfgxqVdK2Zp3xv4YR3CvROuCvmV+Ub3bWTR4b+fLo+L9Y6MrUIXUh2nQKlHQtO0z7U4f6pP2
	TVSMSvid0K0Nj1xuezQ74Dx5f9A9QfN6EFdQWTTs1QAw70CejXaaKi9Wus
X-Google-Smtp-Source: AGHT+IGsWzTP6/gbvQ/CA0ejRIYXVE3ACO/w0NVroX/xY0eGzRwP6PYHlp4erxCJ+zZG6ZfDl+/adXC35SQaJWcaE8g=
X-Received: by 2002:a17:902:c405:b0:235:e8da:8d6 with SMTP id
 d9443c01a7336-237d97c3b5bmr151787145ad.2.1750587120557; Sun, 22 Jun 2025
 03:12:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620091720.85633-1-luxu.kernel@bytedance.com> <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
In-Reply-To: <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Sun, 22 Jun 2025 18:11:49 +0800
X-Gm-Features: AX0GCFsb818yKyl7dINvhKYBkJJnEFckaB0ZfIHP1lNH7P09XFDmloWPadWx7s8
Message-ID: <CAPYmKFvcnDJWXAUEX8oY6seQrgwKiZjDqrJ_R2rJ4kWq7RQUSg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: anup@brainfault.org, atish.patra@linux.dev, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Radim,

On Fri, Jun 20, 2025 at 8:04=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcma=
r@ventanamicro.com> wrote:
>
> 2025-06-20T17:17:20+08:00, Xu Lu <luxu.kernel@bytedance.com>:
> > Delegate illegal instruction fault to VS mode in default to avoid such
> > exceptions being trapped to HS and redirected back to VS.
> >
> > Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> > ---
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm=
/kvm_host.h
> > @@ -48,6 +48,7 @@
> > +                                      BIT(EXC_INST_ILLEGAL)    | \
>
> You should also remove the dead code in kvm_riscv_vcpu_exit.

I only want to delegate it by default. And KVM may still want to
delegate different exceptions for different VMs like what it does for
EXC_BREAKPOINT. So maybe it is better to reserve these codes?

>
> And why not delegate the others as well?
> (EXC_LOAD_MISALIGNED, EXC_STORE_MISALIGNED, EXC_LOAD_ACCESS,
>  EXC_STORE_ACCESS, and EXC_INST_ACCESS.)

Thanks for the reminder. I will have a test and resend the patch if it work=
s.

>
> Thanks.

Best Regards,
Xu Lu
