Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196B528751C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444957; cv=none; b=TyfQRDFjNBilVp1vklzgE40qE5bB9GOot8xm8ri/QFcbq49PkW+//DhFhDDdV/6hWY6RCAAhEstaBKoeM00G2oimDbMlcB06dB7h3y9N9mBK+dOj4pLogMf9UYfrz9BRbt0evKBykP/CVKsHmQIN8Qpgdno09QgyOGjRkoitzdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444957; c=relaxed/simple;
	bh=KGtEaaBwlHIhkgpfmQwqDMuTdlbyYN5h7Qm5RxxSXeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3duEAVsvSDs9FdIWe8eGYj0olM4wki6tMWTST5UoYd3pVO6om88t1INzhC0+ztWzHtjH37KbrrTXCQMD/cb4/1DVxaLrHO1w9f93s2SHbRuErjVG6dk3PodSUpx2m1ItTWqzCIm10XdQoK7N5rHbLXrTi0zWd9SpEiZGan/W5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=lxYV7tok; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="lxYV7tok"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442ea341570so33749535e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748444954; x=1749049754; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+R8yVTWV7faHDggV+H50he2EYWDm1F+x1P6wR58APkU=;
        b=lxYV7tokltM6rw8W6hvxqoaqJKHMyJzsoeyxKJBr4d+1VeR3yJzRM1RrnCBiGfEKnm
         JjjSfefUUdHKdIJZe3bg970fh5cTUhj5cPANC9jBJtxFDgNQbtqZwH7/Jb7U2YBZacDp
         QZMzrsqDZDZHDvs3CplKKfZXP5Pt8AjwH/m2Z8XvBRNaqfZJamzvg+IXcxxFoZK3MPuw
         qKF4o2n6p9ydtmwV1VfwqeBMXyFCfPi3i4JQ4WEdzjE3DxmrqrtLv4mMmdLyNobM/Nqc
         /cSyaSQXaye8n7PmMTFeWMXaXuH4JIddabLzgXZcWvdc9BpKSkY6+IyWzZRXbG1Dt9Tv
         gMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748444954; x=1749049754;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+R8yVTWV7faHDggV+H50he2EYWDm1F+x1P6wR58APkU=;
        b=SCZJEpvz5pBv0ZGrJ4tjZUo3YPREOGMnsl8rwmbljMGTf/TWGm6RFv1lUcR2/q5jyN
         HUZ6LCI6DeeFPN/4kcCBPhmnPh5t1MaaD0Sw0dtNwmCDI+B8FoubkutevvSucKr2Q5/Y
         7OhQ9ZYVbOlZKIR79PIw/dMwHSBswLlcxKFbvXpbQ46ay1MBvSw1Ayop10tH97890CIO
         ElOoGk0bZp+y4yRHYsZTSw1amrINnKjc6Ew6unKLGHUDUqGCnE+EUr7+kdEbQdasPs66
         eRu2ZAefDh4fUB6irgfIoMP4axEedjgQqDNxxP1M1Au+1tr0IdCNU20LsOJez04zjcNu
         fgbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVghmY1athrnPvddcgheB31/eCvstq3WEAjRDX4xlsO3pr/IoJWGkdPPW573NUsso4IQZUsLt8SphfqEqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuhJnUCHGche7k6wYXUNoodyKElBJCIHWRrpavTXDsSyGI1EA7
	Jy1sMKPW2+6MlacXiad/Cv6Zky9/QYRXmp8dYaSpJIhTlq/3baBQv9IVmauvLHRsn48=
X-Gm-Gg: ASbGnctCUVIamThfBbdyBiqYrr79h0WtH/I0ST108HMHhLEDwO4uD4mgINEY+ohRFUX
	DwnFDquS0b/hvp+R+3//j+szGSzSXFy1oggWw13j2zY01rjeOmolTc+/mqWEEDCIw6AXDD7a1gt
	4Hfr2ueu1vYKhgva6s39z2NYM4c01USLV6qlcMkqRzFt1qnAzA87wU354vgUKezvxT+3dCudIfP
	8ofZt0TtSxP9CNv/CdhGZQVsZr9b39K6SUk7EWENY3Jd7bdfWybZDl4/6RmYqx6c83rf7k+6T0Y
	9Xc7Rv3HetwGZC8N3Xt1bT7mdxqoLAmdRdDbqmI=
X-Google-Smtp-Source: AGHT+IGlaccgtVXoxgdtRY0DaxB5E5oM1xLtWSVzQKwZmQedIB076PoZ1cGVyfI0Vth+zZs2F/ULAA==
X-Received: by 2002:a05:600c:8487:b0:442:d9fb:d9f1 with SMTP id 5b1f17b1804b1-44c933ed9bbmr168819085e9.4.1748444954154;
        Wed, 28 May 2025 08:09:14 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::ce80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064ae525sm24810625e9.21.2025.05.28.08.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:09:13 -0700 (PDT)
Date: Wed, 28 May 2025 17:09:12 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
Message-ID: <20250528-ff9f6120de39c3e4eefc5365@orel>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>

On Wed, May 28, 2025 at 07:16:11AM -0700, Atish Patra wrote:
> On 5/26/25 4:13 AM, Andrew Jones wrote:
> > On Mon, May 26, 2025 at 11:00:30AM +0200, Radim Krčmář wrote:
> > > 2025-05-23T10:16:11-07:00, Atish Patra <atish.patra@linux.dev>:
> > > > On 5/23/25 6:31 AM, Radim Krčmář wrote:
> > > > > 2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
> > > > > > Upgrade the SBI version to v3.0 so that corresponding features
> > > > > > can be enabled in the guest.
> > > > > > 
> > > > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > > > > ---
> > > > > > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > > > > -#define KVM_SBI_VERSION_MAJOR 2
> > > > > > +#define KVM_SBI_VERSION_MAJOR 3
> > > > > I think it's time to add versioning to KVM SBI implementation.
> > > > > Userspace should be able to select the desired SBI version and KVM would
> > > > > tell the guest that newer features are not supported.
> > 
> > We need new code for this, but it's a good idea.
> > 
> > > > 
> > > > We can achieve that through onereg interface by disabling individual SBI
> > > > extensions.
> > > > We can extend the existing onereg interface to disable a specific SBI
> > > > version directly
> > > > instead of individual ones to save those IOCTL as well.
> > > 
> > > Yes, I am all in favor of letting userspace provide all values in the
> > > BASE extension.
> > 
> 
> We already support vendorid/archid/impid through one reg. I think we just
> need to add the SBI version support to that so that user space can set it.
> 
> > This is covered by your recent patch that provides userspace_sbi.
> 
> Why do we need to invent new IOCTL for this ? Once the user space sets the
> SBI version, KVM can enforce it.

If an SBI spec version provides an extension that can be emulated by
userspace, then userspace could choose to advertise that spec version,
implement a BASE probe function that advertises the extension, and
implement the extension, even if the KVM version running is older
and unaware of it. But, in order to do that, we need KVM to exit to
userspace for all unknown SBI calls and to allow BASE to be overridden
by userspace. The new KVM CAP ioctl allows opting into that new behavior.

The old KVM with new VMM configuration isn't totally far-fetched. While
host kernels tend to get updated regularly to include security fixes,
enterprise kernels tend to stop adding features at some point in order
to maximize stability. While enterprise VMMs would also eventually stop
adding features, enterprise consumers are always free to use their own
VMMs (at their own risk). So, there's a real chance we could have
deployments with older, stable KVM where users want to enable later SBI
extensions, and, in some cases, that should be possible by just updating
the VMM -- but only if KVM is only acting as an SBI implementation
accelerator and not as a userspace SBI implementation gatekeeper.

Thanks,
drew

> 
> > With that, userspace can disable all extensions that aren't
> > supported by a given spec version, disable BASE and then provide
> > a BASE that advertises the version it wants. The new code is needed
> > for extensions that userspace still wants KVM to accelerate, but then
> > KVM needs to be informed it should deny all functions not included in
> > the selected spec version.
> > 
> > Thanks,
> > drew
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
