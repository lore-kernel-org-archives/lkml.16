Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B2A277022
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792243; cv=none; b=cv2MneVrtSYqa5UCoCSoCzfR9KRLtRYpOMjh9yt4pT2wMzuzGpQ0mobWBU+6UkO6jwZ4CBycpYBncHabelI7HtPVEQLepDrPVakyZV2i62VRnHJrhyWQPDWsSDh7hwiTVhm05QxVTh7TX/78sgsyA5Wv2fx/36VUh16oepnQlcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792243; c=relaxed/simple;
	bh=febGSRdrLcdNcz/MNs5qI7r+1QmVGLqc/6gvMvQ6LfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KzNKx+FZkVphxWC4hT2yDjiF4Ss1OU1eRI6sZGBb+OKxYL7tiCgIXCeyVQAjSEXOKME9iCcdi0/EYTHVqkaKEL8WvNNAKFLLIIHde1SzcptEdtIHCEU+FFedq+VyqfjtxGpnSEnxpYE9hshHNGcAztTehGZ/73qY+Mo9P2KlVFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=COX1iJoP; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="COX1iJoP"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d9327d0720so18148785ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746792240; x=1747397040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CemopbrpuOPESs7KqAo/mdFnUJ307GHWAfAAUzTtio=;
        b=COX1iJoPJDeV197p3lcganUTefShThbH+aINzy8SqP3DFoAEfLo4qmjj1AG0uZjgMm
         qfJcnmdtigb6aQ40A9a4fhvsmSNTuaR8GQjmAKIJF86pYfWqmj9JSehCSFm+x7qD2jr5
         u1ThceuQ31+a1xLROPizpw6MK+ZwPJ9p3cDw9CEQgHr9cOSPZHDVF36lq9OWtBC6H2pZ
         5TAd7gazXITP9wnKAa1pwnq4vBsMjQSx1BNohW6LIOHlN3zSoIrA+vPZN1W0G7675VDo
         mb4XTEX19q2gwFVm/34aekSgL+gAFcgUVQ6tZX+obmr3VGfz3DJ8WLzybVjvcnZsYupK
         2JNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746792240; x=1747397040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CemopbrpuOPESs7KqAo/mdFnUJ307GHWAfAAUzTtio=;
        b=xTpN/XO59z4UKNlekBwor/wL42hgYU2ppl6fp75W3y1BnxAvjoD5PpdBPuxZLllGZ1
         YEDclZOiSNKK+7XyOUo7/7eiScbyvPnHCf0rqw9OaVUTCNbTSN/DvuswMod6YKUhLi/v
         L2swjuQsq66F5w2iGWF42EWUJInsdX5L3vwqooLmRciZTQh0SWNp5e3wbfupTUea255s
         Wx2dZJ8aBqFNsG4gMhspFutufpjSBAUFxd2sm4RVB3G+NcoinVEFJFWQ5oRk6hgOKlHL
         1Bd6IImAnAuaoat+ezUehb7VdI3nvnwEj6SlvexamvBRiz62fJ0T+7TIOLtoTbKb3VBY
         yo0w==
X-Forwarded-Encrypted: i=1; AJvYcCUXd0iyRfVFcQ5qcHKGWwYlu9fS54g4TMweBqfZNcjvHiEJRjYx9pHT0zbrDEeOfAQs9cYPbNiLzZmtl1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjyA1vJehj9HKMwQAC1WVUCtQLMJd1OM/pK3x4QrImUSCh9YhT
	tK4NL7KYT5UIEzn+I9h24ol0vmnTzjkZ45hmfTFF7UC4pObGS0brlQcH/1z/H6VNr96BfwCsnDk
	IYaOeSMbWZlXSfnyKT+kS75+b9SBZxF2UQ+D1gA==
X-Gm-Gg: ASbGncuc3YdZSXx6JRGqRkVFirpjUEwQdFRK6OpNawitj089PfMJokUpw9xdPc/pAOl
	gpheJA+MFaNZANqZnNu2YaBs+Bprbb5V52EdKbk8MWNo85Tjb/d5/ploEUtkBV9i33lrlutmK/I
	YpylbT66A1ofWWjF+tGw4ATaY=
X-Google-Smtp-Source: AGHT+IECSUjDmuckOfBIScHTJxj3yWladB++b87BYQiYMUU7S/HWB3IxwAUCkCTuDfYz1SRdlxZmyMh2LjW4TJKLUvU=
X-Received: by 2002:a05:6e02:b4c:b0:3d9:6485:39f0 with SMTP id
 e9e14a558f8ab-3da7e1e7848mr39704745ab.9.1746792240369; Fri, 09 May 2025
 05:04:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
 <20250508142842.1496099-4-rkrcmar@ventanamicro.com> <CAAhSdy2nOBndtJ46yHbdjc2f0cNoPV3kjXth-q57cXt8jZA6bQ@mail.gmail.com>
 <D9RHYLQHCFP1.24E5305A5VDZH@ventanamicro.com>
In-Reply-To: <D9RHYLQHCFP1.24E5305A5VDZH@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 May 2025 17:33:49 +0530
X-Gm-Features: AX0GCFus3LXSrSKkS2ynuu10JrArNnS8WLRjt1i8r_eLHo_szj5ZQVIc9wOXqvw
Message-ID: <CAAhSdy2U_LsoVm=4jdZQWdOkPkCH8c2bk6rsts8rY+ZGKwVuUg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 2:16=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar=
@ventanamicro.com> wrote:
>
> 2025-05-09T12:25:24+05:30, Anup Patel <anup@brainfault.org>:
> > On Thu, May 8, 2025 at 8:01=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkr=
cmar@ventanamicro.com> wrote:
> >>
> >> Add a toggleable VM capability to modify several reset related code
> >> paths.  The goals are to
> >>  1) Allow userspace to reset any VCPU.
> >>  2) Allow userspace to provide the initial VCPU state.
> >>
> >> (Right now, the boot VCPU isn't reset by KVM and KVM sets the state fo=
r
> >>  VCPUs brought up by sbi_hart_start while userspace for all others.)
> >>
> >> The goals are achieved with the following changes:
> >>  * Reset the VCPU when setting MP_STATE_INIT_RECEIVED through IOCTL.
> >
> > Rather than using separate MP_STATE_INIT_RECEIVED ioctl(), we can
> > define a capability which when set, the set_mpstate ioctl() will reset =
the
> > VCPU upon changing VCPU state from RUNNABLE to STOPPED state.
>
> Yeah, I started with that and then realized it has two drawbacks:
>
>  * It will require larger changes in userspaces, because for
>    example QEMU now first loads the initial state and then toggles the
>    mp_state, which would incorrectly reset the state.
>
>  * It will also require an extra IOCTL if a stopped VCPU should be
>    reset
>     1) STOPPED -> RUNNING (=3D reset)
>     2) RUNNING -> STOPPED (VCPU should be stopped)
>    or if the current state of a VCPU is not known.
>     1) ???     -> STOPPED
>     2) STOPPED -> RUNNING
>     3) RUNNING -> STOPPED
>
> I can do that for v3 if you think it's better.

Okay, for now keep the MP_STATE_INIT_RECEIVED ioctl()

>
> >>  * Preserve the userspace initialized VCPU state on sbi_hart_start.
> >>  * Return to userspace on sbi_hart_stop.
> >
> > There is no userspace involvement required when a Guest VCPU
> > stops itself using SBI HSM stop() call so STRONG NO to this change.
>
> Ok, I'll drop it from v3 -- it can be handled by future patches that
> trap SBI calls to userspace.
>
> The lack of userspace involvement is the issue.  KVM doesn't know what
> the initial state should be.

The SBI HSM virtualization does not need any KVM userspace
involvement.

When a VCPU stops itself using SBI HSM stop(), the Guest itself
provides the entry address and argument when starting the VCPU
using SBI HSM start() without any KVM userspace involvement.

In fact, even at Guest boot time all non-boot VCPUs are brought-up
using SBI HSM start() by the boot VCPU where the Guest itself
provides entry address and argument without any KVM userspace
involvement.

>
> >>  * Don't make VCPU reset request on sbi_system_suspend.
> >
> > The entry state of initiating VCPU is already available on SBI system
> > suspend call. The initiating VCPU must be resetted and entry state of
> > initiating VCPU must be setup.
>
> Userspace would simply call the VCPU reset and set the complete state,
> because the userspace exit already provides all the sbi information.
>
> I'll drop this change.  It doesn't make much sense if we aren't fixing
> the sbi_hart_start reset.
>
> >> The patch is reusing MP_STATE_INIT_RECEIVED, because we didn't want to
> >> add a new IOCTL, sorry. :)
> >>
> >> Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com>
> >> ---
> >> If you search for cap 7.42 in api.rst, you'll see that it has a wrong
> >> number, which is why we're 7.43, in case someone bothers to fix ARM.
> >>
> >> I was also strongly considering creating all VCPUs in RUNNABLE state -=
-
> >> do you know of any similar quirks that aren't important, but could be
> >> fixed with the new userspace toggle?
> >
> > Upon creating a VM, only one VCPU should be RUNNABLE and all
> > other VCPUs must remain in OFF state. This is intentional because
> > imagine a large number of VCPUs entering Guest OS at the same
> > time. We have spent a lot of effort in the past to get away from this
> > situation even in the host boot flow. We can't expect user space to
> > correctly set the initial MP_STATE of all VCPUs. We can certainly
> > think of some mechanism using which user space can specify
> > which VCPU should be runnable upon VM creation.
>
> We already do have the mechanism -- the userspace will set MP_STATE of
> VCPU 0 to STOPPED and whatever VCPUs it wants as boot with to RUNNABLE
> before running all the VCPUs for the first time.

Okay, nothing to be done on this front.

>
> The userspace must correctly set the initial MP state anyway, because a
> resume will want a mp_state that a fresh boot.
>
> > The current approach is to do HSM state management in kernel
> > space itself and not rely on user space. Allowing userspace to
> > resetting any VCPU is fine but this should not affect the flow for
> > SBI HSM, SBI System Reset, and SBI System Suspend.
>
> Yes, that is the design I was trying to change.  I think userspace
> should have control over all aspects of the guest it executes in KVM.

For SBI HSM, the kernel space should be the only entity managing.

>
> Accelerating SBI in KVM is good, but userspace should be able to say how
> the unspecified parts are implemented.  Trapping to userspace is the
> simplest option.  (And sufficient for ecalls that are not a hot path.)
>

For the unspecified parts, we have KVM exits at appropriate places
e.g. SBI system reset, SBI system suspend, etc.

Regards,
Anup
