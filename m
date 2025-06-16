Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6041322612
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750045233; cv=none; b=TEK+KStuScuLVuVNdD90/Szl7S5nLrk4+l41wX0PtbNJRBnKFFeL401zs/4a0f6OVmsUvwCImAyY4KNf/OkjmZACEzznVNqUKMz7v0S5smI6ykuAUesoPG9ixHpIhLMiOffX+pm1CI2U5bPTQ573rRry9wHIkr9t9Q/UaTcVLXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750045233; c=relaxed/simple;
	bh=+wpO5vOrEQ4BK/d9nRdCszBbHM36E175f1TQdxC1fjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNVTNeoj6UQeZranwPnyeswOADFVrBE9afzVnvJzg8CDYsQmAVi4rxJcJHseJKRUkQ8JTehrBMttR+2RzYBVTqafKdyeQJvn4JRugm1GkEL01QubhoWTAW/3sL2r1mBu38nwXPu/WHjs398RIH1W8ZAMmeoM8cR/0ZK4daa5whI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F3OCiW3X; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F3OCiW3X"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2348ac8e0b4so191935ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 20:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750045231; x=1750650031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzgBhndjMqPOT6CtXswDurGqVhDAcemrLGOhUx4RtUs=;
        b=F3OCiW3XY9lfUsfLw8vqTn3DK7Gon8WZZgvjVAA53iL8mDGc+GwT0zSCpAtUjythho
         6KkEc6hVvXCB4mAADcZWVQBPdDDIA0rGQHvyoaGoorSvVf+i4EBc6rDXA6j7+CDJ98NK
         UdhzR4EWi1Sam5sELQmCoEo3jWJHYO/8r3VOfsU2P4Mfqlr+OQdQFY7n793JZ2ui5byt
         iF6EmHqV6kKsqh3YPqtZyNsBLzJkSy3V2oAuWp1QnMcJYCPGftRklxzpaQ/qF4Oop5Dm
         W8iK3z4fmbj8YzqJRSW1M5xzBugVdMiTHIV4xCXPQAszZTBEPPD/l/qzF9insT4lEUON
         DdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750045231; x=1750650031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzgBhndjMqPOT6CtXswDurGqVhDAcemrLGOhUx4RtUs=;
        b=gOL2uidJJhkc/iWdKdwGOOv/Hg8Xv9ldx8nzB0fYLRvlENTUBkiuf2xtJ7LjR5N5Xl
         6ttxMo97WRP/lO6C53XClw/lqmwp9eyMPp0vcO+CtZy67Z9iGFG7+EyTzA7jYudDY7q4
         KOcydACp9OQX5yNMgfRw88OXBgTXoNvcZjL4Pgyr+Fot+FwDBgxyuYv+fWZ036+au9Hl
         oyCYiNBRr9JPuAQly7AEFegKHOpzIjuAMZBiRUcLxion7rwXAA+SOy1mG8Ab6g6QjLyy
         3arK31KLY6QdJM69VRQEhyPt4vyRb/PrPKwKFNChQXCLR9OkOYHTcfXL/fFprZCxeHbt
         rqlg==
X-Forwarded-Encrypted: i=1; AJvYcCUBhZ1t3Eq6lINvWWluCvcMS3FvLFdAuubnjfOcI2JRVx3W6M11O6NRnGGJXUZrgeJYFIjNTGcSJENZoIA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2IcOhO5sUCxUtVHV+4n9Y0kszInE3NRY/k5eXQlS1H6lProQy
	b/NSi7fNtHgcMQwnyuq8gMGDNN62xAJJidVG+mNg7qrD29vqoETrbetzOc6of1JrVQ9QpXRFHA+
	w3Xmncy07S+mcZDIzWCR7fXX2ehifGsr/ena3mnAD
X-Gm-Gg: ASbGncspCD9+3P9z6chrEH6Qmj+c/J3MeFkaQ4sW2U3YiobUsBy7f9jR3yCTuNgCJ+r
	ex7JEnPM3P/JYOnEg9WI1UuSvpep/vchBQdH1N2SmS6gtJXQz2VGyGavJpze3nQeFP6eGgFAZlA
	e/z6V3g8drNDu0B9tIl9EwNFi+pdYpZ0ovZml0su7Okuh+TS2/de8trVtAdmHBcLL8FPdyS6iC1
	1ON
X-Google-Smtp-Source: AGHT+IHXcT2vX9Krkn2g4Zl2kbpzltNtMIZEW8N279/zEVRf9kgxBV4pT/SfkMOq2XO/c2V1t/6FSoNdo+0LBNkxRhA=
X-Received: by 2002:a17:902:d4cb:b0:235:f10a:ad0 with SMTP id
 d9443c01a7336-2366c81e9bamr2824415ad.28.1750045231218; Sun, 15 Jun 2025
 20:40:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611095158.19398-1-adrian.hunter@intel.com> <20250611095158.19398-2-adrian.hunter@intel.com>
In-Reply-To: <20250611095158.19398-2-adrian.hunter@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Sun, 15 Jun 2025 20:40:18 -0700
X-Gm-Features: AX0GCFsFdktkIyRS-z1RXzCrSyF5K7txD3ZwNzQC82fURfZET0jzqjahyxLWu7o
Message-ID: <CAGtprH_cpbPLvW2rSc2o7BsYWYZKNR6QAEsA4X-X77=2A7s=yg@mail.gmail.com>
Subject: Re: [PATCH V4 1/1] KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	rick.p.edgecombe@intel.com, kirill.shutemov@linux.intel.com, 
	kai.huang@intel.com, reinette.chatre@intel.com, xiaoyao.li@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@linux.intel.com, 
	isaku.yamahata@intel.com, linux-kernel@vger.kernel.org, yan.y.zhao@intel.com, 
	chao.gao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 2:52=E2=80=AFAM Adrian Hunter <adrian.hunter@intel.=
com> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Add sub-ioctl KVM_TDX_TERMINATE_VM to release the HKID prior to shutdown,
> which enables more efficient reclaim of private memory.
>
> Private memory is removed from MMU/TDP when guest_memfds are closed. If
> the HKID has not been released, the TDX VM is still in RUNNABLE state,
> so pages must be removed using "Dynamic Page Removal" procedure (refer
> TDX Module Base spec) which involves a number of steps:
>         Block further address translation
>         Exit each VCPU
>         Clear Secure EPT entry
>         Flush/write-back/invalidate relevant caches
>
> However, when the HKID is released, the TDX VM moves to TD_TEARDOWN state
> where all TDX VM pages are effectively unmapped, so pages can be reclaime=
d
> directly.
>
> Reclaiming TD Pages in TD_TEARDOWN State was seen to decrease the total
> reclaim time.  For example:
>
>         VCPUs   Size (GB)       Before (secs)   After (secs)
>          4       18               72             24
>         32      107              517            134
>         64      400             5539            467
>
> Link: https://lore.kernel.org/r/Z-V0qyTn2bXdrPF7@google.com
> Link: https://lore.kernel.org/r/aAL4dT1pWG5dDDeo@google.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V4:
>
>         Drop TDX_FLUSHVP_NOT_DONE change.  It will be done separately.
>         Use KVM_BUG_ON() instead of WARN_ON().
>         Correct kvm_trylock_all_vcpus() return value.
>
> Changes in V3:
>
>         Remove KVM_BUG_ON() from tdx_mmu_release_hkid() because it would
>         trigger on the error path from __tdx_td_init()
>
>         Put cpus_read_lock() handling back into tdx_mmu_release_hkid()
>
>         Handle KVM_TDX_TERMINATE_VM in the switch statement, i.e. let
>         tdx_vm_ioctl() deal with kvm->lock
> ....
>
> +static int tdx_terminate_vm(struct kvm *kvm)
> +{
> +       if (kvm_trylock_all_vcpus(kvm))
> +               return -EBUSY;
> +
> +       kvm_vm_dead(kvm);

With this no more VM ioctls can be issued on this instance. How would
userspace VMM clean up the memslots? Is the expectation that
guest_memfd and VM fds are closed to actually reclaim the memory?

Ability to clean up memslots from userspace without closing
VM/guest_memfd handles is useful to keep reusing the same guest_memfds
for the next boot iteration of the VM in case of reboot.

> +
> +       kvm_unlock_all_vcpus(kvm);
> +
> +       tdx_mmu_release_hkid(kvm);
> +
> +       return 0;
> +}
> +
