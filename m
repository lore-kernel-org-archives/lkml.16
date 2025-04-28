Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596F48615A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862346; cv=none; b=t0NFdzlalJ7aVPWC3YIeJ35iBfttSWlcmxrwnzL5LZEdDxtGWqerl9a9oT80YBtOtCO29vzV9OO0YsaOBEUb0f7u1/wrQLrn6SmesUoZnNri8YG9rvO4Sb09xBm2HhUM0Sa/0UICRxL/EzRCGQxLYhIglENIwUDJjcrRJhP3Rhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862346; c=relaxed/simple;
	bh=lSCgDLFkm+uTp6BBbwhp0BqZSIhLiEfIj/xbmsFVQEQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=QfL1G82auYKK1CQIH1YizSF1ZnEPV38GYmRCo22kT/BIcnXdsJvdCgCGUqIA42nEyrXbSLpyYjF1eSexuqMR3ivb+Buv6ZLeC1vUKdrWOuxK9t05Tp1tUsopbdz13ltVTOCNq+CpRqsi4ypitjPquI2gqR4l2mzlIL1bxO9Vxc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Hwt3GJtH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Hwt3GJtH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so5724525e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745862342; x=1746467142; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/CANhKWFmJawB0p8jQ/NyjybjgGkYzY/3LSqUuDHX0=;
        b=Hwt3GJtHh4j5IJHmVgpYNdakLAlsIO87ZYX7XBNZtOLvgv0Io1+LZ01V6ua2QFtNaJ
         GvJ+qWQ8FtildThMCkmoWnT4i9Prb3kb2senYv/F75eZGghFscWJJj/KZhOB3vq4fLOf
         ktzof6xBZtngYUPqjvzo4XTqq2CXyOeIi0HpT4r0CWvAzhjoBGXesjI0H91JmseEAfmt
         kbn8KUutFLahP5xWtAaF12BNxgqf05+Jz1IoYlQGlRuU3bd5dunBzK2hp3lgLrB+MUG3
         ZFjq/vwZc4O+oiy9OD/B92Q18vhh8jE43SqnAF+n4VqyBjw5XjHr8iOF5t/ugSHy/o09
         mKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862342; x=1746467142;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v/CANhKWFmJawB0p8jQ/NyjybjgGkYzY/3LSqUuDHX0=;
        b=tgd4WHiOq2OCl+pZMC156eGamOhBCbvzhPQsZi/zhq1iRCu5iMu671wZWlpPOV/2+9
         TXzQ02MlJRWNPWbPtYwJMxZkPKpJrWRfjrWQVFKihd3KZNtfA2m3wzAafgshqVqoD6vI
         qb+fo1H2P6lZrEusxZ4L/YzVcRgP/rygGaSWhjmKEcFNVAp+VWBwCoxyGVt3cbCab3ZF
         EJKrNDYTvv4E0aRIXdH7PVTMv0+PCDVh4m4W2qCGTAFHnSGmhoxm8rMqDqCA5uSueGsD
         LNEXPsPqN9A9YuwS7kUtLPMfv5JQb0t08TAeC9fcX1QXDoU+mgTz/Hw7/UGBIrdAYPKb
         +/OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWADM7CUhoZS2KXxFAYm5lAGMnk93n8OJv3hyaMmqE6NOOYAbbQHF6H3ks912rskOAHR7vUbVAs6yEfzmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLkUEe48eGM1HWGWZ3/XLJaMt9wT8HFFBmzBWdTjqj6fkaVjgE
	62cxte1eBP3p7fbyWVa+FAnRNqWyjhQNJdE2Zxkf1bSkqRkVjF3ptH6hejtfimQ=
X-Gm-Gg: ASbGncuCAJ4uJywMw0yJ5A3rN4azmQLe+y4lIgbq9WG+lab1kg80g9eAjnVj2bx5Ig/
	Tqc5t+JivX4CylTjRCEWY/V0YkNLRyC2lZQJ8go87zVKCkdm/Z2pM+gszdYJuRtGTzDwOaBYWTO
	P7CwldQRAH0m1J2DRiPSN671ibLPJYyiEfYcexAWdoSW1sUgOJbAI+BNbOs0xjG5GQ9gUBgpfDF
	1/IMsuqWurF2T/tj1kpU7kMFrR2ddsQqm5/eLEvzKe5KgxJ0Wftt1dma7OhvBhbA1mGDYyCEQLD
	kr/srCPenx1VwVN8ffQOvDBzamdmrT9REQbvrE+Y/SdacT8=
X-Google-Smtp-Source: AGHT+IEvyyRwv+siNkS/+KKa7cPTZaQ24k7dR1L6NM8zAaZ/ZacC5UiUMQME2xFD4O4sKzfsTBeP0Q==
X-Received: by 2002:a05:600c:3b82:b0:439:9fde:da76 with SMTP id 5b1f17b1804b1-440a634912dmr44268285e9.0.1745862342603;
        Mon, 28 Apr 2025 10:45:42 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:785:f3a7:1fbb:6b76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46a54sm11977490f8f.67.2025.04.28.10.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:45:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Apr 2025 19:45:41 +0200
Message-Id: <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming
 runnable
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Mayuresh Chitale" <mchitale@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com>
 <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
In-Reply-To: <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>

2025-04-28T17:52:25+05:30, Anup Patel <anup@brainfault.org>:
> On Thu, Apr 3, 2025 at 5:02=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcm=
ar@ventanamicro.com> wrote:
>> For a cleaner solution, we should add interfaces to perform the KVM-SBI
>> reset request on userspace demand.  I think it would also be much better
>> if userspace was in control of the post-reset state.
>
> Apart from breaking KVM user-space, this patch is incorrect and
> does not align with the:
> 1) SBI spec
> 2) OS boot protocol.
>
> The SBI spec only defines the entry state of certain CPU registers
> (namely, PC, A0, and A1) when CPU enters S-mode:
> 1) Upon SBI HSM start call from some other CPU
> 2) Upon resuming from non-retentive SBI HSM suspend or
>     SBI system suspend
>
> The S-mode entry state of the boot CPU is defined by the
> OS boot protocol and not by the SBI spec. Due to this, reason
> KVM RISC-V expects user-space to set up the S-mode entry
> state of the boot CPU upon system reset.

We can handle the initial state consistency in other patches.
What needs addressing is a way to trigger the KVM reset from userspace,
even if only to clear the internal KVM state.

I think mp_state is currently the best signalization that KVM should
reset, so I added it there.

What would be your preferred interface for that?

Thanks.

