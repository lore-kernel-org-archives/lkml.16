Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CFB27933A
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780370; cv=none; b=CL3eVW9MzH2dt8pgbasicgwM19B5ca76DXgwFzvkZ6S+D3+82/2HCds6+tqzoQpY5DxHAT2K4G6pasrUcafaMAas9jWu5ZwGxNvxXESKz8PYfOkuWmJhDBTYHEpTGDb0OOFuH7X8Sfqhqp3SbsAkNB4SFq0/9Jj+j/gg/Ieh/Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780370; c=relaxed/simple;
	bh=Hd8W86XpSOoLd0GepwRihQjFEF41vT6S64z6qugV81E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=qyBFbNZJ5XoAAfwbb1tHHCnjV+6RLNfwlZSuWR4zEVA1u7TS5kuG1itgwY38bEtV2C8dtqit2i6EyPS0X1o3ukqHj6pWkUw9a/ckzpnmJuUod9NJpWN+NY0q43uc+M3i2X4Q2QVcNUb3LgokCOVZl+qmkVKuLp8tWzO1eeVIixs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=CXcxcedS; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="CXcxcedS"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f76a47549cso313176a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746780367; x=1747385167; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGiJMRlH7N8wVvTRH9S0DCs9CUNhc8t6xLRe72oOUGs=;
        b=CXcxcedSkeUijGPctEMJ3D/qIaLgNd72v8mQQXSLaknTS4swjT4y8m2GUD5uGv2Qur
         2Y1QqVyHHatCKdemVtRF/WgZhw83Ze+aVxcAwfu8UFRwKpMnc4hmo0S7uwvErQIIv6JA
         r0lBlBYb+WxydP9ku+hmEHm+kN0oCAbTKsGDzC9ZeBzY6IhAswiQAnSHy8IBP5QUE39P
         H0n4pXmaaNA/rgytgZUjo/9XCuhkDsrfiq/aklJvWX/HoTazkZ16QbOa5OLtEYWCVMmn
         oXqbJzjfFT7dq6N02Eka35WtXjhYyySj5PJaCX227XeDRh1R9t580RWnoPUpJDxDT9QM
         Zn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746780367; x=1747385167;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NGiJMRlH7N8wVvTRH9S0DCs9CUNhc8t6xLRe72oOUGs=;
        b=vW3CDQ//CyJnkgSAtdjR1ZTb0Ckyle8fsUl/iaDrXuKzbe6EE460zt9hXuox9d3rns
         Gk4EO8vPQtDmVvpK6DHH4B9+SvTDtAzdtc/skXc8SYAJ0m6yEQe5EFlCQ/D9V9vKNAN0
         /+C6SH3u7OQzrG4c6jENPT0SjU5Iqt/53ViKsQyuZRWpeO9SgnzvI7DJNWcqKSwd0Jg3
         tBAFAEP9IXg+Ux3CBjQ8cDaw3m2XE57yoiRy/CkBy8buwBVHgUy/ZI7r+5q4Dx1LKfk4
         U5677hxczkBme4p7V8Aj7w+3uF63Zi+lemxgbNKJZGDWV4B0hReVMGYRe4pwNmroZwwG
         6E2A==
X-Forwarded-Encrypted: i=1; AJvYcCVBc4puWt1doaYzBcCy7mv0tCuAB5nAhbPic077xW4Qzd0m9xIrYV4af079WisQlBtBdofhA7kWhSH2JBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPbPmJyJflXR70fq7vmJP7fZChLxu+ajcgzqWVrLlsfKRpqeQx
	8yUkFnD8WIy6HlxXF3QSUNcn3btMsUBkDstoIPsEjM7cZH5sZ34kzfG0UmV0dgI=
X-Gm-Gg: ASbGncuc0+NWWkSsQSUV/9HYG9ns/L+e57xlgK2vYKzM5LYu+buixdJUtiE1nJBkBDB
	P3jISOqfU9o4saMw3ldJEri+INE14QI/eJSqi4JRdY2I4lJ0Wi2dhtC0wueZujvj9L6ziLJrW2m
	BESCd1fiQcZBAlx2UANOCrepFbfru1UQ/n7295P+ZncGqrRGA0mGkcWISqC8V4g+Fz6S9ICon6a
	moT9EZZQp7QVl/s3eZeAKoyw7giZ9xD3X8aU5kHrI5jStY/u7paDWQLy3cLWdqygVr3McmLXZCj
	9njrvY4GYFB5lLFPu5t5uQVx7GmHAnwOG/0v/nTD2MjNdQbxgOaGKXfCI11t7xOdnFnrE8ndJRd
	q
X-Google-Smtp-Source: AGHT+IGAYEclMsV5S50C0hAJ9Rssz25VsqYW3XofjFIyQasz4bI9bHUIYQ48ZI6cYslINiw1CF431Q==
X-Received: by 2002:a17:907:2e19:b0:acb:1d24:a9e0 with SMTP id a640c23a62f3a-ad219ac5111mr79947866b.11.1746780366510;
        Fri, 09 May 2025 01:46:06 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c93d3sm118978066b.16.2025.05.09.01.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 May 2025 10:46:05 +0200
Message-Id: <D9RHYLQHCFP1.24E5305A5VDZH@ventanamicro.com>
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones" <ajones@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET
References: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
 <20250508142842.1496099-4-rkrcmar@ventanamicro.com>
 <CAAhSdy2nOBndtJ46yHbdjc2f0cNoPV3kjXth-q57cXt8jZA6bQ@mail.gmail.com>
In-Reply-To: <CAAhSdy2nOBndtJ46yHbdjc2f0cNoPV3kjXth-q57cXt8jZA6bQ@mail.gmail.com>

2025-05-09T12:25:24+05:30, Anup Patel <anup@brainfault.org>:
> On Thu, May 8, 2025 at 8:01=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcm=
ar@ventanamicro.com> wrote:
>>
>> Add a toggleable VM capability to modify several reset related code
>> paths.  The goals are to
>>  1) Allow userspace to reset any VCPU.
>>  2) Allow userspace to provide the initial VCPU state.
>>
>> (Right now, the boot VCPU isn't reset by KVM and KVM sets the state for
>>  VCPUs brought up by sbi_hart_start while userspace for all others.)
>>
>> The goals are achieved with the following changes:
>>  * Reset the VCPU when setting MP_STATE_INIT_RECEIVED through IOCTL.
>
> Rather than using separate MP_STATE_INIT_RECEIVED ioctl(), we can
> define a capability which when set, the set_mpstate ioctl() will reset th=
e
> VCPU upon changing VCPU state from RUNNABLE to STOPPED state.

Yeah, I started with that and then realized it has two drawbacks:

 * It will require larger changes in userspaces, because for
   example QEMU now first loads the initial state and then toggles the
   mp_state, which would incorrectly reset the state.

 * It will also require an extra IOCTL if a stopped VCPU should be
   reset
    1) STOPPED -> RUNNING (=3D reset)
    2) RUNNING -> STOPPED (VCPU should be stopped)
   or if the current state of a VCPU is not known.
    1) ???     -> STOPPED
    2) STOPPED -> RUNNING
    3) RUNNING -> STOPPED

I can do that for v3 if you think it's better.

>>  * Preserve the userspace initialized VCPU state on sbi_hart_start.
>>  * Return to userspace on sbi_hart_stop.
>
> There is no userspace involvement required when a Guest VCPU
> stops itself using SBI HSM stop() call so STRONG NO to this change.

Ok, I'll drop it from v3 -- it can be handled by future patches that
trap SBI calls to userspace.

The lack of userspace involvement is the issue.  KVM doesn't know what
the initial state should be.

>>  * Don't make VCPU reset request on sbi_system_suspend.
>
> The entry state of initiating VCPU is already available on SBI system
> suspend call. The initiating VCPU must be resetted and entry state of
> initiating VCPU must be setup.

Userspace would simply call the VCPU reset and set the complete state,
because the userspace exit already provides all the sbi information.

I'll drop this change.  It doesn't make much sense if we aren't fixing
the sbi_hart_start reset.

>> The patch is reusing MP_STATE_INIT_RECEIVED, because we didn't want to
>> add a new IOCTL, sorry. :)
>>
>> Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com>
>> ---
>> If you search for cap 7.42 in api.rst, you'll see that it has a wrong
>> number, which is why we're 7.43, in case someone bothers to fix ARM.
>>
>> I was also strongly considering creating all VCPUs in RUNNABLE state --
>> do you know of any similar quirks that aren't important, but could be
>> fixed with the new userspace toggle?
>
> Upon creating a VM, only one VCPU should be RUNNABLE and all
> other VCPUs must remain in OFF state. This is intentional because
> imagine a large number of VCPUs entering Guest OS at the same
> time. We have spent a lot of effort in the past to get away from this
> situation even in the host boot flow. We can't expect user space to
> correctly set the initial MP_STATE of all VCPUs. We can certainly
> think of some mechanism using which user space can specify
> which VCPU should be runnable upon VM creation.

We already do have the mechanism -- the userspace will set MP_STATE of
VCPU 0 to STOPPED and whatever VCPUs it wants as boot with to RUNNABLE
before running all the VCPUs for the first time.

The userspace must correctly set the initial MP state anyway, because a
resume will want a mp_state that a fresh boot.

> The current approach is to do HSM state management in kernel
> space itself and not rely on user space. Allowing userspace to
> resetting any VCPU is fine but this should not affect the flow for
> SBI HSM, SBI System Reset, and SBI System Suspend.

Yes, that is the design I was trying to change.  I think userspace
should have control over all aspects of the guest it executes in KVM.

Accelerating SBI in KVM is good, but userspace should be able to say how
the unspecified parts are implemented.  Trapping to userspace is the
simplest option.  (And sufficient for ecalls that are not a hot path.)

Thanks.
