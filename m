Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136CC1F8923
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270448; cv=none; b=ndFFEategTh+RVyl7Yj9yV6dHRT29puhwrBeJ+XgrORH+D6IGuUdM7o042ScsRx6VvwhIMjeAB1YdF108lAvgatwGH1vAtlXYzdoVmsuk76TDR/twUuboAcBoBHqanS98JNiCJnhyGCtpJ+ch7Nq9LeyHZYWyao4ke/xjUN3BK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270448; c=relaxed/simple;
	bh=btgsMkB+KatSBhW2xvQ/HbfeImWKcXqMZC5wzTOtkqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QteYQI7H1ZNK8a0m/og106FvKmzqmUVa+f7u3hMh5nafwNP/bvEz665aXEr0wGyVS/+5P7zumpPbld0jJbiRJvhGChf0h0HVmnx0hYMnk/AglOSBZc4UzYQfxUOAhG1mkwoa3DP6tnZ7XESlR5PYJxaYsGPq/sIsUYqZibnRWp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bcKHDssX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bcKHDssX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739270446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=btgsMkB+KatSBhW2xvQ/HbfeImWKcXqMZC5wzTOtkqg=;
	b=bcKHDssXWdYJsRk39fgGWto2mv9jaMIkZ5liJlrWkfWwAZoURXhExYE+gxd1UBsi4MmP0/
	US+H8b+MZpdeEKvRLkd7gsJ5E5wdulCSiLPG5VvrUqky5ogNvC5ld2aj9D/8qrRRfZASMO
	IaME3XOSGCEifiR+VIjNK8dZia5ZO0g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-VD_WlLu5PWOdTEIwLO1fAA-1; Tue, 11 Feb 2025 05:40:43 -0500
X-MC-Unique: VD_WlLu5PWOdTEIwLO1fAA-1
X-Mimecast-MFC-AGG-ID: VD_WlLu5PWOdTEIwLO1fAA
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4394c0a58e7so7839755e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:40:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270443; x=1739875243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btgsMkB+KatSBhW2xvQ/HbfeImWKcXqMZC5wzTOtkqg=;
        b=J9wxr7nRHKqefex1FhRspVw2egA8KdC+xqnDXsCPtO6A4PoKXLYA5ryw28lixBS2+E
         vUYnVOmdVsSMEPCwoAZ6tXH+1ogiIYCoJmBpkSg7gTJD1aWyeO5Pbo1qtkJCK0qwprqu
         TOi3el4mBbEahn0KPEhsuVQBuhWNXnvtUgAwk0lOOmW+rKzVBnGpGhh3Ba6oTKad7bWQ
         1xIu7AKo4AUDjuSiPwL2LcuR8QJPR9N7LJQaOxweewOqu3ThZPaHFkH5V3LDuxXBHjF5
         cvZIcleN8OZRCUUfi11I+KK2njKdPKEIGQBstTm41jdzBrUG16L+WhGLKUEdBqML+Ocq
         kfWw==
X-Forwarded-Encrypted: i=1; AJvYcCWpHu32O03zPcHfjLlQrNF4vA7dTMqHwJ76xqB4tocroD9ILwTRzg8zyoCpkGD1X14dJlHbQrSm824ntQM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/YTjEHGV+SzpTQa0kDUHx6mq1I9FHwkXs0w6pCDMZnyXptEeY
	kFU381QPowTZc560wmDZc3ZQLb6iT61ujWMerU7bkDH2HvlY6Z1NIfMtq+Pd6Xt8xbatStJw0Pj
	V5EwpSSdluglp4Zl01K3A7Aq2jFwIv0pEP4UesppIAH+wuHuYlgtiyzhE96i+B6MqlRMmyhAw2k
	Sl0QD1vDtR1Y5mh1zLDcxCUWhAGVtp/SUqggTl
X-Gm-Gg: ASbGnctV30f81+Vn0qrEyG9OMvd86yFl5G9Fyb476ZJGZrtAOT3wr8ZULxPtlBa+MDk
	AP6Q0QtcPaOmwzcM4ShtZnJZFkQ6ifiAslrjynGLUbDyqX2ZQXtShIvFHHtFq
X-Received: by 2002:a05:600c:c07:b0:439:4832:325f with SMTP id 5b1f17b1804b1-43948323427mr44529305e9.1.1739270442747;
        Tue, 11 Feb 2025 02:40:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbumiPynQJLdfXR/hK61jc+qEpAs+mRfIkPjt8BvK5dw/XkyvYRl2OENNVY4nN2HiUviGg5p2QXMZIr5RQ2vU=
X-Received: by 2002:a05:600c:c07:b0:439:4832:325f with SMTP id
 5b1f17b1804b1-43948323427mr44528985e9.1.1739270442437; Tue, 11 Feb 2025
 02:40:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211000917.166856-1-mlevitsk@redhat.com> <20250211000917.166856-3-mlevitsk@redhat.com>
 <87seok25qx.wl-maz@kernel.org>
In-Reply-To: <87seok25qx.wl-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 11 Feb 2025 11:40:29 +0100
X-Gm-Features: AWEUYZnT1g0RdyJqMZtSUMcVn2SB8z3GSQjhvL_omNqa0pSFmSAU_EQ9poyWn3Q
Message-ID: <CABgObfa6DGM4X5HKb6FHoeiitTp4ddVaUGLRqK+Z=a-JLc9Bzw@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: arm64: switch to using kvm_lock/unlock_all_vcpus
To: Marc Zyngier <maz@kernel.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, 
	Jing Zhang <jingzhangos@google.com>, Oliver Upton <oliver.upton@linux.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Randy Dunlap <rdunlap@infradead.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, 
	Ingo Molnar <mingo@redhat.com>, linux-riscv@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, kvmarm@lists.linux.dev, 
	Alexander Potapenko <glider@google.com>, x86@kernel.org, Sean Christopherson <seanjc@google.com>, 
	Anup Patel <anup@brainfault.org>, Kunkun Jiang <jiangkunkun@huawei.com>, 
	Atish Patra <atishp@atishpatra.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 10:25=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
> > No functional change intended.
>
> Actually plenty of it.

Yes, definitely. That's not "no functional change intended", it's "no
breakage of sane userspace intended" which is pretty much the
opposite.

> Yet the new helper returns -EINTR, which you blindly forward to userspace=
.

It won't quite reach userspace, since the task won't survive
mutex_lock_killable(). With your current code the kill will arrive
just after the ioctl returns to userspace, so there's no change in
behavior there. The -EBUSY change is the one that matters.

> At the end of the day, the x86 locking serves completely different
> purposes. It wants to gracefully wait for vcpus to exit and is happy
> to replay things, because migration (which is what x86 seems to be
> using this for) is a stupidly long process.

No, it's not using it for the whole length of migration. It serves the
same exact purpose as ARM: do some stuff on something that spans a
whole struct kvm. The only difference is the behavior on contended
mutex, where x86 simply says don't do it.

> Our locking is designed to
> either succeed or fail quickly, because some of the lock paths are on
> the critical path for VM startup and configuration.

The only long-running vCPU ioctl is KVM_RUN and you don't have that
during VM startup and configuration. The interesting case is
snapshotting, i.e. reading attributes.

Failing quickly when reading attributes makes sense, and I'd be
rightly wary of changing it. I know that QEMU is doing them only when
it knows CPUs are stopped, but it does seem to affect crosvm and
Firecracker more, for snapshotting more than startup/configuration.
The GIC snapshotting code in crosvm returns an anyhow::Result and ends
up logging an error with println!, Firecracker is similar as it also
propagates the error. So neither crosvm nor Firecracker have
particularly sophisticated error handling but they do seem to want to
fail their RPCs quickly.

Failing quickly when creating the device or setting attributes makes
less sense (Firecracker for one does an unwrap() there). But anyhow
the change would have to be a separate patch, certainly not one
applied through the generic KVM tree; and if you decide that you're
stuck with it, that would be more than understandable.

> So for this series to be acceptable, you'd have to provide the same
> semantics. It is probably doable with a bit of macro magic, at the
> expense of readability.

Or it can be just an extra bool argument, plus wrappers.

For RISC-V it's only used at device creation time, and the ioctl fails
if the vCPU ran at least once. Removing the "try" in trylock is
totally feasible there, however it must be documented in the commit
message.

Thanks,

Paolo

> What I would also like to see is for this primitive to be usable with
> scoped_cond_guard(), which would make the code much more readable.

