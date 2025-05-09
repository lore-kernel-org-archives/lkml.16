Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E092101BD
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793148; cv=none; b=pad2ywnm1aMTesqImIS/uTNpzqZwe6+EVOG1A1JmVhJVH0mAEVwe3qlmXqlMyRir7BJh76S2CQ8Y601BnCEKkHdSEgA+G6nBT5zAwG5O+ZVnT83chp0CXsVFU/1KFoNkCQje4hfCU9prBCmM2FkKYl6jq5CCAEPWU6A/M0LCysQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793148; c=relaxed/simple;
	bh=I9lohDPdmFs4TvTywTloSyFtR5va5Ojwx6cb1xXK0AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0H6+Oy2ohp9TIlJG1jddCPWsAyv/NcyeSf8SsAMAcVAdXSLWXHib8cwFL5WUm8GHXzkNiu3b/fOcj/QnW5+gLVxeIhwHYUsLHkJskaTafYyRpq/3YKVyT/U0Z6vrKa1RcwFOf6fDD1/YBSYx8orJiLXGbf5gKyb/V+45+YaeD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=h7VpY1KC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="h7VpY1KC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-441ab63a415so19767345e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746793145; x=1747397945; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYWWMGA9lFBZFwBTKYu7MXSa19JW4QPiS7W3A2vxafc=;
        b=h7VpY1KCSYQweUVjXlvSpNNuqKOHWFbrNR8gxlqYoU8pbfoJOMrBUK9EntzHaN6W+G
         pV1gj46tcbHihXtrmx+zu4T0zSZwI/h/ZYPpwwkn0qtMOF75LDpv+1UGzPF9KpcPHP+j
         +fa1LCiwn5j6or/M2tbXOsa3T4bzPg6Uv3aBeiuMQO2e9BknJgTnzZDKxExecRIe9md8
         fofiH2nZ6teuuZkhMenM8tI1SdiE877KN4cPJqCDxpSRia3qfvH+3bGNmncKi/Ec4eum
         JE1q1HmR7P19vdrKRbi1HQQnB1im9jqcm22PpnRK+y8d/9EF1obAQArhWfSI5AkkB0Bk
         eVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793145; x=1747397945;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYWWMGA9lFBZFwBTKYu7MXSa19JW4QPiS7W3A2vxafc=;
        b=sYx1iAB83aGw3ro/oP3AksErGmYQDyEeHk1i9gicZ7Nzt3hxAyE+SygFR4Q1Fcju0E
         DWgpEHxiOYPKOj5AG/oVtS85/DASh/rC865sR1Wa3VyARTg/CUL6AOui6iWazasRuPx1
         afUanHHm4VQpIRwqFrz+zoGFolaASI4HgyAXe12qU9asuJha1oBFbFGVPXTLj8At666X
         fOKlSB87+Cv4ijn2+nGtCj9G07tLZ8paglzV9w+VYOnmyNp6pCI458xpcLoepWbis6Y1
         RHoGG7i6R2H1zBOoUyHUC/Iha0ea6DDcyz+NJPvlbtnhh/IUR+zmX8B9NSvQ40j2H8cB
         FaaA==
X-Forwarded-Encrypted: i=1; AJvYcCXg8ZqIWcgi/TuChcLucTcklO9gIGnnvp8IP3k0tR8N00YqJHwVRHs4mOO1z75a8ugDcvcKPAzk0otsDxk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6wm5gXnhcC1pVmaEkjiU829Y13WH5kj0w1fcBCmlxe+TX/gxi
	Ji+I2jLGGQtBTSHptRhts4IkoMgVyBID5KrTIv8gDP8f9d+eXT2OZBB/1gq3iWc=
X-Gm-Gg: ASbGncveyqQCnIJj3iPwwmgRuJ9ZHK7VMwd/OZGpZpYvmJgG2SISY0z55wi9Cu7FnAI
	o2qIni6Njwzlv1wqujmo95+vU7ErbLCYXFLvd+6BNpva9T1iEqyZ0y1dgi2nUXN6U+srzyWULOw
	HCOYNCnL41gI2/UxjZT+5AR162TAmBfbRQlszXfp9SPOSiM/ASN+pEMrJDzdCnotL3b39CebUUa
	RpjSHA75EURDElxURsLrr3jh/OPQrkwPBx6ZQvbeY0w42ThjpaGo17oTVwA2JERx3AT2VCiEvLv
	3yheilJl6w2ya1p1vsafpiI6TY2o
X-Google-Smtp-Source: AGHT+IHRvpoEOT4UewNsN8KepaxHw/rtKZiDOTYSwD9xFrN8ARTxLI7Pzt+/OC51njY+2qGyohZrhQ==
X-Received: by 2002:a05:600c:6307:b0:43b:c284:5bc2 with SMTP id 5b1f17b1804b1-442d6c36448mr32832675e9.0.1746793144451;
        Fri, 09 May 2025 05:19:04 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::ce80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd34bef4sm71800985e9.24.2025.05.09.05.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 05:19:03 -0700 (PDT)
Date: Fri, 9 May 2025 14:19:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET
Message-ID: <20250509-0811f32c1643d3db0ad04f63@orel>
References: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
 <20250508142842.1496099-4-rkrcmar@ventanamicro.com>
 <CAAhSdy2nOBndtJ46yHbdjc2f0cNoPV3kjXth-q57cXt8jZA6bQ@mail.gmail.com>
 <D9RHYLQHCFP1.24E5305A5VDZH@ventanamicro.com>
 <CAAhSdy2U_LsoVm=4jdZQWdOkPkCH8c2bk6rsts8rY+ZGKwVuUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhSdy2U_LsoVm=4jdZQWdOkPkCH8c2bk6rsts8rY+ZGKwVuUg@mail.gmail.com>

On Fri, May 09, 2025 at 05:33:49PM +0530, Anup Patel wrote:
> On Fri, May 9, 2025 at 2:16 PM Radim Krčmář <rkrcmar@ventanamicro.com> wrote:
> >
> > 2025-05-09T12:25:24+05:30, Anup Patel <anup@brainfault.org>:
> > > On Thu, May 8, 2025 at 8:01 PM Radim Krčmář <rkrcmar@ventanamicro.com> wrote:
> > >>
> > >> Add a toggleable VM capability to modify several reset related code
> > >> paths.  The goals are to
> > >>  1) Allow userspace to reset any VCPU.
> > >>  2) Allow userspace to provide the initial VCPU state.
> > >>
> > >> (Right now, the boot VCPU isn't reset by KVM and KVM sets the state for
> > >>  VCPUs brought up by sbi_hart_start while userspace for all others.)
> > >>
> > >> The goals are achieved with the following changes:
> > >>  * Reset the VCPU when setting MP_STATE_INIT_RECEIVED through IOCTL.
> > >
> > > Rather than using separate MP_STATE_INIT_RECEIVED ioctl(), we can
> > > define a capability which when set, the set_mpstate ioctl() will reset the
> > > VCPU upon changing VCPU state from RUNNABLE to STOPPED state.
> >
> > Yeah, I started with that and then realized it has two drawbacks:
> >
> >  * It will require larger changes in userspaces, because for
> >    example QEMU now first loads the initial state and then toggles the
> >    mp_state, which would incorrectly reset the state.
> >
> >  * It will also require an extra IOCTL if a stopped VCPU should be
> >    reset
> >     1) STOPPED -> RUNNING (= reset)
> >     2) RUNNING -> STOPPED (VCPU should be stopped)
> >    or if the current state of a VCPU is not known.
> >     1) ???     -> STOPPED
> >     2) STOPPED -> RUNNING
> >     3) RUNNING -> STOPPED
> >
> > I can do that for v3 if you think it's better.
> 
> Okay, for now keep the MP_STATE_INIT_RECEIVED ioctl()
> 
> >
> > >>  * Preserve the userspace initialized VCPU state on sbi_hart_start.
> > >>  * Return to userspace on sbi_hart_stop.
> > >
> > > There is no userspace involvement required when a Guest VCPU
> > > stops itself using SBI HSM stop() call so STRONG NO to this change.
> >
> > Ok, I'll drop it from v3 -- it can be handled by future patches that
> > trap SBI calls to userspace.
> >
> > The lack of userspace involvement is the issue.  KVM doesn't know what
> > the initial state should be.
> 
> The SBI HSM virtualization does not need any KVM userspace
> involvement.
> 
> When a VCPU stops itself using SBI HSM stop(), the Guest itself
> provides the entry address and argument when starting the VCPU
> using SBI HSM start() without any KVM userspace involvement.
> 
> In fact, even at Guest boot time all non-boot VCPUs are brought-up
> using SBI HSM start() by the boot VCPU where the Guest itself
> provides entry address and argument without any KVM userspace
> involvement.

HSM only specifies the state of a few registers and the ISA only a few
more. All other registers have IMPDEF reset values. Zeros, like KVM
selects, are a good choice and the best default, but if the VMM disagrees,
then it should be allowed to select what it likes, as the VMM/user is the
policy maker and KVM is "just" the accelerator.

> 
> >
> > >>  * Don't make VCPU reset request on sbi_system_suspend.
> > >
> > > The entry state of initiating VCPU is already available on SBI system
> > > suspend call. The initiating VCPU must be resetted and entry state of
> > > initiating VCPU must be setup.
> >
> > Userspace would simply call the VCPU reset and set the complete state,
> > because the userspace exit already provides all the sbi information.
> >
> > I'll drop this change.  It doesn't make much sense if we aren't fixing
> > the sbi_hart_start reset.
> >
> > >> The patch is reusing MP_STATE_INIT_RECEIVED, because we didn't want to
> > >> add a new IOCTL, sorry. :)
> > >>
> > >> Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
> > >> ---
> > >> If you search for cap 7.42 in api.rst, you'll see that it has a wrong
> > >> number, which is why we're 7.43, in case someone bothers to fix ARM.
> > >>
> > >> I was also strongly considering creating all VCPUs in RUNNABLE state --
> > >> do you know of any similar quirks that aren't important, but could be
> > >> fixed with the new userspace toggle?
> > >
> > > Upon creating a VM, only one VCPU should be RUNNABLE and all
> > > other VCPUs must remain in OFF state. This is intentional because
> > > imagine a large number of VCPUs entering Guest OS at the same
> > > time. We have spent a lot of effort in the past to get away from this
> > > situation even in the host boot flow. We can't expect user space to
> > > correctly set the initial MP_STATE of all VCPUs. We can certainly
> > > think of some mechanism using which user space can specify
> > > which VCPU should be runnable upon VM creation.
> >
> > We already do have the mechanism -- the userspace will set MP_STATE of
> > VCPU 0 to STOPPED and whatever VCPUs it wants as boot with to RUNNABLE
> > before running all the VCPUs for the first time.
> 
> Okay, nothing to be done on this front.
> 
> >
> > The userspace must correctly set the initial MP state anyway, because a
> > resume will want a mp_state that a fresh boot.
> >
> > > The current approach is to do HSM state management in kernel
> > > space itself and not rely on user space. Allowing userspace to
> > > resetting any VCPU is fine but this should not affect the flow for
> > > SBI HSM, SBI System Reset, and SBI System Suspend.
> >
> > Yes, that is the design I was trying to change.  I think userspace
> > should have control over all aspects of the guest it executes in KVM.
> 
> For SBI HSM, the kernel space should be the only entity managing.

The VMM should always be the only manager. KVM can provide defaults in
order to support simple VMMs that don't have opinions, but VMMs concerned
with managing all state on behalf of their users' choices and to ensure
successful migrations, will want to be involved.

Thanks,
drew

> 
> >
> > Accelerating SBI in KVM is good, but userspace should be able to say how
> > the unspecified parts are implemented.  Trapping to userspace is the
> > simplest option.  (And sufficient for ecalls that are not a hot path.)
> >
> 
> For the unspecified parts, we have KVM exits at appropriate places
> e.g. SBI system reset, SBI system suspend, etc.
> 
> Regards,
> Anup
